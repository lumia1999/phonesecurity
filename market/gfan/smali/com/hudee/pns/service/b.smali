.class public abstract Lcom/hudee/pns/service/b;
.super Ljava/lang/Object;


# static fields
.field static a:Ljava/util/concurrent/ScheduledExecutorService;

.field static b:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    invoke-static {}, Lcom/hudee/pns/service/b;->b()V

    invoke-static {}, Lcom/hudee/pns/service/b;->c()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized a()V
    .locals 2

    const-class v0, Lcom/hudee/pns/service/b;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/hudee/pns/service/b;->a:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/hudee/pns/service/b;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    const/4 v1, 0x0

    sput-object v1, Lcom/hudee/pns/service/b;->a:Ljava/util/concurrent/ScheduledExecutorService;

    :cond_0
    sget-object v1, Lcom/hudee/pns/service/b;->b:Ljava/util/concurrent/ExecutorService;

    if-eqz v1, :cond_1

    sget-object v1, Lcom/hudee/pns/service/b;->b:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    const/4 v1, 0x0

    sput-object v1, Lcom/hudee/pns/service/b;->b:Ljava/util/concurrent/ExecutorService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized a(Ljava/lang/Runnable;)V
    .locals 2

    const-class v0, Lcom/hudee/pns/service/b;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/hudee/pns/service/b;->a:Ljava/util/concurrent/ScheduledExecutorService;

    if-nez v1, :cond_0

    invoke-static {}, Lcom/hudee/pns/service/b;->b()V

    :cond_0
    sget-object v1, Lcom/hudee/pns/service/b;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v1, p0}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized a(Ljava/lang/Runnable;J)V
    .locals 3

    const-class v0, Lcom/hudee/pns/service/b;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/hudee/pns/service/b;->a:Ljava/util/concurrent/ScheduledExecutorService;

    if-nez v1, :cond_0

    invoke-static {}, Lcom/hudee/pns/service/b;->b()V

    :cond_0
    sget-object v1, Lcom/hudee/pns/service/b;->a:Ljava/util/concurrent/ScheduledExecutorService;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, p0, p1, p2, v2}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private static declared-synchronized b()V
    .locals 2

    const-class v0, Lcom/hudee/pns/service/b;

    monitor-enter v0

    :try_start_0
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    sput-object v1, Lcom/hudee/pns/service/b;->a:Ljava/util/concurrent/ScheduledExecutorService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized b(Ljava/lang/Runnable;)V
    .locals 2

    const-class v0, Lcom/hudee/pns/service/b;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/hudee/pns/service/b;->b:Ljava/util/concurrent/ExecutorService;

    if-nez v1, :cond_0

    invoke-static {}, Lcom/hudee/pns/service/b;->c()V

    :cond_0
    sget-object v1, Lcom/hudee/pns/service/b;->b:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, p0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private static declared-synchronized c()V
    .locals 2

    const-class v0, Lcom/hudee/pns/service/b;

    monitor-enter v0

    :try_start_0
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    sput-object v1, Lcom/hudee/pns/service/b;->b:Ljava/util/concurrent/ExecutorService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
