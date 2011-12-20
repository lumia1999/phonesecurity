.class public Lcom/yingyonghui/market/ActivityListAppDownload;
.super Lcom/yingyonghui/market/AbsActivityAppListManager;
.source "ActivityListAppDownload.java"


# static fields
.field private static final E:[Ljava/lang/String;

.field private static final F:Ljava/lang/String;

.field private static final G:[Ljava/lang/String;

.field protected static c:I

.field protected static d:I


# instance fields
.field private A:Landroid/view/View;

.field private B:Landroid/widget/Button;

.field private final C:I

.field private D:Landroid/os/Handler;

.field private final H:Landroid/content/BroadcastReceiver;

.field private s:Lcom/yingyonghui/market/ch;

.field private t:Lcom/yingyonghui/market/bm;

.field private u:Ljava/util/ArrayList;

.field private v:Ljava/util/ArrayList;

.field private w:Lcom/yingyonghui/market/ar;

.field private x:Lcom/yingyonghui/market/aq;

.field private y:Lcom/yingyonghui/market/cq;

.field private z:Landroid/content/pm/PackageManager;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 70
    sput v7, Lcom/yingyonghui/market/ActivityListAppDownload;->c:I

    .line 71
    sput v7, Lcom/yingyonghui/market/ActivityListAppDownload;->d:I

    .line 142
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "title"

    aput-object v1, v0, v7

    const-string v1, "status"

    aput-object v1, v0, v8

    const-string v1, "current_bytes"

    aput-object v1, v0, v9

    const/4 v1, 0x3

    const-string v2, "total_bytes"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "uri"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "notificationextras"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "description"

    aput-object v2, v0, v1

    sput-object v0, Lcom/yingyonghui/market/ActivityListAppDownload;->E:[Ljava/lang/String;

    .line 155
    new-array v0, v9, [Ljava/lang/String;

    .line 156
    const-string v1, "status"

    aput-object v1, v0, v7

    .line 157
    const-string v1, "status"

    aput-object v1, v0, v8

    .line 158
    const-string v1, " OR "

    array-length v2, v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    new-array v4, v8, [Ljava/lang/Object;

    aget-object v5, v0, v7

    aput-object v5, v4, v7

    const-string v5, "%s=?"

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v4, v8

    :goto_0
    if-ge v4, v2, :cond_0

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v5, v8, [Ljava/lang/Object;

    aget-object v6, v0, v4

    aput-object v6, v5, v7

    const-string v6, "%s=?"

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/ActivityListAppDownload;->F:Ljava/lang/String;

    .line 159
    new-array v0, v9, [Ljava/lang/String;

    .line 160
    sput-object v0, Lcom/yingyonghui/market/ActivityListAppDownload;->G:[Ljava/lang/String;

    const/16 v1, 0xc0

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v7

    .line 161
    sget-object v0, Lcom/yingyonghui/market/ActivityListAppDownload;->G:[Ljava/lang/String;

    const/16 v1, 0xc1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v8

    .line 162
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/yingyonghui/market/AbsActivityAppListManager;-><init>()V

    .line 76
    const/16 v0, 0x14

    iput v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->C:I

    .line 78
    new-instance v0, Lcom/yingyonghui/market/g;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/g;-><init>(Lcom/yingyonghui/market/ActivityListAppDownload;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->D:Landroid/os/Handler;

    .line 245
    new-instance v0, Lcom/yingyonghui/market/e;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/e;-><init>(Lcom/yingyonghui/market/ActivityListAppDownload;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->H:Landroid/content/BroadcastReceiver;

    .line 639
    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListAppDownload;Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/ch;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 57
    iput-object p1, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->s:Lcom/yingyonghui/market/ch;

    return-object p1
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->u:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListAppDownload;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 57
    iput-object p1, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->u:Ljava/util/ArrayList;

    return-object p1
.end method

.method private a(II)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 422
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 423
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->f:Landroid/widget/RadioButton;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const v2, 0x7f09012e

    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityListAppDownload;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 427
    :cond_0
    :goto_0
    return-void

    .line 424
    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 425
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->g:Landroid/widget/RadioButton;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const v2, 0x7f09012f

    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityListAppDownload;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListAppDownload;II)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(II)V

    return-void
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/ch;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->s:Lcom/yingyonghui/market/ch;

    return-object v0
.end method

.method static synthetic c(Lcom/yingyonghui/market/ActivityListAppDownload;)Landroid/view/View;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->A:Landroid/view/View;

    return-object v0
.end method

.method static synthetic d(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityListAppDownload;->e()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method private e()Ljava/util/ArrayList;
    .locals 7

    .prologue
    .line 373
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 375
    const/4 v0, 0x0

    .line 376
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->k:Landroid/widget/RadioGroup;

    invoke-virtual {v1}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    move-object v5, v0

    .line 385
    :goto_0
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppDownload;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    sget-object v2, Lcom/yingyonghui/market/ActivityListAppDownload;->E:[Ljava/lang/String;

    sget-object v3, Lcom/yingyonghui/market/ActivityListAppDownload;->F:Ljava/lang/String;

    sget-object v4, Lcom/yingyonghui/market/ActivityListAppDownload;->G:[Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 388
    if-eqz v0, :cond_2

    .line 389
    :goto_1
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 390
    new-instance v1, Lcom/yingyonghui/market/model/l;

    invoke-direct {v1}, Lcom/yingyonghui/market/model/l;-><init>()V

    .line 391
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    .line 392
    const/4 v2, 0x1

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, v1, Lcom/yingyonghui/market/model/l;->L:I

    .line 393
    const/4 v2, 0x2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, v1, Lcom/yingyonghui/market/model/l;->K:I

    .line 394
    const/4 v2, 0x3

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, v1, Lcom/yingyonghui/market/model/l;->o:I

    .line 395
    const/4 v2, 0x4

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 396
    const-string v3, "/apk/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 397
    if-lez v3, :cond_0

    .line 398
    const-string v4, "/apk/"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    .line 399
    const-string v4, "/"

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    .line 400
    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/yingyonghui/market/util/l;->a(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Lcom/yingyonghui/market/model/l;->e:I

    .line 402
    :cond_0
    const/4 v2, 0x5

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    .line 403
    const/4 v2, 0x6

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/yingyonghui/market/model/l;->f:Ljava/lang/String;

    .line 404
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 405
    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->f:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    goto :goto_1

    .line 378
    :pswitch_0
    const-string v0, "title"

    move-object v5, v0

    .line 379
    goto :goto_0

    .line 381
    :pswitch_1
    const-string v0, "total_bytes"

    move-object v5, v0

    goto :goto_0

    .line 407
    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 410
    :cond_2
    return-object v6

    .line 376
    :pswitch_data_0
    .packed-switch 0x7f0b00cb
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method static synthetic e(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->v:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic f(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/bm;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->t:Lcom/yingyonghui/market/bm;

    return-object v0
.end method

.method static synthetic g(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/ar;
    .locals 1
    .parameter

    .prologue
    .line 57
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->w:Lcom/yingyonghui/market/ar;

    return-object v0
.end method

.method static synthetic h(Lcom/yingyonghui/market/ActivityListAppDownload;)V
    .locals 4
    .parameter

    .prologue
    .line 57
    new-instance v0, Lcom/yingyonghui/market/eo;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppDownload;->getParent()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/eo;-><init>(Landroid/content/Context;)V

    const v1, 0x7f09014d

    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/eo;->setTitle(Ljava/lang/CharSequence;)V

    const v1, 0x7f09014e

    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/ActivityListAppDownload;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/eo;->a(Ljava/lang/CharSequence;)V

    const v1, 0x7f09014f

    new-instance v2, Lcom/yingyonghui/market/c;

    invoke-direct {v2, p0}, Lcom/yingyonghui/market/c;-><init>(Lcom/yingyonghui/market/ActivityListAppDownload;)V

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/eo;->a(ILcom/yingyonghui/market/bs;)Lcom/yingyonghui/market/eo;

    const v1, 0x7f090150

    new-instance v2, Lcom/yingyonghui/market/a;

    invoke-direct {v2, p0}, Lcom/yingyonghui/market/a;-><init>(Lcom/yingyonghui/market/ActivityListAppDownload;)V

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/eo;->a(ILcom/yingyonghui/market/f;)Lcom/yingyonghui/market/eo;

    invoke-virtual {v0}, Lcom/yingyonghui/market/eo;->show()V

    invoke-virtual {v0}, Lcom/yingyonghui/market/eo;->b()Landroid/widget/TextView;

    move-result-object v1

    const/high16 v2, 0x41a0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0}, Lcom/yingyonghui/market/eo;->a()Landroid/widget/ScrollView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static synthetic i(Lcom/yingyonghui/market/ActivityListAppDownload;)Ljava/util/ArrayList;
    .locals 4
    .parameter

    .prologue
    .line 57
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppDownload;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const-string v1, ".apk"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/d;->a(Ljava/io/File;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {}, Lcom/yingyonghui/market/util/GlobalUtil;->a()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    const-string v3, "/Yingyonghui"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string v2, ".apk"

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Lcom/yingyonghui/market/util/d;->a(Ljava/io/File;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_0
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppDownload;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    invoke-static {v1, p0}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/ContentResolver;Ljava/io/File;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v2
.end method

.method static synthetic j(Lcom/yingyonghui/market/ActivityListAppDownload;)Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->D:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic k(Lcom/yingyonghui/market/ActivityListAppDownload;)Landroid/content/pm/PackageManager;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->z:Landroid/content/pm/PackageManager;

    return-object v0
.end method


# virtual methods
.method public final a()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->D:Landroid/os/Handler;

    return-object v0
.end method

.method public final a(I)V
    .locals 4
    .parameter

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 347
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->A:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 349
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 350
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppDownload;->d()V

    .line 369
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppDownload;->b()Lcom/yingyonghui/market/log/m;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->r:Lcom/yingyonghui/market/log/m;

    .line 370
    return-void

    .line 351
    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 352
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->u:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->s:Lcom/yingyonghui/market/ch;

    if-nez v0, :cond_3

    .line 353
    :cond_2
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppDownload;->d()V

    goto :goto_0

    .line 355
    :cond_3
    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Z)V

    .line 356
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->e:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->s:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 357
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->e:Landroid/widget/ListView;

    sget v1, Lcom/yingyonghui/market/ActivityListAppDownload;->d:I

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 359
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->s:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    .line 361
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->s:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->getCount()I

    move-result v0

    if-lez v0, :cond_4

    .line 362
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->A:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 364
    :cond_4
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->A:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method protected final a(Landroid/os/Message;)V
    .locals 4
    .parameter

    .prologue
    .line 330
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/yingyonghui/market/a/a;

    .line 331
    iget v1, v0, Lcom/yingyonghui/market/a/a;->c:I

    .line 332
    const/16 v2, 0x63

    if-ne v1, v2, :cond_0

    .line 333
    iget-object v1, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    .line 334
    const/4 v2, 0x0

    array-length v3, v1

    invoke-static {v1, v2, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 335
    if-eqz v1, :cond_0

    .line 336
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 337
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    iget v0, v0, Lcom/yingyonghui/market/a/a;->d:I

    invoke-static {v0, v2}, Lcom/yingyonghui/market/util/y;->a(ILandroid/graphics/drawable/Drawable;)V

    .line 338
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->t:Lcom/yingyonghui/market/bm;

    if-eqz v0, :cond_0

    .line 339
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->t:Lcom/yingyonghui/market/bm;

    invoke-virtual {v0}, Lcom/yingyonghui/market/bm;->notifyDataSetChanged()V

    .line 343
    :cond_0
    return-void
.end method

.method public final a(Landroid/widget/ArrayAdapter;)V
    .locals 1
    .parameter

    .prologue
    .line 415
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Z)V

    .line 416
    invoke-virtual {p0, p1}, Lcom/yingyonghui/market/ActivityListAppDownload;->b(Landroid/widget/ArrayAdapter;)V

    .line 417
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Z)V

    .line 418
    invoke-virtual {p1}, Landroid/widget/ArrayAdapter;->notifyDataSetChanged()V

    .line 419
    return-void
.end method

.method protected final b()Lcom/yingyonghui/market/log/m;
    .locals 2

    .prologue
    .line 215
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->p:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 216
    new-instance v0, Lcom/yingyonghui/market/log/m;

    const-string v1, "Downloading"

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    .line 218
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/yingyonghui/market/log/m;

    const-string v1, "Downloaded"

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected final c()V
    .locals 3

    .prologue
    const/16 v2, 0x8

    .line 260
    invoke-super {p0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->c()V

    .line 262
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->e:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->y:Lcom/yingyonghui/market/cq;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 264
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->f:Landroid/widget/RadioButton;

    const v1, 0x7f09012e

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(I)V

    .line 265
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->g:Landroid/widget/RadioButton;

    const v1, 0x7f09012f

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(I)V

    .line 266
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->h:Landroid/widget/RadioButton;

    invoke-virtual {v0, v2}, Landroid/widget/RadioButton;->setVisibility(I)V

    .line 268
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->l:Landroid/widget/TextView;

    const v1, 0x7f09011d

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 270
    const v0, 0x7f0b000f

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->A:Landroid/view/View;

    .line 271
    const v0, 0x7f0b00c7

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->B:Landroid/widget/Button;

    .line 272
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->B:Landroid/widget/Button;

    const v1, 0x7f09014c

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 273
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->B:Landroid/widget/Button;

    new-instance v1, Lcom/yingyonghui/market/d;

    invoke-direct {v1, p0}, Lcom/yingyonghui/market/d;-><init>(Lcom/yingyonghui/market/ActivityListAppDownload;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 288
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->m:Landroid/widget/RadioButton;

    const v1, 0x7f09011f

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(I)V

    .line 289
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->n:Landroid/widget/RadioButton;

    const v1, 0x7f090120

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(I)V

    .line 290
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->o:Landroid/widget/RadioButton;

    invoke-virtual {v0, v2}, Landroid/widget/RadioButton;->setVisibility(I)V

    .line 292
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->e(I)V

    .line 293
    return-void
.end method

.method protected final d()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 296
    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Z)V

    .line 298
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->p:I

    if-ne v0, v2, :cond_3

    .line 299
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->v:Ljava/util/ArrayList;

    if-nez v0, :cond_2

    .line 300
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityListAppDownload;->e()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->v:Ljava/util/ArrayList;

    .line 305
    :goto_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->t:Lcom/yingyonghui/market/bm;

    if-nez v0, :cond_0

    .line 306
    new-instance v0, Lcom/yingyonghui/market/bm;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->v:Ljava/util/ArrayList;

    invoke-direct {v0, p0, p0, v1}, Lcom/yingyonghui/market/bm;-><init>(Lcom/yingyonghui/market/ActivityListAppDownload;Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->t:Lcom/yingyonghui/market/bm;

    .line 307
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->t:Lcom/yingyonghui/market/bm;

    invoke-virtual {v0, v3}, Lcom/yingyonghui/market/bm;->setNotifyOnChange(Z)V

    .line 309
    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->e:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->t:Lcom/yingyonghui/market/bm;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 310
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->t:Lcom/yingyonghui/market/bm;

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->b(Landroid/widget/ArrayAdapter;)V

    .line 311
    invoke-virtual {p0, v3}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(Z)V

    .line 312
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->t:Lcom/yingyonghui/market/bm;

    invoke-virtual {v0}, Lcom/yingyonghui/market/bm;->getCount()I

    move-result v0

    invoke-direct {p0, v2, v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->a(II)V

    .line 313
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->t:Lcom/yingyonghui/market/bm;

    invoke-virtual {v0}, Lcom/yingyonghui/market/bm;->notifyDataSetChanged()V

    .line 326
    :cond_1
    :goto_1
    return-void

    .line 302
    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->v:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 303
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->v:Ljava/util/ArrayList;

    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityListAppDownload;->e()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 314
    :cond_3
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->p:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 315
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->w:Lcom/yingyonghui/market/ar;

    if-nez v0, :cond_4

    .line 317
    :try_start_0
    new-instance v0, Lcom/yingyonghui/market/ar;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/ar;-><init>(Lcom/yingyonghui/market/ActivityListAppDownload;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->w:Lcom/yingyonghui/market/ar;

    .line 318
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->w:Lcom/yingyonghui/market/ar;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ar;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 319
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 322
    :cond_4
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->w:Lcom/yingyonghui/market/ar;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ar;->isAlive()Z

    move-result v0

    if-nez v0, :cond_1

    .line 323
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->D:Landroid/os/Handler;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter

    .prologue
    .line 166
    invoke-super {p0, p1}, Lcom/yingyonghui/market/AbsActivityAppListManager;->onCreate(Landroid/os/Bundle;)V

    .line 167
    const v0, 0x7f030033

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->setContentView(I)V

    .line 169
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppDownload;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->z:Landroid/content/pm/PackageManager;

    .line 171
    new-instance v0, Lcom/yingyonghui/market/aq;

    invoke-direct {v0, p0, p0}, Lcom/yingyonghui/market/aq;-><init>(Lcom/yingyonghui/market/ActivityListAppDownload;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->x:Lcom/yingyonghui/market/aq;

    .line 172
    new-instance v0, Lcom/yingyonghui/market/cq;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/cq;-><init>(Lcom/yingyonghui/market/ActivityListAppDownload;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->y:Lcom/yingyonghui/market/cq;

    .line 174
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppDownload;->c()V

    .line 175
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "download_complete"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->H:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 176
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 209
    invoke-super {p0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->onDestroy()V

    .line 210
    :try_start_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->H:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 211
    :goto_0
    return-void

    .line 210
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 664
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->p:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 665
    invoke-super/range {p0 .. p5}, Lcom/yingyonghui/market/AbsActivityAppListManager;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 669
    :cond_0
    :goto_0
    return-void

    .line 666
    :cond_1
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->p:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    goto :goto_0
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 201
    invoke-super {p0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->onPause()V

    .line 202
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->x:Lcom/yingyonghui/market/aq;

    if-eqz v0, :cond_0

    .line 203
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->x:Lcom/yingyonghui/market/aq;

    invoke-static {v0}, Lcom/yingyonghui/market/aq;->a(Lcom/yingyonghui/market/aq;)V

    .line 205
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 180
    invoke-super {p0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->onResume()V

    .line 182
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppDownload;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->x:Lcom/yingyonghui/market/aq;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 183
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->x:Lcom/yingyonghui/market/aq;

    invoke-virtual {v0, v3}, Lcom/yingyonghui/market/aq;->onChange(Z)V

    .line 185
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->p:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 186
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->u:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->s:Lcom/yingyonghui/market/ch;

    if-eqz v0, :cond_0

    .line 187
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->e:Landroid/widget/ListView;

    sget v1, Lcom/yingyonghui/market/ActivityListAppDownload;->d:I

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 188
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->s:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    .line 190
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->s:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->getCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 191
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->A:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 197
    :cond_0
    :goto_0
    return-void

    .line 193
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppDownload;->A:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method
