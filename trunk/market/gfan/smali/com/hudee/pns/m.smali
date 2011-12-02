.class public Lcom/hudee/pns/m;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/hudee/pns/a;


# static fields
.field private static final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/hudee/pns/m;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/hudee/pns/m;->b:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a()V
    .locals 7

    new-instance v1, Landroid/content/Intent;

    const-string v0, "com.hudee.pns.sync.parameters"

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    const-string v0, "whoamI"

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v3

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v3, "registered_apps"

    invoke-static {}, Lcom/hudee/pns/aa;->f()Ljava/util/Map;

    move-result-object v0

    check-cast v0, Ljava/io/Serializable;

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    const-string v3, "subscribed_apps"

    invoke-static {}, Lcom/hudee/pns/aa;->g()Ljava/util/Map;

    move-result-object v0

    check-cast v0, Ljava/io/Serializable;

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    new-instance v0, Lcom/hudee/pns/w;

    invoke-direct {v0}, Lcom/hudee/pns/w;-><init>()V

    invoke-virtual {v0}, Lcom/hudee/pns/w;->a()Lcom/hudee/pns/w;

    invoke-virtual {v0}, Lcom/hudee/pns/w;->c()V

    invoke-virtual {v0}, Lcom/hudee/pns/w;->d()Ljava/util/HashMap;

    move-result-object v3

    const-string v4, "message_status"

    invoke-virtual {v0}, Lcom/hudee/pns/w;->d()Ljava/util/HashMap;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    sget-object v4, Lcom/hudee/pns/m;->b:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Sync msg status!"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/hudee/pns/w;->b()V

    const-string v0, "server_ip"

    invoke-static {}, Lcom/hudee/pns/aa;->d()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "device_id"

    invoke-static {}, Lcom/hudee/pns/aa;->b()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "device_key"

    invoke-static {}, Lcom/hudee/pns/aa;->c()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "last_version"

    invoke-static {}, Lcom/hudee/pns/aa;->e()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "heart_beat_interval"

    invoke-static {}, Lcom/hudee/pns/aa;->a()I

    move-result v3

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v1, v2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    sget-object v0, Lcom/hudee/pns/m;->a:Landroid/content/Context;

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method private a(Ljava/lang/String;)Z
    .locals 1

    if-eqz p1, :cond_0

    const-string v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public a(Landroid/content/Intent;)V
    .locals 7

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v0, "whoamI"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v2

    if-eq v0, v2, :cond_8

    const-string v0, "server_ip"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v0, "device_id"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "device_key"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "last_version"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v0, "heart_beat_interval"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    const-string v0, "registered_apps"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast v0, Ljava/util/HashMap;

    invoke-static {v0}, Lcom/hudee/pns/aa;->a(Ljava/util/Map;)V

    :cond_0
    const-string v0, "subscribed_apps"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    if-eqz v0, :cond_1

    check-cast v0, Ljava/util/HashMap;

    invoke-static {v0}, Lcom/hudee/pns/aa;->a(Ljava/util/Map;)V

    :cond_1
    const-string v0, "message_status"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    if-eqz v0, :cond_2

    new-instance v1, Lcom/hudee/pns/w;

    invoke-direct {v1}, Lcom/hudee/pns/w;-><init>()V

    invoke-virtual {v1}, Lcom/hudee/pns/w;->a()Lcom/hudee/pns/w;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Lcom/hudee/pns/w;->a(Ljava/util/HashMap;)V

    invoke-virtual {v1}, Lcom/hudee/pns/w;->b()V

    :cond_2
    invoke-direct {p0, v2}, Lcom/hudee/pns/m;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/hudee/pns/aa;->d()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {v2}, Lcom/hudee/pns/aa;->c(Ljava/lang/String;)V

    :cond_3
    invoke-direct {p0, v3}, Lcom/hudee/pns/m;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/hudee/pns/aa;->b()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-static {v3}, Lcom/hudee/pns/aa;->a(Ljava/lang/String;)V

    :cond_4
    invoke-direct {p0, v4}, Lcom/hudee/pns/m;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {}, Lcom/hudee/pns/aa;->c()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-static {v4}, Lcom/hudee/pns/aa;->b(Ljava/lang/String;)V

    :cond_5
    if-eqz v6, :cond_6

    invoke-static {}, Lcom/hudee/pns/aa;->a()I

    move-result v0

    if-eq v0, v6, :cond_6

    invoke-static {v6}, Lcom/hudee/pns/aa;->a(I)V

    :cond_6
    invoke-direct {p0, v5}, Lcom/hudee/pns/m;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-static {}, Lcom/hudee/pns/aa;->e()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_7

    invoke-static {v5}, Lcom/hudee/pns/aa;->d(Ljava/lang/String;)V

    :cond_7
    :goto_0
    return-void

    :cond_8
    sget-object v0, Lcom/hudee/pns/m;->b:Ljava/lang/String;

    const-string v1, "The sender is mySelf Igno!"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
