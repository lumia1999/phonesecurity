.class Lcom/mappn/gfan/ui/HomeTabActivity$6;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/HomeTabActivity;->initView(Ljava/util/HashMap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/HomeTabActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/HomeTabActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$6;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity$6;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->access$1200(Lcom/mappn/gfan/ui/HomeTabActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity$6;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->access$1300(Lcom/mappn/gfan/ui/HomeTabActivity;)V

    :cond_0
    const/4 v0, 0x1

    return v0
.end method
