.class public Lcom/mappn/gfan/ui/RecommendDiscussActivity;
.super Lcom/mappn/gfan/common/widget/LazyloadListActivity;

# interfaces
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;


# instance fields
.field private mComment:Landroid/widget/EditText;

.field private mCommentAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

.field private mCommentView:Landroid/widget/LinearLayout;

.field private mHeaderView:Landroid/widget/FrameLayout;

.field private mInfoLayout:Landroid/widget/RelativeLayout;

.field private mLoading:Landroid/widget/FrameLayout;

.field private mNoData:Landroid/widget/TextView;

.field private mProgress:Landroid/widget/ProgressBar;

.field private mSend:Landroid/widget/Button;

.field private mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

.field private mTotalSize:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;-><init>()V

    return-void
.end method

.method private addMyComment()V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mComment:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "content"

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "author"

    iget-object v2, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v2}, Lcom/mappn/gfan/Session;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/mappn/gfan/common/util/Utils;->formatTime(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mTotalSize:I

    if-gtz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mCommentAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->clearData()V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mCommentAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->insertData(Ljava/util/HashMap;)V

    return-void
.end method

.method private handlePostError(I)V
    .locals 3

    const/4 v2, 0x0

    sparse-switch p1, :sswitch_data_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900c0

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    :goto_0
    return-void

    :sswitch_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900bb

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    :sswitch_1
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900bc

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    :sswitch_2
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900bd

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getString(I)Ljava/lang/String;

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
    .locals 4

    const/4 v3, 0x0

    const v0, 0x7f0c000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mLoading:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mLoading:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0004

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mProgress:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mProgress:Landroid/widget/ProgressBar;

    new-instance v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mLoading:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0056

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mNoData:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mList:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mLoading:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    const v0, 0x7f0c0058

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mCommentView:Landroid/widget/LinearLayout;

    const v0, 0x7f0c0017

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mComment:Landroid/widget/EditText;

    const v0, 0x7f0c0018

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mSend:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mSend:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isLogin()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030052

    iget-object v2, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mHeaderView:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mHeaderView:Landroid/widget/FrameLayout;

    const v1, 0x7f0c008a

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mInfoLayout:Landroid/widget/RelativeLayout;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mInfoLayout:Landroid/widget/RelativeLayout;

    const v1, 0x7f0c0010

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f020070

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mInfoLayout:Landroid/widget/RelativeLayout;

    const v1, 0x7f0c0003

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f0900c3

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mInfoLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mHeaderView:Landroid/widget/FrameLayout;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mCommentView:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mCommentView:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method private refreshHeaderFooterView()V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isLogin()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mHeaderView:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mHeaderView:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->removeHeaderView(Landroid/view/View;)Z

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mCommentView:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_1
    return-void
.end method


# virtual methods
.method public doInitListAdapter()Lcom/mappn/gfan/common/widget/AppListAdapter;
    .locals 8

    const/4 v7, 0x3

    new-instance v0, Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getApplicationContext()Landroid/content/Context;

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

    const-string v6, "content"

    aput-object v6, v4, v5

    new-array v5, v7, [I

    fill-array-data v5, :array_0

    invoke-direct/range {v0 .. v5}, Lcom/mappn/gfan/common/widget/AppListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mCommentAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mCommentAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0, p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setActivity(Landroid/app/Activity;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mCommentAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    return-object v0

    :array_0
    .array-data 0x4
        0x6ct 0x0t 0xct 0x7ft
        0x23t 0x0t 0xct 0x7ft
        0x6dt 0x0t 0xct 0x7ft
    .end array-data
.end method

.method public doInitView(Landroid/os/Bundle;)Z
    .locals 2

    const v0, 0x7f03003f

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "extra.recommend.detail"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/RecommendTopic;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    invoke-direct {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->initViews()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->lazyload()V

    const/4 v0, 0x1

    return v0
.end method

.method public doLazyload()V
    .locals 4

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getItemsPerPage()I

    move-result v1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getStartIndex()I

    move-result v2

    iget-object v3, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    iget-object v3, v3, Lcom/mappn/gfan/common/vo/RecommendTopic;->id:Ljava/lang/String;

    invoke-static {v0, p0, v1, v2, v3}, Lcom/mappn/gfan/common/MarketAPI;->getMasterRecommendDiscuss(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;IILjava/lang/String;)V

    return-void
.end method

.method protected getItemCount()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mTotalSize:I

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    const/4 v3, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->onClick(Landroid/view/View;)V

    :goto_0
    return-void

    :sswitch_0
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/LoginActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :sswitch_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mComment:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900c1

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v3}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mSend:Landroid/widget/Button;

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    iget-object v2, v2, Lcom/mappn/gfan/common/vo/RecommendTopic;->id:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, p0, v2, v0}, Lcom/mappn/gfan/common/MarketAPI;->addMasterRecommendDiscuss(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u8be6\u60c5"

    aput-object v2, v1, v3

    const/4 v2, 0x1

    const-string v3, "\u53d1\u8868\u8bc4\u8bba"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto :goto_0

    :sswitch_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mNoData:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->lazyload()V

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x7f0c0018 -> :sswitch_1
        0x7f0c0056 -> :sswitch_2
        0x7f0c008a -> :sswitch_0
    .end sparse-switch
.end method

.method public onError(II)V
    .locals 3

    const/4 v2, 0x0

    const/16 v0, 0x2e

    if-ne p1, v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mSend:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-direct {p0, p2}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->handlePostError(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const/16 v0, 0x2d

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mProgress:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->setLoadResult(Z)V

    goto :goto_0
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->onPause()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->onResume()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->refreshHeaderFooterView()V

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 4

    const/4 v3, 0x1

    const/16 v0, 0x2d

    if-ne p1, v0, :cond_2

    check-cast p2, Ljava/util/HashMap;

    const-string v0, "total_size"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mTotalSize:I

    iget v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mTotalSize:I

    if-lez v0, :cond_1

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mCommentAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    const-string v0, "comment_list"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->addData(Ljava/util/ArrayList;)V

    :goto_0
    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->setLoadResult(Z)V

    :cond_0
    :goto_1
    return-void

    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "content"

    const v2, 0x7f0900b8

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mCommentAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->addData(Ljava/util/HashMap;)V

    goto :goto_0

    :cond_2
    const/16 v0, 0x2e

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mSend:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->addMyComment()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->mComment:Landroid/widget/EditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900b5

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/RecommendDiscussActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_1
.end method
