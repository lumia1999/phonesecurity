.class Lcom/mappn/gfan/ui/PersonalAccountActivity$2;
.super Landroid/os/Handler;


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

    iput-object p1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$2;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$2;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->access$100(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$2;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->access$200(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->changeDataSource(Ljava/util/List;)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$2;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->showDialog(I)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$2;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->access$300(Lcom/mappn/gfan/ui/PersonalAccountActivity;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
