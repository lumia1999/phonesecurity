.class public final Lcom/yingyonghui/market/cw;
.super Landroid/os/AsyncTask;
.source "AbsActivityAppListManager.java"


# instance fields
.field private a:Lcom/yingyonghui/market/ch;

.field private synthetic b:Lcom/yingyonghui/market/AbsActivityAppListManager;


# direct methods
.method protected constructor <init>(Lcom/yingyonghui/market/AbsActivityAppListManager;Lcom/yingyonghui/market/ch;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 452
    iput-object p1, p0, Lcom/yingyonghui/market/cw;->b:Lcom/yingyonghui/market/AbsActivityAppListManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 453
    iput-object p2, p0, Lcom/yingyonghui/market/cw;->a:Lcom/yingyonghui/market/ch;

    .line 454
    return-void
.end method


# virtual methods
.method protected final bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .parameter

    .prologue
    const/4 v4, 0x0

    .line 449
    check-cast p1, [Ljava/util/ArrayList;

    aget-object v0, p1, v4

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    iget-object v1, p0, Lcom/yingyonghui/market/cw;->b:Lcom/yingyonghui/market/AbsActivityAppListManager;

    iget-object v1, v1, Lcom/yingyonghui/market/AbsActivityAppListManager;->q:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yingyonghui/market/model/l;

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/yingyonghui/market/cw;->b:Lcom/yingyonghui/market/AbsActivityAppListManager;

    invoke-virtual {v1}, Lcom/yingyonghui/market/AbsActivityAppListManager;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/pm/PackageManager;Ljava/io/File;)Lcom/yingyonghui/market/model/l;

    move-result-object v1

    new-instance v3, Lcom/yingyonghui/market/bo;

    invoke-direct {v3}, Lcom/yingyonghui/market/bo;-><init>()V

    iput-object v0, v3, Lcom/yingyonghui/market/bo;->a:Ljava/io/File;

    iput-object v1, v3, Lcom/yingyonghui/market/bo;->b:Lcom/yingyonghui/market/model/l;

    const/4 v0, 0x1

    new-array v0, v0, [Lcom/yingyonghui/market/bo;

    aput-object v3, v0, v4

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/cw;->publishProgress([Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method protected final bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 2
    .parameter

    .prologue
    .line 449
    iget-object v0, p0, Lcom/yingyonghui/market/cw;->a:Lcom/yingyonghui/market/ch;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/cw;->b:Lcom/yingyonghui/market/AbsActivityAppListManager;

    iget-object v1, p0, Lcom/yingyonghui/market/cw;->a:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/AbsActivityAppListManager;->b(Landroid/widget/ArrayAdapter;)V

    iget-object v0, p0, Lcom/yingyonghui/market/cw;->a:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    iget-object v0, p0, Lcom/yingyonghui/market/cw;->a:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->a()V

    :cond_0
    return-void
.end method

.method protected final bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 3
    .parameter

    .prologue
    const/4 v2, 0x0

    .line 449
    check-cast p1, [Lcom/yingyonghui/market/bo;

    aget-object v0, p1, v2

    iget-object v0, v0, Lcom/yingyonghui/market/bo;->b:Lcom/yingyonghui/market/model/l;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/cw;->b:Lcom/yingyonghui/market/AbsActivityAppListManager;

    iget-object v0, v0, Lcom/yingyonghui/market/AbsActivityAppListManager;->q:Ljava/util/concurrent/ConcurrentHashMap;

    aget-object v1, p1, v2

    iget-object v1, v1, Lcom/yingyonghui/market/bo;->a:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    aget-object v2, p1, v2

    iget-object v2, v2, Lcom/yingyonghui/market/bo;->b:Lcom/yingyonghui/market/model/l;

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/cw;->a:Lcom/yingyonghui/market/ch;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/yingyonghui/market/cw;->a:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    :cond_1
    return-void
.end method
