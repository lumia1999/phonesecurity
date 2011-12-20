.class final Lcom/yingyonghui/market/downloader/l;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "DownloadProvider.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/downloader/DownloadProvider;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/downloader/DownloadProvider;Landroid/content/Context;)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 98
    iput-object p1, p0, Lcom/yingyonghui/market/downloader/l;->a:Lcom/yingyonghui/market/downloader/DownloadProvider;

    .line 99
    const-string v0, "downloads.db"

    const/4 v1, 0x0

    const/16 v2, 0x64

    invoke-direct {p0, p2, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 100
    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .parameter

    .prologue
    .line 110
    invoke-static {p1}, Lcom/yingyonghui/market/downloader/DownloadProvider;->a(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 111
    return-void
.end method

.method public final onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    const/16 v1, 0x64

    .line 132
    const/16 v0, 0x1f

    if-ne p2, v0, :cond_1

    .line 133
    if-ne p3, v1, :cond_0

    .line 144
    :goto_0
    return-void

    :cond_0
    move v0, v1

    .line 140
    :goto_1
    const-string v1, "DownloadManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Upgrading downloads database from version "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " to "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", which will destroy all old data"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    invoke-static {p1}, Lcom/yingyonghui/market/downloader/DownloadProvider;->b(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 143
    invoke-static {p1}, Lcom/yingyonghui/market/downloader/DownloadProvider;->a(Landroid/database/sqlite/SQLiteDatabase;)V

    goto :goto_0

    :cond_1
    move v0, p2

    goto :goto_1
.end method
