.class final Lcom/yingyonghui/market/bj;
.super Landroid/os/AsyncTask;
.source "AdapterListApp.java"


# instance fields
.field a:Lcom/yingyonghui/market/model/l;

.field final synthetic b:Lcom/yingyonghui/market/bc;

.field private c:Z

.field private d:Z


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/bc;)V
    .locals 1
    .parameter

    .prologue
    const/4 v0, 0x0

    .line 422
    iput-object p1, p0, Lcom/yingyonghui/market/bj;->b:Lcom/yingyonghui/market/bc;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 423
    iput-boolean v0, p0, Lcom/yingyonghui/market/bj;->c:Z

    .line 424
    iput-boolean v0, p0, Lcom/yingyonghui/market/bj;->d:Z

    return-void
.end method

.method private varargs a([Lcom/yingyonghui/market/model/l;)Ljava/lang/Void;
    .locals 4
    .parameter

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 429
    aget-object v0, p1, v3

    iput-object v0, p0, Lcom/yingyonghui/market/bj;->a:Lcom/yingyonghui/market/model/l;

    .line 430
    iget-object v0, p0, Lcom/yingyonghui/market/bj;->b:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/bj;->a:Lcom/yingyonghui/market/model/l;

    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 431
    if-eqz v0, :cond_0

    iget-object v1, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v1, :cond_0

    .line 432
    iget-object v1, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v2, :cond_1

    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lcom/yingyonghui/market/bj;->d:Z

    .line 433
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 435
    :try_start_0
    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-static {v0}, Lcom/yingyonghui/market/util/e;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 436
    iget-object v1, p0, Lcom/yingyonghui/market/bj;->a:Lcom/yingyonghui/market/model/l;

    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->C:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 437
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/yingyonghui/market/bj;->c:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 444
    :cond_0
    :goto_1
    const/4 v0, 0x0

    return-object v0

    :cond_1
    move v1, v3

    .line 432
    goto :goto_0

    .line 439
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method


# virtual methods
.method protected final bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 422
    check-cast p1, [Lcom/yingyonghui/market/model/l;

    invoke-direct {p0, p1}, Lcom/yingyonghui/market/bj;->a([Lcom/yingyonghui/market/model/l;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected final bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 9
    .parameter

    .prologue
    const/4 v8, 0x0

    const v7, 0x7f090079

    const/16 v6, 0x8

    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 422
    iget-boolean v0, p0, Lcom/yingyonghui/market/bj;->c:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/yingyonghui/market/bj;->b:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->getParent()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lcom/yingyonghui/market/eo;

    iget-object v0, p0, Lcom/yingyonghui/market/bj;->b:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/yingyonghui/market/eo;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/yingyonghui/market/bj;->b:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    const v2, 0x7f090136

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/yingyonghui/market/eo;->setTitle(Ljava/lang/CharSequence;)V

    iget-boolean v0, p0, Lcom/yingyonghui/market/bj;->d:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/yingyonghui/market/bj;->b:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    const v2, 0x7f090144

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/yingyonghui/market/bj;->a:Lcom/yingyonghui/market/model/l;

    iget-object v4, v4, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/yingyonghui/market/eo;->a(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v7, v8}, Lcom/yingyonghui/market/eo;->a(ILcom/yingyonghui/market/bs;)Lcom/yingyonghui/market/eo;

    invoke-virtual {v1}, Lcom/yingyonghui/market/eo;->show()V

    invoke-virtual {v1}, Lcom/yingyonghui/market/eo;->e()Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {v1}, Lcom/yingyonghui/market/eo;->f()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/yingyonghui/market/bj;->a:Lcom/yingyonghui/market/model/l;

    iput-boolean v5, v0, Lcom/yingyonghui/market/model/l;->N:Z

    iget-object v0, p0, Lcom/yingyonghui/market/bj;->b:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->d(Lcom/yingyonghui/market/bc;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x64

    const-wide/16 v2, 0x4b0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void

    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/bj;->b:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    const v2, 0x7f090109

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/yingyonghui/market/bj;->a:Lcom/yingyonghui/market/model/l;

    iget-object v4, v4, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/yingyonghui/market/eo;->a(Ljava/lang/CharSequence;)V

    new-instance v0, Lcom/yingyonghui/market/ea;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/ea;-><init>(Lcom/yingyonghui/market/bj;)V

    invoke-virtual {v1, v7, v0}, Lcom/yingyonghui/market/eo;->a(ILcom/yingyonghui/market/bs;)Lcom/yingyonghui/market/eo;

    const v0, 0x7f09007a

    invoke-virtual {v1, v0, v8}, Lcom/yingyonghui/market/eo;->a(ILcom/yingyonghui/market/f;)Lcom/yingyonghui/market/eo;

    invoke-virtual {v1}, Lcom/yingyonghui/market/eo;->show()V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/bj;->b:Lcom/yingyonghui/market/bc;

    iget-object v1, p0, Lcom/yingyonghui/market/bj;->a:Lcom/yingyonghui/market/model/l;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/model/l;)V

    goto :goto_0
.end method

.method protected final onPreExecute()V
    .locals 3

    .prologue
    .line 491
    iget-object v0, p0, Lcom/yingyonghui/market/bj;->b:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->getParent()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/bj;->b:Lcom/yingyonghui/market/bc;

    invoke-static {v1}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f090154

    invoke-virtual {v1, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 492
    return-void
.end method
