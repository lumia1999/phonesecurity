.class Lcom/hudee/pns/s;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Landroid/app/Service;

.field final synthetic b:Landroid/content/Intent;

.field final synthetic c:Lcom/hudee/pns/r;


# direct methods
.method constructor <init>(Lcom/hudee/pns/r;Landroid/app/Service;Landroid/content/Intent;)V
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/s;->c:Lcom/hudee/pns/r;

    iput-object p2, p0, Lcom/hudee/pns/s;->a:Landroid/app/Service;

    iput-object p3, p0, Lcom/hudee/pns/s;->b:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/hudee/pns/s;->c:Lcom/hudee/pns/r;

    iget-object v1, p0, Lcom/hudee/pns/s;->a:Landroid/app/Service;

    iget-object v2, p0, Lcom/hudee/pns/s;->b:Landroid/content/Intent;

    invoke-static {v0, v1, v2}, Lcom/hudee/pns/r;->a(Lcom/hudee/pns/r;Landroid/app/Service;Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {}, Lcom/hudee/pns/r;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "[wzz]onHandleCommand error"

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
