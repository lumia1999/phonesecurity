.class final Lcom/yingyonghui/market/dx;
.super Ljava/lang/Object;
.source "ActivityListAppBackup.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityListAppBackup;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityListAppBackup;)V
    .locals 0
    .parameter

    .prologue
    .line 340
    iput-object p1, p0, Lcom/yingyonghui/market/dx;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

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
    .line 344
    return-void
.end method

.method public final onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 348
    packed-switch p2, :pswitch_data_0

    .line 358
    :cond_0
    :goto_0
    return-void

    .line 350
    :pswitch_0
    invoke-virtual {p1}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result v0

    .line 351
    iget-object v1, p0, Lcom/yingyonghui/market/dx;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget v1, v1, Lcom/yingyonghui/market/ActivityListAppBackup;->p:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 352
    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->b(I)I

    goto :goto_0

    .line 353
    :cond_1
    iget-object v1, p0, Lcom/yingyonghui/market/dx;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget v1, v1, Lcom/yingyonghui/market/ActivityListAppBackup;->p:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 354
    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->c(I)I

    goto :goto_0

    .line 348
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
