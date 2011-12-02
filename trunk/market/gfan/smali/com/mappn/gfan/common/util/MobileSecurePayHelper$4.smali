.class Lcom/mappn/gfan/common/util/MobileSecurePayHelper$4;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/util/MobileSecurePayHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/util/MobileSecurePayHelper;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/common/util/MobileSecurePayHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper$4;->this$0:Lcom/mappn/gfan/common/util/MobileSecurePayHelper;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    :try_start_0
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    :goto_1
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper$4;->this$0:Lcom/mappn/gfan/common/util/MobileSecurePayHelper;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->closeProgress()V

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper$4;->this$0:Lcom/mappn/gfan/common/util/MobileSecurePayHelper;

    iget-object v2, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper$4;->this$0:Lcom/mappn/gfan/common/util/MobileSecurePayHelper;

    iget-object v2, v2, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2, v0}, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->showInstallConfirmDialog(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method
