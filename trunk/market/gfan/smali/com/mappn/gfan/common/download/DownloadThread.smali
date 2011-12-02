.class public Lcom/mappn/gfan/common/download/DownloadThread;
.super Ljava/lang/Thread;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/common/download/DownloadThread$1;,
        Lcom/mappn/gfan/common/download/DownloadThread$RetryDownload;,
        Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;,
        Lcom/mappn/gfan/common/download/DownloadThread$InnerState;,
        Lcom/mappn/gfan/common/download/DownloadThread$State;
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/mappn/gfan/common/download/DownloadInfo;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    invoke-static {p0}, Lcom/mappn/gfan/common/download/DownloadThread;->sanitizeMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private addRequestHeaders(Lcom/mappn/gfan/common/download/DownloadThread$InnerState;Lorg/apache/http/client/methods/HttpGet;)V
    .locals 3

    iget-boolean v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mContinuingDownload:Z

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mLastModified:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v0, "If-Range"

    iget-object v1, p1, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mLastModified:Ljava/lang/String;

    invoke-virtual {p2, v0, v1}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-string v0, "Range"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bytes="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mBytesSoFar:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method private cannotResume(Lcom/mappn/gfan/common/download/DownloadThread$InnerState;)Z
    .locals 1

    iget v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mBytesSoFar:I

    if-lez v0, :cond_0

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderETag:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private checkConnectivity(Lcom/mappn/gfan/common/download/DownloadThread$State;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/download/DownloadInfo;->checkCanUseNetwork()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/16 v1, 0xc3

    new-instance v2, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    iget-object v3, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v3, v0}, Lcom/mappn/gfan/common/download/DownloadInfo;->getLogMessageForNetworkError(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, p0, v1, v0}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;)V

    throw v2

    :cond_0
    return-void
.end method

.method private checkFile(Lcom/mappn/gfan/common/download/DownloadThread$State;)Z
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mMD5:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v0, v2

    :goto_0
    return v0

    :cond_0
    iget-object v1, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mDigester:Ljava/security/MessageDigest;

    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/download/DownloadThread;->convertToHex([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v2

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private checkPausedOrCanceled(Lcom/mappn/gfan/common/download/DownloadThread$State;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;
        }
    .end annotation

    const/16 v5, 0x1ea

    const/4 v4, 0x2

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v1, v1, Lcom/mappn/gfan/common/download/DownloadInfo;->mControl:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    new-instance v1, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    const/16 v2, 0xc1

    const-string v3, "download paused by owner"

    invoke-direct {v1, p0, v2, v3}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;)V

    throw v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v1, v1, Lcom/mappn/gfan/common/download/DownloadInfo;->mControl:I

    if-ne v1, v4, :cond_1

    new-instance v1, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    const/16 v2, 0xc4

    const-string v3, "download is in pending status"

    invoke-direct {v1, p0, v2, v3}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;)V

    throw v1

    :cond_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v0, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mStatus:I

    if-ne v0, v5, :cond_3

    const-string v0, "application/vnd.android.package-archive"

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v1, v1, Lcom/mappn/gfan/common/download/DownloadInfo;->mMimeType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v1, v1, Lcom/mappn/gfan/common/download/DownloadInfo;->mSource:I

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v2, v2, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    const-string v3, ""

    invoke-static {v0, v4, v1, v2, v3}, Lcom/mappn/gfan/common/util/Utils;->submitDownloadLog(Landroid/content/Context;IILjava/lang/String;Ljava/lang/String;)V

    :cond_2
    new-instance v0, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    const-string v1, "download canceled"

    invoke-direct {v0, p0, v5, v1}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;)V

    throw v0

    :cond_3
    return-void
.end method

.method private cleanupDestination(Lcom/mappn/gfan/common/download/DownloadThread$State;I)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/download/DownloadThread;->closeDestination(Lcom/mappn/gfan/common/download/DownloadThread$State;)V

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-static {p2}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusError(I)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/File;

    iget-object v1, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method private closeDestination(Lcom/mappn/gfan/common/download/DownloadThread$State;)V
    .locals 3

    :try_start_0
    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "exception when closing the file after download : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static convertToHex([B)Ljava/lang/String;
    .locals 7

    const/4 v6, 0x0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move v1, v6

    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    aget-byte v2, p0, v1

    ushr-int/lit8 v2, v2, 0x4

    and-int/lit8 v2, v2, 0xf

    move v3, v2

    move v2, v6

    :goto_1
    if-ltz v3, :cond_0

    const/16 v4, 0x9

    if-gt v3, v4, :cond_0

    add-int/lit8 v3, v3, 0x30

    int-to-char v3, v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_2
    aget-byte v3, p0, v1

    and-int/lit8 v3, v3, 0xf

    add-int/lit8 v4, v2, 0x1

    const/4 v5, 0x1

    if-lt v2, v5, :cond_2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const/16 v4, 0xa

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x61

    int-to-char v3, v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_2
    move v2, v4

    goto :goto_1
.end method

.method private executeDownload(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/AndroidHttpClient;Lorg/apache/http/client/methods/HttpGet;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;,
            Lcom/mappn/gfan/common/download/DownloadThread$RetryDownload;
        }
    .end annotation

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;-><init>(Lcom/mappn/gfan/common/download/DownloadThread$1;)V

    const/16 v1, 0x1000

    new-array v1, v1, [B

    invoke-direct {p0, p1, v0}, Lcom/mappn/gfan/common/download/DownloadThread;->setupDestinationFile(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;)V

    invoke-direct {p0, v0, p3}, Lcom/mappn/gfan/common/download/DownloadThread;->addRequestHeaders(Lcom/mappn/gfan/common/download/DownloadThread$InnerState;Lorg/apache/http/client/methods/HttpGet;)V

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/download/DownloadThread;->checkConnectivity(Lcom/mappn/gfan/common/download/DownloadThread$State;)V

    invoke-direct {p0, p1, p2, p3}, Lcom/mappn/gfan/common/download/DownloadThread;->sendRequest(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/AndroidHttpClient;Lorg/apache/http/client/methods/HttpGet;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    invoke-direct {p0, p1, v0, v2}, Lcom/mappn/gfan/common/download/DownloadThread;->handleExceptionalStatus(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;Lorg/apache/http/HttpResponse;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "received response for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v4, v4, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    invoke-direct {p0, p1, v0, v2}, Lcom/mappn/gfan/common/download/DownloadThread;->processResponseHeaders(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;Lorg/apache/http/HttpResponse;)V

    invoke-direct {p0, p1, v2}, Lcom/mappn/gfan/common/download/DownloadThread;->openResponseEntity(Lcom/mappn/gfan/common/download/DownloadThread$State;Lorg/apache/http/HttpResponse;)Ljava/io/InputStream;

    move-result-object v2

    new-instance v3, Ljava/security/DigestInputStream;

    iget-object v4, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mDigester:Ljava/security/MessageDigest;

    invoke-direct {v3, v2, v4}, Ljava/security/DigestInputStream;-><init>(Ljava/io/InputStream;Ljava/security/MessageDigest;)V

    invoke-direct {p0, p1, v0, v1, v3}, Lcom/mappn/gfan/common/download/DownloadThread;->transferData(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;[BLjava/io/InputStream;)V

    return-void
.end method

.method private finalizeDestinationFile(Lcom/mappn/gfan/common/download/DownloadThread$State;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/download/DownloadThread;->syncDestination(Lcom/mappn/gfan/common/download/DownloadThread$State;)V

    return-void
.end method

.method private getFinalStatusForHttpError(Lcom/mappn/gfan/common/download/DownloadThread$State;)I
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mappn/gfan/common/download/Helper;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0xc3

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v0, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mNumFailed:I

    const/4 v1, 0x5

    if-ge v0, v1, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mCountRetry:Z

    const/16 v0, 0xc2

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "reached max retries for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-wide v1, v1, Lcom/mappn/gfan/common/download/DownloadInfo;->mId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    const/16 v0, 0x1ef

    goto :goto_0
.end method

.method private handleEndOfStream(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;
        }
    .end annotation

    const/4 v3, 0x0

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "current_bytes"

    iget v2, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mBytesSoFar:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v1, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderContentLength:Ljava/lang/String;

    if-nez v1, :cond_0

    const-string v1, "total_bytes"

    iget v2, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mBytesSoFar:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :cond_0
    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v2}, Lcom/mappn/gfan/common/download/DownloadInfo;->getMyDownloadsUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2, v0, v3, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    iget-object v0, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderContentLength:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget v0, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mBytesSoFar:I

    iget-object v1, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderContentLength:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_1

    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_3

    invoke-direct {p0, p2}, Lcom/mappn/gfan/common/download/DownloadThread;->cannotResume(Lcom/mappn/gfan/common/download/DownloadThread$InnerState;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    const/16 v1, 0x1e9

    const-string v2, "mismatched content length"

    invoke-direct {v0, p0, v1, v2}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;)V

    throw v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :cond_2
    new-instance v0, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/download/DownloadThread;->getFinalStatusForHttpError(Lcom/mappn/gfan/common/download/DownloadThread$State;)I

    move-result v1

    const-string v2, "closed socket before end of file"

    invoke-direct {v0, p0, v1, v2}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;)V

    throw v0

    :cond_3
    return-void
.end method

.method private handleExceptionalStatus(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;Lorg/apache/http/HttpResponse;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;,
            Lcom/mappn/gfan/common/download/DownloadThread$RetryDownload;
        }
    .end annotation

    invoke-interface {p3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0x1f7

    if-ne v0, v1, :cond_0

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v1, v1, Lcom/mappn/gfan/common/download/DownloadInfo;->mNumFailed:I

    const/4 v2, 0x5

    if-ge v1, v2, :cond_0

    invoke-direct {p0, p1, p3}, Lcom/mappn/gfan/common/download/DownloadThread;->handleServiceUnavailable(Lcom/mappn/gfan/common/download/DownloadThread$State;Lorg/apache/http/HttpResponse;)V

    :cond_0
    const/16 v1, 0x12d

    if-eq v0, v1, :cond_1

    const/16 v1, 0x12e

    if-eq v0, v1, :cond_1

    const/16 v1, 0x12f

    if-eq v0, v1, :cond_1

    const/16 v1, 0x133

    if-ne v0, v1, :cond_2

    :cond_1
    invoke-direct {p0, p1, p3, v0}, Lcom/mappn/gfan/common/download/DownloadThread;->handleRedirect(Lcom/mappn/gfan/common/download/DownloadThread$State;Lorg/apache/http/HttpResponse;I)V

    :cond_2
    iget-boolean v1, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mContinuingDownload:Z

    if-eqz v1, :cond_4

    const/16 v1, 0xce

    :goto_0
    if-eq v0, v1, :cond_3

    invoke-direct {p0, p1, p2, v0}, Lcom/mappn/gfan/common/download/DownloadThread;->handleOtherStatus(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;I)V

    :cond_3
    return-void

    :cond_4
    const/16 v1, 0xc8

    goto :goto_0
.end method

.method private handleOtherStatus(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;
        }
    .end annotation

    invoke-static {p3}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusError(I)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, p3

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "throw new stop request ----> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " statusCode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " isContinuing "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mContinuingDownload:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " fileName "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    new-instance v1, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http error "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p0, v0, v2}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;)V

    throw v1

    :cond_0
    const/16 v0, 0x12c

    if-lt p3, v0, :cond_1

    const/16 v0, 0x190

    if-ge p3, v0, :cond_1

    const/16 v0, 0x1ed

    goto :goto_0

    :cond_1
    iget-boolean v0, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mContinuingDownload:Z

    if-eqz v0, :cond_2

    const/16 v0, 0xc8

    if-ne p3, v0, :cond_2

    const/16 v0, 0x1e9

    goto :goto_0

    :cond_2
    const/16 v0, 0x1ee

    goto :goto_0
.end method

.method private handleRedirect(Lcom/mappn/gfan/common/download/DownloadThread$State;Lorg/apache/http/HttpResponse;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;,
            Lcom/mappn/gfan/common/download/DownloadThread$RetryDownload;
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "got HTTP redirect "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    iget v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRedirectCount:I

    const/4 v1, 0x5

    if-lt v0, v1, :cond_0

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    const/16 v1, 0x1f1

    const-string v2, "too many redirects"

    invoke-direct {v0, p0, v1, v2}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;)V

    throw v0

    :cond_0
    const-string v0, "Location"

    invoke-interface {p2, v0}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Location :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    :try_start_0
    new-instance v1, Ljava/net/URI;

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v2, v2, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/net/URI;

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/net/URI;->resolve(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    iget v1, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRedirectCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRedirectCount:I

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRequestUri:Ljava/lang/String;

    const/16 v1, 0x12d

    if-eq p3, v1, :cond_2

    const/16 v1, 0x12f

    if-ne p3, v1, :cond_3

    :cond_2
    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mNewUri:Ljava/lang/String;

    :cond_3
    new-instance v0, Lcom/mappn/gfan/common/download/DownloadThread$RetryDownload;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mappn/gfan/common/download/DownloadThread$RetryDownload;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;Lcom/mappn/gfan/common/download/DownloadThread$1;)V

    throw v0

    :catch_0
    move-exception v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Couldn\'t resolve redirect URI "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v1, v1, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    const/16 v1, 0x1ef

    const-string v2, "Couldn\'t resolve redirect URI"

    invoke-direct {v0, p0, v1, v2}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;)V

    throw v0
.end method

.method private handleServiceUnavailable(Lcom/mappn/gfan/common/download/DownloadThread$State;Lorg/apache/http/HttpResponse;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;
        }
    .end annotation

    const v4, 0x15180

    const/16 v3, 0x1e

    const-string v0, "got HTTP response code 503"

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mCountRetry:Z

    const-string v0, "Retry-After"

    invoke-interface {p2, v0}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Retry-After :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRetryAfter:I

    iget v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRetryAfter:I

    if-gez v0, :cond_1

    const/4 v0, 0x0

    iput v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRetryAfter:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    new-instance v0, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    const/16 v1, 0xc2

    const-string v2, "got 503 Service Unavailable, will retry later"

    invoke-direct {v0, p0, v1, v2}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;)V

    throw v0

    :cond_1
    :try_start_1
    iget v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRetryAfter:I

    if-ge v0, v3, :cond_3

    const/16 v0, 0x1e

    iput v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRetryAfter:I

    :cond_2
    :goto_1
    iget v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRetryAfter:I

    sget-object v1, Lcom/mappn/gfan/common/download/Helper;->rnd:Ljava/util/Random;

    const/16 v2, 0x1f

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRetryAfter:I

    iget v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRetryAfter:I

    mul-int/lit16 v0, v0, 0x3e8

    iput v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRetryAfter:I

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0

    :cond_3
    iget v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRetryAfter:I

    if-le v0, v4, :cond_2

    const v0, 0x15180

    iput v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRetryAfter:I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private logNetworkState()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Net "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/mappn/gfan/common/download/Helper;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "Up"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->I(Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v1, "Down"

    goto :goto_0
.end method

.method private notifyDownloadCompleted(IZIIZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct/range {p0 .. p8}, Lcom/mappn/gfan/common/download/DownloadThread;->notifyThroughDatabase(IZIIZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private notifyThroughDatabase(IZIIZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    const/4 v4, 0x0

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "status"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "_data"

    invoke-virtual {v0, v1, p6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p7, :cond_0

    const-string v1, "uri"

    invoke-virtual {v0, v1, p7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-string v1, "mimetype"

    invoke-virtual {v0, v1, p8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "lastmod"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "redirectcount"

    shl-int/lit8 v2, p4, 0x1c

    add-int/2addr v2, p3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    if-nez p2, :cond_1

    const-string v1, "numfailed"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :goto_0
    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v2}, Lcom/mappn/gfan/common/download/DownloadInfo;->getMyDownloadsUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2, v0, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void

    :cond_1
    if-eqz p5, :cond_2

    const-string v1, "numfailed"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0

    :cond_2
    const-string v1, "numfailed"

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v2, v2, Lcom/mappn/gfan/common/download/DownloadInfo;->mNumFailed:I

    add-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0
.end method

.method private openResponseEntity(Lcom/mappn/gfan/common/download/DownloadThread$State;Lorg/apache/http/HttpResponse;)Ljava/io/InputStream;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;
        }
    .end annotation

    :try_start_0
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    invoke-direct {p0}, Lcom/mappn/gfan/common/download/DownloadThread;->logNetworkState()V

    new-instance v1, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/download/DownloadThread;->getFinalStatusForHttpError(Lcom/mappn/gfan/common/download/DownloadThread$State;)I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "while getting entity: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3, v0}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private processResponseHeaders(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;Lorg/apache/http/HttpResponse;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;
        }
    .end annotation

    iget-boolean v0, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mContinuingDownload:Z

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/mappn/gfan/common/download/DownloadThread;->readResponseHeaders(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;Lorg/apache/http/HttpResponse;)V

    :try_start_0
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v1, v1, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v2, v2, Lcom/mappn/gfan/common/download/DownloadInfo;->mHint:Ljava/lang/String;

    iget-object v3, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderContentLocation:Ljava/lang/String;

    iget-object v4, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mMimeType:Ljava/lang/String;

    iget-object v5, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v5, v5, Lcom/mappn/gfan/common/download/DownloadInfo;->mDestination:I

    iget-object v6, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-wide v6, v6, Lcom/mappn/gfan/common/download/DownloadInfo;->mTotalBytes:J

    iget-object v8, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v8, v8, Lcom/mappn/gfan/common/download/DownloadInfo;->mSource:I

    invoke-static/range {v0 .. v8}, Lcom/mappn/gfan/common/download/Helper;->generateSaveFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJI)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;
    :try_end_0
    .catch Lcom/mappn/gfan/common/download/Helper$GenerateSaveFileError; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "writing "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v1, v1, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "totalbytes "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-wide v1, v1, Lcom/mappn/gfan/common/download/DownloadInfo;->mTotalBytes:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    invoke-direct {p0, p1, p2}, Lcom/mappn/gfan/common/download/DownloadThread;->updateDatabaseFromHeaders(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;)V

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/download/DownloadThread;->checkConnectivity(Lcom/mappn/gfan/common/download/DownloadThread$State;)V

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    iget v2, v0, Lcom/mappn/gfan/common/download/Helper$GenerateSaveFileError;->mStatus:I

    iget-object v0, v0, Lcom/mappn/gfan/common/download/Helper$GenerateSaveFileError;->mMessage:Ljava/lang/String;

    invoke-direct {v1, p0, v2, v0}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;)V

    throw v1

    :catch_1
    move-exception v0

    new-instance v1, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    const/16 v2, 0x1ec

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "while opening destination file: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3, v0}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private readFromResponse(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;[BLjava/io/InputStream;)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;
        }
    .end annotation

    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {p4, p3}, Ljava/io/InputStream;->read([B)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    return v0

    :catch_0
    move-exception v0

    invoke-direct {p0}, Lcom/mappn/gfan/common/download/DownloadThread;->logNetworkState()V

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "current_bytes"

    iget v3, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mBytesSoFar:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-object v3, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v3}, Lcom/mappn/gfan/common/download/DownloadInfo;->getMyDownloadsUri()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3, v1, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-direct {p0, p2}, Lcom/mappn/gfan/common/download/DownloadThread;->cannotResume(Lcom/mappn/gfan/common/download/DownloadThread$InnerState;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "while reading response: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", can\'t resume interrupted download with no ETag"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    const/16 v3, 0x1e9

    invoke-direct {v2, p0, v3, v1, v0}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :cond_0
    new-instance v1, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/download/DownloadThread;->getFinalStatusForHttpError(Lcom/mappn/gfan/common/download/DownloadThread$State;)I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "while reading response: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3, v0}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private readResponseHeaders(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;Lorg/apache/http/HttpResponse;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;
        }
    .end annotation

    const-string v0, "Content-Location"

    invoke-interface {p3, v0}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderContentLocation:Ljava/lang/String;

    :cond_0
    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mMimeType:Ljava/lang/String;

    if-nez v0, :cond_1

    const-string v0, "Content-Type"

    invoke-interface {p3, v0}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/download/DownloadThread;->sanitizeMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mMimeType:Ljava/lang/String;

    :cond_1
    const-string v0, "Last-Modified"

    invoke-interface {p3, v0}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderETag:Ljava/lang/String;

    :cond_2
    const/4 v0, 0x0

    const-string v1, "Transfer-Encoding"

    invoke-interface {p3, v1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    :cond_3
    if-nez v0, :cond_6

    const-string v1, "Content-Length"

    invoke-interface {p3, v1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    if-eqz v1, :cond_4

    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderContentLength:Ljava/lang/String;

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v2, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderContentLength:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/mappn/gfan/common/download/DownloadInfo;->mTotalBytes:J

    :cond_4
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Content-Length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderContentLength:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Content-Location: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderContentLocation:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Content-Type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mMimeType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ETag: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderETag:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Transfer-Encoding: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "total-bytes: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-wide v2, v2, Lcom/mappn/gfan/common/download/DownloadInfo;->mTotalBytes:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    iget-object v1, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderContentLength:Ljava/lang/String;

    if-nez v1, :cond_7

    if-eqz v0, :cond_5

    const-string v1, "chunked"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_7

    :cond_5
    const/4 v0, 0x1

    :goto_1
    if-eqz v0, :cond_8

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    const/16 v1, 0x1ef

    const-string v2, "can\'t know size of download, giving up"

    invoke-direct {v0, p0, v1, v2}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;)V

    throw v0

    :cond_6
    const-string v1, "ignoring content-length because of xfer-encoding"

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_7
    const/4 v0, 0x0

    goto :goto_1

    :cond_8
    return-void
.end method

.method private reportProgress(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;)V
    .locals 7

    const/4 v6, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget v2, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mBytesSoFar:I

    iget v3, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mBytesNotified:I

    sub-int/2addr v2, v3

    const/16 v3, 0x1000

    if-le v2, v3, :cond_0

    iget-wide v2, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mTimeLastNotification:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x5dc

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v3, "current_bytes"

    iget v4, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mBytesSoFar:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v3, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    iget-object v4, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v4}, Lcom/mappn/gfan/common/download/DownloadInfo;->getMyDownloadsUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3, v4, v2, v6, v6}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    iget v2, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mBytesSoFar:I

    iput v2, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mBytesNotified:I

    iput-wide v0, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mTimeLastNotification:J

    :cond_0
    return-void
.end method

.method private static sanitizeMimeType(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x3b

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :cond_0
    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method private sendRequest(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/AndroidHttpClient;Lorg/apache/http/client/methods/HttpGet;)Lorg/apache/http/HttpResponse;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p2, p3}, Lcom/mappn/gfan/common/AndroidHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    const/16 v2, 0x1ef

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "while trying to execute request: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3, v0}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception v0

    invoke-direct {p0}, Lcom/mappn/gfan/common/download/DownloadThread;->logNetworkState()V

    new-instance v1, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/download/DownloadThread;->getFinalStatusForHttpError(Lcom/mappn/gfan/common/download/DownloadThread$State;)I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "while trying to execute request: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3, v0}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private setupDestinationFile(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;
        }
    .end annotation

    const/4 v8, 0x1

    const/16 v7, 0x1ec

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    iget v1, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mSourceType:I

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/download/Helper;->isFilenameValid(Ljava/lang/String;I)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    const-string v1, "found invalid internal destination filename"

    invoke-direct {v0, p0, v7, v1}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;)V

    throw v0

    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v1, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-nez v3, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    :cond_1
    :goto_0
    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v0, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mDestination:I

    if-nez v0, :cond_2

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/download/DownloadThread;->closeDestination(Lcom/mappn/gfan/common/download/DownloadThread$State;)V

    :cond_2
    return-void

    :cond_3
    iget-object v3, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v3, v3, Lcom/mappn/gfan/common/download/DownloadInfo;->mETag:Ljava/lang/String;

    if-nez v3, :cond_4

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    const/16 v1, 0x1e9

    const-string v2, "Trying to resume a download that can\'t be resumed"

    invoke-direct {v0, p0, v1, v2}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;)V

    throw v0

    :cond_4
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v3, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    const/4 v4, 0x1

    invoke-direct {v0, v3, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;

    new-instance v0, Ljava/io/FileInputStream;

    iget-object v3, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-direct {v0, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/security/DigestInputStream;

    iget-object v4, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mDigester:Ljava/security/MessageDigest;

    invoke-direct {v3, v0, v4}, Ljava/security/DigestInputStream;-><init>(Ljava/io/InputStream;Ljava/security/MessageDigest;)V

    const/16 v4, 0x2000

    new-array v4, v4, [B

    :cond_5
    invoke-virtual {v3, v4}, Ljava/security/DigestInputStream;->read([B)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_5

    invoke-virtual {v3}, Ljava/security/DigestInputStream;->close()V

    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    long-to-int v0, v1

    iput v0, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mBytesSoFar:I

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-wide v0, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mTotalBytes:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-wide v0, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mTotalBytes:J

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderContentLength:Ljava/lang/String;

    :cond_6
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mETag:Ljava/lang/String;

    iput-object v0, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderETag:Ljava/lang/String;

    iput-boolean v8, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mContinuingDownload:Z

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "while opening destination for resuming: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p0, v7, v2, v0}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception v0

    new-instance v1, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "while opening destination for resuming: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p0, v7, v2, v0}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private syncDestination(Lcom/mappn/gfan/common/download/DownloadThread$State;)V
    .locals 5

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    iget-object v2, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/SyncFailedException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_6

    :try_start_1
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/FileDescriptor;->sync()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_13
    .catch Ljava/io/SyncFailedException; {:try_start_1 .. :try_end_1} :catch_12
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_11
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_10

    if-eqz v1, :cond_0

    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_e
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_f

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v1

    move-object v4, v1

    move-object v1, v0

    move-object v0, v4

    :goto_1
    :try_start_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not found: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v1, :cond_0

    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_a

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v1, "IOException while closing synced file: "

    :goto_2
    invoke-static {v1, v0}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_2
    move-exception v1

    move-object v4, v1

    move-object v1, v0

    move-object v0, v4

    :goto_3
    :try_start_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " sync failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-eqz v1, :cond_0

    :try_start_6
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_b

    goto :goto_0

    :catch_3
    move-exception v0

    const-string v1, "IOException while closing synced file: "

    goto :goto_2

    :catch_4
    move-exception v1

    move-object v4, v1

    move-object v1, v0

    move-object v0, v4

    :goto_4
    :try_start_7
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "IOException trying to sync "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    if-eqz v1, :cond_0

    :try_start_8
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_c

    goto/16 :goto_0

    :catch_5
    move-exception v0

    const-string v1, "IOException while closing synced file: "

    goto :goto_2

    :catch_6
    move-exception v1

    move-object v4, v1

    move-object v1, v0

    move-object v0, v4

    :goto_5
    :try_start_9
    const-string v2, "exception while syncing file: "

    invoke-static {v2, v0}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    if-eqz v1, :cond_0

    :try_start_a
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_7
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_a} :catch_d

    goto/16 :goto_0

    :catch_7
    move-exception v0

    const-string v1, "IOException while closing synced file: "

    goto :goto_2

    :catchall_0
    move-exception v1

    move-object v4, v1

    move-object v1, v0

    move-object v0, v4

    :goto_6
    if-eqz v1, :cond_1

    :try_start_b
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_8
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_b} :catch_9

    :cond_1
    :goto_7
    throw v0

    :catch_8
    move-exception v1

    const-string v2, "IOException while closing synced file: "

    invoke-static {v2, v1}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_7

    :catch_9
    move-exception v1

    const-string v2, "exception while closing file: "

    invoke-static {v2, v1}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_7

    :catch_a
    move-exception v0

    const-string v1, "exception while closing file: "

    :goto_8
    invoke-static {v1, v0}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    :catch_b
    move-exception v0

    const-string v1, "exception while closing file: "

    goto :goto_8

    :catch_c
    move-exception v0

    const-string v1, "exception while closing file: "

    goto :goto_8

    :catch_d
    move-exception v0

    const-string v1, "exception while closing file: "

    goto :goto_8

    :catch_e
    move-exception v0

    const-string v1, "IOException while closing synced file: "

    goto/16 :goto_2

    :catch_f
    move-exception v0

    const-string v1, "exception while closing file: "

    goto :goto_8

    :catchall_1
    move-exception v0

    goto :goto_6

    :catch_10
    move-exception v0

    goto :goto_5

    :catch_11
    move-exception v0

    goto :goto_4

    :catch_12
    move-exception v0

    goto/16 :goto_3

    :catch_13
    move-exception v0

    goto/16 :goto_1
.end method

.method private transferData(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;[BLjava/io/InputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;
        }
    .end annotation

    :goto_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/mappn/gfan/common/download/DownloadThread;->readFromResponse(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;[BLjava/io/InputStream;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/mappn/gfan/common/download/DownloadThread;->handleEndOfStream(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;)V

    return-void

    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mGotData:Z

    invoke-direct {p0, p1, p3, v0}, Lcom/mappn/gfan/common/download/DownloadThread;->writeDataToDestination(Lcom/mappn/gfan/common/download/DownloadThread$State;[BI)V

    iget v1, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mBytesSoFar:I

    add-int/2addr v0, v1

    iput v0, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mBytesSoFar:I

    invoke-direct {p0, p1, p2}, Lcom/mappn/gfan/common/download/DownloadThread;->reportProgress(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;)V

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/download/DownloadThread;->checkPausedOrCanceled(Lcom/mappn/gfan/common/download/DownloadThread$State;)V

    goto :goto_0
.end method

.method private updateDatabaseFromHeaders(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/download/DownloadThread$InnerState;)V
    .locals 5

    const/4 v4, 0x0

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "_data"

    iget-object v2, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderETag:Ljava/lang/String;

    if-eqz v1, :cond_0

    const-string v1, "etag"

    iget-object v2, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderETag:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    iget-object v1, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mMimeType:Ljava/lang/String;

    if-eqz v1, :cond_1

    const-string v1, "mimetype"

    iget-object v2, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mMimeType:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iget-object v1, p2, Lcom/mappn/gfan/common/download/DownloadThread$InnerState;->mHeaderContentLength:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    const-string v3, "total_bytes"

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "update the header : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v2, v2, Lcom/mappn/gfan/common/download/DownloadInfo;->mPackageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " values "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v2}, Lcom/mappn/gfan/common/download/DownloadInfo;->getMyDownloadsUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2, v0, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method private updatePcakageName()V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v0, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mSource:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v0, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mSource:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v1, v1, Lcom/mappn/gfan/common/download/DownloadInfo;->mFileName:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->getPackageName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "package_name"

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v2}, Lcom/mappn/gfan/common/download/DownloadInfo;->getMyDownloadsUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2, v1, v3, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_1
    return-void
.end method

.method private writeDataToDestination(Lcom/mappn/gfan/common/download/DownloadThread$State;[BI)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;
        }
    .end annotation

    :try_start_0
    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;

    :cond_0
    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;

    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1, p3}, Ljava/io/FileOutputStream;->write([BII)V

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v0, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mDestination:I

    if-nez v0, :cond_1

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/download/DownloadThread;->closeDestination(Lcom/mappn/gfan/common/download/DownloadThread$State;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    return-void

    :catch_0
    move-exception v0

    new-instance v1, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;

    const/16 v2, 0x1ec

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "while writing destination file: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3, v0}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;-><init>(Lcom/mappn/gfan/common/download/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public run()V
    .locals 11

    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    new-instance v8, Lcom/mappn/gfan/common/download/DownloadThread$State;

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-direct {v8, v0}, Lcom/mappn/gfan/common/download/DownloadThread$State;-><init>(Lcom/mappn/gfan/common/download/DownloadInfo;)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/16 v1, 0x1eb

    :try_start_0
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const-string v4, "power"

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    const/4 v4, 0x1

    sget-object v5, Lcom/mappn/gfan/common/util/Utils;->sLogTag:Ljava/lang/String;

    invoke-virtual {v0, v4, v5}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2
    .catch Lcom/mappn/gfan/common/download/DownloadThread$StopRequest; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v0

    :try_start_1
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "initiating download for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v4, v4, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    invoke-static {}, Lcom/mappn/gfan/common/HttpClientFactory;->get()Lcom/mappn/gfan/common/HttpClientFactory;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mappn/gfan/common/HttpClientFactory;->getHttpClient()Lcom/mappn/gfan/common/AndroidHttpClient;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Lcom/mappn/gfan/common/download/DownloadThread$StopRequest; {:try_start_1 .. :try_end_1} :catch_6
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_4

    move-result-object v2

    const/4 v3, 0x0

    :goto_0
    if-nez v3, :cond_8

    :try_start_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Initiating request for download "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-wide v5, v5, Lcom/mappn/gfan/common/download/DownloadInfo;->mId:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " url "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v5, v5, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    new-instance v4, Lorg/apache/http/client/methods/HttpGet;

    iget-object v5, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRequestUri:Ljava/lang/String;

    invoke-direct {v4, v5}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Lcom/mappn/gfan/common/download/DownloadThread$StopRequest; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    :try_start_3
    invoke-direct {p0, v8, v2, v4}, Lcom/mappn/gfan/common/download/DownloadThread;->executeDownload(Lcom/mappn/gfan/common/download/DownloadThread$State;Lcom/mappn/gfan/common/AndroidHttpClient;Lorg/apache/http/client/methods/HttpGet;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Lcom/mappn/gfan/common/download/DownloadThread$RetryDownload; {:try_start_3 .. :try_end_3} :catch_2

    const/4 v3, 0x1

    :try_start_4
    invoke-virtual {v4}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    .catch Lcom/mappn/gfan/common/download/DownloadThread$StopRequest; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    :catch_0
    move-exception v3

    move-object v10, v3

    move-object v3, v2

    move-object v2, v0

    move-object v0, v10

    :goto_1
    :try_start_5
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Aborting request for download "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-wide v5, v5, Lcom/mappn/gfan/common/download/DownloadInfo;->mId:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " url: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v5, v5, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;)V

    iget v1, v0, Lcom/mappn/gfan/common/download/DownloadThread$StopRequest;->mFinalStatus:I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_0
    if-eqz v3, :cond_1

    :cond_1
    invoke-direct {p0, v8, v1}, Lcom/mappn/gfan/common/download/DownloadThread;->cleanupDestination(Lcom/mappn/gfan/common/download/DownloadThread$State;I)V

    iget-boolean v2, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mCountRetry:Z

    iget v3, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRetryAfter:I

    iget v4, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRedirectCount:I

    iget-boolean v5, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mGotData:Z

    iget-object v6, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    iget-object v7, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mNewUri:Ljava/lang/String;

    iget-object v8, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mMimeType:Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/mappn/gfan/common/download/DownloadThread;->notifyDownloadCompleted(IZIIZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0xc8

    if-ne v1, v0, :cond_2

    invoke-direct {p0}, Lcom/mappn/gfan/common/download/DownloadThread;->updatePcakageName()V

    :cond_2
    const-string v0, "application/vnd.android.package-archive"

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v2, v2, Lcom/mappn/gfan/common/download/DownloadInfo;->mMimeType:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {v1}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusError(I)Z

    move-result v0

    if-eqz v0, :cond_15

    const/16 v0, 0x1f4

    if-lt v1, v0, :cond_16

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u4e0b\u8f7d\u5931\u8d25["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "] INFO : "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v4}, Lcom/mappn/gfan/common/download/DownloadInfo;->getVerboseInfo()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v3

    invoke-static {v0, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    :goto_3
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mHasActiveThread:Z

    return-void

    :catchall_0
    move-exception v3

    :try_start_6
    invoke-virtual {v4}, Lorg/apache/http/client/methods/HttpGet;->abort()V

    throw v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1
    .catch Lcom/mappn/gfan/common/download/DownloadThread$StopRequest; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_1

    :catch_1
    move-exception v3

    move-object v10, v3

    move-object v3, v2

    move-object v2, v0

    move-object v0, v10

    :goto_4
    :try_start_7
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception for id "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-wide v5, v5, Lcom/mappn/gfan/common/download/DownloadInfo;->mId:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " url: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v5, v5, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    if-eqz v2, :cond_4

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_4
    if-eqz v3, :cond_5

    :cond_5
    invoke-direct {p0, v8, v1}, Lcom/mappn/gfan/common/download/DownloadThread;->cleanupDestination(Lcom/mappn/gfan/common/download/DownloadThread$State;I)V

    iget-boolean v2, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mCountRetry:Z

    iget v3, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRetryAfter:I

    iget v4, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRedirectCount:I

    iget-boolean v5, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mGotData:Z

    iget-object v6, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    iget-object v7, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mNewUri:Ljava/lang/String;

    iget-object v8, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mMimeType:Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/mappn/gfan/common/download/DownloadThread;->notifyDownloadCompleted(IZIIZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0xc8

    if-ne v1, v0, :cond_6

    invoke-direct {p0}, Lcom/mappn/gfan/common/download/DownloadThread;->updatePcakageName()V

    :cond_6
    const-string v0, "application/vnd.android.package-archive"

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v2, v2, Lcom/mappn/gfan/common/download/DownloadInfo;->mMimeType:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-static {v1}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusError(I)Z

    move-result v0

    if-eqz v0, :cond_18

    const/16 v0, 0x1f4

    if-lt v1, v0, :cond_19

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u4e0b\u8f7d\u5931\u8d25["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "] INFO : "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v4}, Lcom/mappn/gfan/common/download/DownloadInfo;->getVerboseInfo()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v3

    invoke-static {v0, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    :cond_7
    :goto_5
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    goto/16 :goto_3

    :cond_8
    :try_start_8
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "download completed for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v4, v4, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    invoke-direct {p0, v8}, Lcom/mappn/gfan/common/download/DownloadThread;->checkFile(Lcom/mappn/gfan/common/download/DownloadThread$State;)Z

    move-result v3

    if-nez v3, :cond_d

    new-instance v3, Ljava/lang/Throwable;

    const-string v4, "File MD5 code is not the same as server"

    invoke-direct {v3, v4}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1
    .catch Lcom/mappn/gfan/common/download/DownloadThread$StopRequest; {:try_start_8 .. :try_end_8} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_1

    :catchall_1
    move-exception v3

    move-object v9, v3

    :goto_6
    if-eqz v0, :cond_9

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_9
    if-eqz v2, :cond_a

    :cond_a
    invoke-direct {p0, v8, v1}, Lcom/mappn/gfan/common/download/DownloadThread;->cleanupDestination(Lcom/mappn/gfan/common/download/DownloadThread$State;I)V

    iget-boolean v2, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mCountRetry:Z

    iget v3, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRetryAfter:I

    iget v4, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRedirectCount:I

    iget-boolean v5, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mGotData:Z

    iget-object v6, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    iget-object v7, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mNewUri:Ljava/lang/String;

    iget-object v8, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mMimeType:Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/mappn/gfan/common/download/DownloadThread;->notifyDownloadCompleted(IZIIZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0xc8

    if-ne v1, v0, :cond_b

    invoke-direct {p0}, Lcom/mappn/gfan/common/download/DownloadThread;->updatePcakageName()V

    :cond_b
    const-string v0, "application/vnd.android.package-archive"

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v2, v2, Lcom/mappn/gfan/common/download/DownloadInfo;->mMimeType:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-static {v1}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusError(I)Z

    move-result v0

    if-eqz v0, :cond_12

    const/16 v0, 0x1f4

    if-lt v1, v0, :cond_13

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u4e0b\u8f7d\u5931\u8d25["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "] INFO : "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v4}, Lcom/mappn/gfan/common/download/DownloadInfo;->getVerboseInfo()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v3

    invoke-static {v0, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    :cond_c
    :goto_7
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mHasActiveThread:Z

    throw v9

    :cond_d
    :try_start_9
    invoke-direct {p0, v8}, Lcom/mappn/gfan/common/download/DownloadThread;->finalizeDestinationFile(Lcom/mappn/gfan/common/download/DownloadThread$State;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1
    .catch Lcom/mappn/gfan/common/download/DownloadThread$StopRequest; {:try_start_9 .. :try_end_9} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_1

    const/16 v1, 0xc8

    if-eqz v0, :cond_e

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_e
    if-eqz v2, :cond_f

    :cond_f
    invoke-direct {p0, v8, v1}, Lcom/mappn/gfan/common/download/DownloadThread;->cleanupDestination(Lcom/mappn/gfan/common/download/DownloadThread$State;I)V

    iget-boolean v2, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mCountRetry:Z

    iget v3, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRetryAfter:I

    iget v4, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRedirectCount:I

    iget-boolean v5, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mGotData:Z

    iget-object v6, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    iget-object v7, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mNewUri:Ljava/lang/String;

    iget-object v8, v8, Lcom/mappn/gfan/common/download/DownloadThread$State;->mMimeType:Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/mappn/gfan/common/download/DownloadThread;->notifyDownloadCompleted(IZIIZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0xc8

    if-ne v1, v0, :cond_10

    invoke-direct {p0}, Lcom/mappn/gfan/common/download/DownloadThread;->updatePcakageName()V

    :cond_10
    const-string v0, "application/vnd.android.package-archive"

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v2, v2, Lcom/mappn/gfan/common/download/DownloadInfo;->mMimeType:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-static {v1}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusError(I)Z

    move-result v0

    if-eqz v0, :cond_1b

    const/16 v0, 0x1f4

    if-lt v1, v0, :cond_1c

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u4e0b\u8f7d\u5931\u8d25["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "] INFO : "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v4}, Lcom/mappn/gfan/common/download/DownloadInfo;->getVerboseInfo()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v3

    invoke-static {v0, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    :cond_11
    :goto_8
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    goto/16 :goto_3

    :catch_2
    move-exception v5

    :try_start_a
    invoke-virtual {v4}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1
    .catch Lcom/mappn/gfan/common/download/DownloadThread$StopRequest; {:try_start_a .. :try_end_a} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_1

    goto/16 :goto_0

    :cond_12
    const/16 v0, 0xc8

    if-ne v1, v0, :cond_c

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "\u4e0b\u8f7d\u5b8c\u6210"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v2, v2, Lcom/mappn/gfan/common/download/DownloadInfo;->mSource:I

    iget-object v3, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v3, v3, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    const-string v4, ""

    invoke-static {v0, v1, v2, v3, v4}, Lcom/mappn/gfan/common/util/Utils;->submitDownloadLog(Landroid/content/Context;IILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_7

    :cond_13
    const/16 v0, 0x1eb

    if-ne v1, v0, :cond_14

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u4e0b\u8f7d\u5931\u8d25["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "] INFO : "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v4}, Lcom/mappn/gfan/common/download/DownloadInfo;->getVerboseInfo()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v3

    invoke-static {v0, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto/16 :goto_7

    :cond_14
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u4e0b\u8f7d\u5931\u8d25["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "]"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v3

    invoke-static {v0, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto/16 :goto_7

    :cond_15
    const/16 v0, 0xc8

    if-ne v1, v0, :cond_3

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "\u4e0b\u8f7d\u5b8c\u6210"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v2, v2, Lcom/mappn/gfan/common/download/DownloadInfo;->mSource:I

    iget-object v3, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v3, v3, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    const-string v4, ""

    invoke-static {v0, v1, v2, v3, v4}, Lcom/mappn/gfan/common/util/Utils;->submitDownloadLog(Landroid/content/Context;IILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_16
    const/16 v0, 0x1eb

    if-ne v1, v0, :cond_17

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u4e0b\u8f7d\u5931\u8d25["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "] INFO : "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v4}, Lcom/mappn/gfan/common/download/DownloadInfo;->getVerboseInfo()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v3

    invoke-static {v0, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_17
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u4e0b\u8f7d\u5931\u8d25["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "]"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v3

    invoke-static {v0, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_18
    const/16 v0, 0xc8

    if-ne v1, v0, :cond_7

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "\u4e0b\u8f7d\u5b8c\u6210"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v2, v2, Lcom/mappn/gfan/common/download/DownloadInfo;->mSource:I

    iget-object v3, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v3, v3, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    const-string v4, ""

    invoke-static {v0, v1, v2, v3, v4}, Lcom/mappn/gfan/common/util/Utils;->submitDownloadLog(Landroid/content/Context;IILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5

    :cond_19
    const/16 v0, 0x1eb

    if-ne v1, v0, :cond_1a

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u4e0b\u8f7d\u5931\u8d25["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "] INFO : "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v4}, Lcom/mappn/gfan/common/download/DownloadInfo;->getVerboseInfo()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v3

    invoke-static {v0, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto/16 :goto_5

    :cond_1a
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u4e0b\u8f7d\u5931\u8d25["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "]"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v3

    invoke-static {v0, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto/16 :goto_5

    :cond_1b
    const/16 v0, 0xc8

    if-ne v1, v0, :cond_11

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "\u4e0b\u8f7d\u5b8c\u6210"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v2, v2, Lcom/mappn/gfan/common/download/DownloadInfo;->mSource:I

    iget-object v3, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-object v3, v3, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    const-string v4, ""

    invoke-static {v0, v1, v2, v3, v4}, Lcom/mappn/gfan/common/util/Utils;->submitDownloadLog(Landroid/content/Context;IILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_8

    :cond_1c
    const/16 v0, 0x1eb

    if-ne v1, v0, :cond_1d

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u4e0b\u8f7d\u5931\u8d25["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "] INFO : "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mInfo:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v4}, Lcom/mappn/gfan/common/download/DownloadInfo;->getVerboseInfo()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v3

    invoke-static {v0, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto/16 :goto_8

    :cond_1d
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread;->mContext:Landroid/content/Context;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u4e0b\u8f7d\u5931\u8d25["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "]"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v3

    invoke-static {v0, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto/16 :goto_8

    :catchall_2
    move-exception v0

    move-object v9, v0

    move-object v0, v3

    goto/16 :goto_6

    :catchall_3
    move-exception v0

    move-object v9, v0

    move-object v0, v2

    move-object v2, v3

    goto/16 :goto_6

    :catch_3
    move-exception v0

    move-object v10, v3

    move-object v3, v2

    move-object v2, v10

    goto/16 :goto_4

    :catch_4
    move-exception v3

    move-object v10, v3

    move-object v3, v2

    move-object v2, v0

    move-object v0, v10

    goto/16 :goto_4

    :catch_5
    move-exception v0

    move-object v10, v3

    move-object v3, v2

    move-object v2, v10

    goto/16 :goto_1

    :catch_6
    move-exception v3

    move-object v10, v3

    move-object v3, v2

    move-object v2, v0

    move-object v0, v10

    goto/16 :goto_1
.end method
