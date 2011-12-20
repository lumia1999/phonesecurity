.class final Lcom/yingyonghui/market/bn;
.super Ljava/lang/Object;
.source "ActivityAssetPermissions.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityAssetPermissions;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityAssetPermissions;)V
    .locals 0
    .parameter

    .prologue
    .line 88
    iput-object p1, p0, Lcom/yingyonghui/market/bn;->a:Lcom/yingyonghui/market/ActivityAssetPermissions;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1
    .parameter

    .prologue
    .line 91
    iget-object v0, p0, Lcom/yingyonghui/market/bn;->a:Lcom/yingyonghui/market/ActivityAssetPermissions;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivityAssetPermissions;->finish()V

    .line 92
    return-void
.end method
