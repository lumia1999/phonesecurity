.class public Lcom/mappn/gfan/SessionManager;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Observer;


# static fields
.field public static final P_AUTO_DELETE:Ljava/lang/String; = "delete_after_installation"

.field public static final P_CARD_VERSION:Ljava/lang/String; = "pref.card.version"

.field public static final P_CATEGORY_VERSION:Ljava/lang/String; = "pref.category.version"

.field public static final P_CLEAR_CACHE:Ljava/lang/String; = "auto_clear_cache"

.field public static final P_CURRENT_VERSION:Ljava/lang/String; = "pref.current.version"

.field public static final P_DEFAULT_CHARGE_TYPE:Ljava/lang/String; = "pref.charge.defaultChargeType"

.field public static final P_ISFIRST_LOGIN:Ljava/lang/String; = "pref.is.first.login"

.field public static final P_ISLOGIN:Ljava/lang/String; = "pref.isLogin"

.field public static final P_LPNS_BINDED_DEVID:Ljava/lang/String; = "pref.lpns.binded.devid"

.field public static final P_LPNS_IS_BINDED:Ljava/lang/String; = "pref.lpns.is.binded"

.field public static final P_MARKET_PASSWORD:Ljava/lang/String; = "pref.market.password"

.field public static final P_MARKET_USERNAME:Ljava/lang/String; = "pref.market.username"

.field public static final P_NOT_DOWNLOAD_IMAGE:Ljava/lang/String; = "not_download_image"

.field public static final P_NO_APP_FILTER:Ljava/lang/String; = "no_app_filter"

.field public static final P_OS_VERSION:Ljava/lang/String; = "pref.os.version"

.field public static final P_PRODUCT_UPDATE_CHECK_TIMESTAMP:Ljava/lang/String; = "pref.product.update.timestamp"

.field public static final P_RECOMMEND_APP_NOTIFICATION:Ljava/lang/String; = "pref.recommend.app"

.field public static final P_RECOMMEND_APP_NOTIFICATION_CHECK_TIME:Ljava/lang/String; = "pref.recommend.time"

.field public static final P_REMEMBER_PASSWORD:Ljava/lang/String; = "pref.remember.password"

.field public static final P_SCREEN_SIZE:Ljava/lang/String; = "pref.screen.size"

.field public static final P_SPLASH_ID:Ljava/lang/String; = "pref.splash.id"

.field public static final P_SPLASH_TIME:Ljava/lang/String; = "pref.splash.time"

.field public static final P_UID:Ljava/lang/String; = "pref.uid"

.field public static final P_UPDATE_APP_NOTIFICATION:Ljava/lang/String; = "update_app_notification"

.field public static final P_UPDATE_ID:Ljava/lang/String; = "pref.update.id"

.field public static final P_UPGRADE_NUM:Ljava/lang/String; = "pref.upgrade.num"

.field public static final P_USER_COOKIES:Ljava/lang/String; = "pref.cookies"

.field private static mInstance:Lcom/mappn/gfan/SessionManager;

.field private static final sApplyMethod:Ljava/lang/reflect/Method;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mCurrentUpdateThread:Ljava/lang/Thread;

.field private mPreference:Landroid/content/SharedPreferences;

.field private mUpdateQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/mappn/gfan/common/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    invoke-static {}, Lcom/mappn/gfan/SessionManager;->findApplyMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/mappn/gfan/SessionManager;->sApplyMethod:Ljava/lang/reflect/Method;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/SessionManager;->mUpdateQueue:Ljava/util/LinkedList;

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/mappn/gfan/SessionManager;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

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

.method static synthetic access$000(Lcom/mappn/gfan/SessionManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/SessionManager;->writePreference()V

    return-void
.end method

.method public static apply(Landroid/content/SharedPreferences$Editor;)V
    .locals 2

    sget-object v0, Lcom/mappn/gfan/SessionManager;->sApplyMethod:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    :try_start_0
    sget-object v0, Lcom/mappn/gfan/SessionManager;->sApplyMethod:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    :cond_0
    :goto_1
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_1
.end method

.method private static findApplyMethod()Ljava/lang/reflect/Method;
    .locals 3

    :try_start_0
    const-class v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "apply"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static get(Landroid/content/Context;)Lcom/mappn/gfan/SessionManager;
    .locals 1

    sget-object v0, Lcom/mappn/gfan/SessionManager;->mInstance:Lcom/mappn/gfan/SessionManager;

    if-nez v0, :cond_0

    new-instance v0, Lcom/mappn/gfan/SessionManager;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/SessionManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/mappn/gfan/SessionManager;->mInstance:Lcom/mappn/gfan/SessionManager;

    :cond_0
    sget-object v0, Lcom/mappn/gfan/SessionManager;->mInstance:Lcom/mappn/gfan/SessionManager;

    return-object v0
.end method

.method private isPreferenceNull()Z
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private writePreference()V
    .locals 6

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    iget-object v3, p0, Lcom/mappn/gfan/SessionManager;->mUpdateQueue:Ljava/util/LinkedList;

    monitor-enter v3

    :cond_0
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mUpdateQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_a

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mUpdateQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/util/Pair;

    iget-object v1, v0, Lcom/mappn/gfan/common/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    const-string v4, "pref.uid"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "pref.market.username"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "pref.market.password"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    :cond_1
    iget-object v0, v0, Lcom/mappn/gfan/common/util/Pair;->second:Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/SecurityUtil;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_2
    :try_start_1
    const-string v4, "pref.isLogin"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string v4, "pref.lpns.is.binded"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string v4, "pref.is.first.login"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    :cond_3
    iget-object v0, v0, Lcom/mappn/gfan/common/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    :cond_4
    const-string v4, "pref.screen.size"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    const-string v4, "pref.os.version"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    const-string v4, "pref.lpns.binded.devid"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    const-string v4, "pref.charge.defaultChargeType"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    :cond_5
    iget-object v0, v0, Lcom/mappn/gfan/common/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto/16 :goto_0

    :cond_6
    const-string v4, "pref.upgrade.num"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    const-string v4, "pref.card.version"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    const-string v4, "pref.current.version"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    :cond_7
    iget-object v0, v0, Lcom/mappn/gfan/common/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto/16 :goto_0

    :cond_8
    const-string v4, "pref.product.update.timestamp"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    const-string v4, "pref.splash.time"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    const-string v4, "pref.splash.id"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    const-string v4, "pref.update.id"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    :cond_9
    iget-object v0, v0, Lcom/mappn/gfan/common/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-interface {v2, v1, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    goto/16 :goto_0

    :cond_a
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v2}, Lcom/mappn/gfan/SessionManager;->apply(Landroid/content/SharedPreferences$Editor;)V

    return-void
.end method

.method private writePreferenceSlowly()V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mCurrentUpdateThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mCurrentUpdateThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    new-instance v0, Lcom/mappn/gfan/SessionManager$1;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/SessionManager$1;-><init>(Lcom/mappn/gfan/SessionManager;)V

    iput-object v0, p0, Lcom/mappn/gfan/SessionManager;->mCurrentUpdateThread:Ljava/lang/Thread;

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mCurrentUpdateThread:Ljava/lang/Thread;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mCurrentUpdateThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    sput-object v0, Lcom/mappn/gfan/SessionManager;->mInstance:Lcom/mappn/gfan/SessionManager;

    return-void
.end method

.method public getNotificationRecommendAppsPreference()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v1, "pref.recommend.time"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isAutoDelete()Z
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v1, "delete_after_installation"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isNotificationRecommendApps()Z
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v1, "pref.recommend.app"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isNotificationUpdateApps()Z
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v1, "update_app_notification"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isStopDownloadImage()Z
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v1, "not_download_image"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public readPreference()Ljava/util/HashMap;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    const/4 v9, -0x1

    const-wide/16 v7, -0x1

    const/4 v6, 0x0

    const/4 v5, 0x0

    invoke-direct {p0}, Lcom/mappn/gfan/SessionManager;->isPreferenceNull()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, v6

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v2, "pref.uid"

    invoke-interface {v1, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    const-string v1, ""

    :goto_1
    const-string v2, "pref.uid"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pref.screen.size"

    iget-object v2, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v3, "pref.screen.size"

    const-string v4, "320#480"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pref.os.version"

    iget-object v2, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v3, "pref.os.version"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pref.isLogin"

    iget-object v2, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v3, "pref.isLogin"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v2, "pref.market.username"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2

    const-string v1, ""

    :goto_2
    const-string v2, "pref.market.username"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v2, "pref.market.password"

    invoke-interface {v1, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    const-string v1, ""

    :goto_3
    const-string v2, "pref.market.password"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "auto_clear_cache"

    iget-object v2, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v3, "auto_clear_cache"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pref.card.version"

    iget-object v2, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v3, "pref.card.version"

    invoke-interface {v2, v3, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pref.lpns.is.binded"

    iget-object v2, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v3, "pref.lpns.is.binded"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pref.lpns.binded.devid"

    iget-object v2, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v3, "pref.lpns.binded.devid"

    const-string v4, ""

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "no_app_filter"

    iget-object v2, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v3, "no_app_filter"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pref.upgrade.num"

    iget-object v2, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v3, "pref.upgrade.num"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pref.product.update.timestamp"

    iget-object v2, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v3, "pref.product.update.timestamp"

    invoke-interface {v2, v3, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pref.update.id"

    iget-object v2, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v3, "pref.update.id"

    invoke-interface {v2, v3, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pref.splash.id"

    iget-object v2, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v3, "pref.splash.id"

    invoke-interface {v2, v3, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pref.splash.time"

    iget-object v2, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v3, "pref.splash.time"

    const-wide/16 v4, 0x0

    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pref.is.first.login"

    iget-object v2, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v3, "pref.is.first.login"

    const/4 v4, 0x1

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pref.current.version"

    iget-object v2, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v3, "pref.current.version"

    invoke-interface {v2, v3, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pref.charge.defaultChargeType"

    iget-object v2, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v3, "pref.charge.defaultChargeType"

    invoke-interface {v2, v3, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    :cond_1
    invoke-static {v1}, Lcom/mappn/gfan/common/util/SecurityUtil;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_1

    :cond_2
    invoke-static {v1}, Lcom/mappn/gfan/common/util/SecurityUtil;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_2

    :cond_3
    invoke-static {v1}, Lcom/mappn/gfan/common/util/SecurityUtil;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_3
.end method

.method public setNotificationRecommendAppsPreference(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mPreference:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "pref.recommend.time"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .locals 2

    instance-of v0, p2, Lcom/mappn/gfan/common/util/Pair;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mUpdateQueue:Ljava/util/LinkedList;

    monitor-enter v0

    if-eqz p2, :cond_0

    :try_start_0
    iget-object v1, p0, Lcom/mappn/gfan/SessionManager;->mUpdateQueue:Ljava/util/LinkedList;

    check-cast p2, Lcom/mappn/gfan/common/util/Pair;

    invoke-virtual {v1, p2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0}, Lcom/mappn/gfan/SessionManager;->writePreferenceSlowly()V

    :cond_1
    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public writePreferenceQuickly()V
    .locals 2

    new-instance v0, Lcom/mappn/gfan/SessionManager$2;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/SessionManager$2;-><init>(Lcom/mappn/gfan/SessionManager;)V

    iput-object v0, p0, Lcom/mappn/gfan/SessionManager;->mCurrentUpdateThread:Ljava/lang/Thread;

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mCurrentUpdateThread:Ljava/lang/Thread;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager;->mCurrentUpdateThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method
