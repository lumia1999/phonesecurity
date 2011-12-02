.class public Lcom/mappn/gfan/common/download/DownloadNotification;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;
    }
.end annotation


# static fields
.field static final LOGTAG:Ljava/lang/String; = "DownloadNotification"

.field public static final PUBLIC_WHERE_OTA_COMPLETED:Ljava/lang/String; = "status >= \'200\' AND source == \'3\' AND mimetype == \'application/vnd.android.package-archive\'"

.field static final WHERE_BAD_COMPLETED:Ljava/lang/String; = "status >= \'400\' AND (visibility == \'0\' OR visibility == \'1\') AND mimetype == \'application/vnd.android.package-archive\'"

.field static final WHERE_COMPLETED:Ljava/lang/String; = "status >= \'200\' AND visibility == \'1\'"

.field static final WHERE_OTA_COMPLETED:Ljava/lang/String; = "status >= \'200\' AND source == \'3\' AND visibility == \'0\' AND mimetype == \'application/vnd.android.package-archive\'"

.field static final WHERE_RUNNING:Ljava/lang/String; = "(status >= \'100\') AND (status <= \'199\') AND (visibility IS NULL OR visibility == \'0\' OR visibility == \'1\')"


# instance fields
.field mContext:Landroid/content/Context;

.field mNotificationManager:Landroid/app/NotificationManager;

.field mNotifications:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mNotifications:Ljava/util/HashMap;

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mNotificationManager:Landroid/app/NotificationManager;

    return-void
.end method

.method private getDownloadingText(JJ)Ljava/lang/String;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    const-wide/16 v0, 0x64

    mul-long/2addr v0, p3

    div-long/2addr v0, p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 v0, 0x25

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private handleErrorMessage(I)Ljava/lang/String;
    .locals 2

    const/16 v0, 0x190

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    const v1, 0x7f09013e

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/16 v0, 0x196

    if-ne v0, p1, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    const v1, 0x7f090135

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/16 v0, 0x19b

    if-eq v0, p1, :cond_2

    const/16 v0, 0x19c

    if-eq v0, p1, :cond_2

    const/16 v0, 0x1eb

    if-ne v0, p1, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    const v1, 0x7f09013b

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_3
    const/16 v0, 0x1e8

    if-eq v0, p1, :cond_4

    const/16 v0, 0x1ec

    if-ne v0, p1, :cond_5

    :cond_4
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    const v1, 0x7f09013c

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_5
    const/16 v0, 0x1ea

    if-ne v0, p1, :cond_6

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    const v1, 0x7f09013f

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_6
    const/16 v0, 0x1ed

    if-eq v0, p1, :cond_7

    const/16 v0, 0x1ee

    if-eq v0, p1, :cond_7

    const/16 v0, 0x1f0

    if-eq v0, p1, :cond_7

    const/16 v0, 0x1ef

    if-eq v0, p1, :cond_7

    const/16 v0, 0x1f1

    if-ne v0, p1, :cond_8

    :cond_7
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    const v1, 0x7f09013a

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_8
    const/16 v0, 0x1f3

    if-ne v0, p1, :cond_9

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    const v1, 0x7f090138

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_9
    const/16 v0, 0x1f2

    if-ne v0, p1, :cond_a

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    const v1, 0x7f090139

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_a
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    const v1, 0x7f090113

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0
.end method

.method private updateActiveNotification()V
    .locals 14

    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v13, 0x2

    const/4 v12, 0x1

    const/4 v11, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "_id"

    aput-object v3, v2, v11

    const-string v3, "title"

    aput-object v3, v2, v12

    const-string v3, "notificationpackage"

    aput-object v3, v2, v13

    const-string v3, "current_bytes"

    aput-object v3, v2, v8

    const-string v3, "total_bytes"

    aput-object v3, v2, v9

    const-string v3, "(status >= \'100\') AND (status <= \'199\') AND (visibility IS NULL OR visibility == \'0\' OR visibility == \'1\')"

    const/4 v4, 0x0

    const-string v5, "_id"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    if-nez v6, :cond_1

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mNotifications:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-interface {v6, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-interface {v6, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-interface {v6, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_8

    :cond_2
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f09003b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    :goto_1
    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mNotifications:Ljava/util/HashMap;

    invoke-virtual {v0, v7}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mNotifications:Ljava/util/HashMap;

    invoke-virtual {v0, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;

    int-to-long v2, v2

    int-to-long v4, v4

    invoke-virtual/range {v0 .. v5}, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->addItem(Ljava/lang/String;JJ)V

    :goto_2
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    :cond_3
    new-instance v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;

    invoke-direct {v0}, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;-><init>()V

    invoke-interface {v6, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mId:I

    iput-object v7, v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mPackageName:Ljava/lang/String;

    int-to-long v2, v2

    int-to-long v4, v4

    invoke-virtual/range {v0 .. v5}, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->addItem(Ljava/lang/String;JJ)V

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mNotifications:Ljava/util/HashMap;

    invoke-virtual {v1, v7, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_4
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mNotifications:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;

    new-instance v2, Landroid/app/Notification;

    invoke-direct {v2}, Landroid/app/Notification;-><init>()V

    iput v11, v2, Landroid/app/Notification;->defaults:I

    const v3, 0x1080081

    iput v3, v2, Landroid/app/Notification;->icon:I

    iget v3, v2, Landroid/app/Notification;->flags:I

    or-int/lit8 v3, v3, 0x2

    iput v3, v2, Landroid/app/Notification;->flags:I

    new-instance v3, Landroid/widget/RemoteViews;

    const-string v4, "com.mappn.gfan"

    const v5, 0x7f030057

    invoke-direct {v3, v4, v5}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTitles:[Ljava/lang/String;

    aget-object v5, v5, v11

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTitleCount:I

    if-le v5, v12, :cond_5

    iget-object v5, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    const v6, 0x7f09003c

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTitles:[Ljava/lang/String;

    aget-object v5, v5, v12

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTitleCount:I

    iput v5, v2, Landroid/app/Notification;->number:I

    iget v5, v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTitleCount:I

    if-le v5, v13, :cond_5

    iget-object v5, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    const v6, 0x7f09003d

    new-array v7, v12, [Ljava/lang/Object;

    iget v8, v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTitleCount:I

    sub-int/2addr v8, v13

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v11

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_5
    const v5, 0x7f0c000b

    invoke-virtual {v3, v5, v4}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const v4, 0x7f0c0097

    iget-wide v5, v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTotalBytes:J

    long-to-int v5, v5

    iget-wide v6, v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mCurrentBytes:J

    long-to-int v6, v6

    iget-wide v7, v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTotalBytes:J

    const-wide/16 v9, -0x1

    cmp-long v7, v7, v9

    if-nez v7, :cond_6

    move v7, v12

    :goto_4
    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    const v4, 0x7f0c0095

    iget-wide v5, v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTotalBytes:J

    iget-wide v7, v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mCurrentBytes:J

    invoke-direct {p0, v5, v6, v7, v8}, Lcom/mappn/gfan/common/download/DownloadNotification;->getDownloadingText(JJ)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const v4, 0x7f0c0094

    const v5, 0x1080081

    invoke-virtual {v3, v4, v5}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    iput-object v3, v2, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    new-instance v3, Landroid/content/Intent;

    const-string v4, "gfan.intent.action.DOWNLOAD_LIST"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v4, "com.mappn.gfan"

    const-class v5, Lcom/mappn/gfan/common/download/DownloadReceiver;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mId:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string v4, "multiple"

    iget v5, v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTitleCount:I

    if-le v5, v12, :cond_7

    move v5, v12

    :goto_5
    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v4, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-static {v4, v11, v3, v11}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    iput-object v3, v2, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    iget-object v3, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mNotificationManager:Landroid/app/NotificationManager;

    iget v0, v0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mId:I

    invoke-virtual {v3, v0, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto/16 :goto_3

    :cond_6
    move v7, v11

    goto :goto_4

    :cond_7
    move v5, v11

    goto :goto_5

    :cond_8
    move-object v1, v0

    goto/16 :goto_1
.end method

.method private updateCompletedNotification()V
    .locals 14

    const/4 v12, 0x4

    const/4 v11, 0x3

    const/4 v10, 0x1

    const/4 v9, 0x2

    const/4 v8, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "_id"

    aput-object v3, v2, v8

    const-string v3, "title"

    aput-object v3, v2, v10

    const-string v3, "status"

    aput-object v3, v2, v9

    const-string v3, "lastmod"

    aput-object v3, v2, v11

    const-string v3, "destination"

    aput-object v3, v2, v12

    const-string v3, "status >= \'200\' AND visibility == \'1\'"

    const/4 v4, 0x0

    const-string v5, "_id"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_1
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_5

    new-instance v1, Landroid/app/Notification;

    invoke-direct {v1}, Landroid/app/Notification;-><init>()V

    iput v8, v1, Landroid/app/Notification;->defaults:I

    const v2, 0x1080082

    iput v2, v1, Landroid/app/Notification;->icon:I

    invoke-interface {v0, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_2

    :cond_1
    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f09003b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-interface {v0, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-static {v4}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusError(I)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v0, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-direct {p0, v4}, Lcom/mappn/gfan/common/download/DownloadNotification;->handleErrorMessage(I)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Landroid/content/Intent;

    const-string v6, "gfan.intent.action.DOWNLOAD_HIDE"

    invoke-direct {v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v6, "status"

    const/16 v7, 0x1eb

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-object v13, v5

    move-object v5, v4

    move-object v4, v13

    :goto_2
    const-string v6, "com.mappn.gfan"

    const-class v7, Lcom/mappn/gfan/common/download/DownloadReceiver;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v4, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object v6, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    iget-object v7, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-static {v7, v8, v4, v8}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    invoke-virtual {v1, v6, v2, v5, v4}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    new-instance v2, Landroid/content/Intent;

    const-string v4, "gfan.intent.action.DOWNLOAD_HIDE"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v4, "com.mappn.gfan"

    const-class v5, Lcom/mappn/gfan/common/download/DownloadReceiver;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object v3, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-static {v3, v8, v2, v8}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    iput-object v2, v1, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    invoke-interface {v0, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v1, Landroid/app/Notification;->when:J

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-virtual {v2, v3, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    goto/16 :goto_1

    :cond_3
    iget-object v4, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f09003f

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    if-eqz v5, :cond_4

    new-instance v5, Landroid/content/Intent;

    const-string v6, "gfan.intent.action.DOWNLOAD_LIST"

    invoke-direct {v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    :goto_3
    const-string v6, "status"

    const/16 v7, 0xc8

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-object v13, v5

    move-object v5, v4

    move-object v4, v13

    goto :goto_2

    :cond_4
    new-instance v5, Landroid/content/Intent;

    const-string v6, "gfan.intent.action.DOWNLOAD_OPEN"

    invoke-direct {v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :cond_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0
.end method

.method private updateOtaNotification()V
    .locals 9

    const/4 v4, 0x0

    const/4 v8, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "_id"

    aput-object v3, v2, v7

    const-string v3, "_data"

    aput-object v3, v2, v6

    const-string v3, "status >= \'200\' AND source == \'3\' AND visibility == \'0\' AND mimetype == \'application/vnd.android.package-archive\'"

    const-string v5, "_id"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    :try_start_0
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v5, "aMarket.apk"

    invoke-direct {v2, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    const-string v5, "aMarket.apk"

    invoke-static {v3, v1, v5}, Lcom/mappn/gfan/common/util/Utils;->copyMarketFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/Utils;->installApk(Landroid/content/Context;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "visibility"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "_id = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v1, v5, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_2
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "ota exception"

    invoke-static {v2, v1}, Lcom/mappn/gfan/common/util/Utils;->E(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_0
.end method


# virtual methods
.method public cancelNotification(J)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mNotificationManager:Landroid/app/NotificationManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mNotificationManager:Landroid/app/NotificationManager;

    long-to-int v1, p1

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    :cond_0
    return-void
.end method

.method public clearAllNotification()V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mNotificationManager:Landroid/app/NotificationManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V

    :cond_0
    return-void
.end method

.method public clearBadNotification()V
    .locals 6

    const/4 v2, 0x0

    const-string v0, "start clear bad notifications"

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    const-string v3, "status >= \'400\' AND (visibility == \'0\' OR visibility == \'1\') AND mimetype == \'application/vnd.android.package-archive\'"

    const-string v5, "_id"

    move-object v4, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    const-string v1, "_id"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_1
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v3

    if-nez v3, :cond_1

    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    const-string v4, "visibility"

    const/4 v5, 0x2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v4, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v4, v5, v3, v2, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    iget-object v3, p0, Lcom/mappn/gfan/common/download/DownloadNotification;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/app/NotificationManager;->cancel(I)V

    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_1

    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_0
.end method

.method public updateNotification()V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/common/download/DownloadNotification;->updateActiveNotification()V

    invoke-direct {p0}, Lcom/mappn/gfan/common/download/DownloadNotification;->updateCompletedNotification()V

    invoke-direct {p0}, Lcom/mappn/gfan/common/download/DownloadNotification;->updateOtaNotification()V

    return-void
.end method
