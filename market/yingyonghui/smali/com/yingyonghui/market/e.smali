.class final Lcom/yingyonghui/market/e;
.super Landroid/content/BroadcastReceiver;
.source "ActivityListAppDownload.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityListAppDownload;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityListAppDownload;)V
    .locals 0
    .parameter

    .prologue
    .line 245
    iput-object p1, p0, Lcom/yingyonghui/market/e;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 248
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "download_complete"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 249
    iget-object v0, p0, Lcom/yingyonghui/market/e;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->g(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/ar;

    .line 250
    iget-object v0, p0, Lcom/yingyonghui/market/e;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Lcom/yingyonghui/market/ActivityListAppDownload;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 251
    iget-object v0, p0, Lcom/yingyonghui/market/e;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppDownload;->p:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 252
    iget-object v0, p0, Lcom/yingyonghui/market/e;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->d()V

    .line 255
    :cond_0
    return-void
.end method
