.class public abstract Lcom/yingyonghui/market/AbsActivityAppListManager;
.super Lcom/yingyonghui/market/HttpServiceSupportForActivity;
.source "AbsActivityAppListManager.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field private c:I

.field private d:Landroid/view/View;

.field protected e:Landroid/widget/ListView;

.field protected f:Landroid/widget/RadioButton;

.field protected g:Landroid/widget/RadioButton;

.field protected h:Landroid/widget/RadioButton;

.field protected i:Landroid/view/View;

.field protected j:Landroid/view/View;

.field protected k:Landroid/widget/RadioGroup;

.field protected l:Landroid/widget/TextView;

.field protected m:Landroid/widget/RadioButton;

.field protected n:Landroid/widget/RadioButton;

.field protected o:Landroid/widget/RadioButton;

.field protected p:I

.field protected q:Ljava/util/concurrent/ConcurrentHashMap;

.field protected r:Lcom/yingyonghui/market/log/m;

.field private s:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;-><init>()V

    .line 43
    const/16 v0, 0x63

    iput v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->c:I

    .line 62
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->q:Ljava/util/concurrent/ConcurrentHashMap;

    .line 64
    new-instance v0, Lcom/yingyonghui/market/cc;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/cc;-><init>(Lcom/yingyonghui/market/AbsActivityAppListManager;)V

    iput-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->s:Landroid/os/Handler;

    .line 83
    invoke-virtual {p0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->b()Lcom/yingyonghui/market/log/m;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->r:Lcom/yingyonghui/market/log/m;

    .line 449
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 4
    .parameter

    .prologue
    .line 137
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 138
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p0}, Lcom/yingyonghui/market/util/y;->a(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 147
    :cond_0
    :goto_0
    return-object v0

    .line 140
    :cond_1
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p1}, Lcom/yingyonghui/market/util/y;->a(Ljava/lang/String;)Lcom/yingyonghui/market/model/h;

    move-result-object v0

    .line 141
    iget-object v0, v0, Lcom/yingyonghui/market/model/h;->a:Landroid/graphics/drawable/Drawable;

    .line 142
    if-nez v0, :cond_0

    .line 143
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p0}, Lcom/yingyonghui/market/util/y;->a(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 144
    iget-object v1, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->a:Lcom/yingyonghui/market/a/d;

    const/16 v2, 0x63

    iget-object v3, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->b:Landroid/os/Handler;

    invoke-virtual {v1, p1, v2, v3}, Lcom/yingyonghui/market/a/d;->d(Ljava/lang/String;ILandroid/os/Handler;)V

    goto :goto_0
.end method

.method public abstract a(I)V
.end method

.method public abstract a(Landroid/widget/ArrayAdapter;)V
.end method

.method final a(Z)V
    .locals 4
    .parameter

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 155
    if-eqz p1, :cond_3

    .line 156
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->d:Landroid/view/View;

    if-eqz v0, :cond_1

    .line 158
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->j:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 159
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->j:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 161
    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->d:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 163
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->e:Landroid/widget/ListView;

    if-eqz v0, :cond_2

    .line 164
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->e:Landroid/widget/ListView;

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setVisibility(I)V

    .line 179
    :cond_2
    :goto_0
    return-void

    .line 168
    :cond_3
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->d:Landroid/view/View;

    if-eqz v0, :cond_5

    .line 170
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->j:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_4

    .line 171
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->j:Landroid/view/View;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 173
    :cond_4
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->d:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 175
    :cond_5
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->e:Landroid/widget/ListView;

    if-eqz v0, :cond_2

    .line 176
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->e:Landroid/widget/ListView;

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setVisibility(I)V

    goto :goto_0
.end method

.method protected b()Lcom/yingyonghui/market/log/m;
    .locals 2

    .prologue
    .line 86
    new-instance v0, Lcom/yingyonghui/market/log/m;

    const-string v1, "Manage"

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method protected final b(Landroid/widget/ArrayAdapter;)V
    .locals 2
    .parameter

    .prologue
    .line 309
    const/4 v0, 0x0

    .line 310
    iget-object v1, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->k:Landroid/widget/RadioGroup;

    invoke-virtual {v1}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 319
    :goto_0
    if-eqz v0, :cond_0

    .line 320
    invoke-virtual {p1, v0}, Landroid/widget/ArrayAdapter;->sort(Ljava/util/Comparator;)V

    .line 322
    :cond_0
    return-void

    .line 312
    :pswitch_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->f(I)Ljava/util/Comparator;

    move-result-object v0

    goto :goto_0

    .line 315
    :pswitch_1
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->f(I)Ljava/util/Comparator;

    move-result-object v0

    goto :goto_0

    .line 310
    :pswitch_data_0
    .packed-switch 0x7f0b00cb
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected c()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 99
    const v0, 0x7f0b00bb

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->d:Landroid/view/View;

    .line 100
    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->e:Landroid/widget/ListView;

    .line 101
    invoke-static {}, Lcom/yingyonghui/market/util/p;->a()I

    move-result v0

    const/4 v1, 0x4

    if-le v0, v1, :cond_0

    .line 103
    :try_start_0
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->e:Landroid/widget/ListView;

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

    .line 104
    iget-object v1, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->e:Landroid/widget/ListView;

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

    .line 109
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->e:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 110
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->e:Landroid/widget/ListView;

    const v1, 0x7f0b0066

    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/AbsActivityAppListManager;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 112
    const v0, 0x7f0b00c3

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->f:Landroid/widget/RadioButton;

    .line 113
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->f:Landroid/widget/RadioButton;

    invoke-virtual {v0, p0}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    const v0, 0x7f0b00c4

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->g:Landroid/widget/RadioButton;

    .line 115
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->g:Landroid/widget/RadioButton;

    invoke-virtual {v0, p0}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    const v0, 0x7f0b00c5

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->h:Landroid/widget/RadioButton;

    .line 117
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->h:Landroid/widget/RadioButton;

    invoke-virtual {v0, p0}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    const v0, 0x7f0b00c6

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->j:Landroid/view/View;

    .line 122
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->j:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setEnabled(Z)V

    .line 123
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->j:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 125
    const v0, 0x7f0b00c8

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->i:Landroid/view/View;

    .line 126
    const v0, 0x7f0b00c9

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->l:Landroid/widget/TextView;

    .line 127
    const v0, 0x7f0b00ca

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioGroup;

    iput-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->k:Landroid/widget/RadioGroup;

    .line 128
    const v0, 0x7f0b00cb

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->m:Landroid/widget/RadioButton;

    .line 129
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->m:Landroid/widget/RadioButton;

    invoke-virtual {v0, p0}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 130
    const v0, 0x7f0b00cc

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->n:Landroid/widget/RadioButton;

    .line 131
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->n:Landroid/widget/RadioButton;

    invoke-virtual {v0, p0}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 132
    const v0, 0x7f0b00cd

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->o:Landroid/widget/RadioButton;

    .line 133
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->o:Landroid/widget/RadioButton;

    invoke-virtual {v0, p0}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 134
    return-void

    .line 105
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto/16 :goto_0
.end method

.method protected final e(I)V
    .locals 5
    .parameter

    .prologue
    const/4 v4, 0x0

    const v3, 0x7f02009e

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 219
    if-ne p1, v2, :cond_1

    .line 220
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->f:Landroid/widget/RadioButton;

    invoke-virtual {v0, v3}, Landroid/widget/RadioButton;->setBackgroundResource(I)V

    .line 221
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->f:Landroid/widget/RadioButton;

    invoke-virtual {v0, v2}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 222
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->g:Landroid/widget/RadioButton;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 223
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->h:Landroid/widget/RadioButton;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 235
    :cond_0
    :goto_0
    iput p1, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->p:I

    .line 236
    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/AbsActivityAppListManager;->a(Z)V

    .line 237
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->s:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 238
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->s:Landroid/os/Handler;

    iget-object v1, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->s:Landroid/os/Handler;

    const/16 v2, 0x66

    iget v3, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->p:I

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 240
    return-void

    .line 224
    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    .line 225
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->g:Landroid/widget/RadioButton;

    invoke-virtual {v0, v3}, Landroid/widget/RadioButton;->setBackgroundResource(I)V

    .line 226
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->g:Landroid/widget/RadioButton;

    invoke-virtual {v0, v2}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 227
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->f:Landroid/widget/RadioButton;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 228
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->h:Landroid/widget/RadioButton;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 229
    :cond_2
    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    .line 230
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->h:Landroid/widget/RadioButton;

    invoke-virtual {v0, v3}, Landroid/widget/RadioButton;->setBackgroundResource(I)V

    .line 231
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->h:Landroid/widget/RadioButton;

    invoke-virtual {v0, v2}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 232
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->f:Landroid/widget/RadioButton;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 233
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->g:Landroid/widget/RadioButton;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method protected final f(I)Ljava/util/Comparator;
    .locals 1
    .parameter

    .prologue
    .line 326
    packed-switch p1, :pswitch_data_0

    .line 398
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 328
    :pswitch_0
    new-instance v0, Lcom/yingyonghui/market/cd;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/cd;-><init>(Lcom/yingyonghui/market/AbsActivityAppListManager;)V

    goto :goto_0

    .line 358
    :pswitch_1
    new-instance v0, Lcom/yingyonghui/market/ca;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/ca;-><init>(Lcom/yingyonghui/market/AbsActivityAppListManager;)V

    goto :goto_0

    .line 383
    :pswitch_2
    new-instance v0, Lcom/yingyonghui/market/cb;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/cb;-><init>(Lcom/yingyonghui/market/AbsActivityAppListManager;)V

    goto :goto_0

    .line 326
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public final h()Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->q:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method

.method protected final i()Lcom/yingyonghui/market/log/m;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->r:Lcom/yingyonghui/market/log/m;

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter

    .prologue
    const/16 v1, 0x8

    const/16 v3, 0x65

    .line 183
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 204
    :goto_0
    :pswitch_0
    return-void

    .line 185
    :pswitch_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->e(I)V

    goto :goto_0

    .line 188
    :pswitch_2
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->e(I)V

    goto :goto_0

    .line 191
    :pswitch_3
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->e(I)V

    goto :goto_0

    .line 196
    :pswitch_4
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->s:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 197
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->s:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 198
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->e:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->a(Landroid/widget/ArrayAdapter;)V

    goto :goto_0

    .line 201
    :pswitch_5
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->i:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->i:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->j:Landroid/view/View;

    const v1, 0x7f02001c

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->s:Landroid/os/Handler;

    const-wide/16 v1, 0x1388

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->i:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->j:Landroid/view/View;

    const v1, 0x7f02001e

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    iget-object v0, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->s:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_0

    .line 183
    :pswitch_data_0
    .packed-switch 0x7f0b00c3
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 244
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    .line 246
    if-nez v0, :cond_0

    .line 305
    :goto_0
    return-void

    .line 250
    :cond_0
    const/4 v1, 0x0

    .line 251
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 252
    const-class v3, Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, p0, v3}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 254
    instance-of v3, v0, Landroid/content/pm/ApplicationInfo;

    if-eqz v3, :cond_2

    .line 255
    check-cast v0, Landroid/content/pm/ApplicationInfo;

    .line 256
    invoke-virtual {p0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/yingyonghui/market/MarketApplication;

    .line 257
    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/yingyonghui/market/MarketApplication;->c(Ljava/lang/String;)Lcom/yingyonghui/market/model/l;

    move-result-object v0

    .line 258
    if-eqz v0, :cond_1

    .line 259
    const-string v1, "_id"

    iget v3, v0, Lcom/yingyonghui/market/model/l;->e:I

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 260
    const-string v1, "title"

    iget-object v3, v0, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 261
    const-string v1, "installed"

    iget v3, v0, Lcom/yingyonghui/market/model/l;->n:I

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 262
    const-string v1, "pkgName"

    iget-object v3, v0, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 263
    const-string v1, "size"

    iget v3, v0, Lcom/yingyonghui/market/model/l;->o:I

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 264
    const-string v1, "versionCode"

    iget v3, v0, Lcom/yingyonghui/market/model/l;->s:I

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 300
    :goto_1
    const-string v1, "from"

    iget-object v3, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->r:Lcom/yingyonghui/market/log/m;

    const-string v4, "index"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/yingyonghui/market/log/m;

    move-result-object v3

    invoke-virtual {v3}, Lcom/yingyonghui/market/log/m;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 301
    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/AbsActivityAppListManager;->startActivity(Landroid/content/Intent;)V

    .line 303
    if-nez v0, :cond_7

    const/4 v0, -0x1

    .line 304
    :goto_2
    invoke-virtual {p0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->r:Lcom/yingyonghui/market/log/m;

    const-string v3, ""

    invoke-static {v1, v2, v3, p3, v0}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/lang/String;II)V

    goto :goto_0

    .line 266
    :cond_1
    const v0, 0x7f0900f4

    invoke-static {p0, v0}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto :goto_0

    .line 270
    :cond_2
    instance-of v3, v0, Lcom/yingyonghui/market/model/l;

    if-eqz v3, :cond_4

    .line 272
    check-cast v0, Lcom/yingyonghui/market/model/l;

    move-object v1, v0

    .line 278
    :cond_3
    :goto_3
    if-eqz v1, :cond_8

    iget v0, v1, Lcom/yingyonghui/market/model/l;->e:I

    if-nez v0, :cond_8

    iget-object v0, v1, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    if-eqz v0, :cond_8

    .line 279
    invoke-virtual {p0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/MarketApplication;

    .line 280
    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/MarketApplication;->c(Ljava/lang/String;)Lcom/yingyonghui/market/model/l;

    move-result-object v0

    .line 283
    :goto_4
    if-nez v0, :cond_5

    .line 284
    const v0, 0x7f090130

    invoke-static {p0, v0}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 273
    :cond_4
    instance-of v3, v0, Ljava/io/File;

    if-eqz v3, :cond_3

    .line 274
    check-cast v0, Ljava/io/File;

    .line 275
    iget-object v1, p0, Lcom/yingyonghui/market/AbsActivityAppListManager;->q:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/l;

    move-object v1, v0

    goto :goto_3

    .line 288
    :cond_5
    iget v1, v0, Lcom/yingyonghui/market/model/l;->e:I

    if-eqz v1, :cond_6

    .line 289
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    iget v1, v0, Lcom/yingyonghui/market/model/l;->e:I

    iget-object v3, v0, Lcom/yingyonghui/market/model/l;->h:Landroid/graphics/drawable/Drawable;

    invoke-static {v1, v3}, Lcom/yingyonghui/market/util/y;->a(ILandroid/graphics/drawable/Drawable;)V

    .line 292
    :cond_6
    const-string v1, "_id"

    iget v3, v0, Lcom/yingyonghui/market/model/l;->e:I

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 293
    const-string v1, "title"

    iget-object v3, v0, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 294
    const-string v1, "installed"

    iget v3, v0, Lcom/yingyonghui/market/model/l;->n:I

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 295
    const-string v1, "pkgName"

    iget-object v3, v0, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 296
    const-string v1, "size"

    iget v3, v0, Lcom/yingyonghui/market/model/l;->o:I

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 297
    const-string v1, "versionCode"

    iget v3, v0, Lcom/yingyonghui/market/model/l;->s:I

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto/16 :goto_1

    .line 303
    :cond_7
    iget v0, v0, Lcom/yingyonghui/market/model/l;->e:I

    goto/16 :goto_2

    :cond_8
    move-object v0, v1

    goto :goto_4
.end method
