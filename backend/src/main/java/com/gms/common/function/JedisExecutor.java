package com.gms.common.function;

import com.gms.common.exception.RedisConnectException;

@FunctionalInterface
public interface JedisExecutor<T, R> {
    R execute(T t) throws RedisConnectException;
}
