.class Lcom/mappn/gfan/ui/AppsUpdateActivity$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/AppsUpdateActivity;->createUpdateAllView()Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/AppsUpdateActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$3;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$3;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->access$100(Lcom/mappn/gfan/ui/AppsUpdateActivity;)Lcom/mappn/gfan/common/widget/AppListAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->updateAll()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$3;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    iget-object v0, v0, Lcom/mappn/gfan/ui/AppsUpdateActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$3;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->access$400(Lcom/mappn/gfan/ui/AppsUpdateActivity;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->removeHeaderView(Landroid/view/View;)Z

    return-void
.end method
