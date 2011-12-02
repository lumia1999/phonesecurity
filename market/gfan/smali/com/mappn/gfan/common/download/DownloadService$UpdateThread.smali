.class Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;
.super Ljava/lang/Thread;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/download/DownloadService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UpdateThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/download/DownloadService;


# direct methods
.method public constructor <init>(Lcom/mappn/gfan/common/download/DownloadService;)V
    .locals 1

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    const-string v0, "Download Service"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method private scheduleAlarm(J)V
    .locals 7

    const/4 v6, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    const-string v1, "alarm"

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/download/DownloadService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    if-nez v0, :cond_0

    const-string v0, "couldn\'t get alarm manager"

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->E(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "scheduling retry in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "ms"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    new-instance v1, Landroid/content/Intent;

    const-string v2, "gfan.intent.action.DOWNLOAD_WAKEUP"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "com.mappn.gfan"

    const-class v3, Lcom/mappn/gfan/common/download/DownloadReceiver;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    add-long/2addr v2, p1

    iget-object v4, p0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    const/high16 v5, 0x4000

    invoke-static {v4, v6, v1, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v6, v2, v3, v1}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 19

    const/16 v3, 0xa

    invoke-static {v3}, Landroid/os/Process;->setThreadPriority(I)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    move-object v3, v0

    invoke-static {v3}, Lcom/mappn/gfan/common/download/DownloadService;->access$300(Lcom/mappn/gfan/common/download/DownloadService;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    move-object v3, v0

    invoke-static {v3}, Lcom/mappn/gfan/common/download/DownloadService;->access$400(Lcom/mappn/gfan/common/download/DownloadService;)V

    const/4 v3, 0x0

    const-wide v4, 0x7fffffffffffffffL

    move-wide/from16 v17, v4

    move v5, v3

    move-wide/from16 v3, v17

    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    move-object v6, v0

    monitor-enter v6

    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    move-object v7, v0

    iget-object v7, v7, Lcom/mappn/gfan/common/download/DownloadService;->mUpdateThread:Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;

    move-object v0, v7

    move-object/from16 v1, p0

    if-eq v0, v1, :cond_0

    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "multiple UpdateThreads in DownloadService"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    :catchall_0
    move-exception v3

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    :cond_0
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    move-object v7, v0

    invoke-static {v7}, Lcom/mappn/gfan/common/download/DownloadService;->access$500(Lcom/mappn/gfan/common/download/DownloadService;)Z

    move-result v7

    if-nez v7, :cond_3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    move-object v7, v0

    const/4 v8, 0x0

    iput-object v8, v7, Lcom/mappn/gfan/common/download/DownloadService;->mUpdateThread:Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;

    if-nez v5, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    move-object v5, v0

    invoke-virtual {v5}, Lcom/mappn/gfan/common/download/DownloadService;->stopSelf()V

    :cond_1
    const-wide v7, 0x7fffffffffffffffL

    cmp-long v5, v3, v7

    if-eqz v5, :cond_2

    move-object/from16 v0, p0

    move-wide v1, v3

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->scheduleAlarm(J)V

    :cond_2
    monitor-exit v6

    return-void

    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    move-object v3, v0

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/mappn/gfan/common/download/DownloadService;->access$502(Lcom/mappn/gfan/common/download/DownloadService;Z)Z

    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    const/4 v11, 0x0

    const-wide v12, 0x7fffffffffffffffL

    new-instance v14, Ljava/util/HashSet;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    move-object v3, v0

    invoke-static {v3}, Lcom/mappn/gfan/common/download/DownloadService;->access$600(Lcom/mappn/gfan/common/download/DownloadService;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v14, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    move-object v3, v0

    invoke-virtual {v3}, Lcom/mappn/gfan/common/download/DownloadService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    if-nez v4, :cond_4

    move-wide v3, v12

    move v5, v11

    goto/16 :goto_0

    :cond_4
    :try_start_2
    new-instance v5, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;

    invoke-direct {v5, v4}, Lcom/mappn/gfan/common/download/DownloadInfo$Reader;-><init>(Landroid/database/Cursor;)V

    const-string v3, "_id"

    invoke-interface {v4, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    move-wide v7, v12

    :goto_1
    invoke-interface {v4}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v3

    if-nez v3, :cond_8

    invoke-interface {v4, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v14, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    move-object v3, v0

    invoke-static {v3}, Lcom/mappn/gfan/common/download/DownloadService;->access$600(Lcom/mappn/gfan/common/download/DownloadService;)Ljava/util/Map;

    move-result-object v3

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-interface {v3, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mappn/gfan/common/download/DownloadInfo;

    if-eqz v3, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    move-object v12, v0

    invoke-static {v12, v5, v3, v9, v10}, Lcom/mappn/gfan/common/download/DownloadService;->access$700(Lcom/mappn/gfan/common/download/DownloadService;Lcom/mappn/gfan/common/download/DownloadInfo$Reader;Lcom/mappn/gfan/common/download/DownloadInfo;J)V

    :goto_2
    invoke-virtual {v3}, Lcom/mappn/gfan/common/download/DownloadInfo;->hasCompletionNotification()Z

    move-result v12

    if-eqz v12, :cond_5

    const/4 v11, 0x1

    :cond_5
    invoke-virtual {v3, v9, v10}, Lcom/mappn/gfan/common/download/DownloadInfo;->nextAction(J)J

    move-result-wide v12

    const-wide/16 v15, 0x0

    cmp-long v3, v12, v15

    if-nez v3, :cond_7

    const/4 v3, 0x1

    :goto_3
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    move v11, v3

    goto :goto_1

    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    move-object v3, v0

    invoke-static {v3, v5, v9, v10}, Lcom/mappn/gfan/common/download/DownloadService;->access$800(Lcom/mappn/gfan/common/download/DownloadService;Lcom/mappn/gfan/common/download/DownloadInfo$Reader;J)Lcom/mappn/gfan/common/download/DownloadInfo;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-object v3

    goto :goto_2

    :cond_7
    const-wide/16 v15, 0x0

    cmp-long v3, v12, v15

    if-lez v3, :cond_c

    cmp-long v3, v12, v7

    if-gez v3, :cond_c

    move-wide v7, v12

    move v3, v11

    goto :goto_3

    :cond_8
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    move-object v5, v0

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    invoke-static {v5, v9, v10}, Lcom/mappn/gfan/common/download/DownloadService;->access$900(Lcom/mappn/gfan/common/download/DownloadService;J)V

    goto :goto_4

    :catchall_1
    move-exception v3

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    throw v3

    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    move-object v3, v0

    invoke-static {v3}, Lcom/mappn/gfan/common/download/DownloadService;->access$200(Lcom/mappn/gfan/common/download/DownloadService;)Lcom/mappn/gfan/common/download/DownloadNotification;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mappn/gfan/common/download/DownloadNotification;->updateNotification()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    move-object v3, v0

    invoke-static {v3}, Lcom/mappn/gfan/common/download/DownloadService;->access$600(Lcom/mappn/gfan/common/download/DownloadService;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_a
    :goto_5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mappn/gfan/common/download/DownloadInfo;

    iget-boolean v5, v3, Lcom/mappn/gfan/common/download/DownloadInfo;->mDeleted:Z

    if-eqz v5, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/download/DownloadService$UpdateThread;->this$0:Lcom/mappn/gfan/common/download/DownloadService;

    move-object v5, v0

    invoke-virtual {v5}, Lcom/mappn/gfan/common/download/DownloadService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v6, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    const-string v9, "_id = ? "

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/String;

    const/4 v12, 0x0

    iget-wide v13, v3, Lcom/mappn/gfan/common/download/DownloadInfo;->mId:J

    invoke-static {v13, v14}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v10, v12

    invoke-virtual {v5, v6, v9, v10}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_5

    :cond_b
    move-wide v3, v7

    move v5, v11

    goto/16 :goto_0

    :cond_c
    move v3, v11

    goto/16 :goto_3
.end method
