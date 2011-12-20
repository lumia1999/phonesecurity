.class final Lcom/yingyonghui/market/downloader/m;
.super Ljava/lang/Object;
.source "DownloadNotification.java"


# instance fields
.field a:I

.field b:I

.field c:I

.field d:I

.field e:Ljava/lang/String;

.field f:Ljava/lang/String;

.field g:Ljava/lang/String;

.field h:[Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput v0, p0, Lcom/yingyonghui/market/downloader/m;->b:I

    .line 55
    iput v0, p0, Lcom/yingyonghui/market/downloader/m;->c:I

    .line 56
    iput v0, p0, Lcom/yingyonghui/market/downloader/m;->d:I

    .line 60
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/yingyonghui/market/downloader/m;->h:[Ljava/lang/String;

    return-void
.end method
