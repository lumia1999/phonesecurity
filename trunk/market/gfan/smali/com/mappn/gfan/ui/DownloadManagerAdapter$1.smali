.class Lcom/mappn/gfan/ui/DownloadManagerAdapter$1;
.super Landroid/os/Handler;


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

    iput-object p1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$1;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$1;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-static {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$000(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)Lcom/mappn/gfan/ui/DownloadManagerActivity;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->refreshNoFiles(Z)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$1;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-static {v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$000(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)Lcom/mappn/gfan/ui/DownloadManagerActivity;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->refreshNoFiles(Z)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    iget-object v2, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$1;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-static {v2}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$100(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    move-result-object v2

    iget-object v3, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mPackageName:Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->put(Ljava/lang/String;Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$1;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->notifyDataSetChanged()V

    goto :goto_0

    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$1;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-static {v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$100(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    move-result-object v1

    iget-object v0, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mPackageName:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->remove(Ljava/lang/String;)Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$1;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->notifyDataSetChanged()V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
