.class public Lcom/mappn/gfan/common/util/MenuUtil;
.super Ljava/lang/Object;


# static fields
.field public static final DIALOG_RESPONSE:I = 0xc8


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createResponseDialog(Landroid/content/Context;I)Landroid/app/Dialog;
    .locals 2

    const v0, 0x7f090100

    new-instance v1, Lcom/mappn/gfan/common/util/MenuUtil$1;

    invoke-direct {v1, p0}, Lcom/mappn/gfan/common/util/MenuUtil$1;-><init>(Landroid/content/Context;)V

    invoke-static {p0, p1, v0, v1}, Lcom/mappn/gfan/common/util/DialogUtil;->createBigInputDialog(Landroid/content/Context;IILcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    return-object v0
.end method

.method public static onMenuSelectedHome(Landroid/content/Context;)V
    .locals 2

    check-cast p0, Landroid/app/Activity;

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mappn/gfan/ui/HomeActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static onMenuSelectedResponse(Landroid/content/Context;)V
    .locals 3

    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    move-object v1, v0

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {p0}, Lcom/mappn/gfan/common/util/Utils;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/16 v2, 0xc8

    invoke-virtual {v1, v2}, Landroid/app/Activity;->showDialog(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const v1, 0x7f0900d4

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0
.end method
