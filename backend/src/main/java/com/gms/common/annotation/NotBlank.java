package com.gms.common.annotation;


import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.CONSTRUCTOR;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.PARAMETER;
import static java.lang.annotation.ElementType.TYPE_USE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Repeatable;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;
import com.gms.common.annotation.NotBlank.List;
import com.gms.common.validator.NotBlankValidator;

@Documented
@Constraint(validatedBy = { NotBlankValidator.class})
@Target({ METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER, TYPE_USE })
@Retention(RUNTIME)
@Repeatable(List.class)
/**
 * The annotated element must not be {@code null} and must contain at least one
 * non-whitespace character. Accepts {@code CharSequence}.
 *
 * @author Hardy Ferentschik
 * @since 2.0
 *
 * @see Character#isWhitespace(char)
 */
public @interface NotBlank {

    String message() default "{com.gms.common.annotation.NotBlank.message}";

    Class<?>[] groups() default { };

    Class<? extends Payload>[] payload() default { };

    /**
     * Defines several {@code @NotBlank} constraints on the same element.
     *
     * @see NotBlank
     */
    @Target({ METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER, TYPE_USE })
    @Retention(RUNTIME)
    @Documented
    @interface List {
        NotBlank[] value();
    }
}