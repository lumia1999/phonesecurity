.class public Lcom/mappn/gfan/common/widget/ScreenShotGallery;
.super Landroid/widget/LinearLayout;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/common/widget/ScreenShotGallery$PageScrollListener;
    }
.end annotation


# static fields
.field private static final INVALID_SCREEN:I = -0x1

.field private static final SNAP_VELOCITY:I = 0x3e8

.field private static final TOUCH_STATE_REST:I = 0x0

.field private static final TOUCH_STATE_SCROLLING:I = 0x1


# instance fields
.field private mAllowLongPress:Z

.field private mCurrentScreen:I

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mLastMotionX:F

.field private mLastMotionY:F

.field private mMaximumVelocity:I

.field private mNextScreen:I

.field private mScrollListener:Lcom/mappn/gfan/common/widget/ScreenShotGallery$PageScrollListener;

.field private mScroller:Landroid/widget/Scroller;

.field private mTouchSlop:I

.field private mTouchState:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->requestDisallowInterceptTouchEvent(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, -0x1

    iput v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mNextScreen:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mTouchState:I

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->init()V

    return-void
.end method

.method private init()V
    .locals 3

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/widget/Scroller;

    invoke-direct {v1, v0}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mScroller:Landroid/widget/Scroller;

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->setFocusable(Z)V

    const/high16 v1, 0x4

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->setDescendantFocusability(I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->setWillNotDraw(Z)V

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v2

    iput v2, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mTouchSlop:I

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v1

    iput v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mMaximumVelocity:I

    new-instance v1, Landroid/view/GestureDetector;

    new-instance v2, Lcom/mappn/gfan/common/widget/ScreenShotGallery$1;

    invoke-direct {v2, p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery$1;-><init>(Lcom/mappn/gfan/common/widget/ScreenShotGallery;)V

    invoke-direct {v1, v0, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mGestureDetector:Landroid/view/GestureDetector;

    return-void
.end method

.method private snapToDestination()V
    .locals 3

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getScrollX()I

    move-result v1

    div-int/lit8 v2, v0, 0x2

    add-int/2addr v1, v2

    div-int v0, v1, v0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->snapToScreen(I)V

    return-void
.end method


# virtual methods
.method public addChild(Landroid/widget/LinearLayout;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->addView(Landroid/view/View;)V

    return-void
.end method

.method public clear()V
    .locals 11

    const/4 v10, 0x0

    const/4 v9, 0x0

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getChildCount()I

    move-result v5

    move v6, v9

    :goto_0
    if-ge v6, v5, :cond_3

    invoke-virtual {p0, v6}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v7

    move v8, v9

    :goto_1
    if-ge v8, v7, :cond_2

    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_1

    move-object v0, v4

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    move-object v3, v0

    invoke-virtual {v3}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    :cond_0
    invoke-virtual {v4, v10}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_1
    invoke-virtual {v2, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    add-int/lit8 v2, v8, 0x1

    move v8, v2

    goto :goto_1

    :cond_2
    add-int/lit8 v1, v6, 0x1

    move v6, v1

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->removeAllViews()V

    return-void
.end method

.method public computeScroll()V
    .locals 5

    const/4 v4, -0x1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getScrollY()I

    move-result v1

    invoke-super {p0, v0, v1}, Landroid/widget/LinearLayout;->scrollTo(II)V

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->postInvalidate()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mNextScreen:I

    if-eq v0, v4, :cond_0

    const/4 v0, 0x0

    iget v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mNextScreen:I

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getChildCount()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mCurrentScreen:I

    iput v4, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mNextScreen:I

    goto :goto_0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    const/4 v5, 0x1

    const/4 v4, 0x0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mTouchState:I

    if-eqz v1, :cond_0

    move v0, v5

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    packed-switch v0, :pswitch_data_0

    :cond_1
    :goto_1
    iget v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mTouchState:I

    if-eqz v0, :cond_7

    move v0, v5

    goto :goto_0

    :pswitch_0
    iget v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mLastMotionX:F

    sub-float v0, v1, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    float-to-int v0, v0

    iget v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mLastMotionY:F

    sub-float v1, v2, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    float-to-int v1, v1

    iget v2, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mTouchSlop:I

    if-le v0, v2, :cond_4

    move v3, v5

    :goto_2
    if-le v1, v2, :cond_5

    move v2, v5

    :goto_3
    if-nez v3, :cond_2

    if-eqz v2, :cond_1

    :cond_2
    if-eqz v3, :cond_3

    if-le v0, v1, :cond_3

    iput v5, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mTouchState:I

    :cond_3
    iget-boolean v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mAllowLongPress:Z

    if-eqz v0, :cond_1

    iput-boolean v4, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mAllowLongPress:Z

    iget v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mCurrentScreen:I

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->cancelLongPress()V

    goto :goto_1

    :cond_4
    move v3, v4

    goto :goto_2

    :cond_5
    move v2, v4

    goto :goto_3

    :pswitch_1
    iput v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mLastMotionX:F

    iput v2, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mLastMotionY:F

    iput-boolean v5, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mAllowLongPress:Z

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_6

    move v0, v4

    :goto_4
    iput v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mTouchState:I

    goto :goto_1

    :cond_6
    move v0, v5

    goto :goto_4

    :pswitch_2
    iput v4, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mTouchState:I

    iput-boolean v4, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mAllowLongPress:Z

    goto :goto_1

    :cond_7
    move v0, v4

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method protected onMeasure(II)V
    .locals 8

    const/high16 v7, 0x4000

    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    if-eqz v0, :cond_0

    if-nez v2, :cond_1

    :cond_0
    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getChildCount()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getPaddingTop()I

    move-result v2

    sub-int v2, v3, v2

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_0

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-static {v1, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    invoke-static {v2, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    invoke-virtual {v4, v5, v6}, Landroid/view/View;->measure(II)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    const/16 v3, 0x3e8

    const/4 v5, 0x0

    const/4 v4, 0x1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v1, :cond_0

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v1

    iput-object v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_0
    iget-object v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v1, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    packed-switch v1, :pswitch_data_0

    :goto_0
    return v0

    :pswitch_0
    iget-object v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->isFinished()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->abortAnimation()V

    :cond_1
    iput v2, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mLastMotionX:F

    goto :goto_0

    :pswitch_1
    iget v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mTouchState:I

    if-ne v1, v4, :cond_2

    iget v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mLastMotionX:F

    sub-float/2addr v1, v2

    float-to-int v1, v1

    iput v2, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mLastMotionX:F

    if-gez v1, :cond_3

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getScrollX()I

    move-result v2

    if-lez v2, :cond_2

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getScrollX()I

    move-result v2

    neg-int v2, v2

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {p0, v1, v5}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->scrollBy(II)V

    :cond_2
    :goto_1
    iput v4, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mTouchState:I

    goto :goto_0

    :cond_3
    if-lez v1, :cond_2

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getChildCount()I

    move-result v3

    mul-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getScrollX()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getWidth()I

    move-result v3

    sub-int/2addr v2, v3

    if-lez v2, :cond_2

    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {p0, v1, v5}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->scrollBy(II)V

    goto :goto_1

    :pswitch_2
    iget v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mTouchState:I

    if-ne v1, v4, :cond_4

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v2, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mMaximumVelocity:I

    int-to-float v2, v2

    invoke-virtual {v1, v3, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v1

    float-to-int v1, v1

    if-le v1, v3, :cond_5

    iget v2, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mCurrentScreen:I

    if-lez v2, :cond_5

    iget v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mCurrentScreen:I

    sub-int/2addr v1, v4

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->snapToScreen(I)V

    :goto_2
    iget-object v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v1}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_4
    iput v5, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mTouchState:I

    goto :goto_0

    :cond_5
    const/16 v2, -0x3e8

    if-ge v1, v2, :cond_6

    iget v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mCurrentScreen:I

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getChildCount()I

    move-result v2

    sub-int/2addr v2, v4

    if-ge v1, v2, :cond_6

    iget v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mCurrentScreen:I

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->snapToScreen(I)V

    goto :goto_2

    :cond_6
    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->snapToDestination()V

    goto :goto_2

    :pswitch_3
    iput v5, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mTouchState:I

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .locals 1

    const/4 v0, 0x1

    invoke-super {p0, v0}, Landroid/widget/LinearLayout;->requestDisallowInterceptTouchEvent(Z)V

    return-void
.end method

.method public scrollLeft()V
    .locals 2

    iget v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mNextScreen:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mCurrentScreen:I

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mCurrentScreen:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->snapToScreen(I)V

    :cond_0
    return-void
.end method

.method public scrollRight()V
    .locals 3

    iget v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mNextScreen:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mCurrentScreen:I

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getChildCount()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mCurrentScreen:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->snapToScreen(I)V

    :cond_0
    return-void
.end method

.method public setPageScrollListener(Lcom/mappn/gfan/common/widget/ScreenShotGallery$PageScrollListener;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mScrollListener:Lcom/mappn/gfan/common/widget/ScreenShotGallery$PageScrollListener;

    return-void
.end method

.method public snapToNextScreen()V
    .locals 2

    iget v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mCurrentScreen:I

    add-int/lit8 v0, v0, 0x1

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->isFinished()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->snapToScreen(I)V

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->snapToScreen(I)V

    goto :goto_0
.end method

.method public snapToScreen(I)V
    .locals 6

    const/4 v3, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getChildCount()I

    move-result v0

    sub-int/2addr v0, v3

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mCurrentScreen:I

    if-eq v0, v1, :cond_3

    move v1, v3

    :goto_1
    iput v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mNextScreen:I

    iget-object v3, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mScrollListener:Lcom/mappn/gfan/common/widget/ScreenShotGallery$PageScrollListener;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mScrollListener:Lcom/mappn/gfan/common/widget/ScreenShotGallery$PageScrollListener;

    iget v4, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mNextScreen:I

    invoke-interface {v3, v4}, Lcom/mappn/gfan/common/widget/ScreenShotGallery$PageScrollListener;->onChanged(I)V

    :cond_1
    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getFocusedChild()Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_2

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mCurrentScreen:I

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    if-ne v3, v1, :cond_2

    invoke-virtual {v3}, Landroid/view/View;->clearFocus()V

    :cond_2
    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getWidth()I

    move-result v1

    mul-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getScrollX()I

    move-result v1

    sub-int v3, v0, v1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getScrollX()I

    move-result v1

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v4

    mul-int/lit8 v5, v4, 0x2

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->invalidate()V

    goto :goto_0

    :cond_3
    move v1, v2

    goto :goto_1
.end method
