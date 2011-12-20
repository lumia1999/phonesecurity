.class public final Lcom/yingyonghui/market/ActivityListApp;
.super Lcom/yingyonghui/market/HttpServiceSupportForActivity;
.source "ActivityListApp.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# static fields
.field private static final c:Ljava/lang/String;


# instance fields
.field private A:I

.field private B:I

.field private C:I

.field private D:Z

.field private E:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

.field private F:Lcom/yingyonghui/market/cz;

.field private G:Ljava/util/ArrayList;

.field private H:Lcom/yingyonghui/market/l;

.field private final I:I

.field private J:Z

.field private K:Z

.field private L:Ljava/lang/Thread;

.field private final M:Ljava/util/ArrayList;

.field private final N:Ljava/util/ArrayList;

.field private final O:I

.field private final P:Landroid/content/BroadcastReceiver;

.field private Q:Landroid/os/Handler;

.field private R:Landroid/widget/AbsListView$OnScrollListener;

.field private final d:I

.field private e:I

.field private f:Z

.field private g:Landroid/view/View;

.field private h:Landroid/widget/ListView;

.field private i:Landroid/view/View;

.field private j:Landroid/view/View;

.field private k:Landroid/view/View;

.field private l:Lcom/yingyonghui/market/bc;

.field private m:Z

.field private n:Ljava/lang/String;

.field private o:Lcom/yingyonghui/market/log/m;

.field private p:Z

.field private q:Z

.field private r:Ljava/lang/String;

.field private s:I

.field private t:Ljava/lang/String;

.field private u:Ljava/lang/String;

.field private v:I

.field private w:Ljava/lang/String;

.field private x:Ljava/lang/String;

.field private y:Ljava/lang/String;

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    const-class v0, Lcom/yingyonghui/market/ActivityListApp;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/ActivityListApp;->c:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 44
    invoke-direct {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;-><init>()V

    .line 57
    const/16 v0, 0xa

    iput v0, p0, Lcom/yingyonghui/market/ActivityListApp;->d:I

    .line 80
    const-string v0, ""

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->x:Ljava/lang/String;

    .line 81
    const-string v0, ""

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->y:Ljava/lang/String;

    .line 82
    const/4 v0, 0x3

    iput v0, p0, Lcom/yingyonghui/market/ActivityListApp;->z:I

    .line 83
    const/4 v0, 0x2

    iput v0, p0, Lcom/yingyonghui/market/ActivityListApp;->A:I

    .line 90
    iput v1, p0, Lcom/yingyonghui/market/ActivityListApp;->C:I

    .line 97
    const/16 v0, 0xfa0

    iput v0, p0, Lcom/yingyonghui/market/ActivityListApp;->I:I

    .line 99
    iput-boolean v1, p0, Lcom/yingyonghui/market/ActivityListApp;->J:Z

    .line 101
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->L:Ljava/lang/Thread;

    .line 102
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->M:Ljava/util/ArrayList;

    .line 103
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->N:Ljava/util/ArrayList;

    .line 104
    const/4 v0, 0x7

    iput v0, p0, Lcom/yingyonghui/market/ActivityListApp;->O:I

    .line 312
    new-instance v0, Lcom/yingyonghui/market/cn;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/cn;-><init>(Lcom/yingyonghui/market/ActivityListApp;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->P:Landroid/content/BroadcastReceiver;

    .line 687
    new-instance v0, Lcom/yingyonghui/market/cp;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/cp;-><init>(Lcom/yingyonghui/market/ActivityListApp;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->Q:Landroid/os/Handler;

    .line 725
    new-instance v0, Lcom/yingyonghui/market/co;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/co;-><init>(Lcom/yingyonghui/market/ActivityListApp;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->R:Landroid/widget/AbsListView$OnScrollListener;

    .line 867
    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListApp;I)I
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 44
    iput p1, p0, Lcom/yingyonghui/market/ActivityListApp;->z:I

    return p1
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListApp;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListApp;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 44
    iput-object p1, p0, Lcom/yingyonghui/market/ActivityListApp;->x:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListApp;[BLjava/lang/String;)V
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    const/16 v2, 0x64

    .line 44
    const/4 v0, 0x0

    array-length v1, p1

    invoke-static {p1, v0, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v1, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p2, v1}, Lcom/yingyonghui/market/util/y;->a(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    :cond_0
    invoke-static {}, Ljava/lang/System;->gc()V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->Q:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->Q:Landroid/os/Handler;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->Q:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListApp;Z)Z
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 44
    iput-boolean p1, p0, Lcom/yingyonghui/market/ActivityListApp;->J:Z

    return p1
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityListApp;I)I
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 44
    iput p1, p0, Lcom/yingyonghui/market/ActivityListApp;->A:I

    return p1
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityListApp;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 44
    iput-object p1, p0, Lcom/yingyonghui/market/ActivityListApp;->y:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityListApp;)Z
    .locals 1
    .parameter

    .prologue
    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivityListApp;->f:Z

    return v0
.end method

.method static synthetic c(Lcom/yingyonghui/market/ActivityListApp;)I
    .locals 1
    .parameter

    .prologue
    .line 44
    const/4 v0, 0x0

    iput v0, p0, Lcom/yingyonghui/market/ActivityListApp;->e:I

    return v0
.end method

.method static synthetic c(Lcom/yingyonghui/market/ActivityListApp;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 4
    .parameter
    .parameter

    .prologue
    .line 44
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p0}, Lcom/yingyonghui/market/util/y;->b(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p1}, Lcom/yingyonghui/market/util/y;->a(Ljava/lang/String;)Lcom/yingyonghui/market/model/h;

    move-result-object v0

    iget-object v1, v0, Lcom/yingyonghui/market/model/h;->a:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_1

    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p0}, Lcom/yingyonghui/market/util/y;->b(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget-boolean v2, v0, Lcom/yingyonghui/market/model/h;->b:Z

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityListApp;->a:Lcom/yingyonghui/market/a/d;

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityListApp;->b:Landroid/os/Handler;

    invoke-virtual {v2, p1, v3}, Lcom/yingyonghui/market/a/d;->c(Ljava/lang/String;Landroid/os/Handler;)V

    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/yingyonghui/market/model/h;->b:Z

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method

.method private c()V
    .locals 6

    .prologue
    .line 349
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListApp;->f:Z

    if-eqz v0, :cond_1

    .line 373
    :cond_0
    :goto_0
    return-void

    .line 352
    :cond_1
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListApp;->p:Z

    if-nez v0, :cond_0

    .line 353
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivityListApp;->p:Z

    .line 354
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    const-string v1, "app.list.featured"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 355
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->a:Lcom/yingyonghui/market/a/d;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    iget v2, p0, Lcom/yingyonghui/market/ActivityListApp;->e:I

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityListApp;->b:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3}, Lcom/yingyonghui/market/a/d;->a(Ljava/lang/String;ILandroid/os/Handler;)V

    goto :goto_0

    .line 356
    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    const-string v1, "Latest"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    const-string v1, "app.list.category"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 357
    :cond_3
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->a:Lcom/yingyonghui/market/a/d;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    iget v2, p0, Lcom/yingyonghui/market/ActivityListApp;->s:I

    iget v3, p0, Lcom/yingyonghui/market/ActivityListApp;->e:I

    iget-object v4, p0, Lcom/yingyonghui/market/ActivityListApp;->t:Ljava/lang/String;

    iget-object v5, p0, Lcom/yingyonghui/market/ActivityListApp;->b:Landroid/os/Handler;

    invoke-virtual/range {v0 .. v5}, Lcom/yingyonghui/market/a/d;->a(Ljava/lang/String;IILjava/lang/String;Landroid/os/Handler;)V

    goto :goto_0

    .line 358
    :cond_4
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    const-string v1, "app.list.fast"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 359
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->a:Lcom/yingyonghui/market/a/d;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    iget v2, p0, Lcom/yingyonghui/market/ActivityListApp;->e:I

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityListApp;->t:Ljava/lang/String;

    iget-object v4, p0, Lcom/yingyonghui/market/ActivityListApp;->b:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/yingyonghui/market/a/d;->a(Ljava/lang/String;ILjava/lang/String;Landroid/os/Handler;)V

    goto :goto_0

    .line 360
    :cond_5
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    const-string v1, "app.list.rank"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 361
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->a:Lcom/yingyonghui/market/a/d;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityListApp;->t:Ljava/lang/String;

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityListApp;->u:Ljava/lang/String;

    iget v4, p0, Lcom/yingyonghui/market/ActivityListApp;->e:I

    iget-object v5, p0, Lcom/yingyonghui/market/ActivityListApp;->b:Landroid/os/Handler;

    invoke-virtual/range {v0 .. v5}, Lcom/yingyonghui/market/a/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/os/Handler;)V

    goto :goto_0

    .line 362
    :cond_6
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    const-string v1, "relative_app"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 363
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->a:Lcom/yingyonghui/market/a/d;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->w:Ljava/lang/String;

    iget v2, p0, Lcom/yingyonghui/market/ActivityListApp;->e:I

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityListApp;->b:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3}, Lcom/yingyonghui/market/a/d;->b(Ljava/lang/String;ILandroid/os/Handler;)V

    goto/16 :goto_0

    .line 364
    :cond_7
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    const-string v1, "search"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 365
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->a:Lcom/yingyonghui/market/a/d;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->x:Ljava/lang/String;

    iget v2, p0, Lcom/yingyonghui/market/ActivityListApp;->B:I

    const/16 v3, 0x64

    iget-object v4, p0, Lcom/yingyonghui/market/ActivityListApp;->b:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/yingyonghui/market/a/d;->a(Ljava/lang/String;IILandroid/os/Handler;)V

    goto/16 :goto_0
.end method

.method static synthetic d(Lcom/yingyonghui/market/ActivityListApp;)I
    .locals 1
    .parameter

    .prologue
    .line 44
    const/4 v0, 0x0

    iput v0, p0, Lcom/yingyonghui/market/ActivityListApp;->B:I

    return v0
.end method

.method static synthetic e(Lcom/yingyonghui/market/ActivityListApp;)Lcom/yingyonghui/market/bc;
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->l:Lcom/yingyonghui/market/bc;

    return-object v0
.end method

.method static synthetic f(Lcom/yingyonghui/market/ActivityListApp;)Lcom/yingyonghui/market/bc;
    .locals 1
    .parameter

    .prologue
    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->l:Lcom/yingyonghui/market/bc;

    return-object v0
.end method

.method static synthetic g(Lcom/yingyonghui/market/ActivityListApp;)Landroid/view/View;
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->g:Landroid/view/View;

    return-object v0
.end method

.method static synthetic h(Lcom/yingyonghui/market/ActivityListApp;)Landroid/widget/ListView;
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic i(Lcom/yingyonghui/market/ActivityListApp;)Landroid/view/View;
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->k:Landroid/view/View;

    return-object v0
.end method

.method static synthetic j(Lcom/yingyonghui/market/ActivityListApp;)V
    .locals 0
    .parameter

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityListApp;->c()V

    return-void
.end method

.method static synthetic k(Lcom/yingyonghui/market/ActivityListApp;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->x:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic l(Lcom/yingyonghui/market/ActivityListApp;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->M:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic m(Lcom/yingyonghui/market/ActivityListApp;)Z
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListApp;->K:Z

    return v0
.end method

.method static synthetic n(Lcom/yingyonghui/market/ActivityListApp;)Z
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListApp;->J:Z

    return v0
.end method

.method static synthetic o(Lcom/yingyonghui/market/ActivityListApp;)V
    .locals 6
    .parameter

    .prologue
    .line 44
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->N:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-ge v2, v1, :cond_0

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityListApp;->a:Lcom/yingyonghui/market/a/d;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->N:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/16 v4, 0x63

    iget-object v5, p0, Lcom/yingyonghui/market/ActivityListApp;->b:Landroid/os/Handler;

    invoke-virtual {v3, v0, v4, v5}, Lcom/yingyonghui/market/a/d;->d(Ljava/lang/String;ILandroid/os/Handler;)V

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->N:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_1
    return-void
.end method

.method static synthetic p(Lcom/yingyonghui/market/ActivityListApp;)Z
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListApp;->m:Z

    return v0
.end method

.method static synthetic q(Lcom/yingyonghui/market/ActivityListApp;)Lcom/yingyonghui/market/widget/SlowSpeedGallery;
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->E:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    return-object v0
.end method

.method static synthetic r(Lcom/yingyonghui/market/ActivityListApp;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->G:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 4
    .parameter

    .prologue
    .line 652
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 653
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p0}, Lcom/yingyonghui/market/util/y;->a(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 661
    :cond_0
    :goto_0
    return-object v0

    .line 655
    :cond_1
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p1}, Lcom/yingyonghui/market/util/y;->a(Ljava/lang/String;)Lcom/yingyonghui/market/model/h;

    move-result-object v0

    .line 656
    iget-object v0, v0, Lcom/yingyonghui/market/model/h;->a:Landroid/graphics/drawable/Drawable;

    .line 657
    if-nez v0, :cond_0

    .line 658
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p0}, Lcom/yingyonghui/market/util/y;->a(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 659
    iget-boolean v1, p0, Lcom/yingyonghui/market/ActivityListApp;->J:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->a:Lcom/yingyonghui/market/a/d;

    const/16 v2, 0x63

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityListApp;->b:Landroid/os/Handler;

    invoke-virtual {v1, p1, v2, v3}, Lcom/yingyonghui/market/a/d;->d(Ljava/lang/String;ILandroid/os/Handler;)V

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->N:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->N:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x7

    if-le v1, v2, :cond_3

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->N:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_3
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->N:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public final a()Lcom/yingyonghui/market/log/m;
    .locals 1

    .prologue
    .line 246
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->o:Lcom/yingyonghui/market/log/m;

    return-object v0
.end method

.method protected final a(Landroid/os/Message;)V
    .locals 9
    .parameter

    .prologue
    const/4 v8, 0x2

    const/16 v7, 0x8

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 377
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/yingyonghui/market/a/a;

    .line 378
    iget v1, v0, Lcom/yingyonghui/market/a/a;->c:I

    packed-switch v1, :pswitch_data_0

    .line 491
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 387
    :pswitch_1
    const/4 v1, 0x0

    .line 388
    iget v2, v0, Lcom/yingyonghui/market/a/a;->c:I

    const/16 v3, 0x64

    if-ne v2, v3, :cond_7

    .line 389
    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/yingyonghui/market/a/d;->b(Landroid/content/Context;Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v2

    .line 390
    if-eqz v2, :cond_15

    array-length v0, v2

    if-ne v0, v8, :cond_15

    .line 391
    aget-object v0, v2, v5

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/yingyonghui/market/ActivityListApp;->B:I

    .line 392
    aget-object v0, v2, v6

    check-cast v0, Ljava/util/ArrayList;

    .line 400
    :goto_1
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->l:Lcom/yingyonghui/market/bc;

    if-nez v1, :cond_8

    .line 401
    new-instance v1, Lcom/yingyonghui/market/bc;

    iget v2, p0, Lcom/yingyonghui/market/ActivityListApp;->v:I

    invoke-direct {v1, p0, v0, v2}, Lcom/yingyonghui/market/bc;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I)V

    iput-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->l:Lcom/yingyonghui/market/bc;

    .line 402
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityListApp;->l:Lcom/yingyonghui/market/bc;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 414
    :cond_1
    :goto_2
    if-eqz v0, :cond_2

    .line 415
    iget v1, p0, Lcom/yingyonghui/market/ActivityListApp;->e:I

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/yingyonghui/market/ActivityListApp;->e:I

    .line 418
    :cond_2
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/16 v2, 0xa

    if-ge v1, v2, :cond_4

    .line 420
    :cond_3
    iput-boolean v6, p0, Lcom/yingyonghui/market/ActivityListApp;->f:Z

    .line 421
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityListApp;->j:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->removeFooterView(Landroid/view/View;)Z

    .line 423
    :cond_4
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    invoke-interface {v1}, Landroid/widget/ListAdapter;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 424
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->k:Landroid/view/View;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 427
    :cond_5
    iget-boolean v1, p0, Lcom/yingyonghui/market/ActivityListApp;->m:Z

    if-eqz v1, :cond_b

    .line 428
    iput-boolean v6, p0, Lcom/yingyonghui/market/ActivityListApp;->D:Z

    .line 429
    iget v1, p0, Lcom/yingyonghui/market/ActivityListApp;->C:I

    if-ne v1, v6, :cond_a

    .line 430
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->g:Landroid/view/View;

    invoke-virtual {v1, v7}, Landroid/view/View;->setVisibility(I)V

    .line 431
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

    invoke-virtual {v1, v5}, Landroid/widget/ListView;->setVisibility(I)V

    .line 446
    :cond_6
    :goto_3
    iput-boolean v5, p0, Lcom/yingyonghui/market/ActivityListApp;->p:Z

    .line 450
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 451
    iget v2, p0, Lcom/yingyonghui/market/ActivityListApp;->e:I

    sub-int/2addr v2, v1

    .line 452
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/yingyonghui/market/ActivityListApp;->o:Lcom/yingyonghui/market/log/m;

    iget-object v5, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    const-string v6, "app.list.featured"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_c

    invoke-static {v3, v4, v2, v1, v0}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;IILjava/util/List;)V

    goto/16 :goto_0

    .line 397
    :cond_7
    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    goto/16 :goto_1

    .line 403
    :cond_8
    if-eqz v0, :cond_1

    .line 404
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 406
    iget-object v2, p0, Lcom/yingyonghui/market/ActivityListApp;->l:Lcom/yingyonghui/market/bc;

    invoke-virtual {v2, v5}, Lcom/yingyonghui/market/bc;->setNotifyOnChange(Z)V

    move v2, v5

    .line 407
    :goto_4
    if-ge v2, v1, :cond_9

    .line 408
    iget-object v3, p0, Lcom/yingyonghui/market/ActivityListApp;->l:Lcom/yingyonghui/market/bc;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/yingyonghui/market/bc;->add(Ljava/lang/Object;)V

    .line 407
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 410
    :cond_9
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->l:Lcom/yingyonghui/market/bc;

    invoke-virtual {v1, v6}, Lcom/yingyonghui/market/bc;->setNotifyOnChange(Z)V

    .line 411
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->l:Lcom/yingyonghui/market/bc;

    invoke-virtual {v1}, Lcom/yingyonghui/market/bc;->notifyDataSetChanged()V

    goto/16 :goto_2

    .line 432
    :cond_a
    iget v1, p0, Lcom/yingyonghui/market/ActivityListApp;->C:I

    if-ne v1, v8, :cond_6

    .line 434
    :try_start_0
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityListApp;->E:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->removeHeaderView(Landroid/view/View;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 438
    :goto_5
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->g:Landroid/view/View;

    invoke-virtual {v1, v7}, Landroid/view/View;->setVisibility(I)V

    .line 439
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

    invoke-virtual {v1, v5}, Landroid/widget/ListView;->setVisibility(I)V

    goto :goto_3

    .line 435
    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5

    .line 442
    :cond_b
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->g:Landroid/view/View;

    invoke-virtual {v1, v7}, Landroid/view/View;->setVisibility(I)V

    .line 443
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

    invoke-virtual {v1, v5}, Landroid/widget/ListView;->setVisibility(I)V

    goto :goto_3

    .line 452
    :cond_c
    const-string v6, "app.list.category"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d

    invoke-static {v3, v4, v2, v1, v0}, Lcom/yingyonghui/market/log/l;->e(Landroid/content/Context;Lcom/yingyonghui/market/log/m;IILjava/util/List;)V

    goto/16 :goto_0

    :cond_d
    const-string v6, "app.list.fast"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_e

    invoke-static {v3, v4, v2, v1, v0}, Lcom/yingyonghui/market/log/l;->d(Landroid/content/Context;Lcom/yingyonghui/market/log/m;IILjava/util/List;)V

    goto/16 :goto_0

    :cond_e
    const-string v6, "app.list.rank"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_f

    invoke-static {v3, v4, v2, v1, v0}, Lcom/yingyonghui/market/log/l;->c(Landroid/content/Context;Lcom/yingyonghui/market/log/m;IILjava/util/List;)V

    goto/16 :goto_0

    :cond_f
    const-string v6, "Latest"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_10

    invoke-static {v3, v4, v2, v1, v0}, Lcom/yingyonghui/market/log/l;->b(Landroid/content/Context;Lcom/yingyonghui/market/log/m;IILjava/util/List;)V

    goto/16 :goto_0

    :cond_10
    const-string v6, "relative_app"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_11

    invoke-static {v3, v4, v2, v1, v0}, Lcom/yingyonghui/market/log/l;->h(Landroid/content/Context;Lcom/yingyonghui/market/log/m;IILjava/util/List;)V

    goto/16 :goto_0

    :cond_11
    const-string v6, "search"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-static {v3, v4, v2, v1, v0}, Lcom/yingyonghui/market/log/l;->g(Landroid/content/Context;Lcom/yingyonghui/market/log/m;IILjava/util/List;)V

    goto/16 :goto_0

    .line 455
    :pswitch_2
    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/yingyonghui/market/a/d;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->G:Ljava/util/ArrayList;

    .line 456
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->G:Ljava/util/ArrayList;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->G:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_12

    .line 457
    new-instance v0, Lcom/yingyonghui/market/cz;

    invoke-direct {v0, p0, p0}, Lcom/yingyonghui/market/cz;-><init>(Lcom/yingyonghui/market/ActivityListApp;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->F:Lcom/yingyonghui/market/cz;

    .line 458
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->E:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->F:Lcom/yingyonghui/market/cz;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/widget/SlowSpeedGallery;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 459
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->E:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    new-instance v1, Lcom/yingyonghui/market/cm;

    invoke-direct {v1, p0}, Lcom/yingyonghui/market/cm;-><init>(Lcom/yingyonghui/market/ActivityListApp;)V

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/widget/SlowSpeedGallery;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 460
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->E:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x2710

    rem-long/2addr v1, v3

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/widget/SlowSpeedGallery;->setSelection(I)V

    .line 461
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->E:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    invoke-virtual {v0, v5}, Lcom/yingyonghui/market/widget/SlowSpeedGallery;->setVisibility(I)V

    .line 462
    new-instance v0, Lcom/yingyonghui/market/l;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/l;-><init>(Lcom/yingyonghui/market/ActivityListApp;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->H:Lcom/yingyonghui/market/l;

    .line 463
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->H:Lcom/yingyonghui/market/l;

    const-wide/16 v1, 0xfa0

    invoke-virtual {v0, v5, v1, v2}, Lcom/yingyonghui/market/l;->sendEmptyMessageDelayed(IJ)Z

    .line 464
    iput v6, p0, Lcom/yingyonghui/market/ActivityListApp;->C:I

    .line 466
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->o:Lcom/yingyonghui/market/log/m;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityListApp;->G:Ljava/util/ArrayList;

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/util/List;)V

    .line 471
    :goto_6
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListApp;->D:Z

    if-eqz v0, :cond_0

    .line 472
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->g:Landroid/view/View;

    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 473
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

    invoke-virtual {v0, v5}, Landroid/widget/ListView;->setVisibility(I)V

    goto/16 :goto_0

    .line 468
    :cond_12
    iput v8, p0, Lcom/yingyonghui/market/ActivityListApp;->C:I

    goto :goto_6

    .line 477
    :pswitch_3
    iget-object v1, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityListApp;->L:Ljava/lang/Thread;

    if-nez v2, :cond_13

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityListApp;->L:Ljava/lang/Thread;

    if-nez v2, :cond_13

    iput-boolean v5, p0, Lcom/yingyonghui/market/ActivityListApp;->K:Z

    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/yingyonghui/market/en;

    invoke-direct {v3, p0}, Lcom/yingyonghui/market/en;-><init>(Lcom/yingyonghui/market/ActivityListApp;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    const-string v3, "image-decoder"

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/yingyonghui/market/ActivityListApp;->L:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    :cond_13
    iget-object v2, p0, Lcom/yingyonghui/market/ActivityListApp;->M:Ljava/util/ArrayList;

    monitor-enter v2

    :try_start_1
    iget-object v3, p0, Lcom/yingyonghui/market/ActivityListApp;->M:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    new-instance v3, Lcom/yingyonghui/market/ak;

    invoke-direct {v3, v1, v0}, Lcom/yingyonghui/market/ak;-><init>([BLjava/lang/String;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->M:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListApp;->J:Z

    if-nez v0, :cond_14

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->M:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    :goto_7
    monitor-exit v2

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_14
    :try_start_2
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->Q:Landroid/os/Handler;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->Q:Landroid/os/Handler;

    const/16 v3, 0x78

    invoke-virtual {v1, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    const-wide/16 v3, 0x1f4

    invoke-virtual {v0, v1, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_7

    .line 480
    :pswitch_4
    iget-object v1, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    .line 481
    array-length v2, v1

    invoke-static {v1, v5, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 482
    if-eqz v1, :cond_0

    .line 483
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 484
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/yingyonghui/market/util/y;->a(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 485
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->F:Lcom/yingyonghui/market/cz;

    if-eqz v0, :cond_0

    .line 486
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->F:Lcom/yingyonghui/market/cz;

    invoke-virtual {v0}, Lcom/yingyonghui/market/cz;->notifyDataSetChanged()V

    goto/16 :goto_0

    :cond_15
    move-object v0, v1

    goto/16 :goto_1

    .line 378
    nop

    :pswitch_data_0
    .packed-switch 0x63
        :pswitch_3
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_4
        :pswitch_1
    .end packed-switch
.end method

.method public final b()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 722
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->Q:Landroid/os/Handler;

    return-object v0
.end method

.method protected final b(Landroid/os/Message;)V
    .locals 1
    .parameter

    .prologue
    .line 587
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivityListApp;->p:Z

    .line 588
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->b(Landroid/os/Message;)V

    .line 589
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .locals 9
    .parameter

    .prologue
    const/16 v8, 0xc

    const/16 v7, 0x8

    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 108
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onCreate(Landroid/os/Bundle;)V

    .line 109
    const v0, 0x7f030020

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListApp;->setContentView(I)V

    .line 111
    if-eqz p1, :cond_9

    .line 112
    const-string v0, "showTopApp"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivityListApp;->m:Z

    .line 113
    const-string v0, "fromPage"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->n:Ljava/lang/String;

    .line 114
    const-string v0, "header"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivityListApp;->q:Z

    .line 115
    const-string v0, "type"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    .line 116
    const-string v0, "_id"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/yingyonghui/market/ActivityListApp;->s:I

    .line 117
    const-string v0, "ranking_type"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->t:Ljava/lang/String;

    .line 118
    const-string v0, "list_order"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/yingyonghui/market/ActivityListApp;->v:I

    .line 119
    const-string v0, "period"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->u:Ljava/lang/String;

    .line 120
    const-string v0, "package_name"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->w:Ljava/lang/String;

    .line 122
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    const-string v1, "search"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 123
    const-string v0, "keyword"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->x:Ljava/lang/String;

    .line 124
    const-string v0, "title"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->y:Ljava/lang/String;

    .line 125
    const-string v0, "searchType"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/yingyonghui/market/ActivityListApp;->z:I

    .line 126
    const-string v0, "source"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/yingyonghui/market/ActivityListApp;->A:I

    .line 141
    :cond_0
    :goto_0
    const v0, 0x7f0b00bb

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->g:Landroid/view/View;

    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

    invoke-static {}, Lcom/yingyonghui/market/util/p;->a()I

    move-result v0

    const/4 v1, 0x4

    if-le v0, v1, :cond_1

    :try_start_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

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

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

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

    :cond_1
    :goto_1
    iget v0, p0, Lcom/yingyonghui/market/ActivityListApp;->s:I

    if-eq v0, v8, :cond_2

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030012

    invoke-virtual {v0, v1, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->j:Landroid/view/View;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->j:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;)V

    :cond_2
    const v0, 0x7f0b0066

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->k:Landroid/view/View;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    const-string v1, "search"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->k:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    :cond_3
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListApp;->m:Z

    if-eqz v0, :cond_4

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030017

    invoke-virtual {v0, v1, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->E:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->E:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    new-instance v1, Lcom/yingyonghui/market/ee;

    invoke-direct {v1}, Lcom/yingyonghui/market/ee;-><init>()V

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/widget/SlowSpeedGallery;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->E:Lcom/yingyonghui/market/widget/SlowSpeedGallery;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->a:Lcom/yingyonghui/market/a/d;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->b:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/a/d;->b(Landroid/os/Handler;)V

    :cond_4
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListApp;->q:Z

    if-eqz v0, :cond_5

    iget v0, p0, Lcom/yingyonghui/market/ActivityListApp;->s:I

    if-ne v0, v8, :cond_5

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03003c

    invoke-virtual {v0, v1, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->i:Landroid/view/View;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->i:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->i:Landroid/view/View;

    invoke-virtual {v0, v1, v6, v5}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    :cond_5
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->R:Landroid/widget/AbsListView$OnScrollListener;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 143
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    const-string v1, "search"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 144
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->g:Landroid/view/View;

    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 145
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->h:Landroid/widget/ListView;

    invoke-virtual {v0, v7}, Landroid/widget/ListView;->setVisibility(I)V

    .line 150
    :goto_2
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.PACKAGE_ADDED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.PACKAGE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "package"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->P:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/yingyonghui/market/ActivityListApp;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    const-string v1, "search"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "broadcast_search_request"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->P:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/yingyonghui/market/ActivityListApp;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 153
    :cond_6
    if-eqz p1, :cond_8

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    const-string v1, "search"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 154
    iput-boolean v5, p0, Lcom/yingyonghui/market/ActivityListApp;->f:Z

    .line 156
    iput v5, p0, Lcom/yingyonghui/market/ActivityListApp;->e:I

    .line 157
    iput v5, p0, Lcom/yingyonghui/market/ActivityListApp;->B:I

    .line 158
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->l:Lcom/yingyonghui/market/bc;

    if-eqz v0, :cond_7

    .line 159
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->l:Lcom/yingyonghui/market/bc;

    invoke-virtual {v0}, Lcom/yingyonghui/market/bc;->clear()V

    .line 161
    :cond_7
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->g:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 162
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityListApp;->c()V

    .line 166
    :cond_8
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->n:Ljava/lang/String;

    const-string v1, "Featured"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    new-instance v0, Lcom/yingyonghui/market/log/m;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->n:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    :goto_3
    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->o:Lcom/yingyonghui/market/log/m;

    .line 167
    return-void

    .line 129
    :cond_9
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListApp;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 130
    const-string v1, "showTopApp"

    invoke-virtual {v0, v1, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/yingyonghui/market/ActivityListApp;->m:Z

    .line 131
    const-string v1, "fromPage"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->n:Ljava/lang/String;

    .line 132
    const-string v1, "header"

    invoke-virtual {v0, v1, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/yingyonghui/market/ActivityListApp;->q:Z

    .line 133
    const-string v1, "type"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    .line 134
    const-string v1, "_id"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/yingyonghui/market/ActivityListApp;->s:I

    .line 135
    const-string v1, "ranking_type"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->t:Ljava/lang/String;

    .line 136
    const-string v1, "list_order"

    const/16 v2, 0x384

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/yingyonghui/market/ActivityListApp;->v:I

    .line 137
    const-string v1, "period"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->u:Ljava/lang/String;

    .line 138
    const-string v1, "package_name"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->w:Ljava/lang/String;

    goto/16 :goto_0

    .line 141
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto/16 :goto_1

    .line 147
    :cond_a
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityListApp;->c()V

    goto/16 :goto_2

    .line 166
    :cond_b
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->n:Ljava/lang/String;

    const-string v1, "Category"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    new-instance v0, Lcom/yingyonghui/market/log/m;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->n:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    const-string v1, "categoryId"

    iget v2, p0, Lcom/yingyonghui/market/ActivityListApp;->s:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/yingyonghui/market/log/m;

    move-result-object v0

    const-string v1, "rankingType"

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityListApp;->t:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/yingyonghui/market/log/m;

    move-result-object v0

    goto/16 :goto_3

    :cond_c
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->n:Ljava/lang/String;

    const-string v1, "Rank"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    new-instance v0, Lcom/yingyonghui/market/log/m;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->n:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    const-string v1, "periodType"

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityListApp;->u:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/yingyonghui/market/log/m;

    move-result-object v0

    goto/16 :goto_3

    :cond_d
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->n:Ljava/lang/String;

    const-string v1, "FastGame"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->n:Ljava/lang/String;

    const-string v1, "FastApp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    :cond_e
    new-instance v0, Lcom/yingyonghui/market/log/m;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->n:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    const-string v1, "periodType"

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityListApp;->t:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/yingyonghui/market/log/m;

    move-result-object v0

    goto/16 :goto_3

    :cond_f
    new-instance v0, Lcom/yingyonghui/market/log/m;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->n:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    goto/16 :goto_3
.end method

.method public final onDestroy()V
    .locals 1

    .prologue
    .line 218
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onDestroy()V

    .line 219
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->P:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListApp;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 220
    return-void
.end method

.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 607
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/l;

    .line 608
    if-nez v0, :cond_0

    .line 628
    :goto_0
    return-void

    .line 612
    :cond_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 613
    const-class v2, Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 614
    const-string v2, "_id"

    iget v3, v0, Lcom/yingyonghui/market/model/l;->e:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 615
    const-string v2, "title"

    iget-object v3, v0, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 616
    const-string v2, "installed"

    iget v3, v0, Lcom/yingyonghui/market/model/l;->n:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 617
    const-string v2, "pkgName"

    iget-object v3, v0, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 618
    const-string v2, "size"

    iget v3, v0, Lcom/yingyonghui/market/model/l;->o:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 619
    const-string v2, "versionCode"

    iget v3, v0, Lcom/yingyonghui/market/model/l;->s:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 620
    const-string v2, "promotionId"

    iget v3, v0, Lcom/yingyonghui/market/model/l;->D:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 621
    const-string v2, "promotionAgent"

    iget-object v3, v0, Lcom/yingyonghui/market/model/l;->E:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 622
    const-string v2, "promotionText"

    iget-object v3, v0, Lcom/yingyonghui/market/model/l;->G:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 623
    const-string v2, "promotionDownUrl"

    iget-object v3, v0, Lcom/yingyonghui/market/model/l;->F:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 624
    const-string v2, "from"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityListApp;->o:Lcom/yingyonghui/market/log/m;

    const-string v4, "index"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/yingyonghui/market/log/m;

    move-result-object v3

    invoke-virtual {v3}, Lcom/yingyonghui/market/log/m;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 626
    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/ActivityListApp;->startActivity(Landroid/content/Intent;)V

    .line 627
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityListApp;->o:Lcom/yingyonghui/market/log/m;

    const-string v3, ""

    iget v0, v0, Lcom/yingyonghui/market/model/l;->e:I

    invoke-static {v1, v2, v3, p3, v0}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/lang/String;II)V

    goto :goto_0
.end method

.method protected final onPause()V
    .locals 2

    .prologue
    .line 210
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onPause()V

    .line 211
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListApp;->m:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->H:Lcom/yingyonghui/market/l;

    if-eqz v0, :cond_0

    .line 212
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->H:Lcom/yingyonghui/market/l;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/l;->removeMessages(I)V

    .line 214
    :cond_0
    return-void
.end method

.method public final onResume()V
    .locals 4

    .prologue
    .line 199
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onResume()V

    .line 200
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->l:Lcom/yingyonghui/market/bc;

    if-eqz v0, :cond_0

    .line 201
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->l:Lcom/yingyonghui/market/bc;

    invoke-virtual {v0}, Lcom/yingyonghui/market/bc;->notifyDataSetChanged()V

    .line 203
    :cond_0
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListApp;->m:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->H:Lcom/yingyonghui/market/l;

    if-eqz v0, :cond_1

    .line 204
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->H:Lcom/yingyonghui/market/l;

    const/4 v1, 0x0

    const-wide/16 v2, 0xfa0

    invoke-virtual {v0, v1, v2, v3}, Lcom/yingyonghui/market/l;->sendEmptyMessageDelayed(IJ)Z

    .line 206
    :cond_1
    return-void
.end method

.method protected final onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter

    .prologue
    .line 177
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 179
    const-string v0, "showTopApp"

    iget-boolean v1, p0, Lcom/yingyonghui/market/ActivityListApp;->m:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 180
    const-string v0, "fromPage"

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->n:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    const-string v0, "header"

    iget-boolean v1, p0, Lcom/yingyonghui/market/ActivityListApp;->q:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 182
    const-string v0, "type"

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    const-string v0, "_id"

    iget v1, p0, Lcom/yingyonghui/market/ActivityListApp;->s:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 184
    const-string v0, "ranking_type"

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->t:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    const-string v0, "list_order"

    iget v1, p0, Lcom/yingyonghui/market/ActivityListApp;->v:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 186
    const-string v0, "period"

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->u:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    const-string v0, "package_name"

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->w:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->r:Ljava/lang/String;

    const-string v1, "search"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 190
    const-string v0, "keyword"

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->x:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    const-string v0, "title"

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->y:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    const-string v0, "searchType"

    iget v1, p0, Lcom/yingyonghui/market/ActivityListApp;->z:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 193
    const-string v0, "source"

    iget v1, p0, Lcom/yingyonghui/market/ActivityListApp;->A:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 195
    :cond_0
    return-void
.end method

.method public final onSearchRequested()Z
    .locals 1

    .prologue
    .line 224
    const/4 v0, 0x0

    return v0
.end method

.method protected final onStop()V
    .locals 2

    .prologue
    .line 171
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->M:Ljava/util/ArrayList;

    monitor-enter v0

    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/yingyonghui/market/ActivityListApp;->K:Z

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->M:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListApp;->M:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->L:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    :try_start_1
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->L:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListApp;->L:Ljava/lang/Thread;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 172
    :cond_0
    :goto_0
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForActivity;->onStop()V

    .line 173
    return-void

    .line 171
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :catch_0
    move-exception v0

    goto :goto_0
.end method
