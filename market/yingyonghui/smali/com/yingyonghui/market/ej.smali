.class final Lcom/yingyonghui/market/ej;
.super Landroid/database/ContentObserver;
.source "ActivityDetailApp.java"


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:I

.field private synthetic c:Lcom/yingyonghui/market/ActivityDetailApp;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/ActivityDetailApp;Landroid/content/Context;I)V
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 336
    iput-object p1, p0, Lcom/yingyonghui/market/ej;->c:Lcom/yingyonghui/market/ActivityDetailApp;

    .line 337
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 338
    iput-object p2, p0, Lcom/yingyonghui/market/ej;->a:Landroid/content/Context;

    .line 339
    iput p3, p0, Lcom/yingyonghui/market/ej;->b:I

    .line 340
    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/ej;)I
    .locals 1
    .parameter

    .prologue
    .line 319
    iget v0, p0, Lcom/yingyonghui/market/ej;->b:I

    return v0
.end method

.method static synthetic b(Lcom/yingyonghui/market/ej;)V
    .locals 1
    .parameter

    .prologue
    .line 319
    iget-object v0, p0, Lcom/yingyonghui/market/ej;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    return-void
.end method


# virtual methods
.method public final onChange(Z)V
    .locals 3
    .parameter

    .prologue
    .line 330
    iget-object v0, p0, Lcom/yingyonghui/market/ej;->c:Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityDetailApp;->g(Lcom/yingyonghui/market/ActivityDetailApp;)Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 331
    iget-object v0, p0, Lcom/yingyonghui/market/ej;->c:Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityDetailApp;->g(Lcom/yingyonghui/market/ActivityDetailApp;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x6e

    iget-object v2, p0, Lcom/yingyonghui/market/ej;->a:Landroid/content/Context;

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 334
    :cond_0
    return-void
.end method
