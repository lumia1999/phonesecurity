.class public Lcom/mappn/gfan/ui/CategoryActivity;
.super Lcom/mappn/gfan/common/widget/BaseActivity;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;


# static fields
.field private static final ANIMATION_DURATION:J = 0x1c2L

.field private static final TAB_NEW:Ljava/lang/String; = "new"

.field private static final TAB_POP:Ljava/lang/String; = "pop"

.field private static final VIEW_TYPE_APP_PRODUCT_LIST:I = 0x3

.field private static final VIEW_TYPE_CATEGORY:I = 0x1

.field private static final VIEW_TYPE_OTHERS_PRODUCT_LIST:I = 0x4

.field private static final VIEW_TYPE_SUBCATEGORY:I = 0x2

.field private static final VIEW_TYPE_TOPIC_CATEGORY:I = 0x5

.field private static final VIEW_TYPE_TOPIC_PRODUCTS:I = 0x6

.field private static sLeftInAnimation:Landroid/view/animation/TranslateAnimation;

.field private static sLeftOutAnimation:Landroid/view/animation/TranslateAnimation;

.field private static sRightOutAnimation:Landroid/view/animation/TranslateAnimation;

.field private static sRighttInAnimation:Landroid/view/animation/TranslateAnimation;


# instance fields
.field private leftHeader:Landroid/widget/ImageView;

.field private mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

.field private mCurrentLevel:I

.field private mCurrentViewType:I

.field private mInflater:Landroid/view/LayoutInflater;

.field private mListAdapterLevel1:Lcom/mappn/gfan/common/widget/AppListAdapter;

.field private mListAdapterLevel2:Lcom/mappn/gfan/common/widget/AppListAdapter;

.field private mListViewLevel1:Landroid/widget/ListView;

.field private mListViewLevel2:Landroid/widget/ListView;

.field private mLoading:Landroid/widget/FrameLayout;

.field private mLoadingLevel1:Landroid/widget/FrameLayout;

.field private mLoadingLevel2:Landroid/widget/FrameLayout;

.field private mLoadingNoData1:Landroid/widget/TextView;

.field private mLoadingNoData2:Landroid/widget/TextView;

.field private mLoadingProgress1:Landroid/widget/ProgressBar;

.field private mLoadingProgress2:Landroid/widget/ProgressBar;

.field private mNoData:Landroid/widget/TextView;

.field private mProgress:Landroid/widget/ProgressBar;

.field private mSecondLevelTitle:Ljava/lang/String;

.field private mTabHost:Landroid/widget/TabHost;

.field private mThirdLevelTitle:Ljava/lang/String;

.field private mTopLevelTitle:Ljava/lang/String;

.field private mTopicId:Ljava/lang/String;

.field private mViewAnimator:Landroid/widget/ViewAnimator;

.field private mlistView:Landroid/widget/ListView;

.field private rightHeader:Landroid/widget/ImageView;

.field private width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    return-void
.end method

.method private initAdapter()Landroid/widget/ListAdapter;
    .locals 8

    const/4 v7, 0x4

    new-instance v0, Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    const v3, 0x7f030009

    new-array v4, v7, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "icon_url"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "category_name"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "top_app"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "app_count"

    aput-object v6, v4, v5

    new-array v5, v7, [I

    fill-array-data v5, :array_0

    invoke-direct/range {v0 .. v5}, Lcom/mappn/gfan/common/widget/AppListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getParent()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setActivity(Landroid/app/Activity;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    return-object v0

    nop

    :array_0
    .array-data 0x4
        0x10t 0x0t 0xct 0x7ft
        0x11t 0x0t 0xct 0x7ft
        0x13t 0x0t 0xct 0x7ft
        0x12t 0x0t 0xct 0x7ft
    .end array-data
.end method

.method private initAnimation()V
    .locals 5

    const-wide/16 v3, 0x1c2

    const/4 v2, 0x0

    new-instance v0, Landroid/view/animation/TranslateAnimation;

    iget v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->width:I

    neg-int v1, v1

    int-to-float v1, v1

    invoke-direct {v0, v2, v1, v2, v2}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    sput-object v0, Lcom/mappn/gfan/ui/CategoryActivity;->sLeftOutAnimation:Landroid/view/animation/TranslateAnimation;

    new-instance v0, Landroid/view/animation/TranslateAnimation;

    iget v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->width:I

    int-to-float v1, v1

    invoke-direct {v0, v1, v2, v2, v2}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    sput-object v0, Lcom/mappn/gfan/ui/CategoryActivity;->sRighttInAnimation:Landroid/view/animation/TranslateAnimation;

    new-instance v0, Landroid/view/animation/TranslateAnimation;

    iget v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->width:I

    neg-int v1, v1

    int-to-float v1, v1

    invoke-direct {v0, v1, v2, v2, v2}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    sput-object v0, Lcom/mappn/gfan/ui/CategoryActivity;->sLeftInAnimation:Landroid/view/animation/TranslateAnimation;

    new-instance v0, Landroid/view/animation/TranslateAnimation;

    iget v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->width:I

    int-to-float v1, v1

    invoke-direct {v0, v2, v1, v2, v2}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    sput-object v0, Lcom/mappn/gfan/ui/CategoryActivity;->sRightOutAnimation:Landroid/view/animation/TranslateAnimation;

    sget-object v0, Lcom/mappn/gfan/ui/CategoryActivity;->sLeftOutAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v3, v4}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    sget-object v0, Lcom/mappn/gfan/ui/CategoryActivity;->sRighttInAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v3, v4}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    sget-object v0, Lcom/mappn/gfan/ui/CategoryActivity;->sLeftInAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v3, v4}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    sget-object v0, Lcom/mappn/gfan/ui/CategoryActivity;->sRightOutAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v3, v4}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    return-void
.end method

.method private initAppListView(Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f030036

    iget-object v2, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TabHost;

    iput-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mTabHost:Landroid/widget/TabHost;

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getLocalActivityManager()Landroid/app/LocalActivityManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->setup(Landroid/app/LocalActivityManager;)V

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/ProductListActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "extra.order"

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "extra.category.id"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v2, "pop"

    invoke-virtual {v1, v2}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090041

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/CategoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mappn/gfan/common/util/Utils;->createTabView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/ProductListActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "extra.order"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "extra.category.id"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v2, "new"

    invoke-virtual {v1, v2}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090042

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/CategoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mappn/gfan/common/util/Utils;->createTabView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mTabHost:Landroid/widget/TabHost;

    new-instance v1, Lcom/mappn/gfan/ui/CategoryActivity$1;

    invoke-direct {v1, p0}, Lcom/mappn/gfan/ui/CategoryActivity$1;-><init>(Lcom/mappn/gfan/ui/CategoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->addView(Landroid/view/View;)V

    return-void
.end method

.method private initListView(Ljava/util/ArrayList;)V
    .locals 9
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

    const/4 v8, 0x4

    const/4 v6, 0x0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f030034

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Landroid/widget/FrameLayout;

    move-object v7, v0

    const v1, 0x102000a

    invoke-virtual {v7, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListViewLevel1:Landroid/widget/ListView;

    const v1, 0x7f0c000a

    invoke-virtual {v7, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingLevel1:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0004

    invoke-virtual {v7, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingProgress1:Landroid/widget/ProgressBar;

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingProgress1:Landroid/widget/ProgressBar;

    new-instance v2, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingProgress1:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v6}, Landroid/widget/ProgressBar;->setVisibility(I)V

    const v1, 0x7f0c0056

    invoke-virtual {v7, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingNoData1:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingNoData1:Landroid/widget/TextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v4, 0x7f030009

    new-array v5, v8, [Ljava/lang/String;

    const-string v3, "icon_url"

    aput-object v3, v5, v6

    const/4 v3, 0x1

    const-string v6, "category_name"

    aput-object v6, v5, v3

    const/4 v3, 0x2

    const-string v6, "top_app"

    aput-object v6, v5, v3

    const/4 v3, 0x3

    const-string v6, "app_count"

    aput-object v6, v5, v3

    new-array v6, v8, [I

    fill-array-data v6, :array_0

    move-object v3, p1

    invoke-direct/range {v1 .. v6}, Lcom/mappn/gfan/common/widget/AppListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I[Ljava/lang/String;[I)V

    iput-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListAdapterLevel1:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListViewLevel1:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListAdapterLevel1:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListViewLevel1:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingLevel1:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListViewLevel1:Landroid/widget/ListView;

    invoke-virtual {v1, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v1, v7}, Landroid/widget/ViewAnimator;->addView(Landroid/view/View;)V

    return-void

    :array_0
    .array-data 0x4
        0x10t 0x0t 0xct 0x7ft
        0x11t 0x0t 0xct 0x7ft
        0x13t 0x0t 0xct 0x7ft
        0x12t 0x0t 0xct 0x7ft
    .end array-data
.end method

.method private initTopBar()V
    .locals 5

    const/4 v4, 0x2

    const v0, 0x7f090040

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/CategoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mTopLevelTitle:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v4, [Landroid/view/View;

    const/4 v2, 0x0

    const v3, 0x7f0c009e

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/CategoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const v3, 0x7f0c009a

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/CategoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    aput-object v3, v1, v2

    new-array v2, v4, [I

    fill-array-data v2, :array_0

    iget-object v3, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mTopLevelTitle:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Lcom/mappn/gfan/common/util/TopBar;->createTopBar(Landroid/content/Context;[Landroid/view/View;[ILjava/lang/String;)V

    return-void

    nop

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

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

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

    iput-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListViewLevel2:Landroid/widget/ListView;

    const v1, 0x7f0c000a

    invoke-virtual {v7, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingLevel2:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0004

    invoke-virtual {v7, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingProgress2:Landroid/widget/ProgressBar;

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingProgress2:Landroid/widget/ProgressBar;

    new-instance v2, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingProgress2:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v8}, Landroid/widget/ProgressBar;->setVisibility(I)V

    const v1, 0x7f0c0056

    invoke-virtual {v7, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingNoData2:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingNoData2:Landroid/widget/TextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

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

    iput-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListAdapterLevel2:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListAdapterLevel2:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setProductList()V

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListViewLevel2:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListAdapterLevel2:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListViewLevel2:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingLevel2:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListViewLevel2:Landroid/widget/ListView;

    invoke-virtual {v1, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v1, v7}, Landroid/widget/ViewAnimator;->addView(Landroid/view/View;)V

    return-void

    nop

    :array_0
    .array-data 0x4
        0x1t 0x0t 0xct 0x7ft
        0x2t 0x0t 0xct 0x7ft
        0x20t 0x0t 0xct 0x7ft
        0x4et 0x0t 0xct 0x7ft
        0x4ft 0x0t 0xct 0x7ft
    .end array-data
.end method

.method private initView()V
    .locals 5

    const/4 v4, 0x0

    const/4 v3, 0x0

    const v0, 0x7f0c000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/CategoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoading:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoading:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0004

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mProgress:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mProgress:Landroid/widget/ProgressBar;

    new-instance v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoading:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0056

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mNoData:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/CategoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mlistView:Landroid/widget/ListView;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030007

    invoke-virtual {v0, v1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const v0, 0x7f0c000d

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->leftHeader:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->leftHeader:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0c000e

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->rightHeader:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->rightHeader:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mlistView:Landroid/widget/ListView;

    invoke-virtual {v0, v1, v4, v3}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mlistView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoading:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mlistView:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mlistView:Landroid/widget/ListView;

    invoke-direct {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->initAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    const v0, 0x7f0c000f

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/CategoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ViewAnimator;

    iput-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    return-void
.end method

.method private updateNavigationTitle(Ljava/lang/String;Z)V
    .locals 2

    const/4 v1, 0x0

    const v0, 0x7f0c009e

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/CategoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    if-eqz p2, :cond_0

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0200c0

    invoke-virtual {p0, v0, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v1, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    const/4 v1, 0x2

    const/16 v2, 0x8

    const/4 v4, 0x1

    const/4 v3, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :goto_0
    return-void

    :sswitch_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u5206\u7c7b"

    aput-object v2, v1, v3

    const-string v2, "\u70b9\u51fb\u88c5\u673a\u5fc5\u5907"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/InstallNecessaryActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/CategoryActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :sswitch_1
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u5206\u7c7b"

    aput-object v2, v1, v3

    const-string v2, "\u70b9\u51fb\u4e13\u9898"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    sget-object v1, Lcom/mappn/gfan/ui/CategoryActivity;->sLeftOutAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    sget-object v1, Lcom/mappn/gfan/ui/CategoryActivity;->sRighttInAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/CategoryActivity;->initListView(Ljava/util/ArrayList;)V

    const v0, 0x7f090043

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/CategoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mSecondLevelTitle:Ljava/lang/String;

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mSecondLevelTitle:Ljava/lang/String;

    invoke-direct {p0, v0, v4}, Lcom/mappn/gfan/ui/CategoryActivity;->updateNavigationTitle(Ljava/lang/String;Z)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mappn/gfan/common/MarketAPI;->getTopic(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v0}, Landroid/widget/ViewAnimator;->showNext()V

    iget v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentLevel:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentLevel:I

    const/4 v0, 0x5

    iput v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    goto :goto_0

    :sswitch_2
    iget v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    if-ne v0, v4, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mappn/gfan/common/MarketAPI;->getAllCategory(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingNoData2:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingProgress2:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mTopicId:Ljava/lang/String;

    const/16 v2, 0x64

    invoke-static {v0, p0, v1, v2, v3}, Lcom/mappn/gfan/common/MarketAPI;->getRecommendProducts(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;II)V

    goto/16 :goto_0

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingNoData1:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingProgress1:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mappn/gfan/common/MarketAPI;->getTopic(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    goto/16 :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0c000d -> :sswitch_0
        0x7f0c000e -> :sswitch_1
        0x7f0c0056 -> :sswitch_2
    .end sparse-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f030008

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/CategoryActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->width:I

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mInflater:Landroid/view/LayoutInflater;

    invoke-direct {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->initAnimation()V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->initTopBar()V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->initView()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mappn/gfan/common/MarketAPI;->getAllCategory(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    return-void
.end method

.method public onError(II)V
    .locals 3

    const/16 v2, 0x8

    const/4 v1, 0x0

    const/16 v0, 0x25

    if-ne p1, v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const/16 v0, 0xa

    if-ne p1, v0, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingNoData1:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingProgress1:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0

    :cond_2
    const/16 v0, 0xd

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingNoData2:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mLoadingProgress2:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    const/4 v8, 0x6

    const/4 v7, 0x4

    const/4 v6, 0x0

    const/4 v3, 0x2

    const/4 v5, 0x1

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    sget-object v1, Lcom/mappn/gfan/ui/CategoryActivity;->sLeftOutAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    sget-object v1, Lcom/mappn/gfan/ui/CategoryActivity;->sRighttInAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    iget v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    if-ne v0, v5, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mlistView:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v1

    sub-int v1, p3, v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "category_name"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mSecondLevelTitle:Ljava/lang/String;

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mSecondLevelTitle:Ljava/lang/String;

    invoke-direct {p0, v1, v5}, Lcom/mappn/gfan/ui/CategoryActivity;->updateNavigationTitle(Ljava/lang/String;Z)V

    const-string v1, "category_id"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-direct {p0, v1}, Lcom/mappn/gfan/ui/CategoryActivity;->initAppListView(Ljava/lang/String;)V

    const/4 v0, 0x3

    iput v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    :goto_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/String;

    const-string v2, "\u5206\u7c7b"

    aput-object v2, v1, v6

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u70b9\u51fb\u5206\u7c7b->"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mSecondLevelTitle:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    :cond_0
    :goto_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v0}, Landroid/widget/ViewAnimator;->showNext()V

    iget v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentLevel:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentLevel:I

    :goto_2
    return-void

    :cond_1
    const-string v1, "sub_category"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/CategoryActivity;->initListView(Ljava/util/ArrayList;)V

    iput v3, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    goto :goto_0

    :cond_2
    iget v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    if-ne v0, v3, :cond_3

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListAdapterLevel1:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0, p3}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "category_name"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mThirdLevelTitle:Ljava/lang/String;

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mThirdLevelTitle:Ljava/lang/String;

    invoke-direct {p0, v1, v5}, Lcom/mappn/gfan/ui/CategoryActivity;->updateNavigationTitle(Ljava/lang/String;Z)V

    const-string v1, "category_id"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/CategoryActivity;->initAppListView(Ljava/lang/String;)V

    iput v7, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/String;

    const-string v2, "\u5206\u7c7b"

    aput-object v2, v1, v6

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u70b9\u51fb\u5206\u7c7b->"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mThirdLevelTitle:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    iget v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    if-eq v0, v7, :cond_4

    iget v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_6

    :cond_4
    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListAdapterLevel1:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0, p3}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "category_name"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mThirdLevelTitle:Ljava/lang/String;

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mThirdLevelTitle:Ljava/lang/String;

    invoke-direct {p0, v1, v5}, Lcom/mappn/gfan/ui/CategoryActivity;->updateNavigationTitle(Ljava/lang/String;Z)V

    const-string v1, "category_id"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v2, v3, [Ljava/lang/String;

    const-string v3, "\u5206\u7c7b"

    aput-object v3, v2, v6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u70b9\u51fb\u5206\u7c7b->"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mThirdLevelTitle:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v0, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/mappn/gfan/ui/CategoryActivity;->initAppListView(Ljava/lang/String;)V

    iput v7, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    goto/16 :goto_1

    :cond_5
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/String;

    const-string v3, "\u5206\u7c7b"

    aput-object v3, v2, v6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u70b9\u51fb\u4e13\u9898->"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mThirdLevelTitle:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    const-string v1, "id"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mTopicId:Ljava/lang/String;

    invoke-direct {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->initTopicProducts()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mTopicId:Ljava/lang/String;

    const/16 v2, 0x64

    invoke-static {v0, p0, v1, v2, v6}, Lcom/mappn/gfan/common/MarketAPI;->getRecommendProducts(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;II)V

    iput v8, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    goto/16 :goto_1

    :cond_6
    iget v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    if-ne v0, v8, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListAdapterLevel2:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0, p3}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "packagename"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/mappn/gfan/ui/PreloadActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "extra.key.package.name"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/CategoryActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 6

    const/4 v5, 0x5

    const/4 v4, 0x4

    const/4 v3, 0x2

    const/4 v2, 0x1

    if-ne v4, p1, :cond_6

    iget v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentLevel:I

    if-lez v0, :cond_6

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    sget-object v1, Lcom/mappn/gfan/ui/CategoryActivity;->sRightOutAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    sget-object v1, Lcom/mappn/gfan/ui/CategoryActivity;->sLeftInAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    iget v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    if-ne v0, v4, :cond_3

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mSecondLevelTitle:Ljava/lang/String;

    invoke-direct {p0, v0, v2}, Lcom/mappn/gfan/ui/CategoryActivity;->updateNavigationTitle(Ljava/lang/String;Z)V

    iput v3, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mTabHost:Landroid/widget/TabHost;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getLocalActivityManager()Landroid/app/LocalActivityManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/LocalActivityManager;->removeAllActivities()V

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v0}, Landroid/widget/ViewAnimator;->showPrevious()V

    iget v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentLevel:I

    sub-int v1, v0, v2

    iput v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentLevel:I

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v1, v0}, Landroid/widget/ViewAnimator;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mViewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v1, v0}, Landroid/widget/ViewAnimator;->removeViewAt(I)V

    :cond_2
    move v0, v2

    :goto_1
    return v0

    :cond_3
    iget v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_4

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mSecondLevelTitle:Ljava/lang/String;

    invoke-direct {p0, v0, v2}, Lcom/mappn/gfan/ui/CategoryActivity;->updateNavigationTitle(Ljava/lang/String;Z)V

    iput v5, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    goto :goto_0

    :cond_4
    iget v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    if-eq v0, v3, :cond_5

    iget v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_5

    iget v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    if-ne v0, v5, :cond_0

    :cond_5
    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mTopLevelTitle:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/ui/CategoryActivity;->updateNavigationTitle(Ljava/lang/String;Z)V

    iput v2, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mCurrentViewType:I

    goto :goto_0

    :cond_6
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_1
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onPause()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onResume()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/CategoryActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 2

    const/16 v0, 0x25

    if-ne p1, v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Lcom/mappn/gfan/common/widget/AppListAdapter;->addData(Ljava/util/ArrayList;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const/16 v0, 0xa

    if-ne p1, v0, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListAdapterLevel1:Lcom/mappn/gfan/common/widget/AppListAdapter;

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Lcom/mappn/gfan/common/widget/AppListAdapter;->addData(Ljava/util/ArrayList;)V

    goto :goto_0

    :cond_2
    const/16 v0, 0xd

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity;->mListAdapterLevel2:Lcom/mappn/gfan/common/widget/AppListAdapter;

    check-cast p2, Ljava/util/HashMap;

    const-string v1, "product_list"

    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->addData(Ljava/util/ArrayList;)V

    goto :goto_0
.end method
