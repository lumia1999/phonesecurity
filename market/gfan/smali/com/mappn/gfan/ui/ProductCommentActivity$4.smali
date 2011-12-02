.class Lcom/mappn/gfan/ui/ProductCommentActivity$4;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/ProductCommentActivity;->initViews()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/ProductCommentActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$4;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$4;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->access$600(Lcom/mappn/gfan/ui/ProductCommentActivity;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$4;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$4;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    const v2, 0x7f0900c1

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v4}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$4;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/ProductCommentActivity;->access$700(Lcom/mappn/gfan/ui/ProductCommentActivity;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$4;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-virtual {v1}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$4;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    iget-object v3, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$4;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-static {v3}, Lcom/mappn/gfan/ui/ProductCommentActivity;->access$400(Lcom/mappn/gfan/ui/ProductCommentActivity;)Lcom/mappn/gfan/common/vo/ProductDetail;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v2, v3, v0}, Lcom/mappn/gfan/common/MarketAPI;->addComment(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$4;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u8be6\u60c5"

    aput-object v2, v1, v4

    const/4 v2, 0x1

    const-string v3, "\u53d1\u8868\u8bc4\u8bba"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto :goto_0
.end method
