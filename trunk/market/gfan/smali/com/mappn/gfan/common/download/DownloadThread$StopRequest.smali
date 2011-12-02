.class Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;
.super Ljava/lang/Throwable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/download/DownloadThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StopRequest"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x742ef624f0e0a034L


# instance fields
.field public mFinalStatus:I

.field final synthetic this$0:Lcom/mappn/gfan/common/download/DownloadThread;


# direct methods
.method public constructor <init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;->this$0:Lcom/mappn/gfan/common/download/DownloadThread;

    invoke-direct {p0, p3}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    iput p2, p0, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;->mFinalStatus:I

    return-void
.end method

.method public constructor <init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;->this$0:Lcom/mappn/gfan/common/download/DownloadThread;

    invoke-direct {p0, p3, p4}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iput p2, p0, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;->mFinalStatus:I

    return-void
.end method
