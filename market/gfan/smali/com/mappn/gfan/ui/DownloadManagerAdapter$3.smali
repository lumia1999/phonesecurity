.class Lcom/mappn/gfan/ui/DownloadManagerAdapter$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/DownloadManagerAdapter;->judgeInstallStatus(Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

.field final synthetic val$item:Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/DownloadManagerAdapter;Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$3;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    iput-object p2, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$3;->val$item:Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

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

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$3;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-static {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$1100(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)Lcom/mappn/gfan/Session;

    move-result-object v0

    iget-object v0, v0, Lcom/mappn/gfan/Session;->mNotSameApps:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$3;->val$item:Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    iget-object v1, v1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mPackageName:Ljava/lang/String;

    iget-object v2, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$3;->val$item:Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    iget-object v2, v2, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mFilePath:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$3;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-static {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->access$700(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$3;->val$item:Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    iget-object v1, v1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mPackageName:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->uninstallApk(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method
