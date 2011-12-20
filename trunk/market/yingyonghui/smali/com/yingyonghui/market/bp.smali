.class final Lcom/yingyonghui/market/bp;
.super Landroid/os/AsyncTask;
.source "ActivityListAppDownload.java"


# instance fields
.field private a:Z

.field private synthetic b:Lcom/yingyonghui/market/c;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/c;)V
    .locals 1
    .parameter

    .prologue
    .line 678
    iput-object p1, p0, Lcom/yingyonghui/market/bp;->b:Lcom/yingyonghui/market/c;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 679
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/yingyonghui/market/bp;->a:Z

    return-void
.end method


# virtual methods
.method protected final bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9
    .parameter

    .prologue
    const/16 v8, 0x80

    const/4 v7, 0x1

    .line 678
    iget-object v0, p0, Lcom/yingyonghui/market/bp;->b:Lcom/yingyonghui/market/c;

    iget-object v0, v0, Lcom/yingyonghui/market/c;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    iget-object v1, p0, Lcom/yingyonghui/market/bp;->b:Lcom/yingyonghui/market/c;

    iget-object v1, v1, Lcom/yingyonghui/market/c;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->k(Lcom/yingyonghui/market/ActivityListAppDownload;)Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4, v8}, Landroid/content/pm/PackageManager;->getPackageArchiveInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    if-eqz v4, :cond_2

    iget-object v1, v4, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    if-eqz v1, :cond_1

    iget-object v5, p0, Lcom/yingyonghui/market/bp;->b:Lcom/yingyonghui/market/c;

    iget-object v5, v5, Lcom/yingyonghui/market/c;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v5}, Lcom/yingyonghui/market/ActivityListAppDownload;->k(Lcom/yingyonghui/market/ActivityListAppDownload;)Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v8}, Landroid/content/pm/PackageManager;->getPackageArchiveInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5

    iget v5, v5, Landroid/content/pm/PackageInfo;->versionCode:I

    iget v6, v4, Landroid/content/pm/PackageInfo;->versionCode:I

    if-lt v5, v6, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    iput-boolean v7, p0, Lcom/yingyonghui/market/bp;->a:Z

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    iput-boolean v7, p0, Lcom/yingyonghui/market/bp;->a:Z

    iget-object v1, v4, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    iget-object v1, v4, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/yingyonghui/market/bp;->b:Lcom/yingyonghui/market/c;

    iget-object v0, v0, Lcom/yingyonghui/market/c;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Lcom/yingyonghui/market/ActivityListAppDownload;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    const/4 v0, 0x0

    return-object v0
.end method

.method protected final bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 2
    .parameter

    .prologue
    .line 678
    iget-boolean v0, p0, Lcom/yingyonghui/market/bp;->a:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/bp;->b:Lcom/yingyonghui/market/c;

    iget-object v0, v0, Lcom/yingyonghui/market/c;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    const v1, 0x7f090152

    invoke-static {v0, v1}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    :goto_0
    iget-object v0, p0, Lcom/yingyonghui/market/bp;->b:Lcom/yingyonghui/market/c;

    iget-object v0, v0, Lcom/yingyonghui/market/c;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->j(Lcom/yingyonghui/market/ActivityListAppDownload;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/bp;->b:Lcom/yingyonghui/market/c;

    iget-object v0, v0, Lcom/yingyonghui/market/c;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    const v1, 0x7f090153

    invoke-static {v0, v1}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto :goto_0
.end method
