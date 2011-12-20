.class final Lcom/yingyonghui/market/bl;
.super Ljava/lang/Thread;
.source "ActivityListAppManage.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityListAppManage;


# direct methods
.method synthetic constructor <init>(Lcom/yingyonghui/market/ActivityListAppManage;)V
    .locals 1
    .parameter

    .prologue
    .line 659
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/yingyonghui/market/bl;-><init>(Lcom/yingyonghui/market/ActivityListAppManage;B)V

    return-void
.end method

.method private constructor <init>(Lcom/yingyonghui/market/ActivityListAppManage;B)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 659
    iput-object p1, p0, Lcom/yingyonghui/market/bl;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .prologue
    .line 662
    iget-object v0, p0, Lcom/yingyonghui/market/bl;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget-object v1, p0, Lcom/yingyonghui/market/bl;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v1}, Lcom/yingyonghui/market/util/GlobalUtil;->b(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppManage;->c(Lcom/yingyonghui/market/ActivityListAppManage;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 663
    iget-object v0, p0, Lcom/yingyonghui/market/bl;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->o(Lcom/yingyonghui/market/ActivityListAppManage;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x1f4

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 664
    return-void
.end method
