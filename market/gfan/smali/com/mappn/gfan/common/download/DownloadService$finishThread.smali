.class Lcom/mappn/gfan/common/download/DownloadService$finishThread;
.super Ljava/lang/Thread;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/download/DownloadService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "finishThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/download/DownloadService;


# direct methods
.method private constructor <init>(Lcom/mappn/gfan/common/download/DownloadService;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadService$finishThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mappn/gfan/common/download/DownloadService;Lcom/mappn/gfan/common/download/DownloadService$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/download/DownloadService$finishThread;-><init>(Lcom/mappn/gfan/common/download/DownloadService;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService$finishThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    invoke-static {v0}, Lcom/mappn/gfan/common/download/DownloadService;->access$200(Lcom/mappn/gfan/common/download/DownloadService;)Lcom/mappn/gfan/common/download/DownloadNotification;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/common/download/DownloadNotification;->clearBadNotification()V

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService$finishThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService;->mUpdateThread:Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService$finishThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/download/DownloadService;->stopSelf()V

    :cond_0
    return-void
.end method
