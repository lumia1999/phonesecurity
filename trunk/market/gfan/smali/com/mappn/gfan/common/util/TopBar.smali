.class public Lcom/mappn/gfan/common/util/TopBar;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createTopBar(Landroid/content/Context;[Landroid/view/View;[ILjava/lang/String;)V
    .locals 5

    array-length v1, p1

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v0, p1, v2

    aget v3, p2, v2

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    const/16 v3, 0x8

    aget v4, p2, v2

    if-ne v3, v4, :cond_0

    :goto_1
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    goto :goto_1

    :sswitch_0
    new-instance v3, Lcom/mappn/gfan/common/util/TopBar$1;

    invoke-direct {v3, p0}, Lcom/mappn/gfan/common/util/TopBar$1;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1

    :sswitch_1
    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    :cond_1
    return-void

    :sswitch_data_0
    .sparse-switch
        0x7f0c009a -> :sswitch_0
        0x7f0c009e -> :sswitch_1
    .end sparse-switch
.end method
