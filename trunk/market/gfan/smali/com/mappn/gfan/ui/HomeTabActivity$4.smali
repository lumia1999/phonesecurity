.class Lcom/mappn/gfan/ui/HomeTabActivity$4;
.super Landroid/content/BroadcastReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/HomeTabActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/HomeTabActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/HomeTabActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$4;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    const/4 v3, 0x3

    const/4 v2, 0x1

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.mappn.gfan.broadcast.FORCE_EXIT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity$4;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->access$100(Lcom/mappn/gfan/ui/HomeTabActivity;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string v1, "com.mappn.gfan.broadcast.REMIND_LATTER"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "com.mappn.gfan.broadcast.DOWNLOAD_OPT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$4;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/HomeTabActivity;->access$200(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getUpdateUri()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$4;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/HomeTabActivity;->access$300(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setPackageName(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$4;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/HomeTabActivity;->access$400(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getAppName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setTitle(Ljava/lang/CharSequence;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setShowRunningNotification(Z)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setSourceType(I)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    const-string v1, "application/vnd.android.package-archive"

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setMimeType(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$4;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/HomeTabActivity;->access$600(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getDownloadManager()Lcom/mappn/gfan/common/download/DownloadManager;

    move-result-object v1

    new-instance v2, Lcom/mappn/gfan/ui/HomeTabActivity$4$1;

    invoke-direct {v2, p0}, Lcom/mappn/gfan/ui/HomeTabActivity$4$1;-><init>(Lcom/mappn/gfan/ui/HomeTabActivity$4;)V

    invoke-virtual {v1, p1, v0, v2}, Lcom/mappn/gfan/common/download/DownloadManager;->enqueue(Landroid/content/Context;Lcom/mappn/gfan/common/download/DownloadManager$Request;Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;)V

    goto :goto_0

    :cond_2
    const-string v1, "com.mappn.gfan.broadcast.DOWNLOAD"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$4;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/HomeTabActivity;->access$700(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getUpdateUri()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$4;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/HomeTabActivity;->access$800(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setPackageName(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$4;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/HomeTabActivity;->access$900(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getAppName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setTitle(Ljava/lang/CharSequence;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setShowRunningNotification(Z)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setSourceType(I)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    const-string v1, "application/vnd.android.package-archive"

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setMimeType(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$4;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/HomeTabActivity;->access$1100(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getDownloadManager()Lcom/mappn/gfan/common/download/DownloadManager;

    move-result-object v1

    new-instance v2, Lcom/mappn/gfan/ui/HomeTabActivity$4$2;

    invoke-direct {v2, p0}, Lcom/mappn/gfan/ui/HomeTabActivity$4$2;-><init>(Lcom/mappn/gfan/ui/HomeTabActivity$4;)V

    invoke-virtual {v1, p1, v0, v2}, Lcom/mappn/gfan/common/download/DownloadManager;->enqueue(Landroid/content/Context;Lcom/mappn/gfan/common/download/DownloadManager$Request;Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity$4;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->finish()V

    goto/16 :goto_0
.end method
