.class public Lcom/hudee/pns/h;
.super Ljava/lang/Object;


# static fields
.field private static final b:Ljava/lang/String;

.field private static d:Landroid/app/AlarmManager;

.field private static e:Landroid/app/PendingIntent;


# instance fields
.field protected a:Lcom/hudee/pns/e;

.field private c:Lcom/hudee/pns/k;

.field private f:I

.field private g:Z

.field private h:I

.field private i:Z

.field private j:Z

.field private k:Ljava/util/concurrent/locks/Lock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/hudee/pns/h;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/hudee/pns/h;->b:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/hudee/pns/k;

    invoke-direct {v0, p0}, Lcom/hudee/pns/k;-><init>(Lcom/hudee/pns/h;)V

    iput-object v0, p0, Lcom/hudee/pns/h;->c:Lcom/hudee/pns/k;

    invoke-static {}, Lcom/hudee/pns/aa;->a()I

    move-result v0

    iput v0, p0, Lcom/hudee/pns/h;->f:I

    iput-boolean v1, p0, Lcom/hudee/pns/h;->g:Z

    iput v1, p0, Lcom/hudee/pns/h;->h:I

    iput-boolean v1, p0, Lcom/hudee/pns/h;->i:Z

    iput-boolean v1, p0, Lcom/hudee/pns/h;->j:Z

    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    return-void
.end method

.method static synthetic a(Lcom/hudee/pns/h;)Ljava/util/concurrent/locks/Lock;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    return-object v0
.end method

.method private a(I)V
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iget v0, p0, Lcom/hudee/pns/h;->f:I

    if-eq v0, p1, :cond_0

    invoke-static {p1}, Lcom/hudee/pns/aa;->a(I)V

    sput p1, Lcom/hudee/pns/b;->b:I

    iput p1, p0, Lcom/hudee/pns/h;->f:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method static synthetic a(Lcom/hudee/pns/h;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/hudee/pns/h;->a(I)V

    return-void
.end method

.method static synthetic b(Lcom/hudee/pns/h;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/h;->i:Z

    return v0
.end method

.method static synthetic c(Lcom/hudee/pns/h;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/h;->j:Z

    return v0
.end method

.method static synthetic d(Lcom/hudee/pns/h;)V
    .locals 0

    invoke-direct {p0}, Lcom/hudee/pns/h;->u()V

    return-void
.end method

.method static synthetic e(Lcom/hudee/pns/h;)V
    .locals 0

    invoke-direct {p0}, Lcom/hudee/pns/h;->t()V

    return-void
.end method

.method static synthetic f()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/hudee/pns/h;->b:Ljava/lang/String;

    return-object v0
.end method

.method private g()V
    .locals 3

    new-instance v0, Lcom/hudee/pns/e;

    invoke-direct {v0}, Lcom/hudee/pns/e;-><init>()V

    iput-object v0, p0, Lcom/hudee/pns/h;->a:Lcom/hudee/pns/e;

    iget-object v0, p0, Lcom/hudee/pns/h;->a:Lcom/hudee/pns/e;

    new-instance v1, Lcom/hudee/pns/j;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/hudee/pns/j;-><init>(Lcom/hudee/pns/h;Lcom/hudee/pns/i;)V

    invoke-virtual {v0, v1}, Lcom/hudee/pns/e;->a(Lcom/hudee/pns/g;)V

    return-void
.end method

.method private h()V
    .locals 3

    iget-object v0, p0, Lcom/hudee/pns/h;->a:Lcom/hudee/pns/e;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/hudee/pns/h;->g()V

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/hudee/pns/h;->a:Lcom/hudee/pns/e;

    invoke-virtual {v0}, Lcom/hudee/pns/e;->a()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    sget-object v1, Lcom/hudee/pns/h;->b:Ljava/lang/String;

    const-string v2, "start conn failed"

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private i()V
    .locals 3

    iget-object v0, p0, Lcom/hudee/pns/h;->a:Lcom/hudee/pns/e;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/hudee/pns/h;->a:Lcom/hudee/pns/e;

    invoke-virtual {v0}, Lcom/hudee/pns/e;->b()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/hudee/pns/h;->b:Ljava/lang/String;

    const-string v2, "stop conn err"

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private j()V
    .locals 3

    iget-object v0, p0, Lcom/hudee/pns/h;->a:Lcom/hudee/pns/e;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/hudee/pns/h;->a:Lcom/hudee/pns/e;

    invoke-virtual {v0}, Lcom/hudee/pns/e;->c()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/hudee/pns/h;->b:Ljava/lang/String;

    const-string v2, "pause conn err"

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private k()V
    .locals 3

    iget-object v0, p0, Lcom/hudee/pns/h;->a:Lcom/hudee/pns/e;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/hudee/pns/h;->h()V

    :goto_0
    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/hudee/pns/h;->a:Lcom/hudee/pns/e;

    invoke-virtual {v0}, Lcom/hudee/pns/e;->d()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/hudee/pns/h;->b:Ljava/lang/String;

    const-string v2, "resume conn failed"

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private l()V
    .locals 1

    invoke-direct {p0}, Lcom/hudee/pns/h;->q()V

    const-string v0, "startWakeupProcess"

    invoke-virtual {p0, v0}, Lcom/hudee/pns/h;->a(Ljava/lang/String;)V

    return-void
.end method

.method private m()V
    .locals 0

    invoke-direct {p0}, Lcom/hudee/pns/h;->r()V

    invoke-static {}, Lcom/hudee/pns/h;->n()V

    return-void
.end method

.method private static n()V
    .locals 3

    :try_start_0
    invoke-static {}, Lcom/hudee/pns/h;->o()Landroid/app/AlarmManager;

    move-result-object v0

    invoke-static {}, Lcom/hudee/pns/h;->p()Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    sget-object v1, Lcom/hudee/pns/h;->b:Ljava/lang/String;

    const-string v2, "cancel alarm failed"

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static o()Landroid/app/AlarmManager;
    .locals 2

    sget-object v0, Lcom/hudee/pns/h;->d:Landroid/app/AlarmManager;

    if-nez v0, :cond_0

    sget-object v0, Lcom/hudee/pns/Application;->context:Landroid/content/Context;

    const-string v1, "alarm"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    sput-object v0, Lcom/hudee/pns/h;->d:Landroid/app/AlarmManager;

    :cond_0
    sget-object v0, Lcom/hudee/pns/h;->d:Landroid/app/AlarmManager;

    return-object v0
.end method

.method private static p()Landroid/app/PendingIntent;
    .locals 4

    sget-object v0, Lcom/hudee/pns/h;->e:Landroid/app/PendingIntent;

    if-nez v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.hudee.pns.intent.WAKEUP_EVENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/hudee/pns/Application;->context:Landroid/content/Context;

    const/4 v2, 0x0

    const/high16 v3, 0x800

    invoke-static {v1, v2, v0, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    sput-object v0, Lcom/hudee/pns/h;->e:Landroid/app/PendingIntent;

    :cond_0
    sget-object v0, Lcom/hudee/pns/h;->e:Landroid/app/PendingIntent;

    return-object v0
.end method

.method private q()V
    .locals 3

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.hudee.pns.intent.WAKEUP_EVENT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    sget-object v1, Lcom/hudee/pns/Application;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/hudee/pns/h;->c:Lcom/hudee/pns/k;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method private r()V
    .locals 3

    :try_start_0
    sget-object v0, Lcom/hudee/pns/Application;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/hudee/pns/h;->c:Lcom/hudee/pns/k;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    sget-object v1, Lcom/hudee/pns/h;->b:Ljava/lang/String;

    const-string v2, "unregister receiver err"

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private s()I
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iget-boolean v0, p0, Lcom/hudee/pns/h;->g:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/hudee/pns/h;->h:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/hudee/pns/h;->h:I

    iget v0, p0, Lcom/hudee/pns/h;->h:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    mul-int/lit16 v0, v0, 0x32c8

    iget-object v1, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    :goto_0
    return v0

    :cond_0
    :try_start_1
    iget v0, p0, Lcom/hudee/pns/h;->f:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    mul-int/lit16 v0, v0, 0x3e8

    iget-object v1, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method private t()V
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/hudee/pns/h;->g:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method private u()V
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/hudee/pns/h;->g:Z

    const/4 v0, 0x0

    iput v0, p0, Lcom/hudee/pns/h;->h:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method


# virtual methods
.method public a()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iget-boolean v0, p0, Lcom/hudee/pns/h;->i:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/hudee/pns/h;->j:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/hudee/pns/h;->k()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    :goto_0
    iput-boolean v1, p0, Lcom/hudee/pns/h;->j:Z

    invoke-direct {p0}, Lcom/hudee/pns/h;->l()V

    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :cond_1
    :try_start_1
    invoke-direct {p0}, Lcom/hudee/pns/h;->h()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/hudee/pns/h;->i:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    iput-boolean v1, p0, Lcom/hudee/pns/h;->j:Z

    invoke-direct {p0}, Lcom/hudee/pns/h;->l()V

    iget-object v1, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public a(Ljava/lang/String;)V
    .locals 5

    iget-boolean v0, p0, Lcom/hudee/pns/h;->i:Z

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0}, Lcom/hudee/pns/h;->s()I

    move-result v0

    sget-object v1, Lcom/hudee/pns/h;->b:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "post wakeup alarm, cause:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", next interval is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    int-to-long v3, v0

    add-long v0, v1, v3

    invoke-static {}, Lcom/hudee/pns/h;->o()Landroid/app/AlarmManager;

    move-result-object v2

    const/4 v3, 0x2

    invoke-static {}, Lcom/hudee/pns/h;->p()Landroid/app/PendingIntent;

    move-result-object v4

    invoke-virtual {v2, v3, v0, v1, v4}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    goto :goto_0
.end method

.method public b()V
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    invoke-direct {p0}, Lcom/hudee/pns/h;->m()V

    iget-boolean v0, p0, Lcom/hudee/pns/h;->i:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/hudee/pns/h;->i()V

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/hudee/pns/h;->i:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/hudee/pns/h;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public c()V
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    sget-object v0, Lcom/hudee/pns/h;->b:Ljava/lang/String;

    const-string v1, "restart push connection"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/hudee/pns/h;->i()V

    sget-object v0, Lcom/hudee/pns/h;->b:Ljava/lang/String;

    const-string v1, "connection stoped"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/hudee/pns/h;->h()V

    sget-object v0, Lcom/hudee/pns/h;->b:Ljava/lang/String;

    const-string v1, "connection restarted"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/hudee/pns/h;->i:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/hudee/pns/h;->j:Z

    invoke-direct {p0}, Lcom/hudee/pns/h;->l()V

    sget-object v0, Lcom/hudee/pns/h;->b:Ljava/lang/String;

    const-string v1, "wakeup processor started"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public d()V
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    invoke-direct {p0}, Lcom/hudee/pns/h;->j()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/hudee/pns/h;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public e()V
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    invoke-direct {p0}, Lcom/hudee/pns/h;->k()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/hudee/pns/h;->i:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/hudee/pns/h;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/hudee/pns/h;->k:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method
