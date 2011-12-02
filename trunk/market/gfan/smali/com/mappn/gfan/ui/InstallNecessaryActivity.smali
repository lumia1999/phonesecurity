.class public Lcom/mappn/gfan/ui/InstallNecessaryActivity;
.super Lcom/mappn/gfan/common/widget/BaseActivity;

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;


# instance fields
.field private mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

.field private mList:Landroid/widget/ListView;

.field private mLoading:Landroid/widget/FrameLayout;

.field private mNoData:Landroid/widget/TextView;

.field private mProgress:Landroid/widget/ProgressBar;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;-><init>()V

    return-void
.end method

.method private doInitAdapter()Lcom/mappn/gfan/common/widget/AppListAdapter;
    .locals 9

    const/4 v8, 0x5

    const/4 v7, 0x1

    new-instance v0, Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    const v3, 0x7f030011

    new-array v4, v8, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "logo"

    aput-object v6, v4, v5

    const-string v5, "app_title"

    aput-object v5, v4, v7

    const/4 v5, 0x2

    const-string v6, "app_detail"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "is_checked"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string v6, "is_installed"

    aput-object v6, v4, v5

    new-array v5, v8, [I

    fill-array-data v5, :array_0

    invoke-direct/range {v0 .. v5}, Lcom/mappn/gfan/common/widget/AppListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I[Ljava/lang/String;[I)V

    invoke-virtual {v0, p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setActivity(Landroid/app/Activity;)V

    invoke-virtual {v0, v7}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setContainsPlaceHolder(Z)V

    const v1, 0x7f030012

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setPlaceHolderResource(I)V

    return-object v0

    nop

    :array_0
    .array-data 0x4
        0x1t 0x0t 0xct 0x7ft
        0x2t 0x0t 0xct 0x7ft
        0x20t 0x0t 0xct 0x7ft
        0x22t 0x0t 0xct 0x7ft
        0x21t 0x0t 0xct 0x7ft
    .end array-data
.end method

.method private initData()V
    .locals 2

    invoke-direct {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->doInitAdapter()Lcom/mappn/gfan/common/widget/AppListAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mappn/gfan/common/MarketAPI;->getRequired(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    return-void
.end method

.method private initTopBar()V
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v4, [Landroid/view/View;

    const v2, 0x7f0c009e

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v3

    new-array v2, v4, [I

    aput v3, v2, v3

    const v3, 0x7f090044

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/mappn/gfan/common/util/TopBar;->createTopBar(Landroid/content/Context;[Landroid/view/View;[ILjava/lang/String;)V

    return-void
.end method

.method private initView()V
    .locals 4

    const/4 v3, 0x0

    const v0, 0x7f0c0015

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0c0016

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mList:Landroid/widget/ListView;

    const v0, 0x7f0c000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mLoading:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mLoading:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0004

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mProgress:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mProgress:Landroid/widget/ProgressBar;

    new-instance v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mLoading:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0056

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mNoData:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mLoading:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mList:Landroid/widget/ListView;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setChoiceMode(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    return-void
.end method

.method private startDownload()V
    .locals 5

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u88c5\u673a\u5fc5\u5907"

    aput-object v2, v1, v4

    const/4 v2, 0x1

    const-string v3, "\u6279\u91cf\u4e0b\u8f7d"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getCheckedList()Ljava/util/HashMap;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f090030

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v4}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    :goto_0
    return-void

    :cond_1
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v2, "p_id"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "0"

    invoke-static {v2, p0, v0, v3}, Lcom/mappn/gfan/common/MarketAPI;->getDownloadUrl(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f090077

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v4}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :goto_0
    return-void

    :sswitch_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->finish()V

    goto :goto_0

    :sswitch_1
    invoke-direct {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->startDownload()V

    goto :goto_0

    :sswitch_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mNoData:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mProgress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mappn/gfan/common/MarketAPI;->getRequired(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0c0015 -> :sswitch_0
        0x7f0c0016 -> :sswitch_1
        0x7f0c0056 -> :sswitch_2
    .end sparse-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f03000b

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->setContentView(I)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->initTopBar()V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->initView()V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->initData()V

    return-void
.end method

.method public onError(II)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mNoData:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mProgress:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method

.method protected onPause()V
    .locals 0

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onPause()V

    invoke-static {p0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

    return-void
.end method

.method protected onResume()V
    .locals 0

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onResume()V

    invoke-static {p0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 5

    const/4 v4, 0x0

    sparse-switch p1, :sswitch_data_0

    :goto_0
    return-void

    :sswitch_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Lcom/mappn/gfan/common/widget/AppListAdapter;->addData(Ljava/util/ArrayList;)V

    goto :goto_0

    :sswitch_1
    check-cast p2, Lcom/mappn/gfan/common/vo/DownloadItem;

    new-instance v2, Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v0, p2, Lcom/mappn/gfan/common/vo/DownloadItem;->url:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/mappn/gfan/common/download/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getCheckedList()Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p2, Lcom/mappn/gfan/common/vo/DownloadItem;->pId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "app_title"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setTitle(Ljava/lang/CharSequence;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v1, p2, Lcom/mappn/gfan/common/vo/DownloadItem;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setPackageName(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    const-string v1, "logo"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v0}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setIconUrl(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    invoke-virtual {v2, v4}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setSourceType(I)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v0, p2, Lcom/mappn/gfan/common/vo/DownloadItem;->fileMD5:Ljava/lang/String;

    invoke-virtual {v2, v0}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setMD5(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v0, p0, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getDownloadManager()Lcom/mappn/gfan/common/download/DownloadManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/mappn/gfan/common/download/DownloadManager;->enqueue(Landroid/content/Context;Lcom/mappn/gfan/common/download/DownloadManager$Request;Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v2, v1, v4

    const/4 v2, 0x1

    const-string v3, "\u4e0b\u8f7d\u5f00\u59cb"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/InstallNecessaryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p2, Lcom/mappn/gfan/common/vo/DownloadItem;->url:Ljava/lang/String;

    iget-object v2, p2, Lcom/mappn/gfan/common/vo/DownloadItem;->packageName:Ljava/lang/String;

    invoke-static {v0, v4, v4, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->submitDownloadLog(Landroid/content/Context;IILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0xf -> :sswitch_1
        0x26 -> :sswitch_0
    .end sparse-switch
.end method
