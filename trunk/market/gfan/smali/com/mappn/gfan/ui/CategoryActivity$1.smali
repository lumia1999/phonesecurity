.class Lcom/mappn/gfan/ui/CategoryActivity$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/TabHost$OnTabChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/CategoryActivity;->initAppListView(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/CategoryActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/CategoryActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/CategoryActivity$1;->this$0:Lcom/mappn/gfan/ui/CategoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTabChanged(Ljava/lang/String;)V
    .locals 4

    const-string v0, "new"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/CategoryActivity$1;->this$0:Lcom/mappn/gfan/ui/CategoryActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/CategoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "\u5206\u7c7b"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "\u70b9\u51fb\u6700\u65b0"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    :cond_0
    return-void
.end method
