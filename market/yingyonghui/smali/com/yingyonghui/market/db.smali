.class final Lcom/yingyonghui/market/db;
.super Ljava/lang/Object;
.source "ActivityDetailApp.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/eo;

.field private synthetic b:Lcom/yingyonghui/market/ActivityDetailApp;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityDetailApp;Lcom/yingyonghui/market/eo;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1187
    iput-object p1, p0, Lcom/yingyonghui/market/db;->b:Lcom/yingyonghui/market/ActivityDetailApp;

    iput-object p2, p0, Lcom/yingyonghui/market/db;->a:Lcom/yingyonghui/market/eo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onFocusChange(Landroid/view/View;Z)V
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 1190
    if-eqz p2, :cond_1

    .line 1201
    :cond_0
    :goto_0
    return-void

    .line 1193
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/db;->a:Lcom/yingyonghui/market/eo;

    invoke-virtual {v0}, Lcom/yingyonghui/market/eo;->d()Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1195
    invoke-static {v0}, Lcom/yingyonghui/market/util/c;->f(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1196
    iget-object v0, p0, Lcom/yingyonghui/market/db;->b:Lcom/yingyonghui/market/ActivityDetailApp;

    const v1, 0x7f090143

    invoke-static {v0, v1}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto :goto_0
.end method
