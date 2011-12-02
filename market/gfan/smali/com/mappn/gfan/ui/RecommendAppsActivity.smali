.class public Lcom/mappn/gfan/ui/RecommendAppsActivity;
.super Lcom/mappn/gfan/common/widget/LazyloadListActivity;

# interfaces
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field private mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

.field private mLoading:Landroid/widget/FrameLayout;

.field private mNoData:Landroid/widget/TextView;

.field private mProgress:Landroid/widget/ProgressBar;

.field private mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

.field private mTotalSize:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;-><init>()V

    return-void
.end method

.method private createHeaderView(Lcom/mappn/gfan/common/vo/RecommendTopic;)Landroid/view/View;
    .locals 3

    const/16 v2, 0x14

    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const v1, 0x7f020045

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    iget-object v1, v1, Lcom/mappn/gfan/common/vo/RecommendTopic;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0a001e

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    return-object v0
.end method


# virtual methods
.method public doInitListAdapter()Lcom/mappn/gfan/common/widget/AppListAdapter;
    .locals 8

    const/4 v7, 0x6

    new-instance v0, Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    const v3, 0x7f03004a

    new-array v4, v7, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "icon_url"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "name"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "sub_category"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "product_download"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string v6, "app_size"

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const-string v6, "short_description"

    aput-object v6, v4, v5

    new-array v5, v7, [I

    fill-array-data v5, :array_0

    invoke-direct/range {v0 .. v5}, Lcom/mappn/gfan/common/widget/AppListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setProductList()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    return-object v0

    nop

    :array_0
    .array-data 0x4
        0x1t 0x0t 0xct 0x7ft
        0x2t 0x0t 0xct 0x7ft
        0x74t 0x0t 0xct 0x7ft
        0x4ft 0x0t 0xct 0x7ft
        0x50t 0x0t 0xct 0x7ft
        0x20t 0x0t 0xct 0x7ft
    .end array-data
.end method

.method public doInitView(Landroid/os/Bundle;)Z
    .locals 4

    const/4 v3, 0x0

    const v0, 0x7f030034

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "extra.recommend.detail"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/RecommendTopic;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mList:Landroid/widget/ListView;

    const v0, 0x7f0c000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mLoading:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mLoading:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0004

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mProgress:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mProgress:Landroid/widget/ProgressBar;

    new-instance v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mLoading:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0056

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mNoData:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mLoading:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    invoke-direct {p0, v1}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->createHeaderView(Lcom/mappn/gfan/common/vo/RecommendTopic;)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->lazyload()V

    const/4 v0, 0x1

    return v0
.end method

.method public doLazyload()V
    .locals 4

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->getItemsPerPage()I

    move-result v1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->getStartIndex()I

    move-result v2

    iget-object v3, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    iget-object v3, v3, Lcom/mappn/gfan/common/vo/RecommendTopic;->id:Ljava/lang/String;

    invoke-static {v0, p0, v1, v2, v3}, Lcom/mappn/gfan/common/MarketAPI;->getMasterRecommendApps(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;IILjava/lang/String;)V

    return-void
.end method

.method protected getItemCount()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mTotalSize:I

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0c0056

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mProgress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mNoData:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->lazyload()V

    :goto_0
    return-void

    :cond_0
    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->onClick(Landroid/view/View;)V

    goto :goto_0
.end method

.method public onError(II)V
    .locals 3

    const/4 v2, 0x0

    const/16 v0, 0x262

    if-ne p2, v0, :cond_0

    :goto_0
    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->setLoadResult(Z)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mProgress:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v1

    sub-int v1, p3, v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "packagename"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/mappn/gfan/ui/PreloadActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "extra.key.package.name"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "\u73a9\u5bb6\u63a8\u8350"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    iget-object v4, v4, Lcom/mappn/gfan/common/vo/RecommendTopic;->title:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "->\u70b9\u51fb\u5e94\u7528\u8be6\u7ec6\u9875"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    return-void
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->onPause()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->onResume()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 2

    check-cast p2, Ljava/util/HashMap;

    iget v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mTotalSize:I

    if-gtz v0, :cond_0

    const-string v0, "total_size"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mTotalSize:I

    :cond_0
    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendAppsActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    const-string v0, "product_list"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->addData(Ljava/util/ArrayList;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendAppsActivity;->setLoadResult(Z)V

    return-void
.end method
