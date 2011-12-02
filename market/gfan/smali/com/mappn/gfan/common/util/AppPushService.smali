.class public Lcom/mappn/gfan/common/util/AppPushService;
.super Landroid/app/Service;

# interfaces
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;


# instance fields
.field private mSession:Lcom/mappn/gfan/Session;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method private isNotRecommended(Ljava/lang/String;)Z
    .locals 2

    const/4 v1, 0x0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppPushService;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getNotificationRecommendAppsPreference()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private showRecommendAppsNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    const v7, 0x7f090007

    const/4 v6, 0x1

    const/4 v5, 0x0

    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/util/AppPushService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    new-instance v1, Landroid/app/Notification;

    invoke-direct {v1}, Landroid/app/Notification;-><init>()V

    const v2, 0x7f020090

    iput v2, v1, Landroid/app/Notification;->icon:I

    new-array v2, v6, [Ljava/lang/Object;

    aput-object p1, v2, v5

    invoke-virtual {p0, v7, v2}, Lcom/mappn/gfan/common/util/AppPushService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v1, Landroid/app/Notification;->when:J

    new-instance v2, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/AppPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-class v4, Lcom/mappn/gfan/ui/PreloadActivity;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v3, "extra.key.pid"

    invoke-virtual {v2, v3, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v3, "extra.app.push"

    invoke-virtual {v2, v3, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/AppPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const/16 v4, 0x10

    invoke-static {v3, v5, v2, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/AppPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    new-array v4, v6, [Ljava/lang/Object;

    aput-object p1, v4, v5

    invoke-virtual {p0, v7, v4}, Lcom/mappn/gfan/common/util/AppPushService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4, p2, v2}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    iget v2, v1, Landroid/app/Notification;->flags:I

    or-int/lit8 v2, v2, 0x10

    iput v2, v1, Landroid/app/Notification;->flags:I

    const v2, 0x7f020007

    invoke-virtual {v0, v2, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 1

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/AppPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppPushService;->mSession:Lcom/mappn/gfan/Session;

    return-void
.end method

.method public onError(II)V
    .locals 0

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/AppPushService;->stopSelf()V

    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 2

    invoke-super {p0, p1, p2}, Landroid/app/Service;->onStart(Landroid/content/Intent;I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/AppPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mappn/gfan/common/MarketAPI;->getNotificationRecommend(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/AppPushService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/AlarmManageUtils;->notifyPushService(Landroid/content/Context;Z)V

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 5

    const/16 v0, 0x31

    if-ne p1, v0, :cond_0

    check-cast p2, Ljava/util/HashMap;

    const-string v0, "id"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "title"

    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "description"

    invoke-virtual {p2, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "update_time"

    invoke-virtual {p2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/mappn/gfan/common/util/AppPushService;->isNotRecommended(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-direct {p0, v1, v2, v0}, Lcom/mappn/gfan/common/util/AppPushService;->showRecommendAppsNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppPushService;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/Session;->setNotificationRecommendAppsPreference(Ljava/lang/String;)V

    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/AppPushService;->stopSelf()V

    return-void

    :cond_1
    const-string v0, "Recommended"

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->I(Ljava/lang/String;)V

    goto :goto_0
.end method
