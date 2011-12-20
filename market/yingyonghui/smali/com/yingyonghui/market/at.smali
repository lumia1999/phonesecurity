.class final Lcom/yingyonghui/market/at;
.super Landroid/content/BroadcastReceiver;
.source "ActivityListNews.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityListNews;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityListNews;)V
    .locals 0
    .parameter

    .prologue
    .line 92
    iput-object p1, p0, Lcom/yingyonghui/market/at;->a:Lcom/yingyonghui/market/ActivityListNews;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 95
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "request_more_news_list"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/yingyonghui/market/at;->a:Lcom/yingyonghui/market/ActivityListNews;

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListNews;->a:Lcom/yingyonghui/market/a/d;

    invoke-static {}, Lcom/yingyonghui/market/ActivityListNews;->a()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget-object v2, p0, Lcom/yingyonghui/market/at;->a:Lcom/yingyonghui/market/ActivityListNews;

    iget-object v2, v2, Lcom/yingyonghui/market/ActivityListNews;->b:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/a/d;->b(ILandroid/os/Handler;)V

    .line 98
    :cond_0
    return-void
.end method
