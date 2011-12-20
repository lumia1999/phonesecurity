.class public final Lcom/yingyonghui/market/downloader/n;
.super Ljava/lang/Object;
.source "DownloadManager.java"


# static fields
.field private static a:Lcom/yingyonghui/market/downloader/n;


# instance fields
.field private final b:Landroid/content/Context;

.field private c:Lcom/yingyonghui/market/util/m;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    .line 39
    invoke-static {p1}, Lcom/yingyonghui/market/util/m;->a(Landroid/content/Context;)Lcom/yingyonghui/market/util/m;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/downloader/n;->c:Lcom/yingyonghui/market/util/m;

    .line 40
    return-void
.end method

.method private static a(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;
    .locals 4
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v3, 0x1

    .line 285
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 286
    const-string v1, "mimetype"

    const-string v2, "application/vnd.android.package-archive"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    const-string v1, "title"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    const-string v1, "description"

    invoke-virtual {v0, v1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    const-string v1, "uri"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    const-string v1, "no_integrity"

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 291
    const-string v1, "visibility"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 292
    const-string v1, "notificationpackage"

    sget-object v2, Lcom/yingyonghui/market/bi;->a:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    const-string v1, "notificationclass"

    const-class v2, Lcom/yingyonghui/market/downloader/DownloadReceiver;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    const-string v1, "notificationextras"

    invoke-virtual {v0, v1, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    invoke-static {}, Lcom/yingyonghui/market/util/GlobalUtil;->a()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 296
    const-string v1, "destination"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 300
    :goto_0
    sget-object v1, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    invoke-virtual {p0, v1, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    .line 301
    return-object v0

    .line 298
    :cond_0
    const-string v1, "destination"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0
.end method

.method public static a(Landroid/content/Context;)Lcom/yingyonghui/market/downloader/n;
    .locals 1
    .parameter

    .prologue
    .line 43
    sget-object v0, Lcom/yingyonghui/market/downloader/n;->a:Lcom/yingyonghui/market/downloader/n;

    if-nez v0, :cond_0

    .line 44
    new-instance v0, Lcom/yingyonghui/market/downloader/n;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/downloader/n;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/yingyonghui/market/downloader/n;->a:Lcom/yingyonghui/market/downloader/n;

    .line 46
    :cond_0
    sget-object v0, Lcom/yingyonghui/market/downloader/n;->a:Lcom/yingyonghui/market/downloader/n;

    return-object v0
.end method


# virtual methods
.method public final a()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v4, 0x0

    .line 353
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    new-array v2, v9, [Ljava/lang/String;

    const-string v3, "_id"

    aput-object v3, v2, v8

    const-string v3, "status >= \'200\'"

    const-string v5, "lastmod"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    const/16 v2, 0x3e8

    sub-int/2addr v1, v2

    const-string v2, "_id"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    :goto_0
    if-lez v1, :cond_0

    iget-object v3, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v5, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    invoke-static {v5, v6, v7}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v3, v5, v4, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_0

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 354
    :cond_1
    invoke-static {}, Landroid/os/Environment;->getDownloadCacheDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_7

    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    move v1, v8

    :goto_1
    array-length v2, v0

    if-ge v1, v2, :cond_3

    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "lost+found"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "recovery"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    new-array v3, v9, [Ljava/lang/String;

    const-string v0, "_data"

    aput-object v0, v3, v8

    move-object v5, v4

    move-object v6, v4

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_5

    :cond_4
    invoke-interface {v0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_4

    :cond_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_6
    invoke-virtual {v7}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_2

    .line 355
    :cond_7
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 8
    .parameter

    .prologue
    const/4 v4, 0x0

    .line 305
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 306
    invoke-static {v2, p1}, Lcom/yingyonghui/market/provider/k;->a(Landroid/content/ContentResolver;Ljava/lang/String;)Lcom/yingyonghui/market/provider/k;

    move-result-object v3

    .line 307
    invoke-virtual {v3}, Lcom/yingyonghui/market/provider/k;->g()Landroid/net/Uri;

    move-result-object v1

    .line 309
    invoke-static {}, Lcom/yingyonghui/market/util/GlobalUtil;->a()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 310
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    :try_start_0
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    const-string v5, "visibility"

    const/4 v6, 0x2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v5, "control"

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v5, v1, v4, v6, v7}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    const-string v4, "notification"

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    invoke-virtual {v1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    const/4 v4, 0x1

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/yingyonghui/market/util/l;->a(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 315
    :goto_0
    invoke-virtual {v3}, Lcom/yingyonghui/market/provider/k;->d()Lcom/yingyonghui/market/provider/m;

    move-result-object v0

    sget-object v1, Lcom/yingyonghui/market/provider/m;->b:Lcom/yingyonghui/market/provider/m;

    if-ne v0, v1, :cond_2

    .line 316
    sget-object v0, Lcom/yingyonghui/market/provider/m;->n:Lcom/yingyonghui/market/provider/m;

    invoke-virtual {v3, v0}, Lcom/yingyonghui/market/provider/k;->a(Lcom/yingyonghui/market/provider/m;)V

    .line 320
    :cond_0
    :goto_1
    invoke-virtual {v3, v2}, Lcom/yingyonghui/market/provider/k;->b(Landroid/content/ContentResolver;)V

    .line 322
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    invoke-static {p1}, Lcom/yingyonghui/market/log/h;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 323
    return-void

    .line 310
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 312
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, v1, v4, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    .line 317
    :cond_2
    invoke-virtual {v3}, Lcom/yingyonghui/market/provider/k;->d()Lcom/yingyonghui/market/provider/m;

    move-result-object v0

    sget-object v1, Lcom/yingyonghui/market/provider/m;->h:Lcom/yingyonghui/market/provider/m;

    if-ne v0, v1, :cond_0

    .line 318
    sget-object v0, Lcom/yingyonghui/market/provider/m;->f:Lcom/yingyonghui/market/provider/m;

    invoke-virtual {v3, v0}, Lcom/yingyonghui/market/provider/k;->a(Lcom/yingyonghui/market/provider/m;)V

    goto :goto_1
.end method

.method public final a(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 14
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 51
    if-lez p6, :cond_0

    .line 52
    iget-object v4, p0, Lcom/yingyonghui/market/downloader/n;->c:Lcom/yingyonghui/market/util/m;

    invoke-static/range {p6 .. p6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    move-object v0, v4

    move-object v1, v5

    move-object/from16 v2, p7

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lcom/yingyonghui/market/util/m;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    move-object v4, p0

    move-object v5, p1

    move/from16 v6, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    move/from16 v9, p5

    move-object/from16 v10, p8

    move-object/from16 v11, p9

    move-object/from16 v12, p10

    move-object/from16 v13, p11

    .line 54
    invoke-virtual/range {v4 .. v13}, Lcom/yingyonghui/market/downloader/n;->a(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method public final a(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 59
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 60
    iget-object v3, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    const v4, 0x7f090167

    invoke-static {v3, v4}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    .line 91
    :goto_0
    return-void

    .line 64
    :cond_0
    iget-object v3, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    const-string v4, "checkbox_allow_without_wifi"

    invoke-static {v3, v4}, Lcom/yingyonghui/market/util/k;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    .line 66
    iget-object v4, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    invoke-static {v4}, Lcom/yingyonghui/market/util/g;->c(Landroid/content/Context;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 67
    if-nez v3, :cond_1

    .line 68
    iget-object v3, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    const v4, 0x7f0900d8

    invoke-static {v3, v4}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto :goto_0

    .line 72
    :cond_1
    iget-object v3, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    const-string v4, "list_app_limit"

    const-string v5, "5"

    invoke-static {v3, v4, v5}, Lcom/yingyonghui/market/util/k;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/yingyonghui/market/util/l;->a(Ljava/lang/String;)I

    move-result v3

    .line 74
    mul-int/lit16 v3, v3, 0x400

    mul-int/lit16 v3, v3, 0x400

    move/from16 v0, p5

    move v1, v3

    if-le v0, v1, :cond_2

    .line 75
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 76
    iget-object v4, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    const-class v5, Lcom/yingyonghui/market/ActivityWarningTraffic;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 77
    const-string v4, "_id"

    invoke-virtual {v3, v4, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 78
    const-string v4, "pkgName"

    invoke-virtual {v3, v4, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 79
    const-string v4, "size"

    move-object v0, v3

    move-object v1, v4

    move/from16 v2, p5

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 80
    const-string v4, "title"

    move-object v0, v3

    move-object v1, v4

    move-object/from16 v2, p4

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 81
    const-string v4, "channel"

    move-object v0, v3

    move-object v1, v4

    move-object/from16 v2, p7

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 82
    const-string v4, "action"

    move-object v0, v3

    move-object v1, v4

    move-object/from16 v2, p8

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 83
    const-string v4, "downloadUrl"

    invoke-virtual {v3, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 84
    const-string v4, "iconUrl"

    move-object v0, v3

    move-object v1, v4

    move-object/from16 v2, p9

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 85
    iget-object v4, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    invoke-virtual {v4, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 90
    :cond_2
    move/from16 v0, p5

    int-to-long v0, v0

    move-wide v7, v0

    move-object v3, p0

    move-object v4, p1

    move-object v5, p3

    move-object/from16 v6, p4

    move-object/from16 v9, p6

    move-object/from16 v10, p8

    move-object/from16 v11, p9

    invoke-virtual/range {v3 .. v11}, Lcom/yingyonghui/market/downloader/n;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 20
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 95
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    move-object v5, v0

    move-object v0, v5

    move-wide/from16 v1, p4

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/downloader/d;->b(Landroid/content/Context;J)Z

    move-result v5

    if-nez v5, :cond_0

    .line 96
    new-instance v5, Landroid/content/Intent;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    move-object v6, v0

    const-class v7, Lcom/yingyonghui/market/ActivityWarningDownload;

    invoke-direct {v5, v6, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 97
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    move-object v6, v0

    invoke-virtual {v6, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 282
    :goto_0
    return-void

    .line 101
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    move-object v5, v0

    move-object v0, v5

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 102
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    move-object v5, v0

    invoke-static/range {p2 .. p2}, Lcom/yingyonghui/market/log/h;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 107
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    move-object v5, v0

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    .line 110
    invoke-static/range {p6 .. p6}, Lcom/yingyonghui/market/util/c;->g(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_3

    move-object/from16 v11, p6

    .line 116
    :goto_2
    move-object v0, v5

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lcom/yingyonghui/market/provider/k;->a(Landroid/content/ContentResolver;Ljava/lang/String;)Lcom/yingyonghui/market/provider/k;

    move-result-object v6

    .line 117
    if-nez v6, :cond_1d

    .line 118
    move-object v0, v5

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/provider/k;->a(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Lcom/yingyonghui/market/provider/k;

    move-result-object v6

    move-object v12, v6

    .line 121
    :goto_3
    invoke-virtual {v12}, Lcom/yingyonghui/market/provider/k;->d()Lcom/yingyonghui/market/provider/m;

    move-result-object v6

    .line 123
    sget-object v7, Lcom/yingyonghui/market/provider/m;->a:Lcom/yingyonghui/market/provider/m;

    if-eq v6, v7, :cond_1

    sget-object v7, Lcom/yingyonghui/market/provider/m;->c:Lcom/yingyonghui/market/provider/m;

    if-eq v6, v7, :cond_1

    sget-object v7, Lcom/yingyonghui/market/provider/m;->g:Lcom/yingyonghui/market/provider/m;

    if-eq v6, v7, :cond_1

    sget-object v7, Lcom/yingyonghui/market/provider/m;->n:Lcom/yingyonghui/market/provider/m;

    if-ne v6, v7, :cond_e

    .line 127
    :cond_1
    invoke-virtual {v12}, Lcom/yingyonghui/market/provider/k;->g()Landroid/net/Uri;

    move-result-object v6

    .line 128
    if-nez v6, :cond_5

    .line 129
    move-object v0, v5

    move-object v1, v11

    move-object/from16 v2, p3

    move-object/from16 v3, p8

    move-object/from16 v4, p2

    invoke-static {v0, v1, v2, v3, v4}, Lcom/yingyonghui/market/downloader/n;->a(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 130
    if-nez v6, :cond_4

    .line 132
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    move-object v5, v0

    const v6, 0x7f090167

    invoke-static {v5, v6}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto :goto_0

    .line 104
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    move-object v5, v0

    move-object/from16 v0, p2

    move-object/from16 v1, p7

    invoke-static {v0, v1}, Lcom/yingyonghui/market/log/h;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    move-object/from16 v11, p1

    .line 113
    goto :goto_2

    .line 135
    :cond_4
    invoke-virtual {v12, v6}, Lcom/yingyonghui/market/provider/k;->a(Landroid/net/Uri;)V

    .line 208
    :goto_4
    sget-object v6, Lcom/yingyonghui/market/provider/m;->b:Lcom/yingyonghui/market/provider/m;

    invoke-virtual {v12, v6}, Lcom/yingyonghui/market/provider/k;->a(Lcom/yingyonghui/market/provider/m;)V

    .line 209
    invoke-virtual {v12, v5}, Lcom/yingyonghui/market/provider/k;->b(Landroid/content/ContentResolver;)V

    goto/16 :goto_0

    .line 137
    :cond_5
    const/4 v13, -0x1

    .line 138
    const/4 v14, 0x0

    .line 139
    const/4 v15, 0x0

    .line 140
    const/16 v16, 0x0

    .line 141
    const/16 v17, 0x0

    .line 142
    const/4 v7, 0x5

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "status"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string v9, "notificationpackage"

    aput-object v9, v7, v8

    const/4 v8, 0x2

    const-string v9, "notificationclass"

    aput-object v9, v7, v8

    const/4 v8, 0x3

    const-string v9, "notificationextras"

    aput-object v9, v7, v8

    const/4 v8, 0x4

    const-string v9, "_data"

    aput-object v9, v7, v8

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v5 .. v10}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 147
    if-eqz v7, :cond_1c

    .line 148
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v8

    if-eqz v8, :cond_1b

    .line 149
    const/4 v8, 0x0

    invoke-interface {v7, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    .line 150
    const/4 v9, 0x1

    invoke-interface {v7, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 151
    const/4 v10, 0x2

    invoke-interface {v7, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 152
    const/4 v13, 0x3

    invoke-interface {v7, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 153
    const/4 v14, 0x4

    invoke-interface {v7, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v18, v14

    move v14, v8

    move-object/from16 v8, v18

    move-object/from16 v19, v9

    move-object v9, v13

    move-object/from16 v13, v19

    .line 155
    :goto_5
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    move-object v7, v8

    move-object v8, v9

    move-object v9, v10

    move-object v10, v13

    move v13, v14

    .line 158
    :goto_6
    const/4 v14, -0x1

    if-ne v13, v14, :cond_7

    .line 159
    move-object v0, v5

    move-object v1, v11

    move-object/from16 v2, p3

    move-object/from16 v3, p8

    move-object/from16 v4, p2

    invoke-static {v0, v1, v2, v3, v4}, Lcom/yingyonghui/market/downloader/n;->a(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 160
    if-nez v6, :cond_6

    .line 162
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    move-object v5, v0

    const v6, 0x7f090167

    invoke-static {v5, v6}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 165
    :cond_6
    invoke-virtual {v12, v6}, Lcom/yingyonghui/market/provider/k;->a(Landroid/net/Uri;)V

    goto/16 :goto_4

    .line 166
    :cond_7
    const/16 v14, 0xc8

    if-ne v13, v14, :cond_b

    .line 167
    new-instance v13, Ljava/io/File;

    invoke-direct {v13, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_9

    .line 168
    sget-object v7, Lcom/yingyonghui/market/provider/m;->b:Lcom/yingyonghui/market/provider/m;

    invoke-virtual {v12, v7}, Lcom/yingyonghui/market/provider/k;->a(Lcom/yingyonghui/market/provider/m;)V

    .line 169
    invoke-virtual {v12, v5}, Lcom/yingyonghui/market/provider/k;->b(Landroid/content/ContentResolver;)V

    .line 171
    new-instance v5, Landroid/content/Intent;

    const-string v7, "android.intent.action.DOWNLOAD_COMPLETED"

    invoke-direct {v5, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 172
    invoke-virtual {v5, v10, v9}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 173
    if-eqz v8, :cond_8

    .line 174
    const-string v7, "notificationextras"

    invoke-virtual {v5, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 176
    :cond_8
    invoke-virtual {v5, v6}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 177
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    move-object v6, v0

    invoke-virtual {v6, v5}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 180
    :cond_9
    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 182
    move-object v0, v5

    move-object v1, v11

    move-object/from16 v2, p3

    move-object/from16 v3, p8

    move-object/from16 v4, p2

    invoke-static {v0, v1, v2, v3, v4}, Lcom/yingyonghui/market/downloader/n;->a(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 183
    if-nez v6, :cond_a

    .line 185
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    move-object v5, v0

    const v6, 0x7f090167

    invoke-static {v5, v6}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 188
    :cond_a
    invoke-virtual {v12, v6}, Lcom/yingyonghui/market/provider/k;->a(Landroid/net/Uri;)V

    goto/16 :goto_4

    .line 190
    :cond_b
    invoke-static {v13}, Lcom/yingyonghui/market/downloader/a;->b(I)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 191
    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 193
    move-object v0, v5

    move-object v1, v11

    move-object/from16 v2, p3

    move-object/from16 v3, p8

    move-object/from16 v4, p2

    invoke-static {v0, v1, v2, v3, v4}, Lcom/yingyonghui/market/downloader/n;->a(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 194
    if-nez v6, :cond_c

    .line 196
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    move-object v5, v0

    const v6, 0x7f090167

    invoke-static {v5, v6}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 199
    :cond_c
    invoke-virtual {v12, v6}, Lcom/yingyonghui/market/provider/k;->a(Landroid/net/Uri;)V

    goto/16 :goto_4

    .line 201
    :cond_d
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 202
    const-string v8, "visibility"

    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 203
    const-string v8, "control"

    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 204
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v5, v6, v7, v8, v9}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto/16 :goto_4

    .line 210
    :cond_e
    sget-object v7, Lcom/yingyonghui/market/provider/m;->f:Lcom/yingyonghui/market/provider/m;

    if-eq v6, v7, :cond_f

    sget-object v7, Lcom/yingyonghui/market/provider/m;->m:Lcom/yingyonghui/market/provider/m;

    if-eq v6, v7, :cond_f

    sget-object v7, Lcom/yingyonghui/market/provider/m;->i:Lcom/yingyonghui/market/provider/m;

    if-eq v6, v7, :cond_f

    sget-object v7, Lcom/yingyonghui/market/provider/m;->l:Lcom/yingyonghui/market/provider/m;

    if-ne v6, v7, :cond_18

    .line 215
    :cond_f
    invoke-virtual {v12}, Lcom/yingyonghui/market/provider/k;->g()Landroid/net/Uri;

    move-result-object v6

    .line 216
    if-nez v6, :cond_11

    .line 217
    move-object v0, v5

    move-object v1, v11

    move-object/from16 v2, p3

    move-object/from16 v3, p8

    move-object/from16 v4, p2

    invoke-static {v0, v1, v2, v3, v4}, Lcom/yingyonghui/market/downloader/n;->a(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 218
    if-nez v6, :cond_10

    .line 220
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    move-object v5, v0

    const v6, 0x7f090167

    invoke-static {v5, v6}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 223
    :cond_10
    invoke-virtual {v12, v6}, Lcom/yingyonghui/market/provider/k;->a(Landroid/net/Uri;)V

    .line 268
    :goto_7
    sget-object v6, Lcom/yingyonghui/market/provider/m;->h:Lcom/yingyonghui/market/provider/m;

    invoke-virtual {v12, v6}, Lcom/yingyonghui/market/provider/k;->a(Lcom/yingyonghui/market/provider/m;)V

    .line 269
    invoke-virtual {v12, v5}, Lcom/yingyonghui/market/provider/k;->b(Landroid/content/ContentResolver;)V

    goto/16 :goto_0

    .line 225
    :cond_11
    const/4 v13, -0x1

    .line 226
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "status"

    aput-object v9, v7, v8

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v5 .. v10}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 227
    if-eqz v7, :cond_1a

    .line 228
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v8

    if-eqz v8, :cond_19

    .line 229
    const/4 v8, 0x0

    invoke-interface {v7, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    .line 231
    :goto_8
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    move v7, v8

    .line 234
    :goto_9
    const/4 v8, -0x1

    if-ne v7, v8, :cond_13

    .line 235
    move-object v0, v5

    move-object v1, v11

    move-object/from16 v2, p3

    move-object/from16 v3, p8

    move-object/from16 v4, p2

    invoke-static {v0, v1, v2, v3, v4}, Lcom/yingyonghui/market/downloader/n;->a(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 236
    if-nez v6, :cond_12

    .line 238
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    move-object v5, v0

    const v6, 0x7f090167

    invoke-static {v5, v6}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 241
    :cond_12
    invoke-virtual {v12, v6}, Lcom/yingyonghui/market/provider/k;->a(Landroid/net/Uri;)V

    goto :goto_7

    .line 242
    :cond_13
    const/16 v8, 0xc8

    if-ne v7, v8, :cond_15

    .line 243
    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 244
    move-object v0, v5

    move-object v1, v11

    move-object/from16 v2, p3

    move-object/from16 v3, p8

    move-object/from16 v4, p2

    invoke-static {v0, v1, v2, v3, v4}, Lcom/yingyonghui/market/downloader/n;->a(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 245
    if-nez v6, :cond_14

    .line 247
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    move-object v5, v0

    const v6, 0x7f090167

    invoke-static {v5, v6}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 250
    :cond_14
    invoke-virtual {v12, v6}, Lcom/yingyonghui/market/provider/k;->a(Landroid/net/Uri;)V

    goto :goto_7

    .line 251
    :cond_15
    invoke-static {v7}, Lcom/yingyonghui/market/downloader/a;->b(I)Z

    move-result v7

    if-eqz v7, :cond_17

    .line 252
    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 254
    move-object v0, v5

    move-object v1, v11

    move-object/from16 v2, p3

    move-object/from16 v3, p8

    move-object/from16 v4, p2

    invoke-static {v0, v1, v2, v3, v4}, Lcom/yingyonghui/market/downloader/n;->a(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 255
    if-nez v6, :cond_16

    .line 257
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    move-object v5, v0

    const v6, 0x7f090167

    invoke-static {v5, v6}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 260
    :cond_16
    invoke-virtual {v12, v6}, Lcom/yingyonghui/market/provider/k;->a(Landroid/net/Uri;)V

    goto/16 :goto_7

    .line 262
    :cond_17
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 263
    const-string v8, "visibility"

    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 264
    const-string v8, "control"

    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 265
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v5, v6, v7, v8, v9}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto/16 :goto_7

    .line 280
    :cond_18
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "State \""

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\" is wrong when start downloading."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    goto/16 :goto_0

    :cond_19
    move v8, v13

    goto/16 :goto_8

    :cond_1a
    move v7, v13

    goto/16 :goto_9

    :cond_1b
    move-object/from16 v8, v17

    move-object/from16 v9, v16

    move-object v10, v15

    move-object/from16 v18, v14

    move v14, v13

    move-object/from16 v13, v18

    goto/16 :goto_5

    :cond_1c
    move-object/from16 v7, v17

    move-object/from16 v8, v16

    move-object v9, v15

    move-object v10, v14

    goto/16 :goto_6

    :cond_1d
    move-object v12, v6

    goto/16 :goto_3
.end method

.method public final b(Ljava/lang/String;)V
    .locals 8
    .parameter

    .prologue
    const/4 v7, 0x0

    const/4 v3, 0x0

    .line 326
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 327
    invoke-static {v0, p1}, Lcom/yingyonghui/market/provider/k;->a(Landroid/content/ContentResolver;Ljava/lang/String;)Lcom/yingyonghui/market/provider/k;

    move-result-object v6

    .line 328
    invoke-virtual {v6}, Lcom/yingyonghui/market/provider/k;->g()Landroid/net/Uri;

    move-result-object v1

    .line 330
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v4, "_data"

    aput-object v4, v2, v7

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 332
    if-eqz v2, :cond_1

    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 333
    invoke-interface {v2, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 334
    if-eqz v4, :cond_0

    .line 335
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 337
    :cond_0
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 340
    :cond_1
    iget-object v2, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, v1, v3, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 342
    invoke-virtual {v6}, Lcom/yingyonghui/market/provider/k;->d()Lcom/yingyonghui/market/provider/m;

    move-result-object v1

    sget-object v2, Lcom/yingyonghui/market/provider/m;->b:Lcom/yingyonghui/market/provider/m;

    if-ne v1, v2, :cond_3

    .line 343
    sget-object v1, Lcom/yingyonghui/market/provider/m;->n:Lcom/yingyonghui/market/provider/m;

    invoke-virtual {v6, v1}, Lcom/yingyonghui/market/provider/k;->a(Lcom/yingyonghui/market/provider/m;)V

    .line 347
    :cond_2
    :goto_0
    invoke-virtual {v6, v0}, Lcom/yingyonghui/market/provider/k;->b(Landroid/content/ContentResolver;)V

    .line 349
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/n;->b:Landroid/content/Context;

    invoke-static {p1}, Lcom/yingyonghui/market/log/h;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 350
    return-void

    .line 344
    :cond_3
    invoke-virtual {v6}, Lcom/yingyonghui/market/provider/k;->d()Lcom/yingyonghui/market/provider/m;

    move-result-object v1

    sget-object v2, Lcom/yingyonghui/market/provider/m;->h:Lcom/yingyonghui/market/provider/m;

    if-ne v1, v2, :cond_2

    .line 345
    sget-object v1, Lcom/yingyonghui/market/provider/m;->f:Lcom/yingyonghui/market/provider/m;

    invoke-virtual {v6, v1}, Lcom/yingyonghui/market/provider/k;->a(Lcom/yingyonghui/market/provider/m;)V

    goto :goto_0
.end method
