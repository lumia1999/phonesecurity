.class final Lcom/yingyonghui/market/ea;
.super Ljava/lang/Object;
.source "AdapterListApp.java"

# interfaces
.implements Lcom/yingyonghui/market/bs;


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/bj;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/bj;)V
    .locals 0
    .parameter

    .prologue
    .line 464
    iput-object p1, p0, Lcom/yingyonghui/market/ea;->a:Lcom/yingyonghui/market/bj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .prologue
    .line 466
    iget-object v0, p0, Lcom/yingyonghui/market/ea;->a:Lcom/yingyonghui/market/bj;

    iget-object v0, v0, Lcom/yingyonghui/market/bj;->b:Lcom/yingyonghui/market/bc;

    iget-object v1, p0, Lcom/yingyonghui/market/ea;->a:Lcom/yingyonghui/market/bj;

    iget-object v1, v1, Lcom/yingyonghui/market/bj;->a:Lcom/yingyonghui/market/model/l;

    iput-object v1, v0, Lcom/yingyonghui/market/bc;->a:Lcom/yingyonghui/market/model/l;

    .line 467
    iget-object v0, p0, Lcom/yingyonghui/market/ea;->a:Lcom/yingyonghui/market/bj;

    iget-object v0, v0, Lcom/yingyonghui/market/bj;->b:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->getParent()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ea;->a:Lcom/yingyonghui/market/bj;

    iget-object v1, v1, Lcom/yingyonghui/market/bj;->b:Lcom/yingyonghui/market/bc;

    iget-object v1, v1, Lcom/yingyonghui/market/bc;->a:Lcom/yingyonghui/market/model/l;

    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/yingyonghui/market/util/GlobalUtil;->d(Landroid/content/Context;Ljava/lang/String;)V

    .line 468
    return-void
.end method
