.class Lcom/mappn/gfan/ui/ScreenshotActivity$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/ScreenshotActivity;
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

    iput-object p1, p0, Lcom/mappn/gfan/ui/ScreenshotActivity$4;->this$0:Lcom/mappn/gfan/ui/ScreenshotActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity$4;->this$0:Lcom/mappn/gfan/ui/ScreenshotActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->access$400(Lcom/mappn/gfan/ui/ScreenshotActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ScreenshotActivity$4;->this$0:Lcom/mappn/gfan/ui/ScreenshotActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/ScreenshotActivity;->access$300(Lcom/mappn/gfan/ui/ScreenshotActivity;)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->startAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity$4;->this$0:Lcom/mappn/gfan/ui/ScreenshotActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->access$400(Lcom/mappn/gfan/ui/ScreenshotActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void
.end method
