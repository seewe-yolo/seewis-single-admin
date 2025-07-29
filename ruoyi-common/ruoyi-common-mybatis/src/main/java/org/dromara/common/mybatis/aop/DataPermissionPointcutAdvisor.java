package org.dromara.common.mybatis.aop;

import org.aopalliance.aop.Advice;
import org.dromara.common.mybatis.annotation.DataPermission;
import org.springframework.aop.Pointcut;
import org.springframework.aop.support.AbstractPointcutAdvisor;
import org.springframework.aop.support.ComposablePointcut;
import org.springframework.aop.support.annotation.AnnotationMatchingPointcut;

/**
 * 数据权限注解切面定义
 *
 * @author 秋辞未寒
 */
@SuppressWarnings("all")
public class DataPermissionPointcutAdvisor extends AbstractPointcutAdvisor {

    private final Advice advice;
    private final Pointcut pointcut;

    public DataPermissionPointcutAdvisor() {
        this.advice = new DataPermissionAdvice();
        AnnotationMatchingPointcut matchingPointcut = new AnnotationMatchingPointcut(DataPermission.class, true);
        DataPermissionDynamicMethodMatcher matcher = new DataPermissionDynamicMethodMatcher();
        this.pointcut =  new ComposablePointcut(matcher).union(matchingPointcut);
    }

    @Override
    public Pointcut getPointcut() {
        return this.pointcut;
    }

    @Override
    public Advice getAdvice() {
        return this.advice;
    }

}
