.class public Lcom/hudee/pns/u;
.super Ljava/lang/Object;


# instance fields
.field private a:Lcom/hudee/pns/c;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/hudee/pns/c;

    invoke-direct {v0}, Lcom/hudee/pns/c;-><init>()V

    iput-object v0, p0, Lcom/hudee/pns/u;->a:Lcom/hudee/pns/c;

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Intent;)V
    .locals 4

    const-string v0, "com.hudee.pns.intent.SENDMSG"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "sendmsg"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v0

    const-string v1, "registration_id"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "appId"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v0, :cond_0

    array-length v3, v0

    if-eqz v3, :cond_0

    if-eqz v2, :cond_0

    if-eqz v1, :cond_0

    iget-object v3, p0, Lcom/hudee/pns/u;->a:Lcom/hudee/pns/c;

    invoke-virtual {v3, v2, v1, v0}, Lcom/hudee/pns/c;->a(Ljava/lang/String;Ljava/lang/String;[B)V

    :cond_0
    return-void
.end method
