.class public Lcom/hudee/pns/receiver/ScreenEventReceiver;
.super Landroid/content/BroadcastReceiver;


# instance fields
.field private a:Lcom/hudee/pns/n;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private a()V
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/receiver/ScreenEventReceiver;->a:Lcom/hudee/pns/n;

    if-nez v0, :cond_0

    new-instance v0, Lcom/hudee/pns/n;

    invoke-direct {v0}, Lcom/hudee/pns/n;-><init>()V

    iput-object v0, p0, Lcom/hudee/pns/receiver/ScreenEventReceiver;->a:Lcom/hudee/pns/n;

    :cond_0
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    invoke-direct {p0}, Lcom/hudee/pns/receiver/ScreenEventReceiver;->a()V

    iget-object v0, p0, Lcom/hudee/pns/receiver/ScreenEventReceiver;->a:Lcom/hudee/pns/n;

    invoke-virtual {v0, p2}, Lcom/hudee/pns/n;->a(Landroid/content/Intent;)V

    return-void
.end method
