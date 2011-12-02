.class public Lcom/mappn/gfan/ui/SearchActivity;
.super Lcom/mappn/gfan/common/widget/BaseTabActivity;

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnFocusChangeListener;
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;


# static fields
.field private static final MARGIN_LEFT_RIGHT:I = 0xf

.field private static final MARGIN_TOP_BOTTOM:I = 0x14

.field private static final PADING_LEFT_RIGHT:I = 0x14

.field private static final PADING_TOP_BOTTOM:I = 0xf

.field private static final TAB_BBS_ID:Ljava/lang/String; = "bbs"

.field private static final TAB_PRODUCT_ID:Ljava/lang/String; = "product"

.field private static sHotBackgound:[I


# instance fields
.field private mAutoCompleteTextView:Landroid/widget/AutoCompleteTextView;

.field private mHistory:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mKeywordsLayout:Landroid/widget/LinearLayout;

.field private mSearchHistoryAdapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mTabHost:Landroid/widget/TabHost;

.field private searchBtn:Landroid/widget/ImageButton;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseTabActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/mappn/gfan/ui/SearchActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/SearchActivity;->doSearch()V

    return-void
.end method

.method private createTextView(ILjava/lang/String;)Landroid/widget/TextView;
    .locals 5

    const/4 v1, -0x2

    const/16 v4, 0x14

    const/16 v3, 0xf

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    new-instance v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v0, 0x10

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget-object v0, Lcom/mappn/gfan/ui/SearchActivity;->sHotBackgound:[I

    aget v0, v0, p1

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setBackgroundResource(I)V

    invoke-virtual {v1, v4, v3, v4, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v2, 0x7f0a0009

    invoke-virtual {v1, v0, v2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setFocusableInTouchMode(Z)V

    const/16 v0, 0x11

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setGravity(I)V

    return-object v1
.end method

.method private doSearch()V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mAutoCompleteTextView:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/SearchActivity;->resetCurrentActivity()V

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1}, Landroid/widget/TabHost;->isShown()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v3}, Landroid/widget/TabHost;->setVisibility(I)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/SearchActivity;->mKeywordsLayout:Landroid/widget/LinearLayout;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v2, "product"

    invoke-virtual {v1, v2}, Landroid/widget/TabHost;->setCurrentTabByTag(Ljava/lang/String;)V

    :cond_1
    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/SearchActivity;->storeToAdapter(Ljava/lang/String;)V

    invoke-direct {p0, v3}, Lcom/mappn/gfan/ui/SearchActivity;->toogleInputMethod(Z)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchActivity;->getCurrentActivity()Landroid/app/Activity;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/ui/SearchResultActivity;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/SearchResultActivity;->setSearchKeyword(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->lazyload()V

    goto :goto_0
.end method

.method private getHorizontalLinearLayout(Landroid/widget/LinearLayout$LayoutParams;)Landroid/widget/LinearLayout;
    .locals 2

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    return-object v0
.end method

.method private initData()V
    .locals 4

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/DBUtils;->querySearchHistory(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mHistory:Ljava/util/ArrayList;

    new-instance v0, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f030025

    iget-object v3, p0, Lcom/mappn/gfan/ui/SearchActivity;->mHistory:Ljava/util/ArrayList;

    invoke-direct {v0, v1, v2, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mSearchHistoryAdapter:Landroid/widget/ArrayAdapter;

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mAutoCompleteTextView:Landroid/widget/AutoCompleteTextView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/SearchActivity;->mSearchHistoryAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mAutoCompleteTextView:Landroid/widget/AutoCompleteTextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setThreshold(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mappn/gfan/common/MarketAPI;->getSearchKeywords(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    return-void
.end method

.method private initSearchKeywordsView(Ljava/util/ArrayList;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x1

    const/4 v2, -0x2

    invoke-direct {v1, v0, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v2

    const/4 v0, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v6, v0

    move-object v9, v3

    move v3, v4

    move-object v4, v9

    :goto_0
    if-ge v3, v5, :cond_1

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v3, v0}, Lcom/mappn/gfan/ui/SearchActivity;->createTextView(ILjava/lang/String;)Landroid/widget/TextView;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v8

    invoke-virtual {v8, v0}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v0

    const/high16 v8, 0x4220

    add-float/2addr v0, v8

    const/high16 v8, 0x41f0

    add-float/2addr v0, v8

    add-float/2addr v6, v0

    if-eqz v4, :cond_0

    int-to-float v8, v2

    cmpl-float v8, v6, v8

    if-lez v8, :cond_2

    :cond_0
    invoke-direct {p0, v1}, Lcom/mappn/gfan/ui/SearchActivity;->getHorizontalLinearLayout(Landroid/widget/LinearLayout$LayoutParams;)Landroid/widget/LinearLayout;

    move-result-object v4

    iget-object v6, p0, Lcom/mappn/gfan/ui/SearchActivity;->mKeywordsLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    move-object v9, v4

    move v4, v0

    move-object v0, v9

    :goto_1
    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v3, v3, 0x1

    move v6, v4

    move-object v4, v0

    goto :goto_0

    :cond_1
    return-void

    :cond_2
    move-object v0, v4

    move v4, v6

    goto :goto_1
.end method

.method private initTabView()V
    .locals 4

    const v0, 0x1020012

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/SearchActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TabHost;

    iput-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->setup()V

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/SearchResultActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "extra.search.type"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v2, "product"

    invoke-virtual {v1, v2}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090008

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/SearchActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mappn/gfan/common/util/Utils;->createSearchTabView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/SearchResultActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "extra.search.type"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v2, "bbs"

    invoke-virtual {v1, v2}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090009

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/SearchActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mappn/gfan/common/util/Utils;->createSearchTabView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    new-instance v1, Lcom/mappn/gfan/ui/SearchActivity$1;

    invoke-direct {v1, p0}, Lcom/mappn/gfan/ui/SearchActivity$1;-><init>(Lcom/mappn/gfan/ui/SearchActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    return-void
.end method

.method private initTopBar()V
    .locals 6

    const v5, 0x7f0c009a

    const/4 v4, 0x2

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v4, [Landroid/view/View;

    const/4 v2, 0x0

    const v3, 0x7f0c009f

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/SearchActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/ui/SearchActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    aput-object v3, v1, v2

    new-array v2, v4, [I

    fill-array-data v2, :array_0

    const-string v3, ""

    invoke-static {v0, v1, v2, v3}, Lcom/mappn/gfan/common/util/TopBar;->createTopBar(Landroid/content/Context;[Landroid/view/View;[ILjava/lang/String;)V

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/ui/SearchActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    nop

    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method private initView()V
    .locals 1

    const v0, 0x7f0c009a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/SearchActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->searchBtn:Landroid/widget/ImageButton;

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->searchBtn:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0c009f

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/SearchActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mAutoCompleteTextView:Landroid/widget/AutoCompleteTextView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mAutoCompleteTextView:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p0}, Landroid/widget/AutoCompleteTextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    const/16 v0, 0xf

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/mappn/gfan/ui/SearchActivity;->sHotBackgound:[I

    const v0, 0x7f0c0037

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/SearchActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mKeywordsLayout:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Lcom/mappn/gfan/ui/SearchActivity;->initTabView()V

    return-void

    :array_0
    .array-data 0x4
        0x5ct 0x0t 0x2t 0x7ft
        0x5ct 0x0t 0x2t 0x7ft
        0x5ct 0x0t 0x2t 0x7ft
        0x5dt 0x0t 0x2t 0x7ft
        0x5dt 0x0t 0x2t 0x7ft
        0x5dt 0x0t 0x2t 0x7ft
        0x5et 0x0t 0x2t 0x7ft
        0x5et 0x0t 0x2t 0x7ft
        0x5et 0x0t 0x2t 0x7ft
        0x5ft 0x0t 0x2t 0x7ft
        0x5ft 0x0t 0x2t 0x7ft
        0x5ft 0x0t 0x2t 0x7ft
        0x60t 0x0t 0x2t 0x7ft
        0x60t 0x0t 0x2t 0x7ft
        0x60t 0x0t 0x2t 0x7ft
    .end array-data
.end method

.method private resetCurrentActivity()V
    .locals 0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchActivity;->getCurrentActivity()Landroid/app/Activity;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/ui/SearchResultActivity;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->resetSearchResult()V

    return-void
.end method

.method private showTabView()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/SearchActivity;->resetCurrentActivity()V

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/SearchActivity;->updateMarketResultNumber(I)V

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/SearchActivity;->updateBbsResultNumber(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mKeywordsLayout:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void
.end method

.method private storeToAdapter(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mHistory:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mSearchHistoryAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/mappn/gfan/common/util/DBUtils;->addSearchItem(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mHistory:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mSearchHistoryAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method private toogleInputMethod(Z)V
    .locals 3

    const/4 v2, 0x0

    const-string v0, "input_method"

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/SearchActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/mappn/gfan/ui/SearchActivity;->mAutoCompleteTextView:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v1}, Landroid/widget/AutoCompleteTextView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInputFromInputMethod(Landroid/os/IBinder;I)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/SearchActivity;->showTabView()V

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lcom/mappn/gfan/ui/SearchActivity;->mAutoCompleteTextView:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v1}, Landroid/widget/AutoCompleteTextView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    goto :goto_0
.end method


# virtual methods
.method public getKeyword()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mAutoCompleteTextView:Landroid/widget/AutoCompleteTextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mAutoCompleteTextView:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5

    const/4 v1, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u641c\u7d22"

    aput-object v2, v1, v3

    const-string v2, "\u70b9\u51fb\u70ed\u95e8\u5173\u952e\u8bcd"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mAutoCompleteTextView:Landroid/widget/AutoCompleteTextView;

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/SearchActivity;->doSearch()V

    :goto_0
    return-void

    :pswitch_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u641c\u7d22"

    aput-object v2, v1, v3

    const-string v2, "\u70b9\u51fb\u641c\u7d22\u6309\u94ae"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/SearchActivity;->doSearch()V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x7f0c009a
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f030027

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/SearchActivity;->setContentView(I)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/SearchActivity;->initTopBar()V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/SearchActivity;->initView()V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/SearchActivity;->initData()V

    return-void
.end method

.method public onError(II)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "fetch keywords fail because of status "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    return-void
.end method

.method public onFocusChange(Landroid/view/View;Z)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    invoke-direct {p0, p2}, Lcom/mappn/gfan/ui/SearchActivity;->toogleInputMethod(Z)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x7f0c009f
        :pswitch_0
    .end packed-switch
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mAutoCompleteTextView:Landroid/widget/AutoCompleteTextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v1, "product"

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->setCurrentTabByTag(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->requestFocus()Z

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->setVisibility(I)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/SearchActivity;->resetCurrentActivity()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mKeywordsLayout:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 0

    packed-switch p1, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    check-cast p2, Ljava/util/ArrayList;

    invoke-direct {p0, p2}, Lcom/mappn/gfan/ui/SearchActivity;->initSearchKeywordsView(Ljava/util/ArrayList;)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x21
        :pswitch_0
    .end packed-switch
.end method

.method public setKeyword(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mAutoCompleteTextView:Landroid/widget/AutoCompleteTextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mAutoCompleteTextView:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p1}, Landroid/widget/AutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method updateBbsResultNumber(I)V
    .locals 5

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/TabWidget;->getChildTabViewAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-lez p1, :cond_1

    const v1, 0x7f09000b

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/mappn/gfan/ui/SearchActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_1
    const v1, 0x7f090009

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0
.end method

.method updateMarketResultNumber(I)V
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/widget/TabWidget;->getChildTabViewAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-lez p1, :cond_1

    const v1, 0x7f09000a

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p0, v1, v2}, Lcom/mappn/gfan/ui/SearchActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_1
    const v1, 0x7f090008

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0
.end method
