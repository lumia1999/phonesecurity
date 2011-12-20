.class final Lcom/yingyonghui/market/af;
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
    .line 588
    iput-object p1, p0, Lcom/yingyonghui/market/af;->c:Lcom/yingyonghui/market/ba;

    iput-object p2, p0, Lcom/yingyonghui/market/af;->a:Landroid/view/View;

    iput-object p3, p0, Lcom/yingyonghui/market/af;->b:Lcom/yingyonghui/market/model/l;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected final bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .parameter

    .prologue
    .line 588
    iget-object v0, p0, Lcom/yingyonghui/market/af;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/yingyonghui/market/downloader/n;->a(Landroid/content/Context;)Lcom/yingyonghui/market/downloader/n;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/af;->b:Lcom/yingyonghui/market/model/l;

    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/downloader/n;->a(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method
