.class final Lcom/yingyonghui/market/t;
.super Landroid/widget/ArrayAdapter;
.source "ActivityListNews.java"


# instance fields
.field private final a:Landroid/view/LayoutInflater;

.field private synthetic b:Lcom/yingyonghui/market/ActivityListNews;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/ActivityListNews;Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 315
    iput-object p1, p0, Lcom/yingyonghui/market/t;->b:Lcom/yingyonghui/market/ActivityListNews;

    .line 316
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 317
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/t;->a:Landroid/view/LayoutInflater;

    .line 318
    return-void
.end method


# virtual methods
.method public final getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v8, 0x0

    .line 322
    invoke-virtual {p0, p1}, Lcom/yingyonghui/market/t;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/e;

    .line 323
    if-nez p2, :cond_0

    .line 326
    iget-object v1, p0, Lcom/yingyonghui/market/t;->a:Landroid/view/LayoutInflater;

    const v2, 0x7f030037

    invoke-virtual {v1, v2, p3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 327
    new-instance v3, Lcom/yingyonghui/market/be;

    invoke-direct {v3}, Lcom/yingyonghui/market/be;-><init>()V

    .line 328
    const v1, 0x7f0b00d6

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, v3, Lcom/yingyonghui/market/be;->a:Landroid/widget/LinearLayout;

    .line 329
    const v1, 0x7f0b003f

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, v3, Lcom/yingyonghui/market/be;->b:Landroid/widget/ImageView;

    .line 330
    const v1, 0x7f0b00d4

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v3, Lcom/yingyonghui/market/be;->c:Landroid/widget/TextView;

    .line 331
    const v1, 0x7f0b00d8

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v3, Lcom/yingyonghui/market/be;->d:Landroid/widget/TextView;

    .line 332
    const v1, 0x7f0b00d9

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v3, Lcom/yingyonghui/market/be;->e:Landroid/widget/TextView;

    .line 333
    const v1, 0x7f0b00d7

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, v3, Lcom/yingyonghui/market/be;->f:Landroid/widget/ImageView;

    .line 335
    invoke-virtual {v2, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    move-object v1, v3

    .line 340
    :goto_0
    rem-int/lit8 v3, p1, 0x2

    if-eqz v3, :cond_1

    .line 341
    iget-object v3, v1, Lcom/yingyonghui/market/be;->a:Landroid/widget/LinearLayout;

    const v4, 0x7f020055

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 346
    :goto_1
    iget-object v3, v1, Lcom/yingyonghui/market/be;->c:Landroid/widget/TextView;

    iget-object v4, v0, Lcom/yingyonghui/market/model/e;->b:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 347
    iget-object v3, v1, Lcom/yingyonghui/market/be;->d:Landroid/widget/TextView;

    iget-object v4, v0, Lcom/yingyonghui/market/model/e;->d:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 348
    iget-object v3, v1, Lcom/yingyonghui/market/be;->e:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/yingyonghui/market/t;->b:Lcom/yingyonghui/market/ActivityListNews;

    const v5, 0x7f090110

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    iget v7, v0, Lcom/yingyonghui/market/model/e;->c:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v4, v5, v6}, Lcom/yingyonghui/market/ActivityListNews;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 349
    iget-boolean v3, v0, Lcom/yingyonghui/market/model/e;->g:Z

    if-eqz v3, :cond_2

    .line 350
    iget-object v3, v1, Lcom/yingyonghui/market/be;->f:Landroid/widget/ImageView;

    const v4, 0x7f02002e

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 351
    iget-object v3, v1, Lcom/yingyonghui/market/be;->f:Landroid/widget/ImageView;

    invoke-virtual {v3, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 361
    :goto_2
    iget-object v3, p0, Lcom/yingyonghui/market/t;->b:Lcom/yingyonghui/market/ActivityListNews;

    iget-object v0, v0, Lcom/yingyonghui/market/model/e;->h:Ljava/lang/String;

    invoke-virtual {v3, v0}, Lcom/yingyonghui/market/ActivityListNews;->a(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 362
    iget-object v1, v1, Lcom/yingyonghui/market/be;->b:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 363
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 364
    return-object v2

    .line 337
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yingyonghui/market/be;

    move-object v2, p2

    goto :goto_0

    .line 343
    :cond_1
    iget-object v3, v1, Lcom/yingyonghui/market/be;->a:Landroid/widget/LinearLayout;

    const v4, 0x7f020056

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    goto :goto_1

    .line 352
    :cond_2
    iget-boolean v3, v0, Lcom/yingyonghui/market/model/e;->f:Z

    if-eqz v3, :cond_3

    .line 353
    iget-object v3, v1, Lcom/yingyonghui/market/be;->f:Landroid/widget/ImageView;

    const v4, 0x7f020025

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 354
    iget-object v3, v1, Lcom/yingyonghui/market/be;->f:Landroid/widget/ImageView;

    invoke-virtual {v3, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_2

    .line 355
    :cond_3
    iget-boolean v3, v0, Lcom/yingyonghui/market/model/e;->e:Z

    if-eqz v3, :cond_4

    .line 356
    iget-object v3, v1, Lcom/yingyonghui/market/be;->f:Landroid/widget/ImageView;

    const v4, 0x7f020026

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 357
    iget-object v3, v1, Lcom/yingyonghui/market/be;->f:Landroid/widget/ImageView;

    invoke-virtual {v3, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_2

    .line 359
    :cond_4
    iget-object v3, v1, Lcom/yingyonghui/market/be;->f:Landroid/widget/ImageView;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_2
.end method
