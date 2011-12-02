.class Lcom/mappn/gfan/ui/ProductCommentActivity$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/RatingBar$OnRatingBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/ProductCommentActivity;->initViews()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/ProductCommentActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRatingChanged(Landroid/widget/RatingBar;FZ)V
    .locals 8

    const-wide/16 v6, 0x7d0

    float-to-int v0, p2

    packed-switch v0, :pswitch_data_0

    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-static {v2}, Lcom/mappn/gfan/ui/ProductCommentActivity;->access$300(Lcom/mappn/gfan/ui/ProductCommentActivity;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-static {v2}, Lcom/mappn/gfan/ui/ProductCommentActivity;->access$300(Lcom/mappn/gfan/ui/ProductCommentActivity;)J

    move-result-wide v2

    sub-long v2, v0, v2

    cmp-long v2, v2, v6

    if-lez v2, :cond_0

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-static {v2}, Lcom/mappn/gfan/ui/ProductCommentActivity;->access$500(Lcom/mappn/gfan/ui/ProductCommentActivity;)Landroid/os/Handler;

    move-result-object v2

    new-instance v3, Lcom/mappn/gfan/ui/ProductCommentActivity$3$1;

    invoke-direct {v3, p0, p2}, Lcom/mappn/gfan/ui/ProductCommentActivity$3$1;-><init>(Lcom/mappn/gfan/ui/ProductCommentActivity$3;F)V

    invoke-virtual {v2, v3, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-static {v2, v0, v1}, Lcom/mappn/gfan/ui/ProductCommentActivity;->access$302(Lcom/mappn/gfan/ui/ProductCommentActivity;J)J

    :cond_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->access$200(Lcom/mappn/gfan/ui/ProductCommentActivity;)Landroid/widget/TextView;

    move-result-object v0

    const v1, 0x7f0900c4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->access$200(Lcom/mappn/gfan/ui/ProductCommentActivity;)Landroid/widget/TextView;

    move-result-object v0

    const v1, 0x7f0900c5

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->access$200(Lcom/mappn/gfan/ui/ProductCommentActivity;)Landroid/widget/TextView;

    move-result-object v0

    const v1, 0x7f0900c6

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->access$200(Lcom/mappn/gfan/ui/ProductCommentActivity;)Landroid/widget/TextView;

    move-result-object v0

    const v1, 0x7f0900c7

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :pswitch_4
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductCommentActivity$3;->this$0:Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/ProductCommentActivity;->access$200(Lcom/mappn/gfan/ui/ProductCommentActivity;)Landroid/widget/TextView;

    move-result-object v0

    const v1, 0x7f0900c8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
