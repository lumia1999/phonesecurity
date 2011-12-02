.class public Lcom/mappn/gfan/common/ApiAsyncTask;
.super Landroid/os/AsyncTask;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field public static final BUSSINESS_ERROR:I = 0x262

.field public static final SC_DATA_NOT_EXIST:I = 0xe1

.field public static final SC_ENCODE_ERROR:I = 0x1ab

.field public static final SC_ILLEGAL_COMMENT:I = 0xe8

.field public static final SC_ILLEGAL_USER_AGENT:I = 0x1a5

.field public static final SC_SERVER_DB_ERROR:I = 0x208

.field public static final SC_XML_ERROR:I = 0x1a6

.field public static final SC_XML_PARAMS_ERROR:I = 0x1a7

.field public static final TIMEOUT_ERROR:I = 0x258


# instance fields
.field private mClient:Lcom/mappn/gfan/common/AndroidHttpClient;

.field private mContext:Landroid/content/Context;

.field private mHandler:Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;

.field private mParameter:Ljava/lang/Object;

.field private mResponseCache:Lcom/mappn/gfan/common/ResponseCacheManager;

.field private mReuqestAction:I

.field private mSession:Lcom/mappn/gfan/Session;


# direct methods
.method constructor <init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V
    .locals 1

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p1, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mSession:Lcom/mappn/gfan/Session;

    iput p2, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mReuqestAction:I

    iput-object p3, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mHandler:Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;

    iput-object p4, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mParameter:Ljava/lang/Object;

    invoke-static {}, Lcom/mappn/gfan/common/ResponseCacheManager;->getInstance()Lcom/mappn/gfan/common/ResponseCacheManager;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mResponseCache:Lcom/mappn/gfan/common/ResponseCacheManager;

    invoke-static {}, Lcom/mappn/gfan/common/HttpClientFactory;->get()Lcom/mappn/gfan/common/HttpClientFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/common/HttpClientFactory;->getHttpClient()Lcom/mappn/gfan/common/AndroidHttpClient;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mClient:Lcom/mappn/gfan/common/AndroidHttpClient;

    return-void
.end method

.method private handleCommonError(I)Z
    .locals 1

    const/16 v0, 0xc8

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/mappn/gfan/common/ApiAsyncTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Object;
    .locals 7

    const/4 v5, 0x0

    const/16 v4, 0x262

    const/16 v1, 0x258

    iget-object v0, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    sget-object v0, Lcom/mappn/gfan/common/MarketAPI;->API_URLS:[Ljava/lang/String;

    iget v1, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mReuqestAction:I

    aget-object v0, v0, v1

    :try_start_0
    iget-object v1, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mContext:Landroid/content/Context;

    iget v2, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mReuqestAction:I

    iget-object v3, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mParameter:Ljava/lang/Object;

    invoke-static {v1, v2, v3}, Lcom/mappn/gfan/common/ApiRequestFactory;->getRequestEntity(Landroid/content/Context;ILjava/lang/Object;)Lorg/apache/http/HttpEntity;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    const-string v2, ""

    sget-object v3, Lcom/mappn/gfan/common/ApiRequestFactory;->API_NO_CACHE_MAP:Ljava/util/ArrayList;

    iget v4, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mReuqestAction:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    if-nez v1, :cond_3

    const/4 v3, 0x1

    :goto_1
    if-eqz v3, :cond_4

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_2
    :goto_2
    iget-object v3, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mResponseCache:Lcom/mappn/gfan/common/ResponseCacheManager;

    invoke-virtual {v3, v2}, Lcom/mappn/gfan/common/ResponseCacheManager;->getResponse(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_5

    const-string v0, "retrieve response from the cache"

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->V(Ljava/lang/String;)V

    move-object v0, v3

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v0, "OPPS...This device not support UTF8 encoding.[should not happend]"

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    :cond_3
    const/4 v3, 0x0

    goto :goto_1

    :cond_4
    instance-of v3, v1, Lorg/apache/http/entity/StringEntity;

    if-eqz v3, :cond_2

    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v1}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mappn/gfan/common/util/Utils;->getMD5(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Lorg/apache/http/ParseException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v2

    goto :goto_2

    :catch_1
    move-exception v3

    const-string v4, "have ParseException when get cache key"

    invoke-static {v4, v3}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    :catch_2
    move-exception v3

    const-string v4, "have IOException when get cache key"

    invoke-static {v4, v3}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_5
    :try_start_2
    iget v3, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mReuqestAction:I

    iget-object v4, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mSession:Lcom/mappn/gfan/Session;

    invoke-static {v0, v3, v1, v4}, Lcom/mappn/gfan/common/ApiRequestFactory;->getRequest(Ljava/lang/String;ILorg/apache/http/HttpEntity;Lcom/mappn/gfan/Session;)Lorg/apache/http/client/methods/HttpUriRequest;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_7

    move-result-object v1

    :try_start_3
    iget-object v3, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mClient:Lcom/mappn/gfan/common/AndroidHttpClient;

    invoke-virtual {v3, v1}, Lcom/mappn/gfan/common/AndroidHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_c
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_a

    move-result-object v3

    :try_start_4
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "requestUrl "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, " statusCode: "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    const/16 v0, 0xc8

    if-eq v0, v4, :cond_7

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_d
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_b

    move-result-object v0

    if-eqz v1, :cond_6

    invoke-interface {v1}, Lorg/apache/http/client/methods/HttpUriRequest;->abort()V

    :cond_6
    if-eqz v3, :cond_0

    :try_start_5
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto/16 :goto_0

    :catch_3
    move-exception v1

    const-string v1, "release low-level resource error"

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_7
    :try_start_6
    iget-object v0, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mContext:Landroid/content/Context;

    iget v4, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mReuqestAction:I

    invoke-static {v0, v4, v3}, Lcom/mappn/gfan/common/ApiResponseFactory;->getResponse(Landroid/content/Context;ILorg/apache/http/HttpResponse;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_8

    sget-object v4, Lcom/mappn/gfan/common/ApiRequestFactory;->API_NO_CACHE_MAP:Ljava/util/ArrayList;

    iget v5, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mReuqestAction:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8

    iget-object v4, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mResponseCache:Lcom/mappn/gfan/common/ResponseCacheManager;

    invoke-virtual {v4, v2, v0}, Lcom/mappn/gfan/common/ResponseCacheManager;->putResponse(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_8
    if-nez v0, :cond_9

    const/16 v0, 0x262

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_d
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_b

    move-result-object v0

    :cond_9
    if-eqz v1, :cond_a

    invoke-interface {v1}, Lorg/apache/http/client/methods/HttpUriRequest;->abort()V

    :cond_a
    if-eqz v3, :cond_0

    :try_start_7
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    goto/16 :goto_0

    :catch_4
    move-exception v1

    const-string v1, "release low-level resource error"

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    goto/16 :goto_0

    :catch_5
    move-exception v0

    move-object v1, v5

    move-object v2, v5

    :goto_3
    :try_start_8
    const-string v3, "Market API encounter the IO exception[mostly is timeout exception]"

    invoke-static {v3, v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/16 v0, 0x258

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    move-result-object v0

    if-eqz v1, :cond_b

    invoke-interface {v1}, Lorg/apache/http/client/methods/HttpUriRequest;->abort()V

    :cond_b
    if-eqz v2, :cond_0

    :try_start_9
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6

    goto/16 :goto_0

    :catch_6
    move-exception v1

    const-string v1, "release low-level resource error"

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    goto/16 :goto_0

    :catch_7
    move-exception v0

    move-object v1, v5

    move-object v2, v5

    :goto_4
    :try_start_a
    const-string v3, "Market API encounter the other exception"

    invoke-static {v3, v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/16 v0, 0x258

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    move-result-object v0

    if-eqz v1, :cond_c

    invoke-interface {v1}, Lorg/apache/http/client/methods/HttpUriRequest;->abort()V

    :cond_c
    if-eqz v2, :cond_0

    :try_start_b
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_8

    goto/16 :goto_0

    :catch_8
    move-exception v1

    const-string v1, "release low-level resource error"

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    move-object v1, v5

    move-object v2, v5

    :goto_5
    if-eqz v1, :cond_d

    invoke-interface {v1}, Lorg/apache/http/client/methods/HttpUriRequest;->abort()V

    :cond_d
    if-eqz v2, :cond_e

    :try_start_c
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    if-eqz v1, :cond_e

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_9

    :cond_e
    :goto_6
    throw v0

    :catch_9
    move-exception v1

    const-string v1, "release low-level resource error"

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    goto :goto_6

    :catchall_1
    move-exception v0

    move-object v2, v5

    goto :goto_5

    :catchall_2
    move-exception v0

    move-object v2, v3

    goto :goto_5

    :catchall_3
    move-exception v0

    goto :goto_5

    :catch_a
    move-exception v0

    move-object v2, v5

    goto :goto_4

    :catch_b
    move-exception v0

    move-object v2, v3

    goto :goto_4

    :catch_c
    move-exception v0

    move-object v2, v5

    goto :goto_3

    :catch_d
    move-exception v0

    move-object v2, v3

    goto :goto_3
.end method

.method protected onPostExecute(Ljava/lang/Object;)V
    .locals 4

    iget-object v1, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mHandler:Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v1, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mContext:Landroid/content/Context;

    instance-of v1, v1, Landroid/app/Activity;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mContext:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    if-nez p1, :cond_3

    iget-object v1, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mHandler:Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;

    iget v2, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mReuqestAction:I

    const/16 v3, 0x262

    invoke-interface {v1, v2, v3}, Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;->onError(II)V

    goto :goto_0

    :cond_3
    instance-of v1, p1, Ljava/lang/Integer;

    if-eqz v1, :cond_4

    move-object v0, p1

    check-cast v0, Ljava/lang/Integer;

    move-object v1, v0

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->handleCommonError(I)Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mHandler:Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;

    iget v2, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mReuqestAction:I

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {v1, v2, v3}, Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;->onError(II)V

    goto :goto_0

    :cond_4
    iget-object v1, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mHandler:Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;

    iget v2, p0, Lcom/mappn/gfan/common/ApiAsyncTask;->mReuqestAction:I

    invoke-interface {v1, v2, p1}, Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;->onSuccess(ILjava/lang/Object;)V

    goto :goto_0
.end method
