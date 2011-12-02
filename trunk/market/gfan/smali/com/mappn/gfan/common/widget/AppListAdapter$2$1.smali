.class Lcom/mappn/gfan/common/widget/AppListAdapter$2$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/widget/AppListAdapter$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mappn/gfan/common/widget/AppListAdapter$2;

.field final synthetic val$item:Ljava/util/HashMap;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/common/widget/AppListAdapter$2;Ljava/util/HashMap;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2$1;->this$1:Lcom/mappn/gfan/common/widget/AppListAdapter$2;

    iput-object p2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2$1;->val$item:Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWarningDialogCancel(I)V
    .locals 0

    return-void
.end method

.method public onWarningDialogOK(I)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2$1;->this$1:Lcom/mappn/gfan/common/widget/AppListAdapter$2;

    iget-object v0, v0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2$1;->val$item:Ljava/util/HashMap;

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$400(Lcom/mappn/gfan/common/widget/AppListAdapter;Ljava/util/HashMap;)V

    return-void
.end method
