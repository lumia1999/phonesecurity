.class final Lcom/yingyonghui/market/dj;
.super Landroid/content/BroadcastReceiver;
.source "ActivityListAppRecommend.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityListAppRecommend;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityListAppRecommend;)V
    .locals 0
    .parameter

    .prologue
    .line 199
    iput-object p1, p0, Lcom/yingyonghui/market/dj;->a:Lcom/yingyonghui/market/ActivityListAppRecommend;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 202
    iget-object v0, p0, Lcom/yingyonghui/market/dj;->a:Lcom/yingyonghui/market/ActivityListAppRecommend;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppRecommend;->a(Lcom/yingyonghui/market/ActivityListAppRecommend;)Lcom/yingyonghui/market/h;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 203
    iget-object v0, p0, Lcom/yingyonghui/market/dj;->a:Lcom/yingyonghui/market/ActivityListAppRecommend;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppRecommend;->a(Lcom/yingyonghui/market/ActivityListAppRecommend;)Lcom/yingyonghui/market/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/h;->notifyDataSetChanged()V

    .line 205
    :cond_0
    return-void
.end method
