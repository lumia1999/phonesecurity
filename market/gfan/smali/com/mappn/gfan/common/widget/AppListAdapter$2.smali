.class Lcom/mappn/gfan/common/widget/AppListAdapter$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/widget/AppListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/common/widget/AppListAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8

    const/16 v7, 0xa

    const/high16 v6, 0x1000

    const/4 v5, 0x1

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$000(Lcom/mappn/gfan/common/widget/AppListAdapter;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "product_download"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const-string v1, "pay_category"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_a

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    :goto_0
    if-eqz v2, :cond_0

    if-ne v7, v2, :cond_5

    :cond_0
    const-string v3, "product_download"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v3}, Lcom/mappn/gfan/common/widget/AppListAdapter;->notifyDataSetChanged()V

    const/4 v3, 0x2

    if-ne v3, v1, :cond_3

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$200(Lcom/mappn/gfan/common/widget/AppListAdapter;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->isLogin()Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v2}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$200(Lcom/mappn/gfan/common/widget/AppListAdapter;)Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/mappn/gfan/ui/PreloadActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "extra.key.pid"

    const-string v3, "p_id"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "is_buy"

    invoke-virtual {v1, v0, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {v1, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$200(Lcom/mappn/gfan/common/widget/AppListAdapter;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_1
    :goto_1
    return-void

    :cond_2
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$200(Lcom/mappn/gfan/common/widget/AppListAdapter;)Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/LoginActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$200(Lcom/mappn/gfan/common/widget/AppListAdapter;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    :cond_3
    if-ne v7, v2, :cond_4

    const-string v1, "rsa_md5"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "packagename"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v3}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$200(Lcom/mappn/gfan/common/widget/AppListAdapter;)Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v2, v1}, Lcom/mappn/gfan/common/util/Utils;->isSameSign(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$300(Lcom/mappn/gfan/common/widget/AppListAdapter;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$300(Lcom/mappn/gfan/common/widget/AppListAdapter;)Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/mappn/gfan/common/widget/AppListAdapter$2$1;

    invoke-direct {v2, p0, v0}, Lcom/mappn/gfan/common/widget/AppListAdapter$2$1;-><init>(Lcom/mappn/gfan/common/widget/AppListAdapter$2;Ljava/util/HashMap;)V

    invoke-static {v1, v5, v2}, Lcom/mappn/gfan/common/util/DialogUtil;->createComfirmDownloadDialog(Landroid/content/Context;ZLcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    goto :goto_1

    :cond_4
    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v1, v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$400(Lcom/mappn/gfan/common/widget/AppListAdapter;Ljava/util/HashMap;)V

    goto :goto_1

    :cond_5
    const/16 v1, 0x9

    if-ne v1, v2, :cond_8

    const-string v1, "packagename"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "info"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v2}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$500(Lcom/mappn/gfan/common/widget/AppListAdapter;)Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mappn/gfan/common/vo/DownloadInfo;

    if-eqz v2, :cond_6

    iget-object v0, v2, Lcom/mappn/gfan/common/vo/DownloadInfo;->mFilePath:Ljava/lang/String;

    :cond_6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v2}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$200(Lcom/mappn/gfan/common/widget/AppListAdapter;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v0, v1}, Lcom/mappn/gfan/common/util/Utils;->compareFileWithPathAndPkg(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$200(Lcom/mappn/gfan/common/widget/AppListAdapter;)Landroid/content/Context;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/Utils;->installApk(Landroid/content/Context;Ljava/io/File;)V

    goto/16 :goto_1

    :cond_7
    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v2}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$300(Lcom/mappn/gfan/common/widget/AppListAdapter;)Landroid/app/Activity;

    move-result-object v2

    const/4 v3, 0x0

    new-instance v4, Lcom/mappn/gfan/common/widget/AppListAdapter$2$2;

    invoke-direct {v4, p0, v1, v0}, Lcom/mappn/gfan/common/widget/AppListAdapter$2$2;-><init>(Lcom/mappn/gfan/common/widget/AppListAdapter$2;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v2, v3, v4}, Lcom/mappn/gfan/common/util/DialogUtil;->createComfirmDownloadDialog(Landroid/content/Context;ZLcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    goto/16 :goto_1

    :cond_8
    const/16 v1, 0xb

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$700(Lcom/mappn/gfan/common/widget/AppListAdapter;)Z

    move-result v1

    if-eqz v1, :cond_9

    const-string v1, "packagename"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$200(Lcom/mappn/gfan/common/widget/AppListAdapter;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/mappn/gfan/common/util/Utils;->uninstallApk(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_1

    :cond_9
    const-string v1, "packagename"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v2}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$200(Lcom/mappn/gfan/common/widget/AppListAdapter;)Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/mappn/gfan/ui/PreloadActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string v2, "extra.key.package.name"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$200(Lcom/mappn/gfan/common/widget/AppListAdapter;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_1

    :cond_a
    move v1, v5

    goto/16 :goto_0
.end method
