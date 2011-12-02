.class Lcom/mappn/gfan/ui/ProductInfoActivity$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/ProductInfoActivity;->initProductInfo(Lcom/mappn/gfan/common/vo/ProductDetail;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/ProductInfoActivity;

.field final synthetic val$appLongDescription:Landroid/widget/TextView;

.field final synthetic val$appShortDescription:Landroid/widget/TextView;

.field final synthetic val$more:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/ProductInfoActivity;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$2;->this$0:Lcom/mappn/gfan/ui/ProductInfoActivity;

    iput-object p2, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$2;->val$appShortDescription:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$2;->val$appLongDescription:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$2;->val$more:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    const/16 v5, 0x8

    const/4 v4, 0x1

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$2;->this$0:Lcom/mappn/gfan/ui/ProductInfoActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->access$200(Lcom/mappn/gfan/ui/ProductInfoActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$2;->this$0:Lcom/mappn/gfan/ui/ProductInfoActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u8be6\u60c5"

    aput-object v2, v1, v3

    const-string v2, "\u70b9\u51fb\u66f4\u591a\u4ecb\u7ecd"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$2;->val$appShortDescription:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$2;->val$appLongDescription:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$2;->this$0:Lcom/mappn/gfan/ui/ProductInfoActivity;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$2;->val$more:Landroid/widget/Button;

    invoke-static {v0, v1}, Lcom/mappn/gfan/ui/ProductInfoActivity;->access$300(Lcom/mappn/gfan/ui/ProductInfoActivity;Landroid/widget/Button;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$2;->this$0:Lcom/mappn/gfan/ui/ProductInfoActivity;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$2;->this$0:Lcom/mappn/gfan/ui/ProductInfoActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/ProductInfoActivity;->access$200(Lcom/mappn/gfan/ui/ProductInfoActivity;)Z

    move-result v1

    if-nez v1, :cond_1

    move v1, v4

    :goto_1
    invoke-static {v0, v1}, Lcom/mappn/gfan/ui/ProductInfoActivity;->access$202(Lcom/mappn/gfan/ui/ProductInfoActivity;Z)Z

    return-void

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$2;->val$appShortDescription:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$2;->val$appLongDescription:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_1
    move v1, v3

    goto :goto_1
.end method
