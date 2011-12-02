.class Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;
.super Landroid/os/AsyncTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/AppsUpdateActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoadAppTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/util/ArrayList",
        "<",
        "Ljava/util/HashMap",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;>;>;"
    }
.end annotation


# instance fields
.field private mUpdateCounter:I

.field final synthetic this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;


# direct methods
.method private constructor <init>(Lcom/mappn/gfan/ui/AppsUpdateActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mappn/gfan/ui/AppsUpdateActivity;Lcom/mappn/gfan/ui/AppsUpdateActivity$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;-><init>(Lcom/mappn/gfan/ui/AppsUpdateActivity;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;->doInBackground([Ljava/lang/Void;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/util/ArrayList;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    const/4 v12, 0x1

    const/4 v11, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->access$500(Lcom/mappn/gfan/ui/AppsUpdateActivity;)Lcom/mappn/gfan/Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUpdateList()Ljava/util/HashMap;

    move-result-object v3

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getInstalledApps(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-virtual {v1}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput v11, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;->mUpdateCounter:I

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/PackageInfo;

    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    const-string v1, "packagename"

    iget-object v8, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v7, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "icon_url"

    invoke-virtual {v7, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "name"

    iget-object v8, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v8, v4}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v7, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "version_name"

    const v8, 0x7f09011d

    new-array v9, v12, [Ljava/lang/Object;

    iget-object v10, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    aput-object v10, v9, v11

    invoke-virtual {v2, v8, v9}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mappn/gfan/common/vo/UpgradeInfo;

    const-string v8, "p_id"

    iget-object v9, v1, Lcom/mappn/gfan/common/vo/UpgradeInfo;->pid:Ljava/lang/String;

    invoke-virtual {v7, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v8, "ldpi_icon_url"

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v7, v8, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "new_version_name"

    const v8, 0x7f09011e

    new-array v9, v12, [Ljava/lang/Object;

    iget-object v10, v1, Lcom/mappn/gfan/common/vo/UpgradeInfo;->versionName:Ljava/lang/String;

    aput-object v10, v9, v11

    invoke-virtual {v2, v8, v9}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v0, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "is_upgrade"

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v7, v0, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v1, Lcom/mappn/gfan/common/vo/UpgradeInfo;->filePath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;->mUpdateCounter:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;->mUpdateCounter:I

    :cond_0
    :goto_1
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_1
    const-string v0, "is_upgrade"

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_2
    return-object v5
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;->onPostExecute(Ljava/util/ArrayList;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->access$100(Lcom/mappn/gfan/ui/AppsUpdateActivity;)Lcom/mappn/gfan/common/widget/AppListAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->access$100(Lcom/mappn/gfan/ui/AppsUpdateActivity;)Lcom/mappn/gfan/common/widget/AppListAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->addData(Ljava/util/ArrayList;)V

    iget v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;->mUpdateCounter:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->access$400(Lcom/mappn/gfan/ui/AppsUpdateActivity;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v0, v1}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->access$200(Lcom/mappn/gfan/ui/AppsUpdateActivity;I)V

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    iget-object v0, v0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->access$400(Lcom/mappn/gfan/ui/AppsUpdateActivity;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->removeHeaderView(Landroid/view/View;)Z

    goto :goto_0
.end method
