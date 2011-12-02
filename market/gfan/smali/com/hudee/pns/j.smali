.class Lcom/hudee/pns/j;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/hudee/pns/g;


# instance fields
.field final synthetic a:Lcom/hudee/pns/h;


# direct methods
.method private constructor <init>(Lcom/hudee/pns/h;)V
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/j;->a:Lcom/hudee/pns/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/hudee/pns/h;Lcom/hudee/pns/i;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/hudee/pns/j;-><init>(Lcom/hudee/pns/h;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    invoke-static {}, Lcom/hudee/pns/z;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/j;->a:Lcom/hudee/pns/h;

    invoke-static {v0}, Lcom/hudee/pns/h;->e(Lcom/hudee/pns/h;)V

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/j;->a:Lcom/hudee/pns/h;

    const-string v1, "conn failed"

    invoke-virtual {v0, v1}, Lcom/hudee/pns/h;->a(Ljava/lang/String;)V

    return-void
.end method

.method public a(I)V
    .locals 3

    iget-object v0, p0, Lcom/hudee/pns/j;->a:Lcom/hudee/pns/h;

    invoke-static {v0, p1}, Lcom/hudee/pns/h;->a(Lcom/hudee/pns/h;I)V

    iget-object v0, p0, Lcom/hudee/pns/j;->a:Lcom/hudee/pns/h;

    invoke-static {v0}, Lcom/hudee/pns/h;->d(Lcom/hudee/pns/h;)V

    iget-object v0, p0, Lcom/hudee/pns/j;->a:Lcom/hudee/pns/h;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "recv hb:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/hudee/pns/h;->a(Ljava/lang/String;)V

    return-void
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 3

    invoke-static {}, Lcom/hudee/pns/h;->f()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "app msg:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/hudee/pns/j;->a:Lcom/hudee/pns/h;

    const-string v1, "recv app msg"

    invoke-virtual {v0, v1}, Lcom/hudee/pns/h;->a(Ljava/lang/String;)V

    invoke-static {p1, p2, p4}, Lcom/hudee/pns/t;->a(Ljava/lang/String;Ljava/lang/String;[B)V

    return-void
.end method
