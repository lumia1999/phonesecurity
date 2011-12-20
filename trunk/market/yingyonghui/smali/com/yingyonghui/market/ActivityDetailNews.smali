.class public Lcom/yingyonghui/market/ActivityDetailNews;
.super Lcom/yingyonghui/market/HttpServiceSupportForActivity;
.source "ActivityDetailNews.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static m:Z


# instance fields
.field private c:Ljava/util/HashMap;

.field private d:Ljava/util/HashMap;

.field private e:Ljava/util/HashMap;

.field private f:Ljava/util/HashMap;

.field private g:I

.field private h:I

.field private i:Landroid/view/View;

.field private j:Landroid/widget/ListView;

.field private k:Landroid/widget/Button;

.field private l:Landroid/view/LayoutInflater;

.field private n:Lcom/yingyonghui/market/log/m;

.field private final o:I

.field private final p:I

.field private final q:I

.field private final r:I

.field private s:Ljava/lang/String;

.field private t:Lcom/yingyonghui/market/ck;

.field private u:Landroid/os/Handler;

.field private v:Landroid/content/BroadcastReceiver;

.field private w:Ljava/text/NumberFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 80
    const/4 v0, 0x0

    sput-boolean v0, Lcom/yingyonghui/market/ActivityDetailNews;->m:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 67
    invoke-direct {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;-><init>()V

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->c:Ljava/util/HashMap;

    .line 70
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->d:Ljava/util/HashMap;

    .line 71
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->e:Ljava/util/HashMap;

    .line 72
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->f:Ljava/util/HashMap;

    .line 73
    const/4 v0, 0x1

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->g:I

    .line 74
    const/4 v0, 0x0

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->h:I

    .line 79
    iput-object v1, p0, Lcom/yingyonghui/market/ActivityDetailNews;->l:Landroid/view/LayoutInflater;

    .line 82
    iput-object v1, p0, Lcom/yingyonghui/market/ActivityDetailNews;->n:Lcom/yingyonghui/market/log/m;

    .line 84
    const/16 v0, 0x64

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->o:I

    .line 85
    const/16 v0, 0x65

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->p:I

    .line 86
    const/16 v0, 0x66

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->q:I

    .line 87
    const/16 v0, 0x67

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->r:I

    .line 88
    iput-object v1, p0, Lcom/yingyonghui/market/ActivityDetailNews;->s:Ljava/lang/String;

    .line 90
    new-instance v0, Lcom/yingyonghui/market/cf;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/cf;-><init>(Lcom/yingyonghui/market/ActivityDetailNews;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->u:Landroid/os/Handler;

    .line 235
    new-instance v0, Lcom/yingyonghui/market/cg;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/cg;-><init>(Lcom/yingyonghui/market/ActivityDetailNews;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->v:Landroid/content/BroadcastReceiver;

    .line 439
    invoke-static {}, Ljava/text/NumberFormat;->getInstance()Ljava/text/NumberFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->w:Ljava/text/NumberFormat;

    .line 812
    return-void
.end method

.method private a(I)I
    .locals 2
    .parameter

    .prologue
    .line 454
    :try_start_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->f:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 462
    :goto_0
    return v0

    .line 459
    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityDetailNews;I)I
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lcom/yingyonghui/market/ActivityDetailNews;->a(I)I

    move-result v0

    return v0
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityDetailNews;Lcom/yingyonghui/market/model/c;)Landroid/view/View;
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 67
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->l:Landroid/view/LayoutInflater;

    const v1, 0x7f03004b

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "app"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/yingyonghui/market/model/c;->a:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-object v0
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityDetailNews;Lcom/yingyonghui/market/model/m;)Landroid/view/View;
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 67
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->l:Landroid/view/LayoutInflater;

    const v1, 0x7f03004a

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    iget-object v0, p1, Lcom/yingyonghui/market/model/m;->a:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p0
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityDetailNews;)Lcom/yingyonghui/market/ck;
    .locals 1
    .parameter

    .prologue
    .line 67
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->t:Lcom/yingyonghui/market/ck;

    return-object v0
.end method

.method private a(Landroid/view/View;Lcom/yingyonghui/market/model/j;)V
    .locals 12
    .parameter
    .parameter

    .prologue
    const v10, 0x7f09006e

    const v9, 0x7f02004a

    const/4 v8, 0x1

    const v7, 0x7f020057

    const/4 v6, 0x0

    .line 316
    const v0, 0x7f0b006e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 317
    iget-object v1, p2, Lcom/yingyonghui/market/model/j;->i:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 318
    const v0, 0x7f0b0041

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 319
    iget v1, p2, Lcom/yingyonghui/market/model/j;->o:I

    const/high16 v2, 0x10

    if-le v1, v2, :cond_2

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailNews;->w:Ljava/text/NumberFormat;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailNews;->w:Ljava/text/NumberFormat;

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

    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const v3, 0x7f090010

    invoke-virtual {p0, v3}, Lcom/yingyonghui/market/ActivityDetailNews;->getString(I)Ljava/lang/String;

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

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 320
    const v0, 0x7f0b0043

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RatingBar;

    .line 321
    iget v1, p2, Lcom/yingyonghui/market/model/j;->l:F

    invoke-virtual {v0, v1}, Landroid/widget/RatingBar;->setRating(F)V

    .line 322
    const v0, 0x7f0b0072

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 324
    iget-object v1, p2, Lcom/yingyonghui/market/model/j;->m:Ljava/lang/String;

    invoke-static {p0, v1}, Lcom/yingyonghui/market/provider/k;->a(Landroid/content/Context;Ljava/lang/String;)Lcom/yingyonghui/market/provider/m;

    move-result-object v1

    .line 326
    if-nez v1, :cond_0

    .line 327
    sget-object v1, Lcom/yingyonghui/market/provider/m;->a:Lcom/yingyonghui/market/provider/m;

    .line 334
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailNews;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    iget-object v3, p2, Lcom/yingyonghui/market/model/j;->m:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 336
    iget v3, p2, Lcom/yingyonghui/market/model/j;->s:I

    iget v4, v2, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-le v3, v4, :cond_3

    move v3, v8

    .line 337
    :goto_1
    :try_start_1
    iget v2, v2, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    if-lez v2, :cond_4

    move v2, v8

    :goto_2
    move v11, v3

    move v3, v2

    move v2, v11

    .line 341
    :goto_3
    const-string v4, ""

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 342
    sget-object v4, Lcom/yingyonghui/market/provider/m;->b:Lcom/yingyonghui/market/provider/m;

    if-eq v1, v4, :cond_1

    sget-object v4, Lcom/yingyonghui/market/provider/m;->h:Lcom/yingyonghui/market/provider/m;

    if-ne v1, v4, :cond_5

    .line 344
    :cond_1
    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 345
    const v1, 0x7f0900a1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 397
    :goto_4
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setClickable(Z)V

    .line 398
    new-instance v1, Lcom/yingyonghui/market/ci;

    invoke-direct {v1, p0, p2}, Lcom/yingyonghui/market/ci;-><init>(Lcom/yingyonghui/market/ActivityDetailNews;Lcom/yingyonghui/market/model/j;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 415
    new-instance v0, Lcom/yingyonghui/market/cj;

    invoke-direct {v0, p0, p2}, Lcom/yingyonghui/market/cj;-><init>(Lcom/yingyonghui/market/ActivityDetailNews;Lcom/yingyonghui/market/model/j;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 437
    return-void

    .line 319
    :cond_2
    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailNews;->w:Ljava/text/NumberFormat;

    invoke-virtual {v2, v6}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailNews;->w:Ljava/text/NumberFormat;

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

    goto/16 :goto_0

    :cond_3
    move v3, v6

    .line 336
    goto :goto_1

    :cond_4
    move v2, v6

    .line 337
    goto :goto_2

    :catch_0
    move-exception v2

    move v2, v6

    :goto_5
    move v3, v6

    goto :goto_3

    .line 346
    :cond_5
    sget-object v4, Lcom/yingyonghui/market/provider/m;->f:Lcom/yingyonghui/market/provider/m;

    if-eq v1, v4, :cond_6

    sget-object v4, Lcom/yingyonghui/market/provider/m;->m:Lcom/yingyonghui/market/provider/m;

    if-ne v1, v4, :cond_8

    .line 348
    :cond_6
    if-eqz v2, :cond_7

    .line 349
    invoke-virtual {v0, v10}, Landroid/widget/TextView;->setText(I)V

    .line 350
    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 351
    const-string v1, "download"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    goto :goto_4

    .line 353
    :cond_7
    const v1, 0x7f090069

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 354
    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setBackgroundResource(I)V

    goto :goto_4

    .line 356
    :cond_8
    sget-object v4, Lcom/yingyonghui/market/provider/m;->j:Lcom/yingyonghui/market/provider/m;

    if-eq v1, v4, :cond_9

    sget-object v4, Lcom/yingyonghui/market/provider/m;->d:Lcom/yingyonghui/market/provider/m;

    if-ne v1, v4, :cond_e

    .line 358
    :cond_9
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailNews;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    iget-object v4, p2, Lcom/yingyonghui/market/model/j;->m:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/yingyonghui/market/provider/k;->a(Landroid/content/ContentResolver;Ljava/lang/String;)Lcom/yingyonghui/market/provider/k;

    move-result-object v3

    .line 359
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailNews;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/yingyonghui/market/provider/k;->a(Landroid/content/ContentResolver;)Ljava/io/File;

    move-result-object v4

    .line 360
    if-eqz v4, :cond_a

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_a

    .line 361
    const v1, 0x7f09006d

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 362
    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 363
    const-string v1, "install"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_4

    .line 365
    :cond_a
    sget-object v4, Lcom/yingyonghui/market/provider/m;->j:Lcom/yingyonghui/market/provider/m;

    if-eq v1, v4, :cond_b

    sget-object v4, Lcom/yingyonghui/market/provider/m;->k:Lcom/yingyonghui/market/provider/m;

    if-ne v1, v4, :cond_c

    .line 366
    :cond_b
    sget-object v1, Lcom/yingyonghui/market/provider/m;->l:Lcom/yingyonghui/market/provider/m;

    invoke-virtual {v3, v1}, Lcom/yingyonghui/market/provider/k;->a(Lcom/yingyonghui/market/provider/m;)V

    .line 370
    :goto_6
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailNews;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/yingyonghui/market/provider/k;->b(Landroid/content/ContentResolver;)V

    .line 372
    if-eqz v2, :cond_d

    .line 373
    invoke-virtual {v0, v10}, Landroid/widget/TextView;->setText(I)V

    .line 374
    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 375
    const-string v1, "download"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_4

    .line 368
    :cond_c
    sget-object v1, Lcom/yingyonghui/market/provider/m;->g:Lcom/yingyonghui/market/provider/m;

    invoke-virtual {v3, v1}, Lcom/yingyonghui/market/provider/k;->a(Lcom/yingyonghui/market/provider/m;)V

    goto :goto_6

    .line 377
    :cond_d
    const v1, 0x7f09006c

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 378
    const v1, 0x7f02004b

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 379
    const-string v1, "download"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_4

    .line 383
    :cond_e
    if-eqz v2, :cond_f

    .line 384
    invoke-virtual {v0, v10}, Landroid/widget/TextView;->setText(I)V

    .line 385
    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 386
    const-string v1, "download"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_4

    .line 387
    :cond_f
    if-eqz v3, :cond_10

    .line 388
    const v1, 0x7f090069

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 389
    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setBackgroundResource(I)V

    goto/16 :goto_4

    .line 391
    :cond_10
    const v1, 0x7f09006c

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 392
    const v1, 0x7f02004b

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 393
    const-string v1, "download"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_4

    :catch_1
    move-exception v2

    move v2, v3

    goto/16 :goto_5
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityDetailNews;Landroid/view/View;Lcom/yingyonghui/market/model/j;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 67
    invoke-direct {p0, p1, p2}, Lcom/yingyonghui/market/ActivityDetailNews;->a(Landroid/view/View;Lcom/yingyonghui/market/model/j;)V

    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityDetailNews;Lcom/yingyonghui/market/model/i;)V
    .locals 5
    .parameter
    .parameter

    .prologue
    .line 67
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->a:Lcom/yingyonghui/market/a/d;

    iget-object v1, p1, Lcom/yingyonghui/market/model/i;->a:Ljava/lang/String;

    const/16 v2, 0x67

    iget v3, p0, Lcom/yingyonghui/market/ActivityDetailNews;->g:I

    iget-object v4, p0, Lcom/yingyonghui/market/ActivityDetailNews;->b:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/yingyonghui/market/a/d;->b(Ljava/lang/String;IILandroid/os/Handler;)V

    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityDetailNews;Lcom/yingyonghui/market/model/j;)V
    .locals 10
    .parameter
    .parameter

    .prologue
    .line 67
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailNews;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/yingyonghui/market/util/GlobalUtil;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    iget-object v0, p1, Lcom/yingyonghui/market/model/j;->m:Ljava/lang/String;

    iget v1, p1, Lcom/yingyonghui/market/model/j;->s:I

    iget v2, p1, Lcom/yingyonghui/market/model/j;->e:I

    invoke-static {p0, v0, v1, v2}, Lcom/yingyonghui/market/util/t;->a(Landroid/content/Context;Ljava/lang/String;II)I

    move-result v0

    iput v0, p1, Lcom/yingyonghui/market/model/j;->n:I

    iget v0, p1, Lcom/yingyonghui/market/model/j;->n:I

    invoke-static {v0}, Lcom/yingyonghui/market/util/GlobalUtil;->a(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {p0}, Lcom/yingyonghui/market/downloader/n;->a(Landroid/content/Context;)Lcom/yingyonghui/market/downloader/n;

    move-result-object v0

    iget-object v1, p1, Lcom/yingyonghui/market/model/j;->g:Ljava/lang/String;

    iget v2, p1, Lcom/yingyonghui/market/model/j;->e:I

    iget-object v3, p1, Lcom/yingyonghui/market/model/j;->m:Ljava/lang/String;

    iget-object v4, p1, Lcom/yingyonghui/market/model/j;->i:Ljava/lang/String;

    iget v5, p1, Lcom/yingyonghui/market/model/j;->o:I

    iget-object v6, p1, Lcom/yingyonghui/market/model/j;->F:Ljava/lang/String;

    iget-object v9, p1, Lcom/yingyonghui/market/model/j;->f:Ljava/lang/String;

    invoke-virtual/range {v0 .. v9}, Lcom/yingyonghui/market/downloader/n;->a(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->u:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->u:Landroid/os/Handler;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_0
    return-void
.end method

.method public static a(Z)V
    .locals 0
    .parameter

    .prologue
    .line 108
    sput-boolean p0, Lcom/yingyonghui/market/ActivityDetailNews;->m:Z

    .line 109
    return-void
.end method

.method public static a()Z
    .locals 1

    .prologue
    .line 104
    sget-boolean v0, Lcom/yingyonghui/market/ActivityDetailNews;->m:Z

    return v0
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityDetailNews;)Landroid/widget/Button;
    .locals 1
    .parameter

    .prologue
    .line 67
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->k:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityDetailNews;I)Lcom/yingyonghui/market/log/m;
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 67
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->n:Lcom/yingyonghui/market/log/m;

    const-string v1, "index"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/yingyonghui/market/log/m;

    move-result-object v0

    return-object v0
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityDetailNews;Lcom/yingyonghui/market/model/c;)V
    .locals 5
    .parameter
    .parameter

    .prologue
    .line 67
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->a:Lcom/yingyonghui/market/a/d;

    iget v1, p1, Lcom/yingyonghui/market/model/c;->a:I

    const/4 v2, 0x0

    const/16 v3, 0x65

    iget-object v4, p0, Lcom/yingyonghui/market/ActivityDetailNews;->b:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/yingyonghui/market/a/d;->a(ILjava/lang/String;ILandroid/os/Handler;)V

    return-void
.end method

.method static synthetic c(Lcom/yingyonghui/market/ActivityDetailNews;)Lcom/yingyonghui/market/log/m;
    .locals 1
    .parameter

    .prologue
    .line 67
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->n:Lcom/yingyonghui/market/log/m;

    return-object v0
.end method

.method static synthetic d(Lcom/yingyonghui/market/ActivityDetailNews;)Landroid/widget/ImageView;
    .locals 3
    .parameter

    .prologue
    .line 67
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->l:Landroid/view/LayoutInflater;

    const v1, 0x7f03004c

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic e(Lcom/yingyonghui/market/ActivityDetailNews;)Ljava/util/HashMap;
    .locals 1
    .parameter

    .prologue
    .line 67
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->d:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic f(Lcom/yingyonghui/market/ActivityDetailNews;)Ljava/util/HashMap;
    .locals 1
    .parameter

    .prologue
    .line 67
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->f:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic g(Lcom/yingyonghui/market/ActivityDetailNews;)I
    .locals 1
    .parameter

    .prologue
    .line 67
    iget v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->h:I

    return v0
.end method

.method static synthetic h(Lcom/yingyonghui/market/ActivityDetailNews;)I
    .locals 1
    .parameter

    .prologue
    .line 67
    iget v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->h:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->h:I

    return v0
.end method

.method static synthetic i(Lcom/yingyonghui/market/ActivityDetailNews;)Ljava/util/HashMap;
    .locals 1
    .parameter

    .prologue
    .line 67
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->c:Ljava/util/HashMap;

    return-object v0
.end method


# virtual methods
.method protected final a(Landroid/os/Message;)V
    .locals 13
    .parameter

    .prologue
    const/16 v6, 0x66

    const/16 v12, 0x8

    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 467
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/yingyonghui/market/a/a;

    .line 468
    iget v1, v0, Lcom/yingyonghui/market/a/a;->c:I

    .line 469
    const/16 v2, 0x64

    if-ne v1, v2, :cond_c

    .line 470
    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/yingyonghui/market/a/d;->d(Ljava/lang/String;)Lcom/yingyonghui/market/model/a;

    move-result-object v2

    .line 472
    if-eqz v2, :cond_a

    invoke-virtual {v2}, Lcom/yingyonghui/market/model/a;->b()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 473
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->t:Lcom/yingyonghui/market/ck;

    if-nez v0, :cond_7

    .line 474
    invoke-virtual {v2}, Lcom/yingyonghui/market/model/a;->a()Lcom/yingyonghui/market/model/b;

    move-result-object v3

    .line 475
    if-eqz v3, :cond_0

    .line 476
    iget-object v4, p0, Lcom/yingyonghui/market/ActivityDetailNews;->j:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->l:Landroid/view/LayoutInflater;

    const v1, 0x7f030038

    const/4 v5, 0x0

    invoke-virtual {v0, v1, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    const v0, 0x7f0b00d4

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, v3, Lcom/yingyonghui/market/model/b;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, 0x7f0b00d7

    invoke-virtual {v5, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iget-boolean v6, v3, Lcom/yingyonghui/market/model/b;->e:Z

    if-eqz v6, :cond_1

    const v0, 0x7f02002e

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v1, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_0
    const v0, 0x7f0b00d8

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailNews;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v6, 0x7f0900f2

    new-array v7, v10, [Ljava/lang/Object;

    iget-object v8, v3, Lcom/yingyonghui/market/model/b;->f:Ljava/lang/String;

    aput-object v8, v7, v9

    invoke-virtual {v1, v6, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0b00d9

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailNews;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v6, 0x7f0900f3

    new-array v7, v10, [Ljava/lang/Object;

    iget v3, v3, Lcom/yingyonghui/market/model/b;->g:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v7, v9

    invoke-virtual {v1, v6, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v4, v5}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 480
    :cond_0
    invoke-virtual {v2}, Lcom/yingyonghui/market/model/a;->b()Ljava/util/ArrayList;

    move-result-object v1

    .line 481
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v10

    move v5, v9

    :goto_1
    if-ge v5, v3, :cond_4

    .line 482
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/g;

    .line 483
    iget-object v6, v0, Lcom/yingyonghui/market/model/g;->b:Ljava/lang/String;

    const-string v7, "null"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_11

    .line 484
    iput v4, v0, Lcom/yingyonghui/market/model/g;->a:I

    .line 485
    add-int/lit8 v0, v4, 0x1

    .line 481
    :goto_2
    add-int/lit8 v4, v5, 0x1

    move v5, v4

    move v4, v0

    goto :goto_1

    .line 476
    :cond_1
    iget-boolean v6, v3, Lcom/yingyonghui/market/model/b;->d:Z

    if-eqz v6, :cond_2

    const v0, 0x7f020025

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v1, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    :cond_2
    iget-boolean v6, v3, Lcom/yingyonghui/market/model/b;->c:Z

    if-eqz v6, :cond_3

    const v0, 0x7f020026

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {v1, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_0

    :cond_3
    invoke-virtual {v0, v9, v9, v9, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v1, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_0

    .line 489
    :cond_4
    new-instance v0, Lcom/yingyonghui/market/ck;

    invoke-virtual {v2}, Lcom/yingyonghui/market/model/a;->b()Ljava/util/ArrayList;

    move-result-object v1

    invoke-direct {v0, p0, p0, v1}, Lcom/yingyonghui/market/ck;-><init>(Lcom/yingyonghui/market/ActivityDetailNews;Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->t:Lcom/yingyonghui/market/ck;

    .line 490
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->j:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailNews;->t:Lcom/yingyonghui/market/ck;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 500
    :goto_3
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailNews;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailNews;->n:Lcom/yingyonghui/market/log/m;

    invoke-virtual {v2}, Lcom/yingyonghui/market/model/a;->b()Ljava/util/ArrayList;

    move-result-object v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/g;

    iget-object v0, v0, Lcom/yingyonghui/market/model/g;->c:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_6
    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/d;

    iget v6, v0, Lcom/yingyonghui/market/model/d;->b:I

    if-ne v6, v11, :cond_6

    check-cast v0, Lcom/yingyonghui/market/model/c;

    iget v0, v0, Lcom/yingyonghui/market/model/c;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 492
    :cond_7
    invoke-virtual {v2}, Lcom/yingyonghui/market/model/a;->b()Ljava/util/ArrayList;

    move-result-object v0

    .line 493
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v3, v9

    :goto_5
    if-ge v3, v1, :cond_8

    .line 494
    iget-object v4, p0, Lcom/yingyonghui/market/ActivityDetailNews;->t:Lcom/yingyonghui/market/ck;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/yingyonghui/market/ck;->add(Ljava/lang/Object;)V

    .line 493
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 497
    :cond_8
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->t:Lcom/yingyonghui/market/ck;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ck;->notifyDataSetChanged()V

    goto :goto_3

    .line 500
    :cond_9
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v3, v0, v2}, Lcom/yingyonghui/market/log/h;->b(Lcom/yingyonghui/market/log/m;ILjava/util/List;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 503
    :cond_a
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->i:Landroid/view/View;

    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    .line 504
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->j:Landroid/widget/ListView;

    invoke-virtual {v0, v9}, Landroid/widget/ListView;->setVisibility(I)V

    .line 590
    :cond_b
    :goto_6
    return-void

    .line 505
    :cond_c
    const/16 v2, 0x65

    if-ne v1, v2, :cond_d

    .line 507
    iget-object v1, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-static {p0, v1}, Lcom/yingyonghui/market/a/d;->c(Landroid/content/Context;Ljava/lang/String;)Lcom/yingyonghui/market/model/j;

    move-result-object v2

    .line 508
    if-eqz v2, :cond_b

    .line 509
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailNews;->d:Ljava/util/HashMap;

    iget v3, v0, Lcom/yingyonghui/market/a/a;->d:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yingyonghui/market/j;

    .line 510
    iput-object v2, v1, Lcom/yingyonghui/market/j;->a:Lcom/yingyonghui/market/model/j;

    .line 511
    iput-boolean v9, v1, Lcom/yingyonghui/market/j;->b:Z

    .line 512
    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailNews;->d:Ljava/util/HashMap;

    iget v4, v0, Lcom/yingyonghui/market/a/a;->d:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 514
    iget-object v1, v2, Lcom/yingyonghui/market/model/j;->f:Ljava/lang/String;

    iget v3, v2, Lcom/yingyonghui/market/model/j;->e:I

    iget-object v4, p0, Lcom/yingyonghui/market/ActivityDetailNews;->a:Lcom/yingyonghui/market/a/d;

    iget-object v5, p0, Lcom/yingyonghui/market/ActivityDetailNews;->b:Landroid/os/Handler;

    invoke-virtual {v4, v1, v6, v3, v5}, Lcom/yingyonghui/market/a/d;->b(Ljava/lang/String;IILandroid/os/Handler;)V

    .line 516
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailNews;->j:Landroid/widget/ListView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "app"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v0, v0, Lcom/yingyonghui/market/a/a;->d:I

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 517
    if-eqz v0, :cond_b

    .line 518
    invoke-direct {p0, v0, v2}, Lcom/yingyonghui/market/ActivityDetailNews;->a(Landroid/view/View;Lcom/yingyonghui/market/model/j;)V

    goto :goto_6

    .line 523
    :cond_d
    if-ne v1, v6, :cond_f

    .line 525
    :try_start_0
    iget-object v1, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    .line 526
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 527
    const/4 v3, 0x2

    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 528
    const/4 v2, 0x0

    array-length v3, v1

    invoke-static {v1, v2, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 529
    if-eqz v1, :cond_e

    .line 530
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 531
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    iget v1, v0, Lcom/yingyonghui/market/a/a;->d:I

    invoke-static {v1, v2}, Lcom/yingyonghui/market/util/y;->a(ILandroid/graphics/drawable/Drawable;)V

    .line 533
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailNews;->j:Landroid/widget/ListView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "app"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v0, v0, Lcom/yingyonghui/market/a/a;->d:I

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 534
    if-eqz v0, :cond_e

    .line 535
    const v1, 0x7f0b003f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/ImageView;

    .line 536
    if-eqz p0, :cond_e

    .line 537
    invoke-virtual {p0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 538
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 542
    :cond_e
    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_6

    .line 545
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/OutOfMemoryError;->printStackTrace()V

    .line 547
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {}, Lcom/yingyonghui/market/util/y;->b()V

    .line 548
    invoke-static {}, Ljava/lang/System;->gc()V

    goto/16 :goto_6

    .line 551
    :cond_f
    const/16 v2, 0x67

    if-ne v1, v2, :cond_b

    .line 553
    :try_start_1
    iget-object v1, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    .line 554
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 555
    const/4 v3, 0x1

    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 556
    const/4 v3, 0x0

    array-length v4, v1

    invoke-static {v1, v3, v4, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 558
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 559
    iget v2, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 560
    if-lez v3, :cond_b

    if-lez v2, :cond_b

    .line 561
    invoke-static {p0}, Lcom/yingyonghui/market/util/p;->d(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v2

    .line 562
    iget v4, v2, Landroid/graphics/Rect;->right:I

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/16 v4, 0xa0

    sub-int/2addr v2, v4

    move v4, v3

    move v3, v10

    .line 565
    :goto_7
    div-int/lit8 v5, v4, 0x2

    if-lt v5, v2, :cond_10

    .line 566
    div-int/lit8 v4, v4, 0x2

    .line 564
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 568
    :cond_10
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 569
    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 570
    const/4 v3, 0x0

    array-length v4, v1

    invoke-static {v1, v3, v4, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 571
    if-eqz v1, :cond_b

    .line 572
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 573
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/yingyonghui/market/util/y;->a(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 574
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->t:Lcom/yingyonghui/market/ck;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ck;->notifyDataSetChanged()V
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_6

    .line 583
    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/OutOfMemoryError;->printStackTrace()V

    .line 585
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {}, Lcom/yingyonghui/market/util/y;->b()V

    .line 586
    invoke-static {}, Ljava/lang/System;->gc()V

    goto/16 :goto_6

    :cond_11
    move v0, v4

    goto/16 :goto_2
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2
    .parameter

    .prologue
    .line 199
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    .line 200
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 209
    :cond_0
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    :goto_0
    return v0

    .line 202
    :pswitch_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 203
    const-class v1, Lcom/yingyonghui/market/ActivityTab4Search;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 204
    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailNews;->startActivity(Landroid/content/Intent;)V

    .line 205
    const/4 v0, 0x1

    goto :goto_0

    .line 200
    nop

    :pswitch_data_0
    .packed-switch 0x54
        :pswitch_0
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter

    .prologue
    .line 628
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 673
    :goto_0
    return-void

    .line 630
    :sswitch_0
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailNews;->finish()V

    .line 631
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {}, Lcom/yingyonghui/market/util/y;->b()V

    goto :goto_0

    .line 635
    :sswitch_1
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->s:Ljava/lang/String;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListNews;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 636
    if-nez v0, :cond_0

    .line 637
    const v0, 0x7f090165

    invoke-static {p0, v0}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto :goto_0

    .line 640
    :cond_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 641
    const-class v2, Lcom/yingyonghui/market/ActivityDetailNews;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 642
    const-string v2, "url"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 643
    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/ActivityDetailNews;->startActivity(Landroid/content/Intent;)V

    .line 644
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailNews;->finish()V

    .line 645
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {}, Lcom/yingyonghui/market/util/y;->b()V

    .line 647
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailNews;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailNews;->n:Lcom/yingyonghui/market/log/m;

    const-string v2, "backward"

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/lang/String;)V

    goto :goto_0

    .line 651
    :sswitch_2
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->s:Ljava/lang/String;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListNews;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 653
    sget-boolean v1, Lcom/yingyonghui/market/ActivityDetailNews;->m:Z

    if-eqz v1, :cond_1

    .line 654
    new-instance v0, Landroid/content/Intent;

    const-string v1, "request_more_news_list"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 656
    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailNews;->sendBroadcast(Landroid/content/Intent;)V

    .line 658
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->k:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0

    .line 660
    :cond_1
    if-nez v0, :cond_2

    .line 661
    const v0, 0x7f090166

    invoke-static {p0, v0}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto :goto_0

    .line 665
    :cond_2
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 666
    const-class v2, Lcom/yingyonghui/market/ActivityDetailNews;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 667
    const-string v2, "url"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 668
    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/ActivityDetailNews;->startActivity(Landroid/content/Intent;)V

    .line 669
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailNews;->finish()V

    .line 670
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {}, Lcom/yingyonghui/market/util/y;->b()V

    .line 672
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailNews;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailNews;->n:Lcom/yingyonghui/market/log/m;

    const-string v2, "forward"

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 628
    :sswitch_data_0
    .sparse-switch
        0x7f0b0057 -> :sswitch_0
        0x7f0b00cf -> :sswitch_1
        0x7f0b00d0 -> :sswitch_2
    .end sparse-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .parameter

    .prologue
    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x1

    .line 113
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onCreate(Landroid/os/Bundle;)V

    .line 115
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "checkbox_screen_lock"

    invoke-interface {v0, v1, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 116
    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityDetailNews;->setRequestedOrientation(I)V

    .line 121
    :goto_0
    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityDetailNews;->requestWindowFeature(I)Z

    .line 122
    const v0, 0x103000a

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailNews;->setTheme(I)V

    .line 124
    if-nez p1, :cond_3

    .line 125
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailNews;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 126
    if-eqz v0, :cond_2

    const-string v1, "url"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->s:Ljava/lang/String;

    .line 131
    :goto_2
    const v0, 0x7f030034

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailNews;->setContentView(I)V

    .line 133
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->l:Landroid/view/LayoutInflater;

    .line 135
    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailNews;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->j:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->j:Landroid/widget/ListView;

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->j:Landroid/widget/ListView;

    const v1, 0x106000d

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelector(I)V

    invoke-static {}, Lcom/yingyonghui/market/util/p;->a()I

    move-result v0

    const/4 v1, 0x4

    if-le v0, v1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->j:Landroid/widget/ListView;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "setScrollbarFadingEnabled"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailNews;->j:Landroid/widget/ListView;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_3
    const v0, 0x7f0b00bb

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailNews;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->i:Landroid/view/View;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->i:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f0b0057

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailNews;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0b00d0

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailNews;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->k:Landroid/widget/Button;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->k:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0b00cf

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailNews;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 137
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->a:Lcom/yingyonghui/market/a/d;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailNews;->s:Ljava/lang/String;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailNews;->b:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/a/d;->b(Ljava/lang/String;Landroid/os/Handler;)V

    .line 139
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "request_news_list_complete"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailNews;->v:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/yingyonghui/market/ActivityDetailNews;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 141
    new-instance v0, Lcom/yingyonghui/market/log/m;

    const-string v1, "News"

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    const-string v1, "newsURL"

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailNews;->s:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/yingyonghui/market/log/m;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->n:Lcom/yingyonghui/market/log/m;

    .line 142
    return-void

    .line 118
    :cond_1
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailNews;->setRequestedOrientation(I)V

    goto/16 :goto_0

    :cond_2
    move-object v0, v3

    .line 126
    goto/16 :goto_1

    .line 128
    :cond_3
    const-string v0, "url"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->s:Ljava/lang/String;

    goto/16 :goto_2

    .line 135
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_3
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .parameter

    .prologue
    .line 182
    invoke-static {p1}, Lcom/yingyonghui/market/util/o;->a(Landroid/view/Menu;)Z

    .line 183
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->c:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 173
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->e:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 175
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onDestroy()V

    .line 177
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->v:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailNews;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 178
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter

    .prologue
    .line 188
    invoke-static {p0, p1}, Lcom/yingyonghui/market/util/o;->a(Landroid/app/Activity;Landroid/view/MenuItem;)Z

    .line 189
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 166
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onPause()V

    .line 167
    invoke-static {p0}, Lcom/a/a/c;->a(Landroid/content/Context;)V

    .line 168
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 152
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->t:Lcom/yingyonghui/market/ck;

    if-eqz v0, :cond_0

    .line 153
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailNews;->t:Lcom/yingyonghui/market/ck;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ck;->notifyDataSetChanged()V

    .line 155
    :cond_0
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onResume()V

    .line 156
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "checkbox_screen_lock"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 157
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailNews;->setRequestedOrientation(I)V

    .line 161
    :goto_0
    invoke-static {p0}, Lcom/a/a/c;->b(Landroid/content/Context;)V

    .line 162
    return-void

    .line 159
    :cond_1
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailNews;->setRequestedOrientation(I)V

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter

    .prologue
    .line 146
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 147
    const-string v0, "url"

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailNews;->s:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .prologue
    .line 194
    const/4 v0, 0x0

    return v0
.end method
