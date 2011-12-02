.class public Lcom/mappn/gfan/ui/PayMainActivity$AlixOnCancelListener;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/PayMainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AlixOnCancelListener"
.end annotation


# instance fields
.field mcontext:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/mappn/gfan/ui/PayMainActivity$AlixOnCancelListener;->mcontext:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity$AlixOnCancelListener;->mcontext:Landroid/app/Activity;

    const/4 v1, 0x4

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    return-void
.end method
