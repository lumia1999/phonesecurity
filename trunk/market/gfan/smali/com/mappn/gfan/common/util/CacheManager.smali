.class public Lcom/mappn/gfan/common/util/CacheManager;
.super Ljava/lang/Object;


# static fields
.field private static final MAX_IMAGE_IN_SDCARD:I = 0x64

.field private static mInstance:Lcom/mappn/gfan/common/util/CacheManager;


# instance fields
.field private mDrawableCache:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference",
            "<",
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field

.field private mDrawableMap:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mNewIcons:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/CacheManager;->mDrawableMap:Ljava/util/LinkedHashMap;

    new-instance v0, Ljava/lang/ref/SoftReference;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/CacheManager;->mDrawableMap:Ljava/util/LinkedHashMap;

    invoke-direct {v0, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/CacheManager;->mDrawableCache:Ljava/lang/ref/SoftReference;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/CacheManager;->mNewIcons:Ljava/util/ArrayList;

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/mappn/gfan/common/util/CacheManager;
    .locals 2

    const-class v0, Lcom/mappn/gfan/common/util/CacheManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/mappn/gfan/common/util/CacheManager;->mInstance:Lcom/mappn/gfan/common/util/CacheManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/mappn/gfan/common/util/CacheManager;

    invoke-direct {v1}, Lcom/mappn/gfan/common/util/CacheManager;-><init>()V

    sput-object v1, Lcom/mappn/gfan/common/util/CacheManager;->mInstance:Lcom/mappn/gfan/common/util/CacheManager;

    :cond_0
    sget-object v1, Lcom/mappn/gfan/common/util/CacheManager;->mInstance:Lcom/mappn/gfan/common/util/CacheManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private getMemoCache()Ljava/util/LinkedHashMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/common/util/CacheManager;->mDrawableCache:Ljava/lang/ref/SoftReference;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/ref/SoftReference;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/CacheManager;->mDrawableMap:Ljava/util/LinkedHashMap;

    invoke-direct {v0, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/CacheManager;->mDrawableCache:Ljava/lang/ref/SoftReference;

    iget-object v0, p0, Lcom/mappn/gfan/common/util/CacheManager;->mDrawableMap:Ljava/util/LinkedHashMap;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/CacheManager;->mDrawableCache:Ljava/lang/ref/SoftReference;

    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/LinkedHashMap;

    move-object v0, p0

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized cacheDrawable(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 3

    monitor-enter p0

    if-nez p2, :cond_1

    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :cond_1
    :try_start_0
    invoke-direct {p0}, Lcom/mappn/gfan/common/util/CacheManager;->getMemoCache()Ljava/util/LinkedHashMap;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->size()I

    move-result v0

    const/16 v2, 0x64

    if-ge v0, v2, :cond_2

    invoke-virtual {v1, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_2
    :try_start_1
    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public clearFromFile()V
    .locals 2

    new-instance v0, Lcom/mappn/gfan/common/util/CacheManager$1;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/common/util/CacheManager$1;-><init>(Lcom/mappn/gfan/common/util/CacheManager;)V

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public clearFromMemory()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/CacheManager;->mNewIcons:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/CacheManager;->mNewIcons:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/CacheManager;->mDrawableMap:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/CacheManager;->mDrawableMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    iput-object v1, p0, Lcom/mappn/gfan/common/util/CacheManager;->mDrawableMap:Ljava/util/LinkedHashMap;

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/common/util/CacheManager;->mDrawableCache:Ljava/lang/ref/SoftReference;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/common/util/CacheManager;->mDrawableCache:Ljava/lang/ref/SoftReference;

    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->clear()V

    iput-object v1, p0, Lcom/mappn/gfan/common/util/CacheManager;->mDrawableCache:Ljava/lang/ref/SoftReference;

    :cond_2
    sput-object v1, Lcom/mappn/gfan/common/util/CacheManager;->mInstance:Lcom/mappn/gfan/common/util/CacheManager;

    return-void
.end method

.method public existsDrawable(Ljava/lang/String;)Z
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/util/CacheManager;->getMemoCache()Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDrawableFromCache(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/util/CacheManager;->getMemoCache()Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/Bitmap;

    return-object p0
.end method
