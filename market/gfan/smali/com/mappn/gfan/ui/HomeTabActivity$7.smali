.class Lcom/mappn/gfan/ui/HomeTabActivity$7;
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

    iput-object p1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$7;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    iput p2, p0, Lcom/mappn/gfan/ui/HomeTabActivity$7;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity$7;->this$0:Lcom/mappn/gfan/ui/HomeTabActivity;

    iget v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity$7;->val$id:I

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/HomeTabActivity;->dismissDialog(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method
