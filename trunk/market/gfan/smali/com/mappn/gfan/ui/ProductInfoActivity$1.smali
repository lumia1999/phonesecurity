.class Lcom/mappn/gfan/ui/ProductInfoActivity$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


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

.field final synthetic val$moreLine:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/ProductInfoActivity;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/Button;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$1;->this$0:Lcom/mappn/gfan/ui/ProductInfoActivity;

    iput-object p2, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$1;->val$appShortDescription:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$1;->val$appLongDescription:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$1;->val$moreLine:Landroid/widget/ImageView;

    iput-object p5, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$1;->val$more:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 5

    const/4 v4, 0x0

    const/4 v3, 0x1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$1;->this$0:Lcom/mappn/gfan/ui/ProductInfoActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->access$000(Lcom/mappn/gfan/ui/ProductInfoActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v3

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$1;->this$0:Lcom/mappn/gfan/ui/ProductInfoActivity;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$1;->val$appShortDescription:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$1;->val$appLongDescription:Landroid/widget/TextView;

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/ui/ProductInfoActivity;->access$100(Lcom/mappn/gfan/ui/ProductInfoActivity;Landroid/widget/TextView;Landroid/widget/TextView;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$1;->val$moreLine:Landroid/widget/ImageView;

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$1;->val$more:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity$1;->this$0:Lcom/mappn/gfan/ui/ProductInfoActivity;

    invoke-static {v0, v3}, Lcom/mappn/gfan/ui/ProductInfoActivity;->access$002(Lcom/mappn/gfan/ui/ProductInfoActivity;Z)Z

    move v0, v3

    goto :goto_0
.end method
