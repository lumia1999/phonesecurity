.class public final Lcom/yingyonghui/market/dv;
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
    .line 408
    iput-object p1, p0, Lcom/yingyonghui/market/dv;->b:Lcom/yingyonghui/market/AbsActivityAppListManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 409
    iput-object p2, p0, Lcom/yingyonghui/market/dv;->a:Lcom/yingyonghui/market/ch;

    .line 410
    return-void
.end method


# virtual methods
.method protected final bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .parameter

    .prologue
    const/4 v4, 0x0

    .line 405
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

    check-cast v0, Landroid/content/pm/ApplicationInfo;

    iget-object v1, p0, Lcom/yingyonghui/market/dv;->b:Lcom/yingyonghui/market/AbsActivityAppListManager;

    iget-object v1, v1, Lcom/yingyonghui/market/AbsActivityAppListManager;->q:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yingyonghui/market/model/l;

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/yingyonghui/market/dv;->b:Lcom/yingyonghui/market/AbsActivityAppListManager;

    invoke-static {v1, v0}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;)Lcom/yingyonghui/market/model/l;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/yingyonghui/market/model/l;

    aput-object v0, v1, v4

    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/dv;->publishProgress([Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method protected final bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 2
    .parameter

    .prologue
    .line 405
    iget-object v0, p0, Lcom/yingyonghui/market/dv;->a:Lcom/yingyonghui/market/ch;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/dv;->b:Lcom/yingyonghui/market/AbsActivityAppListManager;

    iget-object v1, p0, Lcom/yingyonghui/market/dv;->a:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/AbsActivityAppListManager;->b(Landroid/widget/ArrayAdapter;)V

    iget-object v0, p0, Lcom/yingyonghui/market/dv;->a:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    iget-object v0, p0, Lcom/yingyonghui/market/dv;->a:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->a()V

    :cond_0
    return-void
.end method

.method protected final bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 3
    .parameter

    .prologue
    const/4 v2, 0x0

    .line 405
    check-cast p1, [Lcom/yingyonghui/market/model/l;

    aget-object v0, p1, v2

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/dv;->b:Lcom/yingyonghui/market/AbsActivityAppListManager;

    iget-object v0, v0, Lcom/yingyonghui/market/AbsActivityAppListManager;->q:Ljava/util/concurrent/ConcurrentHashMap;

    aget-object v1, p1, v2

    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    aget-object v2, p1, v2

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/dv;->a:Lcom/yingyonghui/market/ch;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/yingyonghui/market/dv;->a:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    :cond_1
    return-void
.end method
