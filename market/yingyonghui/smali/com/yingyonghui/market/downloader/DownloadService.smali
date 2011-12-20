.class public Lcom/yingyonghui/market/downloader/DownloadService;
.super Landroid/app/Service;
.source "DownloadService.java"


# instance fields
.field private a:Lcom/yingyonghui/market/downloader/b;

.field private b:Lcom/yingyonghui/market/downloader/e;

.field private c:Ljava/util/ArrayList;

.field private d:Lcom/yingyonghui/market/downloader/o;

.field private e:Z

.field private f:Landroid/database/CharArrayBuffer;

.field private g:Landroid/database/CharArrayBuffer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 184
    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/downloader/DownloadService;IJ)J
    .locals 5
    .parameter
    .parameter
    .parameter

    .prologue
    const-wide/16 v3, 0x0

    .line 41
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/yingyonghui/market/downloader/h;

    iget v0, p0, Lcom/yingyonghui/market/downloader/h;->j:I

    invoke-static {v0}, Lcom/yingyonghui/market/downloader/a;->c(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0

    :cond_0
    iget v0, p0, Lcom/yingyonghui/market/downloader/h;->j:I

    const/16 v1, 0xc1

    if-eq v0, v1, :cond_1

    move-wide v0, v3

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/yingyonghui/market/downloader/h;->k:I

    if-nez v0, :cond_2

    move-wide v0, v3

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/yingyonghui/market/downloader/h;->a()J

    move-result-wide v0

    cmp-long v2, v0, p2

    if-gtz v2, :cond_3

    move-wide v0, v3

    goto :goto_0

    :cond_3
    sub-long/2addr v0, p2

    goto :goto_0
.end method

.method private a(Ljava/lang/String;Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v6, 0x0

    .line 664
    invoke-interface {p2, p3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    .line 665
    if-nez p1, :cond_0

    .line 666
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 687
    :goto_0
    return-object v0

    .line 668
    :cond_0
    iget-object v1, p0, Lcom/yingyonghui/market/downloader/DownloadService;->g:Landroid/database/CharArrayBuffer;

    if-nez v1, :cond_1

    .line 669
    new-instance v1, Landroid/database/CharArrayBuffer;

    const/16 v2, 0x80

    invoke-direct {v1, v2}, Landroid/database/CharArrayBuffer;-><init>(I)V

    iput-object v1, p0, Lcom/yingyonghui/market/downloader/DownloadService;->g:Landroid/database/CharArrayBuffer;

    .line 671
    :cond_1
    iget-object v1, p0, Lcom/yingyonghui/market/downloader/DownloadService;->g:Landroid/database/CharArrayBuffer;

    invoke-interface {p2, v0, v1}, Landroid/database/Cursor;->copyStringToBuffer(ILandroid/database/CharArrayBuffer;)V

    .line 672
    iget-object v1, p0, Lcom/yingyonghui/market/downloader/DownloadService;->g:Landroid/database/CharArrayBuffer;

    iget v1, v1, Landroid/database/CharArrayBuffer;->sizeCopied:I

    .line 673
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v1, v2, :cond_2

    .line 674
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 676
    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->f:Landroid/database/CharArrayBuffer;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->f:Landroid/database/CharArrayBuffer;

    iget v0, v0, Landroid/database/CharArrayBuffer;->sizeCopied:I

    if-ge v0, v1, :cond_4

    .line 677
    :cond_3
    new-instance v0, Landroid/database/CharArrayBuffer;

    invoke-direct {v0, v1}, Landroid/database/CharArrayBuffer;-><init>(I)V

    iput-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->f:Landroid/database/CharArrayBuffer;

    .line 679
    :cond_4
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->f:Landroid/database/CharArrayBuffer;

    iget-object v0, v0, Landroid/database/CharArrayBuffer;->data:[C

    .line 680
    iget-object v2, p0, Lcom/yingyonghui/market/downloader/DownloadService;->g:Landroid/database/CharArrayBuffer;

    iget-object v2, v2, Landroid/database/CharArrayBuffer;->data:[C

    .line 681
    invoke-virtual {p1, v6, v1, v0, v6}, Ljava/lang/String;->getChars(II[CI)V

    .line 682
    const/4 v3, 0x1

    sub-int v3, v1, v3

    :goto_1
    if-ltz v3, :cond_6

    .line 683
    aget-char v4, v0, v3

    aget-char v5, v2, v3

    if-eq v4, v5, :cond_5

    .line 684
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2, v6, v1}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    .line 682
    :cond_5
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    :cond_6
    move-object v0, p1

    .line 687
    goto :goto_0
.end method

.method private a()V
    .locals 1

    .prologue
    .line 174
    monitor-enter p0

    .line 175
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->e:Z

    .line 176
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->d:Lcom/yingyonghui/market/downloader/o;

    if-nez v0, :cond_0

    .line 177
    new-instance v0, Lcom/yingyonghui/market/downloader/o;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/downloader/o;-><init>(Lcom/yingyonghui/market/downloader/DownloadService;)V

    iput-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->d:Lcom/yingyonghui/market/downloader/o;

    .line 178
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->d:Lcom/yingyonghui/market/downloader/o;

    invoke-virtual {v0}, Lcom/yingyonghui/market/downloader/o;->start()V

    .line 180
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

.method static synthetic a(Lcom/yingyonghui/market/downloader/DownloadService;)V
    .locals 0
    .parameter

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/yingyonghui/market/downloader/DownloadService;->a()V

    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/downloader/DownloadService;I)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 41
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/downloader/h;

    iget v1, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    const/16 v2, 0xc0

    if-ne v1, v2, :cond_1

    const/16 v1, 0x1ea

    iput v1, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/yingyonghui/market/downloader/DownloadService;->b:Lcom/yingyonghui/market/downloader/e;

    iget-object v1, v1, Lcom/yingyonghui/market/downloader/e;->a:Landroid/app/NotificationManager;

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->a:I

    invoke-virtual {v1, v0}, Landroid/app/NotificationManager;->cancel(I)V

    iget-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    return-void

    :cond_1
    iget v1, v0, Lcom/yingyonghui/market/downloader/h;->g:I

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/yingyonghui/market/downloader/h;->e:Ljava/lang/String;

    if-eqz v1, :cond_0

    new-instance v1, Ljava/io/File;

    iget-object v2, v0, Lcom/yingyonghui/market/downloader/h;->e:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_0
.end method

.method static synthetic a(Lcom/yingyonghui/market/downloader/DownloadService;Landroid/database/Cursor;IZZJ)V
    .locals 30
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 41
    const-string v5, "status"

    move-object/from16 v0, p1

    move-object v1, v5

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v15

    const-string v5, "numfailed"

    move-object/from16 v0, p1

    move-object v1, v5

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v16

    const-string v5, "method"

    move-object/from16 v0, p1

    move-object v1, v5

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p1

    move v1, v5

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v18

    new-instance v5, Lcom/yingyonghui/market/downloader/h;

    const-string v6, "_id"

    move-object/from16 v0, p1

    move-object v1, v6

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    move-object/from16 v0, p1

    move v1, v6

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    const-string v7, "uri"

    move-object/from16 v0, p1

    move-object v1, v7

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    move-object/from16 v0, p1

    move v1, v7

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const-string v8, "no_integrity"

    move-object/from16 v0, p1

    move-object v1, v8

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v8

    move-object/from16 v0, p1

    move v1, v8

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_2

    const/4 v8, 0x1

    :goto_0
    const-string v9, "hint"

    move-object/from16 v0, p1

    move-object v1, v9

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    move-object/from16 v0, p1

    move v1, v9

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    const-string v10, "_data"

    move-object/from16 v0, p1

    move-object v1, v10

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v10

    move-object/from16 v0, p1

    move v1, v10

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    const-string v11, "mimetype"

    move-object/from16 v0, p1

    move-object v1, v11

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v11

    move-object/from16 v0, p1

    move v1, v11

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    const-string v12, "destination"

    move-object/from16 v0, p1

    move-object v1, v12

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v12

    move-object/from16 v0, p1

    move v1, v12

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    const-string v13, "visibility"

    move-object/from16 v0, p1

    move-object v1, v13

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    move v1, v13

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    const-string v14, "control"

    move-object/from16 v0, p1

    move-object v1, v14

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v14

    move-object/from16 v0, p1

    move v1, v14

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    move-object/from16 v0, p1

    move v1, v15

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v16

    const v17, 0xfffffff

    and-int v17, v17, v18

    shr-int/lit8 v18, v18, 0x1c

    const-string v19, "lastmod"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v19

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v19

    const-string v21, "notificationpackage"

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v21

    move-object/from16 v0, p1

    move/from16 v1, v21

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v21

    const-string v22, "notificationclass"

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v22

    move-object/from16 v0, p1

    move/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    const-string v23, "notificationextras"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v23

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v23

    const-string v24, "cookiedata"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v24

    const-string v25, "useragent"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v25

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v25

    const-string v26, "referer"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v26

    move-object/from16 v0, p1

    move/from16 v1, v26

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v26

    const-string v27, "total_bytes"

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v27

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v27

    const-string v28, "current_bytes"

    move-object/from16 v0, p1

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v28

    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v28

    const-string v29, "etag"

    move-object/from16 v0, p1

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v29

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v29

    invoke-direct/range {v5 .. v29}, Lcom/yingyonghui/market/downloader/h;-><init>(ILjava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIIIIIJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/DownloadService;->c:Ljava/util/ArrayList;

    move-object/from16 p1, v0

    move-object/from16 v0, p1

    move/from16 v1, p2

    move-object v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    move/from16 p1, v0

    if-nez p1, :cond_3

    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->g:I

    move/from16 p1, v0

    if-eqz p1, :cond_0

    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->g:I

    move/from16 p1, v0

    const/16 p2, 0x2

    move/from16 v0, p1

    move/from16 v1, p2

    if-ne v0, v1, :cond_3

    :cond_0
    move-object v0, v5

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/h;->f:Ljava/lang/String;

    move-object/from16 p1, v0

    if-eqz p1, :cond_3

    new-instance p1, Landroid/content/Intent;

    const-string p2, "android.intent.action.VIEW"

    invoke-direct/range {p1 .. p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string p2, "file"

    const-string v6, ""

    const/4 v7, 0x0

    move-object/from16 v0, p2

    move-object v1, v6

    move-object v2, v7

    invoke-static {v0, v1, v2}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    iget-object v6, v5, Lcom/yingyonghui/market/downloader/h;->f:Ljava/lang/String;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object v2, v6

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual/range {p0 .. p0}, Lcom/yingyonghui/market/downloader/DownloadService;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p2

    const/high16 v6, 0x1

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    move v2, v6

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object p1

    if-nez p1, :cond_3

    const-string p1, "DownloadManager"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct/range {p2 .. p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "no application to handle MIME type "

    invoke-virtual/range {p2 .. p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    move-object v0, v5

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/h;->f:Ljava/lang/String;

    move-object/from16 p3, v0

    invoke-virtual/range {p2 .. p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual/range {p2 .. p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static/range {p1 .. p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 p1, 0x196

    move/from16 v0, p1

    move-object v1, v5

    iput v0, v1, Lcom/yingyonghui/market/downloader/h;->j:I

    sget-object p1, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->a:I

    move/from16 p2, v0

    move/from16 v0, p2

    int-to-long v0, v0

    move-wide/from16 p2, v0

    invoke-static/range {p1 .. p3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p1

    new-instance p2, Landroid/content/ContentValues;

    invoke-direct/range {p2 .. p2}, Landroid/content/ContentValues;-><init>()V

    const-string p3, "status"

    const/16 p4, 0x196

    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual/range {p2 .. p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual/range {p0 .. p0}, Lcom/yingyonghui/market/downloader/DownloadService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p3

    const/16 p4, 0x0

    const/16 p5, 0x0

    move-object/from16 v0, p3

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-object v0, v5

    move-object/from16 v1, p1

    move-object/from16 v2, p0

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/downloader/h;->a(Landroid/net/Uri;Landroid/content/Context;)V

    :cond_1
    :goto_1
    return-void

    :cond_2
    const/4 v8, 0x0

    goto/16 :goto_0

    :cond_3
    move-object v0, v5

    move/from16 v1, p3

    move/from16 v2, p4

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/downloader/h;->a(ZZ)Z

    move-result p1

    if-eqz p1, :cond_b

    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->i:I

    move/from16 p1, v0

    const/16 p2, 0x1

    move/from16 v0, p1

    move/from16 v1, p2

    if-eq v0, v1, :cond_8

    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    move/from16 p1, v0

    if-nez p1, :cond_4

    const/16 p1, 0x1

    :goto_2
    if-eqz p1, :cond_1

    move-object v0, v5

    iget-boolean v0, v0, Lcom/yingyonghui/market/downloader/h;->w:Z

    move/from16 p1, v0

    if-eqz p1, :cond_9

    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Multiple threads on same download on insert"

    invoke-direct/range {p0 .. p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_4
    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    move/from16 p1, v0

    const/16 p2, 0xbe

    move/from16 v0, p1

    move/from16 v1, p2

    if-ne v0, v1, :cond_5

    const/16 p1, 0x1

    goto :goto_2

    :cond_5
    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    move/from16 p1, v0

    const/16 p2, 0xc0

    move/from16 v0, p1

    move/from16 v1, p2

    if-ne v0, v1, :cond_6

    const/16 p1, 0x1

    goto :goto_2

    :cond_6
    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    move/from16 p1, v0

    const/16 p2, 0xc1

    move/from16 v0, p1

    move/from16 v1, p2

    if-ne v0, v1, :cond_8

    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->k:I

    move/from16 p1, v0

    if-nez p1, :cond_7

    const/16 p1, 0x1

    goto :goto_2

    :cond_7
    invoke-virtual {v5}, Lcom/yingyonghui/market/downloader/h;->a()J

    move-result-wide p1

    cmp-long p1, p1, p5

    if-gez p1, :cond_8

    const/16 p1, 0x1

    goto :goto_2

    :cond_8
    const/16 p1, 0x0

    goto :goto_2

    :cond_9
    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    move/from16 p1, v0

    const/16 p2, 0xc0

    move/from16 v0, p1

    move/from16 v1, p2

    if-eq v0, v1, :cond_a

    const/16 p1, 0xc0

    move/from16 v0, p1

    move-object v1, v5

    iput v0, v1, Lcom/yingyonghui/market/downloader/h;->j:I

    new-instance p1, Landroid/content/ContentValues;

    invoke-direct/range {p1 .. p1}, Landroid/content/ContentValues;-><init>()V

    const-string p2, "status"

    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    move/from16 p3, v0

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual/range {p1 .. p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual/range {p0 .. p0}, Lcom/yingyonghui/market/downloader/DownloadService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object p3, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->a:I

    move/from16 p4, v0

    move/from16 v0, p4

    int-to-long v0, v0

    move-wide/from16 p4, v0

    invoke-static/range {p3 .. p5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p3

    const/16 p4, 0x0

    const/16 p5, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p1

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_a
    new-instance p1, Lcom/yingyonghui/market/downloader/g;

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object v2, v5

    invoke-direct {v0, v1, v2}, Lcom/yingyonghui/market/downloader/g;-><init>(Landroid/content/Context;Lcom/yingyonghui/market/downloader/h;)V

    const/16 p0, 0x1

    move/from16 v0, p0

    move-object v1, v5

    iput-boolean v0, v1, Lcom/yingyonghui/market/downloader/h;->w:Z

    invoke-virtual/range {p1 .. p1}, Lcom/yingyonghui/market/downloader/g;->start()V

    goto/16 :goto_1

    :cond_b
    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    move/from16 p1, v0

    if-eqz p1, :cond_c

    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    move/from16 p1, v0

    const/16 p2, 0xbe

    move/from16 v0, p1

    move/from16 v1, p2

    if-eq v0, v1, :cond_c

    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    move/from16 p1, v0

    const/16 p2, 0xc0

    move/from16 v0, p1

    move/from16 v1, p2

    if-ne v0, v1, :cond_1

    :cond_c
    const/16 p1, 0xc1

    move/from16 v0, p1

    move-object v1, v5

    iput v0, v1, Lcom/yingyonghui/market/downloader/h;->j:I

    sget-object p1, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    move-object v0, v5

    iget v0, v0, Lcom/yingyonghui/market/downloader/h;->a:I

    move/from16 p2, v0

    move/from16 v0, p2

    int-to-long v0, v0

    move-wide/from16 p2, v0

    invoke-static/range {p1 .. p3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p1

    new-instance p2, Landroid/content/ContentValues;

    invoke-direct/range {p2 .. p2}, Landroid/content/ContentValues;-><init>()V

    const-string p3, "status"

    const/16 p4, 0xc1

    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual/range {p2 .. p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual/range {p0 .. p0}, Lcom/yingyonghui/market/downloader/DownloadService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const/16 p3, 0x0

    const/16 p4, 0x0

    invoke-virtual/range {p0 .. p4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto/16 :goto_1
.end method

.method static synthetic b(Lcom/yingyonghui/market/downloader/DownloadService;)Lcom/yingyonghui/market/downloader/o;
    .locals 1
    .parameter

    .prologue
    .line 41
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->d:Lcom/yingyonghui/market/downloader/o;

    return-object v0
.end method

.method private b()V
    .locals 8

    .prologue
    const/4 v3, 0x0

    const/4 v7, 0x0

    .line 385
    invoke-static {}, Landroid/os/Environment;->getDownloadCacheDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 386
    if-nez v0, :cond_1

    .line 420
    :cond_0
    return-void

    .line 391
    :cond_1
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    move v1, v7

    .line 392
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_3

    .line 393
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v4, "lost+found"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 394
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v4, "recovery"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 397
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 392
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 402
    :cond_3
    invoke-virtual {p0}, Lcom/yingyonghui/market/downloader/DownloadService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v4, "_data"

    aput-object v4, v2, v7

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 404
    if-eqz v0, :cond_6

    .line 405
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 407
    :cond_4
    invoke-interface {v0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 408
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_4

    .line 410
    :cond_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 412
    :cond_6
    invoke-virtual {v6}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 413
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 414
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    .line 418
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_1
.end method

.method static synthetic b(Lcom/yingyonghui/market/downloader/DownloadService;Landroid/database/Cursor;IZZJ)V
    .locals 9
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 41
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/downloader/h;

    const-string v1, "status"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    const-string v2, "numfailed"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    const-string v3, "_id"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, v0, Lcom/yingyonghui/market/downloader/h;->a:I

    iget-object v3, v0, Lcom/yingyonghui/market/downloader/h;->b:Ljava/lang/String;

    const-string v4, "uri"

    invoke-direct {p0, v3, p1, v4}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Ljava/lang/String;Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/yingyonghui/market/downloader/h;->b:Ljava/lang/String;

    const-string v3, "no_integrity"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    if-ne v3, v6, :cond_2

    move v3, v6

    :goto_0
    iput-boolean v3, v0, Lcom/yingyonghui/market/downloader/h;->c:Z

    iget-object v3, v0, Lcom/yingyonghui/market/downloader/h;->d:Ljava/lang/String;

    const-string v4, "hint"

    invoke-direct {p0, v3, p1, v4}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Ljava/lang/String;Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/yingyonghui/market/downloader/h;->d:Ljava/lang/String;

    iget-object v3, v0, Lcom/yingyonghui/market/downloader/h;->e:Ljava/lang/String;

    const-string v4, "_data"

    invoke-direct {p0, v3, p1, v4}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Ljava/lang/String;Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/yingyonghui/market/downloader/h;->e:Ljava/lang/String;

    iget-object v3, v0, Lcom/yingyonghui/market/downloader/h;->f:Ljava/lang/String;

    const-string v4, "mimetype"

    invoke-direct {p0, v3, p1, v4}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Ljava/lang/String;Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/yingyonghui/market/downloader/h;->f:Ljava/lang/String;

    const-string v3, "destination"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, v0, Lcom/yingyonghui/market/downloader/h;->g:I

    const-string v3, "visibility"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iget v4, v0, Lcom/yingyonghui/market/downloader/h;->h:I

    if-ne v4, v6, :cond_0

    if-eq v3, v6, :cond_0

    iget v4, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    invoke-static {v4}, Lcom/yingyonghui/market/downloader/a;->c(I)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/yingyonghui/market/downloader/DownloadService;->b:Lcom/yingyonghui/market/downloader/e;

    iget-object v4, v4, Lcom/yingyonghui/market/downloader/e;->a:Landroid/app/NotificationManager;

    iget v5, v0, Lcom/yingyonghui/market/downloader/h;->a:I

    invoke-virtual {v4, v5}, Landroid/app/NotificationManager;->cancel(I)V

    :cond_0
    iput v3, v0, Lcom/yingyonghui/market/downloader/h;->h:I

    monitor-enter v0

    :try_start_0
    const-string v3, "control"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, v0, Lcom/yingyonghui/market/downloader/h;->i:I

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iget v3, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    invoke-static {v3}, Lcom/yingyonghui/market/downloader/a;->c(I)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-static {v1}, Lcom/yingyonghui/market/downloader/a;->c(I)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/yingyonghui/market/downloader/DownloadService;->b:Lcom/yingyonghui/market/downloader/e;

    iget-object v3, v3, Lcom/yingyonghui/market/downloader/e;->a:Landroid/app/NotificationManager;

    iget v4, v0, Lcom/yingyonghui/market/downloader/h;->a:I

    invoke-virtual {v3, v4}, Landroid/app/NotificationManager;->cancel(I)V

    :cond_1
    iput v1, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lcom/yingyonghui/market/downloader/h;->k:I

    const-string v1, "method"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const v2, 0xfffffff

    and-int/2addr v2, v1

    iput v2, v0, Lcom/yingyonghui/market/downloader/h;->l:I

    shr-int/lit8 v1, v1, 0x1c

    iput v1, v0, Lcom/yingyonghui/market/downloader/h;->m:I

    const-string v1, "lastmod"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iput-wide v1, v0, Lcom/yingyonghui/market/downloader/h;->n:J

    iget-object v1, v0, Lcom/yingyonghui/market/downloader/h;->o:Ljava/lang/String;

    const-string v2, "notificationpackage"

    invoke-direct {p0, v1, p1, v2}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Ljava/lang/String;Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/yingyonghui/market/downloader/h;->o:Ljava/lang/String;

    iget-object v1, v0, Lcom/yingyonghui/market/downloader/h;->p:Ljava/lang/String;

    const-string v2, "notificationclass"

    invoke-direct {p0, v1, p1, v2}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Ljava/lang/String;Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/yingyonghui/market/downloader/h;->p:Ljava/lang/String;

    iget-object v1, v0, Lcom/yingyonghui/market/downloader/h;->q:Ljava/lang/String;

    const-string v2, "cookiedata"

    invoke-direct {p0, v1, p1, v2}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Ljava/lang/String;Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/yingyonghui/market/downloader/h;->q:Ljava/lang/String;

    iget-object v1, v0, Lcom/yingyonghui/market/downloader/h;->r:Ljava/lang/String;

    const-string v2, "useragent"

    invoke-direct {p0, v1, p1, v2}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Ljava/lang/String;Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/yingyonghui/market/downloader/h;->r:Ljava/lang/String;

    iget-object v1, v0, Lcom/yingyonghui/market/downloader/h;->s:Ljava/lang/String;

    const-string v2, "referer"

    invoke-direct {p0, v1, p1, v2}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Ljava/lang/String;Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/yingyonghui/market/downloader/h;->s:Ljava/lang/String;

    const-string v1, "total_bytes"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lcom/yingyonghui/market/downloader/h;->t:I

    const-string v1, "current_bytes"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lcom/yingyonghui/market/downloader/h;->u:I

    iget-object v1, v0, Lcom/yingyonghui/market/downloader/h;->v:Ljava/lang/String;

    const-string v2, "etag"

    invoke-direct {p0, v1, p1, v2}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Ljava/lang/String;Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/yingyonghui/market/downloader/h;->v:Ljava/lang/String;

    invoke-virtual {v0, p3, p4}, Lcom/yingyonghui/market/downloader/h;->a(ZZ)Z

    move-result v1

    if-eqz v1, :cond_8

    iget v1, v0, Lcom/yingyonghui/market/downloader/h;->i:I

    if-eq v1, v6, :cond_6

    iget v1, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    if-nez v1, :cond_3

    move v1, v6

    :goto_1
    if-eqz v1, :cond_8

    iget-boolean v1, v0, Lcom/yingyonghui/market/downloader/h;->w:Z

    if-eqz v1, :cond_7

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Multiple threads on same download on update"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    move v3, v7

    goto/16 :goto_0

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :cond_3
    iget v1, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    const/16 v2, 0xbe

    if-ne v1, v2, :cond_4

    move v1, v6

    goto :goto_1

    :cond_4
    iget v1, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    const/16 v2, 0xc1

    if-ne v1, v2, :cond_6

    iget v1, v0, Lcom/yingyonghui/market/downloader/h;->k:I

    if-nez v1, :cond_5

    move v1, v6

    goto :goto_1

    :cond_5
    invoke-virtual {v0}, Lcom/yingyonghui/market/downloader/h;->a()J

    move-result-wide v1

    cmp-long v1, v1, p5

    if-gez v1, :cond_6

    move v1, v6

    goto :goto_1

    :cond_6
    move v1, v7

    goto :goto_1

    :cond_7
    const/16 v1, 0xc0

    iput v1, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "status"

    iget v3, v0, Lcom/yingyonghui/market/downloader/h;->j:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual {p0}, Lcom/yingyonghui/market/downloader/DownloadService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    iget v4, v0, Lcom/yingyonghui/market/downloader/h;->a:I

    int-to-long v4, v4

    invoke-static {v3, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3, v1, v8, v8}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    new-instance v1, Lcom/yingyonghui/market/downloader/g;

    invoke-direct {v1, p0, v0}, Lcom/yingyonghui/market/downloader/g;-><init>(Landroid/content/Context;Lcom/yingyonghui/market/downloader/h;)V

    iput-boolean v6, v0, Lcom/yingyonghui/market/downloader/h;->w:Z

    invoke-virtual {v1}, Lcom/yingyonghui/market/downloader/g;->start()V

    :cond_8
    return-void
.end method

.method static synthetic b(Lcom/yingyonghui/market/downloader/DownloadService;I)Z
    .locals 2
    .parameter
    .parameter

    .prologue
    const/4 v1, 0x1

    .line 41
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/yingyonghui/market/downloader/h;

    iget v0, p0, Lcom/yingyonghui/market/downloader/h;->j:I

    invoke-static {v0}, Lcom/yingyonghui/market/downloader/a;->c(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/yingyonghui/market/downloader/h;->h:I

    if-ne v0, v1, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private c()V
    .locals 8

    .prologue
    const/4 v4, 0x0

    .line 426
    invoke-virtual {p0}, Lcom/yingyonghui/market/downloader/DownloadService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v3

    const-string v3, "status >= \'200\'"

    const-string v5, "lastmod"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 430
    if-nez v0, :cond_0

    .line 432
    const-string v0, "DownloadManager"

    const-string v1, "null cursor in trimDatabase"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 449
    :goto_0
    return-void

    .line 435
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 436
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    const/16 v2, 0x3e8

    sub-int/2addr v1, v2

    .line 437
    const-string v2, "_id"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    .line 438
    :goto_1
    if-lez v1, :cond_1

    .line 439
    invoke-virtual {p0}, Lcom/yingyonghui/market/downloader/DownloadService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v5, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    invoke-static {v5, v6, v7}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v3, v5, v4, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 442
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 443
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 448
    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_0
.end method

.method static synthetic c(Lcom/yingyonghui/market/downloader/DownloadService;)Z
    .locals 1
    .parameter

    .prologue
    .line 41
    iget-boolean v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->e:Z

    return v0
.end method

.method static synthetic d(Lcom/yingyonghui/market/downloader/DownloadService;)Lcom/yingyonghui/market/downloader/o;
    .locals 1
    .parameter

    .prologue
    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->d:Lcom/yingyonghui/market/downloader/o;

    return-object v0
.end method

.method static synthetic e(Lcom/yingyonghui/market/downloader/DownloadService;)Landroid/database/CharArrayBuffer;
    .locals 1
    .parameter

    .prologue
    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->f:Landroid/database/CharArrayBuffer;

    return-object v0
.end method

.method static synthetic f(Lcom/yingyonghui/market/downloader/DownloadService;)Landroid/database/CharArrayBuffer;
    .locals 1
    .parameter

    .prologue
    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->g:Landroid/database/CharArrayBuffer;

    return-object v0
.end method

.method static synthetic g(Lcom/yingyonghui/market/downloader/DownloadService;)Z
    .locals 1
    .parameter

    .prologue
    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->e:Z

    return v0
.end method

.method static synthetic h(Lcom/yingyonghui/market/downloader/DownloadService;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 41
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->c:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic i(Lcom/yingyonghui/market/downloader/DownloadService;)Lcom/yingyonghui/market/downloader/e;
    .locals 1
    .parameter

    .prologue
    .line 41
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->b:Lcom/yingyonghui/market/downloader/e;

    return-object v0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 2
    .parameter

    .prologue
    .line 118
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Cannot bind to Market Download Service"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onCreate()V
    .locals 4

    .prologue
    .line 126
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 131
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->c:Ljava/util/ArrayList;

    .line 133
    new-instance v0, Lcom/yingyonghui/market/downloader/b;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/downloader/b;-><init>(Lcom/yingyonghui/market/downloader/DownloadService;)V

    iput-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->a:Lcom/yingyonghui/market/downloader/b;

    .line 134
    invoke-virtual {p0}, Lcom/yingyonghui/market/downloader/DownloadService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/yingyonghui/market/downloader/DownloadService;->a:Lcom/yingyonghui/market/downloader/b;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 136
    new-instance v0, Lcom/yingyonghui/market/downloader/e;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/downloader/e;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->b:Lcom/yingyonghui/market/downloader/e;

    .line 137
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->b:Lcom/yingyonghui/market/downloader/e;

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/e;->a:Landroid/app/NotificationManager;

    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V

    .line 138
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/DownloadService;->b:Lcom/yingyonghui/market/downloader/e;

    invoke-virtual {v0}, Lcom/yingyonghui/market/downloader/e;->a()V

    .line 140
    invoke-direct {p0}, Lcom/yingyonghui/market/downloader/DownloadService;->c()V

    .line 141
    invoke-direct {p0}, Lcom/yingyonghui/market/downloader/DownloadService;->b()V

    .line 142
    invoke-direct {p0}, Lcom/yingyonghui/market/downloader/DownloadService;->a()V

    .line 143
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 163
    invoke-virtual {p0}, Lcom/yingyonghui/market/downloader/DownloadService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/downloader/DownloadService;->a:Lcom/yingyonghui/market/downloader/b;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 167
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 168
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 150
    invoke-super {p0, p1, p2}, Landroid/app/Service;->onStart(Landroid/content/Intent;I)V

    .line 155
    invoke-direct {p0}, Lcom/yingyonghui/market/downloader/DownloadService;->a()V

    .line 156
    return-void
.end method
