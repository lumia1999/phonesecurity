.class public Lcom/yingyonghui/market/ActivityListNews;
.super Lcom/yingyonghui/market/HttpServiceSupportForListActivity;
.source "ActivityListNews.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# static fields
.field private static c:Ljava/util/ArrayList;

.field private static l:Z


# instance fields
.field private d:Landroid/widget/ListView;

.field private e:Landroid/view/View;

.field private f:Landroid/view/View;

.field private g:Lcom/yingyonghui/market/t;

.field private h:Lcom/yingyonghui/market/log/m;

.field private i:Landroid/content/BroadcastReceiver;

.field private j:Landroid/widget/AbsListView$OnScrollListener;

.field private k:I

.field private m:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/yingyonghui/market/ActivityListNews;->c:Ljava/util/ArrayList;

    .line 273
    const/4 v0, 0x0

    sput-boolean v0, Lcom/yingyonghui/market/ActivityListNews;->l:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 37
    invoke-direct {p0}, Lcom/yingyonghui/market/HttpServiceSupportForListActivity;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->h:Lcom/yingyonghui/market/log/m;

    .line 92
    new-instance v0, Lcom/yingyonghui/market/at;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/at;-><init>(Lcom/yingyonghui/market/ActivityListNews;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->i:Landroid/content/BroadcastReceiver;

    .line 131
    new-instance v0, Lcom/yingyonghui/market/as;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/as;-><init>(Lcom/yingyonghui/market/ActivityListNews;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->j:Landroid/widget/AbsListView$OnScrollListener;

    .line 272
    iput v1, p0, Lcom/yingyonghui/market/ActivityListNews;->k:I

    .line 275
    iput-boolean v1, p0, Lcom/yingyonghui/market/ActivityListNews;->m:Z

    .line 312
    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListNews;)Lcom/yingyonghui/market/t;
    .locals 1
    .parameter

    .prologue
    .line 37
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->g:Lcom/yingyonghui/market/t;

    return-object v0
.end method

.method static synthetic a()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 37
    sget-object v0, Lcom/yingyonghui/market/ActivityListNews;->c:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 172
    sget-object v0, Lcom/yingyonghui/market/ActivityListNews;->c:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    move-object v0, v3

    .line 179
    :goto_0
    return-object v0

    .line 175
    :cond_0
    sget-object v0, Lcom/yingyonghui/market/ActivityListNews;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 176
    sget-object v1, Lcom/yingyonghui/market/ActivityListNews;->c:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v2

    if-gt v0, v1, :cond_1

    if-gtz v0, :cond_2

    :cond_1
    move-object v0, v3

    .line 177
    goto :goto_0

    .line 179
    :cond_2
    sget-object v1, Lcom/yingyonghui/market/ActivityListNews;->c:Ljava/util/ArrayList;

    sub-int/2addr v0, v2

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    move-object v0, p0

    goto :goto_0
.end method

.method private b()V
    .locals 3

    .prologue
    .line 278
    sget-boolean v0, Lcom/yingyonghui/market/ActivityListNews;->l:Z

    if-eqz v0, :cond_1

    .line 286
    :cond_0
    :goto_0
    return-void

    .line 281
    :cond_1
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListNews;->m:Z

    if-nez v0, :cond_0

    .line 282
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivityListNews;->m:Z

    .line 284
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->a:Lcom/yingyonghui/market/a/d;

    iget v1, p0, Lcom/yingyonghui/market/ActivityListNews;->k:I

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityListNews;->b:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/a/d;->b(ILandroid/os/Handler;)V

    goto :goto_0
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityListNews;)V
    .locals 0
    .parameter

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityListNews;->b()V

    return-void
.end method

.method public static c(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 185
    sget-object v0, Lcom/yingyonghui/market/ActivityListNews;->c:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    move-object v0, v3

    .line 197
    :goto_0
    return-object v0

    .line 189
    :cond_0
    sget-object v0, Lcom/yingyonghui/market/ActivityListNews;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 190
    sget-object v1, Lcom/yingyonghui/market/ActivityListNews;->c:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v2

    if-ge v0, v1, :cond_1

    if-gez v0, :cond_3

    .line 191
    :cond_1
    sget-boolean v0, Lcom/yingyonghui/market/ActivityListNews;->l:Z

    if-nez v0, :cond_2

    .line 192
    invoke-static {v2}, Lcom/yingyonghui/market/ActivityDetailNews;->a(Z)V

    :cond_2
    move-object v0, v3

    .line 195
    goto :goto_0

    .line 197
    :cond_3
    sget-object v1, Lcom/yingyonghui/market/ActivityListNews;->c:Ljava/util/ArrayList;

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    move-object v0, p0

    goto :goto_0
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 4
    .parameter

    .prologue
    .line 157
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p1}, Lcom/yingyonghui/market/util/y;->a(Ljava/lang/String;)Lcom/yingyonghui/market/model/h;

    move-result-object v0

    .line 158
    iget-object v0, v0, Lcom/yingyonghui/market/model/h;->a:Landroid/graphics/drawable/Drawable;

    .line 159
    if-nez v0, :cond_0

    .line 160
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p0}, Lcom/yingyonghui/market/util/y;->a(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 161
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListNews;->a:Lcom/yingyonghui/market/a/d;

    const/16 v2, 0x385

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityListNews;->b:Landroid/os/Handler;

    invoke-virtual {v1, p1, v2, v3}, Lcom/yingyonghui/market/a/d;->d(Ljava/lang/String;ILandroid/os/Handler;)V

    .line 164
    :cond_0
    return-object v0
.end method

.method protected final a(Landroid/os/Message;)V
    .locals 6
    .parameter

    .prologue
    const/4 v5, 0x0

    .line 205
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/yingyonghui/market/a/a;

    .line 206
    iget v1, v0, Lcom/yingyonghui/market/a/a;->c:I

    .line 207
    const/16 v2, 0x384

    if-ne v1, v2, :cond_9

    .line 208
    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/yingyonghui/market/a/d;->b(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 210
    sget-object v0, Lcom/yingyonghui/market/ActivityListNews;->c:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 211
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v5

    .line 213
    :goto_0
    if-ge v3, v2, :cond_1

    .line 214
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/e;

    .line 215
    if-eqz v0, :cond_0

    .line 216
    sget-object v4, Lcom/yingyonghui/market/ActivityListNews;->c:Ljava/util/ArrayList;

    iget-object v0, v0, Lcom/yingyonghui/market/model/e;->a:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 213
    :cond_0
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_0

    .line 221
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->g:Lcom/yingyonghui/market/t;

    if-nez v0, :cond_7

    .line 222
    new-instance v0, Lcom/yingyonghui/market/t;

    invoke-direct {v0, p0, p0, v1}, Lcom/yingyonghui/market/t;-><init>(Lcom/yingyonghui/market/ActivityListNews;Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->g:Lcom/yingyonghui/market/t;

    .line 223
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->d:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityListNews;->g:Lcom/yingyonghui/market/t;

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 233
    :cond_2
    :goto_1
    if-eqz v1, :cond_3

    .line 234
    iget v0, p0, Lcom/yingyonghui/market/ActivityListNews;->k:I

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v0, v2

    iput v0, p0, Lcom/yingyonghui/market/ActivityListNews;->k:I

    .line 237
    :cond_3
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0xa

    if-ge v0, v1, :cond_5

    .line 238
    :cond_4
    const/4 v0, 0x1

    sput-boolean v0, Lcom/yingyonghui/market/ActivityListNews;->l:Z

    .line 239
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->d:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getFooterViewsCount()I

    move-result v0

    if-lez v0, :cond_5

    .line 240
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->d:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListNews;->e:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->removeFooterView(Landroid/view/View;)Z

    .line 244
    :cond_5
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->f:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 245
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->d:Landroid/widget/ListView;

    invoke-virtual {v0, v5}, Landroid/widget/ListView;->setVisibility(I)V

    .line 246
    iput-boolean v5, p0, Lcom/yingyonghui/market/ActivityListNews;->m:Z

    .line 248
    invoke-static {}, Lcom/yingyonghui/market/ActivityDetailNews;->a()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 249
    invoke-static {v5}, Lcom/yingyonghui/market/ActivityDetailNews;->a(Z)V

    .line 250
    new-instance v0, Landroid/content/Intent;

    const-string v1, "request_news_list_complete"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 252
    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListNews;->sendBroadcast(Landroid/content/Intent;)V

    .line 263
    :cond_6
    :goto_2
    return-void

    .line 224
    :cond_7
    if-eqz v1, :cond_2

    .line 225
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v2, v5

    .line 226
    :goto_3
    if-ge v2, v0, :cond_8

    .line 227
    iget-object v3, p0, Lcom/yingyonghui/market/ActivityListNews;->g:Lcom/yingyonghui/market/t;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/yingyonghui/market/t;->add(Ljava/lang/Object;)V

    .line 226
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 230
    :cond_8
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->g:Lcom/yingyonghui/market/t;

    invoke-virtual {v0}, Lcom/yingyonghui/market/t;->notifyDataSetChanged()V

    goto :goto_1

    .line 254
    :cond_9
    const/16 v2, 0x385

    if-ne v1, v2, :cond_6

    .line 255
    iget-object v1, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    .line 256
    array-length v2, v1

    invoke-static {v1, v5, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 257
    if-eqz v1, :cond_6

    .line 258
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 259
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/yingyonghui/market/util/y;->a(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 260
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->g:Lcom/yingyonghui/market/t;

    invoke-virtual {v0}, Lcom/yingyonghui/market/t;->notifyDataSetChanged()V

    goto :goto_2
.end method

.method protected final b(Landroid/os/Message;)V
    .locals 1
    .parameter

    .prologue
    .line 267
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivityListNews;->m:Z

    .line 268
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForListActivity;->b(Landroid/os/Message;)V

    .line 269
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter

    .prologue
    .line 54
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 55
    const v0, 0x7f030011

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListNews;->setContentView(I)V

    .line 57
    const v0, 0x7f0b00bb

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListNews;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->f:Landroid/view/View;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListNews;->getListView()Landroid/widget/ListView;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->d:Landroid/widget/ListView;

    invoke-static {}, Lcom/yingyonghui/market/util/p;->a()I

    move-result v0

    const/4 v1, 0x4

    if-le v0, v1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->d:Landroid/widget/ListView;

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

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListNews;->d:Landroid/widget/ListView;

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
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030012

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->e:Landroid/view/View;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->d:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListNews;->e:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->d:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->d:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListNews;->j:Landroid/widget/AbsListView$OnScrollListener;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityListNews;->b()V

    .line 58
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "request_more_news_list"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListNews;->i:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/yingyonghui/market/ActivityListNews;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 60
    new-instance v0, Lcom/yingyonghui/market/log/m;

    const-string v1, "NewsList"

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->h:Lcom/yingyonghui/market/log/m;

    .line 61
    return-void

    .line 57
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 65
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForListActivity;->onDestroy()V

    .line 66
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->g:Lcom/yingyonghui/market/t;

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->g:Lcom/yingyonghui/market/t;

    invoke-virtual {v0}, Lcom/yingyonghui/market/t;->clear()V

    .line 69
    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->d:Landroid/widget/ListView;

    if-eqz v0, :cond_1

    .line 70
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->d:Landroid/widget/ListView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 73
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListNews;->i:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListNews;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 74
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 291
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/e;

    .line 292
    if-eqz v0, :cond_0

    .line 293
    iget-object v0, v0, Lcom/yingyonghui/market/model/e;->a:Ljava/lang/String;

    .line 294
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 295
    const-class v2, Lcom/yingyonghui/market/ActivityDetailNews;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 296
    const-string v2, "url"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 297
    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/ActivityListNews;->startActivity(Landroid/content/Intent;)V

    .line 299
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListNews;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListNews;->h:Lcom/yingyonghui/market/log/m;

    const-string v2, ""

    const/4 v3, -0x1

    invoke-static {v0, v1, v2, p3, v3}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/lang/String;II)V

    .line 301
    :cond_0
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .prologue
    .line 78
    const/4 v0, 0x0

    return v0
.end method
