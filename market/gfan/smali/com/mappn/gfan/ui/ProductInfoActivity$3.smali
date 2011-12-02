.class Lcom/mappn/gfan/ui/ProductInfoActivity$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/ProductInfoActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/ProductInfoActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/ProductInfoActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductInfoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductInfoActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "\u8be6\u60c5"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "\u70b9\u51fb\u622a\u56fe"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductInfoActivity;

    invoke-virtual {v2}, Lcom/mappn/gfan/ui/ProductInfoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/mappn/gfan/ui/ScreenshotActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "extra.product.detail"

    iget-object v3, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductInfoActivity;

    invoke-static {v3}, Lcom/mappn/gfan/ui/ProductInfoActivity;->access$400(Lcom/mappn/gfan/ui/ProductInfoActivity;)Lcom/mappn/gfan/common/vo/ProductDetail;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string v2, "extra.screenshot.id"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductInfoActivity;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/ProductInfoActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
