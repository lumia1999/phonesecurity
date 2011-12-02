.class Lcom/hudee/pns/f;
.super Ljava/lang/Thread;


# instance fields
.field final synthetic a:Lcom/hudee/pns/e;

.field private b:Z

.field private c:Z

.field private d:Z


# direct methods
.method constructor <init>(Lcom/hudee/pns/e;)V
    .locals 2

    const/4 v1, 0x0

    iput-object p1, p0, Lcom/hudee/pns/f;->a:Lcom/hudee/pns/e;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/hudee/pns/f;->b:Z

    iput-boolean v1, p0, Lcom/hudee/pns/f;->c:Z

    iput-boolean v1, p0, Lcom/hudee/pns/f;->d:Z

    return-void
.end method

.method static synthetic a(Lcom/hudee/pns/f;)Z
    .locals 1

    invoke-direct {p0}, Lcom/hudee/pns/f;->f()Z

    move-result v0

    return v0
.end method

.method private declared-synchronized d()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/hudee/pns/f;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized e()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/hudee/pns/f;->c:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized f()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/hudee/pns/f;->d:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized a()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/hudee/pns/f;->c:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/hudee/pns/f;->d:Z

    invoke-virtual {p0}, Lcom/hudee/pns/f;->interrupt()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized b()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/hudee/pns/f;->c:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/hudee/pns/f;->d:Z

    invoke-virtual {p0}, Lcom/hudee/pns/f;->interrupt()V
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
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v1, "Stop ListenThread."

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/hudee/pns/f;->b:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/hudee/pns/f;->c:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/hudee/pns/f;->d:Z

    invoke-virtual {p0}, Lcom/hudee/pns/f;->interrupt()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public run()V
    .locals 3

    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/hudee/pns/f;->d()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/hudee/pns/z;->a()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lcom/hudee/pns/f;->e()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/hudee/pns/f;->a:Lcom/hudee/pns/e;

    invoke-static {v0}, Lcom/hudee/pns/e;->a(Lcom/hudee/pns/e;)Lcom/hudee/pns/b;

    move-result-object v0

    invoke-virtual {v0}, Lcom/hudee/pns/b;->d()Z

    move-result v0

    if-nez v0, :cond_3

    :cond_1
    :try_start_0
    sget-object v0, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v1, "ListenThread paused."

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/hudee/pns/f;->e()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/hudee/pns/f;->d:Z

    :cond_2
    const-wide/32 v0, 0xb2390

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v0, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v1, "ListenThread recovered"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    :try_start_1
    sget-object v0, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v1, "ListenThread before readMsg!"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/hudee/pns/f;->a:Lcom/hudee/pns/e;

    invoke-static {v0}, Lcom/hudee/pns/e;->a(Lcom/hudee/pns/e;)Lcom/hudee/pns/b;

    move-result-object v0

    iget-object v1, p0, Lcom/hudee/pns/f;->a:Lcom/hudee/pns/e;

    invoke-static {v1}, Lcom/hudee/pns/e;->b(Lcom/hudee/pns/e;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/hudee/pns/b;->a(I)[B

    move-result-object v0

    sget-object v1, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v2, "ListenThread read msg !"

    invoke-static {v1, v2}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v0, :cond_0

    array-length v1, v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    if-lez v1, :cond_0

    :try_start_2
    iget-object v1, p0, Lcom/hudee/pns/f;->a:Lcom/hudee/pns/e;

    invoke-static {v1, v0}, Lcom/hudee/pns/e;->a(Lcom/hudee/pns/e;[B)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    :try_start_3
    sget-object v1, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v2, "read msg"

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    :catch_2
    move-exception v0

    :try_start_4
    invoke-direct {p0}, Lcom/hudee/pns/f;->d()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/hudee/pns/f;->e()Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v2, "Exception when readMsg, try reOpen"

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v0, p0, Lcom/hudee/pns/f;->a:Lcom/hudee/pns/e;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/e;->a(Lcom/hudee/pns/e;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/f;->a:Lcom/hudee/pns/e;

    invoke-static {v0}, Lcom/hudee/pns/e;->a(Lcom/hudee/pns/e;)Lcom/hudee/pns/b;

    move-result-object v0

    iget-object v1, p0, Lcom/hudee/pns/f;->a:Lcom/hudee/pns/e;

    invoke-static {v1}, Lcom/hudee/pns/e;->c(Lcom/hudee/pns/e;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/hudee/pns/b;->b(Z)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto/16 :goto_0

    :catch_3
    move-exception v0

    sget-object v1, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v2, "ListenThread IOException reOpen failed. "

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0}, Lcom/hudee/pns/f;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/hudee/pns/f;->e()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/f;->a:Lcom/hudee/pns/e;

    invoke-static {v0}, Lcom/hudee/pns/e;->d(Lcom/hudee/pns/e;)V

    goto/16 :goto_0

    :cond_4
    sget-object v0, Lcom/hudee/pns/e;->a:Ljava/lang/String;

    const-string v1, "End ListenThread run."

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
