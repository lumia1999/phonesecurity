.class Lcom/mappn/gfan/ui/PersonalAccountActivity$5;
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

    iput-object p1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$5;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    iput p2, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$5;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$5;->this$0:Lcom/mappn/gfan/ui/PersonalAccountActivity;

    iget v1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity$5;->val$id:I

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->dismissDialog(I)V

    return-void
.end method
