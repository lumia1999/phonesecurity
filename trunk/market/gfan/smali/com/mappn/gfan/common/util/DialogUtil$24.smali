.class final Lcom/mappn/gfan/common/util/DialogUtil$24;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/util/DialogUtil;->createListCheckboxDialog(Landroid/content/Context;I[Ljava/lang/CharSequence;[IILcom/mappn/gfan/common/util/DialogUtil$ListCheckboxDialogListener;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$id:I

.field final synthetic val$items:[Ljava/lang/CharSequence;

.field final synthetic val$listener:Lcom/mappn/gfan/common/util/DialogUtil$ListCheckboxDialogListener;


# direct methods
.method constructor <init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$ListCheckboxDialogListener;[Ljava/lang/CharSequence;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/DialogUtil$24;->val$context:Landroid/content/Context;

    iput p2, p0, Lcom/mappn/gfan/common/util/DialogUtil$24;->val$id:I

    iput-object p3, p0, Lcom/mappn/gfan/common/util/DialogUtil$24;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$ListCheckboxDialogListener;

    iput-object p4, p0, Lcom/mappn/gfan/common/util/DialogUtil$24;->val$items:[Ljava/lang/CharSequence;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$24;->val$context:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$24;->val$context:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    iget v1, p0, Lcom/mappn/gfan/common/util/DialogUtil$24;->val$id:I

    invoke-virtual {v0, v1}, Landroid/app/Activity;->removeDialog(I)V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$24;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$ListCheckboxDialogListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$24;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$ListCheckboxDialogListener;

    iget v1, p0, Lcom/mappn/gfan/common/util/DialogUtil$24;->val$id:I

    iget-object v2, p0, Lcom/mappn/gfan/common/util/DialogUtil$24;->val$items:[Ljava/lang/CharSequence;

    invoke-static {}, Lcom/mappn/gfan/common/util/DialogUtil;->access$000()[I

    move-result-object v3

    if-nez v3, :cond_2

    const/4 v3, -0x1

    :goto_0
    invoke-interface {v0, v1, v2, v3, p2}, Lcom/mappn/gfan/common/util/DialogUtil$ListCheckboxDialogListener;->onListDialogOK(I[Ljava/lang/CharSequence;II)V

    :cond_1
    return-void

    :cond_2
    invoke-static {}, Lcom/mappn/gfan/common/util/DialogUtil;->access$000()[I

    move-result-object v3

    aget v3, v3, p2

    goto :goto_0
.end method
