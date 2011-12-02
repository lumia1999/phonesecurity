.class public Lcom/mappn/gfan/ui/RecommendListActivity;
.super Lcom/mappn/gfan/common/widget/LazyloadListActivity;

# interfaces
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

.field private mClickItemPos:I

.field private mLoading:Landroid/widget/FrameLayout;

.field private mNoData:Landroid/widget/TextView;

.field private mProgress:Landroid/widget/ProgressBar;

.field private mTotalSize:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mTotalSize:I

    return-void
.end method


# virtual methods
.method public doInitListAdapter()Lcom/mappn/gfan/common/widget/AppListAdapter;
    .locals 8

    const/4 v7, 0x5

    new-instance v0, Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendListActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    const v3, 0x7f030023

    new-array v4, v7, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "icon_url"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "name"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "like"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "update_time"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string v6, "dislike"

    aput-object v6, v4, v5

    new-array v5, v7, [I

    fill-array-data v5, :array_0

    invoke-direct/range {v0 .. v5}, Lcom/mappn/gfan/common/widget/AppListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    return-object v0

    nop

    :array_0
    .array-data 0x4
        0x2ft 0x0t 0xct 0x7ft
        0x30t 0x0t 0xct 0x7ft
        0x33t 0x0t 0xct 0x7ft
        0x32t 0x0t 0xct 0x7ft
        0x31t 0x0t 0xct 0x7ft
    .end array-data
.end method

.method public doInitView(Landroid/os/Bundle;)Z
    .locals 6

    const/4 v3, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const v0, 0x7f030022

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendListActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendListActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v3, [Landroid/view/View;

    const v2, 0x7f0c009e

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/RecommendListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v4

    const v2, 0x7f0c009a

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/RecommendListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v5

    new-array v2, v3, [I

    fill-array-data v2, :array_0

    const v3, 0x7f09015f

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/RecommendListActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/mappn/gfan/common/util/TopBar;->createTopBar(Landroid/content/Context;[Landroid/view/View;[ILjava/lang/String;)V

    const v0, 0x7f0c000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mLoading:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mLoading:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0004

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mProgress:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mProgress:Landroid/widget/ProgressBar;

    new-instance v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendListActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mLoading:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0056

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mNoData:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mList:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mLoading:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendListActivity;->lazyload()V

    return v5

    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method public doLazyload()V
    .locals 3

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendListActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendListActivity;->getItemsPerPage()I

    move-result v1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendListActivity;->getStartIndex()I

    move-result v2

    invoke-static {v0, p0, v1, v2}, Lcom/mappn/gfan/common/MarketAPI;->getMasterRecommend(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;II)V

    return-void
.end method

.method protected getItemCount()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mTotalSize:I

    return v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 5

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    if-nez p3, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string v0, "extra.recommend.detail"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/RecommendTopic;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget v2, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mClickItemPos:I

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    if-eqz v1, :cond_0

    const-string v2, "like"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v0, Lcom/mappn/gfan/common/vo/RecommendTopic;->up:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "dislike"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v0, v0, Lcom/mappn/gfan/common/vo/RecommendTopic;->down:I

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->notifyDataSetChanged()V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0c0056

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mProgress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mNoData:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendListActivity;->lazyload()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/16 v1, 0x64

    if-ne v0, v1, :cond_0

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendListActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/MasterApplyActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendListActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public onError(II)V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mProgress:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/RecommendListActivity;->setLoadResult(Z)V

    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    const/4 v6, 0x0

    iput p3, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mClickItemPos:I

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget v1, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mClickItemPos:I

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    new-instance v2, Lcom/mappn/gfan/common/vo/RecommendTopic;

    invoke-direct {v2}, Lcom/mappn/gfan/common/vo/RecommendTopic;-><init>()V

    const-string v1, "id"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, v2, Lcom/mappn/gfan/common/vo/RecommendTopic;->id:Ljava/lang/String;

    const-string v1, "icon_url"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, v2, Lcom/mappn/gfan/common/vo/RecommendTopic;->icon:Ljava/lang/String;

    const-string v1, "name"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, v2, Lcom/mappn/gfan/common/vo/RecommendTopic;->title:Ljava/lang/String;

    const-string v1, "description"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, v2, Lcom/mappn/gfan/common/vo/RecommendTopic;->description:Ljava/lang/String;

    const-string v1, "like"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v2, Lcom/mappn/gfan/common/vo/RecommendTopic;->up:I

    const-string v1, "dislike"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v2, Lcom/mappn/gfan/common/vo/RecommendTopic;->down:I

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendListActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v3, "\u73a9\u5bb6\u63a8\u8350"

    aput-object v3, v1, v6

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u70b9\u51fb\u8fbe\u4eba\u63a8\u8350->"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v2, Lcom/mappn/gfan/common/vo/RecommendTopic;->title:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v3

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendListActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v3, Lcom/mappn/gfan/ui/RecommendActivity;

    invoke-direct {v0, v1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "extra.recommend.detail"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    invoke-virtual {p0, v0, v6}, Lcom/mappn/gfan/ui/RecommendListActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendListActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->onPause()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendListActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/LazyloadListActivity;->onResume()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendListActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 3

    check-cast p2, Ljava/util/HashMap;

    const-string v0, "total_size"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mTotalSize:I

    iget v0, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mTotalSize:I

    if-lez v0, :cond_0

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    const-string v0, "recommend_list"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->addData(Ljava/util/ArrayList;)V

    :goto_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendListActivity;->setLoadResult(Z)V

    return-void

    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "content"

    const v2, 0x7f0900b8

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/RecommendListActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendListActivity;->mAdapter:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->addData(Ljava/util/HashMap;)V

    goto :goto_0
.end method
