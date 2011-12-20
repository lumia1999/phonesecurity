.class public Lcom/yingyonghui/market/ActivitySearchSuggestion;
.super Lcom/yingyonghui/market/HttpServiceSupportForActivity;
.source "ActivitySearchSuggestion.java"


# instance fields
.field private c:Landroid/view/View;

.field private d:Landroid/widget/LinearLayout;

.field private e:Landroid/view/View;

.field private f:I

.field private g:I

.field private h:F

.field private i:Ljava/lang/String;

.field private j:I

.field private k:Ljava/lang/String;

.field private l:Z

.field private m:Landroid/view/View;

.field private n:Landroid/view/View;

.field private o:Landroid/widget/TextView;

.field private p:Landroid/widget/TextView;

.field private q:Lcom/yingyonghui/market/log/m;

.field private r:Ljava/util/ArrayList;

.field private s:Landroid/view/View$OnClickListener;

.field private t:I

.field private u:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;-><init>()V

    .line 36
    const-string v0, ""

    iput-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->i:Ljava/lang/String;

    .line 37
    const/4 v0, 0x3

    iput v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->j:I

    .line 38
    const-string v0, ""

    iput-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->k:Ljava/lang/String;

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->q:Lcom/yingyonghui/market/log/m;

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->r:Ljava/util/ArrayList;

    .line 127
    new-instance v0, Lcom/yingyonghui/market/ct;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/ct;-><init>(Lcom/yingyonghui/market/ActivitySearchSuggestion;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->s:Landroid/view/View$OnClickListener;

    .line 267
    const/4 v0, 0x0

    iput v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->t:I

    .line 268
    const/16 v0, 0x14

    iput v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->u:I

    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivitySearchSuggestion;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 27
    iput-object p1, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->i:Ljava/lang/String;

    return-object p1
.end method

.method private a()V
    .locals 14

    .prologue
    .line 138
    :try_start_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->d:Landroid/widget/LinearLayout;

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->d:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    const/4 v3, 0x2

    sub-int/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->removeViews(II)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 144
    :goto_0
    iget v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    const/high16 v1, 0x3f80

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 145
    const/16 v0, 0x16

    move v1, v0

    .line 152
    :goto_1
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    .line 153
    iget v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->g:I

    .line 158
    :goto_2
    const/4 v2, 0x0

    .line 159
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    add-int/lit8 v5, v1, 0x11

    int-to-float v5, v5

    iget v6, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    mul-float/2addr v5, v6

    float-to-int v5, v5

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 163
    const/high16 v4, 0x40a0

    iget v5, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    mul-float/2addr v4, v5

    float-to-int v4, v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 164
    const/high16 v4, 0x40a0

    iget v5, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    mul-float/2addr v4, v5

    float-to-int v4, v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 165
    const/16 v4, 0xf

    sub-int v4, v1, v4

    int-to-float v4, v4

    iget v5, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    mul-float/2addr v4, v5

    float-to-int v4, v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 166
    const/16 v4, 0xf

    sub-int v4, v1, v4

    int-to-float v4, v4

    iget v5, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    mul-float/2addr v4, v5

    float-to-int v4, v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 167
    const/16 v4, 0x11

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 168
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    const/4 v6, -0x1

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 169
    const/high16 v5, 0x40a0

    iget v6, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    mul-float/2addr v5, v6

    float-to-int v5, v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 170
    const/high16 v5, 0x40a0

    iget v6, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    mul-float/2addr v5, v6

    float-to-int v5, v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 171
    const/4 v5, 0x0

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 172
    const/4 v5, 0x0

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 173
    const/16 v5, 0x11

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 174
    iget v5, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iget v6, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    add-int/2addr v5, v6

    sub-int v5, v0, v5

    move v0, v2

    .line 176
    :goto_3
    iget-object v2, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->r:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_5

    .line 178
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 179
    const/4 v6, 0x0

    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 180
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    move v6, v0

    move v7, v5

    .line 182
    :goto_4
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->r:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v6, v0, :cond_4

    .line 183
    new-instance v8, Landroid/widget/TextView;

    invoke-direct {v8, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 184
    int-to-float v0, v1

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 185
    invoke-virtual {v8}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v9

    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->r:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v9, v0}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v0

    const/high16 v9, 0x41a0

    iget v10, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    mul-float/2addr v9, v10

    add-float/2addr v0, v9

    float-to-double v9, v0

    const-wide/high16 v11, 0x3fe0

    add-double/2addr v9, v11

    double-to-int v9, v9

    .line 186
    iget v0, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iget v10, v4, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    add-int/2addr v0, v10

    add-int/2addr v0, v9

    if-le v7, v0, :cond_3

    .line 187
    invoke-virtual {v8, v4}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 188
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v10, 0x7f08000c

    invoke-virtual {v0, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 190
    invoke-static {}, Lcom/yingyonghui/market/util/p;->a()I

    move-result v0

    const/4 v10, 0x3

    if-ne v0, v10, :cond_2

    .line 191
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->r:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 195
    :goto_5
    const v0, 0x7f020094

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 196
    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setWidth(I)V

    .line 197
    const/high16 v0, 0x4120

    iget v10, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    mul-float/2addr v0, v10

    float-to-int v0, v0

    const/high16 v10, 0x40a0

    iget v11, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    mul-float/2addr v10, v11

    float-to-int v10, v10

    const/high16 v11, 0x4120

    iget v12, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    mul-float/2addr v11, v12

    float-to-int v11, v11

    const/high16 v12, 0x40a0

    iget v13, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    mul-float/2addr v12, v13

    float-to-int v12, v12

    invoke-virtual {v8, v0, v10, v11, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 198
    new-instance v0, Lcom/yingyonghui/market/cu;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/cu;-><init>(Lcom/yingyonghui/market/ActivitySearchSuggestion;)V

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 220
    invoke-virtual {v2, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 221
    iget v0, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iget v8, v4, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    add-int/2addr v0, v8

    add-int/2addr v0, v9

    sub-int v0, v7, v0

    .line 222
    add-int/lit8 v6, v6, 0x1

    move v7, v0

    goto/16 :goto_4

    .line 139
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto/16 :goto_0

    .line 147
    :cond_0
    const/16 v0, 0x12

    move v1, v0

    goto/16 :goto_1

    .line 155
    :cond_1
    iget v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->f:I

    goto/16 :goto_2

    .line 193
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "<u>"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->r:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v10, "</u>"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 223
    :cond_3
    if-lt v7, v5, :cond_4

    .line 225
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto/16 :goto_4

    .line 231
    :cond_4
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->d:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    move v0, v6

    .line 176
    goto/16 :goto_3

    .line 233
    :cond_5
    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivitySearchSuggestion;)V
    .locals 0
    .parameter

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->b()V

    return-void
.end method

.method private b()V
    .locals 4

    .prologue
    .line 271
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->a:Lcom/yingyonghui/market/a/d;

    iget v1, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->t:I

    iget v2, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->u:I

    iget-object v3, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->b:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3}, Lcom/yingyonghui/market/a/d;->b(IILandroid/os/Handler;)V

    .line 272
    return-void
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivitySearchSuggestion;)Z
    .locals 1
    .parameter

    .prologue
    .line 27
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->l:Z

    return v0
.end method

.method static synthetic c(Lcom/yingyonghui/market/ActivitySearchSuggestion;)Z
    .locals 1
    .parameter

    .prologue
    .line 27
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->l:Z

    return v0
.end method

.method static synthetic d(Lcom/yingyonghui/market/ActivitySearchSuggestion;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 27
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->i:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic e(Lcom/yingyonghui/market/ActivitySearchSuggestion;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 27
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->k:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic f(Lcom/yingyonghui/market/ActivitySearchSuggestion;)I
    .locals 1
    .parameter

    .prologue
    .line 27
    iget v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->j:I

    return v0
.end method


# virtual methods
.method protected final a(Landroid/os/Message;)V
    .locals 5
    .parameter

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 237
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/yingyonghui/market/a/a;

    .line 238
    iget v1, v0, Lcom/yingyonghui/market/a/a;->c:I

    .line 239
    const/16 v2, 0x3e2

    if-ne v1, v2, :cond_1

    .line 240
    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/yingyonghui/market/a/d;->a(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 241
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 242
    iget-object v1, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->r:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 243
    iget-object v1, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->r:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 244
    iget v1, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->t:I

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->t:I

    .line 246
    iget v1, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->t:I

    const/16 v2, 0xc8

    if-lt v1, v2, :cond_0

    .line 247
    iput v3, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->t:I

    .line 250
    :cond_0
    iget-object v1, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->n:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 252
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->a()V

    .line 253
    iget-object v1, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->e:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 254
    iget-object v1, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->c:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 256
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 257
    iget v2, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->t:I

    add-int/lit16 v2, v2, 0xc8

    sub-int/2addr v2, v1

    rem-int/lit16 v2, v2, 0xc8

    .line 258
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->q:Lcom/yingyonghui/market/log/m;

    invoke-static {v4, v2, v1, v0}, Lcom/yingyonghui/market/log/h;->g(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 264
    :cond_1
    :goto_0
    return-void

    .line 260
    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->e:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 261
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->c:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .parameter

    .prologue
    .line 77
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 78
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->a()V

    .line 79
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 8
    .parameter

    .prologue
    const/high16 v7, 0x4120

    const/high16 v6, 0x40a0

    const/16 v5, 0x8

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 53
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onCreate(Landroid/os/Bundle;)V

    .line 55
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 56
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v1, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->f:I

    .line 57
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v1, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->g:I

    .line 58
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iput v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    .line 60
    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->requestWindowFeature(I)Z

    .line 61
    const v0, 0x103000a

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->setTheme(I)V

    .line 63
    const v0, 0x7f030044

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->setContentView(I)V

    .line 65
    const v0, 0x7f0b00bb

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->c:Landroid/view/View;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->c:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f0b00f7

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->d:Landroid/widget/LinearLayout;

    const v0, 0x7f0b00f6

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->e:Landroid/view/View;

    invoke-static {}, Lcom/yingyonghui/market/util/p;->a()I

    move-result v0

    const/4 v1, 0x4

    if-le v0, v1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->e:Landroid/view/View;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "setScrollbarFadingEnabled"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->e:Landroid/view/View;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->e:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f0b0092

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->m:Landroid/view/View;

    const v0, 0x7f0b0135

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->n:Landroid/view/View;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->m:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->n:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f0b0093

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->o:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->o:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->s:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {}, Lcom/yingyonghui/market/util/p;->a()I

    move-result v0

    const/4 v1, 0x3

    if-le v0, v1, :cond_1

    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->o:Landroid/widget/TextView;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    :goto_1
    const v0, 0x7f0b0136

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->p:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->p:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->s:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0}, Lcom/yingyonghui/market/ActivitySearchSuggestion;->b()V

    .line 67
    new-instance v0, Lcom/yingyonghui/market/log/m;

    const-string v1, "SearchHotWords"

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->q:Lcom/yingyonghui/market/log/m;

    .line 68
    return-void

    .line 65
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->o:Landroid/widget/TextView;

    iget v1, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    mul-float/2addr v1, v7

    float-to-int v1, v1

    iget v2, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    mul-float/2addr v2, v6

    float-to-int v2, v2

    iget v3, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    mul-float/2addr v3, v7

    float-to-int v3, v3

    iget v4, p0, Lcom/yingyonghui/market/ActivitySearchSuggestion;->h:F

    mul-float/2addr v4, v6

    float-to-int v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    goto :goto_1
.end method

.method public onSearchRequested()Z
    .locals 1

    .prologue
    .line 72
    const/4 v0, 0x0

    return v0
.end method
