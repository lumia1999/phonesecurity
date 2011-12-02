.class Lcom/mappn/gfan/ui/HomeTabActivity$3;
.super Landroid/content/BroadcastReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/HomeTabActivity;
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

    iput-object p1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$3;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

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

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity$3;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/Session;->addInstalledApp(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getDownloadManager()Lcom/mappn/gfan/common/download/DownloadManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/download/DownloadManager;->completeInstallation(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
