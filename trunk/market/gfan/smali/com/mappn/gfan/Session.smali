.class public Lcom/mappn/gfan/Session;
.super Ljava/util/Observable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/Session$DbStatusRefreshTask;
    }
.end annotation


# static fields
.field private static final CURSOR_CHANGED:I = 0x1

.field private static final CURSOR_CREATED:I = 0x0

.field private static final CURSOR_INSTALL_CHANGED:I = 0x3

.field private static final CURSOR_UPDATE:I = 0x2

.field private static final TAG:Ljava/lang/String; = "Session"

.field private static mInstance:Lcom/mappn/gfan/Session;


# instance fields
.field private appName:Ljava/lang/String;

.field private buildVersion:Ljava/lang/String;

.field private cid:Ljava/lang/String;

.field private cpid:Ljava/lang/String;

.field private creditCardVersion:I

.field private debugType:Ljava/lang/String;

.field private deviceId:Ljava/lang/String;

.field private imei:Ljava/lang/String;

.field private isAutoClearCache:Z

.field public isDebug:Z

.field private isDeviceBinded:Z

.field private isFilterApp:Z

.field private isFirstLogin:Z

.field private isLogin:Z

.field private isUpdateAvailable:Z

.field private lastVersion:I

.field private mContext:Landroid/content/Context;

.field private mCursorObserver:Landroid/database/ContentObserver;

.field private mDefaultChargeType:Ljava/lang/String;

.field private mDownloadManager:Lcom/mappn/gfan/common/download/DownloadManager;

.field private mDownloadingCursor:Landroid/database/Cursor;

.field private mDownloadingList:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mappn/gfan/common/vo/DownloadInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private mHasDownloadingTask:Z

.field private mInstalledApps:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mNotSameApps:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mSessionManager:Lcom/mappn/gfan/SessionManager;

.field private mUpdateApps:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mappn/gfan/common/vo/UpgradeInfo;",
            ">;"
        }
    .end annotation
.end field

.field private macAddress:Ljava/lang/String;

.field private model:Ljava/lang/String;

.field private osVersion:I

.field private packageName:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private screenSize:Ljava/lang/String;

.field private sim:Ljava/lang/String;

.field private splashId:J

.field private splashTime:J

.field private uid:Ljava/lang/String;

.field private updataCheckTime:J

.field private updateId:J

.field private updateLevel:I

.field private updateUri:Ljava/lang/String;

.field private updateVersionCode:I

.field private updateVersionDesc:Ljava/lang/String;

.field private updateVersionName:Ljava/lang/String;

.field private upgradeNumber:I

.field private userAgent:Ljava/lang/String;

.field private userName:Ljava/lang/String;

.field private versionCode:I

.field private versionName:Ljava/lang/String;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 3

    invoke-direct {p0}, Ljava/util/Observable;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/Session;->mUpdateApps:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/Session;->mNotSameApps:Ljava/util/HashMap;

    new-instance v0, Lcom/mappn/gfan/Session$2;

    iget-object v1, p0, Lcom/mappn/gfan/Session;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v1}, Lcom/mappn/gfan/Session$2;-><init>(Lcom/mappn/gfan/Session;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/mappn/gfan/Session;->mCursorObserver:Landroid/database/ContentObserver;

    invoke-direct {p0}, Lcom/mappn/gfan/Session;->initMessageHandler()V

    iput-object p1, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    iput v0, p0, Lcom/mappn/gfan/Session;->osVersion:I

    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    iput-object v0, p0, Lcom/mappn/gfan/Session;->buildVersion:Ljava/lang/String;

    :try_start_0
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "UTF-8"

    invoke-static {v0, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/Session;->model:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    new-instance v0, Lcom/mappn/gfan/common/download/DownloadManager;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/Session;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/common/download/DownloadManager;-><init>(Landroid/content/ContentResolver;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mappn/gfan/Session;->mDownloadManager:Lcom/mappn/gfan/common/download/DownloadManager;

    invoke-direct {p0}, Lcom/mappn/gfan/Session;->readSettings()V

    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method static synthetic access$002(Lcom/mappn/gfan/Session;Ljava/util/HashMap;)Ljava/util/HashMap;
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/Session;->mDownloadingList:Ljava/util/HashMap;

    return-object p1
.end method

.method static synthetic access$100(Lcom/mappn/gfan/Session;)V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/Session;->startQuery()V

    return-void
.end method

.method static synthetic access$200(Lcom/mappn/gfan/Session;)Landroid/database/Cursor;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mDownloadingCursor:Landroid/database/Cursor;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mappn/gfan/Session;)V
    .locals 0

    invoke-virtual {p0}, Lcom/mappn/gfan/Session;->setChanged()V

    return-void
.end method

.method static synthetic access$400(Lcom/mappn/gfan/Session;)V
    .locals 0

    invoke-virtual {p0}, Lcom/mappn/gfan/Session;->setChanged()V

    return-void
.end method

.method static synthetic access$500(Lcom/mappn/gfan/Session;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mappn/gfan/Session;Landroid/database/Cursor;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mappn/gfan/Session;->refreshUpdateApp(Landroid/database/Cursor;)V

    return-void
.end method

.method private checkInvalidStatus(Lcom/mappn/gfan/common/vo/DownloadInfo;)Z
    .locals 6

    const/4 v5, 0x0

    const/4 v4, 0x1

    if-nez p1, :cond_0

    move v0, v4

    :goto_0
    return v0

    :cond_0
    iget v0, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    const/16 v1, 0x1ea

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mDownloadingList:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/mappn/gfan/Session;->mDownloadingList:Ljava/util/HashMap;

    iget-object v2, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mKey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mDownloadManager:Lcom/mappn/gfan/common/download/DownloadManager;

    new-array v1, v4, [J

    iget-wide v2, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->id:J

    aput-wide v2, v1, v5

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/download/DownloadManager;->remove([J)V

    move v0, v4

    goto :goto_0

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :cond_1
    iget v0, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    const/16 v1, 0x10e

    if-eq v0, v1, :cond_2

    iget v0, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    const/16 v1, 0x104

    if-ne v0, v1, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/mappn/gfan/Session;->mDownloadingList:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_2
    iget-object v1, p0, Lcom/mappn/gfan/Session;->mDownloadingList:Ljava/util/HashMap;

    iget-object v2, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mKey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mDownloadManager:Lcom/mappn/gfan/common/download/DownloadManager;

    new-array v1, v4, [J

    iget-wide v2, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->id:J

    aput-wide v2, v1, v5

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/download/DownloadManager;->remove([J)V

    move v0, v4

    goto :goto_0

    :catchall_1
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v1

    :cond_3
    move v0, v5

    goto :goto_0
.end method

.method public static get(Landroid/content/Context;)Lcom/mappn/gfan/Session;
    .locals 1

    sget-object v0, Lcom/mappn/gfan/Session;->mInstance:Lcom/mappn/gfan/Session;

    if-nez v0, :cond_0

    new-instance v0, Lcom/mappn/gfan/Session;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/Session;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/mappn/gfan/Session;->mInstance:Lcom/mappn/gfan/Session;

    :cond_0
    sget-object v0, Lcom/mappn/gfan/Session;->mInstance:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method private getApplicationInfo()V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    :try_start_0
    iget-object v1, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v2, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    iput-object v2, p0, Lcom/mappn/gfan/Session;->versionName:Ljava/lang/String;

    iget v1, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    iput v1, p0, Lcom/mappn/gfan/Session;->versionCode:I

    iget-object v1, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "gfan_cid"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mappn/gfan/Session;->cid:Ljava/lang/String;

    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "gfan_cpid"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mappn/gfan/Session;->cpid:Ljava/lang/String;

    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "gfan_debug"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mappn/gfan/Session;->debugType:Ljava/lang/String;

    const-string v2, "1"

    iget-object v3, p0, Lcom/mappn/gfan/Session;->debugType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/mappn/gfan/Session;->isDebug:Z

    :cond_0
    :goto_0
    iget-boolean v2, p0, Lcom/mappn/gfan/Session;->isDebug:Z

    sput-boolean v2, Lcom/mappn/gfan/common/util/Utils;->sDebug:Z

    invoke-virtual {v1, v0}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/Session;->appName:Ljava/lang/String;

    iget-object v0, p0, Lcom/mappn/gfan/Session;->appName:Ljava/lang/String;

    sput-object v0, Lcom/mappn/gfan/common/util/Utils;->sLogTag:Ljava/lang/String;

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/Session;->packageName:Ljava/lang/String;

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    const-string v1, "phone"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mappn/gfan/Session;->imei:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimSerialNumber()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/Session;->sim:Ljava/lang/String;

    :goto_1
    return-void

    :cond_1
    const-string v2, "0"

    iget-object v3, p0, Lcom/mappn/gfan/Session;->debugType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/mappn/gfan/Session;->isDebug:Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v0, "Session"

    const-string v1, "met some error when get application info"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private static getCompleteStatus(Lcom/mappn/gfan/Session;Lcom/mappn/gfan/common/vo/DownloadInfo;Landroid/database/Cursor;)V
    .locals 2

    const-string v0, "_data"

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mFilePath:Ljava/lang/String;

    iget-object v0, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mFilePath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/io/File;

    iget-object v1, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mFilePath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x9

    iput v0, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mProgressLevel:I

    invoke-virtual {p0}, Lcom/mappn/gfan/Session;->getUpdateList()Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/vo/UpgradeInfo;

    iget-object v0, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mFilePath:Ljava/lang/String;

    iput-object v0, p0, Lcom/mappn/gfan/common/vo/UpgradeInfo;->filePath:Ljava/lang/String;

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/mappn/gfan/Session;->getUpdateList()Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/vo/UpgradeInfo;

    const-string v0, ""

    iput-object v0, p0, Lcom/mappn/gfan/common/vo/UpgradeInfo;->filePath:Ljava/lang/String;

    :cond_2
    const/16 v0, 0x10e

    iput v0, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    const/4 v0, 0x0

    iput v0, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mProgressLevel:I

    goto :goto_0
.end method

.method private static getRunningStatus(Lcom/mappn/gfan/common/vo/DownloadInfo;Landroid/database/Cursor;)V
    .locals 5

    const/16 v4, 0x8

    const-string v0, "current_bytes"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    int-to-long v0, v0

    const-string v2, "total_bytes"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    int-to-long v2, v2

    iput-wide v2, p0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mTotalSize:J

    iput-wide v0, p0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mCurrentSize:J

    long-to-float v0, v0

    long-to-float v1, v2

    div-float/2addr v0, v1

    const/high16 v1, 0x42c8

    mul-float/2addr v0, v1

    float-to-int v0, v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "%"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mProgress:Ljava/lang/String;

    iput v0, p0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mProgressNumber:I

    div-int/lit8 v0, v0, 0xe

    add-int/lit8 v0, v0, 0x2

    if-le v0, v4, :cond_0

    move v0, v4

    :cond_0
    iput v0, p0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mProgressLevel:I

    return-void
.end method

.method private initMessageHandler()V
    .locals 3

    const/4 v0, 0x0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    if-eq v1, v2, :cond_0

    const/4 v0, 0x1

    invoke-static {}, Landroid/os/Looper;->prepare()V

    :cond_0
    new-instance v1, Lcom/mappn/gfan/Session$1;

    invoke-direct {v1, p0}, Lcom/mappn/gfan/Session$1;-><init>(Lcom/mappn/gfan/Session;)V

    iput-object v1, p0, Lcom/mappn/gfan/Session;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1

    invoke-static {}, Landroid/os/Looper;->loop()V

    :cond_1
    return-void
.end method

.method private newDownloadInfo(JLjava/lang/String;Ljava/lang/String;ILjava/lang/String;)Lcom/mappn/gfan/common/vo/DownloadInfo;
    .locals 4

    new-instance v0, Lcom/mappn/gfan/common/vo/DownloadInfo;

    invoke-direct {v0}, Lcom/mappn/gfan/common/vo/DownloadInfo;-><init>()V

    iput-wide p1, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->id:J

    iput-object p3, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mPackageName:Ljava/lang/String;

    iput-object p4, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mAppName:Ljava/lang/String;

    iput p5, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mSource:I

    const/4 v1, 0x1

    if-ne p5, v1, :cond_0

    iget-object v1, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020086

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mIconUrl:Ljava/lang/Object;

    :goto_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v1, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->id:J

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mKey:Ljava/lang/String;

    :goto_1
    iget-object v1, p0, Lcom/mappn/gfan/Session;->mDownloadingList:Ljava/util/HashMap;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/mappn/gfan/Session;->mDownloadingList:Ljava/util/HashMap;

    iget-object v3, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mKey:Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :cond_0
    const/4 v1, 0x2

    if-ne p5, v1, :cond_1

    iget-object v1, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f02008a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mIconUrl:Ljava/lang/Object;

    goto :goto_0

    :cond_1
    iput-object p6, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mIconUrl:Ljava/lang/Object;

    goto :goto_0

    :cond_2
    iput-object p3, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mKey:Ljava/lang/String;

    goto :goto_1

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private readSettings()V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mappn/gfan/SessionManager;->get(Landroid/content/Context;)Lcom/mappn/gfan/SessionManager;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/Session;->mSessionManager:Lcom/mappn/gfan/SessionManager;

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mSessionManager:Lcom/mappn/gfan/SessionManager;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/Session;->addObserver(Ljava/util/Observer;)V

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mSessionManager:Lcom/mappn/gfan/SessionManager;

    invoke-virtual {v0}, Lcom/mappn/gfan/SessionManager;->readPreference()Ljava/util/HashMap;

    move-result-object v1

    const-string v0, "pref.uid"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/mappn/gfan/Session;->uid:Ljava/lang/String;

    const-string v0, "pref.screen.size"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/mappn/gfan/Session;->screenSize:Ljava/lang/String;

    const-string v0, "pref.isLogin"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/mappn/gfan/Session;->isLogin:Z

    const-string v0, "auto_clear_cache"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/mappn/gfan/Session;->isAutoClearCache:Z

    const-string v0, "pref.market.username"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/mappn/gfan/Session;->userName:Ljava/lang/String;

    const-string v0, "pref.market.password"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/mappn/gfan/Session;->password:Ljava/lang/String;

    const-string v0, "pref.upgrade.num"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/Session;->upgradeNumber:I

    const-string v0, "pref.product.update.timestamp"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/mappn/gfan/Session;->updataCheckTime:J

    const-string v0, "pref.update.id"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/mappn/gfan/Session;->updateId:J

    const-string v0, "no_app_filter"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/mappn/gfan/Session;->isFilterApp:Z

    const-string v0, "pref.lpns.binded.devid"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/mappn/gfan/Session;->deviceId:Ljava/lang/String;

    const-string v0, "pref.lpns.is.binded"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/mappn/gfan/Session;->isDeviceBinded:Z

    const-string v0, "pref.card.version"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/Session;->creditCardVersion:I

    const-string v0, "pref.current.version"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/Session;->lastVersion:I

    const-string v0, "pref.splash.id"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/mappn/gfan/Session;->splashId:J

    const-string v0, "pref.splash.time"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/mappn/gfan/Session;->splashTime:J

    const-string v0, "pref.charge.defaultChargeType"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/mappn/gfan/Session;->mDefaultChargeType:Ljava/lang/String;

    const-string v0, "pref.is.first.login"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/mappn/gfan/Session;->isFirstLogin:Z

    invoke-direct {p0}, Lcom/mappn/gfan/Session;->getApplicationInfo()V

    return-void
.end method

.method private refreshUpdateApp(Landroid/database/Cursor;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/Session;->mUpdateApps:Ljava/util/HashMap;

    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/mappn/gfan/common/vo/UpgradeInfo;

    invoke-direct {v0}, Lcom/mappn/gfan/common/vo/UpgradeInfo;-><init>()V

    const-string v1, "p_id"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/mappn/gfan/common/vo/UpgradeInfo;->pid:Ljava/lang/String;

    const-string v1, "p_package_name"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/mappn/gfan/common/vo/UpgradeInfo;->pkgName:Ljava/lang/String;

    const-string v1, "p_new_version_name"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/mappn/gfan/common/vo/UpgradeInfo;->versionName:Ljava/lang/String;

    const-string v1, "p_new_version_code"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lcom/mappn/gfan/common/vo/UpgradeInfo;->versionCode:I

    const-string v1, "p_signature"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/mappn/gfan/common/vo/UpgradeInfo;->signature:Ljava/lang/String;

    iget-object v1, p0, Lcom/mappn/gfan/Session;->mUpdateApps:Ljava/util/HashMap;

    iget-object v2, v0, Lcom/mappn/gfan/common/vo/UpgradeInfo;->pkgName:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method private refreshUpdateApp(Lcom/mappn/gfan/common/vo/DownloadInfo;Z)V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mUpdateApps:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mUpdateApps:Ljava/util/HashMap;

    iget-object v1, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mUpdateApps:Ljava/util/HashMap;

    iget-object v1, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/UpgradeInfo;

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget v1, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    const/16 v2, 0x104

    if-ne v1, v2, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mUpdateApps:Ljava/util/HashMap;

    iget-object v1, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    if-eqz p2, :cond_3

    iput v3, v0, Lcom/mappn/gfan/common/vo/UpgradeInfo;->status:I

    goto :goto_0

    :cond_3
    iget v1, p1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mProgressLevel:I

    if-nez v1, :cond_4

    iput v3, v0, Lcom/mappn/gfan/common/vo/UpgradeInfo;->status:I

    goto :goto_0

    :cond_4
    const/4 v1, 0x1

    iput v1, v0, Lcom/mappn/gfan/common/vo/UpgradeInfo;->status:I

    goto :goto_0
.end method

.method private startQuery()V
    .locals 9

    const/4 v1, 0x1

    const/4 v8, 0x0

    const/4 v2, 0x0

    new-instance v0, Lcom/mappn/gfan/Session$DbStatusRefreshTask;

    iget-object v3, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-direct {v0, p0, v3}, Lcom/mappn/gfan/Session$DbStatusRefreshTask;-><init>(Lcom/mappn/gfan/Session;Landroid/content/ContentResolver;)V

    const-string v5, "p_update_ingore=?"

    new-array v6, v1, [Ljava/lang/String;

    const-string v3, "0"

    aput-object v3, v6, v8

    sget-object v3, Lcom/mappn/gfan/common/util/MarketProvider;->UPDATE_CONTENT_URI:Landroid/net/Uri;

    move-object v4, v2

    move-object v7, v2

    invoke-virtual/range {v0 .. v7}, Lcom/mappn/gfan/Session$DbStatusRefreshTask;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    sget-object v3, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    const-string v5, "((status >= \'190\' AND status < \'600\') AND destination = \'0\' AND mimetype = \'application/vnd.android.package-archive\' AND source = \'0\')"

    const-string v7, "_id ASC"

    move v1, v8

    move-object v4, v2

    move-object v6, v2

    invoke-virtual/range {v0 .. v7}, Lcom/mappn/gfan/Session$DbStatusRefreshTask;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public addInstalledApp(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mInstalledApps:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->getAllInstalledApps(Landroid/content/Context;)Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/Session;->mInstalledApps:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public clearData()V
    .locals 1

    const-string v0, ""

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/Session;->setDeviceId(Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/Session;->setDeviceBinded(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public close()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mappn/gfan/Session;->mSessionManager:Lcom/mappn/gfan/SessionManager;

    invoke-virtual {v0}, Lcom/mappn/gfan/SessionManager;->writePreferenceQuickly()V

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mDownloadingCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mDownloadingCursor:Landroid/database/Cursor;

    iget-object v1, p0, Lcom/mappn/gfan/Session;->mCursorObserver:Landroid/database/ContentObserver;

    invoke-interface {v0, v1}, Landroid/database/Cursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mDownloadingCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lcom/mappn/gfan/Session;->mInstance:Lcom/mappn/gfan/Session;

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getAppName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->appName:Ljava/lang/String;

    return-object v0
.end method

.method public getBuildVersion()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->buildVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getCid()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->cid:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/mappn/gfan/Session;->getApplicationInfo()V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/Session;->cid:Ljava/lang/String;

    return-object v0
.end method

.method public getCpid()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->cpid:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/mappn/gfan/Session;->getApplicationInfo()V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/Session;->cpid:Ljava/lang/String;

    return-object v0
.end method

.method public getCreditCardVersion()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/Session;->creditCardVersion:I

    return v0
.end method

.method public getDebugType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->debugType:Ljava/lang/String;

    return-object v0
.end method

.method public getDefaultChargeType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mDefaultChargeType:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->deviceId:Ljava/lang/String;

    return-object v0
.end method

.method public getDownloadManager()Lcom/mappn/gfan/common/download/DownloadManager;
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mDownloadManager:Lcom/mappn/gfan/common/download/DownloadManager;

    if-nez v0, :cond_0

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadManager;

    iget-object v1, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/Session;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/common/download/DownloadManager;-><init>(Landroid/content/ContentResolver;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mappn/gfan/Session;->mDownloadManager:Lcom/mappn/gfan/common/download/DownloadManager;

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/Session;->mDownloadManager:Lcom/mappn/gfan/common/download/DownloadManager;

    return-object v0
.end method

.method public getDownloadingList()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mappn/gfan/common/vo/DownloadInfo;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mDownloadingList:Ljava/util/HashMap;

    return-object v0
.end method

.method public getIMEI()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->imei:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/mappn/gfan/Session;->getApplicationInfo()V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/Session;->imei:Ljava/lang/String;

    return-object v0
.end method

.method public getInstalledApps()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mInstalledApps:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->getAllInstalledApps(Landroid/content/Context;)Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/Session;->mInstalledApps:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getJavaApiUserAgent()Ljava/lang/String;
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/Session;->userAgent:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mappn/gfan/Session;->getModel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/Session;->getBuildVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    const v3, 0x7f090001

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/Session;->getVersionName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/Session;->getCid()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/Session;->getIMEI()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/Session;->getSim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/Session;->getMac()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/Session;->userAgent:Ljava/lang/String;

    goto :goto_0
.end method

.method public getLastVersion()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/Session;->lastVersion:I

    return v0
.end method

.method public getMac()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/Session;->macAddress:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    const-string v1, "wifi"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/Session;->macAddress:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/Session;->macAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getModel()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->model:Ljava/lang/String;

    return-object v0
.end method

.method public getNotificationRecommendAppsPreference()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mSessionManager:Lcom/mappn/gfan/SessionManager;

    invoke-virtual {v0}, Lcom/mappn/gfan/SessionManager;->getNotificationRecommendAppsPreference()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOsVersion()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/Session;->osVersion:I

    return v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->packageName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/mappn/gfan/Session;->getApplicationInfo()V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/Session;->packageName:Ljava/lang/String;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getScreenSize()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->screenSize:Ljava/lang/String;

    return-object v0
.end method

.method public getSim()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->sim:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/mappn/gfan/Session;->getApplicationInfo()V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/Session;->sim:Ljava/lang/String;

    return-object v0
.end method

.method public getSplashId()J
    .locals 2

    iget-wide v0, p0, Lcom/mappn/gfan/Session;->splashId:J

    return-wide v0
.end method

.method public getSplashTime()J
    .locals 2

    iget-wide v0, p0, Lcom/mappn/gfan/Session;->splashTime:J

    return-wide v0
.end method

.method public getUCenterApiUserAgent()Ljava/lang/String;
    .locals 1

    const-string v0, "packageName=com.mappn.gfan,appName=GFanMobile,channelID=9"

    return-object v0
.end method

.method public getUid()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->uid:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdataCheckTime()J
    .locals 2

    iget-wide v0, p0, Lcom/mappn/gfan/Session;->updataCheckTime:J

    return-wide v0
.end method

.method public getUpdateId()J
    .locals 2

    iget-wide v0, p0, Lcom/mappn/gfan/Session;->updateId:J

    return-wide v0
.end method

.method public getUpdateLevel()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/Session;->updateLevel:I

    return v0
.end method

.method public getUpdateList()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mappn/gfan/common/vo/UpgradeInfo;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mUpdateApps:Ljava/util/HashMap;

    return-object v0
.end method

.method public getUpdateUri()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->updateUri:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdateVersionCode()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/Session;->updateVersionCode:I

    return v0
.end method

.method public getUpdateVersionDesc()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->updateVersionDesc:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdateVersionName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->updateVersionName:Ljava/lang/String;

    return-object v0
.end method

.method public getUpgradeNumber()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/Session;->upgradeNumber:I

    return v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public getVersionCode()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/Session;->versionCode:I

    if-gtz v0, :cond_0

    invoke-direct {p0}, Lcom/mappn/gfan/Session;->getApplicationInfo()V

    :cond_0
    iget v0, p0, Lcom/mappn/gfan/Session;->versionCode:I

    return v0
.end method

.method public getVersionName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->versionName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/mappn/gfan/Session;->getApplicationInfo()V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/Session;->versionName:Ljava/lang/String;

    return-object v0
.end method

.method public hasDownloadTask()Z
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/Session;->mHasDownloadingTask:Z

    return v0
.end method

.method public isAutoClearCache()Z
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/Session;->isAutoClearCache:Z

    return v0
.end method

.method public isAutoDelete()Z
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mSessionManager:Lcom/mappn/gfan/SessionManager;

    invoke-virtual {v0}, Lcom/mappn/gfan/SessionManager;->isAutoDelete()Z

    move-result v0

    return v0
.end method

.method public isDeviceBinded()Z
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/Session;->isDeviceBinded:Z

    return v0
.end method

.method public isFilterApps()I
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/Session;->isFilterApp:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isFirstLogin()Z
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/Session;->isFirstLogin:Z

    return v0
.end method

.method public isLogin()Z
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/Session;->isLogin:Z

    return v0
.end method

.method public isNotificationRecommendApps()Z
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mSessionManager:Lcom/mappn/gfan/SessionManager;

    invoke-virtual {v0}, Lcom/mappn/gfan/SessionManager;->isNotificationRecommendApps()Z

    move-result v0

    return v0
.end method

.method public isNotificationUpdateApps()Z
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mSessionManager:Lcom/mappn/gfan/SessionManager;

    invoke-virtual {v0}, Lcom/mappn/gfan/SessionManager;->isNotificationUpdateApps()Z

    move-result v0

    return v0
.end method

.method public isStopDownloadImage()Z
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mSessionManager:Lcom/mappn/gfan/SessionManager;

    invoke-virtual {v0}, Lcom/mappn/gfan/SessionManager;->isStopDownloadImage()Z

    move-result v0

    return v0
.end method

.method public isUpdateAvailable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/Session;->isUpdateAvailable:Z

    return v0
.end method

.method public minusUpgradeNumber()V
    .locals 3

    iget v0, p0, Lcom/mappn/gfan/Session;->upgradeNumber:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/mappn/gfan/Session;->upgradeNumber:I

    invoke-super {p0}, Ljava/util/Observable;->setChanged()V

    new-instance v0, Lcom/mappn/gfan/common/util/Pair;

    const-string v1, "pref.upgrade.num"

    iget v2, p0, Lcom/mappn/gfan/Session;->upgradeNumber:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, v0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    return-void
.end method

.method declared-synchronized refreshDownloadApp(Landroid/database/Cursor;)V
    .locals 9

    const/4 v1, 0x0

    monitor-enter p0

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :cond_1
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mDownloadingCursor:Landroid/database/Cursor;

    if-nez v0, :cond_2

    iput-object p1, p0, Lcom/mappn/gfan/Session;->mDownloadingCursor:Landroid/database/Cursor;

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mCursorObserver:Landroid/database/ContentObserver;

    invoke-interface {p1, v0}, Landroid/database/Cursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    :cond_2
    invoke-interface {p1}, Landroid/database/Cursor;->requery()Z

    move v7, v1

    :goto_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_b

    const-string v0, "_id"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const-string v0, "package_name"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v0, "title"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string v0, "source"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    const-string v0, "notificationextras"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const-string v0, "status"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mDownloadingList:Ljava/util/HashMap;

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/DownloadInfo;

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mDownloadingList:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/DownloadInfo;

    if-eqz v0, :cond_3

    iget-object v2, p0, Lcom/mappn/gfan/Session;->mDownloadingList:Ljava/util/HashMap;

    iget-object v0, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mKey:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    int-to-long v1, v1

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/mappn/gfan/Session;->newDownloadInfo(JLjava/lang/String;Ljava/lang/String;ILjava/lang/String;)Lcom/mappn/gfan/common/vo/DownloadInfo;

    move-result-object v0

    :cond_4
    invoke-direct {p0, v0}, Lcom/mappn/gfan/Session;->checkInvalidStatus(Lcom/mappn/gfan/common/vo/DownloadInfo;)Z

    move-result v1

    if-eqz v1, :cond_5

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/Session;->refreshUpdateApp(Lcom/mappn/gfan/common/vo/DownloadInfo;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_5
    :try_start_1
    iput v8, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    iget v1, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    invoke-static {v1}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusRunning(I)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-static {v0, p1}, Lcom/mappn/gfan/Session;->getRunningStatus(Lcom/mappn/gfan/common/vo/DownloadInfo;Landroid/database/Cursor;)V

    add-int/lit8 v1, v7, 0x1

    :goto_2
    const/4 v2, 0x0

    invoke-direct {p0, v0, v2}, Lcom/mappn/gfan/Session;->refreshUpdateApp(Lcom/mappn/gfan/common/vo/DownloadInfo;Z)V

    move v7, v1

    goto/16 :goto_1

    :cond_6
    iget v1, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    invoke-static {v1}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusPending(I)Z

    move-result v1

    if-eqz v1, :cond_7

    const/4 v1, 0x1

    iput v1, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mProgressLevel:I

    add-int/lit8 v1, v7, 0x1

    goto :goto_2

    :cond_7
    iget v1, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_8

    invoke-static {p0, v0, p1}, Lcom/mappn/gfan/Session;->getCompleteStatus(Lcom/mappn/gfan/Session;Lcom/mappn/gfan/common/vo/DownloadInfo;Landroid/database/Cursor;)V

    move v1, v7

    goto :goto_2

    :cond_8
    iget v1, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    const/16 v2, 0x104

    if-ne v1, v2, :cond_9

    const/16 v1, 0xb

    iput v1, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mProgressLevel:I

    move v1, v7

    goto :goto_2

    :cond_9
    iget v1, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    invoke-static {v1}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusError(I)Z

    move-result v1

    if-eqz v1, :cond_a

    const/16 v1, 0xc

    iput v1, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mProgressLevel:I

    move v1, v7

    goto :goto_2

    :cond_a
    const/4 v1, 0x0

    iput v1, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mProgressLevel:I

    move v1, v7

    goto :goto_2

    :cond_b
    if-lez v7, :cond_c

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/Session;->setDownloadStatus(Z)V

    :goto_3
    invoke-virtual {p0}, Lcom/mappn/gfan/Session;->setChanged()V

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mDownloadingList:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/Session;->notifyObservers(Ljava/lang/Object;)V

    goto/16 :goto_0

    :cond_c
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/Session;->setDownloadStatus(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3
.end method

.method public removeInstalledApp(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mInstalledApps:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->getAllInstalledApps(Landroid/content/Context;)Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/Session;->mInstalledApps:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public removeUpdateItem(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mUpdateApps:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/mappn/gfan/Session;->minusUpgradeNumber()V

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public setCreditCardVersion(I)V
    .locals 3

    iget v0, p0, Lcom/mappn/gfan/Session;->creditCardVersion:I

    if-ne v0, p1, :cond_0

    :goto_0
    return-void

    :cond_0
    iput p1, p0, Lcom/mappn/gfan/Session;->creditCardVersion:I

    invoke-super {p0}, Ljava/util/Observable;->setChanged()V

    new-instance v0, Lcom/mappn/gfan/common/util/Pair;

    const-string v1, "pref.card.version"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, v0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public setDefaultChargeType(Ljava/lang/String;)V
    .locals 2

    iput-object p1, p0, Lcom/mappn/gfan/Session;->mDefaultChargeType:Ljava/lang/String;

    invoke-super {p0}, Ljava/util/Observable;->setChanged()V

    new-instance v0, Lcom/mappn/gfan/common/util/Pair;

    const-string v1, "pref.charge.defaultChargeType"

    invoke-direct {v0, v1, p1}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, v0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    return-void
.end method

.method public setDeviceBinded(Z)V
    .locals 3

    iget-boolean v0, p0, Lcom/mappn/gfan/Session;->isDeviceBinded:Z

    if-ne v0, p1, :cond_0

    :goto_0
    return-void

    :cond_0
    iput-boolean p1, p0, Lcom/mappn/gfan/Session;->isDeviceBinded:Z

    invoke-super {p0}, Ljava/util/Observable;->setChanged()V

    new-instance v0, Lcom/mappn/gfan/common/util/Pair;

    const-string v1, "pref.lpns.is.binded"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, v0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public setDeviceId(Ljava/lang/String;)V
    .locals 2

    iput-object p1, p0, Lcom/mappn/gfan/Session;->deviceId:Ljava/lang/String;

    invoke-super {p0}, Ljava/util/Observable;->setChanged()V

    new-instance v0, Lcom/mappn/gfan/common/util/Pair;

    const-string v1, "pref.lpns.binded.devid"

    invoke-direct {v0, v1, p1}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, v0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    return-void
.end method

.method public setDownloadStatus(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/mappn/gfan/Session;->mHasDownloadingTask:Z

    return-void
.end method

.method public setFirstLogin(Z)V
    .locals 3

    invoke-super {p0}, Ljava/util/Observable;->setChanged()V

    new-instance v0, Lcom/mappn/gfan/common/util/Pair;

    const-string v1, "pref.is.first.login"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, v0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    return-void
.end method

.method public setInstalledApps(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/mappn/gfan/Session;->mInstalledApps:Ljava/util/ArrayList;

    return-void
.end method

.method public setLastVersion(I)V
    .locals 3

    iget v0, p0, Lcom/mappn/gfan/Session;->lastVersion:I

    if-ne p1, v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/mappn/gfan/Session;->clearData()V

    iput p1, p0, Lcom/mappn/gfan/Session;->lastVersion:I

    invoke-super {p0}, Ljava/util/Observable;->setChanged()V

    new-instance v0, Lcom/mappn/gfan/common/util/Pair;

    const-string v1, "pref.current.version"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, v0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public setLogin(Z)V
    .locals 3

    iget-boolean v0, p0, Lcom/mappn/gfan/Session;->isLogin:Z

    if-ne v0, p1, :cond_0

    :goto_0
    return-void

    :cond_0
    iput-boolean p1, p0, Lcom/mappn/gfan/Session;->isLogin:Z

    invoke-super {p0}, Ljava/util/Observable;->setChanged()V

    new-instance v0, Lcom/mappn/gfan/common/util/Pair;

    const-string v1, "pref.isLogin"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, v0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public setNotificationRecommendAppsPreference(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mSessionManager:Lcom/mappn/gfan/SessionManager;

    invoke-virtual {v0, p1}, Lcom/mappn/gfan/SessionManager;->setNotificationRecommendAppsPreference(Ljava/lang/String;)V

    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 2

    iput-object p1, p0, Lcom/mappn/gfan/Session;->password:Ljava/lang/String;

    invoke-super {p0}, Ljava/util/Observable;->setChanged()V

    new-instance v0, Lcom/mappn/gfan/common/util/Pair;

    const-string v1, "pref.market.password"

    invoke-direct {v0, v1, p1}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, v0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    return-void
.end method

.method public setScreenSize(Landroid/app/Activity;)V
    .locals 3

    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v2, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    if-ge v1, v2, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/mappn/gfan/Session;->screenSize:Ljava/lang/String;

    invoke-super {p0}, Ljava/util/Observable;->setChanged()V

    new-instance v0, Lcom/mappn/gfan/common/util/Pair;

    const-string v1, "pref.screen.size"

    iget-object v2, p0, Lcom/mappn/gfan/Session;->screenSize:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, v0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    return-void

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public setSplashId(J)V
    .locals 3

    iput-wide p1, p0, Lcom/mappn/gfan/Session;->splashId:J

    invoke-super {p0}, Ljava/util/Observable;->setChanged()V

    new-instance v0, Lcom/mappn/gfan/common/util/Pair;

    const-string v1, "pref.splash.id"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, v0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    return-void
.end method

.method public setSplashTime(J)V
    .locals 3

    iput-wide p1, p0, Lcom/mappn/gfan/Session;->splashTime:J

    invoke-super {p0}, Ljava/util/Observable;->setChanged()V

    new-instance v0, Lcom/mappn/gfan/common/util/Pair;

    const-string v1, "pref.splash.time"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, v0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    return-void
.end method

.method public setUid(Ljava/lang/String;)V
    .locals 2

    iput-object p1, p0, Lcom/mappn/gfan/Session;->uid:Ljava/lang/String;

    invoke-super {p0}, Ljava/util/Observable;->setChanged()V

    new-instance v0, Lcom/mappn/gfan/common/util/Pair;

    const-string v1, "pref.uid"

    invoke-direct {v0, v1, p1}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, v0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    return-void
.end method

.method public setUpdataCheckTime(J)V
    .locals 3

    iget-wide v0, p0, Lcom/mappn/gfan/Session;->updataCheckTime:J

    cmp-long v0, v0, p1

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iput-wide p1, p0, Lcom/mappn/gfan/Session;->updataCheckTime:J

    invoke-super {p0}, Ljava/util/Observable;->setChanged()V

    new-instance v0, Lcom/mappn/gfan/common/util/Pair;

    const-string v1, "pref.product.update.timestamp"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, v0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public setUpdateAvailable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/mappn/gfan/Session;->isUpdateAvailable:Z

    return-void
.end method

.method public setUpdateID(J)V
    .locals 3

    iget-wide v0, p0, Lcom/mappn/gfan/Session;->updateId:J

    cmp-long v0, v0, p1

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iput-wide p1, p0, Lcom/mappn/gfan/Session;->updateId:J

    invoke-super {p0}, Ljava/util/Observable;->setChanged()V

    new-instance v0, Lcom/mappn/gfan/common/util/Pair;

    const-string v1, "pref.update.id"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, v0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public setUpdateInfo(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mappn/gfan/Session;->isUpdateAvailable:Z

    iput-object p1, p0, Lcom/mappn/gfan/Session;->updateVersionName:Ljava/lang/String;

    iput p2, p0, Lcom/mappn/gfan/Session;->updateVersionCode:I

    iput-object p3, p0, Lcom/mappn/gfan/Session;->updateVersionDesc:Ljava/lang/String;

    iput-object p4, p0, Lcom/mappn/gfan/Session;->updateUri:Ljava/lang/String;

    iput p5, p0, Lcom/mappn/gfan/Session;->updateLevel:I

    return-void
.end method

.method public setUpdateList()V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mappn/gfan/common/util/DBUtils;->queryUpdateProduct(Landroid/content/Context;)Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/Session;->mUpdateApps:Ljava/util/HashMap;

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public setUpdateList(Ljava/util/HashMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mappn/gfan/common/vo/UpgradeInfo;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/mappn/gfan/Session;->mUpdateApps:Ljava/util/HashMap;

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public setUpgradeNumber(I)V
    .locals 3

    iget v0, p0, Lcom/mappn/gfan/Session;->upgradeNumber:I

    if-ne v0, p1, :cond_0

    :goto_0
    return-void

    :cond_0
    iput p1, p0, Lcom/mappn/gfan/Session;->upgradeNumber:I

    invoke-super {p0}, Ljava/util/Observable;->setChanged()V

    new-instance v0, Lcom/mappn/gfan/common/util/Pair;

    const-string v1, "pref.upgrade.num"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, v0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/mappn/gfan/Session;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0
.end method

.method public setUserName(Ljava/lang/String;)V
    .locals 2

    iput-object p1, p0, Lcom/mappn/gfan/Session;->userName:Ljava/lang/String;

    invoke-super {p0}, Ljava/util/Observable;->setChanged()V

    new-instance v0, Lcom/mappn/gfan/common/util/Pair;

    const-string v1, "pref.market.username"

    invoke-direct {v0, v1, p1}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, v0}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    return-void
.end method
