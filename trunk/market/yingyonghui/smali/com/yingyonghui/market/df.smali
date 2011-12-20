.class final Lcom/yingyonghui/market/df;
.super Ljava/lang/Object;
.source "ActivityDetailApp.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityDetailApp;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityDetailApp;)V
    .locals 0
    .parameter

    .prologue
    .line 435
    iput-object p1, p0, Lcom/yingyonghui/market/df;->a:Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1
    .parameter

    .prologue
    .line 437
    iget-object v0, p0, Lcom/yingyonghui/market/df;->a:Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivityDetailApp;->finish()V

    .line 438
    return-void
.end method
