.class public Lcom/hudee/pns/b;
.super Ljava/lang/Object;


# static fields
.field public static final a:Ljava/lang/String;

.field public static b:I

.field public static c:I

.field private static j:Lcom/hudee/pns/b;


# instance fields
.field private d:Ljava/net/Socket;

.field private e:Ljava/io/OutputStream;

.field private f:Ljava/io/InputStream;

.field private g:Lcom/hudee/pns/c;

.field private h:Z

.field private i:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/hudee/pns/b;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/hudee/pns/b;->a:Ljava/lang/String;

    invoke-static {}, Lcom/hudee/pns/aa;->a()I

    move-result v0

    sput v0, Lcom/hudee/pns/b;->b:I

    const/4 v0, 0x5

    sput v0, Lcom/hudee/pns/b;->c:I

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/hudee/pns/b;->g:Lcom/hudee/pns/c;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/hudee/pns/b;->h:Z

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/hudee/pns/b;->i:J

    return-void
.end method

.method public static declared-synchronized a()Lcom/hudee/pns/b;
    .locals 2

    const-class v0, Lcom/hudee/pns/b;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/hudee/pns/b;->j:Lcom/hudee/pns/b;

    if-nez v1, :cond_0

    new-instance v1, Lcom/hudee/pns/b;

    invoke-direct {v1}, Lcom/hudee/pns/b;-><init>()V

    sput-object v1, Lcom/hudee/pns/b;->j:Lcom/hudee/pns/b;

    :cond_0
    sget-object v1, Lcom/hudee/pns/b;->j:Lcom/hudee/pns/b;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private e()V
    .locals 2

    invoke-virtual {p0}, Lcom/hudee/pns/b;->d()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/hudee/pns/b;->c()V

    new-instance v0, Ljava/io/IOException;

    const-string v1, "not connected"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method

.method private f()V
    .locals 4

    invoke-static {}, Lcom/hudee/pns/aa;->b()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/hudee/pns/b;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The get it deviceId onConnect is :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/b;->g:Lcom/hudee/pns/c;

    invoke-virtual {v0}, Lcom/hudee/pns/c;->a()V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/b;->g:Lcom/hudee/pns/c;

    invoke-virtual {v0}, Lcom/hudee/pns/c;->b()V

    goto :goto_0
.end method

.method private g()V
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/b;->d:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/hudee/pns/b;->e:Ljava/io/OutputStream;

    iget-object v0, p0, Lcom/hudee/pns/b;->d:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/hudee/pns/b;->f:Ljava/io/InputStream;

    iget-object v0, p0, Lcom/hudee/pns/b;->g:Lcom/hudee/pns/c;

    if-nez v0, :cond_0

    new-instance v0, Lcom/hudee/pns/c;

    invoke-direct {v0}, Lcom/hudee/pns/c;-><init>()V

    iput-object v0, p0, Lcom/hudee/pns/b;->g:Lcom/hudee/pns/c;

    :cond_0
    return-void
.end method


# virtual methods
.method public a(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;Ljava/lang/String;)V
    .locals 4

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->setLastException(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    invoke-static {}, Lcom/hudee/pns/aa;->a()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->setLastTimeout(I)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    invoke-virtual {v0, p2}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->setCause(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->build()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    sget-object v1, Lcom/hudee/pns/b;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[wzz]send heartbeat init!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/hudee/pns/bean/a;

    const/4 v2, 0x0

    sget-object v3, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->HEARTBEAT_INIT:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-direct {v1, v2, v3, v0}, Lcom/hudee/pns/bean/a;-><init>(ILcom/hudee/pns/bean/MessageRouting$MessageCMD;Lcom/google/protobuf/MessageLite;)V

    invoke-virtual {v1}, Lcom/hudee/pns/bean/a;->a()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/b;->a([B)V

    return-void
.end method

.method public a(Z)V
    .locals 5

    const/4 v4, 0x1

    invoke-virtual {p0}, Lcom/hudee/pns/b;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/hudee/pns/b;->a:Ljava/lang/String;

    const-string v1, "Current status is connected don\'t need open."

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    const-wide/16 v0, 0x1f40

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sub-long/2addr v0, v2

    iget-wide v2, p0, Lcom/hudee/pns/b;->i:J

    add-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_1

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_1
    new-instance v0, Ljava/net/Socket;

    invoke-static {}, Lcom/hudee/pns/z;->b()Ljava/net/InetAddress;

    move-result-object v1

    const/16 v2, 0x167d

    invoke-direct {v0, v1, v2}, Ljava/net/Socket;-><init>(Ljava/net/InetAddress;I)V

    iput-object v0, p0, Lcom/hudee/pns/b;->d:Ljava/net/Socket;

    iget-object v0, p0, Lcom/hudee/pns/b;->d:Ljava/net/Socket;

    invoke-virtual {v0, v4}, Ljava/net/Socket;->setKeepAlive(Z)V

    invoke-direct {p0}, Lcom/hudee/pns/b;->g()V

    iput-boolean v4, p0, Lcom/hudee/pns/b;->h:Z

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->none:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    if-eqz p1, :cond_2

    const-string v1, "choke"

    :goto_2
    invoke-virtual {p0, v0, v1}, Lcom/hudee/pns/b;->a(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;Ljava/lang/String;)V

    const/4 v0, 0x0

    sput-boolean v0, Lcom/hudee/pns/t;->b:Z

    invoke-direct {p0}, Lcom/hudee/pns/b;->f()V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/hudee/pns/b;->i:J

    sget-object v0, Lcom/hudee/pns/b;->a:Ljava/lang/String;

    const-string v1, "Tunnel opened..."

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const-string v1, "none"

    goto :goto_2

    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method public a([B)V
    .locals 1

    invoke-direct {p0}, Lcom/hudee/pns/b;->e()V

    iget-object v0, p0, Lcom/hudee/pns/b;->e:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    iget-object v0, p0, Lcom/hudee/pns/b;->e:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    return-void
.end method

.method public a(I)[B
    .locals 4

    invoke-direct {p0}, Lcom/hudee/pns/b;->e()V

    :try_start_0
    iget-object v0, p0, Lcom/hudee/pns/b;->d:Ljava/net/Socket;

    mul-int/lit16 v1, p1, 0x3e8

    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    const/16 v0, 0x2ee0

    new-array v0, v0, [B

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iget-object v2, p0, Lcom/hudee/pns/b;->f:Ljava/io/InputStream;

    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    :cond_0
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    if-eqz v0, :cond_1

    array-length v1, v0

    if-nez v1, :cond_2

    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "unexpected read return"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    :cond_2
    return-object v0
.end method

.method public b()V
    .locals 7

    new-instance v2, Lcom/hudee/pns/bean/a;

    const/4 v0, 0x1

    sget-object v1, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->HEARTBEAT:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->build()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v3

    invoke-direct {v2, v0, v1, v3}, Lcom/hudee/pns/bean/a;-><init>(ILcom/hudee/pns/bean/MessageRouting$MessageCMD;Lcom/google/protobuf/MessageLite;)V

    invoke-static {}, Lcom/hudee/pns/aa;->f()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/hudee/pns/t;->b:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/hudee/pns/b;->f()V

    :cond_0
    sget-object v0, Lcom/hudee/pns/b;->a:Ljava/lang/String;

    const-string v1, "Check have service bind error ! retry!"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const/4 v5, 0x0

    if-eqz v1, :cond_2

    const-string v6, ""

    invoke-virtual {v1, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2

    const-string v5, ":"

    invoke-virtual {v1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v5, 0x0

    aget-object v1, v1, v5

    :goto_1
    iget-object v5, p0, Lcom/hudee/pns/b;->g:Lcom/hudee/pns/c;

    invoke-virtual {v5, v0, v1}, Lcom/hudee/pns/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/hudee/pns/b;->a:Ljava/lang/String;

    const-string v1, "send heartbeat!"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/hudee/pns/bean/a;->a()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/b;->a([B)V

    return-void

    :cond_2
    move-object v1, v5

    goto :goto_1
.end method

.method public declared-synchronized b(Z)V
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/hudee/pns/b;->c()V

    invoke-virtual {p0, p1}, Lcom/hudee/pns/b;->a(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public c()V
    .locals 2

    sget-object v0, Lcom/hudee/pns/b;->a:Ljava/lang/String;

    const-string v1, "Closing tunnel..."

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->c(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/hudee/pns/b;->h:Z

    iget-object v0, p0, Lcom/hudee/pns/b;->d:Ljava/net/Socket;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/hudee/pns/b;->d:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/hudee/pns/b;->d:Ljava/net/Socket;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    :cond_0
    :goto_0
    sget-object v0, Lcom/hudee/pns/b;->a:Ljava/lang/String;

    const-string v1, "Socket closed."

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/hudee/pns/b;->f:Ljava/io/InputStream;

    if-eqz v0, :cond_1

    :try_start_1
    iget-object v0, p0, Lcom/hudee/pns/b;->f:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/hudee/pns/b;->f:Ljava/io/InputStream;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    :cond_1
    :goto_1
    sget-object v0, Lcom/hudee/pns/b;->a:Ljava/lang/String;

    const-string v1, "input stream closed."

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/hudee/pns/b;->e:Ljava/io/OutputStream;

    if-eqz v0, :cond_2

    :try_start_2
    iget-object v0, p0, Lcom/hudee/pns/b;->e:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/hudee/pns/b;->e:Ljava/io/OutputStream;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :cond_2
    :goto_2
    sget-object v0, Lcom/hudee/pns/b;->a:Ljava/lang/String;

    const-string v1, "out stream closed.& Tunnel closed."

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->c(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    goto :goto_0
.end method

.method public d()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/b;->h:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/b;->d:Ljava/net/Socket;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/b;->d:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
