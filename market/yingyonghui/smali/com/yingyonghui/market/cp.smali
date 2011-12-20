.class final Lcom/yingyonghui/market/cp;
.super Landroid/os/Handler;
.source "ActivityListApp.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityListApp;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityListApp;)V
    .locals 0
    .parameter

    .prologue
    .line 687
    iput-object p1, p0, Lcom/yingyonghui/market/cp;->a:Lcom/yingyonghui/market/ActivityListApp;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 5
    .parameter

    .prologue
    const-wide/16 v3, 0x12c

    const/16 v2, 0x78

    const/16 v1, 0x64

    .line 690
    iget v0, p1, Landroid/os/Message;->what:I

    sparse-switch v0, :sswitch_data_0

    .line 718
    :cond_0
    :goto_0
    return-void

    .line 696
    :sswitch_0
    iget-object v0, p0, Lcom/yingyonghui/market/cp;->a:Lcom/yingyonghui/market/ActivityListApp;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListApp;->e(Lcom/yingyonghui/market/ActivityListApp;)Lcom/yingyonghui/market/bc;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 697
    iget-object v0, p0, Lcom/yingyonghui/market/cp;->a:Lcom/yingyonghui/market/ActivityListApp;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListApp;->n(Lcom/yingyonghui/market/ActivityListApp;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 698
    iget-object v0, p0, Lcom/yingyonghui/market/cp;->a:Lcom/yingyonghui/market/ActivityListApp;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListApp;->e(Lcom/yingyonghui/market/ActivityListApp;)Lcom/yingyonghui/market/bc;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/bc;->notifyDataSetChanged()V

    goto :goto_0

    .line 700
    :cond_1
    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/cp;->removeMessages(I)V

    .line 701
    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/cp;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0, v3, v4}, Lcom/yingyonghui/market/cp;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0

    .line 706
    :sswitch_1
    iget-object v0, p0, Lcom/yingyonghui/market/cp;->a:Lcom/yingyonghui/market/ActivityListApp;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListApp;->n(Lcom/yingyonghui/market/ActivityListApp;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 707
    iget-object v0, p0, Lcom/yingyonghui/market/cp;->a:Lcom/yingyonghui/market/ActivityListApp;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListApp;->l(Lcom/yingyonghui/market/ActivityListApp;)Ljava/util/ArrayList;

    move-result-object v0

    monitor-enter v0

    .line 708
    :try_start_0
    iget-object v1, p0, Lcom/yingyonghui/market/cp;->a:Lcom/yingyonghui/market/ActivityListApp;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListApp;->l(Lcom/yingyonghui/market/ActivityListApp;)Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 709
    iget-object v1, p0, Lcom/yingyonghui/market/cp;->a:Lcom/yingyonghui/market/ActivityListApp;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListApp;->l(Lcom/yingyonghui/market/ActivityListApp;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 711
    :cond_2
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 713
    :cond_3
    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/cp;->removeMessages(I)V

    .line 714
    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/cp;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0, v3, v4}, Lcom/yingyonghui/market/cp;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0

    .line 690
    nop

    :sswitch_data_0
    .sparse-switch
        0x64 -> :sswitch_0
        0x78 -> :sswitch_1
    .end sparse-switch
.end method
