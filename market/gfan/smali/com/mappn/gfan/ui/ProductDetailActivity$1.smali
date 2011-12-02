.class Lcom/mappn/gfan/ui/ProductDetailActivity$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/ProductDetailActivity;->initTopBar(Lcom/mappn/gfan/common/vo/ProductDetail;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;

.field final synthetic val$product:Lcom/mappn/gfan/common/vo/ProductDetail;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/ProductDetailActivity;Lcom/mappn/gfan/common/vo/ProductDetail;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$1;->this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;

    iput-object p2, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$1;->val$product:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$1;->this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->access$000(Lcom/mappn/gfan/ui/ProductDetailActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$1;->this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$1;->val$product:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->openApk(Landroid/content/Context;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$1;->this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->download()V

    goto :goto_0
.end method
