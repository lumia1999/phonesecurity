.class Lcom/mappn/gfan/ui/PersonalAccountActivity$4;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/PersonalAccountActivity;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/PersonalAccountActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$4;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$4;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->access$400(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/Session;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/Session;->setLogin(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$4;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->access$500(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/Session;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/Session;->setUid(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$4;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v0, v2}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->access$602(Lcom/mappn/gfan/ui/PersonalAccountActivity;Z)Z

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$4;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->access$700(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isDeviceBinded()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$4;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$4;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->access$800(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/Session;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/hudee/HudeeUtils;->unregisterLPNS(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$4;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$4;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/MarketAPI;->unbindAccount(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$4;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->access$900(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method
