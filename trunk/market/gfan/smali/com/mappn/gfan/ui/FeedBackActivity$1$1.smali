.class Lcom/mappn/gfan/ui/FeedBackActivity$1$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/gfan/sdk/statistics/Collector$IResponse;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/FeedBackActivity$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mappn/gfan/ui/FeedBackActivity$1;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/FeedBackActivity$1;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1$1;->this$1:Lcom/mappn/gfan/ui/FeedBackActivity$1;

    iput-object p2, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailed(Ljava/lang/Exception;)V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1$1;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1$1;->val$context:Landroid/content/Context;

    const v2, 0x7f090101

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v3}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1$1;->this$1:Lcom/mappn/gfan/ui/FeedBackActivity$1;

    iget-object v0, v0, Lcom/mappn/gfan/ui/FeedBackActivity$1;->this$0:Lcom/mappn/gfan/ui/FeedBackActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/FeedBackActivity;->finish()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1$1;->this$1:Lcom/mappn/gfan/ui/FeedBackActivity$1;

    iget-object v0, v0, Lcom/mappn/gfan/ui/FeedBackActivity$1;->this$0:Lcom/mappn/gfan/ui/FeedBackActivity;

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/FeedBackActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1$1;->this$1:Lcom/mappn/gfan/ui/FeedBackActivity$1;

    iget-object v1, v1, Lcom/mappn/gfan/ui/FeedBackActivity$1;->val$feedbackContent:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    return-void
.end method

.method public onSuccess(Lorg/apache/http/HttpResponse;)V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1$1;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1$1;->val$context:Landroid/content/Context;

    const v2, 0x7f090101

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v3}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1$1;->this$1:Lcom/mappn/gfan/ui/FeedBackActivity$1;

    iget-object v0, v0, Lcom/mappn/gfan/ui/FeedBackActivity$1;->this$0:Lcom/mappn/gfan/ui/FeedBackActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/FeedBackActivity;->finish()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1$1;->this$1:Lcom/mappn/gfan/ui/FeedBackActivity$1;

    iget-object v0, v0, Lcom/mappn/gfan/ui/FeedBackActivity$1;->this$0:Lcom/mappn/gfan/ui/FeedBackActivity;

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/FeedBackActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lcom/mappn/gfan/ui/FeedBackActivity$1$1;->this$1:Lcom/mappn/gfan/ui/FeedBackActivity$1;

    iget-object v1, v1, Lcom/mappn/gfan/ui/FeedBackActivity$1;->val$feedbackContent:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    return-void
.end method
