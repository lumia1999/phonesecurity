.class public final Lcom/yingyonghui/market/bc;
.super Landroid/widget/ArrayAdapter;
.source "AdapterListApp.java"


# static fields
.field private static final b:Ljava/lang/String;


# instance fields
.field public a:Lcom/yingyonghui/market/model/l;

.field private c:Landroid/view/LayoutInflater;

.field private d:I

.field private e:Landroid/content/Context;

.field private f:Landroid/graphics/drawable/Drawable;

.field private g:Lcom/yingyonghui/market/model/l;

.field private h:Landroid/os/Handler;

.field private i:Landroid/view/View$OnClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const-class v0, Lcom/yingyonghui/market/bc;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/bc;->b:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;I)V
    .locals 2
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 52
    iput-object v1, p0, Lcom/yingyonghui/market/bc;->f:Landroid/graphics/drawable/Drawable;

    .line 54
    iput-object v1, p0, Lcom/yingyonghui/market/bc;->g:Lcom/yingyonghui/market/model/l;

    .line 362
    new-instance v0, Lcom/yingyonghui/market/em;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/em;-><init>(Lcom/yingyonghui/market/bc;)V

    iput-object v0, p0, Lcom/yingyonghui/market/bc;->i:Landroid/view/View$OnClickListener;

    .line 61
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/yingyonghui/market/bc;->c:Landroid/view/LayoutInflater;

    .line 62
    iput-object p1, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    .line 63
    iput p3, p0, Lcom/yingyonghui/market/bc;->d:I

    .line 65
    iget-object v0, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    instance-of v0, v0, Lcom/yingyonghui/market/ActivityListApp;

    if-eqz v0, :cond_1

    .line 66
    check-cast p1, Lcom/yingyonghui/market/ActivityListApp;

    invoke-virtual {p1}, Lcom/yingyonghui/market/ActivityListApp;->b()Landroid/os/Handler;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/bc;->h:Landroid/os/Handler;

    .line 72
    :cond_0
    :goto_0
    return-void

    .line 67
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    instance-of v0, v0, Lcom/yingyonghui/market/ActivityListApp2;

    if-eqz v0, :cond_2

    .line 68
    check-cast p1, Lcom/yingyonghui/market/ActivityListApp2;

    invoke-virtual {p1}, Lcom/yingyonghui/market/ActivityListApp2;->b()Landroid/os/Handler;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/bc;->h:Landroid/os/Handler;

    goto :goto_0

    .line 69
    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    instance-of v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;

    if-eqz v0, :cond_0

    .line 70
    check-cast p1, Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-virtual {p1}, Lcom/yingyonghui/market/ActivityListAppManage;->a()Landroid/os/Handler;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/bc;->h:Landroid/os/Handler;

    goto :goto_0
.end method

.method static synthetic a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;
    .locals 1
    .parameter

    .prologue
    .line 43
    iget-object v0, p0, Lcom/yingyonghui/market/bc;->g:Lcom/yingyonghui/market/model/l;

    return-object v0
.end method

.method static synthetic a(Lcom/yingyonghui/market/bc;Lcom/yingyonghui/market/model/l;)Lcom/yingyonghui/market/model/l;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 43
    iput-object p1, p0, Lcom/yingyonghui/market/bc;->g:Lcom/yingyonghui/market/model/l;

    return-object p1
.end method

.method private a(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .parameter

    .prologue
    const-wide/32 v6, 0x5265c00

    .line 312
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 318
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 319
    const-wide/32 v4, 0x5265c00

    rem-long v4, v2, v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    sub-long/2addr v2, v4

    sub-long/2addr v2, v0

    .line 324
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gez v4, :cond_0

    .line 325
    iget-object v0, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0900ae

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 332
    :goto_0
    return-object v0

    .line 321
    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0900ad

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 326
    :cond_0
    cmp-long v2, v2, v6

    if-gez v2, :cond_1

    .line 327
    iget-object v0, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0900af

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 329
    :cond_1
    const-string v2, "yyyy-MM-dd"

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/r;->a(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static a(Landroid/widget/TextView;II)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 302
    if-eqz p1, :cond_0

    .line 303
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 306
    :cond_0
    if-eqz p2, :cond_1

    .line 307
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(I)V

    .line 309
    :cond_1
    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/bc;Ljava/lang/String;Z)V
    .locals 6
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v3, 0x0

    .line 43
    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_id"

    aput-object v1, v2, v0

    const/4 v0, 0x1

    const-string v1, "pkgname"

    aput-object v1, v2, v0

    iget-object v0, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/yingyonghui/market/provider/f;->a:Landroid/net/Uri;

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "_id"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    const-string v2, "pkgname"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    :cond_0
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "flg"

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v1, v2, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    sget-object v2, Lcom/yingyonghui/market/provider/f;->a:Landroid/net/Uri;

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v2, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    iget-object v4, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, v2, v1, v3, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_1
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_2
    return-void

    :cond_3
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_0
.end method

.method static synthetic b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;
    .locals 1
    .parameter

    .prologue
    .line 43
    iget-object v0, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic c(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/log/m;
    .locals 1
    .parameter

    .prologue
    .line 43
    iget-object v0, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    instance-of v0, v0, Lcom/yingyonghui/market/ActivityListApp;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    check-cast p0, Lcom/yingyonghui/market/ActivityListApp;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListApp;->a()Lcom/yingyonghui/market/log/m;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    instance-of v0, v0, Lcom/yingyonghui/market/ActivityListApp2;

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    check-cast p0, Lcom/yingyonghui/market/ActivityListApp2;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListApp2;->a()Lcom/yingyonghui/market/log/m;

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    instance-of v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;

    if-eqz v0, :cond_2

    iget-object p0, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    check-cast p0, Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppManage;->i()Lcom/yingyonghui/market/log/m;

    move-result-object v0

    goto :goto_0

    :cond_2
    new-instance v0, Lcom/yingyonghui/market/log/m;

    invoke-direct {v0}, Lcom/yingyonghui/market/log/m;-><init>()V

    goto :goto_0
.end method

.method static synthetic d(Lcom/yingyonghui/market/bc;)Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 43
    iget-object v0, p0, Lcom/yingyonghui/market/bc;->h:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method protected final a(Lcom/yingyonghui/market/model/l;)V
    .locals 12
    .parameter

    .prologue
    .line 336
    iget-object v0, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/yingyonghui/market/util/GlobalUtil;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    .line 337
    iget v0, p1, Lcom/yingyonghui/market/model/l;->n:I

    invoke-static {v0}, Lcom/yingyonghui/market/util/GlobalUtil;->a(I)Ljava/lang/String;

    move-result-object v10

    .line 342
    iget-object v0, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    invoke-static {v0}, Lcom/yingyonghui/market/downloader/n;->a(Landroid/content/Context;)Lcom/yingyonghui/market/downloader/n;

    move-result-object v0

    iget-object v1, p1, Lcom/yingyonghui/market/model/l;->g:Ljava/lang/String;

    iget v2, p1, Lcom/yingyonghui/market/model/l;->e:I

    iget-object v3, p1, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    iget-object v4, p1, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    iget v5, p1, Lcom/yingyonghui/market/model/l;->o:I

    iget v6, p1, Lcom/yingyonghui/market/model/l;->D:I

    iget-object v7, p1, Lcom/yingyonghui/market/model/l;->E:Ljava/lang/String;

    iget-object v8, p1, Lcom/yingyonghui/market/model/l;->F:Ljava/lang/String;

    iget-object v11, p1, Lcom/yingyonghui/market/model/l;->f:Ljava/lang/String;

    invoke-virtual/range {v0 .. v11}, Lcom/yingyonghui/market/downloader/n;->a(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 343
    iget-object v0, p0, Lcom/yingyonghui/market/bc;->h:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 344
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mHandler: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/bc;->h:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 345
    iget-object v0, p0, Lcom/yingyonghui/market/bc;->h:Landroid/os/Handler;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 348
    :cond_0
    return-void
.end method

.method public final getItemId(I)J
    .locals 2
    .parameter

    .prologue
    .line 76
    invoke-virtual {p0, p1}, Lcom/yingyonghui/market/bc;->getItem(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/yingyonghui/market/model/l;

    iget v0, p0, Lcom/yingyonghui/market/model/l;->e:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public final getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10
    .parameter
    .parameter
    .parameter

    .prologue
    .line 94
    invoke-virtual {p0, p1}, Lcom/yingyonghui/market/bc;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/l;

    .line 95
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/yingyonghui/market/bc;->f:Landroid/graphics/drawable/Drawable;

    .line 97
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/yingyonghui/market/k;

    if-nez v1, :cond_a

    .line 98
    :cond_0
    iget-object v1, p0, Lcom/yingyonghui/market/bc;->c:Landroid/view/LayoutInflater;

    const v2, 0x7f030014

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 99
    new-instance v2, Lcom/yingyonghui/market/k;

    invoke-direct {v2}, Lcom/yingyonghui/market/k;-><init>()V

    .line 100
    const v3, 0x7f0b003f

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, v2, Lcom/yingyonghui/market/k;->a:Landroid/widget/ImageView;

    .line 101
    const v3, 0x7f0b006e

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, v2, Lcom/yingyonghui/market/k;->b:Landroid/widget/TextView;

    .line 102
    const v3, 0x7f0b0041

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, v2, Lcom/yingyonghui/market/k;->c:Landroid/widget/TextView;

    .line 103
    const v3, 0x7f0b0072

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, v2, Lcom/yingyonghui/market/k;->d:Landroid/widget/TextView;

    .line 104
    const v3, 0x7f0b0043

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/RatingBar;

    iput-object p2, v2, Lcom/yingyonghui/market/k;->e:Landroid/widget/RatingBar;

    .line 105
    const v3, 0x7f0b006f

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, v2, Lcom/yingyonghui/market/k;->f:Landroid/widget/TextView;

    .line 106
    const v3, 0x7f0b0042

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, v2, Lcom/yingyonghui/market/k;->g:Landroid/widget/TextView;

    .line 108
    const v3, 0x7f0b0070

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, v2, Lcom/yingyonghui/market/k;->h:Landroid/widget/TextView;

    .line 109
    const v3, 0x7f0b0071

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, v2, Lcom/yingyonghui/market/k;->i:Landroid/widget/TextView;

    .line 110
    iget-object v3, v2, Lcom/yingyonghui/market/k;->d:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/yingyonghui/market/bc;->i:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    iget-object v3, v2, Lcom/yingyonghui/market/k;->h:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/yingyonghui/market/bc;->i:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 113
    iget-object v3, v2, Lcom/yingyonghui/market/k;->i:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/yingyonghui/market/bc;->i:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 115
    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    move-object v9, v2

    move-object v2, v1

    move-object v1, v9

    .line 121
    :goto_0
    rem-int/lit8 v3, p1, 0x2

    if-eqz v3, :cond_b

    .line 122
    const v3, 0x7f020055

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 127
    :goto_1
    iget-object v3, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    instance-of v3, v3, Lcom/yingyonghui/market/ActivityListApp2;

    if-eqz v3, :cond_c

    .line 128
    iget-object p2, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    check-cast p2, Lcom/yingyonghui/market/ActivityListApp2;

    iget-object v3, v0, Lcom/yingyonghui/market/model/l;->f:Ljava/lang/String;

    invoke-virtual {p2, v3}, Lcom/yingyonghui/market/ActivityListApp2;->a(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, p0, Lcom/yingyonghui/market/bc;->f:Landroid/graphics/drawable/Drawable;

    .line 147
    :cond_1
    :goto_2
    iget-object v3, v1, Lcom/yingyonghui/market/k;->a:Landroid/widget/ImageView;

    iget-object p2, p0, Lcom/yingyonghui/market/bc;->f:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_2

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_2
    instance-of v4, p2, Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_3

    check-cast p2, Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 149
    :cond_3
    iget-object v3, v1, Lcom/yingyonghui/market/k;->b:Landroid/widget/TextView;

    iget-object v4, v0, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    iget-object v3, v1, Lcom/yingyonghui/market/k;->c:Landroid/widget/TextView;

    iget-object v4, v0, Lcom/yingyonghui/market/model/l;->p:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    iget-object v3, v1, Lcom/yingyonghui/market/k;->e:Landroid/widget/RatingBar;

    iget v4, v0, Lcom/yingyonghui/market/model/l;->l:F

    invoke-virtual {v3, v4}, Landroid/widget/RatingBar;->setRating(F)V

    .line 153
    iget v3, p0, Lcom/yingyonghui/market/bc;->d:I

    const/16 v4, 0x385

    if-ne v3, v4, :cond_4

    .line 154
    iget-object v3, v1, Lcom/yingyonghui/market/k;->f:Landroid/widget/TextView;

    iget-object v4, v0, Lcom/yingyonghui/market/model/l;->r:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/yingyonghui/market/bc;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 157
    :cond_4
    iget-object v3, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    iget-object v4, v0, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/yingyonghui/market/provider/k;->a(Landroid/content/Context;Ljava/lang/String;)Lcom/yingyonghui/market/provider/m;

    move-result-object v3

    .line 158
    if-nez v3, :cond_5

    .line 159
    sget-object v3, Lcom/yingyonghui/market/provider/m;->a:Lcom/yingyonghui/market/provider/m;

    .line 162
    :cond_5
    const/4 v4, 0x0

    .line 163
    const/4 v5, 0x0

    .line 165
    :try_start_0
    iget-object v6, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    iget-object v7, v0, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v6

    .line 166
    iget v7, v0, Lcom/yingyonghui/market/model/l;->s:I

    iget v5, v6, Landroid/content/pm/PackageInfo;->versionCode:I

    if-le v7, v5, :cond_10

    const/4 v5, 0x1

    .line 167
    :goto_3
    iget v4, v6, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v4, :cond_11

    const/4 v4, 0x1

    :goto_4
    move v9, v5

    move v5, v4

    move v4, v9

    .line 171
    :goto_5
    iget-object v6, v1, Lcom/yingyonghui/market/k;->d:Landroid/widget/TextView;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 172
    iget-object v6, v1, Lcom/yingyonghui/market/k;->h:Landroid/widget/TextView;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 173
    iget-object v6, v1, Lcom/yingyonghui/market/k;->i:Landroid/widget/TextView;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 175
    const/4 v6, 0x0

    .line 178
    iget-object v7, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    instance-of v7, v7, Lcom/yingyonghui/market/ActivityListAppManage;

    if-eqz v7, :cond_14

    iget-object p2, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    check-cast p2, Lcom/yingyonghui/market/ActivityListAppManage;

    iget v7, p2, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    const/4 v8, 0x2

    if-ne v7, v8, :cond_14

    .line 180
    iget-object v7, v0, Lcom/yingyonghui/market/model/l;->O:Ljava/lang/String;

    const-string v8, "0"

    invoke-static {v7, v8}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_13

    .line 181
    sget-object v7, Lcom/yingyonghui/market/provider/m;->b:Lcom/yingyonghui/market/provider/m;

    if-eq v3, v7, :cond_6

    sget-object v7, Lcom/yingyonghui/market/provider/m;->h:Lcom/yingyonghui/market/provider/m;

    if-ne v3, v7, :cond_12

    .line 183
    :cond_6
    iget-object v1, v1, Lcom/yingyonghui/market/k;->d:Landroid/widget/TextView;

    move-object v9, v6

    move-object v6, v1

    move-object v1, v9

    .line 198
    :goto_6
    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 199
    if-eqz v1, :cond_7

    .line 200
    const/4 v7, 0x0

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 203
    :cond_7
    iget-object v7, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    instance-of v7, v7, Lcom/yingyonghui/market/ActivityListAppManage;

    if-eqz v7, :cond_16

    iget-object p2, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    check-cast p2, Lcom/yingyonghui/market/ActivityListAppManage;

    iget v7, p2, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    const/4 v8, 0x3

    if-ne v7, v8, :cond_16

    .line 205
    iget v0, v0, Lcom/yingyonghui/market/model/l;->H:I

    if-nez v0, :cond_15

    .line 206
    const v0, 0x7f020057

    const v3, 0x7f090118

    invoke-static {v6, v0, v3}, Lcom/yingyonghui/market/bc;->a(Landroid/widget/TextView;II)V

    .line 207
    const-string v0, "transfer_sd"

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 273
    :cond_8
    :goto_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "-"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v6}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_26

    const-string v3, "empty"

    :goto_8
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 274
    if-eqz v1, :cond_9

    .line 275
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "-"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_27

    const-string v3, "empty"

    :goto_9
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 278
    :cond_9
    return-object v2

    .line 117
    :cond_a
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/yingyonghui/market/k;

    move-object v1, p3

    move-object v2, p2

    goto/16 :goto_0

    .line 124
    :cond_b
    const v3, 0x7f020056

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_1

    .line 129
    :cond_c
    iget-object v3, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    instance-of v3, v3, Lcom/yingyonghui/market/ActivityListApp;

    if-eqz v3, :cond_d

    .line 130
    iget-object p2, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    check-cast p2, Lcom/yingyonghui/market/ActivityListApp;

    iget-object v3, v0, Lcom/yingyonghui/market/model/l;->f:Ljava/lang/String;

    invoke-virtual {p2, v3}, Lcom/yingyonghui/market/ActivityListApp;->a(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, p0, Lcom/yingyonghui/market/bc;->f:Landroid/graphics/drawable/Drawable;

    goto/16 :goto_2

    .line 131
    :cond_d
    iget-object v3, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    instance-of v3, v3, Lcom/yingyonghui/market/ActivityListAppManage;

    if-eqz v3, :cond_1

    .line 132
    iget-object v3, v0, Lcom/yingyonghui/market/model/l;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_f

    .line 133
    iget-object v3, v0, Lcom/yingyonghui/market/model/l;->h:Landroid/graphics/drawable/Drawable;

    iput-object v3, p0, Lcom/yingyonghui/market/bc;->f:Landroid/graphics/drawable/Drawable;

    .line 142
    :cond_e
    :goto_a
    iget-object v3, v1, Lcom/yingyonghui/market/k;->g:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    const v6, 0x7f090132

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Lcom/yingyonghui/market/model/l;->q:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 143
    iget-object v3, v1, Lcom/yingyonghui/market/k;->e:Landroid/widget/RatingBar;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/RatingBar;->setVisibility(I)V

    .line 144
    iget-object v3, v1, Lcom/yingyonghui/market/k;->g:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_2

    .line 136
    :cond_f
    iget-object p2, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    check-cast p2, Lcom/yingyonghui/market/ActivityListAppManage;

    iget-object v3, v0, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {p2, v3}, Lcom/yingyonghui/market/util/GlobalUtil;->j(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 137
    if-eqz v3, :cond_e

    .line 138
    iput-object v3, p0, Lcom/yingyonghui/market/bc;->f:Landroid/graphics/drawable/Drawable;

    goto :goto_a

    .line 166
    :cond_10
    const/4 v5, 0x0

    goto/16 :goto_3

    .line 167
    :cond_11
    const/4 v4, 0x0

    goto/16 :goto_4

    :catch_0
    move-exception v6

    move v9, v5

    move v5, v4

    move v4, v9

    goto/16 :goto_5

    .line 185
    :cond_12
    iget-object v6, v1, Lcom/yingyonghui/market/k;->h:Landroid/widget/TextView;

    .line 186
    iget-object v1, v1, Lcom/yingyonghui/market/k;->i:Landroid/widget/TextView;

    .line 188
    const v7, 0x7f02004b

    const v8, 0x7f09015d

    invoke-static {v1, v7, v8}, Lcom/yingyonghui/market/bc;->a(Landroid/widget/TextView;II)V

    .line 189
    const-string v7, "ignore"

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 192
    :cond_13
    iget-object v1, v1, Lcom/yingyonghui/market/k;->d:Landroid/widget/TextView;

    move-object v9, v6

    move-object v6, v1

    move-object v1, v9

    goto/16 :goto_6

    .line 195
    :cond_14
    iget-object v1, v1, Lcom/yingyonghui/market/k;->d:Landroid/widget/TextView;

    move-object v9, v6

    move-object v6, v1

    move-object v1, v9

    goto/16 :goto_6

    .line 209
    :cond_15
    const v0, 0x7f02004b

    const v3, 0x7f090119

    invoke-static {v6, v0, v3}, Lcom/yingyonghui/market/bc;->a(Landroid/widget/TextView;II)V

    .line 210
    const-string v0, "transfer_mem"

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_7

    .line 213
    :cond_16
    iget-object v7, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    instance-of v7, v7, Lcom/yingyonghui/market/ActivityListAppManage;

    if-eqz v7, :cond_18

    iget-object p2, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    check-cast p2, Lcom/yingyonghui/market/ActivityListAppManage;

    iget v7, p2, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    const/4 v8, 0x2

    if-ne v7, v8, :cond_18

    iget-object v7, v0, Lcom/yingyonghui/market/model/l;->O:Ljava/lang/String;

    const-string v8, "0"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_18

    .line 216
    const v0, 0x7f02004b

    const v4, 0x7f09015e

    invoke-static {v6, v0, v4}, Lcom/yingyonghui/market/bc;->a(Landroid/widget/TextView;II)V

    .line 217
    const-string v0, "unignore"

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 219
    sget-object v0, Lcom/yingyonghui/market/provider/m;->b:Lcom/yingyonghui/market/provider/m;

    if-eq v3, v0, :cond_17

    sget-object v0, Lcom/yingyonghui/market/provider/m;->h:Lcom/yingyonghui/market/provider/m;

    if-ne v3, v0, :cond_8

    .line 221
    :cond_17
    const v0, 0x7f02004f

    const v3, 0x7f0900a1

    invoke-static {v6, v0, v3}, Lcom/yingyonghui/market/bc;->a(Landroid/widget/TextView;II)V

    goto/16 :goto_7

    .line 223
    :cond_18
    sget-object v7, Lcom/yingyonghui/market/provider/m;->b:Lcom/yingyonghui/market/provider/m;

    if-eq v3, v7, :cond_19

    sget-object v7, Lcom/yingyonghui/market/provider/m;->h:Lcom/yingyonghui/market/provider/m;

    if-ne v3, v7, :cond_1a

    .line 225
    :cond_19
    const v0, 0x7f02004f

    const v3, 0x7f0900a1

    invoke-static {v6, v0, v3}, Lcom/yingyonghui/market/bc;->a(Landroid/widget/TextView;II)V

    goto/16 :goto_7

    .line 226
    :cond_1a
    sget-object v7, Lcom/yingyonghui/market/provider/m;->f:Lcom/yingyonghui/market/provider/m;

    if-eq v3, v7, :cond_1b

    sget-object v7, Lcom/yingyonghui/market/provider/m;->m:Lcom/yingyonghui/market/provider/m;

    if-ne v3, v7, :cond_1d

    .line 228
    :cond_1b
    if-eqz v4, :cond_1c

    .line 229
    const v0, 0x7f020057

    const v3, 0x7f09006e

    invoke-static {v6, v0, v3}, Lcom/yingyonghui/market/bc;->a(Landroid/widget/TextView;II)V

    .line 230
    const-string v0, "update"

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_7

    .line 232
    :cond_1c
    const v0, 0x7f02004f

    const v3, 0x7f090069

    invoke-static {v6, v0, v3}, Lcom/yingyonghui/market/bc;->a(Landroid/widget/TextView;II)V

    goto/16 :goto_7

    .line 234
    :cond_1d
    sget-object v7, Lcom/yingyonghui/market/provider/m;->j:Lcom/yingyonghui/market/provider/m;

    if-eq v3, v7, :cond_1e

    sget-object v7, Lcom/yingyonghui/market/provider/m;->d:Lcom/yingyonghui/market/provider/m;

    if-ne v3, v7, :cond_23

    .line 236
    :cond_1e
    iget-object v5, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    iget-object v0, v0, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v5, v0}, Lcom/yingyonghui/market/provider/k;->a(Landroid/content/ContentResolver;Ljava/lang/String;)Lcom/yingyonghui/market/provider/k;

    move-result-object v0

    .line 237
    iget-object v5, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/yingyonghui/market/provider/k;->a(Landroid/content/ContentResolver;)Ljava/io/File;

    move-result-object v5

    .line 238
    if-eqz v5, :cond_1f

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1f

    .line 239
    const v0, 0x7f020057

    const v3, 0x7f09006d

    invoke-static {v6, v0, v3}, Lcom/yingyonghui/market/bc;->a(Landroid/widget/TextView;II)V

    .line 240
    const-string v0, "install"

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_7

    .line 242
    :cond_1f
    sget-object v5, Lcom/yingyonghui/market/provider/m;->j:Lcom/yingyonghui/market/provider/m;

    if-eq v3, v5, :cond_20

    sget-object v5, Lcom/yingyonghui/market/provider/m;->k:Lcom/yingyonghui/market/provider/m;

    if-ne v3, v5, :cond_21

    .line 243
    :cond_20
    sget-object v3, Lcom/yingyonghui/market/provider/m;->l:Lcom/yingyonghui/market/provider/m;

    invoke-virtual {v0, v3}, Lcom/yingyonghui/market/provider/k;->a(Lcom/yingyonghui/market/provider/m;)V

    .line 247
    :goto_b
    iget-object v3, p0, Lcom/yingyonghui/market/bc;->e:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/yingyonghui/market/provider/k;->b(Landroid/content/ContentResolver;)V

    .line 249
    if-eqz v4, :cond_22

    .line 250
    const v0, 0x7f020057

    const v3, 0x7f09006e

    invoke-static {v6, v0, v3}, Lcom/yingyonghui/market/bc;->a(Landroid/widget/TextView;II)V

    .line 251
    const-string v0, "update"

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_7

    .line 245
    :cond_21
    sget-object v3, Lcom/yingyonghui/market/provider/m;->g:Lcom/yingyonghui/market/provider/m;

    invoke-virtual {v0, v3}, Lcom/yingyonghui/market/provider/k;->a(Lcom/yingyonghui/market/provider/m;)V

    goto :goto_b

    .line 253
    :cond_22
    const v0, 0x7f02004b

    const v3, 0x7f09006c

    invoke-static {v6, v0, v3}, Lcom/yingyonghui/market/bc;->a(Landroid/widget/TextView;II)V

    .line 254
    const-string v0, "down"

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_7

    .line 258
    :cond_23
    if-eqz v4, :cond_24

    .line 259
    const v0, 0x7f020057

    const v3, 0x7f09006e

    invoke-static {v6, v0, v3}, Lcom/yingyonghui/market/bc;->a(Landroid/widget/TextView;II)V

    .line 260
    const-string v0, "update"

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_7

    .line 261
    :cond_24
    if-eqz v5, :cond_25

    .line 262
    const v0, 0x7f02004f

    const v3, 0x7f090069

    invoke-static {v6, v0, v3}, Lcom/yingyonghui/market/bc;->a(Landroid/widget/TextView;II)V

    goto/16 :goto_7

    .line 264
    :cond_25
    const v0, 0x7f02004b

    const v3, 0x7f09006c

    invoke-static {v6, v0, v3}, Lcom/yingyonghui/market/bc;->a(Landroid/widget/TextView;II)V

    .line 265
    const-string v0, "down"

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_7

    .line 273
    :cond_26
    invoke-virtual {v6}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v3

    goto/16 :goto_8

    .line 275
    :cond_27
    invoke-virtual {v1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v3

    goto/16 :goto_9
.end method
