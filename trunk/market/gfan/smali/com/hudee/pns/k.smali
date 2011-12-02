.class Lcom/hudee/pns/k;
.super Landroid/content/BroadcastReceiver;


# instance fields
.field final synthetic a:Lcom/hudee/pns/h;


# direct methods
.method constructor <init>(Lcom/hudee/pns/h;)V
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/k;->a:Lcom/hudee/pns/h;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    new-instance v0, Lcom/hudee/pns/l;

    invoke-direct {v0, p0}, Lcom/hudee/pns/l;-><init>(Lcom/hudee/pns/k;)V

    invoke-static {v0}, Lcom/hudee/pns/service/b;->a(Ljava/lang/Runnable;)V

    return-void
.end method
