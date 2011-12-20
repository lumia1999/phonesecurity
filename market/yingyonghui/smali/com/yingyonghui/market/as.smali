.class final Lcom/yingyonghui/market/as;
.super Ljava/lang/Object;
.source "ActivityListNews.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityListNews;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityListNews;)V
    .locals 0
    .parameter

    .prologue
    .line 131
    iput-object p1, p0, Lcom/yingyonghui/market/as;->a:Lcom/yingyonghui/market/ActivityListNews;

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
    .line 135
    return-void
.end method

.method public final onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 139
    packed-switch p2, :pswitch_data_0

    .line 153
    :cond_0
    :goto_0
    return-void

    .line 141
    :pswitch_0
    invoke-virtual {p1}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result v0

    .line 142
    invoke-virtual {p1}, Landroid/widget/AbsListView;->getChildCount()I

    move-result v1

    .line 144
    iget-object v2, p0, Lcom/yingyonghui/market/as;->a:Lcom/yingyonghui/market/ActivityListNews;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListNews;->a(Lcom/yingyonghui/market/ActivityListNews;)Lcom/yingyonghui/market/t;

    move-result-object v2

    if-eqz v2, :cond_0

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/yingyonghui/market/as;->a:Lcom/yingyonghui/market/ActivityListNews;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListNews;->a(Lcom/yingyonghui/market/ActivityListNews;)Lcom/yingyonghui/market/t;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yingyonghui/market/t;->getCount()I

    move-result v1

    const/4 v2, 0x2

    sub-int/2addr v1, v2

    if-lt v0, v1, :cond_0

    .line 145
    iget-object v0, p0, Lcom/yingyonghui/market/as;->a:Lcom/yingyonghui/market/ActivityListNews;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListNews;->b(Lcom/yingyonghui/market/ActivityListNews;)V

    goto :goto_0

    .line 139
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
