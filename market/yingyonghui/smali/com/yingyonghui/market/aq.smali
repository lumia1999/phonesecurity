.class final Lcom/yingyonghui/market/aq;
.super Landroid/database/ContentObserver;
.source "ActivityListAppDownload.java"


# instance fields
.field private final a:Landroid/content/Context;

.field private synthetic b:Lcom/yingyonghui/market/ActivityListAppDownload;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/ActivityListAppDownload;Landroid/content/Context;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 478
    iput-object p1, p0, Lcom/yingyonghui/market/aq;->b:Lcom/yingyonghui/market/ActivityListAppDownload;

    .line 479
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 480
    iput-object p2, p0, Lcom/yingyonghui/market/aq;->a:Landroid/content/Context;

    .line 481
    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/aq;)V
    .locals 1
    .parameter

    .prologue
    .line 457
    iget-object v0, p0, Lcom/yingyonghui/market/aq;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    return-void
.end method


# virtual methods
.method public final onChange(Z)V
    .locals 5
    .parameter

    .prologue
    .line 467
    iget-object v0, p0, Lcom/yingyonghui/market/aq;->b:Lcom/yingyonghui/market/ActivityListAppDownload;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppDownload;->p:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 468
    iget-object v0, p0, Lcom/yingyonghui/market/aq;->b:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->j(Lcom/yingyonghui/market/ActivityListAppDownload;)Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 469
    iget-object v0, p0, Lcom/yingyonghui/market/aq;->b:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->j(Lcom/yingyonghui/market/ActivityListAppDownload;)Landroid/os/Handler;

    move-result-object v0

    monitor-enter v0

    .line 470
    :try_start_0
    iget-object v1, p0, Lcom/yingyonghui/market/aq;->b:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->j(Lcom/yingyonghui/market/ActivityListAppDownload;)Landroid/os/Handler;

    move-result-object v1

    const/16 v2, 0x66

    invoke-virtual {v1, v2}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 471
    iget-object v1, p0, Lcom/yingyonghui/market/aq;->b:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->j(Lcom/yingyonghui/market/ActivityListAppDownload;)Landroid/os/Handler;

    move-result-object v1

    const/16 v2, 0x66

    const-wide/16 v3, 0x3e8

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 473
    :cond_0
    monitor-exit v0

    .line 476
    :cond_1
    return-void

    .line 473
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
