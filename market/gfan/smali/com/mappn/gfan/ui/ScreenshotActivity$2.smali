.class Lcom/mappn/gfan/ui/ScreenshotActivity$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    iput-object p1, p0, Lcom/mappn/gfan/ui/ScreenshotActivity$2;->this$0:Lcom/mappn/gfan/ui/ScreenshotActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ScreenshotActivity$2;->this$0:Lcom/mappn/gfan/ui/ScreenshotActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/ScreenshotActivity;->finish()V

    return-void
.end method
