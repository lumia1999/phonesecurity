.class Lcom/mappn/gfan/common/util/MenuUtil$1$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/gfan/sdk/statistics/Collector$IResponse;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/util/MenuUtil$1;->onInputDialogOK(ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/util/MenuUtil$1;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/common/util/MenuUtil$1;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/MenuUtil$1$1;->this$0:Lcom/mappn/gfan/common/util/MenuUtil$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailed(Ljava/lang/Exception;)V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/common/util/MenuUtil$1$1;->this$0:Lcom/mappn/gfan/common/util/MenuUtil$1;

    iget-object v0, v0, Lcom/mappn/gfan/common/util/MenuUtil$1;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/MenuUtil$1$1;->this$0:Lcom/mappn/gfan/common/util/MenuUtil$1;

    iget-object v1, v1, Lcom/mappn/gfan/common/util/MenuUtil$1;->val$context:Landroid/content/Context;

    const v2, 0x7f090101

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    return-void
.end method

.method public onSuccess(Lorg/apache/http/HttpResponse;)V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/common/util/MenuUtil$1$1;->this$0:Lcom/mappn/gfan/common/util/MenuUtil$1;

    iget-object v0, v0, Lcom/mappn/gfan/common/util/MenuUtil$1;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/MenuUtil$1$1;->this$0:Lcom/mappn/gfan/common/util/MenuUtil$1;

    iget-object v1, v1, Lcom/mappn/gfan/common/util/MenuUtil$1;->val$context:Landroid/content/Context;

    const v2, 0x7f090101

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    return-void
.end method
