.class public Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver;
.super Landroid/content/BroadcastReceiver;

# interfaces
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(II)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "market error when check upgrade info "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver;->mContext:Landroid/content/Context;

    invoke-static {p1, p0}, Lcom/mappn/gfan/common/MarketAPI;->checkNewSplash(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 5

    check-cast p2, Lcom/mappn/gfan/common/vo/SplashInfo;

    iget-object v0, p0, Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    if-eqz p2, :cond_1

    iget-object v1, p2, Lcom/mappn/gfan/common/vo/SplashInfo;->url:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "splash.png"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_0
    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getDownloadManager()Lcom/mappn/gfan/common/download/DownloadManager;

    move-result-object v1

    new-instance v2, Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v3, p2, Lcom/mappn/gfan/common/vo/SplashInfo;->url:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/mappn/gfan/common/download/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    const-string v3, "image/*"

    invoke-virtual {v2, v3}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setMimeType(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setDestination(I)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setShowRunningNotification(Z)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    const-string v3, "splash.png"

    invoke-virtual {v2, v3}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setTitle(Ljava/lang/CharSequence;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v3, p0, Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver;->mContext:Landroid/content/Context;

    new-instance v4, Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver$1;

    invoke-direct {v4, p0, v0, p2}, Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver$1;-><init>(Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver;Lcom/mappn/gfan/Session;Lcom/mappn/gfan/common/vo/SplashInfo;)V

    invoke-virtual {v1, v3, v2, v4}, Lcom/mappn/gfan/common/download/DownloadManager;->enqueue(Landroid/content/Context;Lcom/mappn/gfan/common/download/DownloadManager$Request;Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;)V

    :cond_1
    return-void
.end method
