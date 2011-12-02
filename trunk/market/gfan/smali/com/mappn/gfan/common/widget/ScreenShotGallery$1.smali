.class Lcom/mappn/gfan/common/widget/ScreenShotGallery$1;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/widget/ScreenShotGallery;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/widget/ScreenShotGallery;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/common/widget/ScreenShotGallery;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery$1;->this$0:Lcom/mappn/gfan/common/widget/ScreenShotGallery;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 2

    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpl-float v1, v0, v1

    if-lez v1, :cond_0

    const/high16 v1, 0x43c8

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x0

    cmpl-float v0, p3, v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery$1;->this$0:Lcom/mappn/gfan/common/widget/ScreenShotGallery;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->scrollLeft()V

    :cond_0
    :goto_0
    const/4 v0, 0x1

    return v0

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery$1;->this$0:Lcom/mappn/gfan/common/widget/ScreenShotGallery;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->scrollRight()V

    goto :goto_0
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 2

    const/4 v1, 0x1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/ScreenShotGallery$1;->this$0:Lcom/mappn/gfan/common/widget/ScreenShotGallery;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/widget/ScreenShotGallery;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    return v1
.end method
