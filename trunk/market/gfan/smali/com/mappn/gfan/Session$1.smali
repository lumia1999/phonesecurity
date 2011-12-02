.class Lcom/mappn/gfan/Session$1;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/Session;->initMessageHandler()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/Session;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/Session;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/Session$1;->this$0:Lcom/mappn/gfan/Session;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/mappn/gfan/Session$1;->this$0:Lcom/mappn/gfan/Session;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0, v1}, Lcom/mappn/gfan/Session;->access$002(Lcom/mappn/gfan/Session;Ljava/util/HashMap;)Ljava/util/HashMap;

    iget-object v0, p0, Lcom/mappn/gfan/Session$1;->this$0:Lcom/mappn/gfan/Session;

    invoke-static {v0}, Lcom/mappn/gfan/Session;->access$100(Lcom/mappn/gfan/Session;)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/mappn/gfan/Session$1;->this$0:Lcom/mappn/gfan/Session;

    invoke-static {v0}, Lcom/mappn/gfan/Session;->access$200(Lcom/mappn/gfan/Session;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/Session$1;->this$0:Lcom/mappn/gfan/Session;

    iget-object v1, p0, Lcom/mappn/gfan/Session$1;->this$0:Lcom/mappn/gfan/Session;

    invoke-static {v1}, Lcom/mappn/gfan/Session;->access$200(Lcom/mappn/gfan/Session;)Landroid/database/Cursor;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/Session;->refreshDownloadApp(Landroid/database/Cursor;)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/mappn/gfan/Session$1;->this$0:Lcom/mappn/gfan/Session;

    invoke-static {v0}, Lcom/mappn/gfan/Session;->access$300(Lcom/mappn/gfan/Session;)V

    iget-object v0, p0, Lcom/mappn/gfan/Session$1;->this$0:Lcom/mappn/gfan/Session;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/Session;->notifyObservers(Ljava/lang/Object;)V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/mappn/gfan/Session$1;->this$0:Lcom/mappn/gfan/Session;

    invoke-static {v0}, Lcom/mappn/gfan/Session;->access$400(Lcom/mappn/gfan/Session;)V

    iget-object v0, p0, Lcom/mappn/gfan/Session$1;->this$0:Lcom/mappn/gfan/Session;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/Session;->notifyObservers(Ljava/lang/Object;)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
