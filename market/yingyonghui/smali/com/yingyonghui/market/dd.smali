.class final Lcom/yingyonghui/market/dd;
.super Landroid/os/Handler;
.source "ActivityDetailApp.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityDetailApp;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityDetailApp;)V
    .locals 0
    .parameter

    .prologue
    .line 928
    iput-object p1, p0, Lcom/yingyonghui/market/dd;->a:Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 1
    .parameter

    .prologue
    .line 931
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 936
    :goto_0
    return-void

    .line 933
    :pswitch_0
    iget-object v0, p0, Lcom/yingyonghui/market/dd;->a:Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityDetailApp;->f(Lcom/yingyonghui/market/ActivityDetailApp;)V

    goto :goto_0

    .line 931
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_0
    .end packed-switch
.end method
