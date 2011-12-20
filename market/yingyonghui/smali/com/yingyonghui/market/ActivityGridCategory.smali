.class public Lcom/yingyonghui/market/ActivityGridCategory;
.super Lcom/yingyonghui/market/HttpServiceSupportForActivity;
.source "ActivityGridCategory.java"


# instance fields
.field private c:Ljava/lang/String;

.field private d:I

.field private e:Ljava/lang/String;

.field private f:Landroid/widget/GridView;

.field private g:Landroid/view/View;

.field private h:Landroid/widget/TextView;

.field private i:Lcom/yingyonghui/market/dq;

.field private j:Lcom/yingyonghui/market/log/m;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;-><init>()V

    .line 158
    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityGridCategory;)I
    .locals 1
    .parameter

    .prologue
    .line 32
    iget v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->d:I

    return v0
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityGridCategory;)Lcom/yingyonghui/market/log/m;
    .locals 1
    .parameter

    .prologue
    .line 32
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->j:Lcom/yingyonghui/market/log/m;

    return-object v0
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 4
    .parameter

    .prologue
    .line 131
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 132
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p0}, Lcom/yingyonghui/market/util/y;->a(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 142
    :cond_0
    :goto_0
    return-object v0

    .line 135
    :cond_1
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p1}, Lcom/yingyonghui/market/util/y;->a(Ljava/lang/String;)Lcom/yingyonghui/market/model/h;

    move-result-object v0

    .line 136
    iget-object v0, v0, Lcom/yingyonghui/market/model/h;->a:Landroid/graphics/drawable/Drawable;

    .line 137
    if-nez v0, :cond_0

    .line 138
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p0}, Lcom/yingyonghui/market/util/y;->a(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 139
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityGridCategory;->a:Lcom/yingyonghui/market/a/d;

    const/16 v2, 0x3e3

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityGridCategory;->b:Landroid/os/Handler;

    invoke-virtual {v1, p1, v2, v3}, Lcom/yingyonghui/market/a/d;->d(Ljava/lang/String;ILandroid/os/Handler;)V

    goto :goto_0
.end method

.method protected final a(Landroid/os/Message;)V
    .locals 5
    .parameter

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 100
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/yingyonghui/market/a/a;

    .line 101
    iget v1, v0, Lcom/yingyonghui/market/a/a;->c:I

    .line 102
    const/16 v2, 0x3e3

    if-ne v1, v2, :cond_1

    .line 103
    iget-object v1, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    .line 104
    array-length v2, v1

    invoke-static {v1, v3, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 105
    if-eqz v1, :cond_0

    .line 106
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 107
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/yingyonghui/market/util/y;->a(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 108
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->i:Lcom/yingyonghui/market/dq;

    invoke-virtual {v0}, Lcom/yingyonghui/market/dq;->notifyDataSetChanged()V

    .line 127
    :cond_0
    :goto_0
    return-void

    .line 110
    :cond_1
    const/16 v2, 0x3e4

    if-ne v1, v2, :cond_0

    .line 111
    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget v1, p0, Lcom/yingyonghui/market/ActivityGridCategory;->d:I

    invoke-static {v0, v1}, Lcom/yingyonghui/market/a/d;->a(Ljava/lang/String;I)Ljava/util/ArrayList;

    move-result-object v0

    .line 115
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 116
    new-instance v1, Lcom/yingyonghui/market/dq;

    invoke-direct {v1, p0, p0, v0}, Lcom/yingyonghui/market/dq;-><init>(Lcom/yingyonghui/market/ActivityGridCategory;Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object v1, p0, Lcom/yingyonghui/market/ActivityGridCategory;->i:Lcom/yingyonghui/market/dq;

    .line 117
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->f:Landroid/widget/GridView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityGridCategory;->i:Lcom/yingyonghui/market/dq;

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 119
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->g:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 120
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->h:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 121
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->f:Landroid/widget/GridView;

    invoke-virtual {v0, v3}, Landroid/widget/GridView;->setVisibility(I)V

    goto :goto_0

    .line 123
    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->g:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 124
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->h:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter

    .prologue
    .line 51
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onCreate(Landroid/os/Bundle;)V

    .line 53
    if-nez p1, :cond_3

    .line 54
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityGridCategory;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 55
    if-eqz v0, :cond_0

    const-string v1, "category_type"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    iput-object v1, p0, Lcom/yingyonghui/market/ActivityGridCategory;->c:Ljava/lang/String;

    .line 56
    if-eqz v0, :cond_1

    const-string v1, "category_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    :goto_1
    iput v1, p0, Lcom/yingyonghui/market/ActivityGridCategory;->d:I

    .line 57
    if-eqz v0, :cond_2

    const-string v1, "fromPage"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_2
    iput-object v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->e:Ljava/lang/String;

    .line 64
    :goto_3
    const v0, 0x7f03001b

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityGridCategory;->setContentView(I)V

    .line 67
    const v0, 0x7f0b00bb

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityGridCategory;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->g:Landroid/view/View;

    .line 68
    const v0, 0x7f0b0081

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityGridCategory;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/GridView;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->f:Landroid/widget/GridView;

    .line 69
    const v0, 0x7f0b0082

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityGridCategory;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->h:Landroid/widget/TextView;

    .line 72
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->a:Lcom/yingyonghui/market/a/d;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityGridCategory;->c:Ljava/lang/String;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityGridCategory;->b:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/a/d;->a(Ljava/lang/String;Landroid/os/Handler;)V

    .line 74
    new-instance v0, Lcom/yingyonghui/market/log/m;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityGridCategory;->e:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->j:Lcom/yingyonghui/market/log/m;

    .line 75
    return-void

    .line 55
    :cond_0
    const-string v1, ""

    goto :goto_0

    .line 56
    :cond_1
    const/4 v1, -0x1

    goto :goto_1

    .line 57
    :cond_2
    const-string v0, ""

    goto :goto_2

    .line 59
    :cond_3
    const-string v0, "category_type"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->c:Ljava/lang/String;

    .line 60
    const-string v0, "category_id"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->d:I

    .line 61
    const-string v0, "fromPage"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityGridCategory;->e:Ljava/lang/String;

    goto :goto_3
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter

    .prologue
    .line 84
    const-string v0, "category_type"

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityGridCategory;->c:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    const-string v0, "category_id"

    iget v1, p0, Lcom/yingyonghui/market/ActivityGridCategory;->d:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 86
    const-string v0, "fromPage"

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityGridCategory;->e:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 88
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .prologue
    .line 79
    const/4 v0, 0x0

    return v0
.end method
