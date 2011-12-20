.class final Lcom/yingyonghui/market/cc;
.super Landroid/os/Handler;
.source "AbsActivityAppListManager.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/AbsActivityAppListManager;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/AbsActivityAppListManager;)V
    .locals 0
    .parameter

    .prologue
    .line 64
    iput-object p1, p0, Lcom/yingyonghui/market/cc;->a:Lcom/yingyonghui/market/AbsActivityAppListManager;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter

    .prologue
    .line 66
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 75
    :goto_0
    return-void

    .line 68
    :pswitch_0
    iget-object v0, p0, Lcom/yingyonghui/market/cc;->a:Lcom/yingyonghui/market/AbsActivityAppListManager;

    iget-object v0, v0, Lcom/yingyonghui/market/AbsActivityAppListManager;->i:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 69
    iget-object v0, p0, Lcom/yingyonghui/market/cc;->a:Lcom/yingyonghui/market/AbsActivityAppListManager;

    iget-object v0, v0, Lcom/yingyonghui/market/AbsActivityAppListManager;->j:Landroid/view/View;

    const v1, 0x7f02001e

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    .line 72
    :pswitch_1
    iget-object v0, p0, Lcom/yingyonghui/market/cc;->a:Lcom/yingyonghui/market/AbsActivityAppListManager;

    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/AbsActivityAppListManager;->a(I)V

    goto :goto_0

    .line 66
    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
