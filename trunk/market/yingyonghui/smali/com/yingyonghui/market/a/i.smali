.class final Lcom/yingyonghui/market/a/i;
.super Landroid/os/Handler;
.source "HttpManager.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/a/b;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/a/b;Landroid/os/Looper;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 100
    iput-object p1, p0, Lcom/yingyonghui/market/a/i;->a:Lcom/yingyonghui/market/a/b;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 3
    .parameter

    .prologue
    .line 104
    if-eqz p1, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 106
    :try_start_0
    iget-object v1, p0, Lcom/yingyonghui/market/a/i;->a:Lcom/yingyonghui/market/a/b;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/yingyonghui/market/a/a;

    invoke-static {v1, v0}, Lcom/yingyonghui/market/a/b;->a(Lcom/yingyonghui/market/a/b;Lcom/yingyonghui/market/a/a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/a/i;->a:Lcom/yingyonghui/market/a/b;

    iget-object v0, v0, Lcom/yingyonghui/market/a/b;->a:Lcom/yingyonghui/market/a/k;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/yingyonghui/market/a/i;->a:Lcom/yingyonghui/market/a/b;

    invoke-static {v2}, Lcom/yingyonghui/market/a/b;->a(Lcom/yingyonghui/market/a/b;)I

    move-result v2

    shl-int/2addr v1, v2

    xor-int/lit8 v1, v1, -0x1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/a/k;->a(Lcom/yingyonghui/market/a/k;I)I

    .line 116
    :goto_0
    return-void

    .line 107
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
