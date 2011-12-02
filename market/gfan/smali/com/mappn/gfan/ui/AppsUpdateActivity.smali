.class public Lcom/mappn/gfan/ui/AppsUpdateActivity;
.super Lcom/mappn/gfan/common/widget/BaseActivity;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;
    }
.end annotation


# static fields
.field private static final CONTEXT_MENU_DELETE_FILE:I = 0x0

.field private static final CONTEXT_MENU_IGNORE_UPDATE:I = 0x1

.field private static sComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

.field private mInstallReceiver:Landroid/content/BroadcastReceiver;

.field mList:Landroid/widget/ListView;

.field private mLoading:Landroid/widget/FrameLayout;

.field private mLongClickPos:I

.field private mProgress:Landroid/widget/ProgressBar;

.field private mTitle:Landroid/widget/TextView;

.field private mUpdateAllView:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/mappn/gfan/ui/AppsUpdateActivity$1;

    invoke-direct {v0}, Lcom/mappn/gfan/ui/AppsUpdateActivity$1;-><init>()V

    sput-object v0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->sComparator:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;-><init>()V

    new-instance v0, Lcom/mappn/gfan/ui/AppsUpdateActivity$2;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/AppsUpdateActivity$2;-><init>(Lcom/mappn/gfan/ui/AppsUpdateActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mInstallReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;Ljava/lang/String;)Ljava/util/HashMap;
    .locals 1

    invoke-static {p0, p1}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->getApkInfo(Landroid/content/Context;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/mappn/gfan/ui/AppsUpdateActivity;)Lcom/mappn/gfan/common/widget/AppListAdapter;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mappn/gfan/ui/AppsUpdateActivity;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->updateTitle(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/mappn/gfan/ui/AppsUpdateActivity;)Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mUpdateAllView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mappn/gfan/ui/AppsUpdateActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method private createTitleView()Landroid/view/View;
    .locals 4

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030004

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const v0, 0x7f0c000b

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mTitle:Landroid/widget/TextView;

    return-object v1
.end method

.method private createUpdateAllView()Landroid/view/View;
    .locals 4

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030006

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mUpdateAllView:Landroid/view/View;

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mUpdateAllView:Landroid/view/View;

    const v1, 0x7f0c000c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f090074

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mUpdateAllView:Landroid/view/View;

    new-instance v1, Lcom/mappn/gfan/ui/AppsUpdateActivity$3;

    invoke-direct {v1, p0}, Lcom/mappn/gfan/ui/AppsUpdateActivity$3;-><init>(Lcom/mappn/gfan/ui/AppsUpdateActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mUpdateAllView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mUpdateAllView:Landroid/view/View;

    return-object v0
.end method

.method private static getApkInfo(Landroid/content/Context;Ljava/lang/String;)Ljava/util/HashMap;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string v3, "packagename"

    iget-object v4, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "icon_url"

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "name"

    iget-object v4, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v4, v0}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "version_name"

    const v3, 0x7f09011d

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    aput-object v1, v4, v5

    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "new_version_name"

    const-string v1, ""

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "is_upgrade"

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v2

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getApkInfo NameNotFoundException for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/mappn/gfan/common/util/Utils;->E(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    goto :goto_0
.end method

.method private ignoreUpgrade(I)V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0, p1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "packagename"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "new_version_name"

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "is_upgrade"

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/DBUtils;->ignoreUpdate(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->sort()V

    return-void
.end method

.method private uninstall(I)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0, p1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "packagename"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/mappn/gfan/common/util/Utils;->uninstallApk(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private updateTitle(I)V
    .locals 5

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mTitle:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mTitle:Landroid/widget/TextView;

    const v1, 0x7f090116

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public doInitListAdapter()Lcom/mappn/gfan/common/widget/AppListAdapter;
    .locals 8

    const/4 v7, 0x5

    new-instance v0, Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    const v3, 0x7f030002

    new-array v4, v7, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "icon_url"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "name"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "version_name"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "new_version_name"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string v6, "product_download"

    aput-object v6, v4, v5

    new-array v5, v7, [I

    fill-array-data v5, :array_0

    invoke-direct/range {v0 .. v5}, Lcom/mappn/gfan/common/widget/AppListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setProductList()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    sget-object v1, Lcom/mappn/gfan/ui/AppsUpdateActivity;->sComparator:Ljava/util/Comparator;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setNeedSort(Ljava/util/Comparator;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->getParent()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setActivity(Landroid/app/Activity;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    return-object v0

    :array_0
    .array-data 0x4
        0x1t 0x0t 0xct 0x7ft
        0x2t 0x0t 0xct 0x7ft
        0x7t 0x0t 0xct 0x7ft
        0x8t 0x0t 0xct 0x7ft
        0x6t 0x0t 0xct 0x7ft
    .end array-data
.end method

.method public doInitView(Landroid/os/Bundle;)Z
    .locals 6

    const/4 v5, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x1

    const v0, 0x7f0c000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mLoading:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mLoading:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0004

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mProgress:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mProgress:Landroid/widget/ProgressBar;

    new-instance v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mList:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mLoading:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->doInitListAdapter()Lcom/mappn/gfan/common/widget/AppListAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mList:Landroid/widget/ListView;

    invoke-direct {p0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->createTitleView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1, v5, v4}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mList:Landroid/widget/ListView;

    invoke-direct {p0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->createUpdateAllView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1, v5, v3}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->registerForContextMenu(Landroid/view/View;)V

    return v3
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    :pswitch_0
    iget v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mLongClickPos:I

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->uninstall(I)V

    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    :pswitch_1
    iget v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mLongClickPos:I

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->ignoreUpgrade(I)V

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f030003

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->setContentView(I)V

    invoke-virtual {p0, p1}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->doInitView(Landroid/os/Bundle;)Z

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "package"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mInstallReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    new-instance v0, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;-><init>(Lcom/mappn/gfan/ui/AppsUpdateActivity;Lcom/mappn/gfan/ui/AppsUpdateActivity$1;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/AppsUpdateActivity$LoadAppTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 3

    const/4 v2, 0x0

    check-cast p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    iget v0, p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    iget-object v1, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mLongClickPos:I

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget v1, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mLongClickPos:I

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/HashMap;

    const-string v0, "is_upgrade"

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    const v1, 0x7f090111

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    const v0, 0x7f09011b

    invoke-interface {p1, v2, v2, v2, v0}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    :cond_0
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onDestroy()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mInstallReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v1, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v1

    sub-int v1, p3, v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    const-string v1, "packagename"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/mappn/gfan/ui/PreloadActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "extra.key.package.name"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onPause()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onResume()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    return-void
.end method
