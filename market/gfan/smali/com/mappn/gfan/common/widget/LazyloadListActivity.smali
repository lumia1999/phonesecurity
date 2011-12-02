.class public abstract Lcom/mappn/gfan/common/widget/LazyloadListActivity;
.super Lcom/mappn/gfan/common/widget/BaseActivity;

# interfaces
.implements Lcom/mappn/gfan/common/widget/AppListAdapter$LazyloadListener;
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final ITEMS_PER_PAGE:I = 0x14


# instance fields
.field private mEndIndex:I

.field private mFooterLoading:Landroid/widget/ProgressBar;

.field private mFooterNoData:Landroid/widget/TextView;

.field private mFooterView:Landroid/widget/FrameLayout;

.field private mIsLoadOver:Z

.field private mItemsPerPage:I

.field protected mList:Landroid/widget/ListView;

.field private mStartIndex:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mStartIndex:I

    const/16 v0, 0x13

    iput v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mEndIndex:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mIsLoadOver:Z

    return-void
.end method

.method private createFooterView()Landroid/view/View;
    .locals 4

    const/4 v3, 0x0

    const-string v0, "layout_inflater"

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    const v1, 0x7f03003d

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterView:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterView:Landroid/widget/FrameLayout;

    const v1, 0x7f02006b

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundResource(I)V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterView:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0004

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterLoading:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterLoading:Landroid/widget/ProgressBar;

    new-instance v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterLoading:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterView:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0056

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterNoData:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterNoData:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterNoData:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterView:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method private initListView()V
    .locals 5

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->doInitListAdapter()Lcom/mappn/gfan/common/widget/AppListAdapter;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->getParent()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setActivity(Landroid/app/Activity;)V

    invoke-virtual {v0, p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setLazyloadListener(Lcom/mappn/gfan/common/widget/AppListAdapter$LazyloadListener;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->doInitHeaderViewOrFooterView()V

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mList:Landroid/widget/ListView;

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->createFooterView()Landroid/view/View;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;Ljava/lang/Object;Z)V

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method


# virtual methods
.method protected doInitHeaderViewOrFooterView()V
    .locals 0

    return-void
.end method

.method public abstract doInitListAdapter()Lcom/mappn/gfan/common/widget/AppListAdapter;
.end method

.method public abstract doInitView(Landroid/os/Bundle;)Z
.end method

.method public abstract doLazyload()V
.end method

.method public getEndIndex()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mEndIndex:I

    return v0
.end method

.method protected getItemCount()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected getItemsPerPage()I
    .locals 1

    const/16 v0, 0x14

    return v0
.end method

.method public getStartIndex()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mStartIndex:I

    return v0
.end method

.method public isEnd()Z
    .locals 2

    iget v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mStartIndex:I

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->getItemCount()I

    move-result v1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLoadOver()Z
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mIsLoadOver:Z

    return v0
.end method

.method public lazyload()V
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mIsLoadOver:Z

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mIsLoadOver:Z

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->doLazyload()V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0c0056

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterLoading:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterNoData:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->lazyload()V

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0, p1}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->doInitView(Landroid/os/Bundle;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->getItemsPerPage()I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mItemsPerPage:I

    iget v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mItemsPerPage:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mEndIndex:I

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->initListView()V

    :cond_0
    return-void
.end method

.method public reset()V
    .locals 2

    const/4 v0, 0x0

    iput v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mStartIndex:I

    iget v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mItemsPerPage:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mEndIndex:I

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p0

    check-cast p0, Landroid/widget/HeaderViewListAdapter;

    invoke-virtual {p0}, Landroid/widget/HeaderViewListAdapter;->getWrappedAdapter()Landroid/widget/ListAdapter;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->clearData()V

    return-void
.end method

.method public setLoadResult(Z)V
    .locals 4

    const/16 v3, 0x8

    const/4 v2, 0x0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mIsLoadOver:Z

    if-eqz p1, :cond_1

    iget v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mEndIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mStartIndex:I

    iget v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mEndIndex:I

    iget v1, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mItemsPerPage:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mEndIndex:I

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterLoading:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->isEnd()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterView:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->removeFooterView(Landroid/view/View;)Z

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterLoading:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->mFooterNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method
