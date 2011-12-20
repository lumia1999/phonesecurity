.class final Lcom/yingyonghui/market/em;
.super Ljava/lang/Object;
.source "AdapterListApp.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/bc;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/bc;)V
    .locals 0
    .parameter

    .prologue
    .line 362
    iput-object p1, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6
    .parameter

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 365
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 366
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    .line 419
    :cond_0
    :goto_0
    return-void

    .line 369
    :cond_1
    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 370
    aget-object v1, v0, v5

    invoke-static {v1}, Lcom/yingyonghui/market/util/l;->a(Ljava/lang/String;)I

    move-result v3

    .line 371
    aget-object v1, v0, v4

    .line 373
    iget-object v2, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-virtual {v0, v3}, Lcom/yingyonghui/market/bc;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/l;

    invoke-static {v2, v0}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;Lcom/yingyonghui/market/model/l;)Lcom/yingyonghui/market/model/l;

    .line 375
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v0

    iget-boolean v0, v0, Lcom/yingyonghui/market/model/l;->w:Z

    if-nez v0, :cond_0

    .line 379
    const-string v0, "down"

    invoke-static {v1, v0}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 380
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v0

    iput v5, v0, Lcom/yingyonghui/market/model/l;->n:I

    .line 381
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    iget-object v1, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v1}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/model/l;)V

    .line 382
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v1}, Lcom/yingyonghui/market/bc;->c(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/log/m;

    move-result-object v1

    const-string v2, ""

    iget-object v4, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v4}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v4

    iget v4, v4, Lcom/yingyonghui/market/model/l;->e:I

    const-string v5, "download"

    invoke-static/range {v0 .. v5}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/lang/String;)V

    .line 418
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-virtual {v0}, Lcom/yingyonghui/market/bc;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "BuyButton"

    const-string v2, "Free_Confirm"

    invoke-static {v0, v1, v2}, Lcom/a/a/c;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 383
    :cond_3
    const-string v0, "update"

    invoke-static {v1, v0}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 384
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v0

    const/4 v1, 0x2

    iput v1, v0, Lcom/yingyonghui/market/model/l;->n:I

    .line 385
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;

    if-eqz v0, :cond_5

    .line 386
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v0

    iput-boolean v4, v0, Lcom/yingyonghui/market/model/l;->N:Z

    .line 390
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 391
    new-instance v0, Lcom/yingyonghui/market/bj;

    iget-object v1, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/bj;-><init>(Lcom/yingyonghui/market/bc;)V

    new-array v1, v4, [Lcom/yingyonghui/market/model/l;

    iget-object v2, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v2}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/bj;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 396
    :cond_4
    :goto_2
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v1}, Lcom/yingyonghui/market/bc;->c(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/log/m;

    move-result-object v1

    const-string v2, ""

    iget-object v4, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v4}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v4

    iget v4, v4, Lcom/yingyonghui/market/model/l;->e:I

    const-string v5, "update"

    invoke-static/range {v0 .. v5}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/lang/String;)V

    goto :goto_1

    .line 394
    :cond_5
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    iget-object v1, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v1}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/model/l;)V

    goto :goto_2

    .line 397
    :cond_6
    const-string v0, "install"

    invoke-static {v1, v0}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 398
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v1}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v1

    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/yingyonghui/market/util/GlobalUtil;->c(Landroid/content/Context;Ljava/lang/String;)V

    .line 399
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->d(Lcom/yingyonghui/market/bc;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x64

    const-wide/16 v2, 0x4b0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_1

    .line 400
    :cond_7
    const-string v0, "transfer"

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 401
    const-string v0, "transfer_sd"

    invoke-static {v1, v0}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 402
    invoke-static {}, Lcom/yingyonghui/market/util/GlobalUtil;->a()Z

    move-result v0

    if-nez v0, :cond_8

    .line 403
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f09012c

    invoke-static {v0, v1}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 408
    :cond_8
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/ActivityListAppManage;

    iput-boolean v4, v0, Lcom/yingyonghui/market/ActivityListAppManage;->c:Z

    .line 409
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v1}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v1

    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/yingyonghui/market/util/GlobalUtil;->e(Landroid/content/Context;Ljava/lang/String;)V

    .line 410
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    const-string v1, "manageTransfer"

    iget-object v2, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v2}, Lcom/yingyonghui/market/bc;->c(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/log/m;

    move-result-object v2

    iget-object v4, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v4}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v4

    iget-object v4, v4, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Ljava/lang/String;Lcom/yingyonghui/market/log/m;ILjava/lang/String;)V

    goto/16 :goto_1

    .line 411
    :cond_9
    const-string v0, "ignore"

    invoke-static {v1, v0}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 412
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    iget-object v1, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v1}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v1

    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v0, v1, v4}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;Ljava/lang/String;Z)V

    .line 413
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    const-string v1, "manageIgnoreUpdate"

    iget-object v2, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v2}, Lcom/yingyonghui/market/bc;->c(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/log/m;

    move-result-object v2

    iget-object v4, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v4}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v4

    iget v4, v4, Lcom/yingyonghui/market/model/l;->e:I

    invoke-static {v0, v1, v2, v3, v4}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Ljava/lang/String;Lcom/yingyonghui/market/log/m;II)V

    goto/16 :goto_1

    .line 414
    :cond_a
    const-string v0, "unignore"

    invoke-static {v1, v0}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 415
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    iget-object v1, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v1}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v1

    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v0, v1, v5}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;Ljava/lang/String;Z)V

    .line 416
    iget-object v0, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v0}, Lcom/yingyonghui/market/bc;->b(Lcom/yingyonghui/market/bc;)Landroid/content/Context;

    move-result-object v0

    const-string v1, "manageIgnoreCancel"

    iget-object v2, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v2}, Lcom/yingyonghui/market/bc;->c(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/log/m;

    move-result-object v2

    iget-object v4, p0, Lcom/yingyonghui/market/em;->a:Lcom/yingyonghui/market/bc;

    invoke-static {v4}, Lcom/yingyonghui/market/bc;->a(Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/model/l;

    move-result-object v4

    iget v4, v4, Lcom/yingyonghui/market/model/l;->e:I

    invoke-static {v0, v1, v2, v3, v4}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Ljava/lang/String;Lcom/yingyonghui/market/log/m;II)V

    goto/16 :goto_1
.end method
