.class final Lcom/mappn/gfan/common/util/MenuUtil$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/util/MenuUtil;->createResponseDialog(Landroid/content/Context;I)Landroid/app/Dialog;
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

    iput-object p1, p0, Lcom/mappn/gfan/common/util/MenuUtil$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInputDialogCancel(I)V
    .locals 0

    return-void
.end method

.method public onInputDialogOK(ILjava/lang/String;)V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/mappn/gfan/common/util/MenuUtil$1;->val$context:Landroid/content/Context;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/mappn/gfan/common/util/MenuUtil$1;->val$context:Landroid/content/Context;

    new-instance v2, Lcom/mappn/gfan/common/util/MenuUtil$1$1;

    invoke-direct {v2, p0}, Lcom/mappn/gfan/common/util/MenuUtil$1$1;-><init>(Lcom/mappn/gfan/common/util/MenuUtil$1;)V

    invoke-static {v1, v0, v2}, Lcom/gfan/sdk/statistics/Collector;->comment(Landroid/content/Context;Ljava/lang/String;Lcom/gfan/sdk/statistics/Collector$IResponse;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/MenuUtil$1;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/MenuUtil$1;->val$context:Landroid/content/Context;

    const v2, 0x7f090102

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0
.end method
