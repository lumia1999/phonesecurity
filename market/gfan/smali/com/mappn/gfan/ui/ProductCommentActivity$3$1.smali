.class Lcom/mappn/gfan/ui/ProductCommentActivity$3$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/ProductCommentActivity$3;->onRatingChanged(Landroid/widget/RatingBar;FZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mappn/gfan/ui/ProductCommentActivity$3;

.field final synthetic val$rating:F


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/ProductCommentActivity$3;F)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$3$1;->this$1:Lcom/mappn/gfan/ui/ProductCommentActivity$3;

    iput p2, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$3$1;->val$rating:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$3$1;->this$1:Lcom/mappn/gfan/ui/ProductCommentActivity$3;

    iget-object v0, v0, Lcom/mappn/gfan/ui/ProductCommentActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->access$400(Lcom/mappn/gfan/ui/ProductCommentActivity;)Lcom/mappn/gfan/common/vo/ProductDetail;

    move-result-object v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$3$1;->this$1:Lcom/mappn/gfan/ui/ProductCommentActivity$3;

    iget-object v0, v0, Lcom/mappn/gfan/ui/ProductCommentActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$3$1;->this$1:Lcom/mappn/gfan/ui/ProductCommentActivity$3;

    iget-object v1, v1, Lcom/mappn/gfan/ui/ProductCommentActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$3$1;->this$1:Lcom/mappn/gfan/ui/ProductCommentActivity$3;

    iget-object v2, v2, Lcom/mappn/gfan/ui/ProductCommentActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-static {v2}, Lcom/mappn/gfan/ui/ProductCommentActivity;->access$400(Lcom/mappn/gfan/ui/ProductCommentActivity;)Lcom/mappn/gfan/common/vo/ProductDetail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPid()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$3$1;->val$rating:F

    float-to-int v3, v3

    invoke-static {v0, v1, v2, v3}, Lcom/mappn/gfan/common/MarketAPI;->addRating(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;I)V

    goto :goto_0
.end method
