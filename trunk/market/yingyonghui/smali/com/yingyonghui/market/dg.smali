.class final Lcom/yingyonghui/market/dg;
.super Landroid/content/BroadcastReceiver;
.source "ActivityDetailApp.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityDetailApp;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityDetailApp;)V
    .locals 0
    .parameter

    .prologue
    .line 285
    iput-object p1, p0, Lcom/yingyonghui/market/dg;->a:Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 288
    iget-object v0, p0, Lcom/yingyonghui/market/dg;->a:Lcom/yingyonghui/market/ActivityDetailApp;

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    if-nez v0, :cond_1

    .line 316
    :cond_0
    :goto_0
    return-void

    .line 294
    :cond_1
    :try_start_0
    const-string v0, "app_instaled_refreshview"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 297
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "pkgName"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 299
    iget-object v1, p0, Lcom/yingyonghui/market/dg;->a:Lcom/yingyonghui/market/ActivityDetailApp;

    iget-object v1, v1, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/yingyonghui/market/dg;->a:Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityDetailApp;->e(Lcom/yingyonghui/market/ActivityDetailApp;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/yingyonghui/market/dg;->a:Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityDetailApp;->e(Lcom/yingyonghui/market/ActivityDetailApp;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 301
    iget-object v0, p0, Lcom/yingyonghui/market/dg;->a:Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityDetailApp;->f(Lcom/yingyonghui/market/ActivityDetailApp;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 313
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0

    .line 303
    :cond_2
    :try_start_1
    const-string v0, "app_uninstaled_refreshview"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 306
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "pkgName"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 308
    iget-object v1, p0, Lcom/yingyonghui/market/dg;->a:Lcom/yingyonghui/market/ActivityDetailApp;

    iget-object v1, v1, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/yingyonghui/market/dg;->a:Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityDetailApp;->e(Lcom/yingyonghui/market/ActivityDetailApp;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/yingyonghui/market/dg;->a:Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityDetailApp;->e(Lcom/yingyonghui/market/ActivityDetailApp;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 310
    iget-object v0, p0, Lcom/yingyonghui/market/dg;->a:Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityDetailApp;->f(Lcom/yingyonghui/market/ActivityDetailApp;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
