.class public final Lcom/yingyonghui/market/downloader/g;
.super Ljava/lang/Thread;
.source "DownloadThread.java"


# instance fields
.field private a:Landroid/content/Context;

.field private b:Lcom/yingyonghui/market/downloader/h;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/yingyonghui/market/downloader/h;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/yingyonghui/market/downloader/g;->a:Landroid/content/Context;

    .line 42
    iput-object p2, p0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    .line 43
    return-void
.end method

.method private static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter

    .prologue
    .line 694
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 696
    const/16 v1, 0x3b

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 697
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 698
    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 702
    :cond_0
    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method private a(IZIIZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v5, 0x0

    .line 645
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "status"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "_data"

    invoke-virtual {v0, v1, p6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p7, :cond_0

    const-string v1, "uri"

    invoke-virtual {v0, v1, p7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-string v1, "mimetype"

    invoke-virtual {v0, v1, p8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "lastmod"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "method"

    shl-int/lit8 v2, p4, 0x1c

    add-int/2addr v2, p3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    if-nez p2, :cond_2

    const-string v1, "numfailed"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :goto_0
    iget-object v1, p0, Lcom/yingyonghui/market/downloader/g;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    iget-object v3, p0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    iget v3, v3, Lcom/yingyonghui/market/downloader/h;->a:I

    int-to-long v3, v3

    invoke-static {v2, v3, v4}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2, v0, v5, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 647
    invoke-static {p1}, Lcom/yingyonghui/market/downloader/a;->c(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 648
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    iget v1, v1, Lcom/yingyonghui/market/downloader/h;->a:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    iget-object v2, p0, Lcom/yingyonghui/market/downloader/g;->a:Landroid/content/Context;

    invoke-virtual {v1, v0, v2}, Lcom/yingyonghui/market/downloader/h;->a(Landroid/net/Uri;Landroid/content/Context;)V

    .line 650
    :cond_1
    return-void

    .line 645
    :cond_2
    if-eqz p5, :cond_3

    const-string v1, "numfailed"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0

    :cond_3
    const-string v1, "numfailed"

    iget-object v2, p0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    iget v2, v2, Lcom/yingyonghui/market/downloader/h;->k:I

    add-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0
.end method


# virtual methods
.method public final run()V
    .locals 35

    .prologue
    .line 62
    const/16 v5, 0xa

    invoke-static {v5}, Landroid/os/Process;->setThreadPriority(I)V

    .line 64
    const/16 v13, 0x1eb

    .line 65
    const/4 v14, 0x0

    .line 66
    const/4 v15, 0x0

    .line 67
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v5, v0

    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->m:I

    move/from16 v16, v0

    .line 68
    const/16 v17, 0x0

    .line 69
    const/16 v18, 0x0

    .line 70
    const/4 v6, 0x0

    .line 71
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v5, v0

    iget-object v5, v5, Lcom/yingyonghui/market/downloader/h;->f:Ljava/lang/String;

    invoke-static {v5}, Lcom/yingyonghui/market/downloader/g;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 72
    const/16 v20, 0x0

    .line 73
    const/16 v21, 0x0

    .line 74
    const/4 v7, 0x0

    .line 75
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v8, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v8, "/"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v8, v0

    iget v8, v8, Lcom/yingyonghui/market/downloader/h;->a:I

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v22

    .line 78
    const/4 v8, 0x0

    .line 79
    const/4 v9, 0x0

    .line 81
    const/4 v10, 0x0

    .line 82
    const/4 v12, 0x0

    .line 83
    const/16 v23, 0x0

    .line 84
    const/16 v24, 0x0

    .line 86
    const/16 v5, 0x1000

    :try_start_0
    move v0, v5

    new-array v0, v0, [B

    move-object/from16 v25, v0

    .line 88
    const/16 v26, 0x0

    .line 90
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->a:Landroid/content/Context;

    move-object v5, v0

    const-string v11, "power"

    invoke-virtual {v5, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/PowerManager;

    .line 91
    const/4 v11, 0x1

    const-string v27, "DownloadManager"

    move-object v0, v5

    move v1, v11

    move-object/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_24
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_7

    move-result-object v27

    .line 92
    :try_start_1
    invoke-virtual/range {v27 .. v27}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 94
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v5, v0

    iget-object v11, v5, Lcom/yingyonghui/market/downloader/h;->e:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_25
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_f

    .line 95
    if-eqz v11, :cond_58

    .line 96
    :try_start_2
    invoke-static {v11}, Lcom/yingyonghui/market/downloader/d;->a(Ljava/lang/String;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_26
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_10

    move-result v5

    if-nez v5, :cond_4

    .line 97
    const/16 v22, 0x1ec

    .line 98
    const/16 v6, 0x1ec

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x0

    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v5, v0

    iget-object v13, v5, Lcom/yingyonghui/market/downloader/h;->f:Ljava/lang/String;

    move-object/from16 v5, p0

    invoke-direct/range {v5 .. v13}, Lcom/yingyonghui/market/downloader/g;->a(IZIIZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_27
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_11

    .line 589
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v5, v0

    const/4 v6, 0x0

    iput-boolean v6, v5, Lcom/yingyonghui/market/downloader/h;->w:Z

    .line 590
    if-eqz v27, :cond_0

    .line 591
    invoke-virtual/range {v27 .. v27}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 592
    :cond_0
    if-eqz v21, :cond_1

    .line 595
    invoke-virtual/range {v21 .. v21}, Lcom/yingyonghui/market/downloader/i;->a()V

    .line 596
    :cond_1
    if-eqz v20, :cond_2

    .line 601
    :try_start_4
    invoke-virtual/range {v20 .. v20}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_c

    .line 609
    :cond_2
    :goto_0
    if-eqz v11, :cond_3

    .line 611
    invoke-static/range {v22 .. v22}, Lcom/yingyonghui/market/downloader/a;->b(I)Z

    move-result v5

    if-eqz v5, :cond_4a

    .line 612
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 613
    const/4 v5, 0x0

    move-object v11, v5

    :cond_3
    :goto_1
    move-object/from16 v5, p0

    move/from16 v6, v22

    move v7, v14

    move v8, v15

    move/from16 v9, v16

    move/from16 v10, v18

    move-object/from16 v12, v17

    move-object/from16 v13, v19

    .line 634
    invoke-direct/range {v5 .. v13}, Lcom/yingyonghui/market/downloader/g;->a(IZIIZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 636
    :goto_2
    return-void

    .line 103
    :cond_4
    :try_start_5
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 104
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_58

    .line 105
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v6

    .line 106
    const-wide/16 v28, 0x0

    cmp-long v28, v6, v28

    if-nez v28, :cond_e

    .line 108
    invoke-virtual {v5}, Ljava/io/File;->delete()Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3
    .catch Ljava/io/FileNotFoundException; {:try_start_5 .. :try_end_5} :catch_26
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_10

    .line 109
    const/4 v5, 0x0

    move-object v6, v10

    move v7, v8

    move-object/from16 v8, v20

    move/from16 v20, v26

    move-object/from16 v33, v23

    move-object/from16 v23, v5

    move-object/from16 v5, v33

    .line 137
    :goto_3
    const-wide/16 v28, 0x0

    .line 139
    :try_start_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v10, v0

    iget-object v10, v10, Lcom/yingyonghui/market/downloader/h;->r:Ljava/lang/String;

    if-nez v10, :cond_5

    const-string v10, "AndroidDownloadManager"

    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->a:Landroid/content/Context;

    move-object v11, v0

    invoke-static {v10, v11}, Lcom/yingyonghui/market/downloader/i;->a(Ljava/lang/String;Landroid/content/Context;)Lcom/yingyonghui/market/downloader/i;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_6
    .catch Ljava/io/FileNotFoundException; {:try_start_6 .. :try_end_6} :catch_29
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_13

    move-result-object v21

    .line 141
    if-eqz v8, :cond_13

    :try_start_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v10, v0

    iget v10, v10, Lcom/yingyonghui/market/downloader/h;->g:I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_7
    .catch Ljava/io/FileNotFoundException; {:try_start_7 .. :try_end_7} :catch_2a
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_14

    if-nez v10, :cond_13

    .line 145
    :try_start_8
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_7
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_8 .. :try_end_8} :catch_2a
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_14

    .line 146
    const/4 v8, 0x0

    move-object/from16 v26, v8

    .line 164
    :goto_4
    :try_start_9
    new-instance v30, Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v8, v0

    iget-object v8, v8, Lcom/yingyonghui/market/downloader/h;->b:Ljava/lang/String;

    move-object/from16 v0, v30

    move-object v1, v8

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 170
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v8, v0

    iget-object v8, v8, Lcom/yingyonghui/market/downloader/h;->q:Ljava/lang/String;

    if-eqz v8, :cond_6

    .line 171
    const-string v8, "Cookie"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v10, v0

    iget-object v10, v10, Lcom/yingyonghui/market/downloader/h;->q:Ljava/lang/String;

    move-object/from16 v0, v30

    move-object v1, v8

    move-object v2, v10

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v8, v0

    iget-object v8, v8, Lcom/yingyonghui/market/downloader/h;->s:Ljava/lang/String;

    if-eqz v8, :cond_7

    .line 174
    const-string v8, "Referer"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v10, v0

    iget-object v10, v10, Lcom/yingyonghui/market/downloader/h;->s:Ljava/lang/String;

    move-object/from16 v0, v30

    move-object v1, v8

    move-object v2, v10

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    :cond_7
    if-eqz v7, :cond_9

    .line 177
    if-eqz v5, :cond_8

    .line 178
    const-string v8, "If-Match"

    move-object/from16 v0, v30

    move-object v1, v8

    move-object v2, v5

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    :cond_8
    const-string v8, "Range"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "bytes="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object v0, v10

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "-"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    move-object/from16 v0, v30

    move-object v1, v8

    move-object v2, v10

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_8
    .catch Ljava/io/FileNotFoundException; {:try_start_9 .. :try_end_9} :catch_2b
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_15

    .line 185
    :cond_9
    :try_start_a
    move-object/from16 v0, v21

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/downloader/i;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_8
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a .. :try_end_a} :catch_1
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_2
    .catch Ljava/io/FileNotFoundException; {:try_start_a .. :try_end_a} :catch_2b
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_15

    move-result-object v31

    .line 217
    :try_start_b
    invoke-interface/range {v31 .. v31}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v8

    invoke-interface {v8}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v8

    .line 218
    const/16 v10, 0x1f7

    if-ne v8, v10, :cond_19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v10, v0

    iget v10, v10, Lcom/yingyonghui/market/downloader/h;->k:I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_8
    .catch Ljava/io/FileNotFoundException; {:try_start_b .. :try_end_b} :catch_2b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_15

    const/4 v11, 0x5

    if-ge v10, v11, :cond_19

    .line 222
    const/16 v5, 0xc1

    .line 223
    const/4 v6, 0x1

    .line 224
    :try_start_c
    const-string v7, "Retry-After"

    move-object/from16 v0, v31

    move-object v1, v7

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_b
    .catch Ljava/io/FileNotFoundException; {:try_start_c .. :try_end_c} :catch_2e
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_18

    move-result-object v7

    .line 225
    if-eqz v7, :cond_56

    .line 230
    :try_start_d
    invoke-interface {v7}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_b
    .catch Ljava/lang/NumberFormatException; {:try_start_d .. :try_end_d} :catch_39
    .catch Ljava/io/FileNotFoundException; {:try_start_d .. :try_end_d} :catch_2e
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_18

    move-result v7

    .line 231
    if-gez v7, :cond_16

    .line 232
    const/4 v7, 0x0

    .line 246
    :goto_5
    :try_start_e
    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_c
    .catch Ljava/io/FileNotFoundException; {:try_start_e .. :try_end_e} :catch_2f
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_19

    move-object/from16 v13, v19

    move-object/from16 v11, v23

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v7

    move v7, v6

    move v6, v5

    move-object/from16 v5, v26

    .line 589
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v14, v0

    const/4 v15, 0x0

    iput-boolean v15, v14, Lcom/yingyonghui/market/downloader/h;->w:Z

    .line 590
    if-eqz v27, :cond_a

    .line 591
    invoke-virtual/range {v27 .. v27}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 592
    :cond_a
    if-eqz v21, :cond_b

    .line 595
    invoke-virtual/range {v21 .. v21}, Lcom/yingyonghui/market/downloader/i;->a()V

    .line 596
    :cond_b
    if-eqz v5, :cond_c

    .line 601
    :try_start_f
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_d

    .line 609
    :cond_c
    :goto_7
    if-eqz v11, :cond_d

    .line 611
    invoke-static {v6}, Lcom/yingyonghui/market/downloader/a;->b(I)Z

    move-result v5

    if-eqz v5, :cond_4b

    .line 612
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 613
    const/4 v5, 0x0

    move-object v11, v5

    :cond_d
    :goto_8
    move-object/from16 v5, p0

    .line 634
    invoke-direct/range {v5 .. v13}, Lcom/yingyonghui/market/downloader/g;->a(IZIIZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 110
    :cond_e
    :try_start_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v8, v0

    iget-object v8, v8, Lcom/yingyonghui/market/downloader/h;->v:Ljava/lang/String;

    if-nez v8, :cond_12

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v8, v0

    iget-boolean v8, v8, Lcom/yingyonghui/market/downloader/h;->c:Z

    if-nez v8, :cond_12

    .line 113
    const-string v6, "DownloadManager"

    const-string v7, "can\'t resume interrupted non-resumable download"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    invoke-virtual {v5}, Ljava/io/File;->delete()Z
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_3
    .catch Ljava/io/FileNotFoundException; {:try_start_10 .. :try_end_10} :catch_26
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_10

    .line 117
    const/16 v22, 0x19c

    .line 118
    const/16 v6, 0x19c

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x0

    :try_start_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v5, v0

    iget-object v13, v5, Lcom/yingyonghui/market/downloader/h;->f:Ljava/lang/String;

    move-object/from16 v5, p0

    invoke-direct/range {v5 .. v13}, Lcom/yingyonghui/market/downloader/g;->a(IZIIZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_4
    .catch Ljava/io/FileNotFoundException; {:try_start_11 .. :try_end_11} :catch_27
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_11

    .line 589
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v5, v0

    const/4 v6, 0x0

    iput-boolean v6, v5, Lcom/yingyonghui/market/downloader/h;->w:Z

    .line 590
    if-eqz v27, :cond_f

    .line 591
    invoke-virtual/range {v27 .. v27}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 592
    :cond_f
    if-eqz v21, :cond_10

    .line 595
    invoke-virtual/range {v21 .. v21}, Lcom/yingyonghui/market/downloader/i;->a()V

    .line 596
    :cond_10
    if-eqz v20, :cond_11

    .line 601
    :try_start_12
    invoke-virtual/range {v20 .. v20}, Ljava/io/FileOutputStream;->close()V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_e

    .line 609
    :cond_11
    :goto_9
    if-eqz v11, :cond_3

    .line 611
    invoke-static/range {v22 .. v22}, Lcom/yingyonghui/market/downloader/a;->b(I)Z

    move-result v5

    if-eqz v5, :cond_4c

    .line 612
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 613
    const/4 v5, 0x0

    move-object v11, v5

    goto/16 :goto_1

    .line 123
    :cond_12
    :try_start_13
    new-instance v5, Ljava/io/FileOutputStream;

    const/4 v8, 0x1

    invoke-direct {v5, v11, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_3
    .catch Ljava/io/FileNotFoundException; {:try_start_13 .. :try_end_13} :catch_26
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_10

    .line 124
    long-to-int v6, v6

    .line 125
    :try_start_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v7, v0

    iget v7, v7, Lcom/yingyonghui/market/downloader/h;->t:I

    const/4 v8, -0x1

    if-eq v7, v8, :cond_57

    .line 126
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v7, v0

    iget v7, v7, Lcom/yingyonghui/market/downloader/h;->t:I

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    .line 128
    :goto_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v8, v0

    iget-object v8, v8, Lcom/yingyonghui/market/downloader/h;->v:Ljava/lang/String;
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_5
    .catch Ljava/io/FileNotFoundException; {:try_start_14 .. :try_end_14} :catch_28
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_12

    .line 129
    const/4 v10, 0x1

    move/from16 v20, v6

    move-object/from16 v23, v11

    move-object v6, v7

    move v7, v10

    move-object/from16 v33, v5

    move-object v5, v8

    move-object/from16 v8, v33

    goto/16 :goto_3

    :catch_0
    move-exception v10

    :cond_13
    move-object/from16 v26, v8

    goto/16 :goto_4

    .line 186
    :catch_1
    move-exception v5

    .line 191
    :try_start_15
    const-string v6, "DownloadManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Arg exception trying to execute request for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v8, v0

    iget v8, v8, Lcom/yingyonghui/market/downloader/h;->a:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_8
    .catch Ljava/io/FileNotFoundException; {:try_start_15 .. :try_end_15} :catch_2b
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_15

    .line 194
    const/16 v5, 0x190

    .line 195
    :try_start_16
    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_9
    .catch Ljava/io/FileNotFoundException; {:try_start_16 .. :try_end_16} :catch_2c
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_16

    move-object/from16 v13, v19

    move-object/from16 v11, v23

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move v6, v5

    move-object/from16 v5, v26

    .line 196
    goto/16 :goto_6

    .line 197
    :catch_2
    move-exception v5

    .line 198
    :try_start_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->a:Landroid/content/Context;

    move-object v6, v0

    invoke-static {v6}, Lcom/yingyonghui/market/util/g;->a(Landroid/content/Context;)Z
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_8
    .catch Ljava/io/FileNotFoundException; {:try_start_17 .. :try_end_17} :catch_2b
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_15

    move-result v6

    if-nez v6, :cond_14

    .line 199
    const/16 v5, 0xc1

    move v6, v5

    move v5, v14

    .line 213
    :goto_b
    :try_start_18
    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_a
    .catch Ljava/io/FileNotFoundException; {:try_start_18 .. :try_end_18} :catch_2d
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_17

    move-object/from16 v13, v19

    move-object/from16 v11, v23

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v5

    move-object/from16 v5, v26

    .line 214
    goto/16 :goto_6

    .line 200
    :cond_14
    :try_start_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v6, v0

    iget v6, v6, Lcom/yingyonghui/market/downloader/h;->k:I

    const/4 v7, 0x5

    if-ge v6, v7, :cond_15

    .line 201
    const/16 v5, 0xc1

    .line 202
    const/4 v6, 0x1

    move/from16 v33, v6

    move v6, v5

    move/from16 v5, v33

    goto :goto_b

    .line 208
    :cond_15
    const-string v6, "DownloadManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "IOException trying to execute request for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v8, v0

    iget v8, v8, Lcom/yingyonghui/market/downloader/h;->a:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_8
    .catch Ljava/io/FileNotFoundException; {:try_start_19 .. :try_end_19} :catch_2b
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_15

    .line 211
    const/16 v5, 0x1ef

    move v6, v5

    move v5, v14

    goto :goto_b

    .line 234
    :cond_16
    const/16 v8, 0x1e

    if-ge v7, v8, :cond_18

    .line 235
    const/16 v7, 0x1e

    .line 239
    :cond_17
    :goto_c
    :try_start_1a
    sget-object v8, Lcom/yingyonghui/market/downloader/d;->a:Ljava/util/Random;

    const/16 v9, 0x1f

    invoke-virtual {v8, v9}, Ljava/util/Random;->nextInt(I)I
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_c
    .catch Ljava/lang/NumberFormatException; {:try_start_1a .. :try_end_1a} :catch_3a
    .catch Ljava/io/FileNotFoundException; {:try_start_1a .. :try_end_1a} :catch_2f
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_19

    move-result v8

    add-int/2addr v7, v8

    .line 240
    mul-int/lit16 v7, v7, 0x3e8

    goto/16 :goto_5

    .line 236
    :cond_18
    const v8, 0x15180

    if-le v7, v8, :cond_17

    .line 237
    const v7, 0x15180

    goto :goto_c

    .line 249
    :cond_19
    const/16 v10, 0x12d

    if-eq v8, v10, :cond_1a

    const/16 v10, 0x12e

    if-eq v8, v10, :cond_1a

    const/16 v10, 0x12f

    if-eq v8, v10, :cond_1a

    const/16 v10, 0x133

    if-ne v8, v10, :cond_1c

    .line 256
    :cond_1a
    const/4 v10, 0x5

    move/from16 v0, v16

    move v1, v10

    if-lt v0, v1, :cond_1b

    .line 261
    :try_start_1b
    const-string v5, "DownloadManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "too many redirects for download "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v7, v0

    iget v7, v7, Lcom/yingyonghui/market/downloader/h;->a:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_8
    .catch Ljava/io/FileNotFoundException; {:try_start_1b .. :try_end_1b} :catch_2b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_15

    .line 263
    const/16 v5, 0x1f1

    .line 264
    :try_start_1c
    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_9
    .catch Ljava/io/FileNotFoundException; {:try_start_1c .. :try_end_1c} :catch_2c
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_1c} :catch_16

    move-object/from16 v13, v19

    move-object/from16 v11, v23

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move v6, v5

    move-object/from16 v5, v26

    .line 265
    goto/16 :goto_6

    .line 267
    :cond_1b
    :try_start_1d
    const-string v10, "Location"

    move-object/from16 v0, v31

    move-object v1, v10

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v10

    .line 268
    if-eqz v10, :cond_1c

    .line 272
    new-instance v5, Ljava/net/URI;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v6, v0

    iget-object v6, v6, Lcom/yingyonghui/market/downloader/h;->b:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    new-instance v6, Ljava/net/URI;

    invoke-interface {v10}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Ljava/net/URI;->resolve(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/URI;->toString()Ljava/lang/String;
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_8
    .catch Ljava/io/FileNotFoundException; {:try_start_1d .. :try_end_1d} :catch_2b
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_1d} :catch_15

    move-result-object v5

    .line 273
    add-int/lit8 v6, v16, 0x1

    .line 274
    const/16 v7, 0xc1

    .line 275
    :try_start_1e
    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_d
    .catch Ljava/io/FileNotFoundException; {:try_start_1e .. :try_end_1e} :catch_30
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_1a

    move-object/from16 v13, v19

    move-object/from16 v11, v23

    move/from16 v10, v18

    move-object v12, v5

    move v9, v6

    move v8, v15

    move-object/from16 v5, v26

    move v6, v7

    move v7, v14

    .line 276
    goto/16 :goto_6

    .line 279
    :cond_1c
    if-nez v7, :cond_1d

    const/16 v10, 0xc8

    if-ne v8, v10, :cond_1e

    :cond_1d
    if-eqz v7, :cond_22

    const/16 v10, 0xce

    if-eq v8, v10, :cond_22

    .line 284
    :cond_1e
    :try_start_1f
    const-string v5, "DownloadManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "http error "

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v9, " for download "

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v9, v0

    iget v9, v9, Lcom/yingyonghui/market/downloader/h;->a:I

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    invoke-static {v8}, Lcom/yingyonghui/market/downloader/a;->b(I)Z
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_8
    .catch Ljava/io/FileNotFoundException; {:try_start_1f .. :try_end_1f} :catch_2b
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_1f} :catch_15

    move-result v5

    if-eqz v5, :cond_1f

    move v5, v8

    .line 296
    :goto_d
    :try_start_20
    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_9
    .catch Ljava/io/FileNotFoundException; {:try_start_20 .. :try_end_20} :catch_2c
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_20} :catch_16

    move-object/from16 v13, v19

    move-object/from16 v11, v23

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move v6, v5

    move-object/from16 v5, v26

    .line 297
    goto/16 :goto_6

    .line 289
    :cond_1f
    const/16 v5, 0x12c

    if-lt v8, v5, :cond_20

    const/16 v5, 0x190

    if-ge v8, v5, :cond_20

    .line 290
    const/16 v5, 0x1ed

    goto :goto_d

    .line 291
    :cond_20
    if-eqz v7, :cond_21

    const/16 v5, 0xc8

    if-ne v8, v5, :cond_21

    .line 292
    const/16 v5, 0x19c

    goto :goto_d

    .line 294
    :cond_21
    const/16 v5, 0x1ee

    goto :goto_d

    .line 304
    :cond_22
    if-nez v7, :cond_55

    .line 305
    :try_start_21
    const-string v7, "Accept-Ranges"

    move-object/from16 v0, v31

    move-object v1, v7

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v7

    .line 306
    if-eqz v7, :cond_23

    .line 307
    invoke-interface {v7}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    .line 309
    :cond_23
    const-string v7, "Content-Disposition"

    move-object/from16 v0, v31

    move-object v1, v7

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v7

    .line 310
    if-eqz v7, :cond_54

    .line 311
    invoke-interface {v7}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v7

    move-object v8, v7

    .line 313
    :goto_e
    const-string v7, "Content-Location"

    move-object/from16 v0, v31

    move-object v1, v7

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v7

    .line 314
    if-eqz v7, :cond_53

    .line 315
    invoke-interface {v7}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v7

    move-object v9, v7

    .line 317
    :goto_f
    if-nez v19, :cond_52

    .line 318
    const-string v7, "Content-Type"

    move-object/from16 v0, v31

    move-object v1, v7

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v7

    .line 319
    if-eqz v7, :cond_52

    .line 320
    invoke-interface {v7}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/yingyonghui/market/downloader/g;->a(Ljava/lang/String;)Ljava/lang/String;
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_8
    .catch Ljava/io/FileNotFoundException; {:try_start_21 .. :try_end_21} :catch_2b
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_21} :catch_15

    move-result-object v7

    move-object v10, v7

    .line 323
    :goto_10
    :try_start_22
    const-string v7, "ETag"

    move-object/from16 v0, v31

    move-object v1, v7

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v7

    .line 324
    if-eqz v7, :cond_51

    .line 325
    invoke-interface {v7}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v19, v5

    .line 327
    :goto_11
    const-string v5, "Transfer-Encoding"

    move-object/from16 v0, v31

    move-object v1, v5

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v5

    .line 328
    if-eqz v5, :cond_50

    .line 329
    invoke-interface {v5}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    .line 331
    :goto_12
    if-nez v5, :cond_4f

    .line 332
    const-string v7, "Content-Length"

    move-object/from16 v0, v31

    move-object v1, v7

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v7

    .line 333
    if-eqz v7, :cond_4f

    .line 334
    invoke-interface {v7}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v24, v6

    .line 353
    :goto_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v6, v0

    iget-boolean v6, v6, Lcom/yingyonghui/market/downloader/h;->c:Z

    if-nez v6, :cond_25

    if-nez v24, :cond_25

    if-eqz v5, :cond_24

    const-string v6, "chunked"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_25

    .line 358
    :cond_24
    const-string v5, "DownloadManager"

    const-string v6, "can\'t know size of download, giving up"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_e
    .catch Ljava/io/FileNotFoundException; {:try_start_22 .. :try_end_22} :catch_31
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_22} :catch_1b

    .line 360
    const/16 v5, 0x19b

    .line 361
    :try_start_23
    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_f
    .catch Ljava/io/FileNotFoundException; {:try_start_23 .. :try_end_23} :catch_32
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_23} :catch_1c

    move-object v13, v10

    move-object/from16 v11, v23

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move v6, v5

    move/from16 v10, v18

    move-object/from16 v5, v26

    .line 362
    goto/16 :goto_6

    .line 365
    :cond_25
    :try_start_24
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->a:Landroid/content/Context;

    move-object v5, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v6, v0

    iget-object v6, v6, Lcom/yingyonghui/market/downloader/h;->b:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v7, v0

    iget-object v7, v7, Lcom/yingyonghui/market/downloader/h;->d:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v11, v0

    iget v11, v11, Lcom/yingyonghui/market/downloader/h;->g:I

    if-eqz v24, :cond_26

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    :goto_14
    invoke-static/range {v5 .. v12}, Lcom/yingyonghui/market/downloader/d;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)Lcom/yingyonghui/market/downloader/f;

    move-result-object v5

    .line 375
    iget-object v6, v5, Lcom/yingyonghui/market/downloader/f;->a:Ljava/lang/String;

    if-nez v6, :cond_27

    .line 376
    iget v5, v5, Lcom/yingyonghui/market/downloader/f;->c:I
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_e
    .catch Ljava/io/FileNotFoundException; {:try_start_24 .. :try_end_24} :catch_31
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_24} :catch_1b

    .line 377
    :try_start_25
    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_f
    .catch Ljava/io/FileNotFoundException; {:try_start_25 .. :try_end_25} :catch_32
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_25} :catch_1c

    move-object v13, v10

    move-object/from16 v11, v23

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move v6, v5

    move/from16 v10, v18

    move-object/from16 v5, v26

    .line 378
    goto/16 :goto_6

    .line 365
    :cond_26
    const/4 v12, 0x0

    goto :goto_14

    .line 380
    :cond_27
    :try_start_26
    iget-object v6, v5, Lcom/yingyonghui/market/downloader/f;->a:Ljava/lang/String;
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_e
    .catch Ljava/io/FileNotFoundException; {:try_start_26 .. :try_end_26} :catch_31
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_26} :catch_1b

    .line 381
    :try_start_27
    iget-object v5, v5, Lcom/yingyonghui/market/downloader/f;->b:Ljava/io/FileOutputStream;
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_10
    .catch Ljava/io/FileNotFoundException; {:try_start_27 .. :try_end_27} :catch_33
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_27} :catch_1d

    .line 386
    :try_start_28
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 387
    const-string v8, "_data"

    invoke-virtual {v7, v8, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 388
    if-eqz v19, :cond_28

    .line 389
    const-string v8, "etag"

    move-object v0, v7

    move-object v1, v8

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    :cond_28
    if-eqz v10, :cond_29

    .line 392
    const-string v8, "mimetype"

    invoke-virtual {v7, v8, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 394
    :cond_29
    const/4 v8, -0x1

    .line 395
    if-eqz v24, :cond_2a

    .line 396
    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 398
    :cond_2a
    const-string v9, "total_bytes"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 399
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->a:Landroid/content/Context;

    move-object v8, v0

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const/4 v9, 0x0

    const/4 v11, 0x0

    move-object v0, v8

    move-object/from16 v1, v22

    move-object v2, v7

    move-object v3, v9

    move-object v4, v11

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_28
    .catchall {:try_start_28 .. :try_end_28} :catchall_11
    .catch Ljava/io/FileNotFoundException; {:try_start_28 .. :try_end_28} :catch_34
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_28} :catch_1e

    move-object v7, v5

    move-object v8, v10

    move-object v9, v6

    move-object/from16 v6, v24

    move-object/from16 v5, v19

    .line 404
    :goto_15
    :try_start_29
    invoke-interface/range {v31 .. v31}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v10

    invoke-interface {v10}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_12
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_29} :catch_3
    .catch Ljava/io/FileNotFoundException; {:try_start_29 .. :try_end_29} :catch_35
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_29} :catch_1f

    move-result-object v10

    move-wide/from16 v11, v28

    move-object/from16 v19, v7

    move/from16 v7, v20

    move/from16 v33, v20

    move/from16 v20, v18

    move/from16 v18, v33

    .line 427
    :cond_2b
    :try_start_2a
    move-object v0, v10

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_14
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_2a} :catch_4
    .catch Ljava/io/FileNotFoundException; {:try_start_2a .. :try_end_2a} :catch_37
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_2a} :catch_21

    move-result v23

    .line 463
    const/16 v24, -0x1

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_35

    .line 464
    :try_start_2b
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 465
    const-string v10, "current_bytes"

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v7, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 466
    if-nez v6, :cond_2c

    .line 467
    const-string v10, "total_bytes"

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v7, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 469
    :cond_2c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->a:Landroid/content/Context;

    move-object v10, v0

    invoke-virtual {v10}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v0, v10

    move-object/from16 v1, v22

    move-object v2, v7

    move-object v3, v11

    move-object v4, v12

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 470
    if-eqz v6, :cond_3e

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    move/from16 v0, v18

    move v1, v6

    if-eq v0, v1, :cond_3e

    .line 473
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v6, v0

    iget-boolean v6, v6, Lcom/yingyonghui/market/downloader/h;->c:Z

    if-nez v6, :cond_32

    if-nez v5, :cond_32

    .line 478
    const-string v5, "DownloadManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "mismatched content length for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v7, v0

    iget v7, v7, Lcom/yingyonghui/market/downloader/h;->a:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_14
    .catch Ljava/io/FileNotFoundException; {:try_start_2b .. :try_end_2b} :catch_37
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_2b} :catch_21

    .line 481
    const/16 v5, 0x19b

    move-object v13, v8

    move-object v11, v9

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v7, v14

    move v6, v5

    move v8, v15

    move-object/from16 v5, v19

    move/from16 v9, v16

    goto/16 :goto_6

    .line 405
    :catch_3
    move-exception v5

    .line 406
    :try_start_2c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->a:Landroid/content/Context;

    move-object v6, v0

    invoke-static {v6}, Lcom/yingyonghui/market/util/g;->a(Landroid/content/Context;)Z
    :try_end_2c
    .catchall {:try_start_2c .. :try_end_2c} :catchall_12
    .catch Ljava/io/FileNotFoundException; {:try_start_2c .. :try_end_2c} :catch_35
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_2c} :catch_1f

    move-result v6

    if-nez v6, :cond_2d

    .line 407
    const/16 v5, 0xc1

    move v6, v5

    move v5, v14

    .line 421
    :goto_16
    :try_start_2d
    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_13
    .catch Ljava/io/FileNotFoundException; {:try_start_2d .. :try_end_2d} :catch_36
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_2d} :catch_20

    move-object v13, v8

    move-object v11, v9

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move-object/from16 v33, v7

    move v7, v5

    move-object/from16 v5, v33

    .line 422
    goto/16 :goto_6

    .line 408
    :cond_2d
    :try_start_2e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v6, v0

    iget v6, v6, Lcom/yingyonghui/market/downloader/h;->k:I

    const/4 v10, 0x5

    if-ge v6, v10, :cond_2e

    .line 409
    const/16 v5, 0xc1

    .line 410
    const/4 v6, 0x1

    move/from16 v33, v6

    move v6, v5

    move/from16 v5, v33

    goto :goto_16

    .line 416
    :cond_2e
    const-string v6, "DownloadManager"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "IOException getting entity for download "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v11, v0

    iget v11, v11, Lcom/yingyonghui/market/downloader/h;->a:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2e
    .catchall {:try_start_2e .. :try_end_2e} :catchall_12
    .catch Ljava/io/FileNotFoundException; {:try_start_2e .. :try_end_2e} :catch_35
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_2e} :catch_1f

    .line 419
    const/16 v5, 0x1ef

    move v6, v5

    move v5, v14

    goto :goto_16

    .line 428
    :catch_4
    move-exception v6

    .line 429
    :try_start_2f
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 430
    const-string v10, "current_bytes"

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v7, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 431
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->a:Landroid/content/Context;

    move-object v10, v0

    invoke-virtual {v10}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v0, v10

    move-object/from16 v1, v22

    move-object v2, v7

    move-object v3, v11

    move-object v4, v12

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 432
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v7, v0

    iget-boolean v7, v7, Lcom/yingyonghui/market/downloader/h;->c:Z

    if-nez v7, :cond_2f

    if-nez v5, :cond_2f

    .line 437
    const-string v5, "DownloadManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "download IOException for download "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v10, v0

    iget v10, v10, Lcom/yingyonghui/market/downloader/h;->a:I

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, " : "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 441
    const-string v5, "DownloadManager"

    const-string v6, "can\'t resume interrupted download with no ETag"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_14
    .catch Ljava/io/FileNotFoundException; {:try_start_2f .. :try_end_2f} :catch_37
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_2f} :catch_21

    .line 444
    const/16 v5, 0x19c

    move v6, v5

    move v5, v14

    .line 460
    :goto_17
    :try_start_30
    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_30
    .catchall {:try_start_30 .. :try_end_30} :catchall_15
    .catch Ljava/io/FileNotFoundException; {:try_start_30 .. :try_end_30} :catch_38
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_30} :catch_22

    move-object v13, v8

    move-object v11, v9

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v7, v5

    move/from16 v9, v16

    move v8, v15

    move-object/from16 v5, v19

    .line 461
    goto/16 :goto_6

    .line 445
    :cond_2f
    :try_start_31
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->a:Landroid/content/Context;

    move-object v5, v0

    invoke-static {v5}, Lcom/yingyonghui/market/util/g;->a(Landroid/content/Context;)Z

    move-result v5

    if-nez v5, :cond_30

    .line 446
    const/16 v5, 0xc1

    move v6, v5

    move v5, v14

    goto :goto_17

    .line 447
    :cond_30
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v5, v0

    iget v5, v5, Lcom/yingyonghui/market/downloader/h;->k:I

    const/4 v7, 0x5

    if-ge v5, v7, :cond_31

    .line 448
    const/16 v5, 0xc1

    .line 449
    const/4 v6, 0x1

    move/from16 v33, v6

    move v6, v5

    move/from16 v5, v33

    goto :goto_17

    .line 455
    :cond_31
    const-string v5, "DownloadManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "download IOException for download "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v10, v0

    iget v10, v10, Lcom/yingyonghui/market/downloader/h;->a:I

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, " : "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 458
    const/16 v5, 0x1ef

    move v6, v5

    move v5, v14

    goto :goto_17

    .line 482
    :cond_32
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->a:Landroid/content/Context;

    move-object v5, v0

    invoke-static {v5}, Lcom/yingyonghui/market/util/g;->a(Landroid/content/Context;)Z

    move-result v5

    if-nez v5, :cond_33

    .line 483
    const/16 v5, 0xc1

    move-object v13, v8

    move-object v11, v9

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v7, v14

    move v6, v5

    move v8, v15

    move-object/from16 v5, v19

    move/from16 v9, v16

    goto/16 :goto_6

    .line 484
    :cond_33
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v5, v0

    iget v5, v5, Lcom/yingyonghui/market/downloader/h;->k:I

    const/4 v6, 0x5

    if-ge v5, v6, :cond_34

    .line 485
    const/16 v5, 0xc1

    .line 486
    const/4 v6, 0x1

    move-object v13, v8

    move-object v11, v9

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v7, v6

    move/from16 v9, v16

    move v8, v15

    move v6, v5

    move-object/from16 v5, v19

    goto/16 :goto_6

    .line 491
    :cond_34
    const-string v5, "DownloadManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "closed socket for download "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v7, v0

    iget v7, v7, Lcom/yingyonghui/market/downloader/h;->a:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_31
    .catchall {:try_start_31 .. :try_end_31} :catchall_14
    .catch Ljava/io/FileNotFoundException; {:try_start_31 .. :try_end_31} :catch_37
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_31} :catch_21

    .line 494
    const/16 v5, 0x1ef

    move-object v13, v8

    move-object v11, v9

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v7, v14

    move v6, v5

    move v8, v15

    move-object/from16 v5, v19

    move/from16 v9, v16

    .line 496
    goto/16 :goto_6

    .line 500
    :cond_35
    const/16 v20, 0x1

    .line 503
    :cond_36
    if-nez v19, :cond_37

    .line 504
    :try_start_32
    new-instance v24, Ljava/io/FileOutputStream;

    const/16 v26, 0x1

    move-object/from16 v0, v24

    move-object v1, v9

    move/from16 v2, v26

    invoke-direct {v0, v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    move-object/from16 v19, v24

    .line 506
    :cond_37
    const/16 v24, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, v25

    move/from16 v2, v24

    move/from16 v3, v23

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/FileOutputStream;->write([BII)V

    .line 507
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->g:I

    move/from16 v24, v0
    :try_end_32
    .catchall {:try_start_32 .. :try_end_32} :catchall_14
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_32} :catch_5
    .catch Ljava/io/FileNotFoundException; {:try_start_32 .. :try_end_32} :catch_37
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_32} :catch_21

    if-nez v24, :cond_38

    .line 511
    :try_start_33
    invoke-virtual/range {v19 .. v19}, Ljava/io/FileOutputStream;->close()V
    :try_end_33
    .catchall {:try_start_33 .. :try_end_33} :catchall_14
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_33} :catch_8
    .catch Ljava/io/FileNotFoundException; {:try_start_33 .. :try_end_33} :catch_37
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_33} :catch_21

    .line 512
    const/16 v19, 0x0

    .line 531
    :cond_38
    :goto_18
    add-int v18, v18, v23

    .line 532
    :try_start_34
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v23

    .line 533
    sub-int v26, v18, v7

    const/16 v28, 0x1000

    move/from16 v0, v26

    move/from16 v1, v28

    if-le v0, v1, :cond_39

    sub-long v28, v23, v11

    const-wide/16 v31, 0x5dc

    cmp-long v26, v28, v31

    if-lez v26, :cond_39

    .line 536
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 537
    const-string v11, "current_bytes"

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v7, v11, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 538
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->a:Landroid/content/Context;

    move-object v11, v0

    invoke-virtual {v11}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v11

    const/4 v12, 0x0

    const/16 v26, 0x0

    move-object v0, v11

    move-object/from16 v1, v22

    move-object v2, v7

    move-object v3, v12

    move-object/from16 v4, v26

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-wide/from16 v11, v23

    move/from16 v7, v18

    .line 547
    :cond_39
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object/from16 v23, v0

    monitor-enter v23
    :try_end_34
    .catchall {:try_start_34 .. :try_end_34} :catchall_14
    .catch Ljava/io/FileNotFoundException; {:try_start_34 .. :try_end_34} :catch_37
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_34} :catch_21

    .line 548
    :try_start_35
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->i:I

    move/from16 v24, v0
    :try_end_35
    .catchall {:try_start_35 .. :try_end_35} :catchall_0

    const/16 v26, 0x1

    move/from16 v0, v24

    move/from16 v1, v26

    if-ne v0, v1, :cond_3a

    .line 552
    const/16 v5, 0xc1

    .line 553
    :try_start_36
    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/client/methods/HttpGet;->abort()V

    .line 554
    monitor-exit v23
    :try_end_36
    .catchall {:try_start_36 .. :try_end_36} :catchall_18

    move-object v13, v8

    move-object v11, v9

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v7, v14

    move v6, v5

    move v8, v15

    move-object/from16 v5, v19

    move/from16 v9, v16

    goto/16 :goto_6

    .line 524
    :catch_5
    move-exception v24

    :try_start_37
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->a:Landroid/content/Context;

    move-object/from16 v24, v0

    const-wide/16 v28, 0x1000

    move-object/from16 v0, v24

    move-wide/from16 v1, v28

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/downloader/d;->a(Landroid/content/Context;J)Z
    :try_end_37
    .catchall {:try_start_37 .. :try_end_37} :catchall_14
    .catch Ljava/io/FileNotFoundException; {:try_start_37 .. :try_end_37} :catch_37
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_37} :catch_21

    move-result v24

    if-nez v24, :cond_36

    .line 526
    const/16 v5, 0x1ec

    move-object v13, v8

    move-object v11, v9

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v7, v14

    move v6, v5

    move v8, v15

    move-object/from16 v5, v19

    move/from16 v9, v16

    .line 527
    goto/16 :goto_6

    .line 556
    :cond_3a
    :try_start_38
    monitor-exit v23
    :try_end_38
    .catchall {:try_start_38 .. :try_end_38} :catchall_0

    .line 557
    :try_start_39
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    move/from16 v23, v0
    :try_end_39
    .catchall {:try_start_39 .. :try_end_39} :catchall_14
    .catch Ljava/io/FileNotFoundException; {:try_start_39 .. :try_end_39} :catch_37
    .catch Ljava/lang/Exception; {:try_start_39 .. :try_end_39} :catch_21

    const/16 v24, 0x1ea

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_2b

    .line 563
    const/16 v5, 0x1ea

    move-object v13, v8

    move-object v11, v9

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v7, v14

    move v6, v5

    move v8, v15

    move-object/from16 v5, v19

    move/from16 v9, v16

    .line 564
    goto/16 :goto_6

    .line 556
    :catchall_0
    move-exception v5

    move v6, v13

    :goto_19
    :try_start_3a
    monitor-exit v23
    :try_end_3a
    .catchall {:try_start_3a .. :try_end_3a} :catchall_19

    :try_start_3b
    throw v5
    :try_end_3b
    .catchall {:try_start_3b .. :try_end_3b} :catchall_16
    .catch Ljava/io/FileNotFoundException; {:try_start_3b .. :try_end_3b} :catch_6
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_3b} :catch_23

    .line 574
    :catch_6
    move-exception v5

    move-object/from16 v11, v27

    move-object v13, v8

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v7, v14

    move-object/from16 v14, v21

    move v8, v15

    move-object/from16 v15, v19

    move/from16 v33, v16

    move-object/from16 v16, v9

    move/from16 v9, v33

    .line 576
    :goto_1a
    :try_start_3c
    const-string v17, "DownloadManager"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "FileNotFoundException for "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " : "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v17

    move-object v1, v5

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3c
    .catchall {:try_start_3c .. :try_end_3c} :catchall_17

    .line 578
    const/16 v6, 0x1ec

    .line 589
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v5, v0

    const/16 v17, 0x0

    move/from16 v0, v17

    move-object v1, v5

    iput-boolean v0, v1, Lcom/yingyonghui/market/downloader/h;->w:Z

    .line 590
    if-eqz v11, :cond_3b

    .line 591
    invoke-virtual {v11}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 592
    :cond_3b
    if-eqz v14, :cond_3c

    .line 595
    invoke-virtual {v14}, Lcom/yingyonghui/market/downloader/i;->a()V

    .line 596
    :cond_3c
    if-eqz v15, :cond_3d

    .line 601
    :try_start_3d
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->close()V
    :try_end_3d
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_3d} :catch_a

    .line 609
    :cond_3d
    :goto_1b
    if-eqz v16, :cond_48

    .line 611
    invoke-static {v6}, Lcom/yingyonghui/market/downloader/a;->b(I)Z

    move-result v5

    if-eqz v5, :cond_47

    .line 612
    new-instance v5, Ljava/io/File;

    move-object v0, v5

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 613
    const/4 v5, 0x0

    move-object v11, v5

    goto/16 :goto_8

    .line 570
    :cond_3e
    const/16 v5, 0xc8

    move-object v13, v8

    move-object v11, v9

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v7, v14

    move v6, v5

    move v8, v15

    move-object/from16 v5, v19

    move/from16 v9, v16

    goto/16 :goto_6

    .line 580
    :catch_7
    move-exception v5

    move-object v11, v7

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move-object/from16 v15, v20

    move-object/from16 v16, v6

    move v7, v14

    move-object/from16 v14, v21

    move v6, v13

    move-object/from16 v13, v19

    .line 584
    :goto_1c
    :try_start_3e
    const-string v17, "DownloadManager"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Exception for id "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->a:I

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object v2, v5

    invoke-static {v0, v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3e
    .catchall {:try_start_3e .. :try_end_3e} :catchall_17

    .line 586
    const/16 v6, 0x1eb

    .line 589
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object v5, v0

    const/16 v17, 0x0

    move/from16 v0, v17

    move-object v1, v5

    iput-boolean v0, v1, Lcom/yingyonghui/market/downloader/h;->w:Z

    .line 590
    if-eqz v11, :cond_3f

    .line 591
    invoke-virtual {v11}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 592
    :cond_3f
    if-eqz v14, :cond_40

    .line 595
    invoke-virtual {v14}, Lcom/yingyonghui/market/downloader/i;->a()V

    .line 596
    :cond_40
    if-eqz v15, :cond_41

    .line 601
    :try_start_3f
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->close()V
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_3f} :catch_b

    .line 609
    :cond_41
    :goto_1d
    if-eqz v16, :cond_4e

    .line 611
    invoke-static {v6}, Lcom/yingyonghui/market/downloader/a;->b(I)Z

    move-result v5

    if-eqz v5, :cond_49

    .line 612
    new-instance v5, Ljava/io/File;

    move-object v0, v5

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 613
    const/4 v5, 0x0

    move-object v11, v5

    goto/16 :goto_8

    .line 589
    :catchall_1
    move-exception v5

    move-object/from16 v11, v21

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move-object/from16 v16, v6

    move-object/from16 v15, v20

    move v6, v13

    move-object/from16 v13, v19

    move-object/from16 v33, v7

    move v7, v14

    move-object v14, v5

    move-object/from16 v5, v33

    :goto_1e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/g;->b:Lcom/yingyonghui/market/downloader/h;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, v17

    iput-boolean v0, v1, Lcom/yingyonghui/market/downloader/h;->w:Z

    .line 590
    if-eqz v5, :cond_42

    .line 591
    invoke-virtual {v5}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 592
    :cond_42
    if-eqz v11, :cond_43

    .line 595
    invoke-virtual {v11}, Lcom/yingyonghui/market/downloader/i;->a()V

    .line 596
    :cond_43
    if-eqz v15, :cond_44

    .line 601
    :try_start_40
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->close()V
    :try_end_40
    .catch Ljava/io/IOException; {:try_start_40 .. :try_end_40} :catch_9

    .line 609
    :cond_44
    :goto_1f
    if-eqz v16, :cond_46

    .line 611
    invoke-static {v6}, Lcom/yingyonghui/market/downloader/a;->b(I)Z

    move-result v5

    if-eqz v5, :cond_45

    .line 612
    new-instance v5, Ljava/io/File;

    move-object v0, v5

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 613
    const/4 v5, 0x0

    move-object v11, v5

    :goto_20
    move-object/from16 v5, p0

    .line 634
    invoke-direct/range {v5 .. v13}, Lcom/yingyonghui/market/downloader/g;->a(IZIIZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 589
    throw v14

    :catch_8
    move-exception v24

    goto/16 :goto_18

    :catch_9
    move-exception v5

    goto :goto_1f

    .line 629
    :cond_45
    invoke-static {v6}, Lcom/yingyonghui/market/downloader/a;->a(I)Z

    move-result v5

    if-eqz v5, :cond_46

    .line 631
    const/16 v5, 0x1a4

    const/4 v11, -0x1

    const/4 v15, -0x1

    move-object/from16 v0, v16

    move v1, v5

    move v2, v11

    move v3, v15

    invoke-static {v0, v1, v2, v3}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    :cond_46
    move-object/from16 v11, v16

    goto :goto_20

    :catch_a
    move-exception v5

    goto/16 :goto_1b

    .line 629
    :cond_47
    invoke-static {v6}, Lcom/yingyonghui/market/downloader/a;->a(I)Z

    move-result v5

    if-eqz v5, :cond_48

    .line 631
    const/16 v5, 0x1a4

    const/4 v11, -0x1

    const/4 v14, -0x1

    move-object/from16 v0, v16

    move v1, v5

    move v2, v11

    move v3, v14

    invoke-static {v0, v1, v2, v3}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    :cond_48
    move-object/from16 v11, v16

    goto/16 :goto_8

    :catch_b
    move-exception v5

    goto/16 :goto_1d

    .line 629
    :cond_49
    invoke-static {v6}, Lcom/yingyonghui/market/downloader/a;->a(I)Z

    move-result v5

    if-eqz v5, :cond_4d

    .line 631
    const/16 v5, 0x1a4

    const/4 v11, -0x1

    const/4 v14, -0x1

    move-object/from16 v0, v16

    move v1, v5

    move v2, v11

    move v3, v14

    invoke-static {v0, v1, v2, v3}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    move-object/from16 v11, v16

    goto/16 :goto_8

    :catch_c
    move-exception v5

    goto/16 :goto_0

    .line 629
    :cond_4a
    invoke-static/range {v22 .. v22}, Lcom/yingyonghui/market/downloader/a;->a(I)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 631
    const/16 v5, 0x1a4

    const/4 v6, -0x1

    const/4 v7, -0x1

    invoke-static {v11, v5, v6, v7}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    goto/16 :goto_1

    :catch_d
    move-exception v5

    goto/16 :goto_7

    .line 629
    :cond_4b
    invoke-static {v6}, Lcom/yingyonghui/market/downloader/a;->a(I)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 631
    const/16 v5, 0x1a4

    const/4 v14, -0x1

    const/4 v15, -0x1

    invoke-static {v11, v5, v14, v15}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    goto/16 :goto_8

    :catch_e
    move-exception v5

    goto/16 :goto_9

    .line 629
    :cond_4c
    invoke-static/range {v22 .. v22}, Lcom/yingyonghui/market/downloader/a;->a(I)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 631
    const/16 v5, 0x1a4

    const/4 v6, -0x1

    const/4 v7, -0x1

    invoke-static {v11, v5, v6, v7}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    goto/16 :goto_1

    .line 589
    :catchall_2
    move-exception v5

    move-object/from16 v11, v21

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move-object v14, v5

    move-object/from16 v15, v20

    move-object/from16 v16, v6

    move-object/from16 v5, v27

    move v6, v13

    move-object/from16 v13, v19

    goto/16 :goto_1e

    :catchall_3
    move-exception v5

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move v6, v13

    move-object v14, v5

    move-object/from16 v15, v20

    move-object/from16 v13, v19

    move-object/from16 v16, v11

    move-object/from16 v11, v21

    move-object/from16 v5, v27

    goto/16 :goto_1e

    :catchall_4
    move-exception v5

    move-object/from16 v13, v19

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move/from16 v6, v22

    move-object/from16 v15, v20

    move-object v14, v5

    move-object/from16 v16, v11

    move-object/from16 v11, v21

    move-object/from16 v5, v27

    goto/16 :goto_1e

    :catchall_5
    move-exception v6

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move-object/from16 v16, v11

    move-object v14, v6

    move-object v15, v5

    move-object/from16 v11, v21

    move-object/from16 v5, v27

    move v6, v13

    move-object/from16 v13, v19

    goto/16 :goto_1e

    :catchall_6
    move-exception v5

    move-object/from16 v11, v21

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v7, v14

    move v6, v13

    move-object v14, v5

    move-object/from16 v13, v19

    move-object/from16 v16, v23

    move-object/from16 v5, v27

    move/from16 v33, v15

    move-object v15, v8

    move/from16 v8, v33

    goto/16 :goto_1e

    :catchall_7
    move-exception v5

    move-object/from16 v11, v21

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v7, v14

    move v6, v13

    move-object v14, v5

    move-object/from16 v13, v19

    move-object/from16 v16, v23

    move-object/from16 v5, v27

    move/from16 v33, v15

    move-object v15, v8

    move/from16 v8, v33

    goto/16 :goto_1e

    :catchall_8
    move-exception v5

    move-object/from16 v11, v21

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move v6, v13

    move-object v14, v5

    move-object/from16 v15, v26

    move-object/from16 v13, v19

    move-object/from16 v16, v23

    move-object/from16 v5, v27

    goto/16 :goto_1e

    :catchall_9
    move-exception v6

    move-object/from16 v11, v21

    move-object/from16 v13, v19

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move-object/from16 v15, v26

    move-object/from16 v16, v23

    move-object v14, v6

    move v6, v5

    move-object/from16 v5, v27

    goto/16 :goto_1e

    :catchall_a
    move-exception v7

    move-object v14, v7

    move-object/from16 v11, v21

    move-object/from16 v13, v19

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move-object/from16 v16, v23

    move-object/from16 v15, v26

    move v7, v5

    move-object/from16 v5, v27

    goto/16 :goto_1e

    :catchall_b
    move-exception v7

    move-object v14, v7

    move-object/from16 v11, v21

    move-object/from16 v13, v19

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move-object/from16 v16, v23

    move-object/from16 v15, v26

    move v7, v6

    move v6, v5

    move-object/from16 v5, v27

    goto/16 :goto_1e

    :catchall_c
    move-exception v8

    move-object v14, v8

    move-object/from16 v11, v21

    move-object/from16 v15, v26

    move-object/from16 v13, v19

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move-object/from16 v16, v23

    move v8, v7

    move v7, v6

    move v6, v5

    move-object/from16 v5, v27

    goto/16 :goto_1e

    :catchall_d
    move-exception v8

    move-object/from16 v11, v21

    move-object/from16 v13, v19

    move-object/from16 v16, v23

    move/from16 v10, v18

    move-object v12, v5

    move v9, v6

    move-object/from16 v5, v27

    move v6, v7

    move v7, v14

    move-object v14, v8

    move v8, v15

    move-object/from16 v15, v26

    goto/16 :goto_1e

    :catchall_e
    move-exception v5

    move-object/from16 v11, v21

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move v6, v13

    move-object v14, v5

    move-object/from16 v15, v26

    move-object v13, v10

    move-object/from16 v16, v23

    move/from16 v10, v18

    move-object/from16 v5, v27

    goto/16 :goto_1e

    :catchall_f
    move-exception v6

    move-object/from16 v11, v21

    move-object v13, v10

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move/from16 v10, v18

    move-object v14, v6

    move-object/from16 v15, v26

    move-object/from16 v16, v23

    move v6, v5

    move-object/from16 v5, v27

    goto/16 :goto_1e

    :catchall_10
    move-exception v5

    move-object/from16 v11, v21

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move-object/from16 v16, v6

    move-object v14, v5

    move-object/from16 v15, v26

    move-object/from16 v5, v27

    move v6, v13

    move-object v13, v10

    move/from16 v10, v18

    goto/16 :goto_1e

    :catchall_11
    move-exception v7

    move-object/from16 v11, v21

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move-object/from16 v16, v6

    move-object v15, v5

    move-object/from16 v5, v27

    move v6, v13

    move-object v13, v10

    move/from16 v10, v18

    move/from16 v33, v14

    move-object v14, v7

    move/from16 v7, v33

    goto/16 :goto_1e

    :catchall_12
    move-exception v5

    move-object/from16 v11, v21

    move/from16 v10, v18

    move-object/from16 v12, v17

    move v6, v13

    move-object v13, v8

    move v8, v15

    move-object v15, v7

    move v7, v14

    move-object v14, v5

    move-object/from16 v5, v27

    move/from16 v33, v16

    move-object/from16 v16, v9

    move/from16 v9, v33

    goto/16 :goto_1e

    :catchall_13
    move-exception v10

    move-object v14, v10

    move-object/from16 v11, v21

    move-object v13, v8

    move-object/from16 v12, v17

    move/from16 v10, v18

    move v8, v15

    move-object v15, v7

    move v7, v5

    move-object/from16 v5, v27

    move-object/from16 v33, v9

    move/from16 v9, v16

    move-object/from16 v16, v33

    goto/16 :goto_1e

    :catchall_14
    move-exception v5

    move-object/from16 v11, v21

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v7, v14

    move v6, v13

    move-object v14, v5

    move-object v13, v8

    move v8, v15

    move-object/from16 v5, v27

    move-object/from16 v15, v19

    move-object/from16 v33, v9

    move/from16 v9, v16

    move-object/from16 v16, v33

    goto/16 :goto_1e

    :catchall_15
    move-exception v7

    move-object v14, v7

    move-object/from16 v11, v21

    move-object v13, v8

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v8, v15

    move v7, v5

    move-object/from16 v5, v27

    move-object/from16 v15, v19

    move-object/from16 v33, v9

    move/from16 v9, v16

    move-object/from16 v16, v33

    goto/16 :goto_1e

    :catchall_16
    move-exception v5

    move-object/from16 v11, v21

    move-object v13, v8

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v7, v14

    move-object v14, v5

    move v8, v15

    move-object/from16 v15, v19

    move-object/from16 v5, v27

    move-object/from16 v33, v9

    move/from16 v9, v16

    move-object/from16 v16, v33

    goto/16 :goto_1e

    :catchall_17
    move-exception v5

    move-object/from16 v33, v5

    move-object v5, v11

    move-object v11, v14

    move-object/from16 v14, v33

    goto/16 :goto_1e

    .line 580
    :catch_f
    move-exception v5

    move-object/from16 v11, v27

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move-object/from16 v15, v20

    move-object/from16 v16, v6

    move-object/from16 v14, v21

    move v6, v13

    move-object/from16 v13, v19

    goto/16 :goto_1c

    :catch_10
    move-exception v5

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move v6, v13

    move-object/from16 v14, v21

    move-object/from16 v15, v20

    move-object/from16 v13, v19

    move-object/from16 v16, v11

    move-object/from16 v11, v27

    goto/16 :goto_1c

    :catch_11
    move-exception v5

    move-object/from16 v13, v19

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move/from16 v6, v22

    move-object/from16 v16, v11

    move-object/from16 v14, v21

    move-object/from16 v15, v20

    move-object/from16 v11, v27

    goto/16 :goto_1c

    :catch_12
    move-exception v6

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move-object/from16 v16, v11

    move-object/from16 v14, v21

    move-object v15, v5

    move-object v5, v6

    move-object/from16 v11, v27

    move v6, v13

    move-object/from16 v13, v19

    goto/16 :goto_1c

    :catch_13
    move-exception v5

    move-object/from16 v11, v27

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v7, v14

    move v6, v13

    move-object/from16 v13, v19

    move-object/from16 v16, v23

    move-object/from16 v14, v21

    move-object/from16 v33, v8

    move v8, v15

    move-object/from16 v15, v33

    goto/16 :goto_1c

    :catch_14
    move-exception v5

    move-object/from16 v11, v27

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v7, v14

    move v6, v13

    move-object/from16 v13, v19

    move-object/from16 v16, v23

    move-object/from16 v14, v21

    move-object/from16 v33, v8

    move v8, v15

    move-object/from16 v15, v33

    goto/16 :goto_1c

    :catch_15
    move-exception v5

    move-object/from16 v11, v27

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move v6, v13

    move-object/from16 v13, v19

    move-object/from16 v16, v23

    move-object/from16 v14, v21

    move-object/from16 v15, v26

    goto/16 :goto_1c

    :catch_16
    move-exception v6

    move-object/from16 v11, v27

    move-object/from16 v13, v19

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move-object/from16 v15, v26

    move-object/from16 v16, v23

    move-object/from16 v14, v21

    move-object/from16 v33, v6

    move v6, v5

    move-object/from16 v5, v33

    goto/16 :goto_1c

    :catch_17
    move-exception v7

    move-object/from16 v11, v27

    move-object/from16 v14, v21

    move-object/from16 v13, v19

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move-object/from16 v16, v23

    move-object/from16 v15, v26

    move-object/from16 v33, v7

    move v7, v5

    move-object/from16 v5, v33

    goto/16 :goto_1c

    :catch_18
    move-exception v7

    move-object/from16 v11, v27

    move-object/from16 v14, v21

    move-object/from16 v13, v19

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move-object/from16 v16, v23

    move-object/from16 v15, v26

    move-object/from16 v33, v7

    move v7, v6

    move v6, v5

    move-object/from16 v5, v33

    goto/16 :goto_1c

    :catch_19
    move-exception v8

    move-object/from16 v11, v27

    move-object/from16 v14, v21

    move-object/from16 v15, v26

    move-object/from16 v13, v19

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move-object/from16 v16, v23

    move-object/from16 v33, v8

    move v8, v7

    move v7, v6

    move v6, v5

    move-object/from16 v5, v33

    goto/16 :goto_1c

    :catch_1a
    move-exception v8

    move-object/from16 v11, v27

    move-object/from16 v13, v19

    move-object/from16 v16, v23

    move/from16 v10, v18

    move-object v12, v5

    move v9, v6

    move-object v5, v8

    move v6, v7

    move v8, v15

    move v7, v14

    move-object/from16 v14, v21

    move-object/from16 v15, v26

    goto/16 :goto_1c

    :catch_1b
    move-exception v5

    move-object/from16 v11, v27

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move v6, v13

    move-object/from16 v14, v21

    move-object/from16 v15, v26

    move-object v13, v10

    move-object/from16 v16, v23

    move/from16 v10, v18

    goto/16 :goto_1c

    :catch_1c
    move-exception v6

    move-object/from16 v11, v27

    move-object v13, v10

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move/from16 v10, v18

    move-object/from16 v14, v21

    move-object/from16 v15, v26

    move-object/from16 v16, v23

    move-object/from16 v33, v6

    move v6, v5

    move-object/from16 v5, v33

    goto/16 :goto_1c

    :catch_1d
    move-exception v5

    move-object/from16 v11, v27

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move-object/from16 v14, v21

    move-object/from16 v15, v26

    move-object/from16 v16, v6

    move v6, v13

    move-object v13, v10

    move/from16 v10, v18

    goto/16 :goto_1c

    :catch_1e
    move-exception v7

    move-object/from16 v11, v27

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move-object/from16 v16, v6

    move-object v15, v5

    move-object v5, v7

    move v6, v13

    move-object v13, v10

    move v7, v14

    move-object/from16 v14, v21

    move/from16 v10, v18

    goto/16 :goto_1c

    :catch_1f
    move-exception v5

    move-object/from16 v11, v27

    move/from16 v10, v18

    move-object/from16 v12, v17

    move v6, v13

    move-object v13, v8

    move v8, v15

    move-object v15, v7

    move v7, v14

    move-object/from16 v14, v21

    move/from16 v33, v16

    move-object/from16 v16, v9

    move/from16 v9, v33

    goto/16 :goto_1c

    :catch_20
    move-exception v10

    move-object/from16 v11, v27

    move-object/from16 v14, v21

    move-object v13, v8

    move-object/from16 v12, v17

    move v8, v15

    move-object v15, v7

    move v7, v5

    move-object v5, v10

    move/from16 v10, v18

    move-object/from16 v33, v9

    move/from16 v9, v16

    move-object/from16 v16, v33

    goto/16 :goto_1c

    :catch_21
    move-exception v5

    move-object/from16 v11, v27

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v7, v14

    move v6, v13

    move-object/from16 v14, v21

    move-object v13, v8

    move v8, v15

    move-object/from16 v15, v19

    move/from16 v33, v16

    move-object/from16 v16, v9

    move/from16 v9, v33

    goto/16 :goto_1c

    :catch_22
    move-exception v7

    move-object/from16 v11, v27

    move-object/from16 v14, v21

    move-object v13, v8

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v8, v15

    move-object/from16 v15, v19

    move-object/from16 v33, v7

    move v7, v5

    move-object/from16 v5, v33

    move-object/from16 v34, v9

    move/from16 v9, v16

    move-object/from16 v16, v34

    goto/16 :goto_1c

    :catch_23
    move-exception v5

    move-object/from16 v11, v27

    move-object v13, v8

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v7, v14

    move-object/from16 v14, v21

    move v8, v15

    move-object/from16 v15, v19

    move/from16 v33, v16

    move-object/from16 v16, v9

    move/from16 v9, v33

    goto/16 :goto_1c

    .line 574
    :catch_24
    move-exception v5

    move-object v11, v7

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move-object/from16 v15, v20

    move-object/from16 v16, v6

    move v7, v14

    move-object/from16 v14, v21

    move v6, v13

    move-object/from16 v13, v19

    goto/16 :goto_1a

    :catch_25
    move-exception v5

    move-object/from16 v11, v27

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move-object/from16 v15, v20

    move-object/from16 v16, v6

    move-object/from16 v14, v21

    move v6, v13

    move-object/from16 v13, v19

    goto/16 :goto_1a

    :catch_26
    move-exception v5

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move v6, v13

    move-object/from16 v14, v21

    move-object/from16 v15, v20

    move-object/from16 v13, v19

    move-object/from16 v16, v11

    move-object/from16 v11, v27

    goto/16 :goto_1a

    :catch_27
    move-exception v5

    move-object/from16 v13, v19

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move/from16 v6, v22

    move-object/from16 v16, v11

    move-object/from16 v14, v21

    move-object/from16 v15, v20

    move-object/from16 v11, v27

    goto/16 :goto_1a

    :catch_28
    move-exception v6

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move-object/from16 v16, v11

    move-object/from16 v14, v21

    move-object v15, v5

    move-object v5, v6

    move-object/from16 v11, v27

    move v6, v13

    move-object/from16 v13, v19

    goto/16 :goto_1a

    :catch_29
    move-exception v5

    move-object/from16 v11, v27

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v7, v14

    move v6, v13

    move-object/from16 v13, v19

    move-object/from16 v16, v23

    move-object/from16 v14, v21

    move-object/from16 v33, v8

    move v8, v15

    move-object/from16 v15, v33

    goto/16 :goto_1a

    :catch_2a
    move-exception v5

    move-object/from16 v11, v27

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v7, v14

    move v6, v13

    move-object/from16 v13, v19

    move-object/from16 v16, v23

    move-object/from16 v14, v21

    move-object/from16 v33, v8

    move v8, v15

    move-object/from16 v15, v33

    goto/16 :goto_1a

    :catch_2b
    move-exception v5

    move-object/from16 v11, v27

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move v6, v13

    move-object/from16 v13, v19

    move-object/from16 v16, v23

    move-object/from16 v14, v21

    move-object/from16 v15, v26

    goto/16 :goto_1a

    :catch_2c
    move-exception v6

    move-object/from16 v11, v27

    move-object/from16 v13, v19

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move-object/from16 v15, v26

    move-object/from16 v16, v23

    move-object/from16 v14, v21

    move-object/from16 v33, v6

    move v6, v5

    move-object/from16 v5, v33

    goto/16 :goto_1a

    :catch_2d
    move-exception v7

    move-object/from16 v11, v27

    move-object/from16 v14, v21

    move-object/from16 v13, v19

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move-object/from16 v16, v23

    move-object/from16 v15, v26

    move-object/from16 v33, v7

    move v7, v5

    move-object/from16 v5, v33

    goto/16 :goto_1a

    :catch_2e
    move-exception v7

    move-object/from16 v11, v27

    move-object/from16 v14, v21

    move-object/from16 v13, v19

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move-object/from16 v16, v23

    move-object/from16 v15, v26

    move-object/from16 v33, v7

    move v7, v6

    move v6, v5

    move-object/from16 v5, v33

    goto/16 :goto_1a

    :catch_2f
    move-exception v8

    move-object/from16 v11, v27

    move-object/from16 v14, v21

    move-object/from16 v15, v26

    move-object/from16 v13, v19

    move/from16 v10, v18

    move-object/from16 v12, v17

    move/from16 v9, v16

    move-object/from16 v16, v23

    move-object/from16 v33, v8

    move v8, v7

    move v7, v6

    move v6, v5

    move-object/from16 v5, v33

    goto/16 :goto_1a

    :catch_30
    move-exception v8

    move-object/from16 v11, v27

    move-object/from16 v13, v19

    move-object/from16 v16, v23

    move/from16 v10, v18

    move-object v12, v5

    move v9, v6

    move-object v5, v8

    move v6, v7

    move v8, v15

    move v7, v14

    move-object/from16 v14, v21

    move-object/from16 v15, v26

    goto/16 :goto_1a

    :catch_31
    move-exception v5

    move-object/from16 v11, v27

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move v6, v13

    move-object/from16 v14, v21

    move-object/from16 v15, v26

    move-object v13, v10

    move-object/from16 v16, v23

    move/from16 v10, v18

    goto/16 :goto_1a

    :catch_32
    move-exception v6

    move-object/from16 v11, v27

    move-object v13, v10

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move/from16 v10, v18

    move-object/from16 v14, v21

    move-object/from16 v15, v26

    move-object/from16 v16, v23

    move-object/from16 v33, v6

    move v6, v5

    move-object/from16 v5, v33

    goto/16 :goto_1a

    :catch_33
    move-exception v5

    move-object/from16 v11, v27

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move v7, v14

    move-object/from16 v14, v21

    move-object/from16 v15, v26

    move-object/from16 v16, v6

    move v6, v13

    move-object v13, v10

    move/from16 v10, v18

    goto/16 :goto_1a

    :catch_34
    move-exception v7

    move-object/from16 v11, v27

    move-object/from16 v12, v17

    move/from16 v9, v16

    move v8, v15

    move-object/from16 v16, v6

    move-object v15, v5

    move-object v5, v7

    move v6, v13

    move-object v13, v10

    move v7, v14

    move-object/from16 v14, v21

    move/from16 v10, v18

    goto/16 :goto_1a

    :catch_35
    move-exception v5

    move-object/from16 v11, v27

    move/from16 v10, v18

    move-object/from16 v12, v17

    move v6, v13

    move-object v13, v8

    move v8, v15

    move-object v15, v7

    move v7, v14

    move-object/from16 v14, v21

    move/from16 v33, v16

    move-object/from16 v16, v9

    move/from16 v9, v33

    goto/16 :goto_1a

    :catch_36
    move-exception v10

    move-object/from16 v11, v27

    move-object/from16 v14, v21

    move-object v13, v8

    move-object/from16 v12, v17

    move v8, v15

    move-object v15, v7

    move v7, v5

    move-object v5, v10

    move/from16 v10, v18

    move-object/from16 v33, v9

    move/from16 v9, v16

    move-object/from16 v16, v33

    goto/16 :goto_1a

    :catch_37
    move-exception v5

    move-object/from16 v11, v27

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v7, v14

    move v6, v13

    move-object/from16 v14, v21

    move-object v13, v8

    move v8, v15

    move-object/from16 v15, v19

    move/from16 v33, v16

    move-object/from16 v16, v9

    move/from16 v9, v33

    goto/16 :goto_1a

    :catch_38
    move-exception v7

    move-object/from16 v11, v27

    move-object/from16 v14, v21

    move-object v13, v8

    move/from16 v10, v20

    move-object/from16 v12, v17

    move v8, v15

    move-object/from16 v15, v19

    move-object/from16 v33, v7

    move v7, v5

    move-object/from16 v5, v33

    move-object/from16 v34, v9

    move/from16 v9, v16

    move-object/from16 v16, v34

    goto/16 :goto_1a

    .line 556
    :catchall_18
    move-exception v6

    move-object/from16 v33, v6

    move v6, v5

    move-object/from16 v5, v33

    goto/16 :goto_19

    :catchall_19
    move-exception v5

    goto/16 :goto_19

    :catch_39
    move-exception v7

    move v7, v15

    goto/16 :goto_5

    :catch_3a
    move-exception v8

    goto/16 :goto_5

    :cond_4d
    move-object/from16 v11, v16

    goto/16 :goto_8

    :cond_4e
    move-object/from16 v11, v16

    goto/16 :goto_8

    :cond_4f
    move-object/from16 v24, v6

    goto/16 :goto_13

    :cond_50
    move-object/from16 v5, v24

    goto/16 :goto_12

    :cond_51
    move-object/from16 v19, v5

    goto/16 :goto_11

    :cond_52
    move-object/from16 v10, v19

    goto/16 :goto_10

    :cond_53
    move-object v9, v12

    goto/16 :goto_f

    :cond_54
    move-object v8, v9

    goto/16 :goto_e

    :cond_55
    move-object/from16 v7, v26

    move-object/from16 v8, v19

    move-object/from16 v9, v23

    goto/16 :goto_15

    :cond_56
    move v7, v15

    goto/16 :goto_5

    :cond_57
    move-object v7, v10

    goto/16 :goto_a

    :cond_58
    move-object/from16 v5, v23

    move-object v6, v10

    move v7, v8

    move-object/from16 v8, v20

    move-object/from16 v23, v11

    move/from16 v20, v26

    goto/16 :goto_3
.end method
