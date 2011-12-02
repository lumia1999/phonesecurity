.class Lcom/mappn/gfan/common/download/DownloadThread$State;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/download/DownloadThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "State"
.end annotation


# instance fields
.field public mCountRetry:Z

.field public mDigester:Ljava/security/MessageDigest;

.field public mFilename:Ljava/lang/String;

.field public mGotData:Z

.field public mMimeType:Ljava/lang/String;

.field public mNewUri:Ljava/lang/String;

.field public mRedirectCount:I

.field public mRequestUri:Ljava/lang/String;

.field public mRetryAfter:I

.field public mSourceType:I

.field public mStream:Ljava/io/FileOutputStream;


# direct methods
.method public constructor <init>(Lcom/mappn/gfan/common/download/DownloadInfo;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, p0, Lcom/mappn/gfan/common/download/DownloadThread$State;->mCountRetry:Z

    iput v0, p0, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRetryAfter:I

    iput v0, p0, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRedirectCount:I

    iput-boolean v0, p0, Lcom/mappn/gfan/common/download/DownloadThread$State;->mGotData:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/mappn/gfan/common/download/DownloadThread$State;->mSourceType:I

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mMimeType:Ljava/lang/String;

    invoke-static {v0}, Lcom/mappn/gfan/common/download/DownloadThread;->access$000(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread$State;->mMimeType:Ljava/lang/String;

    iget v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mRedirectCount:I

    iput v0, p0, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRedirectCount:I

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    iput-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread$State;->mRequestUri:Ljava/lang/String;

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mFileName:Ljava/lang/String;

    iput-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread$State;->mFilename:Ljava/lang/String;

    iget v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mSource:I

    iput v0, p0, Lcom/mappn/gfan/common/download/DownloadThread$State;->mSourceType:I

    :try_start_0
    const-string v0, "MD5"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/download/DownloadThread$State;->mDigester:Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "no algorithm for md5"

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    goto :goto_0
.end method
