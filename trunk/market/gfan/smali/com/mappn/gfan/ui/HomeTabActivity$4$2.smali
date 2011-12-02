.class Lcom/mappn/gfan/ui/HomeTabActivity$4$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/HomeTabActivity$4;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mappn/gfan/ui/HomeTabActivity$4;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/HomeTabActivity$4;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$4$2;->this$1:Lcom/mappn/gfan/ui/HomeTabActivity$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinish(J)V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity$4$2;->this$1:Lcom/mappn/gfan/ui/HomeTabActivity$4;

    iget-object v0, v0, Lcom/mappn/gfan/ui/HomeTabActivity$4;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->access$1000(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/mappn/gfan/Session;->setUpdateID(J)V

    return-void
.end method
