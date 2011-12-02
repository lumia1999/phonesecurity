.class Lcom/mappn/gfan/ui/ProductCommentActivity$2;
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

    iput-object p1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$2;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$2;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->access$100(Lcom/mappn/gfan/ui/ProductCommentActivity;)Lcom/mappn/gfan/Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isLogin()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$2;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getParent()Landroid/app/Activity;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->download()V

    :goto_0
    return-void

    :cond_0
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$2;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-virtual {v1}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/LoginActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$2;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
