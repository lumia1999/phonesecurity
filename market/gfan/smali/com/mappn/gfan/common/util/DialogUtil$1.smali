.class final Lcom/mappn/gfan/common/util/DialogUtil$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


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

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/ProductDetailActivity;I)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/DialogUtil$1;->val$context:Lcom/mappn/gfan/ui/ProductDetailActivity;

    iput p2, p0, Lcom/mappn/gfan/common/util/DialogUtil$1;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$1;->val$context:Lcom/mappn/gfan/ui/ProductDetailActivity;

    iget v1, p0, Lcom/mappn/gfan/common/util/DialogUtil$1;->val$id:I

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/ProductDetailActivity;->removeDialog(I)V

    return-void
.end method
