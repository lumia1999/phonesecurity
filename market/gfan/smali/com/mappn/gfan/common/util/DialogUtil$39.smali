.class final Lcom/mappn/gfan/common/util/DialogUtil$39;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/util/DialogUtil;->createBigInputDialog(Landroid/content/Context;IILcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$etInput:Landroid/widget/EditText;

.field final synthetic val$id:I

.field final synthetic val$listener:Lcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;


# direct methods
.method constructor <init>(Landroid/widget/EditText;Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/DialogUtil$39;->val$etInput:Landroid/widget/EditText;

    iput-object p2, p0, Lcom/mappn/gfan/common/util/DialogUtil$39;->val$context:Landroid/content/Context;

    iput p3, p0, Lcom/mappn/gfan/common/util/DialogUtil$39;->val$id:I

    iput-object p4, p0, Lcom/mappn/gfan/common/util/DialogUtil$39;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$39;->val$etInput:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$39;->val$context:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$39;->val$context:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    iget v2, p0, Lcom/mappn/gfan/common/util/DialogUtil$39;->val$id:I

    invoke-virtual {v0, v2}, Landroid/app/Activity;->removeDialog(I)V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$39;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$39;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;

    iget v2, p0, Lcom/mappn/gfan/common/util/DialogUtil$39;->val$id:I

    invoke-interface {v0, v2, v1}, Lcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;->onInputDialogOK(ILjava/lang/String;)V

    :cond_1
    return-void
.end method
