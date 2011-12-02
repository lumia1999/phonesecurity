.class final Lcom/mappn/gfan/common/util/DialogUtil$45;
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


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/DialogUtil$45;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DialogUtil$45;->val$context:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/mappn/gfan/common/util/DialogUtil$45;->val$context:Landroid/content/Context;

    check-cast p0, Landroid/app/Activity;

    const/16 v0, 0x64

    invoke-virtual {p0, v0}, Landroid/app/Activity;->removeDialog(I)V

    :cond_0
    return-void
.end method
