.class public final Lcom/yingyonghui/market/downloader/e;
.super Ljava/lang/Object;
.source "DownloadNotification.java"


# instance fields
.field public final a:Landroid/app/NotificationManager;

.field private final b:Landroid/content/Context;

.field private c:Ljava/util/HashMap;

.field private d:Ljava/util/HashMap;

.field private e:Lcom/yingyonghui/market/log/m;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    iput-object p1, p0, Lcom/yingyonghui/market/downloader/e;->b:Landroid/content/Context;

    .line 86
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/e;->b:Landroid/content/Context;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/yingyonghui/market/downloader/e;->a:Landroid/app/NotificationManager;

    .line 88
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/yingyonghui/market/downloader/e;->c:Ljava/util/HashMap;

    .line 89
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/yingyonghui/market/downloader/e;->d:Ljava/util/HashMap;

    .line 90
    new-instance v0, Lcom/yingyonghui/market/log/m;

    const-string v1, "Notification"

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/yingyonghui/market/downloader/e;->e:Lcom/yingyonghui/market/log/m;

    .line 91
    return-void
.end method

.method private b()V
    .locals 7

    .prologue
    const/4 v4, 0x0

    const/4 v6, 0x0

    .line 243
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/e;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "_id"

    aput-object v3, v2, v6

    const-string v3, "status >= \'200\' AND visibility == \'1\'"

    const-string v5, "_id"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 259
    if-nez v0, :cond_0

    .line 325
    :goto_0
    return-void

    .line 264
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_1
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_1

    .line 317
    iget-object v1, p0, Lcom/yingyonghui/market/downloader/e;->d:Ljava/util/HashMap;

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 320
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 321
    const-string v3, "visibility"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 322
    iget-object v3, p0, Lcom/yingyonghui/market/downloader/e;->b:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v3, v1, v2, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 276
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_1

    .line 324
    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_0
.end method


# virtual methods
.method public final a()V
    .locals 15

    .prologue
    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v14, 0x1

    const/4 v13, -0x1

    const/4 v12, 0x0

    .line 109
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/e;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    const/4 v2, 0x7

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "_id"

    aput-object v3, v2, v12

    const-string v3, "title"

    aput-object v3, v2, v14

    const-string v3, "description"

    aput-object v3, v2, v7

    const-string v3, "notificationpackage"

    aput-object v3, v2, v8

    const/4 v3, 0x4

    const-string v4, "notificationextras"

    aput-object v4, v2, v3

    const/4 v3, 0x5

    const-string v4, "current_bytes"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "total_bytes"

    aput-object v4, v2, v3

    const-string v3, "(status >= \'100\') AND (status <= \'199\') AND (visibility IS NULL OR visibility == \'0\' OR visibility == \'1\')"

    const/4 v4, 0x0

    const-string v5, "_id"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_9

    iget-object v1, p0, Lcom/yingyonghui/market/downloader/e;->c:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_5

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x6

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    const/4 v3, 0x5

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_1

    :cond_0
    iget-object v4, p0, Lcom/yingyonghui/market/downloader/e;->b:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f09010b

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    :cond_1
    new-instance v5, Lcom/yingyonghui/market/downloader/m;

    invoke-direct {v5}, Lcom/yingyonghui/market/downloader/m;-><init>()V

    invoke-interface {v0, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    iput v6, v5, Lcom/yingyonghui/market/downloader/m;->a:I

    iput-object v1, v5, Lcom/yingyonghui/market/downloader/m;->e:Ljava/lang/String;

    const/4 v1, 0x4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v5, Lcom/yingyonghui/market/downloader/m;->f:Ljava/lang/String;

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v5, Lcom/yingyonghui/market/downloader/m;->g:Ljava/lang/String;

    iget v1, v5, Lcom/yingyonghui/market/downloader/m;->b:I

    add-int/2addr v1, v3

    iput v1, v5, Lcom/yingyonghui/market/downloader/m;->b:I

    if-lez v2, :cond_2

    iget v1, v5, Lcom/yingyonghui/market/downloader/m;->c:I

    if-ne v1, v13, :cond_4

    :cond_2
    iput v13, v5, Lcom/yingyonghui/market/downloader/m;->c:I

    :goto_1
    iget v1, v5, Lcom/yingyonghui/market/downloader/m;->d:I

    if-ge v1, v7, :cond_3

    iget-object v1, v5, Lcom/yingyonghui/market/downloader/m;->h:[Ljava/lang/String;

    iget v2, v5, Lcom/yingyonghui/market/downloader/m;->d:I

    aput-object v4, v1, v2

    :cond_3
    iget v1, v5, Lcom/yingyonghui/market/downloader/m;->d:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v5, Lcom/yingyonghui/market/downloader/m;->d:I

    iget-object v1, p0, Lcom/yingyonghui/market/downloader/e;->c:Ljava/util/HashMap;

    iget-object v2, v5, Lcom/yingyonghui/market/downloader/m;->f:Ljava/lang/String;

    invoke-virtual {v1, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    :cond_4
    iget v1, v5, Lcom/yingyonghui/market/downloader/m;->c:I

    add-int/2addr v1, v2

    iput v1, v5, Lcom/yingyonghui/market/downloader/m;->c:I

    goto :goto_1

    :cond_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    iget-object v0, p0, Lcom/yingyonghui/market/downloader/e;->c:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/downloader/m;

    iget-object v1, p0, Lcom/yingyonghui/market/downloader/e;->d:Ljava/util/HashMap;

    iget v3, v0, Lcom/yingyonghui/market/downloader/m;->a:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/yingyonghui/market/downloader/e;->d:Ljava/util/HashMap;

    iget v3, v0, Lcom/yingyonghui/market/downloader/m;->a:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Notification;

    :goto_3
    const v3, 0x1080081

    iput v3, v1, Landroid/app/Notification;->icon:I

    iget v3, v1, Landroid/app/Notification;->flags:I

    or-int/lit8 v3, v3, 0x2

    iput v3, v1, Landroid/app/Notification;->flags:I

    new-instance v3, Landroid/widget/RemoteViews;

    sget-object v4, Lcom/yingyonghui/market/bi;->a:Ljava/lang/String;

    const v5, 0x7f030049

    invoke-direct {v3, v4, v5}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, v0, Lcom/yingyonghui/market/downloader/m;->h:[Ljava/lang/String;

    aget-object v5, v5, v12

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const v5, 0x7f0b004c

    iget-object v6, p0, Lcom/yingyonghui/market/downloader/e;->b:Landroid/content/Context;

    const v7, 0x7f09010c

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const v5, 0x7f0b006e

    invoke-virtual {v3, v5, v4}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const v5, 0x7f0b00bf

    iget v6, v0, Lcom/yingyonghui/market/downloader/m;->c:I

    iget v7, v0, Lcom/yingyonghui/market/downloader/m;->b:I

    iget v8, v0, Lcom/yingyonghui/market/downloader/m;->c:I

    if-ne v8, v13, :cond_7

    move v8, v14

    :goto_4
    invoke-virtual {v3, v5, v6, v7, v8}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    const v5, 0x7f0b0103

    iget v6, v0, Lcom/yingyonghui/market/downloader/m;->c:I

    int-to-long v6, v6

    iget v8, v0, Lcom/yingyonghui/market/downloader/m;->b:I

    int-to-long v8, v8

    const-wide/16 v10, 0x0

    cmp-long v10, v6, v10

    if-gtz v10, :cond_8

    const-string v6, ""

    :goto_5
    invoke-virtual {v3, v5, v6}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const v5, 0x7f0b0102

    const v6, 0x1080081

    invoke-virtual {v3, v5, v6}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    iput-object v3, v1, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    sget-object v5, Lcom/yingyonghui/market/bi;->a:Ljava/lang/String;

    const-class v6, Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v5, "title"

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v4, "size"

    iget v5, v0, Lcom/yingyonghui/market/downloader/m;->c:I

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v4, "pkgName"

    iget-object v5, v0, Lcom/yingyonghui/market/downloader/m;->f:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v4, "from"

    iget-object v5, p0, Lcom/yingyonghui/market/downloader/e;->e:Lcom/yingyonghui/market/log/m;

    const-string v6, "index"

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/yingyonghui/market/log/m;

    move-result-object v5

    invoke-virtual {v5}, Lcom/yingyonghui/market/log/m;->a()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "market://package/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Lcom/yingyonghui/market/downloader/m;->f:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const/high16 v4, 0x1000

    invoke-virtual {v3, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object v4, p0, Lcom/yingyonghui/market/downloader/e;->b:Landroid/content/Context;

    const/high16 v5, 0x800

    invoke-static {v4, v12, v3, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    iput-object v3, v1, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    iget-object v3, p0, Lcom/yingyonghui/market/downloader/e;->a:Landroid/app/NotificationManager;

    iget v0, v0, Lcom/yingyonghui/market/downloader/m;->a:I

    invoke-virtual {v3, v0, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto/16 :goto_2

    :cond_6
    new-instance v1, Landroid/app/Notification;

    invoke-direct {v1}, Landroid/app/Notification;-><init>()V

    iget-object v3, p0, Lcom/yingyonghui/market/downloader/e;->d:Ljava/util/HashMap;

    iget v4, v0, Lcom/yingyonghui/market/downloader/m;->a:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_3

    :cond_7
    move v8, v12

    goto/16 :goto_4

    :cond_8
    const-wide/16 v10, 0x64

    mul-long/2addr v8, v10

    div-long v6, v8, v6

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "%"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_5

    .line 110
    :cond_9
    invoke-direct {p0}, Lcom/yingyonghui/market/downloader/e;->b()V

    .line 111
    return-void
.end method
