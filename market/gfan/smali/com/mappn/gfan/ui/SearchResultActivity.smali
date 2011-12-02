.class public Lcom/mappn/gfan/ui/SearchResultActivity;
.super Lcom/mappn/gfan/common/widget/LazyloadListActivity;

# interfaces
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;


# static fields
.field private static final STATUS_INIT:I = 0x0

.field private static final STATUS_LOADING:I = 0x1

.field private static final STATUS_NODATA:I = 0x2

.field private static final STATUS_RETRY:I = 0x3


# instance fields
.field private mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

.field private mEndPosition:I

.field private mKeywords:Ljava/lang/String;

.field private mLoading:Landroid/widget/FrameLayout;

.field private mNoData:Landroid/widget/TextView;

.field private mProgress:Landroid/widget/ProgressBar;

.field private mSearchType:I

.field private mTotalSize:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;-><init>()V

    return-void
.end method

.method private switchHintStatus(I)V
    .locals 4

    const/16 v3, 0x8

    const/4 v2, 0x0

    packed-switch p1, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setClickable(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mNoData:Landroid/widget/TextView;

    const v1, 0x7f09000e

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setClickable(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setClickable(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mNoData:Landroid/widget/TextView;

    const v1, 0x7f09000d

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mNoData:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setClickable(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mNoData:Landroid/widget/TextView;

    const v1, 0x7f020015

    invoke-virtual {v0, v2, v1, v2, v2}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mNoData:Landroid/widget/TextView;

    const v1, 0x7f0900a4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method public doInitListAdapter()Lcom/mappn/gfan/common/widget/AppListAdapter;
    .locals 10

    const/4 v2, 0x0

    const/4 v9, 0x7

    const/4 v8, 0x0

    const/4 v7, 0x1

    iget v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mSearchType:I

    if-nez v0, :cond_0

    new-instance v0, Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f030055

    new-array v4, v9, [Ljava/lang/String;

    const-string v5, "icon_url"

    aput-object v5, v4, v8

    const-string v5, "name"

    aput-object v5, v4, v7

    const/4 v5, 0x2

    const-string v6, "author_name"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "price"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string v6, "rating"

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const-string v6, "product_download"

    aput-object v6, v4, v5

    const/4 v5, 0x6

    const-string v6, "source_type"

    aput-object v6, v4, v5

    new-array v5, v9, [I

    fill-array-data v5, :array_0

    invoke-direct/range {v0 .. v5}, Lcom/mappn/gfan/common/widget/AppListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setProductList()V

    :goto_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    return-object v0

    :cond_0
    new-instance v0, Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f030026

    new-array v4, v7, [Ljava/lang/String;

    const-string v5, "search_result_title"

    aput-object v5, v4, v8

    new-array v5, v7, [I

    const v6, 0x7f0c0002

    aput v6, v5, v8

    invoke-direct/range {v0 .. v5}, Lcom/mappn/gfan/common/widget/AppListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0, v7}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setContainsPlaceHolder(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    const v1, 0x7f030012

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setPlaceHolderResource(I)V

    goto :goto_0

    nop

    :array_0
    .array-data 0x4
        0x1t 0x0t 0xct 0x7ft
        0x2t 0x0t 0xct 0x7ft
        0x20t 0x0t 0xct 0x7ft
        0x3t 0x0t 0xct 0x7ft
        0x4et 0x0t 0xct 0x7ft
        0x4ft 0x0t 0xct 0x7ft
        0x92t 0x0t 0xct 0x7ft
    .end array-data
.end method

.method public doInitView(Landroid/os/Bundle;)Z
    .locals 4

    const/4 v3, 0x0

    const v0, 0x7f030034

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/SearchResultActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "extra.search.type"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mSearchType:I

    const v0, 0x7f0c000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/SearchResultActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mLoading:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mLoading:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0004

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mProgress:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mProgress:Landroid/widget/ProgressBar;

    new-instance v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mLoading:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0056

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mNoData:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0, v3}, Lcom/mappn/gfan/ui/SearchResultActivity;->switchHintStatus(I)V

    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/SearchResultActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mList:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mList:Landroid/widget/ListView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mLoading:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    const/4 v0, 0x1

    return v0
.end method

.method public doLazyload()V
    .locals 6

    iget v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mSearchType:I

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getItemsPerPage()I

    move-result v2

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getStartIndex()I

    move-result v3

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mKeywords:Ljava/lang/String;

    move-object v1, p0

    invoke-static/range {v0 .. v5}, Lcom/mappn/gfan/common/MarketAPI;->search(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;IIILjava/lang/String;)V

    :goto_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/SearchResultActivity;->switchHintStatus(I)V

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mKeywords:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getStartIndex()I

    move-result v2

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getItemsPerPage()I

    move-result v3

    invoke-static {v0, p0, v1, v2, v3}, Lcom/mappn/gfan/common/MarketAPI;->getSearchFromBBS(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;II)V

    goto :goto_0
.end method

.method public getEndIndex()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mEndPosition:I

    return v0
.end method

.method protected getItemCount()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mTotalSize:I

    return v0
.end method

.method public onError(II)V
    .locals 1

    const/16 v0, 0x262

    if-ne p2, v0, :cond_1

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/SearchResultActivity;->switchHintStatus(I)V

    :cond_0
    :goto_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/SearchResultActivity;->setLoadResult(Z)V

    return-void

    :cond_1
    const/16 v0, 0x258

    if-ne p2, v0, :cond_0

    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/SearchResultActivity;->switchHintStatus(I)V

    goto :goto_0
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

    const/4 v6, 0x1

    const/4 v5, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0, p3}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    iget v1, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mSearchType:I

    if-nez v1, :cond_0

    const-string v1, "p_id"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    new-instance v2, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-class v4, Lcom/mappn/gfan/ui/PreloadActivity;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v3, "extra.key.pid"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "extra.key.source.type"

    const-string v3, "source_type"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/SearchResultActivity;->startActivity(Landroid/content/Intent;)V

    :goto_0
    return-void

    :cond_0
    const-string v1, "downloadUrl"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "search_result_title"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v2, Lcom/mappn/gfan/common/download/DownloadManager$Request;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/mappn/gfan/common/download/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    invoke-virtual {v2, v0}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setTitle(Ljava/lang/CharSequence;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    invoke-virtual {v2, v6}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setSourceType(I)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getDownloadManager()Lcom/mappn/gfan/common/download/DownloadManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v2, v4}, Lcom/mappn/gfan/common/download/DownloadManager;->enqueue(Landroid/content/Context;Lcom/mappn/gfan/common/download/DownloadManager$Request;Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v2, 0x7f09000f

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/SearchResultActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v5}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "\u641c\u7d22"

    aput-object v3, v2, v5

    const-string v3, "\u9644\u4ef6\u4e0b\u8f7d"

    aput-object v3, v2, v6

    invoke-static {v0, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v3, v2, v5

    const-string v3, "\u4e0b\u8f7d\u5f00\u59cb"

    aput-object v3, v2, v6

    invoke-static {v0, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, ""

    invoke-static {v0, v5, v6, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->submitDownloadLog(Landroid/content/Context;IILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->resetSearchResult()V

    :cond_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->onPause()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->onResume()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 4

    const/4 v3, 0x2

    const/4 v2, 0x1

    const/4 v1, 0x0

    sparse-switch p1, :sswitch_data_0

    :goto_0
    return-void

    :sswitch_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    check-cast p2, Ljava/util/HashMap;

    const-string v0, "total_size"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mTotalSize:I

    const-string v0, "end_position"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mEndPosition:I

    iget v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mTotalSize:I

    if-lez v0, :cond_0

    const-string v0, "product_list"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->addData(Ljava/util/ArrayList;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/ui/SearchActivity;

    iget v1, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mTotalSize:I

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/SearchActivity;->updateMarketResultNumber(I)V

    :goto_1
    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/SearchResultActivity;->setLoadResult(Z)V

    goto :goto_0

    :cond_0
    invoke-direct {p0, v3}, Lcom/mappn/gfan/ui/SearchResultActivity;->switchHintStatus(I)V

    goto :goto_1

    :sswitch_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    check-cast p2, Ljava/util/HashMap;

    const-string v0, "total_size"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mTotalSize:I

    const-string v0, "end_position"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mEndPosition:I

    iget v0, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mTotalSize:I

    if-lez v0, :cond_1

    const-string v0, "bbsAttJkVOList"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->addData(Ljava/util/ArrayList;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/ui/SearchActivity;

    iget v1, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mTotalSize:I

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/SearchActivity;->updateBbsResultNumber(I)V

    :goto_2
    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/SearchResultActivity;->setLoadResult(Z)V

    goto/16 :goto_0

    :cond_1
    invoke-direct {p0, v3}, Lcom/mappn/gfan/ui/SearchResultActivity;->switchHintStatus(I)V

    goto :goto_2

    :sswitch_data_0
    .sparse-switch
        0xb -> :sswitch_0
        0x27 -> :sswitch_1
    .end sparse-switch
.end method

.method public resetSearchResult()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/SearchResultActivity;->switchHintStatus(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->reset()V

    return-void
.end method

.method public setSearchKeyword(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/SearchResultActivity;->mKeywords:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SearchResultActivity;->resetSearchResult()V

    return-void
.end method
