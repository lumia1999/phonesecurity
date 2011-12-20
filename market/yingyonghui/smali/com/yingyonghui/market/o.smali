.class final Lcom/yingyonghui/market/o;
.super Landroid/content/BroadcastReceiver;
.source "ActivityListAppManage.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityListAppManage;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityListAppManage;)V
    .locals 0
    .parameter

    .prologue
    .line 429
    iput-object p1, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 13
    .parameter
    .parameter

    .prologue
    const/4 v2, 0x3

    const/4 v12, -0x1

    const/4 v11, 0x1

    .line 432
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 433
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    if-ne v0, v2, :cond_1

    .line 434
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->j(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/bl;

    .line 435
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->k(Lcom/yingyonghui/market/ActivityListAppManage;)Z

    .line 465
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->d()V

    .line 468
    :cond_1
    :goto_1
    return-void

    .line 439
    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iput-boolean v11, v0, Lcom/yingyonghui/market/ActivityListAppManage;->c:Z

    .line 440
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->k(Lcom/yingyonghui/market/ActivityListAppManage;)Z

    .line 441
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->l(Lcom/yingyonghui/market/ActivityListAppManage;)Z

    .line 442
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    if-eq v0, v11, :cond_3

    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    if-ne v0, v2, :cond_4

    .line 443
    :cond_3
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->d()V

    goto :goto_1

    .line 444
    :cond_4
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 445
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 446
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->h(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/bc;

    move-result-object v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->h(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/bc;

    move-result-object v0

    iget-object v0, v0, Lcom/yingyonghui/market/bc;->a:Lcom/yingyonghui/market/model/l;

    if-eqz v0, :cond_5

    .line 447
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getEncodedSchemeSpecificPart()Ljava/lang/String;

    move-result-object v0

    .line 448
    iget-object v1, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppManage;->h(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/bc;

    move-result-object v1

    iget-object v10, v1, Lcom/yingyonghui/market/bc;->a:Lcom/yingyonghui/market/model/l;

    .line 449
    iget-object v1, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppManage;->h(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/bc;

    move-result-object v1

    iget-object v1, v1, Lcom/yingyonghui/market/bc;->a:Lcom/yingyonghui/market/model/l;

    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 450
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/util/GlobalUtil;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    .line 451
    const-string v8, "update"

    .line 452
    invoke-static {p1}, Lcom/yingyonghui/market/downloader/n;->a(Landroid/content/Context;)Lcom/yingyonghui/market/downloader/n;

    move-result-object v0

    iget-object v1, v10, Lcom/yingyonghui/market/model/l;->g:Ljava/lang/String;

    iget v2, v10, Lcom/yingyonghui/market/model/l;->e:I

    iget-object v3, v10, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    iget-object v4, v10, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    iget v5, v10, Lcom/yingyonghui/market/model/l;->o:I

    iget-object v6, v10, Lcom/yingyonghui/market/model/l;->F:Ljava/lang/String;

    iget-object v9, v10, Lcom/yingyonghui/market/model/l;->f:Ljava/lang/String;

    invoke-virtual/range {v0 .. v9}, Lcom/yingyonghui/market/downloader/n;->a(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 453
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->h(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/bc;

    move-result-object v0

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/yingyonghui/market/bc;->a:Lcom/yingyonghui/market/model/l;

    .line 454
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    const v1, 0x7f090112

    new-array v2, v11, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, v10, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/ActivityListAppManage;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/yingyonghui/market/util/GlobalUtil;->b(Landroid/content/Context;Ljava/lang/String;)V

    .line 457
    :cond_5
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->b(Lcom/yingyonghui/market/ActivityListAppManage;)I

    move-result v0

    if-eq v0, v12, :cond_0

    .line 458
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->m(Lcom/yingyonghui/market/ActivityListAppManage;)I

    goto/16 :goto_0

    .line 460
    :cond_6
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 461
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->b(Lcom/yingyonghui/market/ActivityListAppManage;)I

    move-result v0

    if-eq v0, v12, :cond_0

    .line 462
    iget-object v0, p0, Lcom/yingyonghui/market/o;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->n(Lcom/yingyonghui/market/ActivityListAppManage;)I

    goto/16 :goto_0
.end method
