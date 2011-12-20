.class final Lcom/yingyonghui/market/n;
.super Ljava/lang/Object;
.source "ActivityListAppManage.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityListAppManage;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityListAppManage;)V
    .locals 0
    .parameter

    .prologue
    .line 667
    iput-object p1, p0, Lcom/yingyonghui/market/n;->a:Lcom/yingyonghui/market/ActivityListAppManage;

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
    .line 671
    return-void
.end method

.method public final onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 675
    packed-switch p2, :pswitch_data_0

    .line 687
    :cond_0
    :goto_0
    return-void

    .line 677
    :pswitch_0
    invoke-virtual {p1}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result v0

    .line 678
    iget-object v1, p0, Lcom/yingyonghui/market/n;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget v1, v1, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 679
    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->b(I)I

    goto :goto_0

    .line 680
    :cond_1
    iget-object v1, p0, Lcom/yingyonghui/market/n;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget v1, v1, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 681
    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->c(I)I

    goto :goto_0

    .line 682
    :cond_2
    iget-object v1, p0, Lcom/yingyonghui/market/n;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget v1, v1, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    .line 683
    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->d(I)I

    goto :goto_0

    .line 675
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
