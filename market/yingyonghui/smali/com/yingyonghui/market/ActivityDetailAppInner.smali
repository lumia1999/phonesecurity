.class public final Lcom/yingyonghui/market/ActivityDetailAppInner;
.super Lcom/yingyonghui/market/HttpServiceSupportForActivity;
.source "ActivityDetailAppInner.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final c:I

.field private d:I

.field private e:Lcom/yingyonghui/market/model/j;

.field private f:Landroid/view/View;

.field private g:Landroid/view/View;

.field private h:Landroid/view/View;

.field private i:Landroid/view/View;

.field private j:Ljava/util/concurrent/ConcurrentHashMap;

.field private k:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

.field private l:Lcom/yingyonghui/market/dw;

.field private final m:I

.field private final n:I

.field private o:Landroid/widget/ImageView;

.field private p:Landroid/widget/TextView;

.field private q:Landroid/widget/ImageButton;

.field private r:Landroid/widget/ImageButton;

.field private s:Ljava/util/ArrayList;

.field private t:Lcom/yingyonghui/market/log/m;

.field private u:Z

.field private final v:Landroid/content/BroadcastReceiver;

.field private w:Ljava/text/NumberFormat;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;-><init>()V

    .line 60
    const/16 v0, 0x68

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->c:I

    .line 71
    const/16 v0, 0x63

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->m:I

    .line 72
    const/16 v0, 0x96

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->n:I

    .line 86
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->u:Z

    .line 163
    new-instance v0, Lcom/yingyonghui/market/dt;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/dt;-><init>(Lcom/yingyonghui/market/ActivityDetailAppInner;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->v:Landroid/content/BroadcastReceiver;

    .line 413
    invoke-static {}, Ljava/text/NumberFormat;->getInstance()Ljava/text/NumberFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->w:Ljava/text/NumberFormat;

    .line 765
    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityDetailAppInner;)I
    .locals 1
    .parameter

    .prologue
    .line 57
    iget v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->d:I

    return v0
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityDetailAppInner;I)I
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 57
    iput p1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->d:I

    return p1
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityDetailAppInner;Lcom/yingyonghui/market/model/l;I)Landroid/widget/RelativeLayout;
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Lcom/yingyonghui/market/ActivityDetailAppInner;->a(Lcom/yingyonghui/market/model/l;I)Landroid/widget/RelativeLayout;

    move-result-object v0

    return-object v0
.end method

.method private a(Lcom/yingyonghui/market/model/l;I)Landroid/widget/RelativeLayout;
    .locals 6
    .parameter
    .parameter

    .prologue
    .line 504
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03003d

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    .line 505
    new-instance v1, Lcom/yingyonghui/market/ec;

    invoke-direct {v1, p0, p1, p2}, Lcom/yingyonghui/market/ec;-><init>(Lcom/yingyonghui/market/ActivityDetailAppInner;Lcom/yingyonghui/market/model/l;I)V

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 543
    const v1, 0x7f0b00de

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p1, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 544
    const v1, 0x7f0b00df

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget v2, p1, Lcom/yingyonghui/market/model/l;->z:I

    iget v3, p1, Lcom/yingyonghui/market/model/l;->y:I

    invoke-direct {p0, v2, v3}, Lcom/yingyonghui/market/ActivityDetailAppInner;->a(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 545
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    iget v1, p1, Lcom/yingyonghui/market/model/l;->e:I

    invoke-static {v1}, Lcom/yingyonghui/market/util/y;->a(I)Lcom/yingyonghui/market/model/h;

    move-result-object v1

    .line 546
    if-eqz v1, :cond_0

    iget-object v2, v1, Lcom/yingyonghui/market/model/h;->a:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_0

    .line 547
    const v2, 0x7f0b00dd

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/ImageView;

    iget-object v1, v1, Lcom/yingyonghui/market/model/h;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 577
    :goto_0
    return-object v0

    .line 551
    :cond_0
    new-instance v1, Lcom/yingyonghui/market/eb;

    invoke-direct {v1, p0, p1, v0}, Lcom/yingyonghui/market/eb;-><init>(Lcom/yingyonghui/market/ActivityDetailAppInner;Lcom/yingyonghui/market/model/l;Landroid/widget/RelativeLayout;)V

    .line 576
    iget-object v2, p1, Lcom/yingyonghui/market/model/l;->f:Ljava/lang/String;

    iget v3, p1, Lcom/yingyonghui/market/model/l;->e:I

    iget-object v4, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->a:Lcom/yingyonghui/market/a/d;

    const/16 v5, 0x63

    invoke-virtual {v4, v2, v5, v3, v1}, Lcom/yingyonghui/market/a/d;->b(Ljava/lang/String;IILandroid/os/Handler;)V

    goto :goto_0
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityDetailAppInner;Lcom/yingyonghui/market/log/m;)Lcom/yingyonghui/market/log/m;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 57
    iput-object p1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->t:Lcom/yingyonghui/market/log/m;

    return-object p1
.end method

.method static synthetic a(Ljava/lang/String;)Lcom/yingyonghui/market/log/m;
    .locals 1
    .parameter

    .prologue
    .line 57
    invoke-static {p0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->b(Ljava/lang/String;)Lcom/yingyonghui/market/log/m;

    move-result-object v0

    return-object v0
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityDetailAppInner;Lcom/yingyonghui/market/model/j;)Lcom/yingyonghui/market/model/j;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 57
    iput-object p1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    return-object p1
.end method

.method private a(II)Ljava/lang/String;
    .locals 6
    .parameter
    .parameter

    .prologue
    const v5, 0x7f09003f

    const/16 v4, 0x270f

    .line 433
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    if-eqz v0, :cond_3

    .line 434
    const v0, 0x7f09003c

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 435
    const v1, 0x7f090040

    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 437
    if-le p1, v4, :cond_0

    .line 441
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    div-int/lit16 v3, p1, 0x2710

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0, v5}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 446
    :goto_0
    if-le p2, v4, :cond_1

    .line 447
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    div-int/lit16 v4, p2, 0x2710

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, v5}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 452
    :goto_1
    if-lez p1, :cond_2

    if-nez p2, :cond_2

    .line 453
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const v4, 0x7f09003e

    invoke-virtual {p0, v4}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 457
    :goto_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 460
    :goto_3
    return-object v0

    .line 443
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 449
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 455
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const v4, 0x7f09003d

    invoke-virtual {p0, v4}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    .line 460
    :cond_3
    const-string v0, ""

    goto :goto_3
.end method

.method private a()V
    .locals 2

    .prologue
    .line 151
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "send_asset_detail"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 152
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->v:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 153
    return-void
.end method

.method private a(Ljava/util/ArrayList;)V
    .locals 10
    .parameter

    .prologue
    const v9, 0x7f0b00e0

    const/4 v4, 0x4

    const/4 v8, 0x1

    const/4 v1, 0x0

    const/16 v7, 0x8

    .line 586
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->r:Landroid/widget/ImageButton;

    invoke-virtual {v0, v8}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 587
    const v0, 0x7f0b004e

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 588
    const v0, 0x7f0b0051

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    .line 589
    const v0, 0x7f0b0052

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    .line 590
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 591
    invoke-virtual {v5}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 592
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 593
    if-gt v2, v4, :cond_1

    .line 594
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->r:Landroid/widget/ImageButton;

    invoke-virtual {v0, v7}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 595
    :goto_0
    if-ge v1, v2, :cond_5

    .line 596
    rem-int/lit8 v0, v1, 0x2

    if-nez v0, :cond_0

    .line 597
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/l;

    invoke-direct {p0, v0, v1}, Lcom/yingyonghui/market/ActivityDetailAppInner;->a(Lcom/yingyonghui/market/model/l;I)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 595
    :goto_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 599
    :cond_0
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/l;

    invoke-direct {p0, v0, v1}, Lcom/yingyonghui/market/ActivityDetailAppInner;->a(Lcom/yingyonghui/market/model/l;I)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_1

    .line 604
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->r:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_2

    .line 605
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->r:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 607
    :cond_2
    :goto_2
    if-ge v1, v4, :cond_4

    .line 608
    rem-int/lit8 v0, v1, 0x2

    if-nez v0, :cond_3

    .line 609
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/l;

    invoke-direct {p0, v0, v1}, Lcom/yingyonghui/market/ActivityDetailAppInner;->a(Lcom/yingyonghui/market/model/l;I)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 607
    :goto_3
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_2

    .line 611
    :cond_3
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/l;

    invoke-direct {p0, v0, v1}, Lcom/yingyonghui/market/ActivityDetailAppInner;->a(Lcom/yingyonghui/market/model/l;I)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_3

    .line 614
    :cond_4
    iget-object v6, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->r:Landroid/widget/ImageButton;

    new-instance v0, Lcom/yingyonghui/market/ed;

    move-object v1, p0

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/yingyonghui/market/ed;-><init>(Lcom/yingyonghui/market/ActivityDetailAppInner;ILandroid/widget/LinearLayout;Ljava/util/ArrayList;Landroid/widget/LinearLayout;)V

    invoke-virtual {v6, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 647
    :cond_5
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    sub-int/2addr v0, v8

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 648
    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/LinearLayout;

    invoke-virtual {p0, v7}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 649
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    sub-int/2addr v0, v8

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 650
    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/LinearLayout;

    invoke-virtual {p0, v7}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 652
    return-void
.end method

.method private static b(Ljava/lang/String;)Lcom/yingyonghui/market/log/m;
    .locals 2
    .parameter

    .prologue
    .line 212
    new-instance v0, Lcom/yingyonghui/market/log/m;

    invoke-direct {v0}, Lcom/yingyonghui/market/log/m;-><init>()V

    .line 215
    :try_start_0
    invoke-static {p0}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;)Lcom/yingyonghui/market/log/m;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 220
    :goto_0
    return-object v0

    .line 216
    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityDetailAppInner;)Lcom/yingyonghui/market/model/j;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    return-object v0
.end method

.method private b()V
    .locals 7

    .prologue
    const/4 v1, 0x5

    const/4 v3, 0x0

    .line 464
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v0, v0, Lcom/yingyonghui/market/model/j;->B:[Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v0, v0, Lcom/yingyonghui/market/model/j;->B:[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_1

    .line 466
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v0, v0, Lcom/yingyonghui/market/model/j;->B:[Ljava/lang/String;

    array-length v0, v0

    if-le v0, v1, :cond_0

    move v0, v1

    .line 468
    :goto_0
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->l:Lcom/yingyonghui/market/dw;

    invoke-virtual {v1, v0}, Lcom/yingyonghui/market/dw;->a(I)V

    .line 470
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->k:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    mul-int/lit8 v2, v0, 0x64

    invoke-virtual {v1, v2}, Lcom/yingyonghui/market/widget/SlowSpeedGallery;->setSelection(I)V

    .line 471
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    iput-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->j:Ljava/util/concurrent/ConcurrentHashMap;

    move v1, v3

    .line 472
    :goto_1
    if-ge v1, v0, :cond_3

    .line 474
    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->a:Lcom/yingyonghui/market/a/d;

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v3, v3, Lcom/yingyonghui/market/model/j;->B:[Ljava/lang/String;

    aget-object v3, v3, v1

    add-int/lit16 v4, v1, 0x96

    iget-object v5, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget v5, v5, Lcom/yingyonghui/market/model/j;->e:I

    iget-object v6, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->b:Landroid/os/Handler;

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/yingyonghui/market/a/d;->b(Ljava/lang/String;IILandroid/os/Handler;)V

    .line 472
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 466
    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v0, v0, Lcom/yingyonghui/market/model/j;->B:[Ljava/lang/String;

    array-length v0, v0

    goto :goto_0

    .line 477
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 478
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->u:Z

    if-eqz v0, :cond_2

    .line 479
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->g:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 480
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->f:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 482
    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->l:Lcom/yingyonghui/market/dw;

    invoke-virtual {v0}, Lcom/yingyonghui/market/dw;->notifyDataSetChanged()V

    .line 484
    :cond_3
    return-void
.end method

.method static synthetic c(Lcom/yingyonghui/market/ActivityDetailAppInner;)V
    .locals 8
    .parameter

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 57
    const v0, 0x7f0b003f

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->o:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v0, v0, Lcom/yingyonghui/market/model/j;->f:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p0}, Lcom/yingyonghui/market/util/y;->a(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->o:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const v0, 0x7f0b003e

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v1, v1, Lcom/yingyonghui/market/model/j;->i:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0b0042

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    if-eqz v1, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const v2, 0x7f090011

    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v2, v2, Lcom/yingyonghui/market/model/j;->q:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0b0044

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    if-eqz v1, :cond_4

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const v2, 0x7f090012

    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v2, v2, Lcom/yingyonghui/market/model/j;->r:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0b0041

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget v1, v1, Lcom/yingyonghui/market/model/j;->o:I

    const v2, 0x12d000

    if-le v1, v2, :cond_5

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->w:Ljava/text/NumberFormat;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->w:Ljava/text/NumberFormat;

    int-to-float v1, v1

    const/high16 v4, 0x4980

    div-float/2addr v1, v4

    float-to-double v4, v1

    invoke-virtual {v3, v4, v5}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "M"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const v3, 0x7f090010

    invoke-virtual {p0, v3}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_4
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0b0043

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RatingBar;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget v1, v1, Lcom/yingyonghui/market/model/j;->l:F

    invoke-virtual {v0, v1}, Landroid/widget/RatingBar;->setRating(F)V

    const v0, 0x7f0b0045

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget v1, v1, Lcom/yingyonghui/market/model/j;->z:I

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget v2, v2, Lcom/yingyonghui/market/model/j;->y:I

    invoke-direct {p0, v1, v2}, Lcom/yingyonghui/market/ActivityDetailAppInner;->a(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    if-eqz v0, :cond_7

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const v1, 0x7f090042

    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget v1, v1, Lcom/yingyonghui/market/model/j;->A:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    :goto_5
    const v0, 0x7f0b0046

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0b004c

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->p:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->p:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    if-eqz v1, :cond_8

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v1, v1, Lcom/yingyonghui/market/model/j;->a:Ljava/lang/String;

    if-eqz v1, :cond_8

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v1, v1, Lcom/yingyonghui/market/model/j;->a:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_8

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v1, v1, Lcom/yingyonghui/market/model/j;->a:Ljava/lang/String;

    :goto_6
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0b004d

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->q:Landroid/widget/ImageButton;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->q:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lcom/yingyonghui/market/ds;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/ds;-><init>(Lcom/yingyonghui/market/ActivityDetailAppInner;)V

    new-array v1, v6, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/ds;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    const v0, 0x7f0b0053

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->r:Landroid/widget/ImageButton;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->r:Landroid/widget/ImageButton;

    invoke-virtual {v0, v6}, Landroid/widget/ImageButton;->setEnabled(Z)V

    const v0, 0x7f0b004b

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget v1, v1, Lcom/yingyonghui/market/model/j;->D:I

    if-lez v1, :cond_9

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v1, v1, Lcom/yingyonghui/market/model/j;->G:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_7
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->s:Ljava/util/ArrayList;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->s:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_a

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->s:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->a(Ljava/util/ArrayList;)V

    :cond_0
    :goto_8
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->b()V

    return-void

    :cond_1
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {v0}, Lcom/yingyonghui/market/util/y;->a(Ljava/lang/String;)Lcom/yingyonghui/market/model/h;

    move-result-object v1

    iget-object v1, v1, Lcom/yingyonghui/market/model/h;->a:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_2

    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p0}, Lcom/yingyonghui/market/util/y;->a(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->a:Lcom/yingyonghui/market/a/d;

    const/16 v3, 0x63

    iget-object v4, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->b:Landroid/os/Handler;

    invoke-virtual {v2, v0, v3, v4}, Lcom/yingyonghui/market/a/d;->d(Ljava/lang/String;ILandroid/os/Handler;)V

    :cond_2
    move-object v0, v1

    goto/16 :goto_0

    :cond_3
    move-object v1, v7

    goto/16 :goto_1

    :cond_4
    move-object v1, v7

    goto/16 :goto_2

    :cond_5
    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->w:Ljava/text/NumberFormat;

    invoke-virtual {v2, v6}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->w:Ljava/text/NumberFormat;

    div-int/lit16 v1, v1, 0x400

    int-to-long v4, v1

    invoke-virtual {v3, v4, v5}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "K"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_3

    :cond_6
    move-object v1, v7

    goto/16 :goto_4

    :cond_7
    move-object v1, v7

    goto/16 :goto_5

    :cond_8
    const v1, 0x7f090061

    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_6

    :cond_9
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_7

    :cond_a
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v0, v0, Lcom/yingyonghui/market/model/j;->m:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v0, v0, Lcom/yingyonghui/market/model/j;->m:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->a:Lcom/yingyonghui/market/a/d;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v1, v1, Lcom/yingyonghui/market/model/j;->m:Ljava/lang/String;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->b:Landroid/os/Handler;

    invoke-virtual {v0, v1, v6, v2}, Lcom/yingyonghui/market/a/d;->b(Ljava/lang/String;ILandroid/os/Handler;)V

    goto :goto_8
.end method

.method static synthetic d(Lcom/yingyonghui/market/ActivityDetailAppInner;)Landroid/view/View;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->i:Landroid/view/View;

    return-object v0
.end method

.method static synthetic e(Lcom/yingyonghui/market/ActivityDetailAppInner;)Landroid/view/View;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->h:Landroid/view/View;

    return-object v0
.end method

.method static synthetic f(Lcom/yingyonghui/market/ActivityDetailAppInner;)Lcom/yingyonghui/market/dw;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->l:Lcom/yingyonghui/market/dw;

    return-object v0
.end method

.method static synthetic g(Lcom/yingyonghui/market/ActivityDetailAppInner;)Lcom/yingyonghui/market/log/m;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->t:Lcom/yingyonghui/market/log/m;

    return-object v0
.end method

.method static synthetic h(Lcom/yingyonghui/market/ActivityDetailAppInner;)Landroid/widget/TextView;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->p:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic i(Lcom/yingyonghui/market/ActivityDetailAppInner;)Landroid/widget/ImageButton;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->q:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic j(Lcom/yingyonghui/market/ActivityDetailAppInner;)Landroid/widget/ImageButton;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->r:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic k(Lcom/yingyonghui/market/ActivityDetailAppInner;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->j:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method


# virtual methods
.method protected final a(Landroid/os/Message;)V
    .locals 5
    .parameter

    .prologue
    const/4 v4, 0x0

    .line 656
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/yingyonghui/market/a/a;

    .line 657
    iget v1, v0, Lcom/yingyonghui/market/a/a;->c:I

    sparse-switch v1, :sswitch_data_0

    .line 698
    :cond_0
    :goto_0
    return-void

    .line 659
    :sswitch_0
    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->s:Ljava/util/ArrayList;

    .line 660
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->s:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->s:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_0

    .line 663
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->s:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->a(Ljava/util/ArrayList;)V

    .line 665
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->t:Lcom/yingyonghui/market/log/m;

    const/16 v2, 0xa

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->s:Ljava/util/ArrayList;

    invoke-static {v0, v1, v4, v2, v3}, Lcom/yingyonghui/market/log/l;->h(Landroid/content/Context;Lcom/yingyonghui/market/log/m;IILjava/util/List;)V

    goto :goto_0

    .line 673
    :sswitch_1
    iget-object v1, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    .line 674
    array-length v2, v1

    invoke-static {v1, v4, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 675
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 678
    iget v1, v0, Lcom/yingyonghui/market/a/a;->d:I

    iget v3, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->d:I

    if-ne v1, v3, :cond_1

    .line 679
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->j:Ljava/util/concurrent/ConcurrentHashMap;

    iget v0, v0, Lcom/yingyonghui/market/a/a;->c:I

    const/16 v3, 0x96

    sub-int/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 681
    :cond_1
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->u:Z

    if-eqz v0, :cond_2

    .line 682
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->g:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 683
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->f:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 686
    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->l:Lcom/yingyonghui/market/dw;

    invoke-virtual {v0}, Lcom/yingyonghui/market/dw;->notifyDataSetChanged()V

    goto :goto_0

    .line 690
    :sswitch_2
    iget-object v1, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    .line 691
    array-length v2, v1

    invoke-static {v1, v4, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 692
    if-eqz v1, :cond_0

    .line 693
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 694
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/yingyonghui/market/util/y;->a(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 695
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->o:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 696
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->o:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 657
    nop

    :sswitch_data_0
    .sparse-switch
        0x63 -> :sswitch_2
        0x68 -> :sswitch_0
        0x96 -> :sswitch_1
        0x97 -> :sswitch_1
        0x98 -> :sswitch_1
        0x99 -> :sswitch_1
        0x9a -> :sswitch_1
    .end sparse-switch
.end method

.method public final onClick(Landroid/view/View;)V
    .locals 5
    .parameter

    .prologue
    .line 744
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 760
    :goto_0
    return-void

    .line 746
    :sswitch_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v0, v0, Lcom/yingyonghui/market/model/j;->j:Ljava/lang/String;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "market://market.iworks.com/search?q=pub:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string v2, "title"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v3, v3, Lcom/yingyonghui/market/model/j;->j:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :try_start_0
    invoke-super {p0, v1}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "searchByDeveloper"

    invoke-static {v1, v2, v0}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Landroid/content/ActivityNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 750
    :sswitch_1
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v0, v0, Lcom/yingyonghui/market/model/j;->j:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v0, v0, Lcom/yingyonghui/market/model/j;->j:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v0, v0, Lcom/yingyonghui/market/model/j;->j:Ljava/lang/String;

    const-string v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    :cond_0
    const v0, 0x7f090088

    invoke-static {p0, v0}, Lcom/yingyonghui/market/util/GlobalUtil;->b(Landroid/content/Context;I)V

    .line 751
    :goto_2
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->t:Lcom/yingyonghui/market/log/m;

    invoke-static {v1}, Lcom/yingyonghui/market/log/h;->j(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 750
    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "android.intent.action.SEND"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.EMAIL"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v4, v4, Lcom/yingyonghui/market/model/j;->j:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.SUBJECT"

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->e:Lcom/yingyonghui/market/model/j;

    iget-object v2, v2, Lcom/yingyonghui/market/model/j;->i:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.TEXT"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "message/rfc882"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const v1, 0x7f09002e

    :try_start_1
    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Landroid/content/ActivityNotFoundException;->printStackTrace()V

    goto :goto_2

    .line 756
    :sswitch_2
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->p:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getLineCount()I

    move-result v0

    .line 757
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->p:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 758
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->q:Landroid/widget/ImageButton;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 759
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->t:Lcom/yingyonghui/market/log/m;

    invoke-static {v1}, Lcom/yingyonghui/market/log/h;->l(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 744
    :sswitch_data_0
    .sparse-switch
        0x7f0b004d -> :sswitch_2
        0x7f0b0055 -> :sswitch_0
        0x7f0b0056 -> :sswitch_1
    .end sparse-switch
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .locals 9
    .parameter

    .prologue
    const v8, 0x7f0b004a

    const/16 v7, 0x8

    const/4 v3, 0x1

    const/4 v6, 0x0

    .line 90
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onCreate(Landroid/os/Bundle;)V

    .line 91
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 93
    const-string v1, "_id"

    invoke-virtual {v0, v1, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->d:I

    .line 95
    const-string v0, "com.yingyonghui.market_preferences"

    invoke-virtual {p0, v0, v6}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 96
    const-string v1, "checkbox_display_icons"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 98
    invoke-static {p0}, Lcom/yingyonghui/market/util/g;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "WiFi"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    if-nez v0, :cond_1

    .line 99
    iput-boolean v6, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->u:Z

    .line 104
    :goto_0
    const v0, 0x7f03000a

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->setContentView(I)V

    .line 106
    invoke-static {}, Lcom/yingyonghui/market/util/p;->a()I

    move-result v0

    const/4 v1, 0x4

    if-le v0, v1, :cond_0

    .line 107
    invoke-virtual {p0, v8}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 109
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "setScrollbarFadingEnabled"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 110
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    :cond_0
    :goto_1
    const v0, 0x7f0b00bb

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->h:Landroid/view/View;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->h:Landroid/view/View;

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0, v8}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->i:Landroid/view/View;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->i:Landroid/view/View;

    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f0b005f

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->k:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->k:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    invoke-virtual {v0, v6}, Lcom/yingyonghui/market/widget/SlowSpeedGallery;->setFadingEdgeLength(I)V

    new-instance v0, Lcom/yingyonghui/market/dw;

    invoke-direct {v0, p0, p0}, Lcom/yingyonghui/market/dw;-><init>(Lcom/yingyonghui/market/ActivityDetailAppInner;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->l:Lcom/yingyonghui/market/dw;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->k:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->l:Lcom/yingyonghui/market/dw;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/widget/SlowSpeedGallery;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    const v0, 0x7f0b0062

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->k:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    new-instance v2, Lcom/yingyonghui/market/du;

    invoke-direct {v2, p0, v0}, Lcom/yingyonghui/market/du;-><init>(Lcom/yingyonghui/market/ActivityDetailAppInner;Landroid/widget/TextView;)V

    invoke-virtual {v1, v2}, Lcom/yingyonghui/market/widget/SlowSpeedGallery;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->k:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    new-instance v1, Lcom/yingyonghui/market/dr;

    invoke-direct {v1, p0}, Lcom/yingyonghui/market/dr;-><init>(Lcom/yingyonghui/market/ActivityDetailAppInner;)V

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/widget/SlowSpeedGallery;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    const v0, 0x7f0b0060

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->k:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    invoke-virtual {v1, v0}, Lcom/yingyonghui/market/widget/SlowSpeedGallery;->setEmptyView(Landroid/view/View;)V

    const v0, 0x7f0b0063

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->g:Landroid/view/View;

    const v0, 0x7f0b005e

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->f:Landroid/view/View;

    const v0, 0x7f0b0055

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0b0056

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->u:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->g:Landroid/view/View;

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->f:Landroid/view/View;

    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 117
    :goto_2
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->a()V

    .line 118
    return-void

    .line 101
    :cond_1
    iput-boolean v3, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->u:Z

    goto/16 :goto_0

    .line 111
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto/16 :goto_1

    .line 116
    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->g:Landroid/view/View;

    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->f:Landroid/view/View;

    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2
.end method

.method public final onDestroy()V
    .locals 3

    .prologue
    .line 129
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onDestroy()V

    .line 130
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->j:Ljava/util/concurrent/ConcurrentHashMap;

    if-eqz v0, :cond_1

    .line 131
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->j:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 132
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 133
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 135
    :try_start_0
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0

    .line 142
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailAppInner;->v:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 143
    :goto_1
    return-void

    .line 142
    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1
.end method

.method public final onResume()V
    .locals 0

    .prologue
    .line 122
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onResume()V

    .line 123
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->a()V

    .line 125
    return-void
.end method

.method public final onSearchRequested()Z
    .locals 1

    .prologue
    .line 147
    const/4 v0, 0x0

    return v0
.end method
