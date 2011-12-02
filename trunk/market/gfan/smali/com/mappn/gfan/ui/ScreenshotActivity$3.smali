.class Lcom/mappn/gfan/ui/ScreenshotActivity$3;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/ScreenshotActivity;->initViews()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/ScreenshotActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/ScreenshotActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/ScreenshotActivity$3;->this$0:Lcom/mappn/gfan/ui/ScreenshotActivity;

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

    if-lez v1, :cond_1

    const/high16 v1, 0x43fa

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    const/4 v0, 0x0

    cmpl-float v0, p3, v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity$3;->this$0:Lcom/mappn/gfan/ui/ScreenshotActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->access$000(Lcom/mappn/gfan/ui/ScreenshotActivity;)V

    :goto_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity$3;->this$0:Lcom/mappn/gfan/ui/ScreenshotActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->access$200(Lcom/mappn/gfan/ui/ScreenshotActivity;)V

    const/4 v0, 0x1

    :goto_1
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity$3;->this$0:Lcom/mappn/gfan/ui/ScreenshotActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->access$100(Lcom/mappn/gfan/ui/ScreenshotActivity;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity$3;->this$0:Lcom/mappn/gfan/ui/ScreenshotActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->access$200(Lcom/mappn/gfan/ui/ScreenshotActivity;)V

    const/4 v0, 0x0

    return v0
.end method
