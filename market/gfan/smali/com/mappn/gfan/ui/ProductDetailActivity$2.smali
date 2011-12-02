.class Lcom/mappn/gfan/ui/ProductDetailActivity$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/ProductDetailActivity;->download()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/ProductDetailActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$2;->this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWarningDialogCancel(I)V
    .locals 0

    return-void
.end method

.method public onWarningDialogOK(I)V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$2;->this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$2;->this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$2;->this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-static {v2}, Lcom/mappn/gfan/ui/ProductDetailActivity;->access$100(Lcom/mappn/gfan/ui/ProductDetailActivity;)Lcom/mappn/gfan/common/vo/ProductDetail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPid()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$2;->this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-static {v3}, Lcom/mappn/gfan/ui/ProductDetailActivity;->access$100(Lcom/mappn/gfan/ui/ProductDetailActivity;)Lcom/mappn/gfan/common/vo/ProductDetail;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mappn/gfan/common/vo/ProductDetail;->getSourceType()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/mappn/gfan/common/MarketAPI;->getDownloadUrl(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$2;->this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->access$200(Lcom/mappn/gfan/ui/ProductDetailActivity;)Landroid/widget/ImageButton;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    return-void
.end method
