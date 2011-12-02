.class Lcom/mappn/gfan/ui/PersonalAccountActivity$1;
.super Landroid/content/BroadcastReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/PersonalAccountActivity;
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

    iput-object p1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$1;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.hudee.pns.intent.REGISTRATION"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "error"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "unregistered"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "registration_id"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$1;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$1;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    const v2, 0x7f090127

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$1;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->access$000(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/Session;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/Session;->setDeviceId(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$1;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$1;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/MarketAPI;->bindAccount(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    goto :goto_0
.end method
