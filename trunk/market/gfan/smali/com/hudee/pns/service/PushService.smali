.class public Lcom/hudee/pns/service/PushService;
.super Landroid/app/Service;


# static fields
.field private static a:Lcom/hudee/pns/r;

.field private static b:Lcom/hudee/pns/h;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    invoke-static {}, Lcom/hudee/pns/service/PushService;->b()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method static synthetic a()Lcom/hudee/pns/h;
    .locals 1

    sget-object v0, Lcom/hudee/pns/service/PushService;->b:Lcom/hudee/pns/h;

    return-object v0
.end method

.method private static b()V
    .locals 1

    sget-object v0, Lcom/hudee/pns/service/PushService;->b:Lcom/hudee/pns/h;

    if-nez v0, :cond_0

    new-instance v0, Lcom/hudee/pns/h;

    invoke-direct {v0}, Lcom/hudee/pns/h;-><init>()V

    sput-object v0, Lcom/hudee/pns/service/PushService;->b:Lcom/hudee/pns/h;

    :cond_0
    sget-object v0, Lcom/hudee/pns/service/PushService;->a:Lcom/hudee/pns/r;

    if-nez v0, :cond_1

    new-instance v0, Lcom/hudee/pns/r;

    invoke-direct {v0}, Lcom/hudee/pns/r;-><init>()V

    sput-object v0, Lcom/hudee/pns/service/PushService;->a:Lcom/hudee/pns/r;

    :cond_1
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    new-instance v0, Lcom/hudee/pns/service/a;

    invoke-direct {v0, p0}, Lcom/hudee/pns/service/a;-><init>(Lcom/hudee/pns/service/PushService;)V

    invoke-static {v0}, Lcom/hudee/pns/service/b;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 1

    sget-object v0, Lcom/hudee/pns/service/PushService;->a:Lcom/hudee/pns/r;

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/r;->a(Landroid/app/Service;Landroid/content/Intent;)V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1

    sget-object v0, Lcom/hudee/pns/service/PushService;->a:Lcom/hudee/pns/r;

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/r;->a(Landroid/app/Service;Landroid/content/Intent;)V

    const/4 v0, 0x1

    return v0
.end method
