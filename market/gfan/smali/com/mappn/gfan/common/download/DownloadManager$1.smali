.class Lcom/mappn/gfan/common/download/DownloadManager$1;
.super Landroid/content/AsyncQueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/download/DownloadManager;->enqueue(Landroid/content/Context;Lcom/mappn/gfan/common/download/DownloadManager$Request;Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/download/DownloadManager;

.field final synthetic val$listener:Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/common/download/DownloadManager;Landroid/content/ContentResolver;Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadManager$1;->this$0:Lcom/mappn/gfan/common/download/DownloadManager;

    iput-object p3, p0, Lcom/mappn/gfan/common/download/DownloadManager$1;->val$listener:Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;

    invoke-direct {p0, p2}, Landroid/content/AsyncQueryHandler;-><init>(Landroid/content/ContentResolver;)V

    return-void
.end method


# virtual methods
.method protected onInsertComplete(ILjava/lang/Object;Landroid/net/Uri;)V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadManager$1;->val$listener:Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;

    if-eqz v0, :cond_0

    if-nez p3, :cond_1

    const-wide/16 v0, -0x1

    :goto_0
    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadManager$1;->val$listener:Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;

    invoke-interface {v2, v0, v1}, Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;->onFinish(J)V

    :cond_0
    return-void

    :cond_1
    invoke-virtual {p3}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    goto :goto_0
.end method
