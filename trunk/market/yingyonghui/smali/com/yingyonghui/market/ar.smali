.class final Lcom/yingyonghui/market/ar;
.super Ljava/lang/Thread;
.source "ActivityListAppDownload.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityListAppDownload;


# direct methods
.method synthetic constructor <init>(Lcom/yingyonghui/market/ActivityListAppDownload;)V
    .locals 1
    .parameter

    .prologue
    .line 429
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/yingyonghui/market/ar;-><init>(Lcom/yingyonghui/market/ActivityListAppDownload;B)V

    return-void
.end method

.method private constructor <init>(Lcom/yingyonghui/market/ActivityListAppDownload;B)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 429
    iput-object p1, p0, Lcom/yingyonghui/market/ar;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .prologue
    .line 432
    iget-object v0, p0, Lcom/yingyonghui/market/ar;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    iget-object v1, p0, Lcom/yingyonghui/market/ar;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->i(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Lcom/yingyonghui/market/ActivityListAppDownload;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 433
    iget-object v0, p0, Lcom/yingyonghui/market/ar;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->j(Lcom/yingyonghui/market/ActivityListAppDownload;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 434
    return-void
.end method
