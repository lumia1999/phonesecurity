.class final Lcom/mappn/gfan/common/util/DialogUtil$22;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/util/DialogUtil;->createListDialog(Landroid/content/Context;IILcom/mappn/gfan/common/util/DialogUtil$ListDIalogListener;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$id:I

.field final synthetic val$listener:Lcom/mappn/gfan/common/util/DialogUtil$ListDIalogListener;


# direct methods
.method constructor <init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$ListDIalogListener;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/DialogUtil$22;->val$context:Landroid/content/Context;

    iput p2, p0, Lcom/mappn/gfan/common/util/DialogUtil$22;->val$id:I

    iput-object p3, p0, Lcom/mappn/gfan/common/util/DialogUtil$22;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$ListDIalogListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$22;->val$context:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$22;->val$context:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    iget v1, p0, Lcom/mappn/gfan/common/util/DialogUtil$22;->val$id:I

    invoke-virtual {v0, v1}, Landroid/app/Activity;->removeDialog(I)V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$22;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$ListDIalogListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$22;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$ListDIalogListener;

    iget v1, p0, Lcom/mappn/gfan/common/util/DialogUtil$22;->val$id:I

    invoke-interface {v0, v1, p2}, Lcom/mappn/gfan/common/util/DialogUtil$ListDIalogListener;->onListDialogOK(II)V

    :cond_1
    return-void
.end method