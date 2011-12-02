.class Lcom/mappn/gfan/ui/ProductDetailActivity$3;
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

    iput-object p1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWarningDialogCancel(I)V
    .locals 0

    return-void
.end method

.method public onWarningDialogOK(I)V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->access$300(Lcom/mappn/gfan/ui/ProductDetailActivity;)Lcom/mappn/gfan/Session;

    move-result-object v0

    iget-object v0, v0, Lcom/mappn/gfan/Session;->mNotSameApps:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/ProductDetailActivity;->access$100(Lcom/mappn/gfan/ui/ProductDetailActivity;)Lcom/mappn/gfan/common/vo/ProductDetail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-static {v2}, Lcom/mappn/gfan/ui/ProductDetailActivity;->access$100(Lcom/mappn/gfan/ui/ProductDetailActivity;)Lcom/mappn/gfan/common/vo/ProductDetail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->getFilePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/ProductDetailActivity;->access$100(Lcom/mappn/gfan/ui/ProductDetailActivity;)Lcom/mappn/gfan/common/vo/ProductDetail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->uninstallApk(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method
