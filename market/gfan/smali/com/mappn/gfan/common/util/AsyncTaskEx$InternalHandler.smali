.class Lcom/mappn/gfan/common/util/AsyncTaskEx$InternalHandler;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/util/AsyncTaskEx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InternalHandler"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mappn/gfan/common/util/AsyncTaskEx$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/common/util/AsyncTaskEx$InternalHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p0, Lcom/mappn/gfan/common/util/AsyncTaskEx$AsyncTaskResult;

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx$AsyncTaskResult;->mTask:Lcom/mappn/gfan/common/util/AsyncTaskEx;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx$AsyncTaskResult;->mData:[Ljava/lang/Object;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/AsyncTaskEx;->access$300(Lcom/mappn/gfan/common/util/AsyncTaskEx;Ljava/lang/Object;)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx$AsyncTaskResult;->mTask:Lcom/mappn/gfan/common/util/AsyncTaskEx;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx$AsyncTaskResult;->mData:[Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/AsyncTaskEx;->onProgressUpdate([Ljava/lang/Object;)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx$AsyncTaskResult;->mTask:Lcom/mappn/gfan/common/util/AsyncTaskEx;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/util/AsyncTaskEx;->onCancelled()V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
