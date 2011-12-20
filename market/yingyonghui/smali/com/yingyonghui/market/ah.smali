.class final Lcom/yingyonghui/market/ah;
.super Landroid/os/Handler;
.source "ActivitySplash.java"


# instance fields
.field final synthetic a:Lcom/yingyonghui/market/ActivitySplash;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivitySplash;)V
    .locals 0
    .parameter

    .prologue
    .line 138
    iput-object p1, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 4
    .parameter

    .prologue
    const/4 v3, 0x2

    .line 140
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 210
    :cond_0
    :goto_0
    return-void

    .line 142
    :pswitch_0
    iget-object v0, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-static {v0}, Lcom/yingyonghui/market/util/g;->a(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 143
    iget-object v0, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivitySplash;->a(Lcom/yingyonghui/market/ActivitySplash;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 145
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivitySplash;->b(Lcom/yingyonghui/market/ActivitySplash;)V

    .line 146
    iget-object v0, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivitySplash;->c(Lcom/yingyonghui/market/ActivitySplash;)Z

    goto :goto_0

    .line 150
    :pswitch_1
    iget-object v0, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    iget-object v0, v0, Lcom/yingyonghui/market/ActivitySplash;->a:Lcom/yingyonghui/market/a/d;

    iget-object v1, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    iget-object v1, v1, Lcom/yingyonghui/market/ActivitySplash;->b:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/a/d;->a(Landroid/os/Handler;)V

    .line 152
    iget-object v0, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivitySplash;->a(Lcom/yingyonghui/market/ActivitySplash;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 154
    new-instance v0, Lcom/yingyonghui/market/ce;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/ce;-><init>(Lcom/yingyonghui/market/ah;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/ce;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 166
    iget-object v0, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivitySplash;->d(Lcom/yingyonghui/market/ActivitySplash;)V

    .line 167
    iget-object v0, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivitySplash;->a(Lcom/yingyonghui/market/ActivitySplash;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x5dc

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 170
    :pswitch_2
    iget-object v0, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    const v1, 0x7f0b00fb

    iget-object v2, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivitySplash;->e(Lcom/yingyonghui/market/ActivitySplash;)I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/ActivitySplash;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 171
    if-eqz v0, :cond_2

    .line 172
    const v1, 0x7f02007d

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 174
    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivitySplash;->f(Lcom/yingyonghui/market/ActivitySplash;)I

    .line 176
    iget-object v0, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivitySplash;->e(Lcom/yingyonghui/market/ActivitySplash;)I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 177
    iget-object v0, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivitySplash;->g(Lcom/yingyonghui/market/ActivitySplash;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 178
    iget-object v0, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivitySplash;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/MarketApplication;

    .line 179
    iget-object v1, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivitySplash;->g(Lcom/yingyonghui/market/ActivitySplash;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/MarketApplication;->a(Z)V

    .line 180
    iget-object v1, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivitySplash;->h(Lcom/yingyonghui/market/ActivitySplash;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/MarketApplication;->b(Z)V

    .line 181
    iget-object v1, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivitySplash;->i(Lcom/yingyonghui/market/ActivitySplash;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/MarketApplication;->a(Ljava/lang/String;)V

    .line 182
    iget-object v1, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivitySplash;->j(Lcom/yingyonghui/market/ActivitySplash;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/MarketApplication;->b(Ljava/lang/String;)V

    .line 184
    iget-object v0, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivitySplash;->h(Lcom/yingyonghui/market/ActivitySplash;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 185
    iget-object v0, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/ActivitySplash;->showDialog(I)V

    goto/16 :goto_0

    .line 202
    :cond_3
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 203
    iget-object v1, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    const-class v2, Lcom/yingyonghui/market/ActivityMain;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 204
    const/high16 v1, 0x1000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 205
    iget-object v1, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-virtual {v1, v0}, Lcom/yingyonghui/market/ActivitySplash;->startActivity(Landroid/content/Intent;)V

    .line 206
    iget-object v0, p0, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivitySplash;->finish()V

    goto/16 :goto_0

    .line 140
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method
