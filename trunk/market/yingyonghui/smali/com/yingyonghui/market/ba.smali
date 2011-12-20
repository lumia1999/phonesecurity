.class final Lcom/yingyonghui/market/ba;
.super Ljava/lang/Object;
.source "ActivityListAppDownload.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/yingyonghui/market/ActivityListAppDownload;


# direct methods
.method synthetic constructor <init>(Lcom/yingyonghui/market/ActivityListAppDownload;)V
    .locals 1
    .parameter

    .prologue
    .line 578
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/yingyonghui/market/ba;-><init>(Lcom/yingyonghui/market/ActivityListAppDownload;B)V

    return-void
.end method

.method private constructor <init>(Lcom/yingyonghui/market/ActivityListAppDownload;B)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 578
    iput-object p1, p0, Lcom/yingyonghui/market/ba;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6
    .parameter

    .prologue
    const/16 v4, 0xc0

    .line 581
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 582
    iget-object v2, p0, Lcom/yingyonghui/market/ba;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListAppDownload;->f(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/bm;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/yingyonghui/market/ba;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListAppDownload;->f(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/bm;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yingyonghui/market/bm;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 583
    iget-object v2, p0, Lcom/yingyonghui/market/ba;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListAppDownload;->f(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/bm;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/yingyonghui/market/bm;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yingyonghui/market/model/l;

    .line 584
    monitor-enter p1

    .line 585
    :try_start_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 633
    :goto_0
    monitor-exit p1

    .line 635
    :cond_0
    return-void

    .line 587
    :pswitch_0
    iget v3, v2, Lcom/yingyonghui/market/model/l;->L:I

    if-ne v3, v4, :cond_1

    .line 588
    new-instance v3, Lcom/yingyonghui/market/af;

    invoke-direct {v3, p0, p1, v2}, Lcom/yingyonghui/market/af;-><init>(Lcom/yingyonghui/market/ba;Landroid/view/View;Lcom/yingyonghui/market/model/l;)V

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Void;

    invoke-virtual {v3, v4}, Lcom/yingyonghui/market/af;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 596
    move-object v0, p1

    check-cast v0, Landroid/widget/TextView;

    move-object v3, v0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f090134

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 597
    const/16 v3, 0xc1

    iput v3, v2, Lcom/yingyonghui/market/model/l;->L:I

    .line 599
    iget-object v3, p0, Lcom/yingyonghui/market/ba;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-virtual {v3}, Lcom/yingyonghui/market/ActivityListAppDownload;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "managePause"

    iget-object v5, p0, Lcom/yingyonghui/market/ba;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-virtual {v5}, Lcom/yingyonghui/market/ActivityListAppDownload;->i()Lcom/yingyonghui/market/log/m;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, v2, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v3, v4, v5, v1, v2}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Ljava/lang/String;Lcom/yingyonghui/market/log/m;ILjava/lang/String;)V

    .line 619
    :goto_1
    iget-object v1, p0, Lcom/yingyonghui/market/ba;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->j(Lcom/yingyonghui/market/ActivityListAppDownload;)Landroid/os/Handler;

    move-result-object v1

    const/16 v2, 0x66

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_0

    .line 633
    :catchall_0
    move-exception v1

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 601
    :cond_1
    :try_start_1
    new-instance v3, Lcom/yingyonghui/market/ad;

    invoke-direct {v3, p0, p1, v2}, Lcom/yingyonghui/market/ad;-><init>(Lcom/yingyonghui/market/ba;Landroid/view/View;Lcom/yingyonghui/market/model/l;)V

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Void;

    invoke-virtual {v3, v4}, Lcom/yingyonghui/market/ad;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 614
    move-object v0, p1

    check-cast v0, Landroid/widget/TextView;

    move-object v3, v0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f090133

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 615
    const/16 v3, 0xc0

    iput v3, v2, Lcom/yingyonghui/market/model/l;->L:I

    .line 617
    iget-object v3, p0, Lcom/yingyonghui/market/ba;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-virtual {v3}, Lcom/yingyonghui/market/ActivityListAppDownload;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "manageResume"

    iget-object v5, p0, Lcom/yingyonghui/market/ba;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-virtual {v5}, Lcom/yingyonghui/market/ActivityListAppDownload;->i()Lcom/yingyonghui/market/log/m;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, v2, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v3, v4, v5, v1, v2}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Ljava/lang/String;Lcom/yingyonghui/market/log/m;ILjava/lang/String;)V

    goto :goto_1

    .line 622
    :pswitch_1
    new-instance v3, Lcom/yingyonghui/market/ae;

    invoke-direct {v3, p0, p1, v2}, Lcom/yingyonghui/market/ae;-><init>(Lcom/yingyonghui/market/ba;Landroid/view/View;Lcom/yingyonghui/market/model/l;)V

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Void;

    invoke-virtual {v3, v4}, Lcom/yingyonghui/market/ae;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 630
    iget-object v3, p0, Lcom/yingyonghui/market/ba;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-virtual {v3}, Lcom/yingyonghui/market/ActivityListAppDownload;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "manageCancel"

    iget-object v5, p0, Lcom/yingyonghui/market/ba;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-virtual {v5}, Lcom/yingyonghui/market/ActivityListAppDownload;->i()Lcom/yingyonghui/market/log/m;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, v2, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v3, v4, v5, v1, v2}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Ljava/lang/String;Lcom/yingyonghui/market/log/m;ILjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 585
    :pswitch_data_0
    .packed-switch 0x7f0b00b6
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
