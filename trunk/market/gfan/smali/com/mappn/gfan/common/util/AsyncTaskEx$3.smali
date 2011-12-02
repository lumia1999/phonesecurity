.class Lcom/mappn/gfan/common/util/AsyncTaskEx$3;
.super Ljava/util/concurrent/FutureTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/util/AsyncTaskEx;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/FutureTask",
        "<TResult;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/util/AsyncTaskEx;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/common/util/AsyncTaskEx;Ljava/util/concurrent/Callable;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx$3;->this$0:Lcom/mappn/gfan/common/util/AsyncTaskEx;

    invoke-direct {p0, p2}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    return-void
.end method


# virtual methods
.method protected done()V
    .locals 8

    const/4 v1, 0x0

    const/4 v7, 0x1

    :try_start_0
    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/AsyncTaskEx$3;->get()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v1

    :goto_0
    invoke-static {}, Lcom/mappn/gfan/common/util/AsyncTaskEx;->access$200()Lcom/mappn/gfan/common/util/AsyncTaskEx$InternalHandler;

    move-result-object v2

    new-instance v3, Lcom/mappn/gfan/common/util/AsyncTaskEx$AsyncTaskResult;

    iget-object v4, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx$3;->this$0:Lcom/mappn/gfan/common/util/AsyncTaskEx;

    new-array v5, v7, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    invoke-direct {v3, v4, v5}, Lcom/mappn/gfan/common/util/AsyncTaskEx$AsyncTaskResult;-><init>(Lcom/mappn/gfan/common/util/AsyncTaskEx;[Ljava/lang/Object;)V

    invoke-virtual {v2, v7, v3}, Lcom/mappn/gfan/common/util/AsyncTaskEx$InternalHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    :goto_1
    return-void

    :catch_0
    move-exception v2

    const-string v3, "AsyncTaskEx"

    invoke-static {v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :catch_1
    move-exception v1

    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "An error occured while executing doInBackground()"

    invoke-virtual {v1}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :catch_2
    move-exception v2

    invoke-static {}, Lcom/mappn/gfan/common/util/AsyncTaskEx;->access$200()Lcom/mappn/gfan/common/util/AsyncTaskEx$InternalHandler;

    move-result-object v2

    const/4 v3, 0x3

    new-instance v4, Lcom/mappn/gfan/common/util/AsyncTaskEx$AsyncTaskResult;

    iget-object v5, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx$3;->this$0:Lcom/mappn/gfan/common/util/AsyncTaskEx;

    move-object v0, v1

    check-cast v0, [Ljava/lang/Object;

    move-object p0, v0

    invoke-direct {v4, v5, p0}, Lcom/mappn/gfan/common/util/AsyncTaskEx$AsyncTaskResult;-><init>(Lcom/mappn/gfan/common/util/AsyncTaskEx;[Ljava/lang/Object;)V

    invoke-virtual {v2, v3, v4}, Lcom/mappn/gfan/common/util/AsyncTaskEx$InternalHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    goto :goto_1

    :catch_3
    move-exception v1

    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "An error occured while executing doInBackground()"

    invoke-direct {v2, v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
