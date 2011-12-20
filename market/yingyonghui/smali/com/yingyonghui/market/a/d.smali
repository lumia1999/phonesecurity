.class public final Lcom/yingyonghui/market/a/d;
.super Ljava/lang/Object;
.source "HttpService.java"


# static fields
.field public static a:Ljava/lang/String;

.field private static b:Lcom/yingyonghui/market/a/d;


# instance fields
.field private c:Lcom/yingyonghui/market/a/k;

.field private d:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-string v0, "market.MarketAPI"

    sput-object v0, Lcom/yingyonghui/market/a/d;->a:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter

    .prologue
    .line 364
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 365
    iput-object p1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    .line 366
    invoke-static {p1}, Lcom/yingyonghui/market/a/k;->a(Landroid/content/Context;)Lcom/yingyonghui/market/a/k;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    .line 367
    return-void
.end method

.method public static a(Landroid/content/Context;)Lcom/yingyonghui/market/a/d;
    .locals 1
    .parameter

    .prologue
    .line 41
    sget-object v0, Lcom/yingyonghui/market/a/d;->b:Lcom/yingyonghui/market/a/d;

    if-nez v0, :cond_0

    .line 42
    new-instance v0, Lcom/yingyonghui/market/a/d;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/a/d;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/yingyonghui/market/a/d;->b:Lcom/yingyonghui/market/a/d;

    .line 44
    :cond_0
    sget-object v0, Lcom/yingyonghui/market/a/d;->b:Lcom/yingyonghui/market/a/d;

    return-object v0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 184
    invoke-static {p0, p1}, Lcom/yingyonghui/market/b/b;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public static a(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 176
    invoke-static {p0}, Lcom/yingyonghui/market/b/b;->c(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public static a(Ljava/lang/String;I)Ljava/util/ArrayList;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 96
    invoke-static {p0, p1}, Lcom/yingyonghui/market/b/b;->a(Ljava/lang/String;I)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method private a(Ljava/util/List;)V
    .locals 3
    .parameter

    .prologue
    .line 462
    new-instance v0, Lorg/apache/http/message/BasicNameValuePair;

    const-string v1, "key"

    const-string v2, ""

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 463
    new-instance v0, Lorg/apache/http/message/BasicNameValuePair;

    const-string v1, "referer"

    iget-object v2, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v2}, Lcom/yingyonghui/market/util/GlobalUtil;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 465
    new-instance v0, Lorg/apache/http/message/BasicNameValuePair;

    const-string v1, "api"

    sget-object v2, Lcom/yingyonghui/market/a/d;->a:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 466
    new-instance v0, Lorg/apache/http/message/BasicNameValuePair;

    const-string v1, "deviceId"

    iget-object v2, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v2}, Lcom/yingyonghui/market/util/p;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 468
    return-void
.end method

.method public static b(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 180
    invoke-static {p0}, Lcom/yingyonghui/market/b/b;->d(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public static b(Landroid/content/Context;Ljava/lang/String;)[Ljava/lang/Object;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 283
    invoke-static {p0, p1}, Lcom/yingyonghui/market/b/b;->c(Landroid/content/Context;Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static c(Landroid/content/Context;Ljava/lang/String;)Lcom/yingyonghui/market/model/j;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 297
    invoke-static {p0, p1}, Lcom/yingyonghui/market/b/b;->b(Landroid/content/Context;Ljava/lang/String;)Lcom/yingyonghui/market/model/j;

    move-result-object v0

    return-object v0
.end method

.method public static c(Ljava/lang/String;)[Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 200
    invoke-static {p0}, Lcom/yingyonghui/market/b/b;->b(Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static d(Ljava/lang/String;)Lcom/yingyonghui/market/model/a;
    .locals 1
    .parameter

    .prologue
    .line 370
    invoke-static {p0}, Lcom/yingyonghui/market/b/b;->a(Ljava/lang/String;)Lcom/yingyonghui/market/model/a;

    move-result-object v0

    return-object v0
.end method

.method public static d(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 357
    invoke-static {p0, p1}, Lcom/yingyonghui/market/b/b;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public static e(Landroid/content/Context;Ljava/lang/String;)Lcom/yingyonghui/market/model/l;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 361
    invoke-static {p0, p1}, Lcom/yingyonghui/market/b/b;->b(Landroid/content/Context;Ljava/lang/String;)Lcom/yingyonghui/market/model/j;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final a(IIJLjava/lang/String;Ljava/lang/String;JJJLjava/lang/String;Landroid/os/Handler;)Ljava/lang/String;
    .locals 13
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
    .line 232
    new-instance v12, Ljava/util/ArrayList;

    const/4 v4, 0x5

    invoke-direct {v12, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 233
    invoke-direct {p0, v12}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 235
    sget-object v4, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    .line 236
    iget-object v5, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v5}, Lcom/yingyonghui/market/util/p;->d(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget v7, v5, Landroid/graphics/Rect;->right:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "x"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 237
    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-static {v6}, Lcom/yingyonghui/market/util/c;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 238
    iget-object v7, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v7}, Lcom/yingyonghui/market/util/p;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    .line 239
    iget-object v8, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v8}, Lcom/yingyonghui/market/util/p;->e(Landroid/content/Context;)F

    move-result v8

    .line 240
    iget-object v9, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v9}, Lcom/yingyonghui/market/util/p;->f(Landroid/content/Context;)I

    move-result v9

    .line 242
    const/4 v10, 0x6

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    aput-object v6, v10, v11

    const/4 v6, 0x1

    aput-object v7, v10, v6

    const/4 v6, 0x2

    aput-object v5, v10, v6

    const/4 v5, 0x3

    aput-object v4, v10, v5

    const/4 v4, 0x4

    invoke-static {v8}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v10, v4

    const/4 v4, 0x5

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v10, v4

    .line 244
    const/4 v4, 0x4

    new-array v11, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static/range {p7 .. p8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v11, v4

    const/4 v4, 0x1

    invoke-static/range {p9 .. p10}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v11, v4

    const/4 v4, 0x2

    invoke-static/range {p11 .. p12}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v11, v4

    const/4 v4, 0x3

    aput-object p13, v11, v4

    .line 248
    iget-object v4, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v4}, Lcom/yingyonghui/market/util/g;->f(Landroid/content/Context;)[Ljava/lang/String;

    .line 250
    iget-object v4, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    move v5, p1

    move v6, p2

    move-wide/from16 v7, p3

    move-object/from16 v9, p5

    move-object/from16 v10, p6

    invoke-static/range {v4 .. v11}, Lcom/yingyonghui/market/b/a;->a(Landroid/content/Context;IIJLjava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 255
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    const-string v6, "param"

    invoke-direct {v5, v6, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v12, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    iget-object v5, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v6, 0x66

    move-object v0, v5

    move-object v1, v12

    move v2, v6

    move-object/from16 v3, p14

    invoke-virtual {v0, v1, v2, v3}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 258
    return-object v4
.end method

.method public final a()V
    .locals 1

    .prologue
    .line 481
    iget-object v0, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    invoke-virtual {v0}, Lcom/yingyonghui/market/a/k;->b()V

    .line 482
    return-void
.end method

.method public final a(IILandroid/os/Handler;)V
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    .line 84
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 85
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 87
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    const-string v2, "app.list.recommend"

    invoke-static {v1, v2, p1, p2}, Lcom/yingyonghui/market/b/a;->a(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    .line 89
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v2, 0x64

    invoke-virtual {v1, v0, v2, p3}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 92
    return-void
.end method

.method public final a(IILjava/lang/String;IILandroid/os/Handler;)V
    .locals 7
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 206
    new-instance v6, Ljava/util/ArrayList;

    const/4 v0, 0x5

    invoke-direct {v6, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 207
    invoke-direct {p0, v6}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 209
    iget-object v0, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    move v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-static/range {v0 .. v5}, Lcom/yingyonghui/market/b/a;->a(Landroid/content/Context;IILjava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    .line 211
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "param"

    invoke-direct {v1, v2, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v6, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 212
    iget-object v0, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v1, 0x64

    invoke-virtual {v0, v6, v1, p6}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 213
    return-void
.end method

.method public final a(ILandroid/os/Handler;)V
    .locals 4
    .parameter
    .parameter

    .prologue
    .line 217
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 218
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 220
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/yingyonghui/market/b/a;->b(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v1

    .line 222
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 224
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v2, 0x385

    invoke-virtual {v1, v0, v2, p2}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 225
    return-void
.end method

.method public final a(ILjava/lang/String;ILandroid/os/Handler;)V
    .locals 4
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 336
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 337
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 339
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p1, p2}, Lcom/yingyonghui/market/b/a;->a(Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 340
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 342
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    invoke-virtual {v1, v0, p3, p1, p4}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;IILandroid/os/Handler;)V

    .line 343
    return-void
.end method

.method public final a(Landroid/os/Handler;)V
    .locals 4
    .parameter

    .prologue
    .line 136
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 137
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 139
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1}, Lcom/yingyonghui/market/b/a;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 140
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2, p1}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 143
    return-void
.end method

.method public final a(Ljava/lang/String;IILandroid/os/Handler;)V
    .locals 4
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 273
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 274
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 276
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p1, p2}, Lcom/yingyonghui/market/b/a;->e(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 277
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 278
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    invoke-virtual {v1, v0, p3, p4}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 279
    return-void
.end method

.method public final a(Ljava/lang/String;IILjava/lang/String;Landroid/os/Handler;)V
    .locals 4
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 49
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 50
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 52
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p1, p2, p4, p3}, Lcom/yingyonghui/market/b/a;->a(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 54
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v2, 0x6d

    invoke-virtual {v1, v0, v2, p5}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 57
    return-void
.end method

.method public final a(Ljava/lang/String;ILandroid/os/Handler;)V
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    .line 60
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 61
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 63
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p1, p2}, Lcom/yingyonghui/market/b/a;->a(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 65
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v2, 0x6b

    invoke-virtual {v1, v0, v2, p3}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 68
    return-void
.end method

.method public final a(Ljava/lang/String;ILjava/lang/String;Landroid/os/Handler;)V
    .locals 4
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 72
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 73
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 75
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p1, p3, p2}, Lcom/yingyonghui/market/b/a;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 77
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v2, 0x66

    invoke-virtual {v1, v0, v2, p4}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 80
    return-void
.end method

.method public final a(Ljava/lang/String;Landroid/os/Handler;)V
    .locals 4
    .parameter
    .parameter

    .prologue
    .line 287
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 288
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 290
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/yingyonghui/market/b/a;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 291
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 293
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v2, 0x3e4

    invoke-virtual {v1, v0, v2, p2}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 294
    return-void
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    .line 262
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 263
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 265
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p1, p2, p3}, Lcom/yingyonghui/market/b/a;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 267
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 268
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    invoke-virtual {v1, v0}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;)V

    .line 269
    return-void
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/os/Handler;)V
    .locals 4
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 101
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 102
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 104
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p1, p2, p3, p4}, Lcom/yingyonghui/market/b/a;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 106
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v2, 0x66

    invoke-virtual {v1, v0, v2, p5}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 109
    return-void
.end method

.method public final a(Ljava/util/ArrayList;Landroid/os/Handler;)V
    .locals 4
    .parameter
    .parameter

    .prologue
    .line 348
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 349
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 351
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/yingyonghui/market/b/a;->a(Landroid/content/Context;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v1

    .line 352
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 353
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v2, 0x64

    invoke-virtual {v1, v0, v2, p2}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 354
    return-void
.end method

.method public final a([BLjava/lang/String;Landroid/os/Handler;)V
    .locals 5
    .parameter
    .parameter
    .parameter

    .prologue
    .line 449
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 450
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 452
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p2}, Lcom/yingyonghui/market/util/GlobalUtil;->h(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v1

    .line 454
    iget-object v3, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {p1}, Lcom/yingyonghui/market/util/q;->a([B)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1, v2}, Lcom/yingyonghui/market/b/a;->a(Landroid/content/Context;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v1

    .line 456
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 458
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    invoke-virtual {v1, v0, p1, p2, p3}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;[BLjava/lang/String;Landroid/os/Handler;)V

    .line 459
    return-void
.end method

.method public final b(IILandroid/os/Handler;)V
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    .line 125
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 126
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 128
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p1, p2}, Lcom/yingyonghui/market/b/a;->a(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    .line 130
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v2, 0x3e2

    invoke-virtual {v1, v0, v2, p3}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 133
    return-void
.end method

.method public final b(ILandroid/os/Handler;)V
    .locals 5
    .parameter
    .parameter

    .prologue
    const/4 v4, 0x5

    .line 311
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 312
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 314
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/yingyonghui/market/b/a;->a(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v1

    .line 316
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 317
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v4, :cond_0

    .line 318
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v2, 0x384

    invoke-virtual {v1, v0, v2, p2}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 320
    :cond_0
    return-void
.end method

.method public final b(Landroid/os/Handler;)V
    .locals 4
    .parameter

    .prologue
    .line 301
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 302
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 304
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1}, Lcom/yingyonghui/market/b/a;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 305
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v2, 0x69

    invoke-virtual {v1, v0, v2, p1}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 308
    return-void
.end method

.method public final b(Ljava/lang/String;I)V
    .locals 4
    .parameter
    .parameter

    .prologue
    .line 166
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 167
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 169
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p1, p2}, Lcom/yingyonghui/market/b/a;->d(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 170
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    invoke-virtual {v1, v0}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;)V

    .line 173
    return-void
.end method

.method public final b(Ljava/lang/String;IILandroid/os/Handler;)V
    .locals 3
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 431
    iget-object v0, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    const-string v1, "com.yingyonghui.market_preferences"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 433
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1}, Lcom/yingyonghui/market/util/g;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "WiFi"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 434
    iget-object v0, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/yingyonghui/market/a/k;->a(Ljava/lang/String;IILandroid/os/Handler;)V

    .line 441
    :cond_0
    :goto_0
    return-void

    .line 436
    :cond_1
    const-string v1, "checkbox_display_icons"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 437
    if-eqz v0, :cond_0

    .line 438
    iget-object v0, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/yingyonghui/market/a/k;->a(Ljava/lang/String;IILandroid/os/Handler;)V

    goto :goto_0
.end method

.method public final b(Ljava/lang/String;ILandroid/os/Handler;)V
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    .line 113
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 114
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 116
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p1, p2}, Lcom/yingyonghui/market/b/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 118
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v2, 0x68

    invoke-virtual {v1, v0, v2, p3}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 121
    return-void
.end method

.method public final b(Ljava/lang/String;Landroid/os/Handler;)V
    .locals 4
    .parameter
    .parameter

    .prologue
    .line 324
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 325
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 327
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/yingyonghui/market/b/a;->b(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 329
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 331
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v2, 0x64

    invoke-virtual {v1, v0, v2, p2}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 332
    return-void
.end method

.method public final c(IILandroid/os/Handler;)V
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    .line 189
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 190
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 192
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p1, p2}, Lcom/yingyonghui/market/b/a;->b(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    .line 194
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v2, 0x384

    invoke-virtual {v1, v0, v2, p3}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 197
    return-void
.end method

.method public final c(Ljava/lang/String;ILandroid/os/Handler;)V
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    .line 156
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 157
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/List;)V

    .line 159
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v1, p1, p2}, Lcom/yingyonghui/market/b/a;->c(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 160
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "param"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    iget-object v1, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v2, 0x65

    invoke-virtual {v1, v0, v2, p3}, Lcom/yingyonghui/market/a/k;->a(Ljava/util/List;ILandroid/os/Handler;)V

    .line 163
    return-void
.end method

.method public final c(Ljava/lang/String;Landroid/os/Handler;)V
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 445
    iget-object v0, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    const/16 v1, 0x6c

    invoke-virtual {v0, p1, v1, p2}, Lcom/yingyonghui/market/a/k;->a(Ljava/lang/String;ILandroid/os/Handler;)V

    .line 446
    return-void
.end method

.method public final d(Ljava/lang/String;ILandroid/os/Handler;)V
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v3, 0x1

    .line 406
    iget-object v0, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    const-string v1, "com.yingyonghui.market_preferences"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 408
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p1}, Lcom/yingyonghui/market/util/y;->a(Ljava/lang/String;)Lcom/yingyonghui/market/model/h;

    move-result-object v1

    .line 411
    iget-object v2, p0, Lcom/yingyonghui/market/a/d;->d:Landroid/content/Context;

    invoke-static {v2}, Lcom/yingyonghui/market/util/g;->c(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 413
    iget-boolean v0, v1, Lcom/yingyonghui/market/model/h;->b:Z

    if-nez v0, :cond_0

    .line 414
    iget-object v0, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    invoke-virtual {v0, p1, p2, p3}, Lcom/yingyonghui/market/a/k;->a(Ljava/lang/String;ILandroid/os/Handler;)V

    .line 415
    iput-boolean v3, v1, Lcom/yingyonghui/market/model/h;->b:Z

    .line 426
    :cond_0
    :goto_0
    return-void

    .line 418
    :cond_1
    const-string v2, "checkbox_display_icons"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 419
    if-eqz v0, :cond_0

    .line 420
    iget-boolean v0, v1, Lcom/yingyonghui/market/model/h;->b:Z

    if-nez v0, :cond_0

    .line 421
    iget-object v0, p0, Lcom/yingyonghui/market/a/d;->c:Lcom/yingyonghui/market/a/k;

    invoke-virtual {v0, p1, p2, p3}, Lcom/yingyonghui/market/a/k;->a(Ljava/lang/String;ILandroid/os/Handler;)V

    .line 422
    iput-boolean v3, v1, Lcom/yingyonghui/market/model/h;->b:Z

    goto :goto_0
.end method
