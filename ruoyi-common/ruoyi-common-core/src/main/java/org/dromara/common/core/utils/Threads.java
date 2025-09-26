package org.dromara.common.core.utils;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.concurrent.*;

/**
 * 线程相关工具类.
 *
 * @author ruoyi
 */
@Slf4j
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class Threads {

    /**
     * 停止线程池
     * 先使用shutdown, 停止接收新任务并尝试完成所有已存在任务.
     * 如果超时, 则调用shutdownNow, 取消在workQueue中Pending的任务,并中断所有阻塞函数.
     * 如果仍然超時，則強制退出.
     * 另对在shutdown时线程本身被调用中断做了处理.
     */
    public static void shutdownAndAwaitTermination(ExecutorService pool) {
        if (pool != null && !pool.isShutdown()) {
            pool.shutdown();
            try {
                if (!pool.awaitTermination(120, TimeUnit.SECONDS)) {
                    pool.shutdownNow();
                    if (!pool.awaitTermination(120, TimeUnit.SECONDS)) {
                        log.info("Pool did not terminate");
                    }
                }
            } catch (InterruptedException ie) {
                pool.shutdownNow();
                Thread.currentThread().interrupt();
            }
        }
    }

    /**
     * 打印线程异常信息
     */
    public static void printException(Runnable r, Throwable t) {
        if (t == null && r instanceof Future<?>) {
            try {
                Future<?> future = (Future<?>) r;
                if (future.isDone()) {
                    future.get();
                }
            } catch (CancellationException ce) {
                t = ce;
            } catch (ExecutionException ee) {
                t = ee.getCause();
            } catch (InterruptedException ie) {
                Thread.currentThread().interrupt();
            }
        }
        if (t != null) {
            log.error(t.getMessage(), t);
        }
    }

    /**
     * 获取异常的根因（递归查找）
     *
     * @param e 当前异常
     * @return 根因异常（最底层的 cause）
     * <p>
     * 逻辑说明：
     * 1. 如果 e 没有 cause，说明 e 本身就是根因，直接返回
     * 2. 如果 e 的 cause 和自身相同（防止循环引用），也返回 e
     * 3. 否则递归调用，继续向下寻找最底层的 cause
     */
    public static Throwable getRootCause(Throwable e) {
        Throwable cause = e.getCause();
        if (cause == null || cause == e) {
            return e;
        }
        return getRootCause(cause);
    }

    /**
     * 在异常链中查找指定类型的异常
     *
     * @param e     当前异常
     * @param clazz 目标异常类
     * @return 找到的指定类型异常，如果没有找到返回 null
     */
    public static Throwable findCause(Throwable e, Class<? extends Throwable> clazz) {
        Throwable t = e;
        while (t != null && t != t.getCause()) {
            if (clazz.isInstance(t)) {
                return t;
            }
            t = t.getCause();
        }
        return null;
    }

}
