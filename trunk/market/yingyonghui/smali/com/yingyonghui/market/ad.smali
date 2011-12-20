.class final Lcom/yingyonghui/market/ad;
.super Landroid/os/AsyncTask;
.source "ActivityListAppDownload.java"


# instance fields
.field private synthetic a:Landroid/view/View;

.field private synthetic b:Lcom/yingyonghui/market/model/l;

.field private synthetic c:Lcom/yingyonghui/market/ba;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ba;Landroid/view/View;Lcom/yingyonghui/market/model/l;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 601
    iput-object p1, p0, Lcom/yingyonghui/market/ad;->c:Lcom/yingyonghui/market/ba;

    iput-object p2, p0, Lcom/yingyonghui/market/ad;->a:Landroid/view/View;

    iput-object p3, p0, Lcom/yingyonghui/market/ad;->b:Lcom/yingyonghui/market/model/l;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected final bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9
    .parameter

    .prologue
    .line 601
    iget-object v0, p0, Lcom/yingyonghui/market/ad;->c:Lcom/yingyonghui/market/ba;

    iget-object v0, v0, Lcom/yingyonghui/market/ba;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/util/GlobalUtil;->e(Landroid/content/Context;)Ljava/lang/String;

    const-string v0, "download"

    iget-object v1, p0, Lcom/yingyonghui/market/ad;->a:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/ad;->b:Lcom/yingyonghui/market/model/l;

    iget-object v2, v2, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/yingyonghui/market/provider/k;->a(Landroid/content/Context;Ljava/lang/String;)Lcom/yingyonghui/market/provider/m;

    move-result-object v1

    sget-object v2, Lcom/yingyonghui/market/provider/m;->f:Lcom/yingyonghui/market/provider/m;

    if-ne v1, v2, :cond_0

    const-string v0, "update"

    move-object v7, v0

    :goto_0
    iget-object v0, p0, Lcom/yingyonghui/market/ad;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/yingyonghui/market/downloader/n;->a(Landroid/content/Context;)Lcom/yingyonghui/market/downloader/n;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ad;->b:Lcom/yingyonghui/market/model/l;

    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->g:Ljava/lang/String;

    iget-object v2, p0, Lcom/yingyonghui/market/ad;->b:Lcom/yingyonghui/market/model/l;

    iget-object v2, v2, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    iget-object v3, p0, Lcom/yingyonghui/market/ad;->b:Lcom/yingyonghui/market/model/l;

    iget-object v3, v3, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    iget-object v4, p0, Lcom/yingyonghui/market/ad;->b:Lcom/yingyonghui/market/model/l;

    iget v4, v4, Lcom/yingyonghui/market/model/l;->o:I

    int-to-long v4, v4

    iget-object v6, p0, Lcom/yingyonghui/market/ad;->b:Lcom/yingyonghui/market/model/l;

    iget-object v6, v6, Lcom/yingyonghui/market/model/l;->F:Ljava/lang/String;

    iget-object v8, p0, Lcom/yingyonghui/market/ad;->b:Lcom/yingyonghui/market/model/l;

    iget-object v8, v8, Lcom/yingyonghui/market/model/l;->f:Ljava/lang/String;

    invoke-virtual/range {v0 .. v8}, Lcom/yingyonghui/market/downloader/n;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0

    :cond_0
    move-object v7, v0

    goto :goto_0
.end method
