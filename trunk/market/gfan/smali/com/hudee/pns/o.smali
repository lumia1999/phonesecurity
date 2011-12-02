.class Lcom/hudee/pns/o;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Landroid/content/Intent;

.field final synthetic b:Lcom/hudee/pns/n;


# direct methods
.method constructor <init>(Lcom/hudee/pns/n;Landroid/content/Intent;)V
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/o;->b:Lcom/hudee/pns/n;

    iput-object p2, p0, Lcom/hudee/pns/o;->a:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    const-string v0, "android.intent.action.SCREEN_OFF"

    iget-object v1, p0, Lcom/hudee/pns/o;->a:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "android.intent.action.SCREEN_ON"

    iget-object v1, p0, Lcom/hudee/pns/o;->a:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const-string v0, "software updated"

    invoke-static {v0}, Lcom/hudee/pns/r;->b(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/hudee/pns/o;->b:Lcom/hudee/pns/n;

    invoke-static {v0}, Lcom/hudee/pns/n;->a(Lcom/hudee/pns/n;)V

    :cond_1
    return-void
.end method
