.class final Lcom/yingyonghui/market/s;
.super Ljava/lang/Object;
.source "ActivityCommentsAdd.java"

# interfaces
.implements Landroid/widget/RatingBar$OnRatingBarChangeListener;


# instance fields
.field private synthetic a:Landroid/widget/TextView;

.field private synthetic b:Lcom/yingyonghui/market/ActivityCommentsAdd;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityCommentsAdd;Landroid/widget/TextView;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 84
    iput-object p1, p0, Lcom/yingyonghui/market/s;->b:Lcom/yingyonghui/market/ActivityCommentsAdd;

    iput-object p2, p0, Lcom/yingyonghui/market/s;->a:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onRatingChanged(Landroid/widget/RatingBar;FZ)V
    .locals 5
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v4, 0x5

    const/4 v3, 0x1

    .line 88
    const/4 v0, 0x0

    cmpg-float v0, p2, v0

    if-gtz v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/yingyonghui/market/s;->a:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    :goto_0
    return-void

    .line 91
    :cond_0
    new-instance v0, Ljava/math/BigDecimal;

    float-to-double v1, p2

    invoke-direct {v0, v1, v2}, Ljava/math/BigDecimal;-><init>(D)V

    const/4 v1, 0x0

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    move-result-object v0

    .line 92
    invoke-virtual {v0}, Ljava/math/BigDecimal;->intValue()I

    move-result v0

    .line 93
    if-le v0, v4, :cond_2

    move v0, v4

    .line 98
    :cond_1
    :goto_1
    iget-object v1, p0, Lcom/yingyonghui/market/s;->a:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/yingyonghui/market/s;->b:Lcom/yingyonghui/market/ActivityCommentsAdd;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityCommentsAdd;->a(Lcom/yingyonghui/market/ActivityCommentsAdd;)[Ljava/lang/String;

    move-result-object v2

    sub-int/2addr v0, v3

    aget-object v0, v2, v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 95
    :cond_2
    if-gtz v0, :cond_1

    move v0, v3

    .line 96
    goto :goto_1
.end method
