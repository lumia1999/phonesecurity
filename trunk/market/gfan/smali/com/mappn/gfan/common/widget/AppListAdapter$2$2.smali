.class Lcom/mappn/gfan/common/widget/AppListAdapter$2$2;
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

.field final synthetic val$packageName:Ljava/lang/String;

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/common/widget/AppListAdapter$2;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2$2;->this$1:Lcom/mappn/gfan/common/widget/AppListAdapter$2;

    iput-object p2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2$2;->val$packageName:Ljava/lang/String;

    iput-object p3, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2$2;->val$path:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWarningDialogCancel(I)V
    .locals 0

    return-void
.end method

.method public onWarningDialogOK(I)V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2$2;->this$1:Lcom/mappn/gfan/common/widget/AppListAdapter$2;

    iget-object v0, v0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$600(Lcom/mappn/gfan/common/widget/AppListAdapter;)Lcom/mappn/gfan/Session;

    move-result-object v0

    iget-object v0, v0, Lcom/mappn/gfan/Session;->mNotSameApps:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2$2;->val$packageName:Ljava/lang/String;

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2$2;->val$path:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2$2;->this$1:Lcom/mappn/gfan/common/widget/AppListAdapter$2;

    iget-object v0, v0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$200(Lcom/mappn/gfan/common/widget/AppListAdapter;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2$2;->val$packageName:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->uninstallApk(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method
