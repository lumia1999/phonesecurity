.class public final Lcom/yingyonghui/market/ck;
.super Landroid/widget/ArrayAdapter;
.source "ActivityDetailNews.java"


# instance fields
.field private a:Landroid/view/LayoutInflater;

.field private b:I

.field private synthetic c:Lcom/yingyonghui/market/ActivityDetailNews;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/ActivityDetailNews;Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 2
    .parameter
    .parameter
    .parameter

    .prologue
    .line 692
    iput-object p1, p0, Lcom/yingyonghui/market/ck;->c:Lcom/yingyonghui/market/ActivityDetailNews;

    .line 693
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 694
    const-string v0, "layout_inflater"

    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/yingyonghui/market/ck;->a:Landroid/view/LayoutInflater;

    .line 696
    invoke-static {p1}, Lcom/yingyonghui/market/util/p;->d(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v0

    .line 697
    iget v1, v0, Landroid/graphics/Rect;->right:I

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/yingyonghui/market/ck;->b:I

    .line 698
    return-void
.end method


# virtual methods
.method public final getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 11
    .parameter
    .parameter
    .parameter

    .prologue
    .line 704
    invoke-virtual {p0, p1}, Lcom/yingyonghui/market/ck;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/yingyonghui/market/model/g;

    .line 706
    if-nez p2, :cond_1

    .line 707
    iget-object v1, p0, Lcom/yingyonghui/market/ck;->a:Landroid/view/LayoutInflater;

    const v2, 0x7f030036

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 708
    new-instance v2, Lcom/yingyonghui/market/ek;

    invoke-direct {v2}, Lcom/yingyonghui/market/ek;-><init>()V

    .line 709
    const v3, 0x7f0b00d2

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, v2, Lcom/yingyonghui/market/ek;->a:Landroid/view/View;

    .line 710
    const v3, 0x7f0b00d3

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, v2, Lcom/yingyonghui/market/ek;->b:Landroid/widget/TextView;

    .line 711
    const v3, 0x7f0b00d4

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, v2, Lcom/yingyonghui/market/ek;->c:Landroid/widget/TextView;

    .line 712
    const v3, 0x7f0b00d5

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/LinearLayout;

    iput-object p2, v2, Lcom/yingyonghui/market/ek;->d:Landroid/widget/LinearLayout;

    .line 713
    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 718
    :goto_0
    iget-object v3, p1, Lcom/yingyonghui/market/model/g;->b:Ljava/lang/String;

    const-string v4, "null"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 719
    iget-object v3, v2, Lcom/yingyonghui/market/ek;->a:Landroid/view/View;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 726
    :goto_1
    iget-object v3, v2, Lcom/yingyonghui/market/ek;->d:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 728
    iget-object v3, p1, Lcom/yingyonghui/market/model/g;->c:Ljava/util/List;

    .line 729
    const/4 v4, 0x0

    :goto_2
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_8

    .line 731
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/yingyonghui/market/model/d;

    .line 732
    if-eqz p1, :cond_0

    .line 733
    iget v5, p1, Lcom/yingyonghui/market/model/d;->b:I

    packed-switch v5, :pswitch_data_0

    .line 730
    :cond_0
    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 715
    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/yingyonghui/market/ek;

    move-object v1, p2

    move-object v2, p3

    goto :goto_0

    .line 721
    :cond_2
    iget-object v3, v2, Lcom/yingyonghui/market/ek;->a:Landroid/view/View;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 722
    iget-object v3, v2, Lcom/yingyonghui/market/ek;->b:Landroid/widget/TextView;

    iget v4, p1, Lcom/yingyonghui/market/model/g;->a:I

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 723
    iget-object v3, v2, Lcom/yingyonghui/market/ek;->c:Landroid/widget/TextView;

    iget-object v4, p1, Lcom/yingyonghui/market/model/g;->b:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 735
    :pswitch_0
    iget-object v5, v2, Lcom/yingyonghui/market/ek;->d:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lcom/yingyonghui/market/ck;->c:Lcom/yingyonghui/market/ActivityDetailNews;

    check-cast p1, Lcom/yingyonghui/market/model/m;

    invoke-static {v6, p1}, Lcom/yingyonghui/market/ActivityDetailNews;->a(Lcom/yingyonghui/market/ActivityDetailNews;Lcom/yingyonghui/market/model/m;)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_3

    .line 738
    :pswitch_1
    move-object v0, p1

    check-cast v0, Lcom/yingyonghui/market/model/i;

    move-object p2, v0

    iget-object v5, p2, Lcom/yingyonghui/market/model/i;->a:Ljava/lang/String;

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 739
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    move-object v0, p1

    check-cast v0, Lcom/yingyonghui/market/model/i;

    move-object p2, v0

    iget-object v5, p2, Lcom/yingyonghui/market/model/i;->a:Ljava/lang/String;

    invoke-static {v5}, Lcom/yingyonghui/market/util/y;->a(Ljava/lang/String;)Lcom/yingyonghui/market/model/h;

    move-result-object v5

    .line 740
    iget-object v6, v5, Lcom/yingyonghui/market/model/h;->a:Landroid/graphics/drawable/Drawable;

    .line 741
    if-eqz v6, :cond_3

    .line 742
    iget-object v5, p0, Lcom/yingyonghui/market/ck;->c:Lcom/yingyonghui/market/ActivityDetailNews;

    invoke-static {v5}, Lcom/yingyonghui/market/ActivityDetailNews;->d(Lcom/yingyonghui/market/ActivityDetailNews;)Landroid/widget/ImageView;

    move-result-object v5

    .line 744
    iget v7, p0, Lcom/yingyonghui/market/ck;->b:I

    const/16 v8, 0x50

    sub-int/2addr v7, v8

    int-to-float v7, v7

    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v8

    int-to-float v8, v8

    div-float/2addr v7, v8

    .line 746
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    iget v9, p0, Lcom/yingyonghui/market/ck;->b:I

    const/16 v10, 0x50

    sub-int/2addr v9, v10

    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v10

    int-to-float v10, v10

    mul-float/2addr v7, v10

    float-to-int v7, v7

    invoke-direct {v8, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 749
    const/4 v7, 0x1

    iput v7, v8, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 751
    invoke-virtual {v5, v8}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 753
    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 754
    invoke-virtual {v5}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 755
    iget-object v6, v2, Lcom/yingyonghui/market/ek;->d:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_3

    .line 757
    :cond_3
    iget-boolean v6, v5, Lcom/yingyonghui/market/model/h;->b:Z

    if-nez v6, :cond_0

    .line 758
    iget-object v6, p0, Lcom/yingyonghui/market/ck;->c:Lcom/yingyonghui/market/ActivityDetailNews;

    check-cast p1, Lcom/yingyonghui/market/model/i;

    invoke-static {v6, p1}, Lcom/yingyonghui/market/ActivityDetailNews;->a(Lcom/yingyonghui/market/ActivityDetailNews;Lcom/yingyonghui/market/model/i;)V

    .line 759
    const/4 v6, 0x1

    iput-boolean v6, v5, Lcom/yingyonghui/market/model/h;->b:Z

    goto/16 :goto_3

    .line 765
    :pswitch_2
    iget-object v5, p0, Lcom/yingyonghui/market/ck;->c:Lcom/yingyonghui/market/ActivityDetailNews;

    move-object v0, p1

    check-cast v0, Lcom/yingyonghui/market/model/c;

    move-object p2, v0

    invoke-static {v5, p2}, Lcom/yingyonghui/market/ActivityDetailNews;->a(Lcom/yingyonghui/market/ActivityDetailNews;Lcom/yingyonghui/market/model/c;)Landroid/view/View;

    move-result-object v5

    .line 766
    iget-object v6, v2, Lcom/yingyonghui/market/ek;->d:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 767
    move-object v0, p1

    check-cast v0, Lcom/yingyonghui/market/model/c;

    move-object p2, v0

    iget v6, p2, Lcom/yingyonghui/market/model/c;->a:I

    .line 769
    iget-object v7, p0, Lcom/yingyonghui/market/ck;->c:Lcom/yingyonghui/market/ActivityDetailNews;

    invoke-static {v7}, Lcom/yingyonghui/market/ActivityDetailNews;->e(Lcom/yingyonghui/market/ActivityDetailNews;)Ljava/util/HashMap;

    move-result-object v7

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/yingyonghui/market/j;

    .line 770
    if-eqz p2, :cond_7

    .line 771
    iget-object v7, p2, Lcom/yingyonghui/market/j;->a:Lcom/yingyonghui/market/model/j;

    if-eqz v7, :cond_5

    .line 772
    iget-object v7, p0, Lcom/yingyonghui/market/ck;->c:Lcom/yingyonghui/market/ActivityDetailNews;

    iget-object v8, p2, Lcom/yingyonghui/market/j;->a:Lcom/yingyonghui/market/model/j;

    invoke-static {v7, v5, v8}, Lcom/yingyonghui/market/ActivityDetailNews;->a(Lcom/yingyonghui/market/ActivityDetailNews;Landroid/view/View;Lcom/yingyonghui/market/model/j;)V

    .line 786
    :goto_4
    iget-object v7, p0, Lcom/yingyonghui/market/ck;->c:Lcom/yingyonghui/market/ActivityDetailNews;

    invoke-static {v7}, Lcom/yingyonghui/market/ActivityDetailNews;->f(Lcom/yingyonghui/market/ActivityDetailNews;)Ljava/util/HashMap;

    move-result-object v7

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 787
    iget-object v7, p0, Lcom/yingyonghui/market/ck;->c:Lcom/yingyonghui/market/ActivityDetailNews;

    invoke-static {v7}, Lcom/yingyonghui/market/ActivityDetailNews;->f(Lcom/yingyonghui/market/ActivityDetailNews;)Ljava/util/HashMap;

    move-result-object v7

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    iget-object v9, p0, Lcom/yingyonghui/market/ck;->c:Lcom/yingyonghui/market/ActivityDetailNews;

    invoke-static {v9}, Lcom/yingyonghui/market/ActivityDetailNews;->g(Lcom/yingyonghui/market/ActivityDetailNews;)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 788
    iget-object v7, p0, Lcom/yingyonghui/market/ck;->c:Lcom/yingyonghui/market/ActivityDetailNews;

    invoke-static {v7}, Lcom/yingyonghui/market/ActivityDetailNews;->h(Lcom/yingyonghui/market/ActivityDetailNews;)I

    .line 791
    :cond_4
    iget-object v7, p0, Lcom/yingyonghui/market/ck;->c:Lcom/yingyonghui/market/ActivityDetailNews;

    invoke-static {v7}, Lcom/yingyonghui/market/ActivityDetailNews;->i(Lcom/yingyonghui/market/ActivityDetailNews;)Ljava/util/HashMap;

    move-result-object v7

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 793
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {v6}, Lcom/yingyonghui/market/util/y;->a(I)Lcom/yingyonghui/market/model/h;

    move-result-object v6

    .line 794
    iget-object v6, v6, Lcom/yingyonghui/market/model/h;->a:Landroid/graphics/drawable/Drawable;

    .line 795
    if-eqz v6, :cond_0

    .line 796
    const v7, 0x7f0b003f

    invoke-virtual {v5, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    .line 797
    if-eqz p1, :cond_0

    .line 798
    invoke-virtual {p1, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 799
    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    goto/16 :goto_3

    .line 774
    :cond_5
    iget-boolean v7, p2, Lcom/yingyonghui/market/j;->b:Z

    if-nez v7, :cond_6

    .line 775
    iget-object v7, p0, Lcom/yingyonghui/market/ck;->c:Lcom/yingyonghui/market/ActivityDetailNews;

    check-cast p1, Lcom/yingyonghui/market/model/c;

    invoke-static {v7, p1}, Lcom/yingyonghui/market/ActivityDetailNews;->b(Lcom/yingyonghui/market/ActivityDetailNews;Lcom/yingyonghui/market/model/c;)V

    .line 777
    :cond_6
    const/4 v7, 0x1

    iput-boolean v7, p2, Lcom/yingyonghui/market/j;->b:Z

    goto :goto_4

    .line 780
    :cond_7
    new-instance v7, Lcom/yingyonghui/market/j;

    invoke-direct {v7}, Lcom/yingyonghui/market/j;-><init>()V

    .line 781
    const/4 v8, 0x1

    iput-boolean v8, v7, Lcom/yingyonghui/market/j;->b:Z

    .line 782
    iget-object v8, p0, Lcom/yingyonghui/market/ck;->c:Lcom/yingyonghui/market/ActivityDetailNews;

    invoke-static {v8}, Lcom/yingyonghui/market/ActivityDetailNews;->e(Lcom/yingyonghui/market/ActivityDetailNews;)Ljava/util/HashMap;

    move-result-object v8

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v9, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 783
    iget-object v7, p0, Lcom/yingyonghui/market/ck;->c:Lcom/yingyonghui/market/ActivityDetailNews;

    check-cast p1, Lcom/yingyonghui/market/model/c;

    invoke-static {v7, p1}, Lcom/yingyonghui/market/ActivityDetailNews;->b(Lcom/yingyonghui/market/ActivityDetailNews;Lcom/yingyonghui/market/model/c;)V

    goto/16 :goto_4

    .line 808
    :cond_8
    return-object v1

    .line 733
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
