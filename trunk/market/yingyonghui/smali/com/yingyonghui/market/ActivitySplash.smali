.class public Lcom/yingyonghui/market/ActivitySplash;
.super Lcom/yingyonghui/market/HttpServiceSupportForActivity;
.source "ActivitySplash.java"


# static fields
.field private static final l:[Ljava/lang/String;


# instance fields
.field private c:Lcom/yingyonghui/market/util/w;

.field private d:Ljava/lang/String;

.field private e:Z

.field private f:Z

.field private g:Ljava/lang/String;

.field private h:I

.field private i:Z

.field private j:J

.field private k:J

.field private m:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 64
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "pkgname"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "version_code"

    aput-object v2, v0, v1

    sput-object v0, Lcom/yingyonghui/market/ActivitySplash;->l:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const-wide/16 v0, 0x0

    .line 44
    invoke-direct {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;-><init>()V

    .line 61
    iput-wide v0, p0, Lcom/yingyonghui/market/ActivitySplash;->j:J

    .line 62
    iput-wide v0, p0, Lcom/yingyonghui/market/ActivitySplash;->k:J

    .line 138
    new-instance v0, Lcom/yingyonghui/market/ah;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/ah;-><init>(Lcom/yingyonghui/market/ActivitySplash;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivitySplash;->m:Landroid/os/Handler;

    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivitySplash;)Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySplash;->m:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivitySplash;)V
    .locals 3
    .parameter

    .prologue
    .line 44
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x1080027

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007f

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09016d

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09016e

    new-instance v2, Lcom/yingyonghui/market/aa;

    invoke-direct {v2, p0}, Lcom/yingyonghui/market/aa;-><init>(Lcom/yingyonghui/market/ActivitySplash;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f090080

    new-instance v2, Lcom/yingyonghui/market/z;

    invoke-direct {v2, p0}, Lcom/yingyonghui/market/z;-><init>(Lcom/yingyonghui/market/ActivitySplash;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09016f

    new-instance v2, Lcom/yingyonghui/market/ag;

    invoke-direct {v2, p0}, Lcom/yingyonghui/market/ag;-><init>(Lcom/yingyonghui/market/ActivitySplash;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method static synthetic c(Lcom/yingyonghui/market/ActivitySplash;)Z
    .locals 1
    .parameter

    .prologue
    .line 44
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivitySplash;->i:Z

    return v0
.end method

.method static synthetic d(Lcom/yingyonghui/market/ActivitySplash;)V
    .locals 11
    .parameter

    .prologue
    const/4 v3, 0x0

    .line 44
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivitySplash;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-static {v0}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/pm/PackageManager;)Ljava/util/ArrayList;

    move-result-object v1

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_3

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v2, v0, :cond_0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/util/n;

    iget-object v4, v0, Lcom/yingyonghui/market/util/n;->a:Ljava/lang/Object;

    iget-object v0, v0, Lcom/yingyonghui/market/util/n;->b:Ljava/lang/Object;

    invoke-virtual {v6, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/yingyonghui/market/provider/f;->a:Landroid/net/Uri;

    sget-object v2, Lcom/yingyonghui/market/ActivitySplash;->l:[Ljava/lang/String;

    move-object v0, p0

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Lcom/yingyonghui/market/ActivitySplash;->managedQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_1
    const-string v0, "_id"

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    const-string v2, "pkgname"

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    const-string v4, "version_code"

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_4

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v9, v0

    cmp-long v0, v7, v9

    if-gtz v0, :cond_2

    sget-object v0, Lcom/yingyonghui/market/provider/f;->a:Landroid/net/Uri;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    int-to-long v4, v2

    invoke-static {v0, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivitySplash;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, v0, v3, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_2
    :goto_1
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_3
    return-void

    :cond_4
    sget-object v0, Lcom/yingyonghui/market/provider/f;->a:Landroid/net/Uri;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    int-to-long v4, v2

    invoke-static {v0, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivitySplash;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, v0, v3, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_1
.end method

.method static synthetic e(Lcom/yingyonghui/market/ActivitySplash;)I
    .locals 1
    .parameter

    .prologue
    .line 44
    iget v0, p0, Lcom/yingyonghui/market/ActivitySplash;->h:I

    return v0
.end method

.method static synthetic f(Lcom/yingyonghui/market/ActivitySplash;)I
    .locals 2
    .parameter

    .prologue
    .line 44
    iget v0, p0, Lcom/yingyonghui/market/ActivitySplash;->h:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/yingyonghui/market/ActivitySplash;->h:I

    return v0
.end method

.method static synthetic g(Lcom/yingyonghui/market/ActivitySplash;)Z
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivitySplash;->e:Z

    return v0
.end method

.method static synthetic h(Lcom/yingyonghui/market/ActivitySplash;)Z
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivitySplash;->f:Z

    return v0
.end method

.method static synthetic i(Lcom/yingyonghui/market/ActivitySplash;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySplash;->d:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic j(Lcom/yingyonghui/market/ActivitySplash;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySplash;->g:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method protected final a(Landroid/os/Message;)V
    .locals 5
    .parameter

    .prologue
    .line 109
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/yingyonghui/market/a/a;

    .line 110
    iget v1, v0, Lcom/yingyonghui/market/a/a;->c:I

    packed-switch v1, :pswitch_data_0

    .line 136
    :goto_0
    return-void

    .line 113
    :pswitch_0
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/yingyonghui/market/ActivitySplash;->j:J

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lcom/yingyonghui/market/ActivitySplash;->k:J

    .line 115
    new-instance v1, Lorg/json/JSONObject;

    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 117
    const-string v0, "selfUpdateMessage"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivitySplash;->d:Ljava/lang/String;

    .line 118
    const-string v0, "selfUpdate"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivitySplash;->e:Z

    .line 119
    const-string v0, "selfUpdateMust"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivitySplash;->f:Z

    .line 120
    const-string v0, "selfUpdateUrl"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivitySplash;->g:Ljava/lang/String;

    .line 121
    const-string v0, "app_trace_log_enable"

    const-string v2, "applogback"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "on"

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    invoke-static {p0, v0, v2}, Lcom/yingyonghui/market/util/k;->a(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 124
    const-string v0, "abtest_tag_002"

    const-string v2, "ab002"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/yingyonghui/market/util/k;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    :goto_1
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySplash;->m:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 133
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivitySplash;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-wide v1, p0, Lcom/yingyonghui/market/ActivitySplash;->k:J

    invoke-static {v1, v2}, Lcom/yingyonghui/market/log/h;->a(J)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 127
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 110
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter

    .prologue
    const/16 v1, 0x400

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 72
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onCreate(Landroid/os/Bundle;)V

    .line 75
    invoke-static {p0}, Lcom/a/a/c;->c(Landroid/content/Context;)V

    .line 76
    invoke-static {p0}, Lcom/a/a/c;->d(Landroid/content/Context;)V

    .line 79
    invoke-virtual {p0, v3}, Lcom/yingyonghui/market/ActivitySplash;->requestWindowFeature(I)Z

    .line 80
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivitySplash;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/Window;->setFormat(I)V

    .line 81
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivitySplash;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    .line 84
    const v0, 0x7f030047

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivitySplash;->setContentView(I)V

    .line 86
    new-instance v0, Lcom/yingyonghui/market/util/w;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/util/w;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivitySplash;->c:Lcom/yingyonghui/market/util/w;

    .line 88
    new-instance v0, Lcom/yingyonghui/market/ai;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/ai;-><init>(Lcom/yingyonghui/market/ActivitySplash;)V

    new-array v1, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/ai;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 97
    const-string v0, "appchina_versioncode"

    const-string v1, "setting"

    invoke-virtual {p0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivitySplash;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/yingyonghui/market/util/GlobalUtil;->f(Landroid/content/Context;)I

    move-result v1

    if-nez v0, :cond_1

    const-string v0, "appchina_versioncode"

    invoke-static {p0, v0, v1}, Lcom/yingyonghui/market/util/s;->a(Landroid/app/Activity;Ljava/lang/String;I)V

    const-string v0, "first_started"

    invoke-static {p0, v0, v3}, Lcom/yingyonghui/market/util/s;->a(Landroid/app/Activity;Ljava/lang/String;Z)V

    .line 100
    :cond_0
    :goto_0
    new-instance v0, Lcom/yingyonghui/market/ab;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/ab;-><init>(Lcom/yingyonghui/market/ActivitySplash;)V

    new-array v1, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/ab;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 102
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/yingyonghui/market/ActivitySplash;->j:J

    .line 103
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySplash;->m:Landroid/os/Handler;

    const/4 v1, 0x2

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 105
    return-void

    .line 97
    :cond_1
    if-ge v0, v1, :cond_0

    const-string v0, "appchina_versioncode"

    invoke-static {p0, v0, v1}, Lcom/yingyonghui/market/util/s;->a(Landroid/app/Activity;Ljava/lang/String;I)V

    const-string v0, "first_started"

    invoke-static {p0, v0, v3}, Lcom/yingyonghui/market/util/s;->a(Landroid/app/Activity;Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 2
    .parameter

    .prologue
    .line 246
    const/4 v0, 0x0

    .line 247
    iget-object v1, p0, Lcom/yingyonghui/market/ActivitySplash;->c:Lcom/yingyonghui/market/util/w;

    if-eqz v1, :cond_0

    .line 248
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySplash;->c:Lcom/yingyonghui/market/util/w;

    invoke-virtual {v0, p1}, Lcom/yingyonghui/market/util/w;->a(I)Landroid/app/Dialog;

    move-result-object v0

    .line 250
    :cond_0
    if-nez v0, :cond_1

    .line 251
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    .line 253
    :cond_1
    return-object v0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 238
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 239
    const/4 v0, 0x1

    .line 241
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 227
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onPause()V

    .line 228
    invoke-static {p0}, Lcom/a/a/c;->a(Landroid/content/Context;)V

    .line 229
    return-void
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 258
    invoke-super {p0, p1, p2}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onPrepareDialog(ILandroid/app/Dialog;)V

    .line 259
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySplash;->c:Lcom/yingyonghui/market/util/w;

    if-eqz v0, :cond_0

    .line 260
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySplash;->c:Lcom/yingyonghui/market/util/w;

    invoke-virtual {v0, p1, p2}, Lcom/yingyonghui/market/util/w;->a(ILandroid/app/Dialog;)V

    .line 262
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 4

    .prologue
    const/4 v3, 0x3

    .line 215
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onResume()V

    .line 216
    invoke-static {p0}, Lcom/a/a/c;->b(Landroid/content/Context;)V

    .line 217
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivitySplash;->i:Z

    if-eqz v0, :cond_0

    .line 218
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySplash;->m:Landroid/os/Handler;

    const-wide/16 v1, 0xbb8

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 219
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivitySplash;->i:Z

    .line 223
    :goto_0
    return-void

    .line 221
    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySplash;->m:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0
.end method

.method public onSearchRequested()Z
    .locals 1

    .prologue
    .line 233
    const/4 v0, 0x0

    return v0
.end method
