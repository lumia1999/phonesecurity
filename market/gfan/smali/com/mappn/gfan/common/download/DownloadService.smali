.class public Lcom/mappn/gfan/common/download/DownloadService;
.super Landroid/app/Service;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/common/download/DownloadService$1;,
        Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;,
        Lcom/mappn/gfan/common/download/DownloadService$finishThread;,
        Lcom/mappn/gfan/common/download/DownloadService$DownloadManagerContentObserver;
    }
.end annotation


# static fields
.field public static final CLEAR_BAD_NOTIFICATION:Ljava/lang/String; = "clear"


# instance fields
.field private mCurrentTask:Lcom/mappn/gfan/common/download/DownloadInfo;

.field private mDownloads:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/mappn/gfan/common/download/DownloadInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mNotifier:Lcom/mappn/gfan/common/download/DownloadNotification;

.field private mObserver:Lcom/mappn/gfan/common/download/DownloadService$DownloadManagerContentObserver;

.field private mPendingUpdate:Z

.field mUpdateThread:Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService;->mDownloads:Ljava/util/Map;

    return-void
.end method

.method static synthetic access$000(Lcom/mappn/gfan/common/download/DownloadService;)V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/common/download/DownloadService;->updateFromProvider()V

    return-void
.end method

.method static synthetic access$200(Lcom/mappn/gfan/common/download/DownloadService;)Lcom/mappn/gfan/common/download/DownloadNotification;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService;->mNotifier:Lcom/mappn/gfan/common/download/DownloadNotification;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mappn/gfan/common/download/DownloadService;)V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/common/download/DownloadService;->trimDatabase()V

    return-void
.end method

.method static synthetic access$400(Lcom/mappn/gfan/common/download/DownloadService;)V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/common/download/DownloadService;->removeSpuriousFiles()V

    return-void
.end method

.method static synthetic access$500(Lcom/mappn/gfan/common/download/DownloadService;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/common/download/DownloadService;->mPendingUpdate:Z

    return v0
.end method

.method static synthetic access$502(Lcom/mappn/gfan/common/download/DownloadService;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/mappn/gfan/common/download/DownloadService;->mPendingUpdate:Z

    return p1
.end method

.method static synthetic access$600(Lcom/mappn/gfan/common/download/DownloadService;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService;->mDownloads:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$700(Lcom/mappn/gfan/common/download/DownloadService;Lcom/mappn/gfan/common/download/DownloadInfo$Reader;Lcom/mappn/gfan/common/download/DownloadInfo;J)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/mappn/gfan/common/download/DownloadService;->updateDownload(Lcom/mappn/gfan/common/download/DownloadInfo$Reader;Lcom/mappn/gfan/common/download/DownloadInfo;J)V

    return-void
.end method

.method static synthetic access$800(Lcom/mappn/gfan/common/download/DownloadService;Lcom/mappn/gfan/common/download/DownloadInfo$Reader;J)Lcom/mappn/gfan/common/download/DownloadInfo;
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Lcom/mappn/gfan/common/download/DownloadService;->insertDownload(Lcom/mappn/gfan/common/download/DownloadInfo$Reader;J)Lcom/mappn/gfan/common/download/DownloadInfo;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$900(Lcom/mappn/gfan/common/download/DownloadService;J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/mappn/gfan/common/download/DownloadService;->deleteDownload(J)V

    return-void
.end method

.method private deleteDownload(J)V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService;->mDownloads:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/download/DownloadInfo;

    iget v1, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mStatus:I

    const/16 v2, 0xc0

    if-ne v1, v2, :cond_0

    const/16 v1, 0x1ea

    iput v1, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mStatus:I

    :cond_0
    iget v1, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mDestination:I

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mFileName:Ljava/lang/String;

    if-eqz v1, :cond_1

    new-instance v1, Ljava/io/File;

    iget-object v2, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mFileName:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_1
    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadService;->mNotifier:Lcom/mappn/gfan/common/download/DownloadNotification;

    iget-wide v2, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mId:J

    invoke-virtual {v1, v2, v3}, Lcom/mappn/gfan/common/download/DownloadNotification;->cancelNotification(J)V

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadService;->mDownloads:Ljava/util/Map;

    iget-wide v2, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private insertDownload(Lcom/mappn/gfan/common/download/DownloadInfo$Reader;J)Lcom/mappn/gfan/common/download/DownloadInfo;
    .locals 4

    invoke-virtual {p1, p0}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->newDownloadInfo(Landroid/content/Context;)Lcom/mappn/gfan/common/download/DownloadInfo;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadService;->mDownloads:Ljava/util/Map;

    iget-wide v2, v0, Lcom/mappn/gfan/common/download/DownloadInfo;->mId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/download/DownloadInfo;->logVerboseInfo()V

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadService;->mCurrentTask:Lcom/mappn/gfan/common/download/DownloadInfo;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadService;->mCurrentTask:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/download/DownloadInfo;->isCompleted()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    invoke-virtual {v0, p2, p3}, Lcom/mappn/gfan/common/download/DownloadInfo;->startIfReady(J)Z

    move-result v1

    if-eqz v1, :cond_1

    monitor-enter p0

    :try_start_0
    iput-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService;->mCurrentTask:Lcom/mappn/gfan/common/download/DownloadInfo;

    monitor-exit p0

    :cond_1
    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private removeSpuriousFiles()V
    .locals 8

    const/4 v3, 0x0

    const/4 v7, 0x0

    invoke-static {}, Landroid/os/Environment;->getDownloadCacheDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    return-void

    :cond_1
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    move v1, v7

    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_4

    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v4, "lost+found"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v4, "recovery"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    invoke-virtual {p0}, Lcom/mappn/gfan/common/download/DownloadService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v4, "_data"

    aput-object v4, v2, v7

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_7

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_6

    :cond_5
    invoke-interface {v0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_5

    :cond_6
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_7
    invoke-virtual {v6}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deleting spurious file "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_2
.end method

.method private trimDatabase()V
    .locals 7

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/mappn/gfan/common/download/DownloadService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v3

    const-string v3, "status >= \'200\'"

    const-string v5, "lastmod"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "null cursor in trimDatabase"

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->E(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    const/16 v2, 0x3e8

    sub-int/2addr v1, v2

    const-string v2, "_id"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    :goto_1
    if-lez v1, :cond_1

    sget-object v3, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    invoke-static {v3, v5, v6}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {p0}, Lcom/mappn/gfan/common/download/DownloadService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v5, v3, v4, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_2

    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :cond_2
    add-int/lit8 v1, v1, -0x1

    goto :goto_1
.end method

.method private updateDownload(Lcom/mappn/gfan/common/download/DownloadInfo$Reader;Lcom/mappn/gfan/common/download/DownloadInfo;J)V
    .locals 4

    const/4 v3, 0x0

    const/4 v2, 0x1

    iget v0, p2, Lcom/mappn/gfan/common/download/DownloadInfo;->mVisibility:I

    iget v1, p2, Lcom/mappn/gfan/common/download/DownloadInfo;->mStatus:I

    invoke-virtual {p1, p2}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;->updateFromDatabase(Lcom/mappn/gfan/common/download/DownloadInfo;)V

    if-ne v0, v2, :cond_4

    iget v0, p2, Lcom/mappn/gfan/common/download/DownloadInfo;->mVisibility:I

    if-eq v0, v2, :cond_4

    iget v0, p2, Lcom/mappn/gfan/common/download/DownloadInfo;->mStatus:I

    invoke-static {v0}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusCompleted(I)Z

    move-result v0

    if-eqz v0, :cond_4

    move v0, v2

    :goto_0
    invoke-static {v1}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusCompleted(I)Z

    move-result v1

    if-nez v1, :cond_5

    iget v1, p2, Lcom/mappn/gfan/common/download/DownloadInfo;->mStatus:I

    invoke-static {v1}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusCompleted(I)Z

    move-result v1

    if-eqz v1, :cond_5

    move v1, v2

    :goto_1
    if-nez v0, :cond_0

    if-eqz v1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService;->mNotifier:Lcom/mappn/gfan/common/download/DownloadNotification;

    iget-wide v1, p2, Lcom/mappn/gfan/common/download/DownloadInfo;->mId:J

    invoke-virtual {v0, v1, v2}, Lcom/mappn/gfan/common/download/DownloadNotification;->cancelNotification(J)V

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService;->mCurrentTask:Lcom/mappn/gfan/common/download/DownloadInfo;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService;->mCurrentTask:Lcom/mappn/gfan/common/download/DownloadInfo;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/download/DownloadInfo;->isCompleted()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    invoke-virtual {p2, p3, p4}, Lcom/mappn/gfan/common/download/DownloadInfo;->startIfReady(J)Z

    move-result v0

    if-eqz v0, :cond_3

    monitor-enter p0

    :try_start_0
    iput-object p2, p0, Lcom/mappn/gfan/common/download/DownloadService;->mCurrentTask:Lcom/mappn/gfan/common/download/DownloadInfo;

    monitor-exit p0

    :cond_3
    return-void

    :cond_4
    move v0, v3

    goto :goto_0

    :cond_5
    move v1, v3

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private updateFromProvider()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/mappn/gfan/common/download/DownloadService;->mPendingUpdate:Z

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService;->mUpdateThread:Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;

    if-nez v0, :cond_0

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;-><init>(Lcom/mappn/gfan/common/download/DownloadService;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService;->mUpdateThread:Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService;->mUpdateThread:Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->start()V

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 2

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Cannot bind to Download Manager Service"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onCreate()V
    .locals 4

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    const-string v0, "Service onCreate"

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadService$DownloadManagerContentObserver;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/common/download/DownloadService$DownloadManagerContentObserver;-><init>(Lcom/mappn/gfan/common/download/DownloadService;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService;->mObserver:Lcom/mappn/gfan/common/download/DownloadService$DownloadManagerContentObserver;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/download/DownloadService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/mappn/gfan/common/download/DownloadService;->mObserver:Lcom/mappn/gfan/common/download/DownloadService$DownloadManagerContentObserver;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadNotification;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/common/download/DownloadNotification;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService;->mNotifier:Lcom/mappn/gfan/common/download/DownloadNotification;

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService;->mNotifier:Lcom/mappn/gfan/common/download/DownloadNotification;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/download/DownloadNotification;->clearAllNotification()V

    invoke-direct {p0}, Lcom/mappn/gfan/common/download/DownloadService;->updateFromProvider()V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    invoke-virtual {p0}, Lcom/mappn/gfan/common/download/DownloadService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadService;->mObserver:Lcom/mappn/gfan/common/download/DownloadService$DownloadManagerContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    const-string v0, "Service onDestroy"

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 2

    const-string v0, "Service onStart"

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    if-eqz p1, :cond_0

    const-string v0, "clear"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    if-lez v0, :cond_0

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadService$finishThread;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mappn/gfan/common/download/DownloadService$finishThread;-><init>(Lcom/mappn/gfan/common/download/DownloadService;Lcom/mappn/gfan/common/download/DownloadService$1;)V

    invoke-virtual {v0}, Lcom/mappn/gfan/common/download/DownloadService$finishThread;->start()V

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0}, Lcom/mappn/gfan/common/download/DownloadService;->updateFromProvider()V

    goto :goto_0
.end method
