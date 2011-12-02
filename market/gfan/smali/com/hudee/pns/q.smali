.class Lcom/hudee/pns/q;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:J

.field final synthetic b:Z

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Lcom/hudee/pns/n;


# direct methods
.method constructor <init>(Lcom/hudee/pns/n;JZLjava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/q;->d:Lcom/hudee/pns/n;

    iput-wide p2, p0, Lcom/hudee/pns/q;->a:J

    iput-boolean p4, p0, Lcom/hudee/pns/q;->b:Z

    iput-object p5, p0, Lcom/hudee/pns/q;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    invoke-static {}, Lcom/hudee/pns/n;->a()Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    invoke-static {}, Lcom/hudee/pns/n;->c()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/hudee/pns/q;->a:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/hudee/pns/n;->a()Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    :goto_0
    return-void

    :cond_0
    :try_start_1
    invoke-static {}, Lcom/hudee/pns/n;->c()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/hudee/pns/q;->a:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/hudee/pns/q;->b:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/hudee/pns/q;->c:Ljava/lang/String;

    invoke-static {v0}, Lcom/hudee/pns/r;->d(Ljava/lang/String;)V

    :goto_1
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/n;->a(J)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    invoke-static {}, Lcom/hudee/pns/n;->a()Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_0

    :cond_2
    :try_start_2
    iget-object v0, p0, Lcom/hudee/pns/q;->c:Ljava/lang/String;

    invoke-static {v0}, Lcom/hudee/pns/r;->a(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/hudee/pns/n;->a()Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method
