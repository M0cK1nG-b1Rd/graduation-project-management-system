package com.gms.common.exception;

/**
 * FEBS 系统内部异常
 */
public class GmsException extends Exception {

    private static final long serialVersionUID = -994962710559017255L;

    public GmsException(String message) {
        super(message);
    }
}
