.class Lcom/mappn/gfan/ui/SearchActivity$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/TabHost$OnTabChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/SearchActivity;->initTabView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/SearchActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/SearchActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/SearchActivity$1;->this$0:Lcom/mappn/gfan/ui/SearchActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTabChanged(Ljava/lang/String;)V
    .locals 4

    const-string v0, "bbs"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity$1;->this$0:Lcom/mappn/gfan/ui/SearchActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/SearchActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "\u641c\u7d22"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "\u70b9\u51fb\u8bba\u575bTAB"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/SearchActivity$1;->this$0:Lcom/mappn/gfan/ui/SearchActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/SearchActivity;->access$000(Lcom/mappn/gfan/ui/SearchActivity;)V

    return-void
.end method
