.class public Lcom/yingyonghui/market/a/e;
.super Ljava/lang/Object;
.source "AsyncTaskNotifier.java"


# static fields
.field private static c:Lcom/yingyonghui/market/a/e;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Landroid/app/NotificationManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const/4 v0, 0x0

    sput-object v0, Lcom/yingyonghui/market/a/e;->c:Lcom/yingyonghui/market/a/e;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/yingyonghui/market/a/e;->a:Landroid/content/Context;

    .line 33
    iget-object v0, p0, Lcom/yingyonghui/market/a/e;->a:Landroid/content/Context;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/yingyonghui/market/a/e;->b:Landroid/app/NotificationManager;

    .line 35
    return-void
.end method

.method public static a(Landroid/content/Context;)Lcom/yingyonghui/market/a/e;
    .locals 2
    .parameter

    .prologue
    .line 23
    const-class v0, Lcom/yingyonghui/market/a/e;

    monitor-enter v0

    .line 24
    :try_start_0
    sget-object v1, Lcom/yingyonghui/market/a/e;->c:Lcom/yingyonghui/market/a/e;

    if-nez v1, :cond_0

    .line 25
    new-instance v1, Lcom/yingyonghui/market/a/e;

    invoke-direct {v1, p0}, Lcom/yingyonghui/market/a/e;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/yingyonghui/market/a/e;->c:Lcom/yingyonghui/market/a/e;

    .line 27
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    sget-object v0, Lcom/yingyonghui/market/a/e;->c:Lcom/yingyonghui/market/a/e;

    return-object v0

    .line 27
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method


# virtual methods
.method public final declared-synchronized a()V
    .locals 2

    .prologue
    .line 74
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/yingyonghui/market/a/e;->b:Landroid/app/NotificationManager;

    const v1, 0x989680

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    :goto_0
    monitor-exit p0

    return-void

    .line 75
    :catch_0
    move-exception v0

    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 74
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized a(I)V
    .locals 7
    .parameter

    .prologue
    .line 39
    monitor-enter p0

    if-gtz p1, :cond_0

    .line 40
    :try_start_0
    iget-object v0, p0, Lcom/yingyonghui/market/a/e;->b:Landroid/app/NotificationManager;

    const v1, 0x989680

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    :goto_0
    monitor-exit p0

    return-void

    .line 44
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/yingyonghui/market/a/e;->a:Landroid/content/Context;

    const v1, 0x7f0900f7

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 45
    iget-object v1, p0, Lcom/yingyonghui/market/a/e;->a:Landroid/content/Context;

    const v2, 0x7f09005a

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 47
    iget-object v2, p0, Lcom/yingyonghui/market/a/e;->a:Landroid/content/Context;

    const v3, 0x7f090001

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 48
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v2, v3, v4

    const/4 v2, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 50
    new-instance v2, Landroid/app/Notification;

    const v3, 0x7f020023

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {v2, v3, v1, v4, v5}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 52
    iput p1, v2, Landroid/app/Notification;->number:I

    .line 55
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 56
    iget-object v4, p0, Lcom/yingyonghui/market/a/e;->a:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-class v5, Lcom/yingyonghui/market/ActivityMain;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 58
    const-string v4, "tabId"

    const/4 v5, 0x4

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 60
    iget-object v4, p0, Lcom/yingyonghui/market/a/e;->a:Landroid/content/Context;

    const/4 v5, 0x0

    const/high16 v6, 0x800

    invoke-static {v4, v5, v3, v6}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 62
    iput-object v3, v2, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    .line 64
    iget-object v4, p0, Lcom/yingyonghui/market/a/e;->a:Landroid/content/Context;

    invoke-virtual {v2, v4, v0, v1, v3}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 66
    iget-object v0, p0, Lcom/yingyonghui/market/a/e;->b:Landroid/app/NotificationManager;

    const v1, 0x989680

    invoke-virtual {v0, v1, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 67
    :catch_0
    move-exception v0

    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 39
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized b()V
    .locals 9

    .prologue
    .line 90
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/yingyonghui/market/a/e;->a:Landroid/content/Context;

    const-string v1, "showed_count"

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 92
    const/4 v0, 0x1

    if-ne v1, v0, :cond_0

    .line 93
    iget-object v0, p0, Lcom/yingyonghui/market/a/e;->a:Landroid/content/Context;

    const-string v2, "notification"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 95
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 96
    iget-object v3, p0, Lcom/yingyonghui/market/a/e;->a:Landroid/content/Context;

    const-class v4, Lcom/feedback/ui/SendFeedback;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 97
    const/high16 v3, 0x1000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 98
    iget-object v3, p0, Lcom/yingyonghui/market/a/e;->a:Landroid/content/Context;

    const/4 v4, 0x0

    const/high16 v5, 0x800

    invoke-static {v3, v4, v2, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 100
    iget-object v3, p0, Lcom/yingyonghui/market/a/e;->a:Landroid/content/Context;

    const v4, 0x7f09016b

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 101
    iget-object v4, p0, Lcom/yingyonghui/market/a/e;->a:Landroid/content/Context;

    const v5, 0x7f09016c

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 103
    new-instance v5, Landroid/app/Notification;

    const v6, 0x7f0200c0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-direct {v5, v6, v4, v7, v8}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 104
    const/16 v6, 0x10

    iput v6, v5, Landroid/app/Notification;->flags:I

    .line 105
    iput-object v2, v5, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    .line 106
    iget-object v6, p0, Lcom/yingyonghui/market/a/e;->a:Landroid/content/Context;

    invoke-virtual {v5, v6, v3, v4, v2}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 108
    const v2, 0x989681

    invoke-virtual {v0, v2, v5}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 111
    :cond_0
    const/4 v0, 0x2

    if-ge v1, v0, :cond_1

    .line 112
    iget-object v0, p0, Lcom/yingyonghui/market/a/e;->a:Landroid/content/Context;

    const-string v2, "showed_count"

    add-int/lit8 v1, v1, 0x1

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    .line 114
    :catch_0
    move-exception v0

    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 90
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
