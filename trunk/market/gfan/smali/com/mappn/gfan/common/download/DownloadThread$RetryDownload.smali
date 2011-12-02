.class Lcom/mappn/gfan/common/download/DownloadThread$RetryDownload;
.super Ljava/lang/Throwable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/download/DownloadThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RetryDownload"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/download/DownloadThread;


# direct methods
.method private constructor <init>(Lcom/mappn/gfan/common/download/DownloadThread;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadThread$RetryDownload;->this$0:Lcom/mappn/gfan/common/download/DownloadThread;

    invoke-direct {p0}, Ljava/lang/Throwable;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mappn/gfan/common/download/DownloadThread;Lcom/mappn/gfan/common/download/DownloadThread$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/download/DownloadThread$RetryDownload;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;)V

    return-void
.end method
