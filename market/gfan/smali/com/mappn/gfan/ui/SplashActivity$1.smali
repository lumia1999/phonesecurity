.class Lcom/mappn/gfan/ui/SplashActivity$1;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/SplashActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/SplashActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/SplashActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/SplashActivity$1;->this$0:Lcom/mappn/gfan/ui/SplashActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity$1;->this$0:Lcom/mappn/gfan/ui/SplashActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/SplashActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity$1;->this$0:Lcom/mappn/gfan/ui/SplashActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/SplashActivity;->access$000(Lcom/mappn/gfan/ui/SplashActivity;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/mappn/gfan/ui/SplashActivity$1;->this$0:Lcom/mappn/gfan/ui/SplashActivity;

    invoke-virtual {v1}, Lcom/mappn/gfan/ui/SplashActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/SplashActivity$1;->this$0:Lcom/mappn/gfan/ui/SplashActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/SplashActivity;->access$100(Lcom/mappn/gfan/ui/SplashActivity;)Ljava/util/HashMap;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mappn/gfan/ui/SplashActivity$1;->this$0:Lcom/mappn/gfan/ui/SplashActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/SplashActivity;->access$100(Lcom/mappn/gfan/ui/SplashActivity;)Ljava/util/HashMap;

    move-result-object v1

    const-string v2, "extra.home.data.top"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mappn/gfan/ui/SplashActivity$1;->this$0:Lcom/mappn/gfan/ui/SplashActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/SplashActivity;->access$100(Lcom/mappn/gfan/ui/SplashActivity;)Ljava/util/HashMap;

    move-result-object v1

    const-string v2, "extra.home.data.bottom"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    const-string v1, "extra.home.data"

    iget-object v2, p0, Lcom/mappn/gfan/ui/SplashActivity$1;->this$0:Lcom/mappn/gfan/ui/SplashActivity;

    invoke-static {v2}, Lcom/mappn/gfan/ui/SplashActivity;->access$100(Lcom/mappn/gfan/ui/SplashActivity;)Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    :cond_1
    iget-object v1, p0, Lcom/mappn/gfan/ui/SplashActivity$1;->this$0:Lcom/mappn/gfan/ui/SplashActivity;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/ui/SplashActivity;->startActivity(Landroid/content/Intent;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity$1;->this$0:Lcom/mappn/gfan/ui/SplashActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/SplashActivity;->finish()V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity$1;->this$0:Lcom/mappn/gfan/ui/SplashActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/SplashActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity$1;->this$0:Lcom/mappn/gfan/ui/SplashActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/SplashActivity;->access$200(Lcom/mappn/gfan/ui/SplashActivity;)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
