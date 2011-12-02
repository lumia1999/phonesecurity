.class public Lcom/gfan/sdk/statistics/Collector;
.super Ljava/lang/Object;
.source "Collector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gfan/sdk/statistics/Collector$ApkInfo;,
        Lcom/gfan/sdk/statistics/Collector$IResponse;,
        Lcom/gfan/sdk/statistics/Collector$MessageHandler;
    }
.end annotation


# static fields
.field private static DEBUG:Z = false

.field private static final MAC:Ljava/lang/String; = "FF9B8CB4-E13B-44a7-B3C6-B385D8EB8167"

.field private static final SESSION_TIMEOUT:J = 0x3a98L

.field private static final TYPE:Ljava/lang/String; = "tongjisdk"

.field private static final URL:Ljava/lang/String; = "http://data.gfan.com"

.field private static final VERSION:Ljava/lang/String; = "0.3.2"

.field private static activityPauseTime:J

.field private static activityResumeTime:J

.field private static appStarttime:J

.field private static appkey:Ljava/lang/String;

.field private static context:Landroid/content/Context;

.field private static cpid:Ljava/lang/String;

.field private static hander:Landroid/os/Handler;

.field private static opid:Ljava/lang/String;

.field private static rid:Ljava/lang/String;

.field private static telManager:Landroid/telephony/TelephonyManager;

.field private static timesum:J


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 45
    const-string v1, ""

    sput-object v1, Lcom/gfan/sdk/statistics/Collector;->appkey:Ljava/lang/String;

    .line 46
    const-string v1, ""

    sput-object v1, Lcom/gfan/sdk/statistics/Collector;->cpid:Ljava/lang/String;

    .line 49
    sput-wide v2, Lcom/gfan/sdk/statistics/Collector;->activityResumeTime:J

    .line 50
    sput-wide v2, Lcom/gfan/sdk/statistics/Collector;->activityPauseTime:J

    .line 51
    sput-wide v2, Lcom/gfan/sdk/statistics/Collector;->appStarttime:J

    .line 53
    const-string v1, "gfan"

    sput-object v1, Lcom/gfan/sdk/statistics/Collector;->opid:Ljava/lang/String;

    .line 57
    sput-wide v2, Lcom/gfan/sdk/statistics/Collector;->timesum:J

    .line 70
    const-string v1, ""

    sput-object v1, Lcom/gfan/sdk/statistics/Collector;->rid:Ljava/lang/String;

    .line 72
    const/4 v1, 0x0

    sput-boolean v1, Lcom/gfan/sdk/statistics/Collector;->DEBUG:Z

    .line 75
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "Statistics"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 76
    .local v0, localHandlerThread:Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 77
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Lcom/gfan/sdk/statistics/Collector;->hander:Landroid/os/Handler;

    .line 44
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Ljava/lang/String;Lcom/gfan/sdk/statistics/Collector$IResponse;)Z
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 836
    invoke-static {p0, p1}, Lcom/gfan/sdk/statistics/Collector;->sendMessage(Ljava/lang/String;Lcom/gfan/sdk/statistics/Collector$IResponse;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1(Ljava/lang/String;)V
    .locals 0
    .parameter

    .prologue
    .line 70
    sput-object p0, Lcom/gfan/sdk/statistics/Collector;->rid:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$10(Landroid/content/Context;J)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 427
    invoke-static {p0, p1, p2}, Lcom/gfan/sdk/statistics/Collector;->sendAppInfo(Landroid/content/Context;J)V

    return-void
.end method

.method static synthetic access$11(Landroid/content/Context;J)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 417
    invoke-static {p0, p1, p2}, Lcom/gfan/sdk/statistics/Collector;->clearAppClickCount(Landroid/content/Context;J)V

    return-void
.end method

.method static synthetic access$2()Ljava/lang/String;
    .locals 1

    .prologue
    .line 70
    sget-object v0, Lcom/gfan/sdk/statistics/Collector;->rid:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    sget-object v0, Lcom/gfan/sdk/statistics/Collector;->appkey:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .prologue
    .line 995
    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->getAppkey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$5(Ljava/lang/String;)V
    .locals 0
    .parameter

    .prologue
    .line 45
    sput-object p0, Lcom/gfan/sdk/statistics/Collector;->appkey:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$6()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    sget-object v0, Lcom/gfan/sdk/statistics/Collector;->cpid:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$7(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .prologue
    .line 985
    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->getCpID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$8(Ljava/lang/String;)V
    .locals 0
    .parameter

    .prologue
    .line 46
    sput-object p0, Lcom/gfan/sdk/statistics/Collector;->cpid:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$9(Landroid/content/Context;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 774
    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->sendCpInfo(Landroid/content/Context;)V

    return-void
.end method

.method private static buildTail(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "str"
    .parameter "version"
    .parameter "type"

    .prologue
    .line 355
    const-string v0, ",\"mac\":\""

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "FF9B8CB4-E13B-44a7-B3C6-B385D8EB8167"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\",\"appkey\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/gfan/sdk/statistics/Collector;->appkey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\",\"cpid\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/gfan/sdk/statistics/Collector;->cpid:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\",\"cpidmac\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 356
    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->getCpidMac()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\",\"opid\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/gfan/sdk/statistics/Collector;->opid:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\",\"sdkversion\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\",\"type\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 357
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\"}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    return-void
.end method

.method private static clearAppClickCount(Landroid/content/Context;J)V
    .locals 1
    .parameter "context"
    .parameter "appStarttime"

    .prologue
    .line 418
    invoke-static {p0}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->getConnection(Landroid/content/Context;)Lcom/gfan/sdk/statistics/ConnectDBUtil;

    move-result-object v0

    .line 419
    .local v0, db:Lcom/gfan/sdk/statistics/ConnectDBUtil;
    invoke-virtual {v0, p1, p2}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->AppClear(J)Z

    .line 420
    invoke-virtual {v0}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->close()V

    .line 424
    return-void
.end method

.method public static comment(Landroid/content/Context;Ljava/lang/String;Lcom/gfan/sdk/statistics/Collector$IResponse;)V
    .locals 6
    .parameter "context"
    .parameter "comment"
    .parameter "response"

    .prologue
    .line 727
    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->validate()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 729
    :try_start_0
    sget-object v3, Lcom/gfan/sdk/statistics/Collector;->rid:Ljava/lang/String;

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    if-eqz p1, :cond_0

    .line 730
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 731
    .local v2, str:Ljava/lang/StringBuilder;
    const-string v3, "{\"msgtype\":\"plinfo\",\"body\":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 732
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 733
    .local v1, jsonObject:Lorg/json/JSONObject;
    const-string v3, "rid"

    sget-object v4, Lcom/gfan/sdk/statistics/Collector;->rid:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 734
    const-string v3, "comment"

    invoke-virtual {v1, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 735
    const-string v3, "version"

    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->getVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 737
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 738
    const-string v3, "0.3.2"

    const-string v4, "tongjisdk"

    invoke-static {v2, v3, v4}, Lcom/gfan/sdk/statistics/Collector;->buildTail(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 739
    sget-object v3, Lcom/gfan/sdk/statistics/Collector;->hander:Landroid/os/Handler;

    new-instance v4, Lcom/gfan/sdk/statistics/Collector$MessageHandler;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, p2}, Lcom/gfan/sdk/statistics/Collector$MessageHandler;-><init>(Ljava/lang/String;Lcom/gfan/sdk/statistics/Collector$IResponse;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 750
    .end local v1           #jsonObject:Lorg/json/JSONObject;
    .end local v2           #str:Ljava/lang/StringBuilder;
    :cond_0
    :goto_0
    return-void

    .line 741
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 742
    .local v0, e:Lorg/json/JSONException;
    invoke-interface {p2, v0}, Lcom/gfan/sdk/statistics/Collector$IResponse;->onFailed(Ljava/lang/Exception;)V

    .line 743
    const-string v3, "SDK"

    const-string v4, "sendPlInfo failed"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 746
    .end local v0           #e:Lorg/json/JSONException;
    :cond_1
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "sdk\u672a\u521d\u59cb\u5316"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, v3}, Lcom/gfan/sdk/statistics/Collector$IResponse;->onFailed(Ljava/lang/Exception;)V

    .line 747
    const-string v3, "error"

    const-string v4, "the SDK configured failed to initialize"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static getAppClickCount(Landroid/content/Context;J)Ljava/lang/String;
    .locals 9
    .parameter "context"
    .parameter "starttime"

    .prologue
    .line 387
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 388
    .local v1, clickcountlist:Ljava/lang/StringBuilder;
    invoke-static {p0}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->getConnection(Landroid/content/Context;)Lcom/gfan/sdk/statistics/ConnectDBUtil;

    move-result-object v4

    .line 390
    .local v4, db:Lcom/gfan/sdk/statistics/ConnectDBUtil;
    invoke-virtual {v4, p1, p2}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->AppSelect(J)Landroid/database/Cursor;

    move-result-object v3

    .line 391
    .local v3, cursor:Landroid/database/Cursor;
    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v5

    if-nez v5, :cond_0

    .line 393
    const-string v5, "[{\"\":\"0\"}]"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 411
    :goto_0
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 412
    invoke-virtual {v4}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->close()V

    .line 414
    new-instance v5, Ljava/lang/StringBuilder;

    const/4 v6, 0x0

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    const/4 v8, 0x1

    sub-int/2addr v7, v8

    invoke-virtual {v1, v6, v7}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 395
    :cond_0
    const-string v5, "["

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 396
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    .line 398
    :cond_1
    const-string v5, "clickname"

    invoke-interface {v3, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 399
    .local v2, clickname:Ljava/lang/String;
    const-string v5, "clickcount"

    invoke-interface {v3, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v3, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    .line 400
    .local v0, clickcount:I
    const-string v5, "{\""

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\":\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\"},"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 409
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    .line 397
    if-nez v5, :cond_1

    goto :goto_0
.end method

.method private static getAppkey(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .prologue
    .line 996
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->getPackageName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x80

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 998
    .local v1, info:Landroid/content/pm/ApplicationInfo;
    :try_start_0
    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "gfan_statistics_appkey"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 1001
    :goto_0
    return-object v2

    .line 999
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 1000
    .local v0, e:Ljava/lang/NullPointerException;
    const-string v2, "SDK"

    const-string v3, "The gfan_statistics_appkey must be set."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1001
    const-string v2, ""

    goto :goto_0
.end method

.method private static getCompanyID()Ljava/lang/String;
    .locals 5

    .prologue
    .line 113
    const-string v0, ""

    .line 114
    .local v0, companyid:Ljava/lang/String;
    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->getSimSerialNumber()Ljava/lang/String;

    move-result-object v2

    .line 115
    .local v2, sim:Ljava/lang/String;
    if-nez v2, :cond_0

    .line 116
    const-string v3, "no sim"

    .line 124
    :goto_0
    return-object v3

    .line 119
    :cond_0
    const/4 v3, 0x4

    const/4 v4, 0x6

    :try_start_0
    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    move-object v3, v0

    .line 124
    goto :goto_0

    .line 120
    :catch_0
    move-exception v1

    .line 121
    .local v1, e:Ljava/lang/Exception;
    const-string v3, "no sim"

    goto :goto_0
.end method

.method private static getCountry()Ljava/lang/String;
    .locals 4

    .prologue
    .line 166
    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->getSimSerialNumber()Ljava/lang/String;

    move-result-object v1

    .line 167
    .local v1, sim:Ljava/lang/String;
    if-nez v1, :cond_0

    .line 168
    const-string v2, "no sim"

    .line 173
    :goto_0
    return-object v2

    .line 171
    :cond_0
    const/4 v2, 0x0

    const/4 v3, 0x4

    :try_start_0
    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 172
    :catch_0
    move-exception v0

    .line 173
    .local v0, e:Ljava/lang/Exception;
    const-string v2, "no sim"

    goto :goto_0
.end method

.method private static getCpID(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .prologue
    .line 986
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->getPackageName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x80

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 988
    .local v1, info:Landroid/content/pm/ApplicationInfo;
    :try_start_0
    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "gfan_cpid"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 991
    :goto_0
    return-object v2

    .line 989
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 990
    .local v0, e:Ljava/lang/NullPointerException;
    const-string v2, "SDK"

    const-string v3, "The cpid must be set."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 991
    const-string v2, ""

    goto :goto_0
.end method

.method private static getCpidMac()Ljava/lang/String;
    .locals 1

    .prologue
    .line 757
    const-string v0, ""

    return-object v0
.end method

.method private static getDevice()Ljava/lang/String;
    .locals 1

    .prologue
    .line 129
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    return-object v0
.end method

.method private static getIMEI()Ljava/lang/String;
    .locals 2

    .prologue
    .line 105
    sget-object v1, Lcom/gfan/sdk/statistics/Collector;->telManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    .line 108
    .local v0, imei:Ljava/lang/String;
    return-object v0
.end method

.method private static getMetricsd(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .parameter "context"

    .prologue
    .line 139
    instance-of v1, p0, Landroid/app/Activity;

    if-eqz v1, :cond_0

    .line 140
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 141
    .local v0, dm:Landroid/util/DisplayMetrics;
    check-cast p0, Landroid/app/Activity;

    .end local p0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 143
    new-instance v1, Ljava/lang/StringBuilder;

    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 145
    .end local v0           #dm:Landroid/util/DisplayMetrics;
    :goto_0
    return-object v1

    .restart local p0
    :cond_0
    const-string v1, ""

    goto :goto_0
.end method

.method private static getOS()Ljava/lang/String;
    .locals 1

    .prologue
    .line 134
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    return-object v0
.end method

.method private static getPackageName(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .parameter "context"

    .prologue
    .line 247
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getProvince()Ljava/lang/String;
    .locals 4

    .prologue
    .line 151
    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->getSimSerialNumber()Ljava/lang/String;

    move-result-object v1

    .line 152
    .local v1, sim:Ljava/lang/String;
    if-nez v1, :cond_0

    .line 153
    const-string v2, "no sim"

    .line 158
    :goto_0
    return-object v2

    .line 156
    :cond_0
    const/16 v2, 0x8

    const/16 v3, 0xa

    :try_start_0
    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 157
    :catch_0
    move-exception v0

    .line 158
    .local v0, e:Ljava/lang/Exception;
    const-string v2, "no sim"

    goto :goto_0
.end method

.method private static getRid(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .parameter "context"

    .prologue
    .line 216
    invoke-static {p0}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->getConnection(Landroid/content/Context;)Lcom/gfan/sdk/statistics/ConnectDBUtil;

    move-result-object v1

    .line 217
    .local v1, db:Lcom/gfan/sdk/statistics/ConnectDBUtil;
    invoke-virtual {v1}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->ridSelect()Landroid/database/Cursor;

    move-result-object v0

    .line 218
    .local v0, cursor:Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 219
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 220
    const-string v2, "rid"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/gfan/sdk/statistics/Collector;->rid:Ljava/lang/String;

    .line 222
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 223
    invoke-virtual {v1}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->close()V

    .line 227
    sget-object v2, Lcom/gfan/sdk/statistics/Collector;->rid:Ljava/lang/String;

    return-object v2
.end method

.method private static getSimSerialNumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    sget-object v0, Lcom/gfan/sdk/statistics/Collector;->telManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimSerialNumber()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getVersion(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .parameter "context"

    .prologue
    .line 252
    const-string v1, ""

    .line 254
    .local v1, version:Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iget-object v1, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 258
    :goto_0
    return-object v1

    .line 255
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 256
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v2, "SDK"

    const-string v3, "not found app version"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static onError(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 889
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    .line 892
    .local v0, currentHandler:Ljava/lang/Thread$UncaughtExceptionHandler;
    instance-of v1, v0, Lcom/gfan/sdk/statistics/DefaultExceptionHandler;

    if-nez v1, :cond_0

    .line 894
    new-instance v1, Lcom/gfan/sdk/statistics/DefaultExceptionHandler;

    invoke-direct {v1, v0, p0}, Lcom/gfan/sdk/statistics/DefaultExceptionHandler;-><init>(Ljava/lang/Thread$UncaughtExceptionHandler;Landroid/content/Context;)V

    invoke-static {v1}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 896
    :cond_0
    return-void
.end method

.method public static onPause(Landroid/content/Context;)V
    .locals 5
    .parameter "context"

    .prologue
    .line 1087
    instance-of v1, p0, Landroid/app/Activity;

    if-nez v1, :cond_1

    .line 1101
    :cond_0
    :goto_0
    return-void

    .line 1092
    :cond_1
    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->setActivityPauseTime()V

    .line 1094
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1096
    .local v0, preferences:Landroid/content/SharedPreferences;
    if-eqz v0, :cond_0

    .line 1099
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "com.gfan.sdk.appStarttime"

    sget-wide v3, Lcom/gfan/sdk/statistics/Collector;->appStarttime:J

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "com.gfan.sdk.activityPauseTime"

    sget-wide v3, Lcom/gfan/sdk/statistics/Collector;->activityPauseTime:J

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 1100
    const-string v2, "com.gfan.sdk.timesum"

    sget-wide v3, Lcom/gfan/sdk/statistics/Collector;->timesum:J

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method public static onResume(Landroid/content/Context;)V
    .locals 10
    .parameter "context"

    .prologue
    const-wide/16 v8, 0x0

    .line 1012
    instance-of v4, p0, Landroid/app/Activity;

    if-nez v4, :cond_1

    .line 1084
    :cond_0
    :goto_0
    return-void

    .line 1014
    :cond_1
    sput-object p0, Lcom/gfan/sdk/statistics/Collector;->context:Landroid/content/Context;

    .line 1016
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sput-wide v4, Lcom/gfan/sdk/statistics/Collector;->activityResumeTime:J

    .line 1018
    sget-object v4, Lcom/gfan/sdk/statistics/Collector;->appkey:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_2

    sget-object v4, Lcom/gfan/sdk/statistics/Collector;->cpid:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_3

    .line 1020
    :cond_2
    :try_start_0
    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->getAppkey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/gfan/sdk/statistics/Collector;->appkey:Ljava/lang/String;

    .line 1021
    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->getCpID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/gfan/sdk/statistics/Collector;->cpid:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 1029
    :cond_3
    sget-object v4, Lcom/gfan/sdk/statistics/Collector;->telManager:Landroid/telephony/TelephonyManager;

    if-nez v4, :cond_4

    .line 1030
    const-string v4, "phone"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/TelephonyManager;

    sput-object v4, Lcom/gfan/sdk/statistics/Collector;->telManager:Landroid/telephony/TelephonyManager;

    .line 1034
    :cond_4
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 1036
    .local v3, preferences:Landroid/content/SharedPreferences;
    if-eqz v3, :cond_0

    .line 1039
    const-string v4, "com.gfan.sdk.appStarttime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-interface {v3, v4, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    sput-wide v4, Lcom/gfan/sdk/statistics/Collector;->appStarttime:J

    .line 1040
    const-string v4, "com.gfan.sdk.activityPauseTime"

    invoke-interface {v3, v4, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    sput-wide v4, Lcom/gfan/sdk/statistics/Collector;->activityPauseTime:J

    .line 1041
    const-string v4, "com.gfan.sdk.timesum"

    invoke-interface {v3, v4, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    sput-wide v4, Lcom/gfan/sdk/statistics/Collector;->timesum:J

    .line 1044
    :try_start_1
    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->getRid(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_5

    .line 1046
    sget-wide v4, Lcom/gfan/sdk/statistics/Collector;->appStarttime:J

    invoke-static {p0, v4, v5}, Lcom/gfan/sdk/statistics/Collector;->sendMoblieInfo(Landroid/content/Context;J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1081
    :catch_0
    move-exception v4

    goto :goto_0

    .line 1023
    .end local v3           #preferences:Landroid/content/SharedPreferences;
    :catch_1
    move-exception v4

    move-object v0, v4

    .line 1024
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v4, "SDK"

    const-string v5, "The did or cpid not set"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1049
    .end local v0           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v3       #preferences:Landroid/content/SharedPreferences;
    :cond_5
    :try_start_2
    sget-wide v4, Lcom/gfan/sdk/statistics/Collector;->activityPauseTime:J

    cmp-long v4, v4, v8

    if-eqz v4, :cond_6

    sget-wide v4, Lcom/gfan/sdk/statistics/Collector;->activityResumeTime:J

    sget-wide v6, Lcom/gfan/sdk/statistics/Collector;->activityPauseTime:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x3a98

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    .line 1052
    :cond_6
    sget-wide v4, Lcom/gfan/sdk/statistics/Collector;->appStarttime:J

    invoke-static {p0, v4, v5}, Lcom/gfan/sdk/statistics/Collector;->sendAppInfo(Landroid/content/Context;J)V

    .line 1054
    const-string v4, "com.gfan.sdk.lastSendAppListTime"

    const-wide/16 v5, 0x0

    invoke-interface {v3, v4, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    .line 1055
    .local v1, lastSendAppListTime:J
    sget-wide v4, Lcom/gfan/sdk/statistics/Collector;->activityResumeTime:J

    const-wide/32 v6, 0x240c8400

    add-long/2addr v6, v1

    cmp-long v4, v4, v6

    if-lez v4, :cond_7

    .line 1057
    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->sendApkListInfo(Landroid/content/Context;)V

    .line 1060
    :cond_7
    sget-wide v4, Lcom/gfan/sdk/statistics/Collector;->activityPauseTime:J

    cmp-long v4, v4, v8

    if-lez v4, :cond_0

    .line 1063
    sget-wide v4, Lcom/gfan/sdk/statistics/Collector;->appStarttime:J

    sget-wide v6, Lcom/gfan/sdk/statistics/Collector;->timesum:J

    invoke-static {p0, v4, v5, v6, v7}, Lcom/gfan/sdk/statistics/Collector;->sendLeaveInfo(Landroid/content/Context;JJ)V

    .line 1067
    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->sendErrorsInfo(Landroid/content/Context;)V

    .line 1069
    sget-wide v4, Lcom/gfan/sdk/statistics/Collector;->activityResumeTime:J

    sput-wide v4, Lcom/gfan/sdk/statistics/Collector;->appStarttime:J

    .line 1072
    const-wide/16 v4, 0x0

    sput-wide v4, Lcom/gfan/sdk/statistics/Collector;->timesum:J
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0
.end method

.method private static postAppInfo(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 18
    .parameter "context"
    .parameter "version"
    .parameter "starttime"
    .parameter "mac"
    .parameter "cpidmac"
    .parameter "opid"
    .parameter "sdkVersion"
    .parameter "sdkType"
    .parameter "backupId"

    .prologue
    .line 573
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 574
    .local v4, str:Ljava/lang/StringBuilder;
    const-string v3, "{\"msgtype\":\"appinfo\",\"body\":"

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 575
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 576
    .local v3, jsonObject:Lorg/json/JSONObject;
    const-string v5, "rid"

    sget-object v6, Lcom/gfan/sdk/statistics/Collector;->rid:Ljava/lang/String;

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "version"

    move-object v0, v5

    move-object v1, v6

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "starttime"

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "endtime"

    const-string v7, "0"

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "timesum"

    const-string v7, "0"

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    .line 577
    const-string v6, "clickcount"

    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 578
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 579
    move-object v0, v4

    move-object/from16 v1, p7

    move-object/from16 v2, p8

    invoke-static {v0, v1, v2}, Lcom/gfan/sdk/statistics/Collector;->buildTail(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 581
    sget-object v15, Lcom/gfan/sdk/statistics/Collector;->hander:Landroid/os/Handler;

    new-instance v16, Lcom/gfan/sdk/statistics/Collector$MessageHandler;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    new-instance v3, Lcom/gfan/sdk/statistics/Collector$3;

    .end local v3           #jsonObject:Lorg/json/JSONObject;
    move-wide/from16 v4, p9

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-wide/from16 v8, p2

    move-object/from16 v10, p4

    move-object/from16 v11, p5

    move-object/from16 v12, p6

    move-object/from16 v13, p7

    move-object/from16 v14, p8

    invoke-direct/range {v3 .. v14}, Lcom/gfan/sdk/statistics/Collector$3;-><init>(JLandroid/content/Context;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .end local v4           #str:Ljava/lang/StringBuilder;
    move-object/from16 v0, v16

    move-object/from16 v1, v17

    move-object v2, v3

    invoke-direct {v0, v1, v2}, Lcom/gfan/sdk/statistics/Collector$MessageHandler;-><init>(Ljava/lang/String;Lcom/gfan/sdk/statistics/Collector$IResponse;)V

    invoke-virtual/range {v15 .. v16}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 610
    .end local p0
    .end local p1
    :goto_0
    return-void

    .line 607
    .restart local p0
    .restart local p1
    :catch_0
    move-exception p0

    .line 608
    .local p0, e:Lorg/json/JSONException;
    const-string p0, "SDK"

    .end local p0           #e:Lorg/json/JSONException;
    const-string p1, "JSONException in postappinfo"

    .end local p1
    invoke-static/range {p0 .. p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static postLeaveInfo(Landroid/content/Context;Ljava/lang/String;JJJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 22
    .parameter "context"
    .parameter "version"
    .parameter "starttime"
    .parameter "endtime"
    .parameter "timesum"
    .parameter "mac"
    .parameter "cpidmac"
    .parameter "opid"
    .parameter "sdkVersion"
    .parameter "sdkType"
    .parameter "backupId"

    .prologue
    .line 522
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 523
    .local v4, str:Ljava/lang/StringBuilder;
    const-string v3, "{\"msgtype\":\"leaveinfo\",\"body\":"

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 524
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 525
    .local v3, jsonObject:Lorg/json/JSONObject;
    const-string v5, "rid"

    sget-object v6, Lcom/gfan/sdk/statistics/Collector;->rid:Ljava/lang/String;

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "version"

    move-object v0, v5

    move-object v1, v6

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "starttime"

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "endtime"

    invoke-static/range {p4 .. p5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    .line 526
    const-string v6, "timesum"

    invoke-static/range {p6 .. p7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 527
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 528
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    .end local v3           #jsonObject:Lorg/json/JSONObject;
    const/4 v5, 0x1

    sub-int/2addr v3, v5

    .line 529
    .local v3, i:I
    move-object v0, v4

    move-object/from16 v1, p11

    move-object/from16 v2, p12

    invoke-static {v0, v1, v2}, Lcom/gfan/sdk/statistics/Collector;->buildTail(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 530
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, ",\"clickcount\":"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    move-wide/from16 v1, p2

    invoke-static {v0, v1, v2}, Lcom/gfan/sdk/statistics/Collector;->getAppClickCount(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 532
    sget-object v19, Lcom/gfan/sdk/statistics/Collector;->hander:Landroid/os/Handler;

    new-instance v20, Lcom/gfan/sdk/statistics/Collector$MessageHandler;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    new-instance v3, Lcom/gfan/sdk/statistics/Collector$2;

    .end local v3           #i:I
    move-object/from16 v4, p0

    move-wide/from16 v5, p2

    move-wide/from16 v7, p13

    move-object/from16 v9, p1

    move-wide/from16 v10, p4

    move-wide/from16 v12, p6

    move-object/from16 v14, p8

    move-object/from16 v15, p9

    move-object/from16 v16, p10

    move-object/from16 v17, p11

    move-object/from16 v18, p12

    invoke-direct/range {v3 .. v18}, Lcom/gfan/sdk/statistics/Collector$2;-><init>(Landroid/content/Context;JJLjava/lang/String;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .end local v4           #str:Ljava/lang/StringBuilder;
    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object v2, v3

    invoke-direct {v0, v1, v2}, Lcom/gfan/sdk/statistics/Collector$MessageHandler;-><init>(Ljava/lang/String;Lcom/gfan/sdk/statistics/Collector$IResponse;)V

    invoke-virtual/range {v19 .. v20}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 566
    .end local p0
    .end local p1
    :goto_0
    return-void

    .line 563
    .restart local p0
    .restart local p1
    :catch_0
    move-exception p0

    .line 564
    .local p0, e:Lorg/json/JSONException;
    const-string p0, "SDK"

    .end local p0           #e:Lorg/json/JSONException;
    const-string p1, "JSONException in postLeaveInfo"

    .end local p1
    invoke-static/range {p0 .. p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static searchForStackTraces(Landroid/content/Context;)[Ljava/lang/String;
    .locals 3
    .parameter "context"

    .prologue
    .line 899
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 901
    .local v0, dir:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    .line 903
    new-instance v1, Lcom/gfan/sdk/statistics/Collector$6;

    invoke-direct {v1}, Lcom/gfan/sdk/statistics/Collector$6;-><init>()V

    invoke-virtual {v0, v1}, Ljava/io/File;->list(Ljava/io/FilenameFilter;)[Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static sendApkListInfo(Landroid/content/Context;)V
    .locals 7
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 683
    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->validate()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 684
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 685
    .local v2, str:Ljava/lang/StringBuilder;
    const-string v3, "{\"msgtype\":\"applist\",\"body\":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 689
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 690
    .local v1, jsonObject:Lorg/json/JSONObject;
    const-string v3, "rid"

    sget-object v4, Lcom/gfan/sdk/statistics/Collector;->rid:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 691
    const-string v3, "packagelist"

    const-string v4, "${packagelist}"

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 692
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 694
    const-string v3, "0.3.2"

    const-string v4, "tongjisdk"

    invoke-static {v2, v3, v4}, Lcom/gfan/sdk/statistics/Collector;->buildTail(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 696
    sget-object v3, Lcom/gfan/sdk/statistics/Collector;->hander:Landroid/os/Handler;

    new-instance v4, Lcom/gfan/sdk/statistics/Collector$ApkInfo;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/gfan/sdk/statistics/Collector$4;

    invoke-direct {v6, p0}, Lcom/gfan/sdk/statistics/Collector$4;-><init>(Landroid/content/Context;)V

    .line 712
    invoke-direct {v4, v5, v6, p0}, Lcom/gfan/sdk/statistics/Collector$ApkInfo;-><init>(Ljava/lang/String;Lcom/gfan/sdk/statistics/Collector$IResponse;Landroid/content/Context;)V

    .line 696
    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 720
    .end local v1           #jsonObject:Lorg/json/JSONObject;
    .end local v2           #str:Ljava/lang/StringBuilder;
    :goto_0
    return-void

    .line 713
    .restart local v2       #str:Ljava/lang/StringBuilder;
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 714
    .local v0, e:Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 717
    .end local v0           #e:Lorg/json/JSONException;
    .end local v2           #str:Ljava/lang/StringBuilder;
    :cond_0
    const-string v3, "error"

    const-string v4, "the SDK configured failed to initialize"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static sendAppInfo(Landroid/content/Context;J)V
    .locals 20
    .parameter "context"
    .parameter "appStarttime"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 429
    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->validate()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 430
    invoke-static/range {p0 .. p0}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->getConnection(Landroid/content/Context;)Lcom/gfan/sdk/statistics/ConnectDBUtil;

    move-result-object v12

    .line 431
    .local v12, db:Lcom/gfan/sdk/statistics/ConnectDBUtil;
    invoke-virtual {v12}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->BackupStartInfoSelect()Landroid/database/Cursor;

    move-result-object v11

    .line 432
    .local v11, cursor:Landroid/database/Cursor;
    invoke-interface {v11}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 433
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    .line 438
    :cond_0
    const-string v0, "version"

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 439
    .local v1, version:Ljava/lang/String;
    const-string v0, "starttime"

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    .line 440
    .local v2, starttime:J
    const-string v0, "mac"

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 442
    .local v4, mac:Ljava/lang/String;
    const-string v0, "cpidmac"

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 443
    .local v5, cpidmac:Ljava/lang/String;
    const-string v0, "opid"

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 444
    .local v6, opid:Ljava/lang/String;
    const-string v0, "sdk_version"

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 445
    .local v7, sdkVersion:Ljava/lang/String;
    const-string v0, "sdk_type"

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 447
    .local v8, sdkType:Ljava/lang/String;
    const-string v0, "id"

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    move-object/from16 v0, p0

    invoke-static/range {v0 .. v10}, Lcom/gfan/sdk/statistics/Collector;->postAppInfo(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 448
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    .line 435
    if-nez v0, :cond_0

    .line 450
    .end local v1           #version:Ljava/lang/String;
    .end local v2           #starttime:J
    .end local v4           #mac:Ljava/lang/String;
    .end local v5           #cpidmac:Ljava/lang/String;
    .end local v6           #opid:Ljava/lang/String;
    .end local v7           #sdkVersion:Ljava/lang/String;
    .end local v8           #sdkType:Ljava/lang/String;
    :cond_1
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 451
    invoke-virtual {v12}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->close()V

    .line 465
    invoke-static/range {p0 .. p0}, Lcom/gfan/sdk/statistics/Collector;->getVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    const-string v13, "FF9B8CB4-E13B-44a7-B3C6-B385D8EB8167"

    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->getCpidMac()Ljava/lang/String;

    move-result-object v14

    sget-object v15, Lcom/gfan/sdk/statistics/Collector;->opid:Ljava/lang/String;

    const-string v16, "0.3.2"

    const-string v17, "tongjisdk"

    const-wide/16 v18, -0x1

    move-object/from16 v9, p0

    move-wide/from16 v11, p1

    invoke-static/range {v9 .. v19}, Lcom/gfan/sdk/statistics/Collector;->postAppInfo(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 470
    .end local v11           #cursor:Landroid/database/Cursor;
    .end local v12           #db:Lcom/gfan/sdk/statistics/ConnectDBUtil;
    .end local p0
    .end local p1
    :goto_0
    return-void

    .line 467
    .restart local p0
    .restart local p1
    :cond_2
    const-string p0, "SDK"

    .end local p0
    const-string p1, "the SDK configured failed to initialize"

    .end local p1
    invoke-static/range {p0 .. p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static sendCachedLeaveInfo(Landroid/content/Context;)V
    .locals 31
    .parameter "context"

    .prologue
    .line 490
    invoke-static/range {p0 .. p0}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->getConnection(Landroid/content/Context;)Lcom/gfan/sdk/statistics/ConnectDBUtil;

    move-result-object v30

    .line 491
    .local v30, db:Lcom/gfan/sdk/statistics/ConnectDBUtil;
    invoke-virtual/range {v30 .. v30}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->BackupAppInfoSelect()Landroid/database/Cursor;

    move-result-object v29

    .line 492
    .local v29, cursor:Landroid/database/Cursor;
    invoke-interface/range {v29 .. v29}, Landroid/database/Cursor;->getCount()I

    move-result v15

    if-lez v15, :cond_1

    .line 493
    invoke-interface/range {v29 .. v29}, Landroid/database/Cursor;->moveToFirst()Z

    .line 498
    :cond_0
    const-string v15, "version"

    move-object/from16 v0, v29

    move-object v1, v15

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v0, v29

    move v1, v15

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 499
    .local v15, version:Ljava/lang/String;
    const-string v16, "starttime"

    move-object/from16 v0, v29

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v16

    move-object/from16 v0, v29

    move/from16 v1, v16

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v16

    .line 500
    .local v16, starttime:J
    const-string v18, "endtime"

    move-object/from16 v0, v29

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, v29

    move/from16 v1, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v18

    .line 501
    .local v18, endtime:J
    const-string v20, "timesum"

    move-object/from16 v0, v29

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v20

    move-object/from16 v0, v29

    move/from16 v1, v20

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v20

    .line 502
    .local v20, _timesum:J
    const-string v22, "mac"

    move-object/from16 v0, v29

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v22

    move-object/from16 v0, v29

    move/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    .line 504
    .local v22, mac:Ljava/lang/String;
    const-string v23, "cpidmac"

    move-object/from16 v0, v29

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v23

    move-object/from16 v0, v29

    move/from16 v1, v23

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v23

    .line 505
    .local v23, cpidmac:Ljava/lang/String;
    const-string v24, "opid"

    move-object/from16 v0, v29

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, v29

    move/from16 v1, v24

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v24

    .line 506
    .local v24, opid:Ljava/lang/String;
    const-string v25, "sdk_version"

    move-object/from16 v0, v29

    move-object/from16 v1, v25

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v25

    move-object/from16 v0, v29

    move/from16 v1, v25

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v25

    .line 507
    .local v25, sdkVersion:Ljava/lang/String;
    const-string v26, "sdk_type"

    move-object/from16 v0, v29

    move-object/from16 v1, v26

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v26

    move-object/from16 v0, v29

    move/from16 v1, v26

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v26

    .line 510
    .local v26, sdkType:Ljava/lang/String;
    const-string v27, "id"

    move-object/from16 v0, v29

    move-object/from16 v1, v27

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v27

    move-object/from16 v0, v29

    move/from16 v1, v27

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v27

    .line 509
    move-object/from16 v0, p0

    move-object v1, v15

    move-wide/from16 v2, v16

    move-wide/from16 v4, v18

    move-wide/from16 v6, v20

    move-object/from16 v8, v22

    move-object/from16 v9, v23

    move-object/from16 v10, v24

    move-object/from16 v11, v25

    move-object/from16 v12, v26

    move-wide/from16 v13, v27

    invoke-static/range {v0 .. v14}, Lcom/gfan/sdk/statistics/Collector;->postLeaveInfo(Landroid/content/Context;Ljava/lang/String;JJJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 511
    invoke-interface/range {v29 .. v29}, Landroid/database/Cursor;->moveToNext()Z

    move-result v15

    .line 495
    .end local v15           #version:Ljava/lang/String;
    if-nez v15, :cond_0

    .line 513
    .end local v16           #starttime:J
    .end local v18           #endtime:J
    .end local v20           #_timesum:J
    .end local v22           #mac:Ljava/lang/String;
    .end local v23           #cpidmac:Ljava/lang/String;
    .end local v24           #opid:Ljava/lang/String;
    .end local v25           #sdkVersion:Ljava/lang/String;
    .end local v26           #sdkType:Ljava/lang/String;
    :cond_1
    invoke-interface/range {v29 .. v29}, Landroid/database/Cursor;->close()V

    .line 514
    invoke-virtual/range {v30 .. v30}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->close()V

    .line 515
    return-void
.end method

.method private static sendCpInfo(Landroid/content/Context;)V
    .locals 7
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 775
    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->validate()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 780
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 781
    .local v2, str:Ljava/lang/StringBuilder;
    const-string v3, "{\"msgtype\":\"cpinfo\",\"body\":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 782
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "rid"

    sget-object v5, Lcom/gfan/sdk/statistics/Collector;->rid:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "cpid"

    sget-object v5, Lcom/gfan/sdk/statistics/Collector;->cpid:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 783
    .local v1, jsonObject:Lorg/json/JSONObject;
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 784
    const-string v3, "0.3.2"

    const-string v4, "tongjisdk"

    invoke-static {v2, v3, v4}, Lcom/gfan/sdk/statistics/Collector;->buildTail(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 785
    sget-object v3, Lcom/gfan/sdk/statistics/Collector;->hander:Landroid/os/Handler;

    new-instance v4, Lcom/gfan/sdk/statistics/Collector$MessageHandler;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/gfan/sdk/statistics/Collector$5;

    invoke-direct {v6}, Lcom/gfan/sdk/statistics/Collector$5;-><init>()V

    invoke-direct {v4, v5, v6}, Lcom/gfan/sdk/statistics/Collector$MessageHandler;-><init>(Ljava/lang/String;Lcom/gfan/sdk/statistics/Collector$IResponse;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 804
    .end local v1           #jsonObject:Lorg/json/JSONObject;
    .end local v2           #str:Ljava/lang/StringBuilder;
    :goto_0
    return-void

    .line 797
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 798
    .local v0, e:Lorg/json/JSONException;
    const-string v3, "SDK"

    const-string v4, "sendCpInfo failed"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 801
    .end local v0           #e:Lorg/json/JSONException;
    :cond_0
    const-string v3, "SDK"

    const-string v4, "the SDK configured failed to initialize"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static sendErrorsInfo(Landroid/content/Context;)V
    .locals 11
    .parameter "context"

    .prologue
    .line 911
    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->validate()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 912
    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->getRid(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 914
    .local v1, rid:Ljava/lang/String;
    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->searchForStackTraces(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v9

    .line 916
    .local v9, traces:[Ljava/lang/String;
    if-eqz v9, :cond_0

    array-length v0, v9

    if-lez v0, :cond_0

    .line 917
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 919
    .local v0, dir:Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 920
    .local v7, str:Ljava/lang/StringBuilder;
    const-string v2, "{\"msgtype\":\"errorinfo\",\"body\":"

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 921
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 924
    .local v6, jsonObject:Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "rid"

    invoke-virtual {v6, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .end local v1           #rid:Ljava/lang/String;
    const-string v2, "version"

    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->getVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    .end local p0
    invoke-virtual {v1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "device"

    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->getDevice()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "os"

    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->getOS()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 925
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    .line 926
    .local v5, jsonArray:Lorg/json/JSONArray;
    const-string p0, "errors"

    invoke-virtual {v6, p0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 928
    const/4 p0, 0x0

    .local p0, i:I
    move v3, p0

    .end local p0           #i:I
    .local v3, i:I
    :goto_0
    array-length p0, v9
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-lt v3, p0, :cond_1

    .line 957
    .end local v3           #i:I
    .end local v5           #jsonArray:Lorg/json/JSONArray;
    :goto_1
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 958
    const-string p0, "0.3.2"

    const-string v1, "tongjisdk"

    invoke-static {v7, p0, v1}, Lcom/gfan/sdk/statistics/Collector;->buildTail(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 960
    sget-object p0, Lcom/gfan/sdk/statistics/Collector;->hander:Landroid/os/Handler;

    new-instance v1, Lcom/gfan/sdk/statistics/Collector$MessageHandler;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/gfan/sdk/statistics/Collector$7;

    invoke-direct {v3, v9, v0}, Lcom/gfan/sdk/statistics/Collector$7;-><init>([Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v1, v2, v3}, Lcom/gfan/sdk/statistics/Collector$MessageHandler;-><init>(Ljava/lang/String;Lcom/gfan/sdk/statistics/Collector$IResponse;)V

    invoke-virtual {p0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 983
    .end local v0           #dir:Ljava/lang/String;
    .end local v6           #jsonObject:Lorg/json/JSONObject;
    .end local v7           #str:Ljava/lang/StringBuilder;
    .end local v9           #traces:[Ljava/lang/String;
    :cond_0
    :goto_2
    return-void

    .line 929
    .restart local v0       #dir:Ljava/lang/String;
    .restart local v3       #i:I
    .restart local v5       #jsonArray:Lorg/json/JSONArray;
    .restart local v6       #jsonObject:Lorg/json/JSONObject;
    .restart local v7       #str:Ljava/lang/StringBuilder;
    .restart local v9       #traces:[Ljava/lang/String;
    :cond_1
    :try_start_1
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 930
    .local v1, errorObject:Lorg/json/JSONObject;
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    aget-object v2, v9, v3

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 932
    .local v2, filePath:Ljava/lang/String;
    aget-object p0, v9, v3

    const/4 v4, 0x0

    aget-object v8, v9, v3

    const-string v10, "."

    invoke-virtual {v8, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p0, v4, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 934
    .local v8, time:Ljava/lang/String;
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 935
    .local p0, contents:Ljava/lang/StringBuilder;
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v10, Ljava/io/FileReader;

    invoke-direct {v10, v2}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v10}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 937
    .local v4, input:Ljava/io/BufferedReader;
    const/4 v2, 0x0

    .line 938
    .local v2, line:Ljava/lang/String;
    :goto_3
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    .line 942
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 944
    const-string v2, "time"

    .end local v2           #line:Ljava/lang/String;
    invoke-virtual {v1, v2, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v4, "error"

    .end local v4           #input:Ljava/io/BufferedReader;
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .end local p0           #contents:Ljava/lang/StringBuilder;
    invoke-virtual {v2, v4, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 945
    invoke-virtual {v5, v3, v1}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    .line 928
    add-int/lit8 p0, v3, 0x1

    .end local v3           #i:I
    .local p0, i:I
    move v3, p0

    .end local p0           #i:I
    .restart local v3       #i:I
    goto :goto_0

    .line 939
    .restart local v2       #line:Ljava/lang/String;
    .restart local v4       #input:Ljava/io/BufferedReader;
    .local p0, contents:Ljava/lang/StringBuilder;
    :cond_2
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 940
    const-string v10, "line.separator"

    invoke-static {v10}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    .line 947
    .end local v1           #errorObject:Lorg/json/JSONObject;
    .end local v2           #line:Ljava/lang/String;
    .end local v3           #i:I
    .end local v4           #input:Ljava/io/BufferedReader;
    .end local v5           #jsonArray:Lorg/json/JSONArray;
    .end local v8           #time:Ljava/lang/String;
    .end local p0           #contents:Ljava/lang/StringBuilder;
    :catch_0
    move-exception p0

    goto/16 :goto_1

    .line 980
    .end local v0           #dir:Ljava/lang/String;
    .end local v6           #jsonObject:Lorg/json/JSONObject;
    .end local v7           #str:Ljava/lang/StringBuilder;
    .end local v9           #traces:[Ljava/lang/String;
    .local p0, context:Landroid/content/Context;
    :cond_3
    const-string p0, "SDK"

    .end local p0           #context:Landroid/content/Context;
    const-string v0, "the SDK configured failed to initialize"

    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 953
    .restart local v0       #dir:Ljava/lang/String;
    .restart local v6       #jsonObject:Lorg/json/JSONObject;
    .restart local v7       #str:Ljava/lang/StringBuilder;
    .restart local v9       #traces:[Ljava/lang/String;
    :catch_1
    move-exception p0

    goto/16 :goto_1

    .line 951
    :catch_2
    move-exception p0

    goto/16 :goto_1

    .line 949
    :catch_3
    move-exception p0

    goto/16 :goto_1
.end method

.method private static sendLeaveInfo(Landroid/content/Context;JJ)V
    .locals 15
    .parameter "context"
    .parameter "appStarttime"
    .parameter "timesum"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 477
    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->validate()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 479
    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->sendCachedLeaveInfo(Landroid/content/Context;)V

    .line 482
    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->getVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-string v8, "FF9B8CB4-E13B-44a7-B3C6-B385D8EB8167"

    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->getCpidMac()Ljava/lang/String;

    move-result-object v9

    sget-object v10, Lcom/gfan/sdk/statistics/Collector;->opid:Ljava/lang/String;

    const-string v11, "0.3.2"

    const-string v12, "tongjisdk"

    const-wide/16 v13, -0x1

    move-object v0, p0

    move-wide/from16 v2, p1

    move-wide/from16 v6, p3

    invoke-static/range {v0 .. v14}, Lcom/gfan/sdk/statistics/Collector;->postLeaveInfo(Landroid/content/Context;Ljava/lang/String;JJJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 487
    .end local p0
    .end local p1
    :goto_0
    return-void

    .line 484
    .restart local p0
    .restart local p1
    :cond_0
    const-string p0, "SDK"

    .end local p0
    const-string p1, "the SDK configured failed to initialize"

    .end local p1
    invoke-static/range {p0 .. p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static sendMessage(Ljava/lang/String;Lcom/gfan/sdk/statistics/Collector$IResponse;)Z
    .locals 10
    .parameter "message"
    .parameter "iResponse"

    .prologue
    const v7, 0xea60

    const/4 v9, 0x0

    .line 837
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    const-string v6, "http://data.gfan.com"

    invoke-direct {v3, v6}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 838
    .local v3, httppost:Lorg/apache/http/client/methods/HttpPost;
    new-instance v4, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v4}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 839
    .local v4, params:Lorg/apache/http/params/HttpParams;
    invoke-static {v4, v7}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 840
    invoke-static {v4, v7}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 841
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2, v4}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 842
    .local v2, httpclient:Lorg/apache/http/client/HttpClient;
    const-string v6, "Content-Type"

    const-string v7, "application/json"

    invoke-virtual {v3, v6, v7}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 846
    :try_start_0
    sget-boolean v6, Lcom/gfan/sdk/statistics/Collector;->DEBUG:Z

    if-eqz v6, :cond_0

    .line 847
    const-string v6, "SDK"

    invoke-static {v6, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 848
    :cond_0
    new-instance v6, Lorg/apache/http/entity/StringEntity;

    const-string v7, "UTF-8"

    invoke-direct {v6, p0, v7}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 850
    invoke-interface {v2, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v5

    .line 851
    .local v5, response:Lorg/apache/http/HttpResponse;
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    .line 852
    .local v0, code:I
    const/16 v6, 0xc8

    if-ne v6, v0, :cond_2

    .line 853
    if-eqz p1, :cond_1

    .line 854
    invoke-interface {p1, v5}, Lcom/gfan/sdk/statistics/Collector$IResponse;->onSuccess(Lorg/apache/http/HttpResponse;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 875
    :cond_1
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 857
    const/4 v6, 0x1

    .line 878
    .end local v0           #code:I
    .end local v5           #response:Lorg/apache/http/HttpResponse;
    :goto_0
    return v6

    .line 859
    .restart local v0       #code:I
    .restart local v5       #response:Lorg/apache/http/HttpResponse;
    :cond_2
    if-eqz p1, :cond_3

    .line 860
    :try_start_1
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v6}, Lcom/gfan/sdk/statistics/Collector$IResponse;->onFailed(Ljava/lang/Exception;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 875
    :cond_3
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    move v6, v9

    .line 862
    goto :goto_0

    .line 864
    .end local v0           #code:I
    .end local v5           #response:Lorg/apache/http/HttpResponse;
    :catch_0
    move-exception v6

    move-object v1, v6

    .line 865
    .local v1, e:Lorg/apache/http/client/ClientProtocolException;
    if-eqz p1, :cond_4

    .line 866
    :try_start_2
    invoke-interface {p1, v1}, Lcom/gfan/sdk/statistics/Collector$IResponse;->onFailed(Ljava/lang/Exception;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 875
    :cond_4
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    move v6, v9

    .line 867
    goto :goto_0

    .line 868
    .end local v1           #e:Lorg/apache/http/client/ClientProtocolException;
    :catch_1
    move-exception v6

    move-object v1, v6

    .line 869
    .local v1, e:Ljava/io/IOException;
    if-eqz p1, :cond_5

    .line 870
    :try_start_3
    invoke-interface {p1, v1}, Lcom/gfan/sdk/statistics/Collector$IResponse;->onFailed(Ljava/lang/Exception;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 875
    :cond_5
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .end local v1           #e:Ljava/io/IOException;
    :goto_1
    move v6, v9

    .line 878
    goto :goto_0

    .line 871
    :catch_2
    move-exception v6

    move-object v1, v6

    .line 872
    .local v1, e:Ljava/lang/Exception;
    if-eqz p1, :cond_6

    .line 873
    :try_start_4
    invoke-interface {p1, v1}, Lcom/gfan/sdk/statistics/Collector$IResponse;->onFailed(Ljava/lang/Exception;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 875
    :cond_6
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto :goto_1

    .line 874
    .end local v1           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    .line 875
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 876
    throw v6
.end method

.method private static sendMoblieInfo(Landroid/content/Context;J)V
    .locals 7
    .parameter "context"
    .parameter "appStarttime"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 283
    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->validate()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 285
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 286
    .local v2, str:Ljava/lang/StringBuilder;
    const-string v3, "{\"msgtype\":\"baseinfo\",\"body\":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 289
    .local v1, jsonObject:Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "country"

    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->getCountry()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "companyid"

    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->getCompanyID()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "device"

    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->getDevice()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "imei"

    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->getIMEI()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    .line 290
    const-string v4, "metricsd"

    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->getMetricsd(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "os"

    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->getOS()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "province"

    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->getProvince()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "sim"

    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->getSimSerialNumber()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 291
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 296
    :goto_0
    const-string v3, "0.3.2"

    const-string v4, "tongjisdk"

    invoke-static {v2, v3, v4}, Lcom/gfan/sdk/statistics/Collector;->buildTail(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    sget-object v3, Lcom/gfan/sdk/statistics/Collector;->hander:Landroid/os/Handler;

    new-instance v4, Lcom/gfan/sdk/statistics/Collector$MessageHandler;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/gfan/sdk/statistics/Collector$1;

    invoke-direct {v6, p0, p1, p2}, Lcom/gfan/sdk/statistics/Collector$1;-><init>(Landroid/content/Context;J)V

    invoke-direct {v4, v5, v6}, Lcom/gfan/sdk/statistics/Collector$MessageHandler;-><init>(Ljava/lang/String;Lcom/gfan/sdk/statistics/Collector$IResponse;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 352
    .end local v1           #jsonObject:Lorg/json/JSONObject;
    .end local v2           #str:Ljava/lang/StringBuilder;
    :goto_1
    return-void

    .line 292
    .restart local v1       #jsonObject:Lorg/json/JSONObject;
    .restart local v2       #str:Ljava/lang/StringBuilder;
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 293
    .local v0, e:Lorg/json/JSONException;
    const-string v3, "SDK"

    const-string v4, "e"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 350
    .end local v0           #e:Lorg/json/JSONException;
    .end local v1           #jsonObject:Lorg/json/JSONObject;
    .end local v2           #str:Ljava/lang/StringBuilder;
    :cond_0
    const-string v3, "SDK"

    const-string v4, "the SDK configured failed to initialize"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private static setActivityPauseTime()V
    .locals 6

    .prologue
    .line 263
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/gfan/sdk/statistics/Collector;->activityPauseTime:J

    .line 264
    sget-wide v0, Lcom/gfan/sdk/statistics/Collector;->timesum:J

    sget-wide v2, Lcom/gfan/sdk/statistics/Collector;->activityPauseTime:J

    sget-wide v4, Lcom/gfan/sdk/statistics/Collector;->activityResumeTime:J

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    sput-wide v0, Lcom/gfan/sdk/statistics/Collector;->timesum:J

    .line 265
    return-void
.end method

.method public static setAppClickCount(Ljava/lang/String;)V
    .locals 6
    .parameter "clickname"

    .prologue
    .line 362
    invoke-static {}, Lcom/gfan/sdk/statistics/Collector;->validate()Z

    move-result v3

    if-eqz v3, :cond_1

    sget-object v3, Lcom/gfan/sdk/statistics/Collector;->context:Landroid/content/Context;

    if-eqz v3, :cond_1

    .line 363
    sget-object v3, Lcom/gfan/sdk/statistics/Collector;->context:Landroid/content/Context;

    invoke-static {v3}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->getConnection(Landroid/content/Context;)Lcom/gfan/sdk/statistics/ConnectDBUtil;

    move-result-object v2

    .line 364
    .local v2, db:Lcom/gfan/sdk/statistics/ConnectDBUtil;
    sget-wide v3, Lcom/gfan/sdk/statistics/Collector;->appStarttime:J

    invoke-virtual {v2, p0, v3, v4}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->AppSelectClickname(Ljava/lang/String;J)Landroid/database/Cursor;

    move-result-object v1

    .line 365
    .local v1, cursor:Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-nez v3, :cond_0

    .line 366
    sget-wide v3, Lcom/gfan/sdk/statistics/Collector;->appStarttime:J

    const/4 v5, 0x1

    invoke-virtual {v2, p0, v3, v4, v5}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->AppInsert(Ljava/lang/String;JI)J

    .line 376
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 377
    invoke-virtual {v2}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->close()V

    .line 382
    .end local v1           #cursor:Landroid/database/Cursor;
    .end local v2           #db:Lcom/gfan/sdk/statistics/ConnectDBUtil;
    :goto_1
    return-void

    .line 370
    .restart local v1       #cursor:Landroid/database/Cursor;
    .restart local v2       #db:Lcom/gfan/sdk/statistics/ConnectDBUtil;
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 371
    const-string v3, "clickcount"

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    .line 372
    .local v0, clickcount:I
    sget-wide v3, Lcom/gfan/sdk/statistics/Collector;->appStarttime:J

    add-int/lit8 v5, v0, 0x1

    invoke-virtual {v2, p0, v3, v4, v5}, Lcom/gfan/sdk/statistics/ConnectDBUtil;->AppUpdate(Ljava/lang/String;JI)J

    goto :goto_0

    .line 379
    .end local v0           #clickcount:I
    .end local v1           #cursor:Landroid/database/Cursor;
    .end local v2           #db:Lcom/gfan/sdk/statistics/ConnectDBUtil;
    :cond_1
    const-string v3, "SDK"

    const-string v4, "the SDK configured failed to initialize"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private static validate()Z
    .locals 2

    .prologue
    .line 882
    const-string v0, ""

    sget-object v1, Lcom/gfan/sdk/statistics/Collector;->appkey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 883
    const/4 v0, 0x0

    .line 885
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
