.class final Lcom/yingyonghui/market/a/b;
.super Landroid/os/HandlerThread;
.source "HttpManager.java"


# instance fields
.field final synthetic a:Lcom/yingyonghui/market/a/k;

.field private b:I

.field private c:Lorg/apache/http/client/HttpClient;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/a/k;I)V
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 93
    iput-object p1, p0, Lcom/yingyonghui/market/a/b;->a:Lcom/yingyonghui/market/a/k;

    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "worker"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 95
    iput p2, p0, Lcom/yingyonghui/market/a/b;->b:I

    .line 96
    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/a/b;)I
    .locals 1
    .parameter

    .prologue
    .line 88
    iget v0, p0, Lcom/yingyonghui/market/a/b;->b:I

    return v0
.end method

.method static synthetic a(Lcom/yingyonghui/market/a/b;Lcom/yingyonghui/market/a/a;)V
    .locals 7
    .parameter
    .parameter

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x0

    const/4 v6, 0x1

    .line 88
    iget v0, p1, Lcom/yingyonghui/market/a/a;->b:I

    if-ne v0, v6, :cond_3

    new-instance v0, Lorg/apache/http/client/methods/HttpPost;

    iget-object v1, p1, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    const-string v1, "Accept-Encoding"

    const-string v2, "gzip"

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    new-instance v1, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    iget-object v2, p1, Lcom/yingyonghui/market/a/a;->f:Ljava/util/List;

    const-string v3, "utf-8"

    invoke-direct {v1, v2, v3}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    move v1, v4

    :goto_0
    iget-object v2, p0, Lcom/yingyonghui/market/a/b;->a:Lcom/yingyonghui/market/a/k;

    invoke-static {v2}, Lcom/yingyonghui/market/a/k;->a(Lcom/yingyonghui/market/a/k;)Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/yingyonghui/market/a/b;->c:Lorg/apache/http/client/HttpClient;

    invoke-static {v2, v3}, Lcom/yingyonghui/market/util/g;->a(Landroid/content/Context;Lorg/apache/http/client/HttpClient;)V

    if-nez v1, :cond_7

    iget v2, p1, Lcom/yingyonghui/market/a/a;->b:I

    if-ne v2, v6, :cond_7

    :try_start_1
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v3, p0, Lcom/yingyonghui/market/a/b;->c:Lorg/apache/http/client/HttpClient;

    invoke-interface {v3, v0}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-interface {v3}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    iput v3, p1, Lcom/yingyonghui/market/a/a;->a:I

    :cond_0
    const-string v3, ""

    const-string v4, "Content-Encoding"

    invoke-interface {v0, v4}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-interface {v4}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    :cond_1
    const-string v4, "gzip"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    new-instance v3, Ljava/io/InputStreamReader;

    new-instance v4, Ljava/util/zip/GZIPInputStream;

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object v0, v3

    :goto_1
    const/16 v3, 0x400

    new-array v3, v3, [C

    :goto_2
    const/4 v4, 0x0

    array-length v5, v3

    invoke-virtual {v0, v3, v4, v5}, Ljava/io/InputStreamReader;->read([CII)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_6

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5, v4}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    goto :goto_2

    :catch_0
    move-exception v0

    move v0, v6

    :goto_3
    if-nez v0, :cond_c

    iget-object v0, p1, Lcom/yingyonghui/market/a/a;->g:Landroid/os/Handler;

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/yingyonghui/market/a/a;->g:Landroid/os/Handler;

    iget-object v1, p1, Lcom/yingyonghui/market/a/a;->g:Landroid/os/Handler;

    invoke-virtual {v1, v6, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_2
    :goto_4
    return-void

    :catch_1
    move-exception v1

    move v1, v6

    goto :goto_0

    :cond_3
    iget v0, p1, Lcom/yingyonghui/market/a/a;->b:I

    if-ne v0, v5, :cond_4

    new-instance v0, Lorg/apache/http/client/methods/HttpPost;

    iget-object v1, p1, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    :try_start_2
    new-instance v1, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    iget-object v2, p1, Lcom/yingyonghui/market/a/a;->f:Ljava/util/List;

    const-string v3, "utf-8"

    invoke-direct {v1, v2, v3}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_2

    move v1, v4

    goto/16 :goto_0

    :catch_2
    move-exception v1

    move v1, v6

    goto/16 :goto_0

    :cond_4
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    iget-object v1, p1, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    move v1, v4

    goto/16 :goto_0

    :cond_5
    :try_start_3
    new-instance v3, Ljava/io/InputStreamReader;

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    const-string v4, "utf-8"

    invoke-direct {v3, v0, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    move-object v0, v3

    goto :goto_1

    :cond_6
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/io/InputStreamReader;->close()V
    :try_end_3
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    move v0, v1

    goto :goto_3

    :catch_3
    move-exception v0

    move v0, v6

    goto :goto_3

    :catch_4
    move-exception v0

    move v0, v6

    goto :goto_3

    :cond_7
    if-nez v1, :cond_a

    iget v2, p1, Lcom/yingyonghui/market/a/a;->b:I

    if-ne v2, v5, :cond_a

    :try_start_4
    iget-object v2, p0, Lcom/yingyonghui/market/a/b;->c:Lorg/apache/http/client/HttpClient;

    invoke-interface {v2, v0}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p1, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    if-eqz v0, :cond_9

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    if-eqz v0, :cond_9

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v2, 0xc8

    if-ne v0, v2, :cond_8

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p1, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    :cond_8
    iput v0, p1, Lcom/yingyonghui/market/a/a;->a:I
    :try_end_4
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_6
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_7

    :cond_9
    move v0, v1

    goto/16 :goto_3

    :catch_5
    move-exception v0

    move v0, v6

    goto/16 :goto_3

    :catch_6
    move-exception v0

    move v0, v6

    goto/16 :goto_3

    :catch_7
    move-exception v0

    move v0, v6

    goto/16 :goto_3

    :cond_a
    if-nez v1, :cond_b

    iget v2, p1, Lcom/yingyonghui/market/a/a;->b:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_b

    :try_start_5
    iget-object v2, p0, Lcom/yingyonghui/market/a/b;->a:Lcom/yingyonghui/market/a/k;

    invoke-static {v2}, Lcom/yingyonghui/market/a/k;->c(Lcom/yingyonghui/market/a/k;)Lcom/yingyonghui/market/a/m;

    move-result-object v2

    iget-object v3, p1, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    iget-object v4, p0, Lcom/yingyonghui/market/a/b;->c:Lorg/apache/http/client/HttpClient;

    invoke-virtual {v2, v3, v4, v0}, Lcom/yingyonghui/market/a/m;->a(Ljava/lang/String;Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p1, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;
    :try_end_5
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_5 .. :try_end_5} :catch_a
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_9
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_8

    move v0, v1

    goto/16 :goto_3

    :catch_8
    move-exception v0

    :cond_b
    :goto_5
    move v0, v6

    goto/16 :goto_3

    :cond_c
    iget v0, p1, Lcom/yingyonghui/market/a/a;->i:I

    if-lez v0, :cond_d

    iget v0, p1, Lcom/yingyonghui/market/a/a;->i:I

    sub-int/2addr v0, v6

    iput v0, p1, Lcom/yingyonghui/market/a/a;->i:I

    iget-object v0, p0, Lcom/yingyonghui/market/a/b;->a:Lcom/yingyonghui/market/a/k;

    const/16 v1, 0x3e8

    invoke-static {v0, p1, v1}, Lcom/yingyonghui/market/a/k;->a(Lcom/yingyonghui/market/a/k;Lcom/yingyonghui/market/a/a;I)V

    goto/16 :goto_4

    :cond_d
    iget-object v0, p1, Lcom/yingyonghui/market/a/a;->g:Landroid/os/Handler;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/yingyonghui/market/a/b;->a:Lcom/yingyonghui/market/a/k;

    invoke-static {v0}, Lcom/yingyonghui/market/a/k;->d(Lcom/yingyonghui/market/a/k;)Ljava/lang/Integer;

    move-result-object v0

    monitor-enter v0

    :try_start_6
    iget-object v1, p0, Lcom/yingyonghui/market/a/b;->a:Lcom/yingyonghui/market/a/k;

    invoke-static {v1}, Lcom/yingyonghui/market/a/k;->d(Lcom/yingyonghui/market/a/k;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_e

    iget-object v1, p0, Lcom/yingyonghui/market/a/b;->a:Lcom/yingyonghui/market/a/k;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/yingyonghui/market/a/k;->a(Lcom/yingyonghui/market/a/k;Ljava/lang/Integer;)Ljava/lang/Integer;

    iget-object v1, p0, Lcom/yingyonghui/market/a/b;->a:Lcom/yingyonghui/market/a/k;

    invoke-static {v1}, Lcom/yingyonghui/market/a/k;->e(Lcom/yingyonghui/market/a/k;)Ljava/util/Queue;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    iget-object v1, p1, Lcom/yingyonghui/market/a/a;->g:Landroid/os/Handler;

    iget-object v2, p1, Lcom/yingyonghui/market/a/a;->g:Landroid/os/Handler;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :goto_6
    monitor-exit v0

    goto/16 :goto_4

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    throw v1

    :cond_e
    :try_start_7
    iget-object v1, p0, Lcom/yingyonghui/market/a/b;->a:Lcom/yingyonghui/market/a/k;

    invoke-static {v1}, Lcom/yingyonghui/market/a/k;->d(Lcom/yingyonghui/market/a/k;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, v6, :cond_f

    iget-object v1, p0, Lcom/yingyonghui/market/a/b;->a:Lcom/yingyonghui/market/a/k;

    invoke-static {v1}, Lcom/yingyonghui/market/a/k;->e(Lcom/yingyonghui/market/a/k;)Ljava/util/Queue;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    goto :goto_6

    :cond_f
    iget-object v1, p0, Lcom/yingyonghui/market/a/b;->a:Lcom/yingyonghui/market/a/k;

    const/16 v2, 0xbb8

    invoke-static {v1, p1, v2}, Lcom/yingyonghui/market/a/k;->a(Lcom/yingyonghui/market/a/k;Lcom/yingyonghui/market/a/a;I)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_6

    :catch_9
    move-exception v0

    goto :goto_5

    :catch_a
    move-exception v0

    goto :goto_5
.end method


# virtual methods
.method public final a()V
    .locals 4

    .prologue
    .line 99
    new-instance v0, Lcom/yingyonghui/market/a/g;

    iget-object v1, p0, Lcom/yingyonghui/market/a/b;->a:Lcom/yingyonghui/market/a/k;

    invoke-static {v1}, Lcom/yingyonghui/market/a/k;->a(Lcom/yingyonghui/market/a/k;)Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/a/g;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/yingyonghui/market/a/b;->c:Lorg/apache/http/client/HttpClient;

    .line 100
    iget-object v0, p0, Lcom/yingyonghui/market/a/b;->a:Lcom/yingyonghui/market/a/k;

    invoke-static {v0}, Lcom/yingyonghui/market/a/k;->b(Lcom/yingyonghui/market/a/k;)[Landroid/os/Handler;

    move-result-object v0

    iget v1, p0, Lcom/yingyonghui/market/a/b;->b:I

    new-instance v2, Lcom/yingyonghui/market/a/i;

    invoke-virtual {p0}, Lcom/yingyonghui/market/a/b;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/yingyonghui/market/a/i;-><init>(Lcom/yingyonghui/market/a/b;Landroid/os/Looper;)V

    aput-object v2, v0, v1

    .line 118
    return-void
.end method
