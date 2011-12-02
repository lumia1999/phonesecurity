.class Lcom/mappn/gfan/ui/DownloadManagerAdapter$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/DownloadManagerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$2;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$2;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-static {v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$100(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->getValue(I)Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    move-result-object v1

    iget v0, v1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mWeight:I

    const/4 v2, 0x4

    if-ne v0, v2, :cond_2

    iget-object v0, v1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mFilePath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/File;

    iget-object v2, v1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mFilePath:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$2;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-static {v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$600(Lcom/mappn/gfan/ui/DownloadManagerAdapter;Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$2;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-static {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$700(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$2;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-static {v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$700(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f090075

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v5}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    :cond_2
    iget v0, v1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mWeight:I

    if-eq v0, v4, :cond_3

    iget v0, v1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mWeight:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    :cond_3
    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$2;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-static {v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$800(Lcom/mappn/gfan/ui/DownloadManagerAdapter;Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)V

    iget-object v2, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$2;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    monitor-enter v2

    :try_start_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$2;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-static {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$900(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)Ljava/util/HashMap;

    move-result-object v0

    iget-object v3, v1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mKey:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/DownloadInfo;

    const/16 v3, 0x1ea

    iput v3, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$2;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-static {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$1000(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)Lcom/mappn/gfan/common/download/DownloadManager;

    move-result-object v0

    new-array v2, v4, [J

    iget-wide v3, v1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mId:J

    aput-wide v3, v2, v5

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/download/DownloadManager;->cancelDownload([J)V

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
