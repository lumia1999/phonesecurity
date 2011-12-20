.class public Lcom/yingyonghui/market/ActivityListAppManage;
.super Lcom/yingyonghui/market/AbsActivityAppListManager;
.source "ActivityListAppManage.java"


# static fields
.field private static E:I

.field private static F:I

.field private static G:I

.field private static H:I

.field private static final I:Z

.field private static final J:[Ljava/lang/String;

.field private static final d:Ljava/lang/String;


# instance fields
.field private A:Lcom/yingyonghui/market/bl;

.field private B:Z

.field private C:Z

.field private D:I

.field private K:Ljava/util/ArrayList;

.field private L:Lcom/yingyonghui/market/ch;

.field private M:Landroid/os/Handler;

.field private final N:Landroid/content/BroadcastReceiver;

.field private O:Landroid/widget/AbsListView$OnScrollListener;

.field protected c:Z

.field private s:Landroid/view/View;

.field private t:Landroid/widget/Button;

.field private u:Landroid/content/pm/PackageManager;

.field private v:Ljava/util/ArrayList;

.field private w:Ljava/util/ArrayList;

.field private x:Ljava/util/ArrayList;

.field private y:Lcom/yingyonghui/market/bc;

.field private z:Lcom/yingyonghui/market/bc;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 49
    const-class v0, Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/ActivityListAppManage;->d:Ljava/lang/String;

    .line 71
    sput v2, Lcom/yingyonghui/market/ActivityListAppManage;->E:I

    .line 72
    sput v2, Lcom/yingyonghui/market/ActivityListAppManage;->F:I

    .line 73
    sput v2, Lcom/yingyonghui/market/ActivityListAppManage;->G:I

    .line 74
    sput v2, Lcom/yingyonghui/market/ActivityListAppManage;->H:I

    .line 75
    invoke-static {}, Lcom/yingyonghui/market/util/p;->a()I

    move-result v0

    if-lt v0, v4, :cond_0

    move v0, v3

    :goto_0
    sput-boolean v0, Lcom/yingyonghui/market/ActivityListAppManage;->I:Z

    .line 78
    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v2

    const-string v1, "apkid"

    aput-object v1, v0, v3

    const/4 v1, 0x2

    const-string v2, "apkname"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "lastmodifiedtime"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "pkgname"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "permission"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "promotion_agent"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "promotion_id"

    aput-object v2, v0, v1

    const-string v1, "pubkey_hash"

    aput-object v1, v0, v4

    const/16 v1, 0x9

    const-string v2, "rating"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "rating_count"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "size"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "version_code"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "version_name"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "apk_url"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "flg"

    aput-object v2, v0, v1

    sput-object v0, Lcom/yingyonghui/market/ActivityListAppManage;->J:[Ljava/lang/String;

    return-void

    :cond_0
    move v0, v2

    .line 75
    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 48
    invoke-direct {p0}, Lcom/yingyonghui/market/AbsActivityAppListManager;-><init>()V

    .line 67
    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->c:Z

    .line 68
    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->B:Z

    .line 69
    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->C:Z

    .line 70
    const/4 v0, -0x1

    iput v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->D:I

    .line 100
    new-instance v0, Lcom/yingyonghui/market/q;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/q;-><init>(Lcom/yingyonghui/market/ActivityListAppManage;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->M:Landroid/os/Handler;

    .line 429
    new-instance v0, Lcom/yingyonghui/market/o;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/o;-><init>(Lcom/yingyonghui/market/ActivityListAppManage;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->N:Landroid/content/BroadcastReceiver;

    .line 667
    new-instance v0, Lcom/yingyonghui/market/n;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/n;-><init>(Lcom/yingyonghui/market/ActivityListAppManage;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->O:Landroid/widget/AbsListView$OnScrollListener;

    .line 691
    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListAppManage;I)I
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 48
    iput p1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->D:I

    return p1
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListAppManage;Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/bc;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 48
    iput-object p1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->z:Lcom/yingyonghui/market/bc;

    return-object p1
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListAppManage;Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/ch;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 48
    iput-object p1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->L:Lcom/yingyonghui/market/ch;

    return-object p1
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListAppManage;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 48
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->K:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListAppManage;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 48
    iput-object p1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->x:Ljava/util/ArrayList;

    return-object p1
.end method

.method private a(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 5
    .parameter

    .prologue
    const/4 v4, 0x2

    .line 563
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppManage;->f(I)Ljava/util/Comparator;

    move-result-object v0

    .line 565
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->k:Landroid/widget/RadioGroup;

    invoke-virtual {v1}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 605
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 567
    :pswitch_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 568
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/yingyonghui/market/model/l;

    .line 569
    iget v3, p0, Lcom/yingyonghui/market/model/l;->I:I

    if-eqz v3, :cond_1

    iget v3, p0, Lcom/yingyonghui/market/model/l;->I:I

    if-ne v3, v4, :cond_0

    .line 571
    :cond_1
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 574
    :cond_2
    if-eqz v0, :cond_3

    .line 575
    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_3
    move-object v0, v1

    .line 577
    goto :goto_0

    .line 580
    :pswitch_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 581
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/yingyonghui/market/model/l;

    .line 582
    iget v3, p0, Lcom/yingyonghui/market/model/l;->I:I

    if-eqz v3, :cond_5

    iget v3, p0, Lcom/yingyonghui/market/model/l;->I:I

    if-ne v3, v4, :cond_4

    :cond_5
    iget v3, p0, Lcom/yingyonghui/market/model/l;->H:I

    if-nez v3, :cond_4

    .line 584
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 587
    :cond_6
    if-eqz v0, :cond_7

    .line 588
    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_7
    move-object v0, v1

    .line 590
    goto :goto_0

    .line 593
    :pswitch_2
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 594
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_8
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/yingyonghui/market/model/l;

    .line 595
    iget v3, p0, Lcom/yingyonghui/market/model/l;->H:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_8

    .line 596
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 599
    :cond_9
    if-eqz v0, :cond_a

    .line 600
    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_a
    move-object v0, v1

    .line 602
    goto :goto_0

    .line 565
    :pswitch_data_0
    .packed-switch 0x7f0b00cb
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private a(II)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 643
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 644
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->f:Landroid/widget/RadioButton;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const v2, 0x7f090116

    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityListAppManage;->getString(I)Ljava/lang/String;

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

    .line 648
    :cond_0
    :goto_0
    return-void

    .line 645
    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 646
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->g:Landroid/widget/RadioButton;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const v2, 0x7f090117

    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityListAppManage;->getString(I)Ljava/lang/String;

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

.method static synthetic b(I)I
    .locals 0
    .parameter

    .prologue
    .line 48
    sput p0, Lcom/yingyonghui/market/ActivityListAppManage;->E:I

    return p0
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityListAppManage;)I
    .locals 1
    .parameter

    .prologue
    .line 48
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->D:I

    return v0
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityListAppManage;Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/bc;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 48
    iput-object p1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->y:Lcom/yingyonghui/market/bc;

    return-object p1
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityListAppManage;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityListAppManage;I)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 48
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lcom/yingyonghui/market/ActivityListAppManage;->a(II)V

    return-void
.end method

.method static synthetic c(I)I
    .locals 0
    .parameter

    .prologue
    .line 48
    sput p0, Lcom/yingyonghui/market/ActivityListAppManage;->F:I

    return p0
.end method

.method static synthetic c(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/ch;
    .locals 1
    .parameter

    .prologue
    .line 48
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->L:Lcom/yingyonghui/market/ch;

    return-object v0
.end method

.method static synthetic c(Lcom/yingyonghui/market/ActivityListAppManage;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 48
    iput-object p1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->v:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic d(I)I
    .locals 0
    .parameter

    .prologue
    .line 48
    sput p0, Lcom/yingyonghui/market/ActivityListAppManage;->G:I

    return p0
.end method

.method static synthetic d(Lcom/yingyonghui/market/ActivityListAppManage;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 48
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->v:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic e()I
    .locals 1

    .prologue
    .line 48
    sget v0, Lcom/yingyonghui/market/ActivityListAppManage;->E:I

    return v0
.end method

.method static synthetic e(Lcom/yingyonghui/market/ActivityListAppManage;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 48
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->x:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic f()I
    .locals 1

    .prologue
    .line 48
    sget v0, Lcom/yingyonghui/market/ActivityListAppManage;->G:I

    return v0
.end method

.method static synthetic f(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/bc;
    .locals 1
    .parameter

    .prologue
    .line 48
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->z:Lcom/yingyonghui/market/bc;

    return-object v0
.end method

.method static synthetic g()I
    .locals 1

    .prologue
    .line 48
    sget v0, Lcom/yingyonghui/market/ActivityListAppManage;->F:I

    return v0
.end method

.method static synthetic g(Lcom/yingyonghui/market/ActivityListAppManage;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 48
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->w:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic h(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/bc;
    .locals 1
    .parameter

    .prologue
    .line 48
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->y:Lcom/yingyonghui/market/bc;

    return-object v0
.end method

.method static synthetic i(Lcom/yingyonghui/market/ActivityListAppManage;)V
    .locals 10
    .parameter

    .prologue
    const/4 v9, 0x1

    const/4 v3, 0x0

    .line 48
    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_id"

    aput-object v1, v2, v0

    const-string v0, "flg"

    aput-object v0, v2, v9

    sget-object v1, Lcom/yingyonghui/market/provider/f;->a:Landroid/net/Uri;

    move-object v0, p0

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Lcom/yingyonghui/market/ActivityListAppManage;->managedQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "_id"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    const-string v2, "flg"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    :cond_0
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "0"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    const-string v6, "flg"

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    sget-object v6, Lcom/yingyonghui/market/provider/f;->a:Landroid/net/Uri;

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    invoke-static {v6, v7, v8}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppManage;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, v4, v5, v3, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-nez v4, :cond_0

    :cond_2
    return-void
.end method

.method static synthetic j(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/bl;
    .locals 1
    .parameter

    .prologue
    .line 48
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->A:Lcom/yingyonghui/market/bl;

    return-object v0
.end method

.method static synthetic k(Lcom/yingyonghui/market/ActivityListAppManage;)Z
    .locals 1
    .parameter

    .prologue
    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->C:Z

    return v0
.end method

.method static synthetic l(Lcom/yingyonghui/market/ActivityListAppManage;)Z
    .locals 1
    .parameter

    .prologue
    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->B:Z

    return v0
.end method

.method static synthetic m(Lcom/yingyonghui/market/ActivityListAppManage;)I
    .locals 2
    .parameter

    .prologue
    .line 48
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->D:I

    const/4 v1, 0x1

    sub-int v1, v0, v1

    iput v1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->D:I

    return v0
.end method

.method static synthetic n(Lcom/yingyonghui/market/ActivityListAppManage;)I
    .locals 2
    .parameter

    .prologue
    .line 48
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->D:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->D:I

    return v0
.end method

.method static synthetic o(Lcom/yingyonghui/market/ActivityListAppManage;)Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 48
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->M:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 4
    .parameter

    .prologue
    .line 521
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 522
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p0}, Lcom/yingyonghui/market/util/y;->a(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 532
    :cond_0
    :goto_0
    return-object v0

    .line 524
    :cond_1
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p1}, Lcom/yingyonghui/market/util/y;->a(Ljava/lang/String;)Lcom/yingyonghui/market/model/h;

    move-result-object v0

    .line 526
    iget-object v0, v0, Lcom/yingyonghui/market/model/h;->a:Landroid/graphics/drawable/Drawable;

    .line 527
    if-nez v0, :cond_0

    .line 528
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    invoke-static {p0}, Lcom/yingyonghui/market/util/y;->a(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 529
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->a:Lcom/yingyonghui/market/a/d;

    iget v2, p0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    add-int/lit8 v2, v2, 0x66

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityListAppManage;->b:Landroid/os/Handler;

    invoke-virtual {v1, p1, v2, v3}, Lcom/yingyonghui/market/a/d;->d(Ljava/lang/String;ILandroid/os/Handler;)V

    goto :goto_0
.end method

.method public final a()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->M:Landroid/os/Handler;

    return-object v0
.end method

.method public final a(I)V
    .locals 6
    .parameter

    .prologue
    const/4 v5, 0x3

    const/16 v4, 0x8

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 250
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->s:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 252
    if-ne p1, v5, :cond_0

    .line 253
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->l:Landroid/widget/TextView;

    const v1, 0x7f09011e

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 254
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->m:Landroid/widget/RadioButton;

    const v1, 0x7f090123

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(I)V

    .line 255
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->n:Landroid/widget/RadioButton;

    const v1, 0x7f090122

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(I)V

    .line 256
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->o:Landroid/widget/RadioButton;

    const v1, 0x7f090121

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(I)V

    .line 257
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->o:Landroid/widget/RadioButton;

    invoke-virtual {v0, v2}, Landroid/widget/RadioButton;->setVisibility(I)V

    .line 258
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->m:Landroid/widget/RadioButton;

    invoke-virtual {v0, v3}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 267
    :goto_0
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->y:Lcom/yingyonghui/market/bc;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->B:Z

    if-nez v0, :cond_2

    .line 268
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->e:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->y:Lcom/yingyonghui/market/bc;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 269
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->e:Landroid/widget/ListView;

    sget v1, Lcom/yingyonghui/market/ActivityListAppManage;->F:I

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 270
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->y:Lcom/yingyonghui/market/bc;

    invoke-virtual {v0}, Lcom/yingyonghui/market/bc;->notifyDataSetChanged()V

    .line 271
    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Z)V

    .line 273
    sget v0, Lcom/yingyonghui/market/ActivityListAppManage;->H:I

    if-lez v0, :cond_1

    .line 274
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->s:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 292
    :goto_1
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppManage;->b()Lcom/yingyonghui/market/log/m;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->r:Lcom/yingyonghui/market/log/m;

    .line 293
    return-void

    .line 260
    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->l:Landroid/widget/TextView;

    const v1, 0x7f09011d

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 261
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->m:Landroid/widget/RadioButton;

    const v1, 0x7f09011f

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(I)V

    .line 262
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->n:Landroid/widget/RadioButton;

    const v1, 0x7f090120

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(I)V

    .line 263
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->o:Landroid/widget/RadioButton;

    invoke-virtual {v0, v4}, Landroid/widget/RadioButton;->setVisibility(I)V

    .line 264
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->m:Landroid/widget/RadioButton;

    invoke-virtual {v0, v3}, Landroid/widget/RadioButton;->setChecked(Z)V

    goto :goto_0

    .line 276
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->s:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 278
    :cond_2
    if-ne p1, v3, :cond_3

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->L:Lcom/yingyonghui/market/ch;

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->c:Z

    if-nez v0, :cond_3

    .line 279
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->e:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->L:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 280
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->e:Landroid/widget/ListView;

    sget v1, Lcom/yingyonghui/market/ActivityListAppManage;->E:I

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 281
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->L:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    .line 282
    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Z)V

    goto :goto_1

    .line 283
    :cond_3
    if-ne p1, v5, :cond_4

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->z:Lcom/yingyonghui/market/bc;

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->C:Z

    if-nez v0, :cond_4

    .line 284
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->e:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->z:Lcom/yingyonghui/market/bc;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 285
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->e:Landroid/widget/ListView;

    sget v1, Lcom/yingyonghui/market/ActivityListAppManage;->G:I

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 286
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->z:Lcom/yingyonghui/market/bc;

    invoke-virtual {v0}, Lcom/yingyonghui/market/bc;->notifyDataSetChanged()V

    .line 287
    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Z)V

    goto :goto_1

    .line 289
    :cond_4
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppManage;->d()V

    goto :goto_1
.end method

.method protected final a(Landroid/os/Message;)V
    .locals 6
    .parameter

    .prologue
    const/16 v5, 0x66

    .line 473
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/yingyonghui/market/a/a;

    .line 474
    iget v2, v0, Lcom/yingyonghui/market/a/a;->c:I

    .line 504
    if-le v2, v5, :cond_0

    const/16 v1, 0x69

    if-gt v2, v1, :cond_0

    .line 505
    iget-object v1, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    .line 506
    const/4 v3, 0x0

    array-length v4, v1

    invoke-static {v1, v3, v4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 507
    if-eqz v1, :cond_0

    .line 508
    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v3, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 509
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    invoke-static {v0, v3}, Lcom/yingyonghui/market/util/y;->a(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 510
    sub-int v0, v2, v5

    iget v1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    if-ne v0, v1, :cond_0

    .line 511
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->e:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 512
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->e:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p0

    check-cast p0, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Landroid/widget/ArrayAdapter;->notifyDataSetChanged()V

    .line 517
    :cond_0
    return-void
.end method

.method public final a(Landroid/widget/ArrayAdapter;)V
    .locals 8
    .parameter

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 541
    invoke-virtual {p0, v6}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Z)V

    .line 542
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 543
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->v:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    .line 544
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->x:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    .line 545
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->x:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 546
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->x:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 558
    :cond_0
    :goto_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Z)V

    .line 559
    invoke-virtual {p1}, Landroid/widget/ArrayAdapter;->notifyDataSetChanged()V

    .line 560
    return-void

    .line 548
    :cond_1
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    if-ne v0, v7, :cond_5

    .line 549
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->w:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 550
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->w:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/l;

    iget-object v4, v0, Lcom/yingyonghui/market/model/l;->O:Ljava/lang/String;

    const-string v5, "0"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->k:Landroid/widget/RadioGroup;

    invoke-virtual {v0}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :cond_4
    :goto_2
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 551
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->w:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 552
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->w:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 550
    :pswitch_0
    invoke-virtual {p0, v6}, Lcom/yingyonghui/market/ActivityListAppManage;->f(I)Ljava/util/Comparator;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-static {v2, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    goto :goto_2

    :pswitch_1
    invoke-virtual {p0, v7}, Lcom/yingyonghui/market/ActivityListAppManage;->f(I)Ljava/util/Comparator;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-static {v2, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    goto :goto_2

    .line 555
    :cond_5
    invoke-virtual {p0, p1}, Lcom/yingyonghui/market/ActivityListAppManage;->b(Landroid/widget/ArrayAdapter;)V

    goto :goto_0

    .line 550
    nop

    :pswitch_data_0
    .packed-switch 0x7f0b00cb
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected final b()Lcom/yingyonghui/market/log/m;
    .locals 2

    .prologue
    .line 203
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 204
    new-instance v0, Lcom/yingyonghui/market/log/m;

    const-string v1, "Installed"

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    .line 208
    :goto_0
    return-object v0

    .line 205
    :cond_0
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 206
    new-instance v0, Lcom/yingyonghui/market/log/m;

    const-string v1, "Update"

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 208
    :cond_1
    new-instance v0, Lcom/yingyonghui/market/log/m;

    const-string v1, "Transfer"

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected final c()V
    .locals 3

    .prologue
    const/4 v2, 0x2

    .line 220
    invoke-super {p0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->c()V

    .line 221
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->e:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->O:Landroid/widget/AbsListView$OnScrollListener;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 222
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->f:Landroid/widget/RadioButton;

    const v1, 0x7f090116

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(I)V

    .line 223
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->g:Landroid/widget/RadioButton;

    const v1, 0x7f090117

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(I)V

    .line 224
    sget-boolean v0, Lcom/yingyonghui/market/ActivityListAppManage;->I:Z

    if-eqz v0, :cond_0

    .line 225
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->h:Landroid/widget/RadioButton;

    const v1, 0x7f090118

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(I)V

    .line 230
    :goto_0
    const v0, 0x7f0b000f

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppManage;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->s:Landroid/view/View;

    .line 231
    const v0, 0x7f0b00c7

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppManage;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->t:Landroid/widget/Button;

    .line 232
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->t:Landroid/widget/Button;

    const v1, 0x7f09015c

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 233
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->t:Landroid/widget/Button;

    new-instance v1, Lcom/yingyonghui/market/p;

    invoke-direct {v1, p0}, Lcom/yingyonghui/market/p;-><init>(Lcom/yingyonghui/market/ActivityListAppManage;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 243
    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityListAppManage;->e(I)V

    .line 244
    sget v0, Lcom/yingyonghui/market/ActivityListAppManage;->H:I

    invoke-direct {p0, v2, v0}, Lcom/yingyonghui/market/ActivityListAppManage;->a(II)V

    .line 245
    return-void

    .line 227
    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->h:Landroid/widget/RadioButton;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setVisibility(I)V

    goto :goto_0
.end method

.method protected final d()V
    .locals 24

    .prologue
    .line 296
    const/4 v3, 0x1

    move-object/from16 v0, p0

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Z)V

    .line 297
    move-object/from16 v0, p0

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    move v3, v0

    const/4 v4, 0x1

    if-ne v3, v4, :cond_5

    .line 298
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->K:Ljava/util/ArrayList;

    move-object v3, v0

    if-eqz v3, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->c:Z

    move v3, v0

    if-eqz v3, :cond_3

    .line 299
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/yingyonghui/market/ActivityListAppManage;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/yingyonghui/market/ActivityListAppManage;->K:Ljava/util/ArrayList;

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->K:Ljava/util/ArrayList;

    move-object v3, v0

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 301
    :cond_1
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 302
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ApplicationInfo;

    .line 303
    invoke-static {v3}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/pm/ApplicationInfo;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 304
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 307
    :cond_2
    const/4 v3, 0x0

    move v0, v3

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/yingyonghui/market/ActivityListAppManage;->c:Z

    .line 309
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->M:Landroid/os/Handler;

    move-object v3, v0

    const/16 v4, 0x1f4

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 408
    :cond_4
    :goto_1
    return-void

    .line 310
    :cond_5
    move-object/from16 v0, p0

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    move v3, v0

    const/4 v4, 0x2

    if-ne v3, v4, :cond_b

    .line 311
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 312
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 313
    sget-object v4, Lcom/yingyonghui/market/provider/f;->a:Landroid/net/Uri;

    sget-object v5, Lcom/yingyonghui/market/ActivityListAppManage;->J:[Ljava/lang/String;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v3, p0

    invoke-virtual/range {v3 .. v8}, Lcom/yingyonghui/market/ActivityListAppManage;->managedQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 314
    const/4 v4, 0x0

    sput v4, Lcom/yingyonghui/market/ActivityListAppManage;->H:I

    .line 315
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 316
    const-string v4, "_id"

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 317
    const-string v4, "apkid"

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    .line 318
    const-string v5, "apkname"

    invoke-interface {v3, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    .line 319
    const-string v6, "lastmodifiedtime"

    invoke-interface {v3, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 320
    const-string v7, "pkgname"

    invoke-interface {v3, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    .line 321
    const-string v8, "permission"

    invoke-interface {v3, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    .line 322
    const-string v11, "promotion_agent"

    invoke-interface {v3, v11}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v11

    .line 323
    const-string v12, "promotion_id"

    invoke-interface {v3, v12}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v12

    .line 324
    const-string v13, "pubkey_hash"

    invoke-interface {v3, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    .line 325
    const-string v14, "rating"

    invoke-interface {v3, v14}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v14

    .line 326
    const-string v15, "rating_count"

    invoke-interface {v3, v15}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v15

    .line 327
    const-string v16, "size"

    move-object v0, v3

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v16

    .line 328
    const-string v17, "version_code"

    move-object v0, v3

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v17

    .line 329
    const-string v18, "version_name"

    move-object v0, v3

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v18

    .line 330
    const-string v19, "apk_url"

    move-object v0, v3

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v19

    .line 331
    const-string v20, "flg"

    move-object v0, v3

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v20

    .line 335
    :cond_6
    new-instance v21, Lcom/yingyonghui/market/model/l;

    invoke-direct/range {v21 .. v21}, Lcom/yingyonghui/market/model/l;-><init>()V

    .line 336
    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v22

    move/from16 v0, v22

    move-object/from16 v1, v21

    iput v0, v1, Lcom/yingyonghui/market/model/l;->e:I

    .line 337
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    .line 338
    invoke-interface {v3, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/yingyonghui/market/model/l;->r:Ljava/lang/String;

    .line 339
    invoke-interface {v3, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    .line 340
    invoke-interface {v3, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    const-string v23, ","

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/yingyonghui/market/model/l;->t:[Ljava/lang/String;

    .line 341
    invoke-interface {v3, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/yingyonghui/market/model/l;->E:Ljava/lang/String;

    .line 342
    invoke-interface {v3, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v22

    move/from16 v0, v22

    move-object/from16 v1, v21

    iput v0, v1, Lcom/yingyonghui/market/model/l;->D:I

    .line 343
    invoke-interface {v3, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/yingyonghui/market/model/l;->C:Ljava/lang/String;

    .line 344
    invoke-interface {v3, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v22

    move/from16 v0, v22

    move-object/from16 v1, v21

    iput v0, v1, Lcom/yingyonghui/market/model/l;->l:F

    .line 345
    invoke-interface {v3, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v22

    move/from16 v0, v22

    move-object/from16 v1, v21

    iput v0, v1, Lcom/yingyonghui/market/model/l;->A:I

    .line 346
    move-object v0, v3

    move/from16 v1, v16

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v22

    move/from16 v0, v22

    move-object/from16 v1, v21

    iput v0, v1, Lcom/yingyonghui/market/model/l;->o:I

    .line 347
    move-object/from16 v0, v21

    iget v0, v0, Lcom/yingyonghui/market/model/l;->o:I

    move/from16 v22, v0

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v22

    invoke-static {v0, v1, v2}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/yingyonghui/market/model/l;->p:Ljava/lang/String;

    .line 348
    move-object v0, v3

    move/from16 v1, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v22

    move/from16 v0, v22

    move-object/from16 v1, v21

    iput v0, v1, Lcom/yingyonghui/market/model/l;->s:I

    .line 349
    move-object v0, v3

    move/from16 v1, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/yingyonghui/market/model/l;->q:Ljava/lang/String;

    .line 350
    move-object v0, v3

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/yingyonghui/market/model/l;->g:Ljava/lang/String;

    .line 351
    move-object v0, v3

    move/from16 v1, v20

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/yingyonghui/market/model/l;->O:Ljava/lang/String;

    .line 352
    const/16 v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, v21

    iput-boolean v0, v1, Lcom/yingyonghui/market/model/l;->v:Z

    .line 354
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/yingyonghui/market/model/l;->O:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string v23, "0"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_8

    .line 355
    move-object v0, v9

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 356
    sget v21, Lcom/yingyonghui/market/ActivityListAppManage;->H:I

    add-int/lit8 v21, v21, 0x1

    sput v21, Lcom/yingyonghui/market/ActivityListAppManage;->H:I

    .line 360
    :goto_2
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v21

    if-nez v21, :cond_6

    .line 363
    :cond_7
    const/4 v3, 0x2

    sget v4, Lcom/yingyonghui/market/ActivityListAppManage;->H:I

    move-object/from16 v0, p0

    move v1, v3

    move v2, v4

    invoke-direct {v0, v1, v2}, Lcom/yingyonghui/market/ActivityListAppManage;->a(II)V

    .line 364
    sget v3, Lcom/yingyonghui/market/ActivityListAppManage;->H:I

    if-lez v3, :cond_9

    .line 365
    sget-object v3, Lcom/yingyonghui/market/ActivityMain;->c:Landroid/widget/TextView;

    sget v4, Lcom/yingyonghui/market/ActivityListAppManage;->H:I

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 366
    sget-object v3, Lcom/yingyonghui/market/ActivityMain;->c:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 372
    :goto_3
    sget v3, Lcom/yingyonghui/market/ActivityListAppManage;->H:I

    if-lez v3, :cond_a

    .line 373
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->s:Landroid/view/View;

    move-object v3, v0

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 378
    :goto_4
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 379
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 380
    invoke-virtual {v3, v10}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 381
    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/yingyonghui/market/ActivityListAppManage;->w:Ljava/util/ArrayList;

    .line 383
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->M:Landroid/os/Handler;

    move-object v4, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->M:Landroid/os/Handler;

    move-object v5, v0

    const/16 v6, 0x1f5

    invoke-virtual {v5, v6, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 384
    const/4 v3, 0x0

    move v0, v3

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/yingyonghui/market/ActivityListAppManage;->B:Z

    goto/16 :goto_1

    .line 358
    :cond_8
    move-object v0, v10

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 368
    :cond_9
    sget-object v3, Lcom/yingyonghui/market/ActivityMain;->c:Landroid/widget/TextView;

    const-string v4, ""

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 369
    sget-object v3, Lcom/yingyonghui/market/ActivityMain;->c:Landroid/widget/TextView;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_3

    .line 375
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->s:Landroid/view/View;

    move-object v3, v0

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_4

    .line 387
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->A:Lcom/yingyonghui/market/bl;

    move-object v3, v0

    if-nez v3, :cond_c

    .line 389
    :try_start_0
    new-instance v3, Lcom/yingyonghui/market/bl;

    move-object v0, v3

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/bl;-><init>(Lcom/yingyonghui/market/ActivityListAppManage;)V

    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/yingyonghui/market/ActivityListAppManage;->A:Lcom/yingyonghui/market/bl;

    .line 390
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->A:Lcom/yingyonghui/market/bl;

    move-object v3, v0

    invoke-virtual {v3}, Lcom/yingyonghui/market/bl;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 391
    :catch_0
    move-exception v3

    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1

    .line 394
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->A:Lcom/yingyonghui/market/bl;

    move-object v3, v0

    invoke-virtual {v3}, Lcom/yingyonghui/market/bl;->isAlive()Z

    move-result v3

    if-nez v3, :cond_4

    .line 395
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->C:Z

    move v3, v0

    if-eqz v3, :cond_d

    .line 397
    :try_start_1
    new-instance v3, Lcom/yingyonghui/market/bl;

    move-object v0, v3

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/bl;-><init>(Lcom/yingyonghui/market/ActivityListAppManage;)V

    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/yingyonghui/market/ActivityListAppManage;->A:Lcom/yingyonghui/market/bl;

    .line 398
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->A:Lcom/yingyonghui/market/bl;

    move-object v3, v0

    invoke-virtual {v3}, Lcom/yingyonghui/market/bl;->start()V

    .line 399
    const/4 v3, 0x0

    move v0, v3

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/yingyonghui/market/ActivityListAppManage;->C:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_1

    .line 400
    :catch_1
    move-exception v3

    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1

    .line 404
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->M:Landroid/os/Handler;

    move-object v3, v0

    const/16 v4, 0x1f4

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    .parameter

    .prologue
    .line 652
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 654
    invoke-super {p0, p1}, Lcom/yingyonghui/market/AbsActivityAppListManager;->onClick(Landroid/view/View;)V

    .line 657
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter

    .prologue
    .line 165
    invoke-super {p0, p1}, Lcom/yingyonghui/market/AbsActivityAppListManager;->onCreate(Landroid/os/Bundle;)V

    .line 166
    const v0, 0x7f030033

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppManage;->setContentView(I)V

    .line 168
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppManage;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->u:Landroid/content/pm/PackageManager;

    .line 170
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppManage;->c()V

    .line 172
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.PACKAGE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "package"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->N:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/yingyonghui/market/ActivityListAppManage;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    invoke-static {}, Lcom/yingyonghui/market/util/p;->a()I

    move-result v0

    const/16 v1, 0x8

    if-lt v0, v1, :cond_0

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->N:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/yingyonghui/market/ActivityListAppManage;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 174
    :cond_0
    new-instance v0, Lcom/yingyonghui/market/cx;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppManage;->M:Landroid/os/Handler;

    invoke-direct {v0, p0, v1}, Lcom/yingyonghui/market/cx;-><init>(Lcom/yingyonghui/market/ActivityListAppManage;Landroid/os/Handler;)V

    .line 175
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppManage;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/yingyonghui/market/provider/f;->a:Landroid/net/Uri;

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, v0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 176
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 214
    invoke-super {p0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->onDestroy()V

    .line 215
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->N:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppManage;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 216
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 180
    invoke-super {p0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->onResume()V

    .line 182
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 183
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->L:Lcom/yingyonghui/market/ch;

    if-eqz v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->e:Landroid/widget/ListView;

    sget v1, Lcom/yingyonghui/market/ActivityListAppManage;->E:I

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 185
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->L:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    .line 199
    :cond_0
    :goto_0
    return-void

    .line 187
    :cond_1
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 188
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->y:Lcom/yingyonghui/market/bc;

    if-eqz v0, :cond_0

    .line 189
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->e:Landroid/widget/ListView;

    sget v1, Lcom/yingyonghui/market/ActivityListAppManage;->F:I

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 190
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->y:Lcom/yingyonghui/market/bc;

    invoke-virtual {v0}, Lcom/yingyonghui/market/bc;->notifyDataSetChanged()V

    .line 191
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppManage;->c()V

    goto :goto_0

    .line 193
    :cond_2
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 194
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->x:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 195
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppManage;->d()V

    goto :goto_0
.end method
