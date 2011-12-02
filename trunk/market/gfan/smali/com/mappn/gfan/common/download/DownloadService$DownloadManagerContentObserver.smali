.class Lcom/mappn/gfan/common/download/DownloadService$DownloadManagerContentObserver;
.super Landroid/database/ContentObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/download/DownloadService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DownloadManagerContentObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/download/DownloadService;


# direct methods
.method public constructor <init>(Lcom/mappn/gfan/common/download/DownloadService;)V
    .locals 1

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadService$DownloadManagerContentObserver;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1

    const-string v0, "Service ContentObserver received notification"

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService$DownloadManagerContentObserver;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    invoke-static {v0}, Lcom/mappn/gfan/common/download/DownloadService;->access$000(Lcom/mappn/gfan/common/download/DownloadService;)V

    return-void
.end method
