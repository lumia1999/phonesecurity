.class final Lcom/mappn/gfan/common/util/DialogUtil$5;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/util/DialogUtil;->newInsufficientBalanceDialog(Lcom/mappn/gfan/ui/ProductDetailActivity;ILjava/lang/String;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Lcom/mappn/gfan/ui/ProductDetailActivity;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/ProductDetailActivity;I)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/DialogUtil$5;->val$context:Lcom/mappn/gfan/ui/ProductDetailActivity;

    iput p2, p0, Lcom/mappn/gfan/common/util/DialogUtil$5;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$5;->val$context:Lcom/mappn/gfan/ui/ProductDetailActivity;

    iget v1, p0, Lcom/mappn/gfan/common/util/DialogUtil$5;->val$id:I

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/ProductDetailActivity;->removeDialog(I)V

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$5;->val$context:Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->gotoDepositPage()V

    return-void
.end method
