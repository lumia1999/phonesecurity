.class final Lcom/yingyonghui/market/cf;
.super Landroid/os/Handler;
.source "ActivityDetailNews.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityDetailNews;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityDetailNews;)V
    .locals 0
    .parameter

    .prologue
    .line 90
    iput-object p1, p0, Lcom/yingyonghui/market/cf;->a:Lcom/yingyonghui/market/ActivityDetailNews;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 1
    .parameter

    .prologue
    .line 93
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 100
    :cond_0
    :goto_0
    return-void

    .line 95
    :pswitch_0
    iget-object v0, p0, Lcom/yingyonghui/market/cf;->a:Lcom/yingyonghui/market/ActivityDetailNews;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityDetailNews;->a(Lcom/yingyonghui/market/ActivityDetailNews;)Lcom/yingyonghui/market/ck;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/yingyonghui/market/cf;->a:Lcom/yingyonghui/market/ActivityDetailNews;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityDetailNews;->a(Lcom/yingyonghui/market/ActivityDetailNews;)Lcom/yingyonghui/market/ck;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/ck;->notifyDataSetChanged()V

    goto :goto_0

    .line 93
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_0
    .end packed-switch
.end method
