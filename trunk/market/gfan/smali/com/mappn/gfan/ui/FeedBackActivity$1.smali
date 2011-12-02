.class Lcom/mappn/gfan/ui/FeedBackActivity$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/FeedBackActivity;->initViews()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/FeedBackActivity;

.field final synthetic val$feedbackContent:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/FeedBackActivity;Landroid/widget/EditText;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1;->this$0:Lcom/mappn/gfan/ui/FeedBackActivity;

    iput-object p2, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1;->val$feedbackContent:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1;->this$0:Lcom/mappn/gfan/ui/FeedBackActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/FeedBackActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1;->val$feedbackContent:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v1, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1;->this$0:Lcom/mappn/gfan/ui/FeedBackActivity;

    const v2, 0x7f090102

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/ui/FeedBackActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v3}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    :goto_0
    return-void

    :cond_0
    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v1, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1;->this$0:Lcom/mappn/gfan/ui/FeedBackActivity;

    const v2, 0x7f090094

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/ui/FeedBackActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v3}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1;->this$0:Lcom/mappn/gfan/ui/FeedBackActivity;

    invoke-static {v2}, Lcom/mappn/gfan/ui/FeedBackActivity;->access$000(Lcom/mappn/gfan/ui/FeedBackActivity;)Lcom/mappn/gfan/Session;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mappn/gfan/Session;->isLogin()Z

    move-result v2

    if-eqz v2, :cond_2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "User["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1;->this$0:Lcom/mappn/gfan/ui/FeedBackActivity;

    invoke-static {v3}, Lcom/mappn/gfan/ui/FeedBackActivity;->access$100(Lcom/mappn/gfan/ui/FeedBackActivity;)Lcom/mappn/gfan/Session;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mappn/gfan/Session;->getUid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] send feedback : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_2
    new-instance v2, Lcom/mappn/gfan/ui/FeedBackActivity$1$1;

    invoke-direct {v2, p0, v0}, Lcom/mappn/gfan/ui/FeedBackActivity$1$1;-><init>(Lcom/mappn/gfan/ui/FeedBackActivity$1;Landroid/content/Context;)V

    invoke-static {v0, v1, v2}, Lcom/gfan/sdk/statistics/Collector;->comment(Landroid/content/Context;Ljava/lang/String;Lcom/gfan/sdk/statistics/Collector$IResponse;)V

    goto :goto_0
.end method
