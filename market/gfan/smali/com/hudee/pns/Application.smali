.class public Lcom/hudee/pns/Application;
.super Landroid/app/Application;


# static fields
.field public static final a:Ljava/lang/String;

.field public static context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/hudee/pns/Application;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/hudee/pns/Application;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 1

    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    sput-object p0, Lcom/hudee/pns/Application;->context:Landroid/content/Context;

    const-string v0, "Application initilize"

    invoke-static {v0}, Lcom/hudee/pns/r;->a(Ljava/lang/String;)V

    return-void
.end method

.method public onTerminate()V
    .locals 0

    invoke-super {p0}, Landroid/app/Application;->onTerminate()V

    invoke-static {}, Lcom/hudee/pns/service/b;->a()V

    return-void
.end method
