.class public Lcom/mappn/gfan/ui/HomeActivity;
.super Lcom/mappn/gfan/common/widget/BaseActivity;

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;


# static fields
.field private static final ANIMATION_DURATION:J = 0x1c2L

.field private static final STATUS_ERROR:I = 0x0

.field private static final STATUS_INIT:I = -0x1

.field private static final STATUS_OK:I = 0x1

.field private static final TAB_NEW:Ljava/lang/String; = "new"

.field private static final TAB_POP:Ljava/lang/String; = "pop"

.field private static final VIEW_TYPE_APP_PRODUCT_LIST:I = 0x2

.field private static final VIEW_TYPE_HOME:I = 0x0

.field private static final VIEW_TYPE_TOPIC:I = 0x1


# instance fields
.field private isInSecondLevel:Z

.field private mBottomData:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private mCurrentTopicId:Ljava/lang/String;

.field private mCurrentViewType:I

.field private mInflater:Landroid/view/LayoutInflater;

.field private mIsBottomLoaded:I

.field private mIsToLoaded:I

.field private mListAdapterLevel1:Lcom/mappn/gfan/common/widget/AppListAdapter;

.field private mListViewLevel1:Landroid/widget/ListView;

.field private mLoading:Landroid/widget/FrameLayout;

.field private mLoadingLevel1:Landroid/widget/FrameLayout;

.field private mLoadingNoData1:Landroid/widget/TextView;

.field private mLoadingProgress1:Landroid/widget/ProgressBar;

.field private mNavigationTitle:Ljava/lang/String;

.field private mNoData:Landroid/widget/TextView;

.field private mProgress:Landroid/widget/ProgressBar;

.field private mRecommendAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

.field private mRecommendList:Landroid/widget/ListView;

.field private mTabHost:Landroid/widget/TabHost;

.field private mTopData:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private mTopRecommendAdapter:Lcom/mappn/gfan/common/widget/TopRecommendAdapter;

.field private mTopRecommendGallery:Landroid/widget/Gallery;

.field private mViewAnimator:Landroid/widget/ViewAnimator;

.field private sLeftInAnimation:Landroid/view/animation/TranslateAnimation;

.field private sLeftOutAnimation:Landroid/view/animation/TranslateAnimation;

.field private sRightInAnimation:Landroid/view/animation/TranslateAnimation;

.field private sRightOutAnimation:Landroid/view/animation/TranslateAnimation;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;-><init>()V

    iput v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mIsToLoaded:I

    iput v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mIsBottomLoaded:I

    return-void
.end method

.method private bindAdapter()V
    .locals 9

    const/4 v3, 0x0

    const/4 v8, 0x6

    const/4 v7, 0x0

    const/4 v6, 0x1

    iget v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mIsToLoaded:I

    if-eq v0, v6, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mIsBottomLoaded:I

    if-ne v0, v6, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTopData:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03000d

    invoke-virtual {v0, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Gallery;

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTopRecommendGallery:Landroid/widget/Gallery;

    new-instance v0, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTopData:Ljava/util/ArrayList;

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTopRecommendAdapter:Lcom/mappn/gfan/common/widget/TopRecommendAdapter;

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTopRecommendGallery:Landroid/widget/Gallery;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTopRecommendAdapter:Lcom/mappn/gfan/common/widget/TopRecommendAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTopRecommendGallery:Landroid/widget/Gallery;

    invoke-virtual {v0, p0}, Landroid/widget/Gallery;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mRecommendList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTopRecommendGallery:Landroid/widget/Gallery;

    invoke-virtual {v0, v1, v3, v7}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTopRecommendGallery:Landroid/widget/Gallery;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTopRecommendAdapter:Lcom/mappn/gfan/common/widget/TopRecommendAdapter;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;->getCount()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    iget-object v2, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTopData:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    int-to-double v2, v2

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v4

    mul-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int v2, v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setSelection(I)V

    :cond_2
    new-instance v0, Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/HomeActivity;->mBottomData:Ljava/util/ArrayList;

    const v3, 0x7f030035

    new-array v4, v8, [Ljava/lang/String;

    const-string v5, "ldpi_icon_url"

    aput-object v5, v4, v7

    const-string v5, "name"

    aput-object v5, v4, v6

    const/4 v5, 0x2

    const-string v6, "sub_category"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "is_star"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string v6, "app_size"

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const-string v6, "product_download"

    aput-object v6, v4, v5

    new-array v5, v8, [I

    fill-array-data v5, :array_0

    invoke-direct/range {v0 .. v5}, Lcom/mappn/gfan/common/widget/AppListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mRecommendAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mRecommendAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getParent()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setActivity(Landroid/app/Activity;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mRecommendAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setProductList()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mRecommendList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mRecommendAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mRecommendList:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    goto/16 :goto_0

    :array_0
    .array-data 0x4
        0x1t 0x0t 0xct 0x7ft
        0x2t 0x0t 0xct 0x7ft
        0x20t 0x0t 0xct 0x7ft
        0x4dt 0x0t 0xct 0x7ft
        0x50t 0x0t 0xct 0x7ft
        0x4ft 0x0t 0xct 0x7ft
    .end array-data
.end method

.method private handleBottomContent(Ljava/util/ArrayList;)V
    .locals 1
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

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iput-object p1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mBottomData:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mIsBottomLoaded:I

    invoke-direct {p0}, Lcom/mappn/gfan/ui/HomeActivity;->bindAdapter()V

    goto :goto_0
.end method

.method private handleTopContent(Ljava/util/ArrayList;)V
    .locals 1
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

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iput-object p1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTopData:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mIsToLoaded:I

    invoke-direct {p0}, Lcom/mappn/gfan/ui/HomeActivity;->bindAdapter()V

    goto :goto_0
.end method

.method private initAppListView(Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f030036

    iget-object v2, p0, Lcom/mappn/gfan/ui/HomeActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TabHost;

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTabHost:Landroid/widget/TabHost;

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getLocalActivityManager()Landroid/app/LocalActivityManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->setup(Landroid/app/LocalActivityManager;)V

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/ProductListActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "extra.order"

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "extra.category.id"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v2, "pop"

    invoke-virtual {v1, v2}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090041

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mappn/gfan/common/util/Utils;->createTabView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/ProductListActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "extra.order"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "extra.category.id"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v2, "new"

    invoke-virtual {v1, v2}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090042

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mappn/gfan/common/util/Utils;->createTabView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->addView(Landroid/view/View;)V

    return-void
.end method

.method private initData()V
    .locals 3

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mappn/gfan/common/MarketAPI;->getTopRecommend(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const/16 v2, 0x32

    invoke-static {v0, p0, v1, v2}, Lcom/mappn/gfan/common/MarketAPI;->getHomeRecommend(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;II)V

    return-void
.end method

.method private initTopBar()V
    .locals 5

    const/4 v4, 0x2

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v4, [Landroid/view/View;

    const/4 v2, 0x0

    const v3, 0x7f0c009d

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const v3, 0x7f0c009a

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    aput-object v3, v1, v2

    new-array v2, v4, [I

    fill-array-data v2, :array_0

    const-string v3, ""

    invoke-static {v0, v1, v2, v3}, Lcom/mappn/gfan/common/util/TopBar;->createTopBar(Landroid/content/Context;[Landroid/view/View;[ILjava/lang/String;)V

    return-void

    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method private initTopicProducts()V
    .locals 10

    const/4 v3, 0x0

    const/4 v9, 0x5

    const/4 v8, 0x0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f030034

    invoke-virtual {v1, v2, v3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Landroid/widget/FrameLayout;

    move-object v7, v0

    const v1, 0x102000a

    invoke-virtual {v7, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mListViewLevel1:Landroid/widget/ListView;

    const v1, 0x7f0c000a

    invoke-virtual {v7, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mLoadingLevel1:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0004

    invoke-virtual {v7, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mLoadingProgress1:Landroid/widget/ProgressBar;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mLoadingProgress1:Landroid/widget/ProgressBar;

    new-instance v2, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mLoadingProgress1:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v8}, Landroid/widget/ProgressBar;->setVisibility(I)V

    const v1, 0x7f0c0056

    invoke-virtual {v7, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mLoadingNoData1:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mLoadingNoData1:Landroid/widget/TextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v4, 0x7f030035

    new-array v5, v9, [Ljava/lang/String;

    const-string v6, "ldpi_icon_url"

    aput-object v6, v5, v8

    const/4 v6, 0x1

    const-string v8, "name"

    aput-object v8, v5, v6

    const/4 v6, 0x2

    const-string v8, "author_name"

    aput-object v8, v5, v6

    const/4 v6, 0x3

    const-string v8, "rating"

    aput-object v8, v5, v6

    const/4 v6, 0x4

    const-string v8, "product_download"

    aput-object v8, v5, v6

    new-array v6, v9, [I

    fill-array-data v6, :array_0

    invoke-direct/range {v1 .. v6}, Lcom/mappn/gfan/common/widget/AppListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I[Ljava/lang/String;[I)V

    iput-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mListAdapterLevel1:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mListAdapterLevel1:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getParent()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setActivity(Landroid/app/Activity;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mListAdapterLevel1:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setProductList()V

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mListViewLevel1:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/mappn/gfan/ui/HomeActivity;->mListAdapterLevel1:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mListViewLevel1:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/mappn/gfan/ui/HomeActivity;->mLoadingLevel1:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mListViewLevel1:Landroid/widget/ListView;

    invoke-virtual {v1, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v1, v7}, Landroid/widget/ViewAnimator;->addView(Landroid/view/View;)V

    return-void

    :array_0
    .array-data 0x4
        0x1t 0x0t 0xct 0x7ft
        0x2t 0x0t 0xct 0x7ft
        0x20t 0x0t 0xct 0x7ft
        0x4et 0x0t 0xct 0x7ft
        0x4ft 0x0t 0xct 0x7ft
    .end array-data
.end method

.method private initTranlateAnimation()V
    .locals 6

    const-wide/16 v4, 0x1c2

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v0

    new-instance v1, Landroid/view/animation/TranslateAnimation;

    neg-int v2, v0

    int-to-float v2, v2

    invoke-direct {v1, v3, v2, v3, v3}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    iput-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->sLeftOutAnimation:Landroid/view/animation/TranslateAnimation;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->sLeftOutAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v1, v4, v5}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    new-instance v1, Landroid/view/animation/TranslateAnimation;

    int-to-float v2, v0

    invoke-direct {v1, v2, v3, v3, v3}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    iput-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->sRightInAnimation:Landroid/view/animation/TranslateAnimation;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->sRightInAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v1, v4, v5}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    new-instance v1, Landroid/view/animation/TranslateAnimation;

    neg-int v2, v0

    int-to-float v2, v2

    invoke-direct {v1, v2, v3, v3, v3}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    iput-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->sLeftInAnimation:Landroid/view/animation/TranslateAnimation;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->sLeftInAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v1, v4, v5}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    new-instance v1, Landroid/view/animation/TranslateAnimation;

    int-to-float v0, v0

    invoke-direct {v1, v3, v0, v3, v3}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    iput-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->sRightOutAnimation:Landroid/view/animation/TranslateAnimation;

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->sRightOutAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v4, v5}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    return-void
.end method

.method private initView(Ljava/util/HashMap;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mRecommendList:Landroid/widget/ListView;

    const v0, 0x7f0c000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mLoading:Landroid/widget/FrameLayout;

    const v0, 0x7f0c0004

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mProgress:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mProgress:Landroid/widget/ProgressBar;

    new-instance v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mProgress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    const v0, 0x7f0c0056

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mNoData:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mRecommendList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mLoading:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mInflater:Landroid/view/LayoutInflater;

    const v0, 0x7f0c000f

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ViewAnimator;

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    if-eqz p1, :cond_0

    const-string v0, "extra.home.data.top"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/HomeActivity;->handleTopContent(Ljava/util/ArrayList;)V

    const-string v0, "extra.home.data.bottom"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/HomeActivity;->handleBottomContent(Ljava/util/ArrayList;)V

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0}, Lcom/mappn/gfan/ui/HomeActivity;->initData()V

    goto :goto_0
.end method

.method private updateNavigationTitle(Z)V
    .locals 5

    const/16 v4, 0x8

    const/4 v3, 0x0

    const v0, 0x7f0c009e

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f0c009d

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    if-eqz p1, :cond_0

    iget-object v2, p0, Lcom/mappn/gfan/ui/HomeActivity;->mNavigationTitle:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v2, 0x7f0200c0

    invoke-virtual {v0, v2, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    const/16 v4, 0x32

    const/16 v2, 0x8

    const/4 v1, 0x1

    const/4 v3, 0x0

    iget-boolean v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->isInSecondLevel:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mLoadingProgress1:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mLoadingNoData1:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mCurrentTopicId:Ljava/lang/String;

    const/16 v2, 0x64

    invoke-static {v0, p0, v1, v2, v3}, Lcom/mappn/gfan/common/MarketAPI;->getRecommendProducts(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;II)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mIsToLoaded:I

    if-ne v0, v1, :cond_1

    iget v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mIsBottomLoaded:I

    if-eq v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0, v3, v4}, Lcom/mappn/gfan/common/MarketAPI;->getHomeRecommend(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;II)V

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mIsBottomLoaded:I

    if-ne v0, v1, :cond_2

    iget v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mIsToLoaded:I

    if-eq v0, v1, :cond_2

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mappn/gfan/common/MarketAPI;->getTopRecommend(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mappn/gfan/common/MarketAPI;->getTopRecommend(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0, v3, v4}, Lcom/mappn/gfan/common/MarketAPI;->getHomeRecommend(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;II)V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f03000e

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "extra.home.data"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-direct {p0}, Lcom/mappn/gfan/ui/HomeActivity;->initTopBar()V

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/HomeActivity;->initView(Ljava/util/HashMap;)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/HomeActivity;->initTranlateAnimation()V

    return-void
.end method

.method public onError(II)V
    .locals 3

    const/16 v2, 0x8

    const/4 v1, 0x0

    sparse-switch p1, :sswitch_data_0

    :goto_0
    return-void

    :sswitch_0
    const/16 v0, 0x262

    if-ne p2, v0, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTopData:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mIsToLoaded:I

    invoke-direct {p0}, Lcom/mappn/gfan/ui/HomeActivity;->bindAdapter()V

    goto :goto_0

    :cond_0
    iput v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mIsToLoaded:I

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0

    :sswitch_1
    iput v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mIsBottomLoaded:I

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0

    :sswitch_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mLoadingNoData1:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mLoadingProgress1:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0xd -> :sswitch_2
        0x10 -> :sswitch_1
        0x22 -> :sswitch_0
    .end sparse-switch
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    const/4 v7, 0x2

    const/4 v6, 0x0

    const/4 v5, 0x1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->sRightInAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->sLeftOutAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    invoke-virtual {p1}, Landroid/widget/AdapterView;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "i am others position is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :sswitch_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "\u9996\u9875"

    aput-object v3, v2, v6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u70b9\u51fb\u56fe\u7247\u63a8\u8350\u4f4d->"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v5

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTopRecommendAdapter:Lcom/mappn/gfan/common/widget/TopRecommendAdapter;

    invoke-virtual {v0, p3}, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "top_recommend_type"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "category"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iput-boolean v5, p0, Lcom/mappn/gfan/ui/HomeActivity;->isInSecondLevel:Z

    const-string v1, "id"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/HomeActivity;->initAppListView(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v0}, Landroid/widget/ViewAnimator;->showNext()V

    iput v7, p0, Lcom/mappn/gfan/ui/HomeActivity;->mCurrentViewType:I

    goto :goto_0

    :cond_1
    const-string v2, "topic"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iput-boolean v5, p0, Lcom/mappn/gfan/ui/HomeActivity;->isInSecondLevel:Z

    invoke-direct {p0}, Lcom/mappn/gfan/ui/HomeActivity;->initTopicProducts()V

    const-string v1, "id"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mCurrentTopicId:Ljava/lang/String;

    const-string v1, "reason"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mNavigationTitle:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->mCurrentTopicId:Ljava/lang/String;

    const/16 v2, 0x64

    invoke-static {v0, p0, v1, v2, v6}, Lcom/mappn/gfan/common/MarketAPI;->getRecommendProducts(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;II)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v0}, Landroid/widget/ViewAnimator;->showNext()V

    iput v5, p0, Lcom/mappn/gfan/ui/HomeActivity;->mCurrentViewType:I

    invoke-direct {p0, v5}, Lcom/mappn/gfan/ui/HomeActivity;->updateNavigationTitle(Z)V

    goto/16 :goto_0

    :cond_2
    const-string v2, "product"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "id"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/mappn/gfan/ui/PreloadActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "extra.key.pid"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/HomeActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    :sswitch_1
    const-string v0, ""

    iget v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mCurrentViewType:I

    if-ne v0, v5, :cond_4

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mListAdapterLevel1:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0, p3}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "p_id"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :cond_3
    :goto_1
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/mappn/gfan/ui/PreloadActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "extra.key.pid"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/HomeActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    :cond_4
    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mRecommendAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    sub-int v1, p3, v5

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "p_id"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/16 v1, 0x14

    if-ge p3, v1, :cond_3

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "\u9996\u9875"

    aput-object v3, v2, v6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u70b9\u51fb\u63a8\u8350\u4f4d"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto :goto_1

    nop

    :sswitch_data_0
    .sparse-switch
        0x102000a -> :sswitch_1
        0x7f0c0019 -> :sswitch_0
    .end sparse-switch
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v0, 0x4

    if-ne v0, p1, :cond_1

    iget-boolean v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->isInSecondLevel:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->sLeftInAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeActivity;->sRightOutAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v0}, Landroid/widget/ViewAnimator;->showPrevious()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v0, v3}, Landroid/widget/ViewAnimator;->removeViewAt(I)V

    iput-boolean v2, p0, Lcom/mappn/gfan/ui/HomeActivity;->isInSecondLevel:Z

    iput v2, p0, Lcom/mappn/gfan/ui/HomeActivity;->mCurrentViewType:I

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mTabHost:Landroid/widget/TabHost;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getLocalActivityManager()Landroid/app/LocalActivityManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/LocalActivityManager;->removeAllActivities()V

    :cond_0
    invoke-direct {p0, v2}, Lcom/mappn/gfan/ui/HomeActivity;->updateNavigationTitle(Z)V

    move v0, v3

    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onPause()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onResume()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 2

    sparse-switch p1, :sswitch_data_0

    :goto_0
    return-void

    :sswitch_0
    check-cast p2, Ljava/util/ArrayList;

    invoke-direct {p0, p2}, Lcom/mappn/gfan/ui/HomeActivity;->handleTopContent(Ljava/util/ArrayList;)V

    goto :goto_0

    :sswitch_1
    check-cast p2, Ljava/util/HashMap;

    const-string v0, "product_list"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/HomeActivity;->handleBottomContent(Ljava/util/ArrayList;)V

    goto :goto_0

    :sswitch_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeActivity;->mListAdapterLevel1:Lcom/mappn/gfan/common/widget/AppListAdapter;

    check-cast p2, Ljava/util/HashMap;

    const-string v1, "product_list"

    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->addData(Ljava/util/ArrayList;)V

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0xd -> :sswitch_2
        0x10 -> :sswitch_1
        0x22 -> :sswitch_0
    .end sparse-switch
.end method
