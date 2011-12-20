.class final Lcom/yingyonghui/market/u;
.super Ljava/lang/Thread;
.source "ActivityListAppBackup.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityListAppBackup;


# direct methods
.method synthetic constructor <init>(Lcom/yingyonghui/market/ActivityListAppBackup;)V
    .locals 1
    .parameter

    .prologue
    .line 332
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/yingyonghui/market/u;-><init>(Lcom/yingyonghui/market/ActivityListAppBackup;B)V

    return-void
.end method

.method private constructor <init>(Lcom/yingyonghui/market/ActivityListAppBackup;B)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 332
    iput-object p1, p0, Lcom/yingyonghui/market/u;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .prologue
    .line 335
    iget-object v0, p0, Lcom/yingyonghui/market/u;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v1, p0, Lcom/yingyonghui/market/u;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->k(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 336
    iget-object v0, p0, Lcom/yingyonghui/market/u;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->l(Lcom/yingyonghui/market/ActivityListAppBackup;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 337
    return-void
.end method
