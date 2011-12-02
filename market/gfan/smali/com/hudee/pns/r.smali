.class public Lcom/hudee/pns/r;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/hudee/pns/a;


# static fields
.field static b:Lcom/hudee/pns/h;

.field private static final c:Ljava/lang/String;

.field private static d:Landroid/net/LocalServerSocket;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/hudee/pns/r;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/hudee/pns/r;->c:Ljava/lang/String;

    const/4 v0, 0x0

    sput-object v0, Lcom/hudee/pns/r;->d:Landroid/net/LocalServerSocket;

    new-instance v0, Lcom/hudee/pns/h;

    invoke-direct {v0}, Lcom/hudee/pns/h;-><init>()V

    sput-object v0, Lcom/hudee/pns/r;->b:Lcom/hudee/pns/h;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic a()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/hudee/pns/r;->c:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic a(Lcom/hudee/pns/r;Landroid/app/Service;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/hudee/pns/r;->b(Landroid/app/Service;Landroid/content/Intent;)V

    return-void
.end method

.method public static a(Ljava/lang/String;)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.hudee.pns.intent.RESUME_PUSH_SERVICE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "com.hudee.pns.data.PUSH_SERVICE_CAUSE"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object v1, Lcom/hudee/pns/r;->a:Landroid/content/Context;

    const-class v2, Lcom/hudee/pns/service/PushService;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-static {}, Lcom/hudee/pns/r;->b()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/hudee/pns/r;->a:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :cond_0
    return-void
.end method

.method private b(Landroid/app/Service;Landroid/content/Intent;)V
    .locals 3

    sget-object v0, Lcom/hudee/pns/r;->c:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PushService called with intent "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", cause:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-nez p2, :cond_1

    const-string v2, ""

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_0

    const-string v0, "com.hudee.pns.intent.START_PUSH_SERVICE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_0
    invoke-static {}, Lcom/hudee/pns/z;->a()Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Lcom/hudee/pns/r;->c:Ljava/lang/String;

    const-string v1, "no data network, ignore start service command"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void

    :cond_1
    const-string v2, "com.hudee.pns.data.PUSH_SERVICE_CAUSE"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/hudee/pns/r;->b:Lcom/hudee/pns/h;

    invoke-virtual {v0}, Lcom/hudee/pns/h;->a()V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/app/Service;->setForeground(Z)V

    goto :goto_1

    :cond_3
    const-string v0, "com.hudee.pns.intent.RESTART_PUSH_SERVICE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object v0, Lcom/hudee/pns/r;->b:Lcom/hudee/pns/h;

    invoke-virtual {v0}, Lcom/hudee/pns/h;->c()V

    goto :goto_1

    :cond_4
    const-string v0, "com.hudee.pns.intent.PAUSE_PUSH_SERVICE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    sget-object v0, Lcom/hudee/pns/r;->b:Lcom/hudee/pns/h;

    invoke-virtual {v0}, Lcom/hudee/pns/h;->d()V

    goto :goto_1

    :cond_5
    const-string v0, "com.hudee.pns.intent.RESUME_PUSH_SERVICE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    sget-object v0, Lcom/hudee/pns/r;->b:Lcom/hudee/pns/h;

    invoke-virtual {v0}, Lcom/hudee/pns/h;->e()V

    goto :goto_1

    :cond_6
    sget-object v0, Lcom/hudee/pns/r;->c:Ljava/lang/String;

    const-string v1, "go to stop Service!"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/app/Service;->stopSelf()V

    goto :goto_1
.end method

.method public static b(Ljava/lang/String;)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.hudee.pns.intent.START_PUSH_SERVICE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "com.hudee.pns.data.PUSH_SERVICE_CAUSE"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object v1, Lcom/hudee/pns/r;->a:Landroid/content/Context;

    const-class v2, Lcom/hudee/pns/service/PushService;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-static {}, Lcom/hudee/pns/r;->b()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/hudee/pns/r;->a:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :cond_0
    return-void
.end method

.method private static b()Z
    .locals 3

    const/4 v2, 0x0

    sget-object v0, Lcom/hudee/pns/r;->d:Landroid/net/LocalServerSocket;

    if-nez v0, :cond_0

    :try_start_0
    new-instance v0, Landroid/net/LocalServerSocket;

    const-string v1, "com.hudee.pns.single.local.server"

    invoke-direct {v0, v1}, Landroid/net/LocalServerSocket;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/hudee/pns/r;->d:Landroid/net/LocalServerSocket;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    sget-boolean v0, Lcom/hudee/pns/t;->f:Z

    if-nez v0, :cond_1

    sget-object v0, Lcom/hudee/pns/r;->c:Ljava/lang/String;

    const-string v1, "Now no one bind!"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    move v0, v2

    :goto_1
    return v0

    :catch_0
    move-exception v0

    sget-object v0, Lcom/hudee/pns/r;->c:Ljava/lang/String;

    const-string v1, "Push Service might already have been started in other application."

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/hudee/pns/r;->d:Landroid/net/LocalServerSocket;

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    move v0, v2

    goto :goto_1
.end method

.method public static c(Ljava/lang/String;)V
    .locals 3

    sget-object v0, Lcom/hudee/pns/r;->c:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "intent Stop Service !"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->b(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.hudee.pns.intent.STOP_PUSH_SERVICE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "com.hudee.pns.data.PUSH_SERVICE_CAUSE"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object v1, Lcom/hudee/pns/r;->a:Landroid/content/Context;

    const-class v2, Lcom/hudee/pns/service/PushService;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    sget-object v1, Lcom/hudee/pns/r;->a:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public static d(Ljava/lang/String;)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.hudee.pns.intent.RESTART_PUSH_SERVICE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "com.hudee.pns.data.PUSH_SERVICE_CAUSE"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object v1, Lcom/hudee/pns/r;->a:Landroid/content/Context;

    const-class v2, Lcom/hudee/pns/service/PushService;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-static {}, Lcom/hudee/pns/r;->b()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/hudee/pns/r;->a:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :cond_0
    return-void
.end method


# virtual methods
.method public a(Landroid/app/Service;Landroid/content/Intent;)V
    .locals 1

    new-instance v0, Lcom/hudee/pns/s;

    invoke-direct {v0, p0, p1, p2}, Lcom/hudee/pns/s;-><init>(Lcom/hudee/pns/r;Landroid/app/Service;Landroid/content/Intent;)V

    invoke-static {v0}, Lcom/hudee/pns/service/b;->a(Ljava/lang/Runnable;)V

    return-void
.end method
