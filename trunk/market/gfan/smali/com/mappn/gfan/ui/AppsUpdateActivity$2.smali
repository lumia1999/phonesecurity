.class Lcom/mappn/gfan/ui/AppsUpdateActivity$2;
.super Landroid/content/BroadcastReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/AppsUpdateActivity;
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

    iput-object p1, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$2;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$2;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->access$100(Lcom/mappn/gfan/ui/AppsUpdateActivity;)Lcom/mappn/gfan/common/widget/AppListAdapter;

    move-result-object v0

    iget-object v2, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$2;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-virtual {v2}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->access$000(Landroid/content/Context;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->addData(Ljava/util/HashMap;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$2;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    iget-object v1, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$2;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->access$100(Lcom/mappn/gfan/ui/AppsUpdateActivity;)Lcom/mappn/gfan/common/widget/AppListAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getCount()I

    move-result v1

    invoke-static {v0, v1}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->access$200(Lcom/mappn/gfan/ui/AppsUpdateActivity;I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string v2, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$2;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->access$100(Lcom/mappn/gfan/ui/AppsUpdateActivity;)Lcom/mappn/gfan/common/widget/AppListAdapter;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->removeDataWithPackageName(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$2;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    iget-object v1, p0, Lcom/mappn/gfan/ui/AppsUpdateActivity$2;->this$0:Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->access$100(Lcom/mappn/gfan/ui/AppsUpdateActivity;)Lcom/mappn/gfan/common/widget/AppListAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getCount()I

    move-result v1

    invoke-static {v0, v1}, Lcom/mappn/gfan/ui/AppsUpdateActivity;->access$200(Lcom/mappn/gfan/ui/AppsUpdateActivity;I)V

    goto :goto_0
.end method
