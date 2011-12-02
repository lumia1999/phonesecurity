.class public Lcom/mappn/gfan/common/HttpClientFactory;
.super Ljava/lang/Object;


# static fields
.field private static MARKET_CLIENT:Ljava/lang/String;

.field private static mInstance:Lcom/mappn/gfan/common/HttpClientFactory;


# instance fields
.field private mHttpClientMap:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mappn/gfan/common/AndroidHttpClient;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "market"

    sput-object v0, Lcom/mappn/gfan/common/HttpClientFactory;->MARKET_CLIENT:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/WeakHashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/WeakHashMap;-><init>(I)V

    iput-object v0, p0, Lcom/mappn/gfan/common/HttpClientFactory;->mHttpClientMap:Ljava/util/WeakHashMap;

    return-void
.end method

.method public static declared-synchronized get()Lcom/mappn/gfan/common/HttpClientFactory;
    .locals 2

    const-class v0, Lcom/mappn/gfan/common/HttpClientFactory;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/mappn/gfan/common/HttpClientFactory;->mInstance:Lcom/mappn/gfan/common/HttpClientFactory;

    if-nez v1, :cond_0

    new-instance v1, Lcom/mappn/gfan/common/HttpClientFactory;

    invoke-direct {v1}, Lcom/mappn/gfan/common/HttpClientFactory;-><init>()V

    sput-object v1, Lcom/mappn/gfan/common/HttpClientFactory;->mInstance:Lcom/mappn/gfan/common/HttpClientFactory;

    :cond_0
    sget-object v1, Lcom/mappn/gfan/common/HttpClientFactory;->mInstance:Lcom/mappn/gfan/common/HttpClientFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mappn/gfan/common/HttpClientFactory;->mHttpClientMap:Ljava/util/WeakHashMap;

    sget-object v1, Lcom/mappn/gfan/common/HttpClientFactory;->MARKET_CLIENT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/HttpClientFactory;->mHttpClientMap:Ljava/util/WeakHashMap;

    sget-object v1, Lcom/mappn/gfan/common/HttpClientFactory;->MARKET_CLIENT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/AndroidHttpClient;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/mappn/gfan/common/AndroidHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    invoke-virtual {v0}, Lcom/mappn/gfan/common/AndroidHttpClient;->close()V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/HttpClientFactory;->mHttpClientMap:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->clear()V

    const/4 v0, 0x0

    sput-object v0, Lcom/mappn/gfan/common/HttpClientFactory;->mInstance:Lcom/mappn/gfan/common/HttpClientFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getHttpClient()Lcom/mappn/gfan/common/AndroidHttpClient;
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/common/HttpClientFactory;->mHttpClientMap:Ljava/util/WeakHashMap;

    sget-object v1, Lcom/mappn/gfan/common/HttpClientFactory;->MARKET_CLIENT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/AndroidHttpClient;

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    invoke-static {v0}, Lcom/mappn/gfan/common/AndroidHttpClient;->newInstance(Ljava/lang/String;)Lcom/mappn/gfan/common/AndroidHttpClient;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/HttpClientFactory;->mHttpClientMap:Ljava/util/WeakHashMap;

    sget-object v2, Lcom/mappn/gfan/common/HttpClientFactory;->MARKET_CLIENT:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public updateMarketHeader(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/common/HttpClientFactory;->mHttpClientMap:Ljava/util/WeakHashMap;

    sget-object v1, Lcom/mappn/gfan/common/HttpClientFactory;->MARKET_CLIENT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/AndroidHttpClient;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/common/AndroidHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    const-string v1, "G-Header"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "update client "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " g-header "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
