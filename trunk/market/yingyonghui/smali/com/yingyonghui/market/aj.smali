.class final Lcom/yingyonghui/market/aj;
.super Ljava/lang/Object;
.source "ActivityListApp2.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityListApp2;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityListApp2;)V
    .locals 0
    .parameter

    .prologue
    .line 254
    iput-object p1, p0, Lcom/yingyonghui/market/aj;->a:Lcom/yingyonghui/market/ActivityListApp2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onScroll(Landroid/widget/AbsListView;III)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 258
    return-void
.end method

.method public final onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 262
    packed-switch p2, :pswitch_data_0

    .line 275
    :cond_0
    :goto_0
    return-void

    .line 264
    :pswitch_0
    invoke-virtual {p1}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result v0

    .line 265
    invoke-virtual {p1}, Landroid/widget/AbsListView;->getChildCount()I

    move-result v1

    .line 267
    iget-object v2, p0, Lcom/yingyonghui/market/aj;->a:Lcom/yingyonghui/market/ActivityListApp2;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListApp2;->a(Lcom/yingyonghui/market/ActivityListApp2;)Lcom/yingyonghui/market/bc;

    move-result-object v2

    if-eqz v2, :cond_0

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/yingyonghui/market/aj;->a:Lcom/yingyonghui/market/ActivityListApp2;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListApp2;->a(Lcom/yingyonghui/market/ActivityListApp2;)Lcom/yingyonghui/market/bc;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yingyonghui/market/bc;->getCount()I

    move-result v1

    const/4 v2, 0x2

    sub-int/2addr v1, v2

    if-lt v0, v1, :cond_0

    .line 268
    iget-object v0, p0, Lcom/yingyonghui/market/aj;->a:Lcom/yingyonghui/market/ActivityListApp2;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListApp2;->b(Lcom/yingyonghui/market/ActivityListApp2;)V

    goto :goto_0

    .line 262
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
