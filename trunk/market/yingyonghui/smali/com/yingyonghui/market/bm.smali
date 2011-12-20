.class final Lcom/yingyonghui/market/bm;
.super Landroid/widget/ArrayAdapter;
.source "ActivityListAppDownload.java"


# instance fields
.field private a:Landroid/view/LayoutInflater;

.field private b:Lcom/yingyonghui/market/ba;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:Z

.field private synthetic g:Lcom/yingyonghui/market/ActivityListAppDownload;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/ActivityListAppDownload;Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 2
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 502
    iput-object p1, p0, Lcom/yingyonghui/market/bm;->g:Lcom/yingyonghui/market/ActivityListAppDownload;

    .line 503
    invoke-direct {p0, p2, v1, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 504
    const-string v0, "layout_inflater"

    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/yingyonghui/market/bm;->a:Landroid/view/LayoutInflater;

    .line 505
    new-instance v0, Lcom/yingyonghui/market/ba;

    invoke-direct {v0, p1}, Lcom/yingyonghui/market/ba;-><init>(Lcom/yingyonghui/market/ActivityListAppDownload;)V

    iput-object v0, p0, Lcom/yingyonghui/market/bm;->b:Lcom/yingyonghui/market/ba;

    .line 506
    const v0, 0x7f090133

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/bm;->c:Ljava/lang/String;

    .line 507
    const v0, 0x7f090134

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/bm;->d:Ljava/lang/String;

    .line 508
    const v0, 0x7f090010

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/bm;->e:Ljava/lang/String;

    .line 510
    invoke-static {}, Lcom/yingyonghui/market/util/GlobalUtil;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 511
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/yingyonghui/market/bm;->f:Z

    .line 515
    :goto_0
    return-void

    .line 513
    :cond_0
    iput-boolean v1, p0, Lcom/yingyonghui/market/bm;->f:Z

    goto :goto_0
.end method


# virtual methods
.method public final getItemId(I)J
    .locals 2
    .parameter

    .prologue
    .line 519
    invoke-virtual {p0, p1}, Lcom/yingyonghui/market/bm;->getItem(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/yingyonghui/market/model/l;

    iget v0, p0, Lcom/yingyonghui/market/model/l;->e:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public final getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v8, 0x0

    .line 525
    if-nez p2, :cond_0

    .line 526
    iget-object v0, p0, Lcom/yingyonghui/market/bm;->a:Landroid/view/LayoutInflater;

    const v1, 0x7f03002b

    invoke-virtual {v0, v1, p3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 527
    new-instance v2, Lcom/yingyonghui/market/ax;

    invoke-direct {v2}, Lcom/yingyonghui/market/ax;-><init>()V

    .line 528
    const v0, 0x7f0b003f

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, v2, Lcom/yingyonghui/market/ax;->a:Landroid/widget/ImageView;

    .line 529
    const v0, 0x7f0b006e

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, v2, Lcom/yingyonghui/market/ax;->b:Landroid/widget/TextView;

    .line 530
    const v0, 0x7f0b0041

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, v2, Lcom/yingyonghui/market/ax;->c:Landroid/widget/TextView;

    .line 531
    const v0, 0x7f0b0028

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, v2, Lcom/yingyonghui/market/ax;->d:Landroid/widget/ProgressBar;

    .line 532
    const v0, 0x7f0b0029

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, v2, Lcom/yingyonghui/market/ax;->e:Landroid/widget/TextView;

    .line 533
    const v0, 0x7f0b00b6

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, v2, Lcom/yingyonghui/market/ax;->f:Landroid/widget/TextView;

    .line 534
    iget-object v0, v2, Lcom/yingyonghui/market/ax;->f:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/yingyonghui/market/bm;->b:Lcom/yingyonghui/market/ba;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 535
    const v0, 0x7f0b00b7

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, v2, Lcom/yingyonghui/market/ax;->g:Landroid/widget/TextView;

    .line 536
    iget-object v0, v2, Lcom/yingyonghui/market/ax;->g:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/yingyonghui/market/bm;->b:Lcom/yingyonghui/market/ba;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 537
    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    move-object v9, v2

    move-object v2, v1

    move-object v1, v9

    .line 542
    :goto_0
    rem-int/lit8 v0, p1, 0x2

    if-eqz v0, :cond_1

    .line 543
    const v0, 0x7f020055

    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 548
    :goto_1
    invoke-virtual {p0, p1}, Lcom/yingyonghui/market/bm;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/l;

    .line 549
    iget-object v3, v1, Lcom/yingyonghui/market/ax;->a:Landroid/widget/ImageView;

    iget-object v4, p0, Lcom/yingyonghui/market/bm;->g:Lcom/yingyonghui/market/ActivityListAppDownload;

    iget-object v5, v0, Lcom/yingyonghui/market/model/l;->f:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 550
    iget-object v3, v1, Lcom/yingyonghui/market/ax;->b:Landroid/widget/TextView;

    iget-object v4, v0, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 551
    iget-object v3, v1, Lcom/yingyonghui/market/ax;->c:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/yingyonghui/market/bm;->e:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/yingyonghui/market/bm;->getContext()Landroid/content/Context;

    move-result-object v5

    iget v6, v0, Lcom/yingyonghui/market/model/l;->o:I

    int-to-long v6, v6

    invoke-static {v5, v6, v7}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 552
    iget-object v3, v1, Lcom/yingyonghui/market/ax;->g:Landroid/widget/TextView;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 554
    iget-boolean v3, p0, Lcom/yingyonghui/market/bm;->f:Z

    if-eqz v3, :cond_3

    .line 555
    iget-object v3, v1, Lcom/yingyonghui/market/ax;->f:Landroid/widget/TextView;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 556
    iget v3, v0, Lcom/yingyonghui/market/model/l;->L:I

    const/16 v4, 0xc0

    if-ne v3, v4, :cond_2

    .line 557
    iget-object v3, v1, Lcom/yingyonghui/market/ax;->f:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/yingyonghui/market/bm;->c:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 566
    :goto_2
    iget v3, v0, Lcom/yingyonghui/market/model/l;->o:I

    if-gtz v3, :cond_4

    move v0, v8

    .line 571
    :goto_3
    iget-object v3, v1, Lcom/yingyonghui/market/ax;->e:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "%"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 572
    iget-object v1, v1, Lcom/yingyonghui/market/ax;->d:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 574
    return-object v2

    .line 539
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/ax;

    move-object v1, v0

    move-object v2, p2

    goto/16 :goto_0

    .line 545
    :cond_1
    const v0, 0x7f020056

    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_1

    .line 559
    :cond_2
    iget-object v3, v1, Lcom/yingyonghui/market/ax;->f:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/yingyonghui/market/bm;->d:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 562
    :cond_3
    iget-object v3, v1, Lcom/yingyonghui/market/ax;->f:Landroid/widget/TextView;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2

    .line 569
    :cond_4
    const-wide/16 v3, 0x64

    iget v5, v0, Lcom/yingyonghui/market/model/l;->K:I

    int-to-long v5, v5

    mul-long/2addr v3, v5

    iget v0, v0, Lcom/yingyonghui/market/model/l;->o:I

    int-to-long v5, v0

    div-long/2addr v3, v5

    long-to-int v0, v3

    goto :goto_3
.end method
