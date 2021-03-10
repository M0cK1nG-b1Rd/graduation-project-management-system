package com.gms.common.handler;

import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.LimitAccessException;
import com.gms.common.exception.code.Code;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.server.NotAcceptableStatusException;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.Path;
import java.util.List;
import java.util.Set;

/**
 * @author wx
 */
@Slf4j
@RestControllerAdvice
@Order(value = Ordered.HIGHEST_PRECEDENCE)
public class GlobalExceptionHandler {

    @ExceptionHandler({GmsException.class,Exception.class})
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public GmsResponse handleException(Exception e) {
        log.error("系统内部异常，异常信息：", e);
        String message=e instanceof GmsException?e.getMessage(): Code.C500.getDesc();
        return new GmsResponse().addCodeMessage(new Meta(Code.C500.getCode(),ResponseStat.ERROR.getText(),message));

    }
    @ExceptionHandler(value = HttpRequestMethodNotSupportedException.class)
    @ResponseStatus(HttpStatus.METHOD_NOT_ALLOWED)
    public GmsResponse handleHttpRequestMethodNotSupportedException(Exception e) {
        log.error("HTTP请求方式不被支持：", e);
        return new GmsResponse().addCodeMessage(new Meta(Code.C405.getCode(),ResponseStat.ERROR.getText(),Code.C405.getDesc()));
    }

    @ExceptionHandler(value = NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public GmsResponse handleNoHandlerFoundException(Exception e) {
        log.error("HTTP请求内容未找到：", e);
        return new GmsResponse().addCodeMessage(new Meta(Code.C404.getCode(),ResponseStat.ERROR.getText(),Code.C404.getDesc()));
    }


    /**
     * 统一处理请求参数校验(实体对象传参,form data方式,request body方式)
     *
     * @param e BindException,MethodArgumentNotValidException,HttpMessageNotReadableException,ConstraintViolationException
     * @return GmsResponse
     */
    @ExceptionHandler({BindException.class,MethodArgumentNotValidException.class,HttpMessageNotReadableException.class,ConstraintViolationException.class})
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public GmsResponse validExceptionHandler(Exception e) {
        StringBuilder message = new StringBuilder();
        if(e instanceof BindException|| e instanceof MethodArgumentNotValidException){
            List<FieldError> fieldErrors = e instanceof BindException?((BindException)e).getBindingResult().getFieldErrors():((MethodArgumentNotValidException)e).getBindingResult().getFieldErrors();
            for (FieldError error : fieldErrors) {
                message.append(error.getField()).append(error.getDefaultMessage()).append(StringPool.COMMA);
            }
            message = new StringBuilder(message.substring(0, message.length() - 1));
        }else if(e instanceof HttpMessageNotReadableException){
            message = new StringBuilder(e.getMessage().substring(0, e.getMessage().indexOf(StringPool.COLON)));
        }else if(e instanceof ConstraintViolationException){
            Set<ConstraintViolation<?>> violations = ((ConstraintViolationException)e).getConstraintViolations();
            for (ConstraintViolation<?> violation : violations) {
                Path path = violation.getPropertyPath();
                String[] pathArr = StringUtils.splitByWholeSeparatorPreserveAllTokens(path.toString(), StringPool.DOT);
                message.append(pathArr[1]).append(violation.getMessage()).append(StringPool.COMMA);
            }
            message = new StringBuilder(message.substring(0, message.length() - 1));
        }else{
            message.append(e.getMessage());
        }
        return new GmsResponse().addCodeMessage(new Meta(Code.C400.getCode(),ResponseStat.ERROR.getText(),message.toString()));

    }

    @ExceptionHandler(value = LimitAccessException.class)
    @ResponseStatus(HttpStatus.TOO_MANY_REQUESTS)
    public GmsResponse handleLimitAccessException(LimitAccessException e) {
        log.warn(e.getMessage());
        return new GmsResponse().addCodeMessage(new Meta(Code.C429.getCode(),ResponseStat.ERROR.getText(),e.getMessage()));
    }
    @ExceptionHandler(value = HttpMediaTypeNotSupportedException.class)
    @ResponseStatus(HttpStatus.UNSUPPORTED_MEDIA_TYPE)
    public GmsResponse handleHttpMediaTypeNotSupportedException(Exception e) {
        log.warn(e.getMessage());
        return new GmsResponse().addCodeMessage(new Meta(Code.C415.getCode(),ResponseStat.ERROR.getText(),Code.C415.getDesc()));
    }

    @ExceptionHandler({NotAcceptableStatusException.class, HttpMediaTypeNotAcceptableException.class})
    @ResponseStatus(HttpStatus.NOT_ACCEPTABLE)
    public GmsResponse handleNotAcceptableException(Exception e) {
        log.warn(e.getMessage());
        return new GmsResponse().addCodeMessage(new Meta(Code.C406.getCode(),ResponseStat.ERROR.getText(),Code.C406.getDesc()));
    }

    @ExceptionHandler(value = UnauthorizedException.class)
    @ResponseStatus(HttpStatus.FORBIDDEN)
    public GmsResponse handleUnauthorizedException(Exception e) {
        log.error("权限不足，{}", e.getMessage());
        return new GmsResponse().addCodeMessage(new Meta(Code.C401.getCode(),ResponseStat.ERROR.getText(),Code.C401.getDesc()));
    }
}
