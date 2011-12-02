.class public Lcom/mappn/gfan/common/download/DownloadInfo$Reader;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/download/DownloadInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Reader"
.end annotation


# instance fields
.field private mCursor:Landroid/database/Cursor;

.field private mNewChars:Landroid/database/CharArrayBuffer;

.field private mOldChars:Landroid/database/CharArrayBuffer;


# direct methods
.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mCursor:Landroid/database/Cursor;

    return-void
.end method

.method private getInt(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mCursor:Landroid/database/Cursor;

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1, p1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method private getLong(Ljava/lang/String;)Ljava/lang/Long;
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mCursor:Landroid/database/Cursor;

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1, p1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method private getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    const/4 v6, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    if-nez p1, :cond_0

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mNewChars:Landroid/database/CharArrayBuffer;

    if-nez v1, :cond_1

    new-instance v1, Landroid/database/CharArrayBuffer;

    const/16 v2, 0x80

    invoke-direct {v1, v2}, Landroid/database/CharArrayBuffer;-><init>(I)V

    iput-object v1, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mNewChars:Landroid/database/CharArrayBuffer;

    :cond_1
    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mCursor:Landroid/database/Cursor;

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mNewChars:Landroid/database/CharArrayBuffer;

    invoke-interface {v1, v0, v2}, Landroid/database/Cursor;->copyStringToBuffer(ILandroid/database/CharArrayBuffer;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mNewChars:Landroid/database/CharArrayBuffer;

    iget v0, v0, Landroid/database/CharArrayBuffer;->sizeCopied:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eq v0, v1, :cond_2

    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mNewChars:Landroid/database/CharArrayBuffer;

    iget-object v2, v2, Landroid/database/CharArrayBuffer;->data:[C

    invoke-direct {v1, v2, v6, v0}, Ljava/lang/String;-><init>([CII)V

    move-object v0, v1

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mOldChars:Landroid/database/CharArrayBuffer;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mOldChars:Landroid/database/CharArrayBuffer;

    iget v1, v1, Landroid/database/CharArrayBuffer;->sizeCopied:I

    if-ge v1, v0, :cond_4

    :cond_3
    new-instance v1, Landroid/database/CharArrayBuffer;

    invoke-direct {v1, v0}, Landroid/database/CharArrayBuffer;-><init>(I)V

    iput-object v1, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mOldChars:Landroid/database/CharArrayBuffer;

    :cond_4
    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mOldChars:Landroid/database/CharArrayBuffer;

    iget-object v1, v1, Landroid/database/CharArrayBuffer;->data:[C

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->mNewChars:Landroid/database/CharArrayBuffer;

    iget-object v2, v2, Landroid/database/CharArrayBuffer;->data:[C

    invoke-virtual {p1, v6, v0, v1, v6}, Ljava/lang/String;->getChars(II[CI)V

    const/4 v3, 0x1

    sub-int v3, v0, v3

    :goto_1
    if-ltz v3, :cond_6

    aget-char v4, v1, v3

    aget-char v5, v2, v3

    if-eq v4, v5, :cond_5

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v2, v6, v0}, Ljava/lang/String;-><init>([CII)V

    move-object v0, v1

    goto :goto_0

    :cond_5
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    :cond_6
    move-object v0, p1

    goto :goto_0
.end method


# virtual methods
.method public newDownloadInfo(Landroid/content/Context;)Lcom/mappn/gfan/common/download/DownloadInfo;
    .locals 2

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadInfo;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/mappn/gfan/common/download/DownloadInfo;-><init>(Landroid/content/Context;Lcom/mappn/gfan/common/download/DownloadInfo$1;)V

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->updateFromDatabase(Lcom/mappn/gfan/common/download/DownloadInfo;)V

    return-object v0
.end method

.method public updateFromDatabase(Lcom/mappn/gfan/common/download/DownloadInfo;)V
    .locals 3

    const/4 v2, 0x1

    const-string v0, "_id"

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mId:J

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    const-string v1, "uri"

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mUri:Ljava/lang/String;

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mHint:Ljava/lang/String;

    const-string v1, "hint"

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mHint:Ljava/lang/String;

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mFileName:Ljava/lang/String;

    const-string v1, "_data"

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mFileName:Ljava/lang/String;

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mMimeType:Ljava/lang/String;

    const-string v1, "mimetype"

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mMimeType:Ljava/lang/String;

    const-string v0, "destination"

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mDestination:I

    const-string v0, "visibility"

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mVisibility:I

    const-string v0, "status"

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mStatus:I

    const-string v0, "numfailed"

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mNumFailed:I

    const-string v0, "redirectcount"

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const v1, 0xfffffff

    and-int/2addr v1, v0

    iput v1, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mRetryAfter:I

    shr-int/lit8 v0, v0, 0x1c

    iput v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mRedirectCount:I

    const-string v0, "lastmod"

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mLastMod:J

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mPackage:Ljava/lang/String;

    const-string v1, "notificationpackage"

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mPackage:Ljava/lang/String;

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mClass:Ljava/lang/String;

    const-string v1, "notificationclass"

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mClass:Ljava/lang/String;

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mExtras:Ljava/lang/String;

    const-string v1, "notificationextras"

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mExtras:Ljava/lang/String;

    const-string v0, "total_bytes"

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mTotalBytes:J

    const-string v0, "current_bytes"

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mCurrentBytes:J

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mETag:Ljava/lang/String;

    const-string v1, "etag"

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mETag:Ljava/lang/String;

    const-string v0, "deleted"

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v2, :cond_0

    move v0, v2

    :goto_0
    iput-boolean v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mDeleted:Z

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mTitle:Ljava/lang/String;

    const-string v1, "title"

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mTitle:Ljava/lang/String;

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mDescription:Ljava/lang/String;

    const-string v1, "description"

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mDescription:Ljava/lang/String;

    const-string v0, "source"

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mSource:I

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mPackageName:Ljava/lang/String;

    const-string v1, "package_name"

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mPackageName:Ljava/lang/String;

    iget-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mPackageName:Ljava/lang/String;

    const-string v1, "md5"

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mMD5:Ljava/lang/String;

    const-string v0, "allow_network"

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mAllowedNetworkTypes:I

    monitor-enter p0

    :try_start_0
    const-string v0, "control"

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->getInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p1, Lcom/mappn/gfan/common/download/DownloadInfo;->mControl:I

    monitor-exit p0

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
