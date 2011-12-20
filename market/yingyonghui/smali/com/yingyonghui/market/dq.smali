.class final Lcom/yingyonghui/market/dq;
.super Landroid/widget/ArrayAdapter;
.source "ActivityGridCategory.java"


# instance fields
.field final synthetic a:Lcom/yingyonghui/market/ActivityGridCategory;

.field private b:Landroid/view/LayoutInflater;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/ActivityGridCategory;Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 2
    .parameter
    .parameter
    .parameter

    .prologue
    .line 162
    iput-object p1, p0, Lcom/yingyonghui/market/dq;->a:Lcom/yingyonghui/market/ActivityGridCategory;

    .line 163
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 165
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v0

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    .line 166
    new-instance v0, Lcom/yingyonghui/market/model/k;

    invoke-direct {v0}, Lcom/yingyonghui/market/model/k;-><init>()V

    .line 167
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/yingyonghui/market/model/k;->e:Z

    .line 168
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/yingyonghui/market/dq;->insert(Ljava/lang/Object;I)V

    .line 170
    :cond_0
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/dq;->b:Landroid/view/LayoutInflater;

    .line 171
    return-void
.end method


# virtual methods
.method public final getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9
    .parameter
    .parameter
    .parameter

    .prologue
    const/16 v8, 0x8

    const/4 v7, 0x1

    const/4 v6, 0x4

    const/4 v5, 0x0

    .line 180
    invoke-virtual {p0, p1}, Lcom/yingyonghui/market/dq;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/k;

    .line 182
    if-nez p2, :cond_1

    .line 184
    iget-object v1, p0, Lcom/yingyonghui/market/dq;->b:Landroid/view/LayoutInflater;

    const v2, 0x7f030019

    invoke-virtual {v1, v2, p3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 185
    new-instance v3, Lcom/yingyonghui/market/cs;

    invoke-direct {v3}, Lcom/yingyonghui/market/cs;-><init>()V

    .line 186
    const v1, 0x7f0b0078

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, v3, Lcom/yingyonghui/market/cs;->a:Landroid/widget/RelativeLayout;

    .line 187
    const v1, 0x7f0b0079

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, v3, Lcom/yingyonghui/market/cs;->b:Landroid/widget/ImageView;

    .line 188
    const v1, 0x7f0b007a

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v3, Lcom/yingyonghui/market/cs;->c:Landroid/widget/TextView;

    .line 189
    const v1, 0x7f0b007b

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v3, Lcom/yingyonghui/market/cs;->d:Landroid/widget/TextView;

    .line 190
    const v1, 0x7f0b007d

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, v3, Lcom/yingyonghui/market/cs;->e:Landroid/widget/ImageView;

    .line 191
    const v1, 0x7f0b007c

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, v3, Lcom/yingyonghui/market/cs;->f:Landroid/widget/ImageView;

    .line 192
    invoke-virtual {v2, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    move-object v1, v3

    .line 198
    :goto_0
    rem-int/lit8 v3, p1, 0x4

    if-eqz v3, :cond_0

    rem-int/lit8 v3, p1, 0x4

    if-ne v3, v7, :cond_2

    .line 199
    :cond_0
    iget-object v3, v1, Lcom/yingyonghui/market/cs;->a:Landroid/widget/RelativeLayout;

    const v4, 0x7f020056

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 204
    :goto_1
    iget-object v3, v1, Lcom/yingyonghui/market/cs;->a:Landroid/widget/RelativeLayout;

    new-instance v4, Lcom/yingyonghui/market/bf;

    invoke-direct {v4, p0, v0, p1}, Lcom/yingyonghui/market/bf;-><init>(Lcom/yingyonghui/market/dq;Lcom/yingyonghui/market/model/k;I)V

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 229
    rem-int/lit8 v3, p1, 0x2

    if-nez v3, :cond_3

    .line 230
    iget-object v3, v1, Lcom/yingyonghui/market/cs;->e:Landroid/widget/ImageView;

    invoke-virtual {v3, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 231
    iget-object v3, v1, Lcom/yingyonghui/market/cs;->f:Landroid/widget/ImageView;

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 237
    :goto_2
    iget-boolean v3, v0, Lcom/yingyonghui/market/model/k;->e:Z

    if-eqz v3, :cond_4

    .line 238
    iget-object v0, v1, Lcom/yingyonghui/market/cs;->a:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v5}, Landroid/widget/RelativeLayout;->setClickable(Z)V

    .line 239
    iget-object v0, v1, Lcom/yingyonghui/market/cs;->b:Landroid/widget/ImageView;

    invoke-virtual {v0, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 240
    iget-object v0, v1, Lcom/yingyonghui/market/cs;->c:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 241
    iget-object v0, v1, Lcom/yingyonghui/market/cs;->d:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 252
    :goto_3
    return-object v2

    .line 194
    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yingyonghui/market/cs;

    move-object v2, p2

    goto :goto_0

    .line 201
    :cond_2
    iget-object v3, v1, Lcom/yingyonghui/market/cs;->a:Landroid/widget/RelativeLayout;

    const v4, 0x7f020055

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    goto :goto_1

    .line 233
    :cond_3
    iget-object v3, v1, Lcom/yingyonghui/market/cs;->e:Landroid/widget/ImageView;

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 234
    iget-object v3, v1, Lcom/yingyonghui/market/cs;->f:Landroid/widget/ImageView;

    invoke-virtual {v3, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_2

    .line 243
    :cond_4
    iget-object v3, v1, Lcom/yingyonghui/market/cs;->a:Landroid/widget/RelativeLayout;

    invoke-virtual {v3, v7}, Landroid/widget/RelativeLayout;->setClickable(Z)V

    .line 244
    iget-object v3, v1, Lcom/yingyonghui/market/cs;->b:Landroid/widget/ImageView;

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 245
    iget-object v3, v1, Lcom/yingyonghui/market/cs;->c:Landroid/widget/TextView;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 246
    iget-object v3, v1, Lcom/yingyonghui/market/cs;->d:Landroid/widget/TextView;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 247
    iget-object v3, v1, Lcom/yingyonghui/market/cs;->b:Landroid/widget/ImageView;

    iget-object v4, p0, Lcom/yingyonghui/market/dq;->a:Lcom/yingyonghui/market/ActivityGridCategory;

    iget-object v5, v0, Lcom/yingyonghui/market/model/k;->d:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/yingyonghui/market/ActivityGridCategory;->a(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 248
    iget-object v3, v1, Lcom/yingyonghui/market/cs;->c:Landroid/widget/TextView;

    iget-object v4, v0, Lcom/yingyonghui/market/model/k;->b:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 249
    iget-object v1, v1, Lcom/yingyonghui/market/cs;->d:Landroid/widget/TextView;

    iget-object v0, v0, Lcom/yingyonghui/market/model/k;->c:Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3
.end method

.method public final isEnabled(I)Z
    .locals 1
    .parameter

    .prologue
    .line 175
    const/4 v0, 0x0

    return v0
.end method
