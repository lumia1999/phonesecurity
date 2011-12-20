.class final Lcom/yingyonghui/market/w;
.super Landroid/os/AsyncTask;
.source "ActivityMain.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/a/a;

.field private synthetic b:Lcom/yingyonghui/market/ActivityMain;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityMain;Lcom/yingyonghui/market/a/a;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 333
    iput-object p1, p0, Lcom/yingyonghui/market/w;->b:Lcom/yingyonghui/market/ActivityMain;

    iput-object p2, p0, Lcom/yingyonghui/market/w;->a:Lcom/yingyonghui/market/a/a;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method private varargs a()Ljava/lang/Void;
    .locals 18

    .prologue
    .line 337
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/w;->b:Lcom/yingyonghui/market/ActivityMain;

    move-object v3, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/w;->a:Lcom/yingyonghui/market/a/a;

    move-object v2, v0

    iget-object v2, v2, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-static {v3, v2}, Lcom/yingyonghui/market/a/d;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v8

    .line 338
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/w;->b:Lcom/yingyonghui/market/ActivityMain;

    move-object v2, v0

    invoke-virtual {v2}, Lcom/yingyonghui/market/ActivityMain;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/yingyonghui/market/MarketApplication;

    .line 339
    invoke-virtual {v2, v8}, Lcom/yingyonghui/market/MarketApplication;->a(Ljava/util/ArrayList;)V

    .line 341
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/w;->b:Lcom/yingyonghui/market/ActivityMain;

    move-object v2, v0

    invoke-virtual {v2}, Lcom/yingyonghui/market/ActivityMain;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/yingyonghui/market/provider/f;->a:Landroid/net/Uri;

    invoke-static {}, Lcom/yingyonghui/market/ActivityMain;->b()[Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 343
    :try_start_0
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yingyonghui/market/model/l;

    .line 344
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/w;->b:Lcom/yingyonghui/market/ActivityMain;

    move-object v5, v0

    invoke-static {v5}, Lcom/yingyonghui/market/ActivityMain;->b(Lcom/yingyonghui/market/ActivityMain;)Landroid/content/pm/PackageManager;

    move-result-object v5

    iget-object v6, v2, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v5, v6}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/PackageInfo;

    move-result-object v5

    .line 345
    if-eqz v5, :cond_0

    iget-object v6, v5, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v6, :cond_0

    .line 346
    iget v6, v2, Lcom/yingyonghui/market/model/l;->s:I

    iget v5, v5, Landroid/content/pm/PackageInfo;->versionCode:I

    if-le v6, v5, :cond_0

    .line 352
    const/4 v5, 0x0

    .line 353
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 354
    const-string v6, "_id"

    invoke-interface {v3, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 355
    const-string v7, "pkgname"

    invoke-interface {v3, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    .line 356
    const-string v8, "version_code"

    invoke-interface {v3, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    .line 357
    const-string v9, "flg"

    invoke-interface {v3, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    .line 365
    :cond_1
    invoke-interface {v3, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 366
    invoke-interface {v3, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 367
    invoke-interface {v3, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 368
    invoke-interface {v3, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 370
    iget-object v14, v2, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-virtual {v11, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 371
    const/4 v5, 0x1

    .line 372
    invoke-static {v12}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v11

    iget v14, v2, Lcom/yingyonghui/market/model/l;->s:I

    int-to-long v14, v14

    cmp-long v11, v11, v14

    if-gez v11, :cond_6

    .line 374
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 375
    const-string v12, "apkid"

    iget v13, v2, Lcom/yingyonghui/market/model/l;->e:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 376
    const-string v12, "apkname"

    iget-object v13, v2, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    const-string v12, "lastmodifiedtime"

    iget-object v13, v2, Lcom/yingyonghui/market/model/l;->r:Ljava/lang/String;

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    const-string v12, "pkgname"

    iget-object v13, v2, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 380
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    .line 381
    iget-object v13, v2, Lcom/yingyonghui/market/model/l;->t:[Ljava/lang/String;

    if-eqz v13, :cond_3

    iget v13, v2, Lcom/yingyonghui/market/model/l;->o:I

    if-lez v13, :cond_3

    .line 382
    iget-object v13, v2, Lcom/yingyonghui/market/model/l;->t:[Ljava/lang/String;

    array-length v14, v13

    const/4 v15, 0x0

    :goto_1
    if-ge v15, v14, :cond_2

    aget-object v16, v13, v15

    .line 383
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ","

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object v0, v12

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 382
    add-int/lit8 v15, v15, 0x1

    goto :goto_1

    .line 385
    :cond_2
    invoke-virtual {v12}, Ljava/lang/StringBuffer;->length()I

    move-result v13

    .line 386
    if-lez v13, :cond_3

    .line 387
    const/4 v14, 0x1

    sub-int/2addr v13, v14

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->deleteCharAt(I)Ljava/lang/StringBuffer;

    .line 390
    :cond_3
    const-string v13, "permission"

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v13, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 392
    const-string v12, "promotion_agent"

    iget-object v13, v2, Lcom/yingyonghui/market/model/l;->E:Ljava/lang/String;

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 393
    const-string v12, "promotion_id"

    iget v13, v2, Lcom/yingyonghui/market/model/l;->D:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 394
    const-string v12, "pubkey_hash"

    iget-object v13, v2, Lcom/yingyonghui/market/model/l;->C:Ljava/lang/String;

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 395
    const-string v12, "rating"

    iget v13, v2, Lcom/yingyonghui/market/model/l;->l:F

    invoke-static {v13}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Float;)V

    .line 396
    const-string v12, "rating_count"

    iget v13, v2, Lcom/yingyonghui/market/model/l;->A:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 397
    const-string v12, "size"

    iget v13, v2, Lcom/yingyonghui/market/model/l;->o:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 398
    const-string v12, "version_code"

    iget v13, v2, Lcom/yingyonghui/market/model/l;->s:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 399
    const-string v12, "version_name"

    iget-object v13, v2, Lcom/yingyonghui/market/model/l;->q:Ljava/lang/String;

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 400
    const-string v12, "apk_url"

    iget-object v13, v2, Lcom/yingyonghui/market/model/l;->g:Ljava/lang/String;

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 401
    const-string v12, "flg"

    const/4 v13, 0x0

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 402
    sget-object v12, Lcom/yingyonghui/market/provider/f;->a:Landroid/net/Uri;

    invoke-static {v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v13

    invoke-static {v12, v13, v14}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v10

    .line 403
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/w;->b:Lcom/yingyonghui/market/ActivityMain;

    move-object v12, v0

    invoke-virtual {v12}, Lcom/yingyonghui/market/ActivityMain;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-virtual {v12, v10, v11, v13, v14}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 405
    invoke-static {}, Lcom/yingyonghui/market/ActivityMain;->c()I

    .line 413
    :cond_4
    :goto_2
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v10

    if-nez v10, :cond_1

    .line 418
    :cond_5
    if-nez v5, :cond_0

    .line 419
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    .line 420
    const-string v6, "apkid"

    iget v7, v2, Lcom/yingyonghui/market/model/l;->e:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 421
    const-string v6, "apkname"

    iget-object v7, v2, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 422
    const-string v6, "lastmodifiedtime"

    iget-object v7, v2, Lcom/yingyonghui/market/model/l;->r:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 423
    const-string v6, "pkgname"

    iget-object v7, v2, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 425
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 426
    iget-object v7, v2, Lcom/yingyonghui/market/model/l;->t:[Ljava/lang/String;

    if-eqz v7, :cond_9

    iget v7, v2, Lcom/yingyonghui/market/model/l;->o:I

    if-lez v7, :cond_9

    .line 427
    iget-object v7, v2, Lcom/yingyonghui/market/model/l;->t:[Ljava/lang/String;

    array-length v8, v7

    const/4 v9, 0x0

    :goto_3
    if-ge v9, v8, :cond_8

    aget-object v10, v7, v9

    .line 428
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ","

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 427
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 408
    :cond_6
    const-string v10, "0"

    invoke-virtual {v13, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 409
    invoke-static {}, Lcom/yingyonghui/market/ActivityMain;->c()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 459
    :catch_0
    move-exception v2

    :try_start_1
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 462
    if-eqz v3, :cond_7

    .line 463
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 468
    :cond_7
    :goto_4
    const/4 v2, 0x0

    return-object v2

    .line 430
    :cond_8
    :try_start_2
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->length()I

    move-result v7

    .line 431
    if-lez v7, :cond_9

    .line 432
    const/4 v8, 0x1

    sub-int/2addr v7, v8

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->deleteCharAt(I)Ljava/lang/StringBuffer;

    .line 435
    :cond_9
    const-string v7, "permission"

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v7, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 437
    const-string v6, "promotion_agent"

    iget-object v7, v2, Lcom/yingyonghui/market/model/l;->E:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 438
    const-string v6, "promotion_id"

    iget v7, v2, Lcom/yingyonghui/market/model/l;->D:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 439
    const-string v6, "pubkey_hash"

    iget-object v7, v2, Lcom/yingyonghui/market/model/l;->C:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 440
    const-string v6, "rating"

    iget v7, v2, Lcom/yingyonghui/market/model/l;->l:F

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Float;)V

    .line 441
    const-string v6, "rating_count"

    iget v7, v2, Lcom/yingyonghui/market/model/l;->A:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 442
    const-string v6, "size"

    iget v7, v2, Lcom/yingyonghui/market/model/l;->o:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 443
    const-string v6, "version_code"

    iget v7, v2, Lcom/yingyonghui/market/model/l;->s:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 444
    const-string v6, "version_name"

    iget-object v7, v2, Lcom/yingyonghui/market/model/l;->q:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 445
    const-string v6, "apk_url"

    iget-object v2, v2, Lcom/yingyonghui/market/model/l;->g:Ljava/lang/String;

    invoke-virtual {v5, v6, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 446
    const-string v2, "flg"

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v5, v2, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 449
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/w;->b:Lcom/yingyonghui/market/ActivityMain;

    move-object v2, v0

    invoke-virtual {v2}, Lcom/yingyonghui/market/ActivityMain;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v6, Lcom/yingyonghui/market/provider/f;->a:Landroid/net/Uri;

    invoke-virtual {v2, v6, v5}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 451
    :goto_5
    :try_start_4
    invoke-static {}, Lcom/yingyonghui/market/ActivityMain;->c()I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_0

    .line 462
    :catchall_0
    move-exception v2

    if-eqz v3, :cond_a

    .line 463
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    :cond_a
    throw v2

    .line 462
    :cond_b
    if-eqz v3, :cond_7

    .line 463
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    goto/16 :goto_4

    :catch_1
    move-exception v2

    goto :goto_5
.end method


# virtual methods
.method protected final bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 333
    invoke-direct {p0}, Lcom/yingyonghui/market/w;->a()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected final bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 3
    .parameter

    .prologue
    .line 333
    sget-object v0, Lcom/yingyonghui/market/ActivityMain;->c:Landroid/widget/TextView;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/w;->b:Lcom/yingyonghui/market/ActivityMain;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityMain;->c(Lcom/yingyonghui/market/ActivityMain;)Ljava/util/ArrayList;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    const v1, 0x7f0b010f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewStub;

    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sput-object v0, Lcom/yingyonghui/market/ActivityMain;->c:Landroid/widget/TextView;

    :cond_0
    invoke-static {}, Lcom/yingyonghui/market/ActivityMain;->d()I

    move-result v0

    if-lez v0, :cond_2

    sget-object v0, Lcom/yingyonghui/market/ActivityMain;->c:Landroid/widget/TextView;

    invoke-static {}, Lcom/yingyonghui/market/ActivityMain;->d()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget-object v0, Lcom/yingyonghui/market/ActivityMain;->c:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    iget-object v0, p0, Lcom/yingyonghui/market/w;->b:Lcom/yingyonghui/market/ActivityMain;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "ignore_update_notification"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/yingyonghui/market/w;->b:Lcom/yingyonghui/market/ActivityMain;

    invoke-static {v0}, Lcom/yingyonghui/market/a/e;->a(Landroid/content/Context;)Lcom/yingyonghui/market/a/e;

    move-result-object v0

    invoke-static {}, Lcom/yingyonghui/market/ActivityMain;->d()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/a/e;->a(I)V

    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/w;->b:Lcom/yingyonghui/market/ActivityMain;

    invoke-static {v0}, Lcom/yingyonghui/market/a/e;->a(Landroid/content/Context;)Lcom/yingyonghui/market/a/e;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/a/e;->b()V

    return-void

    :cond_2
    sget-object v0, Lcom/yingyonghui/market/ActivityMain;->c:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget-object v0, Lcom/yingyonghui/market/ActivityMain;->c:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method
