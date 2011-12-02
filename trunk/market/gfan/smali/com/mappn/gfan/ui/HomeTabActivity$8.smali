.class Lcom/mappn/gfan/ui/HomeTabActivity$8;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/HomeTabActivity;->onCreateDialog(I)Landroid/app/Dialog;
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

    iput-object p1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$8;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity$8;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->access$1400(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->hasDownloadTask()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity$8;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/HomeTabActivity;->moveTaskToBack(Z)Z

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity$8;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->access$100(Lcom/mappn/gfan/ui/HomeTabActivity;)V

    goto :goto_0
.end method
