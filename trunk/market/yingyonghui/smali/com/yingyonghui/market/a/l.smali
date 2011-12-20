.class final Lcom/yingyonghui/market/a/l;
.super Landroid/os/Handler;
.source "HttpManager.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/a/f;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/a/f;Landroid/os/Looper;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 304
    iput-object p1, p0, Lcom/yingyonghui/market/a/l;->a:Lcom/yingyonghui/market/a/f;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 6
    .parameter

    .prologue
    const/4 v5, 0x1

    const/4 v3, 0x0

    .line 306
    iget-object v0, p0, Lcom/yingyonghui/market/a/l;->a:Lcom/yingyonghui/market/a/f;

    iget v1, p1, Landroid/os/Message;->what:I

    const/16 v2, 0x4d2

    if-ne v1, v2, :cond_0

    iget-object v1, v0, Lcom/yingyonghui/market/a/f;->a:Lcom/yingyonghui/market/a/k;

    invoke-static {v1}, Lcom/yingyonghui/market/a/k;->d(Lcom/yingyonghui/market/a/k;)Ljava/lang/Integer;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    iget-object v0, v0, Lcom/yingyonghui/market/a/f;->a:Lcom/yingyonghui/market/a/k;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/yingyonghui/market/a/k;->a(Lcom/yingyonghui/market/a/k;Ljava/lang/Integer;)Ljava/lang/Integer;

    monitor-exit v1

    .line 307
    :goto_0
    return-void

    .line 306
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_0
    iget-object v1, v0, Lcom/yingyonghui/market/a/f;->a:Lcom/yingyonghui/market/a/k;

    invoke-static {v1}, Lcom/yingyonghui/market/a/k;->f(Lcom/yingyonghui/market/a/k;)I

    move-result v1

    const/16 v2, 0x3f

    if-eq v1, v2, :cond_3

    const/4 v1, -0x1

    move v2, v3

    :goto_1
    const/4 v3, 0x6

    if-ge v2, v3, :cond_1

    iget-object v3, v0, Lcom/yingyonghui/market/a/f;->a:Lcom/yingyonghui/market/a/k;

    invoke-static {v3}, Lcom/yingyonghui/market/a/k;->f(Lcom/yingyonghui/market/a/k;)I

    move-result v3

    shl-int v4, v5, v2

    and-int/2addr v3, v4

    if-nez v3, :cond_2

    move v1, v2

    :cond_1
    iget-object v2, v0, Lcom/yingyonghui/market/a/f;->a:Lcom/yingyonghui/market/a/k;

    shl-int v3, v5, v1

    invoke-static {v2, v3}, Lcom/yingyonghui/market/a/k;->b(Lcom/yingyonghui/market/a/k;I)I

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v2

    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput-object v3, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v0, v0, Lcom/yingyonghui/market/a/f;->a:Lcom/yingyonghui/market/a/k;

    invoke-static {v0}, Lcom/yingyonghui/market/a/k;->b(Lcom/yingyonghui/market/a/k;)[Landroid/os/Handler;

    move-result-object v0

    aget-object v0, v0, v1

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_3
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput-object v2, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v0, v0, Lcom/yingyonghui/market/a/f;->a:Lcom/yingyonghui/market/a/k;

    invoke-static {v0}, Lcom/yingyonghui/market/a/k;->g(Lcom/yingyonghui/market/a/k;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0
.end method
