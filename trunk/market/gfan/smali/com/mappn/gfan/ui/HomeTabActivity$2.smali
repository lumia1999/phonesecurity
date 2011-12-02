.class Lcom/mappn/gfan/ui/HomeTabActivity$2;
.super Landroid/content/BroadcastReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/HomeTabActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/HomeTabActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/HomeTabActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$2;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity$2;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->detectProxy(Landroid/content/Context;)Lorg/apache/http/HttpHost;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/mappn/gfan/common/HttpClientFactory;->get()Lcom/mappn/gfan/common/HttpClientFactory;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/common/HttpClientFactory;->getHttpClient()Lcom/mappn/gfan/common/AndroidHttpClient;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/AndroidHttpClient;->useProxyConnection(Lorg/apache/http/HttpHost;)V

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Lcom/mappn/gfan/common/HttpClientFactory;->get()Lcom/mappn/gfan/common/HttpClientFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/common/HttpClientFactory;->getHttpClient()Lcom/mappn/gfan/common/AndroidHttpClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/common/AndroidHttpClient;->useDefaultConnection()V

    goto :goto_0
.end method
