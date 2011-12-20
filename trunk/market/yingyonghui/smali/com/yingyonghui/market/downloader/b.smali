.class final Lcom/yingyonghui/market/downloader/b;
.super Landroid/database/ContentObserver;
.source "DownloadService.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/downloader/DownloadService;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/downloader/DownloadService;)V
    .locals 1
    .parameter

    .prologue
    .line 92
    iput-object p1, p0, Lcom/yingyonghui/market/downloader/b;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    .line 93
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 94
    return-void
.end method


# virtual methods
.method public final onChange(Z)V
    .locals 1
    .parameter

    .prologue
    .line 104
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/b;->a:Lcom/yingyonghui/market/downloader/DownloadService;

    invoke-static {v0}, Lcom/yingyonghui/market/downloader/DownloadService;->a(Lcom/yingyonghui/market/downloader/DownloadService;)V

    .line 105
    return-void
.end method
