.class public final Lcom/yingyonghui/market/ef;
.super Landroid/widget/ArrayAdapter;
.source "ActivityListComments.java"


# instance fields
.field final synthetic a:Lcom/yingyonghui/market/ActivityListComments;

.field private b:Landroid/view/LayoutInflater;

.field private c:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/ActivityListComments;Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 426
    iput-object p1, p0, Lcom/yingyonghui/market/ef;->a:Lcom/yingyonghui/market/ActivityListComments;

    .line 427
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 567
    new-instance v0, Lcom/yingyonghui/market/m;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/m;-><init>(Lcom/yingyonghui/market/ef;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ef;->c:Landroid/view/View$OnClickListener;

    .line 428
    const-string v0, "layout_inflater"

    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/yingyonghui/market/ef;->b:Landroid/view/LayoutInflater;

    .line 430
    return-void
.end method

.method private a(Lcom/yingyonghui/market/model/n;III)Landroid/view/View;
    .locals 5
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 548
    iget-object v0, p0, Lcom/yingyonghui/market/ef;->b:Landroid/view/LayoutInflater;

    const v1, 0x7f03003f

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 549
    const v0, 0x7f0b0084

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 551
    iget-boolean v2, p1, Lcom/yingyonghui/market/model/n;->k:Z

    if-eqz v2, :cond_0

    .line 552
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "<font color=\"#01457e\">"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/yingyonghui/market/ef;->a:Lcom/yingyonghui/market/ActivityListComments;

    const v4, 0x7f090106

    invoke-virtual {v3, v4}, Lcom/yingyonghui/market/ActivityListComments;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</font>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 556
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "<font color=\"#999999\">"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Lcom/yingyonghui/market/model/n;->b:Ljava/lang/String;

    invoke-static {v3}, Lcom/yingyonghui/market/util/c;->g(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/yingyonghui/market/ef;->a:Lcom/yingyonghui/market/ActivityListComments;

    const v4, 0x7f090105

    invoke-virtual {v3, v4}, Lcom/yingyonghui/market/ActivityListComments;->getString(I)Ljava/lang/String;

    move-result-object v3

    :goto_1
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/yingyonghui/market/ef;->a:Lcom/yingyonghui/market/ActivityListComments;

    const v4, 0x7f0900fd

    invoke-virtual {v3, v4}, Lcom/yingyonghui/market/ActivityListComments;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</font>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 559
    const v0, 0x7f0b0088

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v2, p1, Lcom/yingyonghui/market/model/n;->g:Ljava/lang/String;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListComments;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 560
    const v0, 0x7f0b0086

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-wide v2, p1, Lcom/yingyonghui/market/model/n;->h:J

    const-string v4, "yyyy-MM-dd HH:mm"

    invoke-static {v2, v3, v4}, Lcom/yingyonghui/market/util/r;->a(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 561
    const v0, 0x7f0b0087

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 562
    iget-object v2, p0, Lcom/yingyonghui/market/ef;->c:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 563
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 564
    return-object v1

    .line 554
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "<font color=\"black\">"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Lcom/yingyonghui/market/model/n;->e:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</font>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 556
    :cond_1
    iget-object v3, p1, Lcom/yingyonghui/market/model/n;->b:Ljava/lang/String;

    goto/16 :goto_1
.end method


# virtual methods
.method public final getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10
    .parameter
    .parameter
    .parameter

    .prologue
    const v6, 0x7f0b0087

    const v5, 0x7f0b0086

    const v4, 0x7f0b0084

    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 436
    invoke-virtual {p0, p1}, Lcom/yingyonghui/market/ef;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/n;

    .line 438
    if-nez p2, :cond_1

    .line 439
    iget-object v1, v0, Lcom/yingyonghui/market/model/n;->i:Ljava/lang/String;

    const-string v2, "error"

    invoke-static {v1, v2}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 440
    iget-object v1, p0, Lcom/yingyonghui/market/ef;->b:Landroid/view/LayoutInflater;

    const v2, 0x7f03001c

    invoke-virtual {v1, v2, p3, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 441
    new-instance v2, Lcom/yingyonghui/market/cr;

    invoke-direct {v2}, Lcom/yingyonghui/market/cr;-><init>()V

    move-object v3, v1

    .line 448
    :goto_0
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v2, Lcom/yingyonghui/market/cr;->a:Landroid/widget/TextView;

    .line 449
    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v2, Lcom/yingyonghui/market/cr;->b:Landroid/widget/TextView;

    .line 450
    const v1, 0x7f0b0088

    invoke-virtual {v3, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v2, Lcom/yingyonghui/market/cr;->c:Landroid/widget/TextView;

    .line 451
    const v1, 0x7f0b0089

    invoke-virtual {v3, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, v2, Lcom/yingyonghui/market/cr;->f:Landroid/widget/LinearLayout;

    .line 452
    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v2, Lcom/yingyonghui/market/cr;->e:Landroid/widget/TextView;

    .line 453
    iget-object v1, v2, Lcom/yingyonghui/market/cr;->e:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/yingyonghui/market/ef;->c:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 455
    invoke-virtual {v3, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    move-object v1, v2

    .line 483
    :goto_1
    iget-object v1, v1, Lcom/yingyonghui/market/cr;->e:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v4, v0, Lcom/yingyonghui/market/model/n;->a:I

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "-"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 484
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yingyonghui/market/cr;

    .line 485
    iget-object v2, v1, Lcom/yingyonghui/market/cr;->f:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 487
    iget-boolean v2, v0, Lcom/yingyonghui/market/model/n;->k:Z

    if-eqz v2, :cond_4

    .line 489
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "<font color=\"#01457e\">"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p0, Lcom/yingyonghui/market/ef;->a:Lcom/yingyonghui/market/ActivityListComments;

    const v5, 0x7f090106

    invoke-virtual {v4, v5}, Lcom/yingyonghui/market/ActivityListComments;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "</font>"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 500
    :goto_2
    iget-object v4, v1, Lcom/yingyonghui/market/cr;->c:Landroid/widget/TextView;

    const/high16 v5, -0x100

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 501
    iget-object v4, v1, Lcom/yingyonghui/market/cr;->c:Landroid/widget/TextView;

    invoke-virtual {v4, v8, v8, v8, v8}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 503
    iget-object v4, v0, Lcom/yingyonghui/market/model/n;->i:Ljava/lang/String;

    const-string v5, "comment"

    invoke-static {v4, v5}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 504
    iget-object v4, v1, Lcom/yingyonghui/market/cr;->d:Landroid/widget/RatingBar;

    iget-wide v5, v0, Lcom/yingyonghui/market/model/n;->f:D

    double-to-float v5, v5

    invoke-virtual {v4, v5}, Landroid/widget/RatingBar;->setRating(F)V

    .line 505
    iget-object v4, v1, Lcom/yingyonghui/market/cr;->a:Landroid/widget/TextView;

    const/high16 v5, -0x100

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 506
    iget-object v4, v1, Lcom/yingyonghui/market/cr;->a:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, "<font color=\"#999999\">"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, "("

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v5, v0, Lcom/yingyonghui/market/model/n;->b:Ljava/lang/String;

    invoke-static {v5}, Lcom/yingyonghui/market/util/c;->g(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    iget-object v5, p0, Lcom/yingyonghui/market/ef;->a:Lcom/yingyonghui/market/ActivityListComments;

    const v6, 0x7f090105

    invoke-virtual {v5, v6}, Lcom/yingyonghui/market/ActivityListComments;->getString(I)Ljava/lang/String;

    move-result-object v5

    :goto_3
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, ") "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v5, p0, Lcom/yingyonghui/market/ef;->a:Lcom/yingyonghui/market/ActivityListComments;

    const v6, 0x7f0900ff

    invoke-virtual {v5, v6}, Lcom/yingyonghui/market/ActivityListComments;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, "</font>"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 510
    iget-boolean v2, v0, Lcom/yingyonghui/market/model/n;->c:Z

    if-eqz v2, :cond_7

    .line 511
    iget-object v2, v1, Lcom/yingyonghui/market/cr;->c:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/yingyonghui/market/ef;->a:Lcom/yingyonghui/market/ActivityListComments;

    invoke-virtual {v4}, Lcom/yingyonghui/market/ActivityListComments;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080005

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 512
    iget-object v2, v1, Lcom/yingyonghui/market/cr;->c:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/yingyonghui/market/ef;->a:Lcom/yingyonghui/market/ActivityListComments;

    const v5, 0x7f090104

    invoke-virtual {v4, v5}, Lcom/yingyonghui/market/ActivityListComments;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 513
    iget-object v2, p0, Lcom/yingyonghui/market/ef;->a:Lcom/yingyonghui/market/ActivityListComments;

    invoke-virtual {v2}, Lcom/yingyonghui/market/ActivityListComments;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f02002a

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 514
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    invoke-virtual {v2, v7, v7, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 515
    iget-object v4, v1, Lcom/yingyonghui/market/cr;->c:Landroid/widget/TextView;

    invoke-virtual {v4, v2, v8, v8, v8}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 516
    iget-object v2, v1, Lcom/yingyonghui/market/cr;->d:Landroid/widget/RatingBar;

    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/widget/RatingBar;->setVisibility(I)V

    .line 521
    :goto_4
    iget-object v4, v0, Lcom/yingyonghui/market/model/n;->l:Ljava/util/ArrayList;

    .line 522
    if-eqz v4, :cond_a

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_a

    .line 523
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v6, v7

    :goto_5
    if-ge v6, v5, :cond_a

    .line 524
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yingyonghui/market/model/n;

    .line 525
    iget-object v7, v1, Lcom/yingyonghui/market/cr;->f:Landroid/widget/LinearLayout;

    iget v8, v0, Lcom/yingyonghui/market/model/n;->a:I

    invoke-direct {p0, v2, v8, p1, v6}, Lcom/yingyonghui/market/ef;->a(Lcom/yingyonghui/market/model/n;III)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v7, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 523
    add-int/lit8 v2, v6, 0x1

    move v6, v2

    goto :goto_5

    .line 443
    :cond_0
    iget-object v1, p0, Lcom/yingyonghui/market/ef;->b:Landroid/view/LayoutInflater;

    const v2, 0x7f03001d

    invoke-virtual {v1, v2, p3, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 444
    new-instance v3, Lcom/yingyonghui/market/cr;

    invoke-direct {v3}, Lcom/yingyonghui/market/cr;-><init>()V

    .line 445
    const v1, 0x7f0b0043

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RatingBar;

    iput-object v1, v3, Lcom/yingyonghui/market/cr;->d:Landroid/widget/RatingBar;

    move-object v9, v3

    move-object v3, v2

    move-object v2, v9

    goto/16 :goto_0

    .line 457
    :cond_1
    iget-object v1, v0, Lcom/yingyonghui/market/model/n;->i:Ljava/lang/String;

    const-string v2, "error"

    invoke-static {v1, v2}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0b0083

    if-eq v1, v2, :cond_2

    .line 458
    iget-object v1, p0, Lcom/yingyonghui/market/ef;->b:Landroid/view/LayoutInflater;

    const v2, 0x7f03001c

    invoke-virtual {v1, v2, p3, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 459
    new-instance v3, Lcom/yingyonghui/market/cr;

    invoke-direct {v3}, Lcom/yingyonghui/market/cr;-><init>()V

    .line 460
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v3, Lcom/yingyonghui/market/cr;->a:Landroid/widget/TextView;

    .line 461
    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v3, Lcom/yingyonghui/market/cr;->b:Landroid/widget/TextView;

    .line 462
    const v1, 0x7f0b0088

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v3, Lcom/yingyonghui/market/cr;->c:Landroid/widget/TextView;

    .line 463
    const v1, 0x7f0b0089

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, v3, Lcom/yingyonghui/market/cr;->f:Landroid/widget/LinearLayout;

    .line 464
    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v3, Lcom/yingyonghui/market/cr;->e:Landroid/widget/TextView;

    .line 465
    iget-object v1, v3, Lcom/yingyonghui/market/cr;->e:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/yingyonghui/market/ef;->c:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 466
    invoke-virtual {v2, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    move-object v1, v3

    move-object v3, v2

    goto/16 :goto_1

    .line 467
    :cond_2
    iget-object v1, v0, Lcom/yingyonghui/market/model/n;->i:Ljava/lang/String;

    const-string v2, "comment"

    invoke-static {v1, v2}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0b008a

    if-eq v1, v2, :cond_3

    .line 468
    iget-object v1, p0, Lcom/yingyonghui/market/ef;->b:Landroid/view/LayoutInflater;

    const v2, 0x7f03001d

    invoke-virtual {v1, v2, p3, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 469
    new-instance v3, Lcom/yingyonghui/market/cr;

    invoke-direct {v3}, Lcom/yingyonghui/market/cr;-><init>()V

    .line 470
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v3, Lcom/yingyonghui/market/cr;->a:Landroid/widget/TextView;

    .line 471
    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v3, Lcom/yingyonghui/market/cr;->b:Landroid/widget/TextView;

    .line 472
    const v1, 0x7f0b0088

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v3, Lcom/yingyonghui/market/cr;->c:Landroid/widget/TextView;

    .line 473
    const v1, 0x7f0b0043

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RatingBar;

    iput-object v1, v3, Lcom/yingyonghui/market/cr;->d:Landroid/widget/RatingBar;

    .line 474
    const v1, 0x7f0b0089

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, v3, Lcom/yingyonghui/market/cr;->f:Landroid/widget/LinearLayout;

    .line 475
    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v3, Lcom/yingyonghui/market/cr;->e:Landroid/widget/TextView;

    .line 476
    iget-object v1, v3, Lcom/yingyonghui/market/cr;->e:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/yingyonghui/market/ef;->c:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 477
    invoke-virtual {v2, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    move-object v1, v3

    move-object v3, v2

    goto/16 :goto_1

    .line 479
    :cond_3
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yingyonghui/market/cr;

    move-object v3, p2

    goto/16 :goto_1

    .line 491
    :cond_4
    invoke-static {v8}, Lcom/yingyonghui/market/util/c;->g(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 492
    iget-object v2, p0, Lcom/yingyonghui/market/ef;->a:Lcom/yingyonghui/market/ActivityListComments;

    const v4, 0x7f090082

    invoke-virtual {v2, v4}, Lcom/yingyonghui/market/ActivityListComments;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 496
    :goto_6
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "<font color=\"black\">"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "</font>"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_2

    .line 494
    :cond_5
    iget-object v2, v0, Lcom/yingyonghui/market/model/n;->e:Ljava/lang/String;

    goto :goto_6

    .line 506
    :cond_6
    iget-object v5, v0, Lcom/yingyonghui/market/model/n;->b:Ljava/lang/String;

    goto/16 :goto_3

    .line 518
    :cond_7
    iget-object v2, v1, Lcom/yingyonghui/market/cr;->c:Landroid/widget/TextView;

    iget-object v4, v0, Lcom/yingyonghui/market/model/n;->g:Ljava/lang/String;

    invoke-static {v4}, Lcom/yingyonghui/market/ActivityListComments;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 519
    iget-object v2, v1, Lcom/yingyonghui/market/cr;->d:Landroid/widget/RatingBar;

    invoke-virtual {v2, v7}, Landroid/widget/RatingBar;->setVisibility(I)V

    goto/16 :goto_4

    .line 528
    :cond_8
    iget-object v4, v0, Lcom/yingyonghui/market/model/n;->i:Ljava/lang/String;

    const-string v5, "error"

    invoke-static {v4, v5}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 529
    iget-object v4, v1, Lcom/yingyonghui/market/cr;->a:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, "<font color=\"#999999\">"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, "("

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v5, v0, Lcom/yingyonghui/market/model/n;->b:Ljava/lang/String;

    invoke-static {v5}, Lcom/yingyonghui/market/util/c;->g(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9

    iget-object v5, p0, Lcom/yingyonghui/market/ef;->a:Lcom/yingyonghui/market/ActivityListComments;

    const v6, 0x7f090105

    invoke-virtual {v5, v6}, Lcom/yingyonghui/market/ActivityListComments;->getString(I)Ljava/lang/String;

    move-result-object v5

    :goto_7
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, ") "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v5, p0, Lcom/yingyonghui/market/ef;->a:Lcom/yingyonghui/market/ActivityListComments;

    const v6, 0x7f0900fe

    invoke-virtual {v5, v6}, Lcom/yingyonghui/market/ActivityListComments;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, "</font>"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 532
    iget-object v2, v1, Lcom/yingyonghui/market/cr;->c:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/yingyonghui/market/ef;->a:Lcom/yingyonghui/market/ActivityListComments;

    iget v6, v0, Lcom/yingyonghui/market/model/n;->j:I

    invoke-static {v5, v6}, Lcom/yingyonghui/market/ActivityListComments;->a(Lcom/yingyonghui/market/ActivityListComments;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Lcom/yingyonghui/market/model/n;->g:Ljava/lang/String;

    invoke-static {v5}, Lcom/yingyonghui/market/ActivityListComments;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 533
    iget-object v4, v0, Lcom/yingyonghui/market/model/n;->l:Ljava/util/ArrayList;

    .line 534
    if-eqz v4, :cond_a

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_a

    .line 535
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v6, v7

    :goto_8
    if-ge v6, v5, :cond_a

    .line 536
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yingyonghui/market/model/n;

    .line 537
    iget-object v7, v1, Lcom/yingyonghui/market/cr;->f:Landroid/widget/LinearLayout;

    iget v8, v0, Lcom/yingyonghui/market/model/n;->a:I

    invoke-direct {p0, v2, v8, p1, v6}, Lcom/yingyonghui/market/ef;->a(Lcom/yingyonghui/market/model/n;III)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v7, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 535
    add-int/lit8 v2, v6, 0x1

    move v6, v2

    goto :goto_8

    .line 529
    :cond_9
    iget-object v5, v0, Lcom/yingyonghui/market/model/n;->b:Ljava/lang/String;

    goto :goto_7

    .line 542
    :cond_a
    iget-object v1, v1, Lcom/yingyonghui/market/cr;->b:Landroid/widget/TextView;

    iget-wide v4, v0, Lcom/yingyonghui/market/model/n;->h:J

    const-string v0, "yyyy-MM-dd HH:mm"

    invoke-static {v4, v5, v0}, Lcom/yingyonghui/market/util/r;->a(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 544
    return-object v3
.end method
