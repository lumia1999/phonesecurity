.class Lcom/hudee/pns/service/a;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/hudee/pns/service/PushService;


# direct methods
.method constructor <init>(Lcom/hudee/pns/service/PushService;)V
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/service/a;->a:Lcom/hudee/pns/service/PushService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    invoke-static {}, Lcom/hudee/pns/service/PushService;->a()Lcom/hudee/pns/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/hudee/pns/h;->b()V

    return-void
.end method
