.class public Lcom/mappn/gfan/ui/ProductInfoActivity;
.super Lcom/mappn/gfan/common/widget/BaseActivity;


# instance fields
.field private isInit:Z

.field private mGallery:Lcom/mappn/gfan/common/widget/ScreenShotGallery;

.field private mIsShortDescription:Z

.field private mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

.field private mScreenShotClickListener:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->mIsShortDescription:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->isInit:Z

    new-instance v0, Lcom/mappn/gfan/ui/ProductInfoActivity$3;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/ProductInfoActivity$3;-><init>(Lcom/mappn/gfan/ui/ProductInfoActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->mScreenShotClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/mappn/gfan/ui/ProductInfoActivity;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->isInit:Z

    return v0
.end method

.method static synthetic access$002(Lcom/mappn/gfan/ui/ProductInfoActivity;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->isInit:Z

    return p1
.end method

.method static synthetic access$100(Lcom/mappn/gfan/ui/ProductInfoActivity;Landroid/widget/TextView;Landroid/widget/TextView;)Z
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/mappn/gfan/ui/ProductInfoActivity;->mesureDescription(Landroid/widget/TextView;Landroid/widget/TextView;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/mappn/gfan/ui/ProductInfoActivity;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->mIsShortDescription:Z

    return v0
.end method

.method static synthetic access$202(Lcom/mappn/gfan/ui/ProductInfoActivity;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->mIsShortDescription:Z

    return p1
.end method

.method static synthetic access$300(Lcom/mappn/gfan/ui/ProductInfoActivity;Landroid/widget/Button;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mappn/gfan/ui/ProductInfoActivity;->toogleMoreButton(Landroid/widget/Button;)V

    return-void
.end method

.method static synthetic access$400(Lcom/mappn/gfan/ui/ProductInfoActivity;)Lcom/mappn/gfan/common/vo/ProductDetail;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    return-object v0
.end method

.method private initGallery(Lcom/mappn/gfan/common/vo/ProductDetail;)V
    .locals 11

    const v10, 0x7f0c0052

    const/4 v9, 0x0

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getScreenshotLdpi()[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    move v3, v9

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v5, v1, v3

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_5

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    const/4 v1, 0x0

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    move v7, v9

    move-object v3, v1

    :goto_2
    if-ge v7, v6, :cond_5

    if-eqz v7, :cond_2

    const/4 v1, 0x2

    if-eq v7, v1, :cond_2

    const/4 v1, 0x4

    if-ne v7, v1, :cond_4

    :cond_2
    const v1, 0x7f030038

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->mGallery:Lcom/mappn/gfan/common/widget/ScreenShotGallery;

    invoke-virtual {v5, v1, v2, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Landroid/widget/LinearLayout;

    move-object v3, v0

    const v1, 0x7f0c0051

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->mScreenShotClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8, v2, v1}, Lcom/mappn/gfan/common/util/ImageUtils;->downloadDeatilScreenshot(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V

    const/4 v1, 0x1

    sub-int v1, v6, v1

    if-ne v7, v1, :cond_3

    invoke-virtual {v3, v10}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->mGallery:Lcom/mappn/gfan/common/widget/ScreenShotGallery;

    invoke-virtual {v1, v3}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->addChild(Landroid/widget/LinearLayout;)V

    :cond_3
    move-object v1, v3

    :goto_3
    add-int/lit8 v2, v7, 0x1

    move v7, v2

    move-object v3, v1

    goto :goto_2

    :cond_4
    invoke-virtual {v3, v10}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v8, v2, v1}, Lcom/mappn/gfan/common/util/ImageUtils;->downloadDeatilScreenshot(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->mScreenShotClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->mGallery:Lcom/mappn/gfan/common/widget/ScreenShotGallery;

    invoke-virtual {v1, v3}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->addChild(Landroid/widget/LinearLayout;)V

    move-object v1, v3

    goto :goto_3

    :cond_5
    return-void
.end method

.method private initProductInfo(Lcom/mappn/gfan/common/vo/ProductDetail;)V
    .locals 7

    const v0, 0x7f0c0054

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v6

    const v0, 0x7f0c007a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getLongDescription()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0c007b

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getLongDescription()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0c007d

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    const v0, 0x7f0c007c

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    new-instance v0, Lcom/mappn/gfan/ui/ProductInfoActivity$1;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/mappn/gfan/ui/ProductInfoActivity$1;-><init>(Lcom/mappn/gfan/ui/ProductInfoActivity;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/Button;)V

    invoke-virtual {v6, v0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    new-instance v0, Lcom/mappn/gfan/ui/ProductInfoActivity$2;

    invoke-direct {v0, p0, v2, v3, v5}, Lcom/mappn/gfan/ui/ProductInfoActivity$2;-><init>(Lcom/mappn/gfan/ui/ProductInfoActivity;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;)V

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0c0080

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getAppSize()I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/StringUtils;->formatSize(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0c0083

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getVersionName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0c0085

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getDownloadCount()I

    move-result v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/StringUtils;->getDownloadInterval(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0, p1}, Lcom/mappn/gfan/ui/ProductInfoActivity;->initGallery(Lcom/mappn/gfan/common/vo/ProductDetail;)V

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPermission()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    :goto_0
    new-instance v1, Lcom/mappn/gfan/common/util/AppSecurityPermissions;

    invoke-direct {v1, p0, v0}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;-><init>(Landroid/content/Context;[Ljava/lang/String;)V

    const v0, 0x7f0c007f

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->getPermissionsView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void

    :cond_0
    move-object v0, v1

    goto :goto_0
.end method

.method private mesureDescription(Landroid/widget/TextView;Landroid/widget/TextView;)Z
    .locals 4

    const/16 v3, 0x8

    const/4 v2, 0x0

    invoke-virtual {p1}, Landroid/widget/TextView;->getHeight()I

    move-result v0

    invoke-virtual {p2}, Landroid/widget/TextView;->getHeight()I

    move-result v1

    if-le v1, v0, :cond_0

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setVisibility(I)V

    move v0, v2

    goto :goto_0
.end method

.method private toogleMoreButton(Landroid/widget/Button;)V
    .locals 3

    invoke-virtual {p1}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const v1, 0x7f0900ac

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ProductInfoActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0900ad

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/ProductInfoActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p1, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "extra.product.detail"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/ProductDetail;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    const v0, 0x7f03004f

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->setContentView(I)V

    const v0, 0x7f0c0019

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->mGallery:Lcom/mappn/gfan/common/widget/ScreenShotGallery;

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->initProductInfo(Lcom/mappn/gfan/common/vo/ProductDetail;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onDestroy()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->mGallery:Lcom/mappn/gfan/common/widget/ScreenShotGallery;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->clear()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductInfoActivity;->mGallery:Lcom/mappn/gfan/common/widget/ScreenShotGallery;

    return-void
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onPause()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onResume()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductInfoActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    return-void
.end method
