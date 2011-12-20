.class final Lcom/yingyonghui/market/dy;
.super Landroid/content/BroadcastReceiver;
.source "ActivityListAppBackup.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityListAppBackup;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityListAppBackup;)V
    .locals 0
    .parameter

    .prologue
    .line 324
    iput-object p1, p0, Lcom/yingyonghui/market/dy;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 327
    iget-object v0, p0, Lcom/yingyonghui/market/dy;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->j(Lcom/yingyonghui/market/ActivityListAppBackup;)Z

    .line 328
    iget-object v0, p0, Lcom/yingyonghui/market/dy;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->d()V

    .line 329
    return-void
.end method
