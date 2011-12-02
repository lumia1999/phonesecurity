.class final Lcom/mappn/gfan/common/util/DialogUtil$41;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/util/DialogUtil;->createIndeterminateProgressWhiteTextDialog(Landroid/content/Context;ILjava/lang/String;ZLcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$id:I

.field final synthetic val$listener:Lcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;


# direct methods
.method constructor <init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/DialogUtil$41;->val$context:Landroid/content/Context;

    iput p2, p0, Lcom/mappn/gfan/common/util/DialogUtil$41;->val$id:I

    iput-object p3, p0, Lcom/mappn/gfan/common/util/DialogUtil$41;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$41;->val$context:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$41;->val$context:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    iget v1, p0, Lcom/mappn/gfan/common/util/DialogUtil$41;->val$id:I

    invoke-virtual {v0, v1}, Landroid/app/Activity;->removeDialog(I)V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$41;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$41;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;

    iget v1, p0, Lcom/mappn/gfan/common/util/DialogUtil$41;->val$id:I

    invoke-interface {v0, v1}, Lcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;->onProgressDialogCancel(I)V

    :cond_1
    return-void
.end method
