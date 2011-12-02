.class public Lcom/mappn/gfan/ui/ScreenshotActivity;
.super Landroid/app/Activity;


# instance fields
.field private inAnim:Landroid/view/animation/Animation;

.field private mClose:Landroid/widget/Button;

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mHandler:Landroid/os/Handler;

.field private mHideIndicator:Ljava/lang/Runnable;

.field private mIndex:I

.field private mIndicator:Landroid/widget/LinearLayout;

.field private mIndicatorDrawable:Landroid/widget/ImageView;

.field private mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

.field private mScreenShot:Landroid/widget/ImageView;

.field private mScreenShots:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private outAnim:Landroid/view/animation/Animation;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    new-instance v0, Lcom/mappn/gfan/ui/ScreenshotActivity$1;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/ScreenshotActivity$1;-><init>(Lcom/mappn/gfan/ui/ScreenshotActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/mappn/gfan/ui/ScreenshotActivity$4;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/ScreenshotActivity$4;-><init>(Lcom/mappn/gfan/ui/ScreenshotActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mHideIndicator:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/mappn/gfan/ui/ScreenshotActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->showPrevious()V

    return-void
.end method

.method static synthetic access$100(Lcom/mappn/gfan/ui/ScreenshotActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->showNext()V

    return-void
.end method

.method static synthetic access$200(Lcom/mappn/gfan/ui/ScreenshotActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->displayIndicator()V

    return-void
.end method

.method static synthetic access$300(Lcom/mappn/gfan/ui/ScreenshotActivity;)Landroid/view/animation/Animation;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->outAnim:Landroid/view/animation/Animation;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mappn/gfan/ui/ScreenshotActivity;)Landroid/widget/LinearLayout;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndicator:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method private displayIndicator()V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndicator:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mHideIndicator:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :goto_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mHideIndicator:Ljava/lang/Runnable;

    const-wide/16 v2, 0x5dc

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndicator:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->inAnim:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->startAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndicator:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method private displayScreenShot(I)V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mScreenShot:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mScreenShot:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v0, :cond_0

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_0
    if-eqz v1, :cond_1

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndicatorDrawable:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageLevel(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mScreenShots:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mScreenShot:Landroid/widget/ImageView;

    invoke-static {v1, v0, v2}, Lcom/mappn/gfan/common/util/ImageUtils;->downloadScreenShot(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->displayIndicator()V

    return-void
.end method

.method private initViews()V
    .locals 5

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v0, "extra.product.detail"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/ProductDetail;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    const-string v0, "extra.screenshot.id"

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndex:I

    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/vo/ProductDetail;->getScreenshot()[Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mScreenShots:Ljava/util/ArrayList;

    array-length v1, v0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    iget-object v4, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mScreenShots:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    const v0, 0x7f0c0069

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndicator:Landroid/widget/LinearLayout;

    const v0, 0x7f0c006a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndicatorDrawable:Landroid/widget/ImageView;

    new-instance v0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mScreenShots:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/mappn/gfan/common/widget/IndicatorDrawable;-><init>(Landroid/content/Context;IZ)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndicatorDrawable:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const v0, 0x7f0c0068

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mScreenShot:Landroid/widget/ImageView;

    const v0, 0x7f0c006b

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mClose:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mClose:Landroid/widget/Button;

    new-instance v1, Lcom/mappn/gfan/ui/ScreenshotActivity$2;

    invoke-direct {v1, p0}, Lcom/mappn/gfan/ui/ScreenshotActivity$2;-><init>(Lcom/mappn/gfan/ui/ScreenshotActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/high16 v0, 0x7f04

    invoke-static {p0, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->inAnim:Landroid/view/animation/Animation;

    const v0, 0x7f040001

    invoke-static {p0, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->outAnim:Landroid/view/animation/Animation;

    iget v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndex:I

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->displayScreenShot(I)V

    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/mappn/gfan/ui/ScreenshotActivity$3;

    invoke-direct {v2, p0}, Lcom/mappn/gfan/ui/ScreenshotActivity$3;-><init>(Lcom/mappn/gfan/ui/ScreenshotActivity;)V

    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mGestureDetector:Landroid/view/GestureDetector;

    return-void
.end method

.method private showNext()V
    .locals 3

    iget v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndex:I

    iget-object v1, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mScreenShots:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    if-ge v0, v1, :cond_0

    iget v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndex:I

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->displayScreenShot(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndicatorDrawable:Landroid/widget/ImageView;

    iget v1, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndex:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageLevel(I)V

    :cond_0
    return-void
.end method

.method private showPrevious()V
    .locals 2

    iget v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndex:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndex:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndex:I

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->displayScreenShot(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndicatorDrawable:Landroid/widget/ImageView;

    iget v1, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mIndex:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageLevel(I)V

    :cond_0
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f030043

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->setContentView(I)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->initViews()V

    return-void
.end method

.method protected onPause()V
    .locals 0

    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    invoke-static {p0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

    return-void
.end method

.method protected onResume()V
    .locals 0

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    invoke-static {p0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
