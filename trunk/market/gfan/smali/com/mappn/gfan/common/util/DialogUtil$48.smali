.class final Lcom/mappn/gfan/common/util/DialogUtil$48;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/util/DialogUtil;->createComfirmDownloadDialog(Landroid/content/Context;ZLcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$listener:Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/DialogUtil$48;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/mappn/gfan/common/util/DialogUtil$48;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    const/16 v1, 0x64

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$48;->val$context:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$48;->val$context:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->removeDialog(I)V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$48;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$48;->val$listener:Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;

    invoke-interface {v0, v1}, Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;->onWarningDialogOK(I)V

    :cond_1
    return-void
.end method