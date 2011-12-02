.class public Lcom/hudee/pns/n;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/hudee/pns/a;


# static fields
.field private static final b:Ljava/lang/String;

.field private static final c:Ljava/util/concurrent/locks/Lock;

.field private static d:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-class v0, Lcom/hudee/pns/n;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/hudee/pns/n;->b:Ljava/lang/String;

    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>(Z)V

    sput-object v0, Lcom/hudee/pns/n;->c:Ljava/util/concurrent/locks/Lock;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic a(J)J
    .locals 0

    sput-wide p0, Lcom/hudee/pns/n;->d:J

    return-wide p0
.end method

.method static synthetic a()Ljava/util/concurrent/locks/Lock;
    .locals 1

    sget-object v0, Lcom/hudee/pns/n;->c:Ljava/util/concurrent/locks/Lock;

    return-object v0
.end method

.method private a(JZLjava/lang/String;)V
    .locals 6

    new-instance v0, Lcom/hudee/pns/q;

    move-object v1, p0

    move-wide v2, p1

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/hudee/pns/q;-><init>(Lcom/hudee/pns/n;JZLjava/lang/String;)V

    const-wide/16 v1, 0x1b58

    invoke-static {v0, v1, v2}, Lcom/hudee/pns/service/b;->a(Ljava/lang/Runnable;J)V

    return-void
.end method

.method static synthetic a(Lcom/hudee/pns/n;)V
    .locals 0

    invoke-direct {p0}, Lcom/hudee/pns/n;->d()V

    return-void
.end method

.method static synthetic a(Lcom/hudee/pns/n;JZLjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/hudee/pns/n;->a(JZLjava/lang/String;)V

    return-void
.end method

.method static synthetic b()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/hudee/pns/n;->b:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic c()J
    .locals 2

    sget-wide v0, Lcom/hudee/pns/n;->d:J

    return-wide v0
.end method

.method private d()V
    .locals 4

    new-instance v0, Landroid/content/ComponentName;

    sget-object v1, Lcom/hudee/pns/Application;->context:Landroid/content/Context;

    const-class v2, Lcom/hudee/pns/receiver/ScreenEventReceiver;

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v1, Lcom/hudee/pns/Application;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Intent;)V
    .locals 1

    new-instance v0, Lcom/hudee/pns/o;

    invoke-direct {v0, p0, p1}, Lcom/hudee/pns/o;-><init>(Lcom/hudee/pns/n;Landroid/content/Intent;)V

    invoke-static {v0}, Lcom/hudee/pns/service/b;->b(Ljava/lang/Runnable;)V

    return-void
.end method

.method public b(Landroid/content/Intent;)V
    .locals 1

    sget-boolean v0, Lcom/hudee/pns/t;->f:Z

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    new-instance v0, Lcom/hudee/pns/p;

    invoke-direct {v0, p0, p1}, Lcom/hudee/pns/p;-><init>(Lcom/hudee/pns/n;Landroid/content/Intent;)V

    invoke-static {v0}, Lcom/hudee/pns/service/b;->b(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
