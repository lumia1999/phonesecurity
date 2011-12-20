.class final Lcom/yingyonghui/market/b;
.super Landroid/os/AsyncTask;
.source "ActivityListAppDownload.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/a;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/a;)V
    .locals 0
    .parameter

    .prologue
    .line 728
    iput-object p1, p0, Lcom/yingyonghui/market/b;->a:Lcom/yingyonghui/market/a;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected final bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .parameter

    .prologue
    .line 728
    iget-object v0, p0, Lcom/yingyonghui/market/b;->a:Lcom/yingyonghui/market/a;

    iget-object v0, v0, Lcom/yingyonghui/market/a;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method protected final bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 2
    .parameter

    .prologue
    .line 728
    iget-object v0, p0, Lcom/yingyonghui/market/b;->a:Lcom/yingyonghui/market/a;

    iget-object v0, v0, Lcom/yingyonghui/market/a;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    const v1, 0x7f090151

    invoke-static {v0, v1}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    iget-object v0, p0, Lcom/yingyonghui/market/b;->a:Lcom/yingyonghui/market/a;

    iget-object v0, v0, Lcom/yingyonghui/market/a;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->j(Lcom/yingyonghui/market/ActivityListAppDownload;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method
