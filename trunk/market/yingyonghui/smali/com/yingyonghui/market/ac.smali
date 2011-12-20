.class final Lcom/yingyonghui/market/ac;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/yingyonghui/market/bs;


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityMain;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityMain;)V
    .locals 0
    .parameter

    .prologue
    .line 161
    iput-object p1, p0, Lcom/yingyonghui/market/ac;->a:Lcom/yingyonghui/market/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    .prologue
    .line 165
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 166
    const-string v1, "android.settings.APPLICATION_SETTINGS"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 167
    iget-object v1, p0, Lcom/yingyonghui/market/ac;->a:Lcom/yingyonghui/market/ActivityMain;

    invoke-virtual {v1, v0}, Lcom/yingyonghui/market/ActivityMain;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 172
    :goto_0
    return-void

    .line 170
    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/yingyonghui/market/ac;->a:Lcom/yingyonghui/market/ActivityMain;

    const-string v1, "check_market_not_allow_install"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/k;->a(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0
.end method
