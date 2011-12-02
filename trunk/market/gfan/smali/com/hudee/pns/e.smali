.class public Lcom/hudee/pns/e;
.super Ljava/lang/Object;


# static fields
.field public static final a:Ljava/lang/String;

.field private static b:I


# instance fields
.field private c:Lcom/hudee/pns/f;

.field private d:Lcom/hudee/pns/b;

.field private e:Lcom/hudee/pns/c;

.field private f:Lcom/hudee/pns/g;

.field private g:I

.field private h:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput v0, Lcom/hudee/pns/e;->b:I

    const-class v0, Lcom/hudee/pns/e;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/hudee/pns/b;->a()Lcom/hudee/pns/b;

    move-result-object v0

    iput-object v0, p0, Lcom/hudee/pns/e;->d:Lcom/hudee/pns/b;

    new-instance v0, Lcom/hudee/pns/c;

    invoke-direct {v0}, Lcom/hudee/pns/c;-><init>()V

    iput-object v0, p0, Lcom/hudee/pns/e;->e:Lcom/hudee/pns/c;

    const/16 v0, 0x6e

    iput v0, p0, Lcom/hudee/pns/e;->g:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/hudee/pns/e;->h:Z

    return-void
.end method

.method static synthetic a(Lcom/hudee/pns/e;)Lcom/hudee/pns/b;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/e;->d:Lcom/hudee/pns/b;

    return-object v0
.end method

.method private a(Lcom/hudee/pns/bean/a;)V
    .locals 12

    const/4 v4, 0x0

    const/4 v8, 0x0

    const/4 v11, 0x1

    iget v0, p1, Lcom/hudee/pns/bean/a;->a:I

    if-nez v0, :cond_4

    iget-object v0, p1, Lcom/hudee/pns/bean/a;->b:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    sget-object v1, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->MESSAGE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object v0, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "readed msg is push message ! number :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/hudee/pns/e;->b:I

    add-int/lit8 v3, v2, 0x1

    sput v3, Lcom/hudee/pns/e;->b:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p1, Lcom/hudee/pns/bean/a;->d:Lcom/google/protobuf/MessageLite;

    check-cast v0, Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getTo()Ljava/lang/String;

    move-result-object v1

    const-string v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    move v2, v11

    :cond_0
    invoke-virtual {v1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\\."

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x2

    if-eq v2, v3, :cond_2

    sget-object v1, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v2, "Readed Message [TO] is Error Format!"

    invoke-static {v1, v2}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v8

    move-object v2, v8

    :goto_0
    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getUid()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getUid()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->setUid(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->build()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    move-result-object v4

    new-instance v5, Lcom/hudee/pns/bean/a;

    sget v6, Lcom/hudee/pns/b;->c:I

    add-int/lit8 v7, v6, 0x1

    sput v7, Lcom/hudee/pns/b;->c:I

    sget-object v7, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->ACKNOWLEDGEMENT:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-direct {v5, v6, v7, v4}, Lcom/hudee/pns/bean/a;-><init>(ILcom/hudee/pns/bean/MessageRouting$MessageCMD;Lcom/google/protobuf/MessageLite;)V

    new-instance v4, Lcom/hudee/pns/w;

    invoke-direct {v4}, Lcom/hudee/pns/w;-><init>()V

    invoke-virtual {v4}, Lcom/hudee/pns/w;->a()Lcom/hudee/pns/w;

    :try_start_0
    invoke-virtual {v4, v3}, Lcom/hudee/pns/w;->b(Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v7

    if-nez v7, :cond_3

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getDate()J

    move-result-wide v7

    invoke-virtual {v4, v3, v7, v8}, Lcom/hudee/pns/w;->a(Ljava/lang/String;J)J

    iget-object v7, p0, Lcom/hudee/pns/e;->f:Lcom/hudee/pns/g;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getContent()Lcom/google/protobuf/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toByteArray()[B

    move-result-object v0

    invoke-interface {v7, v1, v2, v3, v0}, Lcom/hudee/pns/g;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)V

    invoke-virtual {v4, v3}, Lcom/hudee/pns/w;->c(Ljava/lang/String;)Z

    sget-object v0, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "New Message!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_2
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    invoke-virtual {v4}, Lcom/hudee/pns/w;->b()V

    invoke-static {}, Lcom/hudee/pns/m;->a()V

    sget-object v0, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "send ack for msg id :["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_1
    iget-object v0, p0, Lcom/hudee/pns/e;->d:Lcom/hudee/pns/b;

    invoke-virtual {v5}, Lcom/hudee/pns/bean/a;->a()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/hudee/pns/b;->a([B)V

    sget-object v0, Lcom/hudee/pns/c;->c:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, v5, Lcom/hudee/pns/bean/a;->a:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_3
    return-void

    :cond_2
    aget-object v2, v1, v4

    aget-object v1, v1, v11

    goto/16 :goto_0

    :catch_0
    move-exception v6

    move-object v6, v8

    goto/16 :goto_1

    :cond_3
    const-string v7, "msg_status"

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    sget-object v8, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Repeat Message!"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    if-ne v7, v11, :cond_1

    sget-object v7, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v8, "Repeat Message and send to 3rd error,resend!"

    invoke-static {v7, v8}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v7, p0, Lcom/hudee/pns/e;->f:Lcom/hudee/pns/g;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getContent()Lcom/google/protobuf/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toByteArray()[B

    move-result-object v0

    invoke-interface {v7, v1, v2, v3, v0}, Lcom/hudee/pns/g;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)V

    goto/16 :goto_2

    :catch_1
    move-exception v0

    sget-object v1, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "error! sended message ["

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    :cond_4
    iget-object v0, p1, Lcom/hudee/pns/bean/a;->b:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    sget-object v1, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->HEARTBEAT_RESPONSE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    sget-object v0, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v1, "readed msg is heartbeat response !"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/hudee/pns/e;->f:Lcom/hudee/pns/g;

    iget-object p0, p1, Lcom/hudee/pns/bean/a;->d:Lcom/google/protobuf/MessageLite;

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatResponse;

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatResponse;->getDelay()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/hudee/pns/g;->a(I)V

    goto/16 :goto_3

    :cond_5
    iget-object v0, p0, Lcom/hudee/pns/e;->e:Lcom/hudee/pns/c;

    invoke-virtual {v0, p1}, Lcom/hudee/pns/c;->a(Lcom/hudee/pns/bean/a;)V

    goto/16 :goto_3
.end method

.method static synthetic a(Lcom/hudee/pns/e;[B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/hudee/pns/e;->a([B)V

    return-void
.end method

.method private a([B)V
    .locals 3

    if-eqz p1, :cond_0

    array-length v0, p1

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    array-length v0, p1

    const/16 v1, 0x8

    const/4 v2, 0x4

    invoke-direct {p0, p1, v1, v2}, Lcom/hudee/pns/e;->a([BII)[B

    move-result-object v1

    invoke-static {v1}, Lcom/hudee/pns/bean/a;->b([B)I

    move-result v1

    add-int/lit8 v1, v1, 0xc

    if-gt v1, v0, :cond_0

    if-ne v1, v0, :cond_2

    invoke-static {p1}, Lcom/hudee/pns/bean/a;->a([B)Lcom/hudee/pns/bean/a;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/hudee/pns/e;->a(Lcom/hudee/pns/bean/a;)V

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    invoke-direct {p0, p1, v2, v1}, Lcom/hudee/pns/e;->a([BII)[B

    move-result-object v2

    invoke-static {v2}, Lcom/hudee/pns/bean/a;->a([B)Lcom/hudee/pns/bean/a;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/hudee/pns/e;->a(Lcom/hudee/pns/bean/a;)V

    sub-int/2addr v0, v1

    invoke-direct {p0, p1, v1, v0}, Lcom/hudee/pns/e;->a([BII)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/hudee/pns/e;->a([B)V

    goto :goto_0
.end method

.method static synthetic a(Lcom/hudee/pns/e;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/e;->h:Z

    return p1
.end method

.method private a([BII)[B
    .locals 2

    if-eqz p1, :cond_0

    array-length v0, p1

    if-eqz v0, :cond_0

    array-length v0, p1

    if-ge p2, v0, :cond_0

    array-length v0, p1

    sub-int/2addr v0, p2

    if-le p3, v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_1
    new-array v0, p3, [B

    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method static synthetic b(Lcom/hudee/pns/e;)I
    .locals 1

    iget v0, p0, Lcom/hudee/pns/e;->g:I

    return v0
.end method

.method static synthetic c(Lcom/hudee/pns/e;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/e;->h:Z

    return v0
.end method

.method static synthetic d(Lcom/hudee/pns/e;)V
    .locals 0

    invoke-direct {p0}, Lcom/hudee/pns/e;->h()V

    return-void
.end method

.method private f()V
    .locals 1

    invoke-direct {p0}, Lcom/hudee/pns/e;->g()V

    iget-object v0, p0, Lcom/hudee/pns/e;->c:Lcom/hudee/pns/f;

    if-nez v0, :cond_0

    new-instance v0, Lcom/hudee/pns/f;

    invoke-direct {v0, p0}, Lcom/hudee/pns/f;-><init>(Lcom/hudee/pns/e;)V

    iput-object v0, p0, Lcom/hudee/pns/e;->c:Lcom/hudee/pns/f;

    iget-object v0, p0, Lcom/hudee/pns/e;->c:Lcom/hudee/pns/f;

    invoke-virtual {v0}, Lcom/hudee/pns/f;->start()V

    :cond_0
    return-void
.end method

.method private g()V
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/e;->c:Lcom/hudee/pns/f;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/e;->c:Lcom/hudee/pns/f;

    invoke-virtual {v0}, Lcom/hudee/pns/f;->c()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/hudee/pns/e;->c:Lcom/hudee/pns/f;

    :cond_0
    return-void
.end method

.method private h()V
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/e;->d:Lcom/hudee/pns/b;

    invoke-virtual {v0}, Lcom/hudee/pns/b;->c()V

    invoke-virtual {p0}, Lcom/hudee/pns/e;->c()V

    iget-object v0, p0, Lcom/hudee/pns/e;->f:Lcom/hudee/pns/g;

    invoke-interface {v0}, Lcom/hudee/pns/g;->a()V

    return-void
.end method


# virtual methods
.method public declared-synchronized a()V
    .locals 3

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v1, "start push connection"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-object v0, p0, Lcom/hudee/pns/e;->d:Lcom/hudee/pns/b;

    iget-boolean v1, p0, Lcom/hudee/pns/e;->h:Z

    invoke-virtual {v0, v1}, Lcom/hudee/pns/b;->a(Z)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/hudee/pns/e;->h:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :goto_0
    :try_start_2
    invoke-direct {p0}, Lcom/hudee/pns/e;->f()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :catch_0
    move-exception v0

    :try_start_3
    sget-object v1, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0}, Lcom/hudee/pns/e;->h()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public a(Lcom/hudee/pns/g;)V
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/e;->f:Lcom/hudee/pns/g;

    return-void
.end method

.method public declared-synchronized b()V
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v1, "stop push connection"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/hudee/pns/e;->g()V

    iget-object v0, p0, Lcom/hudee/pns/e;->d:Lcom/hudee/pns/b;

    invoke-virtual {v0}, Lcom/hudee/pns/b;->c()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized c()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/hudee/pns/e;->c:Lcom/hudee/pns/f;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/e;->c:Lcom/hudee/pns/f;

    invoke-virtual {v0}, Lcom/hudee/pns/f;->a()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized d()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/hudee/pns/e;->c:Lcom/hudee/pns/f;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/e;->c:Lcom/hudee/pns/f;

    invoke-virtual {v0}, Lcom/hudee/pns/f;->b()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized e()V
    .locals 3

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v1, "on wakeup"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-object v0, p0, Lcom/hudee/pns/e;->d:Lcom/hudee/pns/b;

    invoke-virtual {v0}, Lcom/hudee/pns/b;->d()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v0

    if-eqz v0, :cond_1

    :try_start_2
    invoke-virtual {p0}, Lcom/hudee/pns/e;->c()V

    sget-object v0, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v1, "try hb"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/hudee/pns/e;->d:Lcom/hudee/pns/b;

    invoke-virtual {v0}, Lcom/hudee/pns/b;->b()V

    invoke-virtual {p0}, Lcom/hudee/pns/e;->d()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :goto_0
    monitor-exit p0

    return-void

    :catch_0
    move-exception v0

    :try_start_3
    sget-object v1, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v2, "hb failed"

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/hudee/pns/e;->h:Z

    iget-object v0, p0, Lcom/hudee/pns/e;->d:Lcom/hudee/pns/b;

    invoke-virtual {v0}, Lcom/hudee/pns/b;->c()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    const-wide/16 v0, 0x64

    :try_start_4
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    :goto_1
    :try_start_5
    iget-object v0, p0, Lcom/hudee/pns/e;->c:Lcom/hudee/pns/f;

    invoke-static {v0}, Lcom/hudee/pns/f;->a(Lcom/hudee/pns/f;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/e;->d:Lcom/hudee/pns/b;

    iget-boolean v1, p0, Lcom/hudee/pns/e;->h:Z

    invoke-virtual {v0, v1}, Lcom/hudee/pns/b;->a(Z)V

    invoke-virtual {p0}, Lcom/hudee/pns/e;->d()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    :try_start_6
    sget-object v1, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v2, "error in wakeup"

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0}, Lcom/hudee/pns/e;->h()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    :try_start_7
    invoke-virtual {p0}, Lcom/hudee/pns/e;->b()V

    invoke-virtual {p0}, Lcom/hudee/pns/e;->a()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/hudee/pns/e;->d:Lcom/hudee/pns/b;

    iget-boolean v1, p0, Lcom/hudee/pns/e;->h:Z

    invoke-virtual {v0, v1}, Lcom/hudee/pns/b;->a(Z)V

    invoke-virtual {p0}, Lcom/hudee/pns/e;->d()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    goto :goto_0

    :catch_2
    move-exception v0

    goto :goto_1
.end method
