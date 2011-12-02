.class final Lcom/mappn/gfan/common/util/DialogUtil$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/util/DialogUtil;->newEnsurePurchaseDialog(Lcom/mappn/gfan/ui/ProductDetailActivity;ILjava/lang/String;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Lcom/mappn/gfan/ui/ProductDetailActivity;

.field final synthetic val$etInput:Landroid/widget/EditText;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Landroid/widget/EditText;Lcom/mappn/gfan/ui/ProductDetailActivity;I)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/DialogUtil$2;->val$etInput:Landroid/widget/EditText;

    iput-object p2, p0, Lcom/mappn/gfan/common/util/DialogUtil$2;->val$context:Lcom/mappn/gfan/ui/ProductDetailActivity;

    iput p3, p0, Lcom/mappn/gfan/common/util/DialogUtil$2;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$2;->val$etInput:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$2;->val$context:Lcom/mappn/gfan/ui/ProductDetailActivity;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/DialogUtil$2;->val$context:Lcom/mappn/gfan/ui/ProductDetailActivity;

    const v2, 0x7f09001d

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lcom/mappn/gfan/common/util/DialogUtil$2;->val$context:Lcom/mappn/gfan/ui/ProductDetailActivity;

    iget v2, p0, Lcom/mappn/gfan/common/util/DialogUtil$2;->val$id:I

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/ui/ProductDetailActivity;->removeDialog(I)V

    iget-object v1, p0, Lcom/mappn/gfan/common/util/DialogUtil$2;->val$context:Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->purchaseProduct(Ljava/lang/String;)V

    goto :goto_0
.end method
