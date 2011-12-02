.class Lcom/mappn/gfan/ui/PayMainActivity$4;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/PayMainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/PayMainActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/PayMainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/PayMainActivity$4;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    :try_start_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    :goto_1
    return-void

    :pswitch_0
    :try_start_1
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    const-string v1, "{"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "}"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v0

    const/16 v1, 0x1771

    if-eq v1, v0, :cond_0

    const/16 v1, 0xfa0

    if-ne v1, v0, :cond_1

    :cond_0
    :try_start_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity$4;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V
    :try_end_2
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0

    :cond_1
    :try_start_3
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity$4;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/ui/PayMainActivity;->access$902(Lcom/mappn/gfan/ui/PayMainActivity;J)J

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity$4;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity$4;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity$4;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-static {v2}, Lcom/mappn/gfan/ui/PayMainActivity;->access$800(Lcom/mappn/gfan/ui/PayMainActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/MarketAPI;->queryAliPayResult(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    :try_start_4
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity$4;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity$4;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V
    :try_end_4
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_0

    :catch_2
    move-exception v0

    goto :goto_0

    :catch_3
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
