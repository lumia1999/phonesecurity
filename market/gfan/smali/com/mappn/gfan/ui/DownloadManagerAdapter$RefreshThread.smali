.class Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;
.super Ljava/lang/Thread;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/DownloadManagerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RefreshThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;


# direct methods
.method private constructor <init>(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mappn/gfan/ui/DownloadManagerAdapter;Lcom/mappn/gfan/ui/DownloadManagerAdapter$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;-><init>(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$202(Lcom/mappn/gfan/ui/DownloadManagerAdapter;Z)Z

    :goto_0
    const-wide/16 v0, 0x7d0

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-static {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$300(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)J

    move-result-wide v0

    iget-object v2, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-static {v2}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$400(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$202(Lcom/mappn/gfan/ui/DownloadManagerAdapter;Z)Z

    return-void

    :catch_0
    move-exception v0

    const-string v1, "refresh downloading apps"

    invoke-static {v1, v0}, Lcom/mappn/gfan/common/util/Utils;->E(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$402(Lcom/mappn/gfan/ui/DownloadManagerAdapter;J)J

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-static {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$500(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)V

    goto :goto_0
.end method
