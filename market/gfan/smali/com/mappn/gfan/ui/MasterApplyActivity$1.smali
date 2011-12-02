.class Lcom/mappn/gfan/ui/MasterApplyActivity$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/MasterApplyActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/MasterApplyActivity;

.field final synthetic val$etReason:Landroid/widget/EditText;

.field final synthetic val$etUser:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/MasterApplyActivity;Landroid/widget/EditText;Landroid/widget/EditText;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/MasterApplyActivity$1;->this$0:Lcom/mappn/gfan/ui/MasterApplyActivity;

    iput-object p2, p0, Lcom/mappn/gfan/ui/MasterApplyActivity$1;->val$etUser:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/mappn/gfan/ui/MasterApplyActivity$1;->val$etReason:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    iget-object v0, p0, Lcom/mappn/gfan/ui/MasterApplyActivity$1;->this$0:Lcom/mappn/gfan/ui/MasterApplyActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/MasterApplyActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/MasterApplyActivity$1;->val$etUser:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/MasterApplyActivity$1;->val$etReason:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/MasterApplyActivity$1;->val$etUser:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/mappn/gfan/ui/MasterApplyActivity$1;->this$0:Lcom/mappn/gfan/ui/MasterApplyActivity;

    const v2, 0x7f09015b

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/ui/MasterApplyActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_0
    return-void

    :cond_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/MasterApplyActivity$1;->val$etReason:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/mappn/gfan/ui/MasterApplyActivity$1;->this$0:Lcom/mappn/gfan/ui/MasterApplyActivity;

    const v2, 0x7f09015d

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/ui/MasterApplyActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_1
    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v1, p0, Lcom/mappn/gfan/ui/MasterApplyActivity$1;->this$0:Lcom/mappn/gfan/ui/MasterApplyActivity;

    const v2, 0x7f090094

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/ui/MasterApplyActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    :cond_2
    const-string v3, "[\u7533\u8bf7\u8fbe\u4eba]"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "QQ\u6216\u8005\u90ae\u7bb1:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " \u81ea\u6211\u7b80\u4ecb:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/mappn/gfan/ui/MasterApplyActivity$1$1;

    invoke-direct {v2, p0, v0}, Lcom/mappn/gfan/ui/MasterApplyActivity$1$1;-><init>(Lcom/mappn/gfan/ui/MasterApplyActivity$1;Landroid/content/Context;)V

    invoke-static {v0, v1, v2}, Lcom/gfan/sdk/statistics/Collector;->comment(Landroid/content/Context;Ljava/lang/String;Lcom/gfan/sdk/statistics/Collector$IResponse;)V

    goto :goto_0
.end method
