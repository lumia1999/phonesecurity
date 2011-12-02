.class public Lcom/mappn/gfan/common/ResponseCacheManager;
.super Ljava/lang/Object;


# static fields
.field private static mInstance:Lcom/mappn/gfan/common/ResponseCacheManager;

.field private static mLock:Ljava/lang/Object;


# instance fields
.field private mResponseCache:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private mResponsePool:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/mappn/gfan/common/ResponseCacheManager;->mLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/ResponseCacheManager;->mResponsePool:Ljava/util/HashMap;

    new-instance v0, Ljava/lang/ref/SoftReference;

    iget-object v1, p0, Lcom/mappn/gfan/common/ResponseCacheManager;->mResponsePool:Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/ResponseCacheManager;->mResponseCache:Ljava/lang/ref/SoftReference;

    return-void
.end method

.method public static getInstance()Lcom/mappn/gfan/common/ResponseCacheManager;
    .locals 2

    sget-object v0, Lcom/mappn/gfan/common/ResponseCacheManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/mappn/gfan/common/ResponseCacheManager;->mInstance:Lcom/mappn/gfan/common/ResponseCacheManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/mappn/gfan/common/ResponseCacheManager;

    invoke-direct {v1}, Lcom/mappn/gfan/common/ResponseCacheManager;-><init>()V

    sput-object v1, Lcom/mappn/gfan/common/ResponseCacheManager;->mInstance:Lcom/mappn/gfan/common/ResponseCacheManager;

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object v0, Lcom/mappn/gfan/common/ResponseCacheManager;->mInstance:Lcom/mappn/gfan/common/ResponseCacheManager;

    return-object v0

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method


# virtual methods
.method public clear()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/ResponseCacheManager;->mResponseCache:Ljava/lang/ref/SoftReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/ResponseCacheManager;->mResponseCache:Ljava/lang/ref/SoftReference;

    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->clear()V

    iput-object v1, p0, Lcom/mappn/gfan/common/ResponseCacheManager;->mResponseCache:Ljava/lang/ref/SoftReference;

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/ResponseCacheManager;->mResponsePool:Ljava/util/HashMap;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/ResponseCacheManager;->mResponsePool:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iput-object v1, p0, Lcom/mappn/gfan/common/ResponseCacheManager;->mResponsePool:Ljava/util/HashMap;

    :cond_1
    sput-object v1, Lcom/mappn/gfan/common/ResponseCacheManager;->mInstance:Lcom/mappn/gfan/common/ResponseCacheManager;

    return-void
.end method

.method public getResponse(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2

    const/4 v1, 0x0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, v1

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/ResponseCacheManager;->mResponseCache:Ljava/lang/ref/SoftReference;

    if-nez v0, :cond_1

    move-object v0, v1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/common/ResponseCacheManager;->mResponseCache:Ljava/lang/ref/SoftReference;

    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public putResponse(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/ResponseCacheManager;->mResponseCache:Ljava/lang/ref/SoftReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/ResponseCacheManager;->mResponseCache:Ljava/lang/ref/SoftReference;

    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method
