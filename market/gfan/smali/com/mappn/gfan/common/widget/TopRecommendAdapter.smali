.class public Lcom/mappn/gfan/common/widget/TopRecommendAdapter;
.super Landroid/widget/BaseAdapter;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDataSource:Ljava/util/ArrayList;
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


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object p1, p0, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;->mDataSource:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;->mDataSource:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    mul-int/lit16 v0, v0, 0xc8

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    rem-int v1, p1, v0

    if-gez v1, :cond_0

    add-int/2addr v0, v1

    :goto_0
    iget-object v1, p0, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    rem-int v1, p1, v0

    if-gez v1, :cond_0

    add-int/2addr v0, v1

    move v1, v0

    :cond_0
    if-nez p2, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v2, 0x7f03003a

    const/4 v3, 0x0

    invoke-virtual {v0, v2, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    :goto_0
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_1

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_1
    iget-object v2, p0, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/HashMap;

    const-string v3, "pic"

    invoke-virtual {p0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {v2, p0, v0}, Lcom/mappn/gfan/common/util/ImageUtils;->downloadHomeTopDrawable(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    return-object v0

    :cond_2
    check-cast p2, Landroid/widget/ImageView;

    move-object v0, p2

    goto :goto_0
.end method

.method public setData(Ljava/util/ArrayList;)V
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

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;->mDataSource:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;->mDataSource:Ljava/util/ArrayList;

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/TopRecommendAdapter;->notifyDataSetChanged()V

    return-void
.end method
