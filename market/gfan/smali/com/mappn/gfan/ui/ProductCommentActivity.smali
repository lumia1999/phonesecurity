.class public Lcom/mappn/gfan/ui/ProductCommentActivity;
.super Lcom/mappn/gfan/common/widget/LazyloadListActivity;

# interfaces
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;


# static fields
.field private static final REFRESH_RATING:I = 0x1


# instance fields
.field private lastRatingTime:J

.field private mComment:Landroid/widget/EditText;

.field private mCommentAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

.field private mCommentView:Landroid/widget/LinearLayout;

.field private mHandler:Landroid/os/Handler;

.field private mHasRating:Z

.field private mInfoLayout:Landroid/widget/RelativeLayout;

.field private mIsRating:Z

.field private mMyRating:Landroid/widget/RatingBar;

.field private mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

.field private mRanking:Landroid/widget/TextView;

.field private mRatingLayout:Landroid/widget/RelativeLayout;

.field private mSend:Landroid/widget/Button;

.field private mTotalSize:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;-><init>()V

    new-instance v0, Lcom/mappn/gfan/ui/ProductCommentActivity$1;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/ProductCommentActivity$1;-><init>(Lcom/mappn/gfan/ui/ProductCommentActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/mappn/gfan/ui/ProductCommentActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->refreshRatingView()V

    return-void
.end method

.method static synthetic access$100(Lcom/mappn/gfan/ui/ProductCommentActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mappn/gfan/ui/ProductCommentActivity;)Landroid/widget/TextView;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mRanking:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mappn/gfan/ui/ProductCommentActivity;)J
    .locals 2

    iget-wide v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->lastRatingTime:J

    return-wide v0
.end method

.method static synthetic access$302(Lcom/mappn/gfan/ui/ProductCommentActivity;J)J
    .locals 0

    iput-wide p1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->lastRatingTime:J

    return-wide p1
.end method

.method static synthetic access$400(Lcom/mappn/gfan/ui/ProductCommentActivity;)Lcom/mappn/gfan/common/vo/ProductDetail;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mappn/gfan/ui/ProductCommentActivity;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mappn/gfan/ui/ProductCommentActivity;)Landroid/widget/EditText;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mComment:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$700(Lcom/mappn/gfan/ui/ProductCommentActivity;)Landroid/widget/Button;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mSend:Landroid/widget/Button;

    return-object v0
.end method

.method private addMyComment()V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mComment:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "comment"

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "author"

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v2}, Lcom/mappn/gfan/Session;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/mappn/gfan/common/util/Utils;->formatTime(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mTotalSize:I

    if-gtz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mCommentAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->clearData()V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mCommentAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->insertData(Ljava/util/HashMap;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/ui/ProductDetailActivity;

    iget v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mTotalSize:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mTotalSize:I

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/ProductDetailActivity;->changeCommentCount(I)V

    return-void
.end method

.method private handlePostError(I)V
    .locals 3

    const/4 v2, 0x0

    sparse-switch p1, :sswitch_data_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900c0

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    :goto_0
    return-void

    :sswitch_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900bb

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    :sswitch_1
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900bc

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    :sswitch_2
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900bd

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0xe1 -> :sswitch_1
        0xe8 -> :sswitch_0
        0xe9 -> :sswitch_2
    .end sparse-switch
.end method

.method private initViews()V
    .locals 5

    const/4 v4, 0x0

    const v0, 0x7f0c000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    const v1, 0x7f0c0004

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    new-instance v2, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    const v1, 0x102000a

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ProductCommentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030052

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, v1, v2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    const v1, 0x7f0c0086

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mRatingLayout:Landroid/widget/RelativeLayout;

    const v1, 0x7f0c008a

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mInfoLayout:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mInfoLayout:Landroid/widget/RelativeLayout;

    new-instance v2, Lcom/mappn/gfan/ui/ProductCommentActivity$2;

    invoke-direct {v2, p0}, Lcom/mappn/gfan/ui/ProductCommentActivity$2;-><init>(Lcom/mappn/gfan/ui/ProductCommentActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f0c0088

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RatingBar;

    iput-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mMyRating:Landroid/widget/RatingBar;

    const v1, 0x7f0c0089

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mRanking:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mMyRating:Landroid/widget/RatingBar;

    new-instance v2, Lcom/mappn/gfan/ui/ProductCommentActivity$3;

    invoke-direct {v2, p0}, Lcom/mappn/gfan/ui/ProductCommentActivity$3;-><init>(Lcom/mappn/gfan/ui/ProductCommentActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/RatingBar;->setOnRatingBarChangeListener(Landroid/widget/RatingBar$OnRatingBarChangeListener;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mList:Landroid/widget/ListView;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2, v4}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    const v0, 0x7f0c0058

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mCommentView:Landroid/widget/LinearLayout;

    const v0, 0x7f0c0017

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mComment:Landroid/widget/EditText;

    const v0, 0x7f0c0018

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mSend:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mSend:Landroid/widget/Button;

    new-instance v1, Lcom/mappn/gfan/ui/ProductCommentActivity$4;

    invoke-direct {v1, p0}, Lcom/mappn/gfan/ui/ProductCommentActivity$4;-><init>(Lcom/mappn/gfan/ui/ProductCommentActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->refreshHeaderFooterView()V

    return-void
.end method

.method private refreshHeaderFooterView()V
    .locals 6

    const v5, 0x7f0c0010

    const v4, 0x7f0c0003

    const/16 v3, 0x8

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isLogin()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getInstalledApps()Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mInfoLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mRatingLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    :goto_0
    iget-boolean v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mHasRating:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mHasRating:Z

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPid()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p0, v0}, Lcom/mappn/gfan/common/MarketAPI;->getMyRating(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mCommentView:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :goto_1
    return-void

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mInfoLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mRatingLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mInfoLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v5}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f020034

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mInfoLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f0900c2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mInfoLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mRatingLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mInfoLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v5}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f020070

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mInfoLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f0900c3

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mCommentView:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_1
.end method

.method private refreshRatingView()V
    .locals 2

    iget-boolean v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mIsRating:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mInfoLayout:Landroid/widget/RelativeLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mRatingLayout:Landroid/widget/RelativeLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    :cond_0
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->lastRatingTime:J

    return-void
.end method


# virtual methods
.method public doInitListAdapter()Lcom/mappn/gfan/common/widget/AppListAdapter;
    .locals 8

    const/4 v7, 0x3

    new-instance v0, Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    const v3, 0x7f030045

    new-array v4, v7, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "author"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "date"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "comment"

    aput-object v6, v4, v5

    new-array v5, v7, [I

    fill-array-data v5, :array_0

    invoke-direct/range {v0 .. v5}, Lcom/mappn/gfan/common/widget/AppListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mCommentAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mCommentAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0, p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setActivity(Landroid/app/Activity;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mCommentAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    return-object v0

    :array_0
    .array-data 0x4
        0x6ct 0x0t 0xct 0x7ft
        0x23t 0x0t 0xct 0x7ft
        0x6dt 0x0t 0xct 0x7ft
    .end array-data
.end method

.method public doInitView(Landroid/os/Bundle;)Z
    .locals 5

    const/4 v4, 0x1

    const v0, 0x7f03003f

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "\u8be6\u60c5"

    aput-object v3, v1, v2

    const-string v2, "\u67e5\u770b\u8bc4\u8bba"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "extra.product.detail"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/ProductDetail;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-direct {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->initViews()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->doLazyload()V

    return v4
.end method

.method public doLazyload()V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPid()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getItemsPerPage()I

    move-result v1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getStartIndex()I

    move-result v2

    invoke-static {p0, p0, v0, v1, v2}, Lcom/mappn/gfan/common/MarketAPI;->getComments(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;II)V

    return-void
.end method

.method protected getItemCount()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mTotalSize:I

    return v0
.end method

.method protected onDestroy()V
    .locals 1

    const/4 v0, 0x0

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->onDestroy()V

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mCommentAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mMyRating:Landroid/widget/RatingBar;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mRanking:Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mRatingLayout:Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mInfoLayout:Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mComment:Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mSend:Landroid/widget/Button;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mCommentView:Landroid/widget/LinearLayout;

    return-void
.end method

.method public onError(II)V
    .locals 3

    const/4 v2, 0x0

    sparse-switch p1, :sswitch_data_0

    :goto_0
    const-string v0, "error"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "status code "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :sswitch_0
    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/ProductCommentActivity;->setLoadResult(Z)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900ba

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    :sswitch_1
    iput-boolean v2, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mHasRating:Z

    goto :goto_0

    :sswitch_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mSend:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-direct {p0, p2}, Lcom/mappn/gfan/ui/ProductCommentActivity;->handlePostError(I)V

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_0
        0x3 -> :sswitch_2
        0x8 -> :sswitch_1
    .end sparse-switch
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->onPause()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->onResume()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->refreshHeaderFooterView()V

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 4

    const/4 v3, 0x1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    packed-switch p1, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    :pswitch_1
    instance-of v0, p2, Ljava/util/HashMap;

    if-eqz v0, :cond_0

    check-cast p2, Ljava/util/HashMap;

    const-string v0, "total_size"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mTotalSize:I

    iget v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mTotalSize:I

    if-lez v0, :cond_2

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mCommentAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    const-string v0, "comment_list"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->addData(Ljava/util/ArrayList;)V

    :goto_1
    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/ProductCommentActivity;->setLoadResult(Z)V

    goto :goto_0

    :cond_2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "comment"

    const v2, 0x7f0900b8

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mCommentAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->addData(Ljava/util/HashMap;)V

    goto :goto_1

    :pswitch_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    check-cast p2, Ljava/lang/String;

    invoke-static {p2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mMyRating:Landroid/widget/RatingBar;

    int-to-float v0, v0

    invoke-virtual {v1, v0}, Landroid/widget/RatingBar;->setRating(F)V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mRanking:Landroid/widget/TextView;

    const v1, 0x7f0900b4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :pswitch_4
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mSend:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->addMyComment()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity;->mComment:Landroid/widget/EditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900b5

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
