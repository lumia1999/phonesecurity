.class Lcom/mappn/gfan/ui/PersonalAccountActivity$3;
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

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/PersonalAccountActivity;I)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$3;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    iput p2, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$3;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$3;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    iget v1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$3;->val$id:I

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->dismissDialog(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$3;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->access$200(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->getDataSource()Ljava/util/ArrayList;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "download"

    const v2, 0x7f02001e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$3;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->access$200(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->notifyDataSetChanged()V

    return-void
.end method
