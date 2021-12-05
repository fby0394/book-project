package com.aaa.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * 数据库操作 增删改异常处理
 * 
 * @author 范博源
 * 
 */
//设置切面优先级
@Order(1)
@Aspect
@Component
public class QueryAspect {

	@Around("execution(public boolean com.aaa.service.*.*(..))")
	public Object around(ProceedingJoinPoint pjp) {
		Object obj = true;
		try {
			obj = pjp.proceed();
		} catch (Exception e){
			e.printStackTrace();
			obj = false;
		}
		catch (Throwable e) {
			e.printStackTrace();
			obj = false;
		}

		return obj;
	}

	
}
