.class final Lcom/mappn/gfan/common/util/DialogUtil$29;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/util/DialogUtil;->createInputDialog(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;ZLcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$id:I

.field final synthetic val$listener:Lcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;


# direct methods
.method constructor <init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/DialogUtil$29;->val$context:Landroid/content/Context;

    iput p2, p0, Lcom/mappn/gfan/common/util/DialogUtil$29;->val$id:I

    iput-object p3, p0, Lcom/mappn/gfan/common/util/DialogUtil$29;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$29;->val$context:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$29;->val$context:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    iget v1, p0, Lcom/mappn/gfan/common/util/DialogUtil$29;->val$id:I

    invoke-virtual {v0, v1}, Landroid/app/Activity;->removeDialog(I)V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$29;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$29;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;

    iget v1, p0, Lcom/mappn/gfan/common/util/DialogUtil$29;->val$id:I

    invoke-interface {v0, v1}, Lcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;->onInputDialogCancel(I)V

    :cond_1
    return-void
.end method
