.class final Lcom/yingyonghui/market/dw;
.super Landroid/widget/BaseAdapter;
.source "ActivityDetailAppInner.java"


# instance fields
.field private a:Landroid/view/LayoutInflater;

.field private b:I

.field private c:F

.field private d:F

.field private synthetic e:Lcom/yingyonghui/market/ActivityDetailAppInner;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/ActivityDetailAppInner;Landroid/content/Context;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 771
    iput-object p1, p0, Lcom/yingyonghui/market/dw;->e:Lcom/yingyonghui/market/ActivityDetailAppInner;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 772
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/dw;->a:Landroid/view/LayoutInflater;

    .line 773
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 1

    .prologue
    .line 786
    iget v0, p0, Lcom/yingyonghui/market/dw;->b:I

    return v0
.end method

.method public final a(I)V
    .locals 0
    .parameter

    .prologue
    .line 776
    iput p1, p0, Lcom/yingyonghui/market/dw;->b:I

    .line 777
    return-void
.end method

.method public final getCount()I
    .locals 1

    .prologue
    .line 782
    iget-object v0, p0, Lcom/yingyonghui/market/dw;->e:Lcom/yingyonghui/market/ActivityDetailAppInner;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->k(Lcom/yingyonghui/market/ActivityDetailAppInner;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const v0, 0x7fffffff

    goto :goto_0
.end method

.method public final getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 791
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public final getItemId(I)J
    .locals 2
    .parameter

    .prologue
    .line 796
    int-to-long v0, p1

    return-wide v0
.end method

.method public final getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v3, -0x2

    .line 803
    if-eqz p2, :cond_0

    .line 804
    check-cast p2, Landroid/widget/ImageView;

    move-object v1, p2

    .line 809
    :goto_0
    iget-object v0, p0, Lcom/yingyonghui/market/dw;->e:Lcom/yingyonghui/market/ActivityDetailAppInner;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->k(Lcom/yingyonghui/market/ActivityDetailAppInner;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v0

    iget v2, p0, Lcom/yingyonghui/market/dw;->b:I

    rem-int v2, p1, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    .line 811
    if-eqz v0, :cond_3

    .line 813
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 815
    invoke-virtual {v1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/yingyonghui/market/util/p;->e(Landroid/content/Context;)F

    move-result v2

    .line 816
    invoke-virtual {v1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/yingyonghui/market/util/p;->d(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v3

    .line 817
    iget v4, v3, Landroid/graphics/Rect;->right:I

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 819
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    if-ge v4, v5, :cond_1

    const/4 v4, 0x1

    .line 821
    :goto_1
    if-eqz v4, :cond_2

    .line 822
    int-to-double v2, v3

    const-wide/high16 v4, 0x4008

    div-double/2addr v2, v4

    double-to-float v2, v2

    iput v2, p0, Lcom/yingyonghui/market/dw;->c:F

    .line 827
    :goto_2
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    int-to-float v2, v2

    iget v3, p0, Lcom/yingyonghui/market/dw;->c:F

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    int-to-float v0, v0

    div-float v0, v3, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/yingyonghui/market/dw;->d:F

    .line 828
    new-instance v0, Landroid/widget/Gallery$LayoutParams;

    iget v2, p0, Lcom/yingyonghui/market/dw;->c:F

    float-to-int v2, v2

    iget v3, p0, Lcom/yingyonghui/market/dw;->d:F

    float-to-int v3, v3

    invoke-direct {v0, v2, v3}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 833
    :goto_3
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 835
    return-object v1

    .line 806
    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/dw;->a:Landroid/view/LayoutInflater;

    const v1, 0x7f030010

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    move-object v1, v0

    goto :goto_0

    .line 819
    :cond_1
    const/4 v4, 0x0

    goto :goto_1

    .line 824
    :cond_2
    int-to-float v3, v3

    const/high16 v4, 0x4234

    mul-float/2addr v2, v4

    sub-float v2, v3, v2

    iput v2, p0, Lcom/yingyonghui/market/dw;->c:F

    goto :goto_2

    .line 830
    :cond_3
    new-instance v0, Landroid/widget/Gallery$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_3
.end method
