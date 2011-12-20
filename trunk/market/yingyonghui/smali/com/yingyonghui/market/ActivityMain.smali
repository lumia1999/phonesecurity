.class public Lcom/yingyonghui/market/ActivityMain;
.super Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;
.source "ActivityMain.java"

# interfaces
.implements Landroid/widget/TabHost$OnTabChangeListener;


# static fields
.field public static c:Landroid/widget/TextView;

.field private static h:I

.field private static k:Landroid/widget/TabWidget;

.field private static m:Ljava/lang/String;

.field private static final n:[Ljava/lang/String;


# instance fields
.field private d:Landroid/view/LayoutInflater;

.field private e:Landroid/widget/TabHost;

.field private f:Landroid/widget/TabWidget;

.field private g:I

.field private i:Ljava/util/ArrayList;

.field private j:Landroid/content/pm/PackageManager;

.field private l:Lcom/yingyonghui/market/util/w;

.field private final o:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 81
    sput v2, Lcom/yingyonghui/market/ActivityMain;->h:I

    .line 88
    const-string v0, ""

    sput-object v0, Lcom/yingyonghui/market/ActivityMain;->m:Ljava/lang/String;

    .line 91
    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v2

    const/4 v1, 0x1

    const-string v2, "apkid"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "apkname"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "lastmodifiedtime"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "pkgname"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "permission"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "promotion_agent"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "promotion_id"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "pubkey_hash"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "rating"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "rating_count"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "size"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "version_code"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "version_name"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "apk_url"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "flg"

    aput-object v2, v0, v1

    sput-object v0, Lcom/yingyonghui/market/ActivityMain;->n:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;-><init>()V

    .line 718
    new-instance v0, Lcom/yingyonghui/market/v;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/v;-><init>(Lcom/yingyonghui/market/ActivityMain;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->o:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method private a(I)V
    .locals 9
    .parameter

    .prologue
    const/4 v6, 0x4

    const/4 v2, 0x0

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 524
    if-nez p1, :cond_0

    .line 525
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 526
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 527
    iget-object v2, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 528
    iget-object v3, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 529
    iget-object v4, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    move-object v7, v4

    move-object v4, v1

    move-object v1, v7

    move-object v8, v2

    move-object v2, v3

    move-object v3, v8

    .line 556
    :goto_0
    const v5, 0x7f02009f

    invoke-virtual {v0, v5}, Landroid/view/View;->setBackgroundResource(I)V

    .line 557
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 558
    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 559
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 560
    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 561
    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 565
    const v5, 0x7f0b010e

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/4 v5, -0x1

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 566
    const v0, 0x7f0b010e

    invoke-virtual {v4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f08000f

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 567
    const v0, 0x7f0b010e

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f08000f

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 568
    const v0, 0x7f0b010e

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f08000f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 569
    const v0, 0x7f0b010e

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f08000f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 572
    iput p1, p0, Lcom/yingyonghui/market/ActivityMain;->g:I

    .line 573
    return-void

    .line 530
    :cond_0
    if-ne p1, v3, :cond_1

    .line 531
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 532
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 533
    iget-object v2, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 534
    iget-object v3, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 535
    iget-object v4, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    move-object v7, v4

    move-object v4, v1

    move-object v1, v7

    move-object v8, v2

    move-object v2, v3

    move-object v3, v8

    goto/16 :goto_0

    .line 536
    :cond_1
    if-ne p1, v4, :cond_2

    .line 537
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 538
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 539
    iget-object v2, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 540
    iget-object v3, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 541
    iget-object v4, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    move-object v7, v4

    move-object v4, v1

    move-object v1, v7

    move-object v8, v2

    move-object v2, v3

    move-object v3, v8

    goto/16 :goto_0

    .line 542
    :cond_2
    if-ne p1, v5, :cond_3

    .line 543
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 544
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 545
    iget-object v2, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 546
    iget-object v3, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 547
    iget-object v4, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    move-object v7, v4

    move-object v4, v1

    move-object v1, v7

    move-object v8, v2

    move-object v2, v3

    move-object v3, v8

    goto/16 :goto_0

    .line 549
    :cond_3
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 550
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 551
    iget-object v2, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 552
    iget-object v3, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 553
    iget-object v4, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    move-object v7, v4

    move-object v4, v1

    move-object v1, v7

    move-object v8, v2

    move-object v2, v3

    move-object v3, v8

    goto/16 :goto_0
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityMain;)V
    .locals 3
    .parameter

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityMain;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-static {v0}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/pm/PackageManager;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityMain;->a:Lcom/yingyonghui/market/a/d;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityMain;->b:Landroid/os/Handler;

    invoke-virtual {v1, v0, v2}, Lcom/yingyonghui/market/a/d;->a(Ljava/util/ArrayList;Landroid/os/Handler;)V

    return-void
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityMain;)Landroid/content/pm/PackageManager;
    .locals 1
    .parameter

    .prologue
    .line 58
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->j:Landroid/content/pm/PackageManager;

    return-object v0
.end method

.method static synthetic b()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    sget-object v0, Lcom/yingyonghui/market/ActivityMain;->n:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic c()I
    .locals 2

    .prologue
    .line 58
    sget v0, Lcom/yingyonghui/market/ActivityMain;->h:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/yingyonghui/market/ActivityMain;->h:I

    return v0
.end method

.method static synthetic c(Lcom/yingyonghui/market/ActivityMain;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 58
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic d()I
    .locals 1

    .prologue
    .line 58
    sget v0, Lcom/yingyonghui/market/ActivityMain;->h:I

    return v0
.end method

.method static synthetic e()I
    .locals 2

    .prologue
    .line 58
    sget v0, Lcom/yingyonghui/market/ActivityMain;->h:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    sput v0, Lcom/yingyonghui/market/ActivityMain;->h:I

    return v0
.end method

.method private f()V
    .locals 4

    .prologue
    .line 700
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityMain;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v0

    .line 701
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityMain;->f:Landroid/widget/TabWidget;

    invoke-virtual {v1}, Landroid/widget/TabWidget;->getChildCount()I

    move-result v1

    .line 702
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    div-int/2addr v0, v1

    const/4 v3, -0x2

    invoke-direct {v2, v0, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 703
    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    .line 704
    iget-object v3, p0, Lcom/yingyonghui/market/ActivityMain;->f:Landroid/widget/TabWidget;

    invoke-virtual {v3, v0}, Landroid/widget/TabWidget;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 703
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 705
    :cond_0
    return-void
.end method

.method private g()V
    .locals 1

    .prologue
    .line 715
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->o:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityMain;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 716
    return-void
.end method


# virtual methods
.method protected final a(Landroid/os/Message;)V
    .locals 2
    .parameter

    .prologue
    .line 323
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/yingyonghui/market/a/a;

    .line 324
    iget v1, v0, Lcom/yingyonghui/market/a/a;->c:I

    packed-switch v1, :pswitch_data_0

    .line 499
    :goto_0
    return-void

    .line 326
    :pswitch_0
    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/yingyonghui/market/a/d;->e(Landroid/content/Context;Ljava/lang/String;)Lcom/yingyonghui/market/model/l;

    move-result-object v0

    .line 327
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityMain;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/yingyonghui/market/MarketApplication;

    .line 328
    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/MarketApplication;->a(Lcom/yingyonghui/market/model/l;)V

    goto :goto_0

    .line 333
    :pswitch_1
    new-instance v1, Lcom/yingyonghui/market/w;

    invoke-direct {v1, p0, v0}, Lcom/yingyonghui/market/w;-><init>(Lcom/yingyonghui/market/ActivityMain;Lcom/yingyonghui/market/a/a;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/yingyonghui/market/w;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 324
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 3
    .parameter

    .prologue
    const/4 v1, 0x3

    const/4 v2, 0x1

    .line 268
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    .line 269
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 281
    :cond_0
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    :goto_0
    return v0

    .line 271
    :sswitch_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-class v1, Lcom/yingyonghui/market/ActivityWarningExit;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/yingyonghui/market/ActivityMain;->startActivityForResult(Landroid/content/Intent;I)V

    move v0, v2

    .line 272
    goto :goto_0

    .line 274
    :sswitch_1
    const-string v0, "search"

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityMain;->onTabChanged(Ljava/lang/String;)V

    .line 275
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->f:Landroid/widget/TabWidget;

    invoke-virtual {v0, v1}, Landroid/widget/TabWidget;->setCurrentTab(I)V

    .line 276
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->f:Landroid/widget/TabWidget;

    invoke-virtual {v0, v1}, Landroid/widget/TabWidget;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->performClick()Z

    move v0, v2

    .line 277
    goto :goto_0

    .line 269
    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_0
        0x54 -> :sswitch_1
    .end sparse-switch
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 252
    invoke-super {p0, p1, p2, p3}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 253
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 254
    invoke-static {p0}, Lcom/yingyonghui/market/a/e;->a(Landroid/content/Context;)Lcom/yingyonghui/market/a/e;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/a/e;->a()V

    .line 255
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityMain;->g()V

    .line 256
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 258
    :cond_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .parameter

    .prologue
    .line 240
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityMain;->f()V

    .line 241
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 242
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 9
    .parameter

    .prologue
    const v8, 0x7f03004f

    const/4 v7, -0x1

    const/4 v6, -0x2

    const/high16 v5, 0x3f80

    const/4 v4, 0x0

    .line 114
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onCreate(Landroid/os/Bundle;)V

    .line 117
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityMain;->requestWindowFeature(I)Z

    .line 119
    const v0, 0x7f030032

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityMain;->setContentView(I)V

    .line 121
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->d:Landroid/view/LayoutInflater;

    .line 122
    new-instance v0, Lcom/yingyonghui/market/util/w;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/util/w;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->l:Lcom/yingyonghui/market/util/w;

    .line 125
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityMain;->getTabHost()Landroid/widget/TabHost;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->e:Landroid/widget/TabHost;

    .line 126
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->e:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->f:Landroid/widget/TabWidget;

    .line 127
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->f:Landroid/widget/TabWidget;

    sput-object v0, Lcom/yingyonghui/market/ActivityMain;->k:Landroid/widget/TabWidget;

    .line 128
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityMain;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->j:Landroid/content/pm/PackageManager;

    .line 129
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->d:Landroid/view/LayoutInflater;

    invoke-virtual {v0, v8, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const v0, 0x7f0b010e

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f090002

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    const v0, 0x7f0b010d

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v2, 0x7f020030

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v6, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->e:Landroid/widget/TabHost;

    const-string v2, "featured"

    invoke-virtual {v0, v2}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/yingyonghui/market/ActivityTab1Featured;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v2}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityMain;->e:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->d:Landroid/view/LayoutInflater;

    invoke-virtual {v0, v8, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const v0, 0x7f0b010e

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f090003

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    const v0, 0x7f0b010d

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v2, 0x7f02002f

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v6, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->e:Landroid/widget/TabHost;

    const-string v2, "top"

    invoke-virtual {v0, v2}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/yingyonghui/market/ActivityTab2Top;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v2}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityMain;->e:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->d:Landroid/view/LayoutInflater;

    invoke-virtual {v0, v8, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const v0, 0x7f0b010e

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f090004

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    const v0, 0x7f0b010d

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v2, 0x7f020029

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v6, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->e:Landroid/widget/TabHost;

    const-string v2, "category"

    invoke-virtual {v0, v2}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/yingyonghui/market/ActivityTab3Category;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v2}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityMain;->e:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->d:Landroid/view/LayoutInflater;

    invoke-virtual {v0, v8, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const v0, 0x7f0b010e

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f0900c6

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    const v0, 0x7f0b010d

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v2, 0x7f020032

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v6, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->e:Landroid/widget/TabHost;

    const-string v2, "search"

    invoke-virtual {v0, v2}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/yingyonghui/market/ActivityTab4Search;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v2}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityMain;->e:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->d:Landroid/view/LayoutInflater;

    invoke-virtual {v0, v8, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const v0, 0x7f0b010e

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f090005

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    const v0, 0x7f0b010d

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v2, 0x7f02002b

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v6, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->e:Landroid/widget/TabHost;

    const-string v2, "manage"

    invoke-virtual {v0, v2}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/yingyonghui/market/ActivityTab5Manage;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v2}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityMain;->e:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    sget-object v0, Lcom/yingyonghui/market/ActivityMain;->c:Landroid/widget/TextView;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->i:Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    const v1, 0x7f0b010f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewStub;

    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sput-object v0, Lcom/yingyonghui/market/ActivityMain;->c:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityMain;->f()V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->e:Landroid/widget/TabHost;

    invoke-virtual {v0, p0}, Landroid/widget/TabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/yingyonghui/market/ActivityMain;->a(I)V

    .line 131
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityMain;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/MarketApplication;

    .line 134
    const-string v1, "abtest_tag_002"

    const-string v2, "a"

    invoke-static {p0, v1, v2}, Lcom/yingyonghui/market/util/k;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/yingyonghui/market/ActivityMain;->m:Ljava/lang/String;

    .line 137
    invoke-static {p0}, Lcom/yingyonghui/market/util/g;->a(Landroid/content/Context;)Z

    move-result v1

    .line 138
    invoke-static {p0}, Lcom/yingyonghui/market/util/g;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "WiFi"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 139
    if-eqz v1, :cond_1

    if-nez v2, :cond_1

    .line 140
    const-string v1, "show_display_icons_dialog"

    const-string v2, "setting"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v2, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 142
    const-string v1, "checkbox_display_icons"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/yingyonghui/market/util/k;->a(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 144
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 145
    const-class v2, Lcom/yingyonghui/market/ActivityWarningShowIcon;

    invoke-virtual {v1, p0, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 146
    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/ActivityMain;->startActivity(Landroid/content/Intent;)V

    .line 151
    :cond_1
    invoke-static {p0}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 152
    invoke-virtual {v0}, Lcom/yingyonghui/market/MarketApplication;->b()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 153
    const/16 v0, 0x64

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityMain;->showDialog(I)V

    .line 180
    :cond_2
    :goto_0
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.PACKAGE_ADDED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "package"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityMain;->o:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/yingyonghui/market/ActivityMain;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 183
    sget-object v0, Lcom/feedback/a;->a:Lcom/feedback/a;

    invoke-static {p0, v0}, Lcom/feedback/e;->a(Landroid/content/Context;Lcom/feedback/a;)V

    .line 185
    new-instance v0, Lcom/yingyonghui/market/y;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/y;-><init>(Lcom/yingyonghui/market/ActivityMain;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/y;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 197
    return-void

    .line 156
    :cond_3
    const-string v0, "check_market_not_allow_install"

    invoke-static {p0, v0}, Lcom/yingyonghui/market/util/k;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 158
    new-instance v0, Lcom/yingyonghui/market/eo;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/eo;-><init>(Landroid/content/Context;)V

    .line 159
    const v1, 0x7f09007f

    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/eo;->setTitle(Ljava/lang/CharSequence;)V

    .line 160
    const v1, 0x7f0900f5

    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/eo;->a(Ljava/lang/CharSequence;)V

    .line 161
    const v1, 0x7f0900f6

    new-instance v2, Lcom/yingyonghui/market/ac;

    invoke-direct {v2, p0}, Lcom/yingyonghui/market/ac;-><init>(Lcom/yingyonghui/market/ActivityMain;)V

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/eo;->a(ILcom/yingyonghui/market/bs;)Lcom/yingyonghui/market/eo;

    .line 174
    const/high16 v1, 0x104

    invoke-virtual {v0, v1, v4}, Lcom/yingyonghui/market/eo;->a(ILcom/yingyonghui/market/f;)Lcom/yingyonghui/market/eo;

    .line 175
    invoke-virtual {v0}, Lcom/yingyonghui/market/eo;->show()V

    goto :goto_0
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 4
    .parameter

    .prologue
    const/4 v3, 0x0

    .line 286
    packed-switch p1, :pswitch_data_0

    .line 303
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->l:Lcom/yingyonghui/market/util/w;

    if-eqz v0, :cond_1

    .line 304
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->l:Lcom/yingyonghui/market/util/w;

    invoke-virtual {v0, p1}, Lcom/yingyonghui/market/util/w;->a(I)Landroid/app/Dialog;

    move-result-object v0

    .line 306
    :goto_0
    if-nez v0, :cond_0

    .line 307
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    .line 309
    :cond_0
    :goto_1
    return-object v0

    .line 288
    :pswitch_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x1080027

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f090056

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f090057

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f090054

    new-instance v2, Lcom/yingyonghui/market/x;

    invoke-direct {v2, p0}, Lcom/yingyonghui/market/x;-><init>(Lcom/yingyonghui/market/ActivityMain;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f090055

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto :goto_1

    :cond_1
    move-object v0, v3

    goto :goto_0

    .line 286
    nop

    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .parameter

    .prologue
    .line 689
    invoke-static {p1}, Lcom/yingyonghui/market/util/o;->a(Landroid/view/Menu;)Z

    .line 690
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 222
    invoke-static {p0}, Lcom/yingyonghui/market/a/e;->a(Landroid/content/Context;)Lcom/yingyonghui/market/a/e;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/a/e;->a(I)V

    .line 223
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityMain;->g()V

    .line 224
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onDestroy()V

    .line 225
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .parameter

    .prologue
    .line 246
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 247
    invoke-virtual {p0, p1}, Lcom/yingyonghui/market/ActivityMain;->setIntent(Landroid/content/Intent;)V

    .line 248
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter

    .prologue
    .line 695
    invoke-static {p0, p1}, Lcom/yingyonghui/market/util/o;->a(Landroid/app/Activity;Landroid/view/MenuItem;)Z

    .line 696
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 216
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onPause()V

    .line 217
    invoke-static {p0}, Lcom/a/a/c;->a(Landroid/content/Context;)V

    .line 218
    return-void
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 315
    invoke-super {p0, p1, p2}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onPrepareDialog(ILandroid/app/Dialog;)V

    .line 316
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->l:Lcom/yingyonghui/market/util/w;

    if-eqz v0, :cond_0

    .line 317
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->l:Lcom/yingyonghui/market/util/w;

    invoke-virtual {v0, p1, p2}, Lcom/yingyonghui/market/util/w;->a(ILandroid/app/Dialog;)V

    .line 319
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x4

    .line 201
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onResume()V

    .line 202
    invoke-static {p0}, Lcom/a/a/c;->b(Landroid/content/Context;)V

    .line 204
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityMain;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "tabId"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 205
    if-ne v0, v2, :cond_0

    .line 206
    invoke-static {p0}, Lcom/yingyonghui/market/a/e;->a(Landroid/content/Context;)Lcom/yingyonghui/market/a/e;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/a/e;->a()V

    .line 207
    const-string v0, "manage"

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityMain;->onTabChanged(Ljava/lang/String;)V

    .line 208
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->f:Landroid/widget/TabWidget;

    invoke-virtual {v0, v2}, Landroid/widget/TabWidget;->setCurrentTab(I)V

    .line 209
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->f:Landroid/widget/TabWidget;

    invoke-virtual {v0, v2}, Landroid/widget/TabWidget;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->performClick()Z

    .line 210
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityMain;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "tabId"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 212
    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter

    .prologue
    .line 262
    const-string v0, "checked_self_update"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 263
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 264
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .prologue
    .line 235
    const/4 v0, 0x0

    return v0
.end method

.method protected onStart()V
    .locals 1

    .prologue
    .line 229
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onStart()V

    .line 230
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityMain;->j:Landroid/content/pm/PackageManager;

    invoke-static {p0, v0}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;Landroid/content/pm/PackageManager;)V

    .line 231
    return-void
.end method

.method public onTabChanged(Ljava/lang/String;)V
    .locals 2
    .parameter

    .prologue
    .line 579
    const-string v0, "featured"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 580
    const/4 v0, 0x0

    .line 591
    :goto_0
    invoke-direct {p0, v0}, Lcom/yingyonghui/market/ActivityMain;->a(I)V

    .line 592
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityMain;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->a(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 593
    return-void

    .line 581
    :cond_0
    const-string v0, "top"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 582
    const/4 v0, 0x1

    goto :goto_0

    .line 583
    :cond_1
    const-string v0, "category"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 584
    const/4 v0, 0x2

    goto :goto_0

    .line 585
    :cond_2
    const-string v0, "search"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 586
    const/4 v0, 0x3

    goto :goto_0

    .line 588
    :cond_3
    const/4 v0, 0x4

    goto :goto_0
.end method
