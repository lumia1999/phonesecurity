.class final Lcom/yingyonghui/market/x;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityMain;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityMain;)V
    .locals 0
    .parameter

    .prologue
    .line 293
    iput-object p1, p0, Lcom/yingyonghui/market/x;->a:Lcom/yingyonghui/market/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 296
    iget-object v0, p0, Lcom/yingyonghui/market/x;->a:Lcom/yingyonghui/market/ActivityMain;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivityMain;->finish()V

    .line 297
    return-void
.end method
