.class Lcom/gfan/sdk/statistics/Collector$5;
.super Ljava/lang/Object;
.source "Collector.java"

# interfaces
.implements Lcom/gfan/sdk/statistics/Collector$IResponse;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gfan/sdk/statistics/Collector;->sendCpInfo(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 785
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onFailed(Ljava/lang/Exception;)V
    .locals 2
    .parameter "e"

    .prologue
    .line 794
    const-string v0, "SDK"

    const-string v1, "sendCpInfo failed"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 795
    return-void
.end method

.method public onSuccess(Lorg/apache/http/HttpResponse;)V
    .locals 0
    .parameter "response"

    .prologue
    .line 790
    return-void
.end method
