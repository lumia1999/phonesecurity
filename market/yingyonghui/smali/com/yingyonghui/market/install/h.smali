.class final Lcom/yingyonghui/market/install/h;
.super Ljava/lang/Object;
.source "UninstallerActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/install/UninstallerActivity;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/install/UninstallerActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 52
    iput-object p1, p0, Lcom/yingyonghui/market/install/h;->a:Lcom/yingyonghui/market/install/UninstallerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 55
    iget-object v0, p0, Lcom/yingyonghui/market/install/h;->a:Lcom/yingyonghui/market/install/UninstallerActivity;

    invoke-virtual {v0}, Lcom/yingyonghui/market/install/UninstallerActivity;->finish()V

    .line 56
    return-void
.end method
