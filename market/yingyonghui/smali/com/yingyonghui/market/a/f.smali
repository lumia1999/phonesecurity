.class final Lcom/yingyonghui/market/a/f;
.super Landroid/os/HandlerThread;
.source "HttpManager.java"


# instance fields
.field final synthetic a:Lcom/yingyonghui/market/a/k;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/a/k;)V
    .locals 1
    .parameter

    .prologue
    .line 299
    iput-object p1, p0, Lcom/yingyonghui/market/a/f;->a:Lcom/yingyonghui/market/a/k;

    .line 300
    const-string v0, "dispatcher"

    invoke-direct {p0, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 301
    return-void
.end method
