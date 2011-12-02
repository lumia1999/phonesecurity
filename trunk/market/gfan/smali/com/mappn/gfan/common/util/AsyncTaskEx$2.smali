.class Lcom/mappn/gfan/common/util/AsyncTaskEx$2;
.super Lcom/mappn/gfan/common/util/AsyncTaskEx$WorkerRunnable;


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
        "Lcom/mappn/gfan/common/util/AsyncTaskEx$WorkerRunnable",
        "<TParams;TResult;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/util/AsyncTaskEx;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/common/util/AsyncTaskEx;)V
    .locals 1

    iput-object p1, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx$2;->this$0:Lcom/mappn/gfan/common/util/AsyncTaskEx;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/util/AsyncTaskEx$WorkerRunnable;-><init>(Lcom/mappn/gfan/common/util/AsyncTaskEx$1;)V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx$2;->this$0:Lcom/mappn/gfan/common/util/AsyncTaskEx;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx$2;->mParams:[Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/AsyncTaskEx;->doInBackground([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
