.class final Lcom/yingyonghui/market/downloader/o;
.super Ljava/lang/Thread;
.source "DownloadService.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/downloader/DownloadService;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/downloader/DownloadService;)V
    .locals 1
    .parameter

    .prologue
    .line 186
    iput-object p1, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    .line 187
    const-string v0, "Download Service"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 188
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 15

    .prologue
    .line 192
    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 194
    const/4 v0, 0x0

    .line 197
    const-wide v1, 0x7fffffffffffffffL

    .line 199
    :goto_0
    iget-object v3, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    monitor-enter v3

    .line 200
    :try_start_0
    iget-object v4, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v4}, Lcom/yingyonghui/market/downloader/DownloadService;->b(Lcom/yingyonghui/market/downloader/DownloadService;)Lcom/yingyonghui/market/downloader/o;

    move-result-object v4

    if-eq v4, p0, :cond_0

    .line 201
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "multiple UpdateThreads in DownloadService"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 229
    :catchall_0
    move-exception v0

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 203
    :cond_0
    :try_start_1
    iget-object v4, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v4}, Lcom/yingyonghui/market/downloader/DownloadService;->c(Lcom/yingyonghui/market/downloader/DownloadService;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 204
    iget-object v4, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v4}, Lcom/yingyonghui/market/downloader/DownloadService;->d(Lcom/yingyonghui/market/downloader/DownloadService;)Lcom/yingyonghui/market/downloader/o;

    .line 205
    if-nez v0, :cond_1

    .line 206
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-virtual {v0}, Lcom/yingyonghui/market/downloader/DownloadService;->stopSelf()V

    .line 208
    :cond_1
    const-wide v4, 0x7fffffffffffffffL

    cmp-long v0, v1, v4

    if-eqz v0, :cond_2

    .line 209
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    const-string v4, "alarm"

    invoke-virtual {v0, v4}, Lcom/yingyonghui/market/downloader/DownloadService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 210
    if-nez v0, :cond_4

    .line 211
    const-string v0, "DownloadManager"

    const-string v1, "couldn\'t get alarm manager"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v0}, Lcom/yingyonghui/market/downloader/DownloadService;->e(Lcom/yingyonghui/market/downloader/DownloadService;)Landroid/database/CharArrayBuffer;

    .line 225
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v0}, Lcom/yingyonghui/market/downloader/DownloadService;->f(Lcom/yingyonghui/market/downloader/DownloadService;)Landroid/database/CharArrayBuffer;

    .line 226
    monitor-exit v3

    .line 238
    :cond_3
    return-void

    .line 216
    :cond_4
    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.intent.action.DOWNLOAD_WAKEUP"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 217
    const-class v5, Lcom/yingyonghui/market/downloader/DownloadReceiver;

    invoke-virtual {v5}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v5

    const-class v6, Lcom/yingyonghui/market/downloader/DownloadReceiver;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 219
    const/4 v5, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    add-long/2addr v1, v6

    iget-object v6, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    const/4 v7, 0x0

    const/high16 v8, 0x4000

    invoke-static {v6, v7, v4, v8}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    invoke-virtual {v0, v5, v1, v2, v4}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    goto :goto_1

    .line 228
    :cond_5
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v0}, Lcom/yingyonghui/market/downloader/DownloadService;->g(Lcom/yingyonghui/market/downloader/DownloadService;)Z

    .line 229
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 230
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v0}, Lcom/yingyonghui/market/util/g;->a(Landroid/content/Context;)Z

    move-result v7

    .line 231
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v0}, Lcom/yingyonghui/market/util/g;->b(Landroid/content/Context;)Z

    move-result v8

    .line 232
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    .line 234
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-virtual {v0}, Lcom/yingyonghui/market/downloader/DownloadService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "_id"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 237
    if-eqz v1, :cond_3

    .line 241
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 243
    const/4 v0, 0x0

    .line 246
    const/4 v2, 0x0

    .line 247
    const-wide v3, 0x7fffffffffffffffL

    .line 249
    invoke-interface {v1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v5

    .line 251
    const-string v6, "_id"

    invoke-interface {v1, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v11

    move-wide v12, v3

    move v14, v2

    move v3, v5

    move v2, v0

    .line 269
    :goto_2
    if-eqz v3, :cond_6

    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v0}, Lcom/yingyonghui/market/downloader/DownloadService;->h(Lcom/yingyonghui/market/downloader/DownloadService;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v2, v0, :cond_14

    .line 270
    :cond_6
    if-eqz v3, :cond_7

    .line 281
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v0, v2}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Lcom/yingyonghui/market/downloader/DownloadService;I)V

    goto :goto_2

    .line 283
    :cond_7
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 285
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v0}, Lcom/yingyonghui/market/downloader/DownloadService;->h(Lcom/yingyonghui/market/downloader/DownloadService;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne v2, v0, :cond_b

    .line 286
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    move v3, v7

    move v4, v8

    move-wide v5, v9

    invoke-static/range {v0 .. v6}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Lcom/yingyonghui/market/downloader/DownloadService;Landroid/database/Cursor;IZZJ)V

    .line 296
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v0, v2}, Lcom/yingyonghui/market/downloader/DownloadService;->b(Lcom/yingyonghui/market/downloader/DownloadService;I)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 297
    const/4 v0, 0x1

    .line 299
    :goto_3
    iget-object v3, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v3, v2, v9, v10}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Lcom/yingyonghui/market/downloader/DownloadService;IJ)J

    move-result-wide v3

    .line 300
    const-wide/16 v5, 0x0

    cmp-long v5, v3, v5

    if-nez v5, :cond_9

    .line 301
    const/4 v0, 0x1

    move-wide v3, v12

    .line 305
    :cond_8
    :goto_4
    add-int/lit8 v2, v2, 0x1

    .line 306
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 307
    invoke-interface {v1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v5

    move-wide v12, v3

    move v14, v0

    move v3, v5

    .line 308
    goto :goto_2

    .line 302
    :cond_9
    const-wide/16 v5, 0x0

    cmp-long v5, v3, v5

    if-lez v5, :cond_a

    cmp-long v5, v3, v12

    if-ltz v5, :cond_8

    :cond_a
    move-wide v3, v12

    goto :goto_4

    .line 309
    :cond_b
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v0}, Lcom/yingyonghui/market/downloader/DownloadService;->h(Lcom/yingyonghui/market/downloader/DownloadService;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/downloader/h;

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->a:I

    .line 311
    if-ge v0, v4, :cond_c

    .line 320
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v0, v2}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Lcom/yingyonghui/market/downloader/DownloadService;I)V

    goto :goto_2

    .line 321
    :cond_c
    if-ne v0, v4, :cond_10

    .line 323
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    move v3, v7

    move v4, v8

    move-wide v5, v9

    invoke-static/range {v0 .. v6}, Lcom/yingyonghui/market/downloader/DownloadService;->b(Lcom/yingyonghui/market/downloader/DownloadService;Landroid/database/Cursor;IZZJ)V

    .line 332
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v0, v2}, Lcom/yingyonghui/market/downloader/DownloadService;->b(Lcom/yingyonghui/market/downloader/DownloadService;I)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 333
    const/4 v0, 0x1

    .line 335
    :goto_5
    iget-object v3, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v3, v2, v9, v10}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Lcom/yingyonghui/market/downloader/DownloadService;IJ)J

    move-result-wide v3

    .line 336
    const-wide/16 v5, 0x0

    cmp-long v5, v3, v5

    if-nez v5, :cond_e

    .line 337
    const/4 v0, 0x1

    move-wide v3, v12

    .line 341
    :cond_d
    :goto_6
    add-int/lit8 v2, v2, 0x1

    .line 342
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 343
    invoke-interface {v1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v5

    move-wide v12, v3

    move v14, v0

    move v3, v5

    .line 344
    goto/16 :goto_2

    .line 338
    :cond_e
    const-wide/16 v5, 0x0

    cmp-long v5, v3, v5

    if-lez v5, :cond_f

    cmp-long v5, v3, v12

    if-ltz v5, :cond_d

    :cond_f
    move-wide v3, v12

    goto :goto_6

    .line 350
    :cond_10
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    move v3, v7

    move v4, v8

    move-wide v5, v9

    invoke-static/range {v0 .. v6}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Lcom/yingyonghui/market/downloader/DownloadService;Landroid/database/Cursor;IZZJ)V

    .line 358
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v0, v2}, Lcom/yingyonghui/market/downloader/DownloadService;->b(Lcom/yingyonghui/market/downloader/DownloadService;I)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 359
    const/4 v0, 0x1

    .line 361
    :goto_7
    iget-object v3, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v3, v2, v9, v10}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Lcom/yingyonghui/market/downloader/DownloadService;IJ)J

    move-result-wide v3

    .line 362
    const-wide/16 v5, 0x0

    cmp-long v5, v3, v5

    if-nez v5, :cond_12

    .line 363
    const/4 v0, 0x1

    move-wide v3, v12

    .line 367
    :cond_11
    :goto_8
    add-int/lit8 v2, v2, 0x1

    .line 368
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 369
    invoke-interface {v1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v5

    move-wide v12, v3

    move v14, v0

    move v3, v5

    .line 372
    goto/16 :goto_2

    .line 364
    :cond_12
    const-wide/16 v5, 0x0

    cmp-long v5, v3, v5

    if-lez v5, :cond_13

    cmp-long v5, v3, v12

    if-ltz v5, :cond_11

    :cond_13
    move-wide v3, v12

    goto :goto_8

    .line 375
    :cond_14
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/o;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v0}, Lcom/yingyonghui/market/downloader/DownloadService;->i(Lcom/yingyonghui/market/downloader/DownloadService;)Lcom/yingyonghui/market/downloader/e;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/downloader/e;->a()V

    .line 376
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    move-wide v1, v12

    move v0, v14

    .line 377
    goto/16 :goto_0

    :cond_15
    move v0, v14

    goto :goto_7

    :cond_16
    move v0, v14

    goto :goto_5

    :cond_17
    move v0, v14

    goto/16 :goto_3
.end method
