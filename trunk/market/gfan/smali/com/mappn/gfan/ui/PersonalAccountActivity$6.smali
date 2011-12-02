.class Lcom/mappn/gfan/ui/PersonalAccountActivity$6;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/PersonalAccountActivity;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/PersonalAccountActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$6;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    const/4 v3, 0x1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$6;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v0, v3}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->access$1002(Lcom/mappn/gfan/ui/PersonalAccountActivity;Z)Z

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$6;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$6;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    const v2, 0x7f090066

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v3}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$6;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$6;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->access$1100(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/Session;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/hudee/HudeeUtils;->registerLPNS(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$6;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->access$200(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->getDataSource()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "download"

    const v2, 0x7f020020

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$6;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->access$200(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->notifyDataSetChanged()V

    return-void
.end method
