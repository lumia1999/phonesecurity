.class Lcom/hudee/pns/l;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/hudee/pns/k;


# direct methods
.method constructor <init>(Lcom/hudee/pns/k;)V
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/l;->a:Lcom/hudee/pns/k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/hudee/pns/l;->a:Lcom/hudee/pns/k;

    iget-object v0, v0, Lcom/hudee/pns/k;->a:Lcom/hudee/pns/h;

    const-string v1, "receive wakeup alarm"

    invoke-virtual {v0, v1}, Lcom/hudee/pns/h;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/hudee/pns/l;->a:Lcom/hudee/pns/k;

    iget-object v0, v0, Lcom/hudee/pns/k;->a:Lcom/hudee/pns/h;

    iget-object v0, v0, Lcom/hudee/pns/h;->a:Lcom/hudee/pns/e;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/hudee/pns/l;->a:Lcom/hudee/pns/k;

    iget-object v0, v0, Lcom/hudee/pns/k;->a:Lcom/hudee/pns/h;

    invoke-static {v0}, Lcom/hudee/pns/h;->a(Lcom/hudee/pns/h;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iget-object v0, p0, Lcom/hudee/pns/l;->a:Lcom/hudee/pns/k;

    iget-object v0, v0, Lcom/hudee/pns/k;->a:Lcom/hudee/pns/h;

    invoke-static {v0}, Lcom/hudee/pns/h;->b(Lcom/hudee/pns/h;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/l;->a:Lcom/hudee/pns/k;

    iget-object v0, v0, Lcom/hudee/pns/k;->a:Lcom/hudee/pns/h;

    invoke-static {v0}, Lcom/hudee/pns/h;->c(Lcom/hudee/pns/h;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/l;->a:Lcom/hudee/pns/k;

    iget-object v0, v0, Lcom/hudee/pns/k;->a:Lcom/hudee/pns/h;

    iget-object v0, v0, Lcom/hudee/pns/h;->a:Lcom/hudee/pns/e;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/l;->a:Lcom/hudee/pns/k;

    iget-object v0, v0, Lcom/hudee/pns/k;->a:Lcom/hudee/pns/h;

    iget-object v0, v0, Lcom/hudee/pns/h;->a:Lcom/hudee/pns/e;

    invoke-virtual {v0}, Lcom/hudee/pns/e;->e()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/l;->a:Lcom/hudee/pns/k;

    iget-object v0, v0, Lcom/hudee/pns/k;->a:Lcom/hudee/pns/h;

    invoke-static {v0}, Lcom/hudee/pns/h;->a(Lcom/hudee/pns/h;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    :cond_1
    :goto_0
    return-void

    :catch_0
    move-exception v0

    :try_start_1
    invoke-static {}, Lcom/hudee/pns/h;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "onWakeup err"

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object v0, p0, Lcom/hudee/pns/l;->a:Lcom/hudee/pns/k;

    iget-object v0, v0, Lcom/hudee/pns/k;->a:Lcom/hudee/pns/h;

    invoke-static {v0}, Lcom/hudee/pns/h;->a(Lcom/hudee/pns/h;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/hudee/pns/l;->a:Lcom/hudee/pns/k;

    iget-object v1, v1, Lcom/hudee/pns/k;->a:Lcom/hudee/pns/h;

    invoke-static {v1}, Lcom/hudee/pns/h;->a(Lcom/hudee/pns/h;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method
