.class public Lcom/yingyonghui/market/a/k;
.super Ljava/lang/Object;
.source "HttpManager.java"


# static fields
.field public static a:Ljava/lang/String;

.field public static b:Ljava/lang/String;

.field private static c:Lcom/yingyonghui/market/a/k;


# instance fields
.field private d:Landroid/content/Context;

.field private e:Ljava/util/Queue;

.field private f:Ljava/lang/Integer;

.field private g:Lcom/yingyonghui/market/a/m;

.field private h:I

.field private i:Landroid/os/Handler;

.field private j:[Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-string v0, "http://mobile.appchina.com/market/"

    sput-object v0, Lcom/yingyonghui/market/a/k;->a:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 4
    .parameter

    .prologue
    const/4 v3, 0x6

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 351
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/yingyonghui/market/a/k;->e:Ljava/util/Queue;

    .line 56
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/a/k;->f:Ljava/lang/Integer;

    .line 290
    iput v1, p0, Lcom/yingyonghui/market/a/k;->h:I

    .line 295
    new-array v0, v3, [Landroid/os/Handler;

    iput-object v0, p0, Lcom/yingyonghui/market/a/k;->j:[Landroid/os/Handler;

    .line 352
    iput-object p1, p0, Lcom/yingyonghui/market/a/k;->d:Landroid/content/Context;

    .line 353
    invoke-static {}, Lcom/yingyonghui/market/a/k;->a()V

    move v0, v1

    .line 356
    :goto_0
    if-ge v0, v3, :cond_0

    .line 357
    new-instance v1, Lcom/yingyonghui/market/a/b;

    invoke-direct {v1, p0, v0}, Lcom/yingyonghui/market/a/b;-><init>(Lcom/yingyonghui/market/a/k;I)V

    .line 358
    invoke-virtual {v1, v2}, Lcom/yingyonghui/market/a/b;->setDaemon(Z)V

    .line 359
    invoke-virtual {v1}, Lcom/yingyonghui/market/a/b;->start()V

    .line 360
    invoke-virtual {v1}, Lcom/yingyonghui/market/a/b;->a()V

    .line 356
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 364
    :cond_0
    new-instance v0, Lcom/yingyonghui/market/a/f;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/a/f;-><init>(Lcom/yingyonghui/market/a/k;)V

    .line 365
    invoke-virtual {v0, v2}, Lcom/yingyonghui/market/a/f;->setDaemon(Z)V

    .line 366
    invoke-virtual {v0}, Lcom/yingyonghui/market/a/f;->start()V

    .line 367
    iget-object v1, v0, Lcom/yingyonghui/market/a/f;->a:Lcom/yingyonghui/market/a/k;

    new-instance v2, Lcom/yingyonghui/market/a/l;

    invoke-virtual {v0}, Lcom/yingyonghui/market/a/f;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Lcom/yingyonghui/market/a/l;-><init>(Lcom/yingyonghui/market/a/f;Landroid/os/Looper;)V

    iput-object v2, v1, Lcom/yingyonghui/market/a/k;->i:Landroid/os/Handler;

    .line 369
    new-instance v0, Lcom/yingyonghui/market/a/m;

    invoke-direct {v0}, Lcom/yingyonghui/market/a/m;-><init>()V

    iput-object v0, p0, Lcom/yingyonghui/market/a/k;->g:Lcom/yingyonghui/market/a/m;

    .line 370
    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/a/k;I)I
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 29
    iget v0, p0, Lcom/yingyonghui/market/a/k;->h:I

    and-int/2addr v0, p1

    iput v0, p0, Lcom/yingyonghui/market/a/k;->h:I

    return v0
.end method

.method static synthetic a(Lcom/yingyonghui/market/a/k;)Landroid/content/Context;
    .locals 1
    .parameter

    .prologue
    .line 29
    iget-object v0, p0, Lcom/yingyonghui/market/a/k;->d:Landroid/content/Context;

    return-object v0
.end method

.method public static a(Landroid/content/Context;)Lcom/yingyonghui/market/a/k;
    .locals 2
    .parameter

    .prologue
    .line 374
    const-class v0, Lcom/yingyonghui/market/a/k;

    monitor-enter v0

    .line 375
    :try_start_0
    sget-object v1, Lcom/yingyonghui/market/a/k;->c:Lcom/yingyonghui/market/a/k;

    if-nez v1, :cond_0

    .line 376
    new-instance v1, Lcom/yingyonghui/market/a/k;

    invoke-direct {v1, p0}, Lcom/yingyonghui/market/a/k;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/yingyonghui/market/a/k;->c:Lcom/yingyonghui/market/a/k;

    .line 378
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 379
    sget-object v0, Lcom/yingyonghui/market/a/k;->c:Lcom/yingyonghui/market/a/k;

    return-object v0

    .line 378
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method static synthetic a(Lcom/yingyonghui/market/a/k;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 29
    iput-object p1, p0, Lcom/yingyonghui/market/a/k;->f:Ljava/lang/Integer;

    return-object p1
.end method

.method public static a()V
    .locals 2

    .prologue
    .line 84
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/yingyonghui/market/a/k;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "api"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/a/k;->b:Ljava/lang/String;

    .line 86
    return-void
.end method

.method private a(Lcom/yingyonghui/market/a/a;)V
    .locals 2
    .parameter

    .prologue
    .line 383
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 384
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 385
    iget-object v1, p0, Lcom/yingyonghui/market/a/k;->i:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 386
    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/a/k;Lcom/yingyonghui/market/a/a;I)V
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    .line 29
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v1, p0, Lcom/yingyonghui/market/a/k;->i:Landroid/os/Handler;

    int-to-long v2, p2

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void
.end method

.method static synthetic b(Lcom/yingyonghui/market/a/k;I)I
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 29
    iget v0, p0, Lcom/yingyonghui/market/a/k;->h:I

    or-int/2addr v0, p1

    iput v0, p0, Lcom/yingyonghui/market/a/k;->h:I

    return v0
.end method

.method static synthetic b(Lcom/yingyonghui/market/a/k;)[Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 29
    iget-object v0, p0, Lcom/yingyonghui/market/a/k;->j:[Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic c(Lcom/yingyonghui/market/a/k;)Lcom/yingyonghui/market/a/m;
    .locals 1
    .parameter

    .prologue
    .line 29
    iget-object v0, p0, Lcom/yingyonghui/market/a/k;->g:Lcom/yingyonghui/market/a/m;

    return-object v0
.end method

.method static synthetic d(Lcom/yingyonghui/market/a/k;)Ljava/lang/Integer;
    .locals 1
    .parameter

    .prologue
    .line 29
    iget-object v0, p0, Lcom/yingyonghui/market/a/k;->f:Ljava/lang/Integer;

    return-object v0
.end method

.method static synthetic e(Lcom/yingyonghui/market/a/k;)Ljava/util/Queue;
    .locals 1
    .parameter

    .prologue
    .line 29
    iget-object v0, p0, Lcom/yingyonghui/market/a/k;->e:Ljava/util/Queue;

    return-object v0
.end method

.method static synthetic f(Lcom/yingyonghui/market/a/k;)I
    .locals 1
    .parameter

    .prologue
    .line 29
    iget v0, p0, Lcom/yingyonghui/market/a/k;->h:I

    return v0
.end method

.method static synthetic g(Lcom/yingyonghui/market/a/k;)Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 29
    iget-object v0, p0, Lcom/yingyonghui/market/a/k;->i:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public final a(Ljava/lang/String;IILandroid/os/Handler;)V
    .locals 2
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 452
    new-instance v0, Lcom/yingyonghui/market/a/a;

    invoke-direct {v0}, Lcom/yingyonghui/market/a/a;-><init>()V

    .line 453
    const/4 v1, 0x2

    iput v1, v0, Lcom/yingyonghui/market/a/a;->b:I

    .line 454
    iput p2, v0, Lcom/yingyonghui/market/a/a;->c:I

    .line 455
    iput p3, v0, Lcom/yingyonghui/market/a/a;->d:I

    .line 456
    iput-object p1, v0, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    .line 457
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/yingyonghui/market/a/a;->f:Ljava/util/List;

    .line 458
    iput-object p4, v0, Lcom/yingyonghui/market/a/a;->g:Landroid/os/Handler;

    .line 460
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/k;->a(Lcom/yingyonghui/market/a/a;)V

    .line 461
    return-void
.end method

.method public final a(Ljava/lang/String;ILandroid/os/Handler;)V
    .locals 2
    .parameter
    .parameter
    .parameter

    .prologue
    .line 438
    new-instance v0, Lcom/yingyonghui/market/a/a;

    invoke-direct {v0}, Lcom/yingyonghui/market/a/a;-><init>()V

    .line 439
    const/4 v1, 0x2

    iput v1, v0, Lcom/yingyonghui/market/a/a;->b:I

    .line 440
    iput p2, v0, Lcom/yingyonghui/market/a/a;->c:I

    .line 441
    iput-object p1, v0, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    .line 442
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/yingyonghui/market/a/a;->f:Ljava/util/List;

    .line 443
    iput-object p3, v0, Lcom/yingyonghui/market/a/a;->g:Landroid/os/Handler;

    .line 445
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/k;->a(Lcom/yingyonghui/market/a/a;)V

    .line 446
    return-void
.end method

.method public final a(Ljava/util/List;)V
    .locals 2
    .parameter

    .prologue
    .line 397
    new-instance v0, Lcom/yingyonghui/market/a/a;

    invoke-direct {v0}, Lcom/yingyonghui/market/a/a;-><init>()V

    .line 398
    const/4 v1, 0x1

    iput v1, v0, Lcom/yingyonghui/market/a/a;->b:I

    .line 399
    sget-object v1, Lcom/yingyonghui/market/a/k;->b:Ljava/lang/String;

    iput-object v1, v0, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    .line 400
    iput-object p1, v0, Lcom/yingyonghui/market/a/a;->f:Ljava/util/List;

    .line 402
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/k;->a(Lcom/yingyonghui/market/a/a;)V

    .line 403
    return-void
.end method

.method public final a(Ljava/util/List;IILandroid/os/Handler;)V
    .locals 2
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 423
    new-instance v0, Lcom/yingyonghui/market/a/a;

    invoke-direct {v0}, Lcom/yingyonghui/market/a/a;-><init>()V

    .line 424
    const/4 v1, 0x1

    iput v1, v0, Lcom/yingyonghui/market/a/a;->b:I

    .line 425
    iput p2, v0, Lcom/yingyonghui/market/a/a;->c:I

    .line 426
    iput p3, v0, Lcom/yingyonghui/market/a/a;->d:I

    .line 427
    sget-object v1, Lcom/yingyonghui/market/a/k;->b:Ljava/lang/String;

    iput-object v1, v0, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    .line 428
    iput-object p1, v0, Lcom/yingyonghui/market/a/a;->f:Ljava/util/List;

    .line 429
    iput-object p4, v0, Lcom/yingyonghui/market/a/a;->g:Landroid/os/Handler;

    .line 431
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/k;->a(Lcom/yingyonghui/market/a/a;)V

    .line 432
    return-void
.end method

.method public final a(Ljava/util/List;ILandroid/os/Handler;)V
    .locals 2
    .parameter
    .parameter
    .parameter

    .prologue
    .line 409
    new-instance v0, Lcom/yingyonghui/market/a/a;

    invoke-direct {v0}, Lcom/yingyonghui/market/a/a;-><init>()V

    .line 410
    const/4 v1, 0x1

    iput v1, v0, Lcom/yingyonghui/market/a/a;->b:I

    .line 411
    iput p2, v0, Lcom/yingyonghui/market/a/a;->c:I

    .line 412
    sget-object v1, Lcom/yingyonghui/market/a/k;->b:Ljava/lang/String;

    iput-object v1, v0, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    .line 413
    iput-object p1, v0, Lcom/yingyonghui/market/a/a;->f:Ljava/util/List;

    .line 414
    iput-object p3, v0, Lcom/yingyonghui/market/a/a;->g:Landroid/os/Handler;

    .line 416
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/k;->a(Lcom/yingyonghui/market/a/a;)V

    .line 417
    return-void
.end method

.method public final a(Ljava/util/List;[BLjava/lang/String;Landroid/os/Handler;)V
    .locals 2
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 467
    new-instance v0, Lcom/yingyonghui/market/a/a;

    invoke-direct {v0}, Lcom/yingyonghui/market/a/a;-><init>()V

    .line 468
    const/4 v1, 0x3

    iput v1, v0, Lcom/yingyonghui/market/a/a;->b:I

    .line 469
    sget-object v1, Lcom/yingyonghui/market/a/k;->b:Ljava/lang/String;

    iput-object v1, v0, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    .line 470
    iput-object p1, v0, Lcom/yingyonghui/market/a/a;->f:Ljava/util/List;

    .line 471
    iput-object p2, v0, Lcom/yingyonghui/market/a/a;->k:[B

    .line 472
    iput-object p3, v0, Lcom/yingyonghui/market/a/a;->j:Ljava/lang/String;

    .line 473
    iput-object p4, v0, Lcom/yingyonghui/market/a/a;->g:Landroid/os/Handler;

    .line 475
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/k;->a(Lcom/yingyonghui/market/a/a;)V

    .line 476
    return-void
.end method

.method public final b()V
    .locals 4

    .prologue
    .line 481
    iget-object v1, p0, Lcom/yingyonghui/market/a/k;->f:Ljava/lang/Integer;

    monitor-enter v1

    .line 482
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/yingyonghui/market/a/k;->e:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/a/a;

    if-eqz v0, :cond_0

    .line 485
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/a/k;->a(Lcom/yingyonghui/market/a/a;)V

    goto :goto_0

    .line 488
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 487
    :cond_0
    const/4 v0, 0x2

    :try_start_1
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/a/k;->f:Ljava/lang/Integer;

    .line 488
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 490
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 491
    const/16 v1, 0x4d2

    iput v1, v0, Landroid/os/Message;->what:I

    .line 492
    const/4 v1, 0x0

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 493
    iget-object v1, p0, Lcom/yingyonghui/market/a/k;->i:Landroid/os/Handler;

    const-wide/16 v2, 0x2710

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 507
    return-void
.end method
