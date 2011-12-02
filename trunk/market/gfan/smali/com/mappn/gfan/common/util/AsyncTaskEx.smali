.class public abstract Lcom/mappn/gfan/common/util/AsyncTaskEx;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/common/util/AsyncTaskEx$4;,
        Lcom/mappn/gfan/common/util/AsyncTaskEx$AsyncTaskResult;,
        Lcom/mappn/gfan/common/util/AsyncTaskEx$WorkerRunnable;,
        Lcom/mappn/gfan/common/util/AsyncTaskEx$InternalHandler;,
        Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Params:",
        "Ljava/lang/Object;",
        "Progress:",
        "Ljava/lang/Object;",
        "Result:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final CORE_POOL_SIZE:I = 0xa

.field private static final KEEP_ALIVE:I = 0x14

.field private static final LOG_TAG:Ljava/lang/String; = "AsyncTaskEx"

.field private static final MAXIMUM_POOL_SIZE:I = 0xc8

.field private static final MESSAGE_POST_CANCEL:I = 0x3

.field private static final MESSAGE_POST_PROGRESS:I = 0x2

.field private static final MESSAGE_POST_RESULT:I = 0x1

.field private static final sExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private static final sHandler:Lcom/mappn/gfan/common/util/AsyncTaskEx$InternalHandler;

.field private static final sThreadFactory:Ljava/util/concurrent/ThreadFactory;

.field private static final sWorkQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mFuture:Ljava/util/concurrent/FutureTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/FutureTask",
            "<TResult;>;"
        }
    .end annotation
.end field

.field private volatile mStatus:Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;

.field private final mWorker:Lcom/mappn/gfan/common/util/AsyncTaskEx$WorkerRunnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mappn/gfan/common/util/AsyncTaskEx$WorkerRunnable",
            "<TParams;TResult;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 8

    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    sput-object v0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->sWorkQueue:Ljava/util/concurrent/BlockingQueue;

    new-instance v0, Lcom/mappn/gfan/common/util/AsyncTaskEx$1;

    invoke-direct {v0}, Lcom/mappn/gfan/common/util/AsyncTaskEx$1;-><init>()V

    sput-object v0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    const/16 v1, 0xa

    const/16 v2, 0xc8

    const-wide/16 v3, 0x14

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v6, Lcom/mappn/gfan/common/util/AsyncTaskEx;->sWorkQueue:Ljava/util/concurrent/BlockingQueue;

    sget-object v7, Lcom/mappn/gfan/common/util/AsyncTaskEx;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    sput-object v0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->sExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v0, Lcom/mappn/gfan/common/util/AsyncTaskEx$InternalHandler;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/mappn/gfan/common/util/AsyncTaskEx$InternalHandler;-><init>(Lcom/mappn/gfan/common/util/AsyncTaskEx$1;)V

    sput-object v0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->sHandler:Lcom/mappn/gfan/common/util/AsyncTaskEx$InternalHandler;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;->PENDING:Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->mStatus:Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;

    new-instance v0, Lcom/mappn/gfan/common/util/AsyncTaskEx$2;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/common/util/AsyncTaskEx$2;-><init>(Lcom/mappn/gfan/common/util/AsyncTaskEx;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->mWorker:Lcom/mappn/gfan/common/util/AsyncTaskEx$WorkerRunnable;

    new-instance v0, Lcom/mappn/gfan/common/util/AsyncTaskEx$3;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->mWorker:Lcom/mappn/gfan/common/util/AsyncTaskEx$WorkerRunnable;

    invoke-direct {v0, p0, v1}, Lcom/mappn/gfan/common/util/AsyncTaskEx$3;-><init>(Lcom/mappn/gfan/common/util/AsyncTaskEx;Ljava/util/concurrent/Callable;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->mFuture:Ljava/util/concurrent/FutureTask;

    return-void
.end method

.method static synthetic access$200()Lcom/mappn/gfan/common/util/AsyncTaskEx$InternalHandler;
    .locals 1

    sget-object v0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->sHandler:Lcom/mappn/gfan/common/util/AsyncTaskEx$InternalHandler;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mappn/gfan/common/util/AsyncTaskEx;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/util/AsyncTaskEx;->finish(Ljava/lang/Object;)V

    return-void
.end method

.method private finish(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/AsyncTaskEx;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/util/AsyncTaskEx;->onPostExecute(Ljava/lang/Object;)V

    sget-object v0, Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;->FINISHED:Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->mStatus:Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;

    return-void

    :cond_0
    move-object v0, p1

    goto :goto_0
.end method


# virtual methods
.method public final cancel(Z)Z
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->mFuture:Ljava/util/concurrent/FutureTask;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/FutureTask;->cancel(Z)Z

    move-result v0

    return v0
.end method

.method protected varargs abstract doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TParams;)TResult;"
        }
    .end annotation
.end method

.method public final varargs execute([Ljava/lang/Object;)Lcom/mappn/gfan/common/util/AsyncTaskEx;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TParams;)",
            "Lcom/mappn/gfan/common/util/AsyncTaskEx",
            "<TParams;TProgress;TResult;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->mStatus:Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;

    sget-object v1, Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;->PENDING:Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;

    if-eq v0, v1, :cond_0

    sget-object v0, Lcom/mappn/gfan/common/util/AsyncTaskEx$4;->$SwitchMap$com$mappn$gfan$common$util$AsyncTaskEx$Status:[I

    iget-object v1, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->mStatus:Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :cond_0
    sget-object v0, Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;->RUNNING:Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->mStatus:Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/AsyncTaskEx;->onPreExecute()V

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->mWorker:Lcom/mappn/gfan/common/util/AsyncTaskEx$WorkerRunnable;

    iput-object p1, v0, Lcom/mappn/gfan/common/util/AsyncTaskEx$WorkerRunnable;->mParams:[Ljava/lang/Object;

    sget-object v0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->sExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->mFuture:Ljava/util/concurrent/FutureTask;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    return-object p0

    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot execute task: the task is already running."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot execute task: the task has already been executed (a task can be executed only once)"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public final get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->mFuture:Ljava/util/concurrent/FutureTask;

    invoke-virtual {v0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->mFuture:Ljava/util/concurrent/FutureTask;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/FutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final getStatus()Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->mStatus:Lcom/mappn/gfan/common/util/AsyncTaskEx$Status;

    return-object v0
.end method

.method public final isCancelled()Z
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->mFuture:Ljava/util/concurrent/FutureTask;

    invoke-virtual {v0}, Ljava/util/concurrent/FutureTask;->isCancelled()Z

    move-result v0

    return v0
.end method

.method protected onCancelled()V
    .locals 0

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    return-void
.end method

.method protected onPreExecute()V
    .locals 0

    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TProgress;)V"
        }
    .end annotation

    return-void
.end method

.method protected final varargs publishProgress([Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TProgress;)V"
        }
    .end annotation

    sget-object v0, Lcom/mappn/gfan/common/util/AsyncTaskEx;->sHandler:Lcom/mappn/gfan/common/util/AsyncTaskEx$InternalHandler;

    const/4 v1, 0x2

    new-instance v2, Lcom/mappn/gfan/common/util/AsyncTaskEx$AsyncTaskResult;

    invoke-direct {v2, p0, p1}, Lcom/mappn/gfan/common/util/AsyncTaskEx$AsyncTaskResult;-><init>(Lcom/mappn/gfan/common/util/AsyncTaskEx;[Ljava/lang/Object;)V

    invoke-virtual {v0, v1, v2}, Lcom/mappn/gfan/common/util/AsyncTaskEx$InternalHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method
