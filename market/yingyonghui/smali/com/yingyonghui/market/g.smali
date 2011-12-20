.class final Lcom/yingyonghui/market/g;
.super Landroid/os/Handler;
.source "ActivityListAppDownload.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityListAppDownload;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityListAppDownload;)V
    .locals 0
    .parameter

    .prologue
    .line 78
    iput-object p1, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 8
    .parameter

    .prologue
    const/16 v7, 0x8

    const/4 v6, 0x1

    const/4 v5, 0x2

    const/4 v4, 0x0

    .line 80
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 135
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 82
    :pswitch_1
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    iget-object v1, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v0, v5, v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Lcom/yingyonghui/market/ActivityListAppDownload;II)V

    .line 84
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    new-instance v1, Lcom/yingyonghui/market/ch;

    iget-object v2, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    iget-object v3, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v3}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/yingyonghui/market/ch;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Lcom/yingyonghui/market/ActivityListAppDownload;Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/ch;

    .line 86
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 87
    iget-object v1, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;

    move-result-object v1

    monitor-enter v1

    .line 88
    :try_start_0
    iget-object v2, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-static {v0, v2}, Ljava/util/Collections;->copy(Ljava/util/List;Ljava/util/List;)V

    .line 89
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    new-instance v1, Lcom/yingyonghui/market/cw;

    iget-object v2, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    iget-object v3, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v3}, Lcom/yingyonghui/market/ActivityListAppDownload;->b(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/ch;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/yingyonghui/market/cw;-><init>(Lcom/yingyonghui/market/AbsActivityAppListManager;Lcom/yingyonghui/market/ch;)V

    new-array v2, v6, [Ljava/util/ArrayList;

    aput-object v0, v2, v4

    invoke-virtual {v1, v2}, Lcom/yingyonghui/market/cw;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 92
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppDownload;->p:I

    if-ne v0, v5, :cond_0

    .line 93
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-virtual {v0, v4}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Z)V

    .line 95
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->b(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/yingyonghui/market/ch;->setNotifyOnChange(Z)V

    .line 96
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppDownload;->e:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->b(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/ch;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 97
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppDownload;->e:Landroid/widget/ListView;

    sget v1, Lcom/yingyonghui/market/ActivityListAppDownload;->d:I

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 98
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->b(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    .line 99
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->b(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->getCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 100
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->c(Lcom/yingyonghui/market/ActivityListAppDownload;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_0

    .line 89
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 102
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->c(Lcom/yingyonghui/market/ActivityListAppDownload;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_0

    .line 107
    :pswitch_2
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppDownload;->p:I

    if-ne v0, v6, :cond_0

    .line 108
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->d(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;

    move-result-object v0

    .line 109
    if-eqz v0, :cond_0

    .line 110
    iget-object v1, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->e(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 111
    iget-object v1, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->e(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 112
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->f(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/bm;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/bm;->notifyDataSetChanged()V

    .line 113
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    iget-object v1, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->e(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v0, v6, v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Lcom/yingyonghui/market/ActivityListAppDownload;II)V

    goto/16 :goto_0

    .line 118
    :pswitch_3
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppDownload;->p:I

    if-ne v0, v5, :cond_0

    .line 119
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 120
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->b(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/ch;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 121
    iget-object v2, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-le v2, v1, :cond_0

    .line 122
    iget-object v2, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 123
    iget-object v1, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->b(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/ch;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/yingyonghui/market/ch;->remove(Ljava/lang/Object;)V

    .line 124
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->b(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    .line 125
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    iget-object v1, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->b(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/ch;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yingyonghui/market/ch;->getCount()I

    move-result v1

    invoke-static {v0, v5, v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Lcom/yingyonghui/market/ActivityListAppDownload;II)V

    .line 126
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->b(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->getCount()I

    move-result v0

    if-lez v0, :cond_2

    .line 127
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->c(Lcom/yingyonghui/market/ActivityListAppDownload;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_0

    .line 129
    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/g;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->c(Lcom/yingyonghui/market/ActivityListAppDownload;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_0

    .line 80
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
