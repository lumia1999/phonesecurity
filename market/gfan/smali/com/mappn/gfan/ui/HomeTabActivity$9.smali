.class Lcom/mappn/gfan/ui/HomeTabActivity$9;
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

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/HomeTabActivity;I)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$9;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    iput p2, p0, Lcom/mappn/gfan/ui/HomeTabActivity$9;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity$9;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.mappn.gfan.broadcast.REMIND_LATTER"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/HomeTabActivity;->sendBroadcast(Landroid/content/Intent;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity$9;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    iget v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$9;->val$id:I

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/HomeTabActivity;->removeDialog(I)V

    return-void
.end method
