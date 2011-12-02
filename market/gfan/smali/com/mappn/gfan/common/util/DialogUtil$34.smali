.class final Lcom/mappn/gfan/common/util/DialogUtil$34;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/RatingBar$OnRatingBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/util/DialogUtil;->createRatingDialog(Landroid/content/Context;IIILcom/mappn/gfan/common/util/DialogUtil$RatingDialogListener;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$tvRatingHint:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/DialogUtil$34;->val$tvRatingHint:Landroid/widget/TextView;

    iput-object p2, p0, Lcom/mappn/gfan/common/util/DialogUtil$34;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRatingChanged(Landroid/widget/RatingBar;FZ)V
    .locals 4

    const/4 v3, 0x1

    if-eqz p3, :cond_0

    float-to-int v0, p2

    invoke-static {v0}, Lcom/mappn/gfan/common/util/DialogUtil;->access$202(I)I

    invoke-static {}, Lcom/mappn/gfan/common/util/DialogUtil;->access$200()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/widget/RatingBar;->setRating(F)V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$34;->val$tvRatingHint:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/DialogUtil$34;->val$context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x7f06

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/mappn/gfan/common/util/DialogUtil;->access$200()I

    move-result v2

    sub-int/2addr v2, v3

    if-ltz v2, :cond_1

    invoke-static {}, Lcom/mappn/gfan/common/util/DialogUtil;->access$200()I

    move-result v2

    sub-int/2addr v2, v3

    :goto_0
    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method
