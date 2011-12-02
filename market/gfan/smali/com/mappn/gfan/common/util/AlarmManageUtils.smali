.class public Lcom/mappn/gfan/common/util/AlarmManageUtils;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static calculateAlarmTime(Z)J
    .locals 11

    const/4 v10, 0x1

    const/4 v9, 0x5

    const/4 v8, 0x0

    const/16 v7, 0xb

    const/16 v6, 0xc

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {v0, v9}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    if-ge v1, v6, :cond_0

    invoke-virtual {v0, v7, v6}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0, v6, v8}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    const v3, 0x36ee80

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    :goto_0
    return-wide v0

    :cond_0
    if-nez p0, :cond_1

    const/16 v5, 0xe

    if-ge v1, v5, :cond_1

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    const v1, 0xea60

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    int-to-long v0, v0

    add-long/2addr v0, v3

    goto :goto_0

    :cond_1
    const/16 v5, 0x12

    if-ge v1, v5, :cond_2

    const/16 v1, 0x12

    invoke-virtual {v0, v7, v1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0, v6, v8}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    const v3, 0x36ee80

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    goto :goto_0

    :cond_2
    if-nez p0, :cond_3

    const/16 v5, 0x15

    if-ge v1, v5, :cond_3

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    const v1, 0xea60

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    int-to-long v0, v0

    add-long/2addr v0, v3

    goto :goto_0

    :cond_3
    invoke-virtual {v0, v9}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v1

    if-ne v2, v1, :cond_5

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-ne v7, v1, :cond_4

    invoke-virtual {v0, v10}, Ljava/util/Calendar;->get(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v10, v1}, Ljava/util/Calendar;->set(II)V

    const/4 v1, 0x2

    invoke-virtual {v0, v1, v8}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0, v9, v10}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0, v7, v6}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0, v6, v8}, Ljava/util/Calendar;->set(II)V

    :goto_1
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    const v3, 0x36ee80

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    goto :goto_0

    :cond_4
    const/4 v2, 0x2

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0, v9, v10}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0, v7, v6}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0, v6, v8}, Ljava/util/Calendar;->set(II)V

    goto :goto_1

    :cond_5
    add-int/lit8 v1, v2, 0x1

    invoke-virtual {v0, v9, v1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0, v7, v6}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0, v6, v8}, Ljava/util/Calendar;->set(II)V

    goto :goto_1
.end method

.method public static cancelPushService(Landroid/content/Context;)V
    .locals 4

    const/4 v3, 0x0

    invoke-static {p0}, Lcom/mappn/gfan/common/util/AlarmManageUtils;->getAlarmManager(Landroid/content/Context;)Landroid/app/AlarmManager;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/mappn/gfan/common/util/AppPushService;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-static {p0, v3, v1, v3}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    return-void
.end method

.method private static getAlarmManager(Landroid/content/Context;)Landroid/app/AlarmManager;
    .locals 1

    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/AlarmManager;

    return-object p0
.end method

.method public static notifyPushService(Landroid/content/Context;Z)V
    .locals 7

    const/4 v6, 0x0

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isNotificationRecommendApps()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mappn/gfan/common/util/AppPushService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-static {p0, v6, v0, v6}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-static {p0}, Lcom/mappn/gfan/common/util/AlarmManageUtils;->getAlarmManager(Landroid/content/Context;)Landroid/app/AlarmManager;

    move-result-object v1

    invoke-static {p1}, Lcom/mappn/gfan/common/util/AlarmManageUtils;->calculateAlarmTime(Z)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-ltz v4, :cond_0

    invoke-virtual {v1, v6, v2, v3, v0}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    goto :goto_0
.end method
