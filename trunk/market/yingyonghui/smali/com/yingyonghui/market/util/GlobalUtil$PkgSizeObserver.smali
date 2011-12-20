.class final Lcom/yingyonghui/market/util/GlobalUtil$PkgSizeObserver;
.super Landroid/content/pm/IPackageStatsObserver$Stub;
.source "GlobalUtil.java"


# instance fields
.field private a:Ljava/util/concurrent/CountDownLatch;

.field private b:Lcom/yingyonghui/market/model/l;


# virtual methods
.method public final onGetStatsCompleted(Landroid/content/pm/PackageStats;Z)V
    .locals 4
    .parameter
    .parameter

    .prologue
    .line 851
    iget-object v0, p0, Lcom/yingyonghui/market/util/GlobalUtil$PkgSizeObserver;->b:Lcom/yingyonghui/market/model/l;

    if-eqz v0, :cond_0

    .line 852
    iget-object v0, p0, Lcom/yingyonghui/market/util/GlobalUtil$PkgSizeObserver;->b:Lcom/yingyonghui/market/model/l;

    monitor-enter v0

    .line 853
    :try_start_0
    iget-object v1, p0, Lcom/yingyonghui/market/util/GlobalUtil$PkgSizeObserver;->b:Lcom/yingyonghui/market/model/l;

    iget-wide v2, p1, Landroid/content/pm/PackageStats;->codeSize:J

    long-to-int v2, v2

    iput v2, v1, Lcom/yingyonghui/market/model/l;->o:I

    .line 856
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 858
    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/util/GlobalUtil$PkgSizeObserver;->a:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 859
    return-void

    .line 856
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
