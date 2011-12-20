.class public Lcom/yingyonghui/market/ActivityDetailApp;
.super Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;
.source "ActivityDetailApp.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/TabHost$OnTabChangeListener;


# static fields
.field private static U:Ljava/lang/String;

.field private static final aa:[Ljava/lang/String;


# instance fields
.field private A:Landroid/widget/Button;

.field private B:Landroid/widget/Button;

.field private C:Landroid/widget/Button;

.field private D:Landroid/widget/Button;

.field private E:Landroid/widget/Button;

.field private F:Landroid/widget/Button;

.field private G:Landroid/widget/Button;

.field private H:Landroid/widget/Button;

.field private I:Landroid/view/View;

.field private J:Landroid/widget/TabWidget;

.field private K:F

.field private L:Z

.field private M:I

.field private N:Ljava/lang/String;

.field private O:Ljava/lang/String;

.field private P:Ljava/lang/String;

.field private Q:Lcom/yingyonghui/market/log/m;

.field private R:Ljava/lang/String;

.field private S:Ljava/lang/String;

.field private final T:I

.field private final V:I

.field private final W:I

.field private X:Landroid/os/Handler;

.field private final Y:Landroid/content/BroadcastReceiver;

.field private transient Z:Lcom/yingyonghui/market/ej;

.field private ab:Landroid/os/Handler;

.field private ac:J

.field public c:Lcom/yingyonghui/market/model/l;

.field private d:Landroid/widget/TabHost;

.field private e:Lcom/yingyonghui/market/model/j;

.field private f:I

.field private g:Ljava/lang/String;

.field private h:I

.field private i:Ljava/lang/String;

.field private j:I

.field private k:Lcom/yingyonghui/market/provider/k;

.field private l:Ljava/util/ArrayList;

.field private m:I

.field private n:Landroid/view/View;

.field private o:Landroid/view/View;

.field private p:Landroid/view/View;

.field private q:Landroid/view/View;

.field private r:Landroid/view/View;

.field private s:Landroid/widget/ProgressBar;

.field private t:Landroid/widget/TextView;

.field private u:Landroid/widget/TextView;

.field private v:Landroid/widget/Button;

.field private w:Landroid/widget/Button;

.field private x:Landroid/widget/Button;

.field private y:Landroid/widget/Button;

.field private z:Landroid/widget/Button;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 136
    const/4 v0, 0x0

    sput-object v0, Lcom/yingyonghui/market/ActivityDetailApp;->U:Ljava/lang/String;

    .line 347
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    .line 348
    sput-object v0, Lcom/yingyonghui/market/ActivityDetailApp;->aa:[Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    .line 349
    sget-object v0, Lcom/yingyonghui/market/ActivityDetailApp;->aa:[Ljava/lang/String;

    const/4 v1, 0x1

    const-string v2, "current_bytes"

    aput-object v2, v0, v1

    .line 350
    sget-object v0, Lcom/yingyonghui/market/ActivityDetailApp;->aa:[Ljava/lang/String;

    const/4 v1, 0x2

    const-string v2, "total_bytes"

    aput-object v2, v0, v1

    .line 351
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 66
    invoke-direct {p0}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;-><init>()V

    .line 70
    iput-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    .line 71
    iput-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    .line 102
    const/4 v0, 0x0

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->m:I

    .line 119
    const/high16 v0, 0x4190

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->K:F

    .line 130
    iput-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Q:Lcom/yingyonghui/market/log/m;

    .line 134
    const/16 v0, 0x14

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->T:I

    .line 138
    const/16 v0, 0x64

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->V:I

    .line 140
    const/16 v0, 0x66

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->W:I

    .line 142
    new-instance v0, Lcom/yingyonghui/market/dh;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/dh;-><init>(Lcom/yingyonghui/market/ActivityDetailApp;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->X:Landroid/os/Handler;

    .line 285
    new-instance v0, Lcom/yingyonghui/market/dg;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/dg;-><init>(Lcom/yingyonghui/market/ActivityDetailApp;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Y:Landroid/content/BroadcastReceiver;

    .line 928
    new-instance v0, Lcom/yingyonghui/market/dd;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/dd;-><init>(Lcom/yingyonghui/market/ActivityDetailApp;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->ab:Landroid/os/Handler;

    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityDetailApp;J)J
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 66
    iput-wide p1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->ac:J

    return-wide p1
.end method

.method private static a(Ljava/lang/String;Landroid/content/pm/PackageManager;)Landroid/content/Intent;
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 1122
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1123
    const-string v1, "android.intent.category.LAUNCHER"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 1124
    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 1125
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    .line 1126
    iget-object v2, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1127
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.MAIN"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1128
    const-string v2, "android.intent.category.LAUNCHER"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 1129
    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-virtual {v1, p0, v0}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-object v0, v1

    .line 1133
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityDetailApp;)Lcom/yingyonghui/market/provider/k;
    .locals 1
    .parameter

    .prologue
    .line 66
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->k:Lcom/yingyonghui/market/provider/k;

    return-object v0
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityDetailApp;Lcom/yingyonghui/market/provider/k;Landroid/widget/ProgressBar;Landroid/widget/TextView;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 66
    invoke-direct {p0, p1, p2, p3}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Lcom/yingyonghui/market/provider/k;Landroid/widget/ProgressBar;Landroid/widget/TextView;)V

    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityDetailApp;Ljava/lang/Object;)V
    .locals 18
    .parameter
    .parameter

    .prologue
    .line 66
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityDetailApp;->S:Ljava/lang/String;

    move-object v2, v0

    const-string v3, "download_error"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v2, 0x0

    move/from16 v17, v2

    :goto_0
    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz p1, :cond_a

    check-cast p1, Lcom/yingyonghui/market/eo;

    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityDetailApp;->S:Ljava/lang/String;

    move-object v2, v0

    const-string v4, "feedback"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    const-string v2, ""

    move-object v8, v2

    :goto_2
    if-eqz p1, :cond_9

    invoke-virtual/range {p1 .. p1}, Lcom/yingyonghui/market/eo;->c()Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual/range {p1 .. p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_3
    invoke-static/range {p1 .. p1}, Lcom/yingyonghui/market/util/c;->f(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static/range {p1 .. p1}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static/range {p1 .. p1}, Lcom/yingyonghui/market/util/c;->b(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static/range {p1 .. p1}, Lcom/yingyonghui/market/util/c;->d(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static/range {p1 .. p1}, Lcom/yingyonghui/market/util/c;->c(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_0
    const/4 v2, 0x1

    :goto_4
    if-eqz v2, :cond_6

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v2

    const/4 v3, 0x5

    iput v3, v2, Landroid/os/Message;->what:I

    move-object/from16 v0, p1

    move-object v1, v2

    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-static/range {p0 .. p0}, Lcom/yingyonghui/market/provider/g;->a(Landroid/content/Context;)Lcom/yingyonghui/market/provider/g;

    move-result-object v3

    invoke-virtual {v3}, Lcom/yingyonghui/market/provider/g;->a()Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :goto_5
    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    invoke-virtual/range {p0 .. p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityDetailApp;->i:Ljava/lang/String;

    move-object v7, v0

    invoke-static {v6, v7}, Lcom/yingyonghui/market/provider/k;->a(Landroid/content/ContentResolver;Ljava/lang/String;)Lcom/yingyonghui/market/provider/k;

    move-result-object v6

    if-eqz v6, :cond_8

    invoke-virtual {v6}, Lcom/yingyonghui/market/provider/k;->e()J

    move-result-wide v2

    invoke-virtual {v6}, Lcom/yingyonghui/market/provider/k;->f()J

    move-result-wide v4

    move-wide v11, v4

    move-wide v9, v2

    :goto_6
    invoke-virtual/range {p0 .. p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "lastmod"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "current_bytes"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "total_bytes"

    aput-object v6, v4, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "notificationextras=\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityDetailApp;->i:Ljava/lang/String;

    move-object v6, v0

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    if-eqz v2, :cond_7

    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_7

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v6, 0x1

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    int-to-float v6, v6

    const/4 v7, 0x2

    invoke-interface {v2, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    int-to-float v7, v7

    div-float/2addr v6, v7

    const/high16 v7, 0x42c8

    mul-float/2addr v6, v7

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "%"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-wide v13, v3

    move-object v15, v5

    :goto_7
    if-eqz v2, :cond_1

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_1
    const v2, 0x7f09002d

    move-object/from16 v0, p0

    move v1, v2

    invoke-static {v0, v1}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityDetailApp;->a:Lcom/yingyonghui/market/a/d;

    move-object v2, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/yingyonghui/market/ActivityDetailApp;->f:I

    move v3, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/yingyonghui/market/ActivityDetailApp;->ac:J

    move-wide v5, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityDetailApp;->b:Landroid/os/Handler;

    move-object/from16 v16, v0

    move/from16 v4, v17

    move-object/from16 v7, p1

    invoke-virtual/range {v2 .. v16}, Lcom/yingyonghui/market/a/d;->a(IIJLjava/lang/String;Ljava/lang/String;JJJLjava/lang/String;Landroid/os/Handler;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/yingyonghui/market/ActivityDetailApp;->U:Ljava/lang/String;

    return-void

    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityDetailApp;->S:Ljava/lang/String;

    move-object v2, v0

    const-string v3, "install_error"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v2, 0x1

    move/from16 v17, v2

    goto/16 :goto_0

    :cond_3
    const/4 v2, 0x2

    move/from16 v17, v2

    goto/16 :goto_0

    :cond_4
    invoke-virtual/range {p1 .. p1}, Lcom/yingyonghui/market/eo;->d()Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v8, v2

    goto/16 :goto_2

    :cond_5
    const/4 v2, 0x0

    goto/16 :goto_4

    :cond_6
    invoke-static/range {p0 .. p0}, Lcom/yingyonghui/market/provider/g;->a(Landroid/content/Context;)Lcom/yingyonghui/market/provider/g;

    move-result-object p1

    invoke-virtual/range {p1 .. p1}, Lcom/yingyonghui/market/provider/g;->b()Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_5

    :cond_7
    move-wide v13, v3

    move-object v15, v5

    goto :goto_7

    :cond_8
    move-wide v11, v4

    move-wide v9, v2

    goto/16 :goto_6

    :cond_9
    move-object/from16 p1, v3

    goto/16 :goto_3

    :cond_a
    move-object/from16 p1, v2

    goto/16 :goto_1
.end method

.method private a(Lcom/yingyonghui/market/provider/k;Landroid/widget/ProgressBar;Landroid/widget/TextView;)V
    .locals 11
    .parameter
    .parameter
    .parameter

    .prologue
    .line 355
    if-nez p2, :cond_1

    if-nez p3, :cond_1

    .line 413
    :cond_0
    :goto_0
    return-void

    .line 360
    :cond_1
    if-nez p1, :cond_2

    .line 361
    sget-object v0, Lcom/yingyonghui/market/provider/m;->a:Lcom/yingyonghui/market/provider/m;

    .line 366
    :goto_1
    const/4 v6, -0x1

    .line 367
    const/4 v7, 0x0

    .line 368
    sget-object v1, Lcom/yingyonghui/market/da;->a:[I

    invoke-virtual {v0}, Lcom/yingyonghui/market/provider/m;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_0

    move-object v0, v7

    move v1, v6

    .line 400
    :goto_2
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 401
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Z:Lcom/yingyonghui/market/ej;

    if-nez v0, :cond_5

    if-ltz v1, :cond_5

    .line 402
    new-instance v0, Lcom/yingyonghui/market/ej;

    invoke-direct {v0, p0, p0, v1}, Lcom/yingyonghui/market/ej;-><init>(Lcom/yingyonghui/market/ActivityDetailApp;Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Z:Lcom/yingyonghui/market/ej;

    .line 403
    sget-object v0, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    int-to-long v1, v1

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    .line 404
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Z:Lcom/yingyonghui/market/ej;

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    goto :goto_0

    .line 363
    :cond_2
    invoke-virtual {p1}, Lcom/yingyonghui/market/provider/k;->d()Lcom/yingyonghui/market/provider/m;

    move-result-object v0

    goto :goto_1

    .line 371
    :pswitch_0
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {p1}, Lcom/yingyonghui/market/provider/k;->g()Landroid/net/Uri;

    move-result-object v1

    sget-object v2, Lcom/yingyonghui/market/ActivityDetailApp;->aa:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 374
    if-eqz v0, :cond_6

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 375
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    .line 376
    const/4 v2, 0x1

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    .line 377
    const/4 v4, 0x2

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    .line 379
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-gtz v6, :cond_4

    .line 380
    const/4 v6, 0x0

    .line 384
    :goto_3
    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    .line 385
    const/4 v8, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    .line 386
    const/4 v8, 0x1

    invoke-static {p0, v2, v3}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v7, v8

    .line 387
    const/4 v2, 0x2

    invoke-static {p0, v4, v5}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v7, v2

    .line 388
    const v2, 0x7f09010f

    invoke-virtual {p0, v2, v7}, Lcom/yingyonghui/market/ActivityDetailApp;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    .line 391
    invoke-virtual {p2, v6}, Landroid/widget/ProgressBar;->setProgress(I)V

    move-object v10, v2

    move v2, v1

    move-object v1, v10

    .line 394
    :goto_4
    if-eqz v0, :cond_3

    .line 395
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_3
    move-object v0, v1

    move v1, v2

    goto/16 :goto_2

    .line 382
    :cond_4
    const-wide/16 v6, 0x64

    mul-long/2addr v6, v2

    div-long/2addr v6, v4

    long-to-int v6, v6

    goto :goto_3

    .line 405
    :cond_5
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Z:Lcom/yingyonghui/market/ej;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Z:Lcom/yingyonghui/market/ej;

    invoke-static {v0}, Lcom/yingyonghui/market/ej;->a(Lcom/yingyonghui/market/ej;)I

    move-result v0

    if-eq v0, v1, :cond_0

    .line 406
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Z:Lcom/yingyonghui/market/ej;

    invoke-static {v0}, Lcom/yingyonghui/market/ej;->b(Lcom/yingyonghui/market/ej;)V

    .line 407
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Z:Lcom/yingyonghui/market/ej;

    .line 409
    new-instance v0, Lcom/yingyonghui/market/ej;

    invoke-direct {v0, p0, p0, v1}, Lcom/yingyonghui/market/ej;-><init>(Lcom/yingyonghui/market/ActivityDetailApp;Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Z:Lcom/yingyonghui/market/ej;

    .line 410
    sget-object v0, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    int-to-long v1, v1

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    .line 411
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Z:Lcom/yingyonghui/market/ej;

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    goto/16 :goto_0

    :cond_6
    move-object v1, v7

    move v2, v6

    goto :goto_4

    .line 368
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private a(ZZ)V
    .locals 3
    .parameter
    .parameter

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 638
    if-eqz p1, :cond_1

    .line 639
    if-eqz p2, :cond_0

    .line 640
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->D:Landroid/widget/Button;

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 641
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->y:Landroid/widget/Button;

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 650
    :goto_0
    return-void

    .line 643
    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->D:Landroid/widget/Button;

    invoke-static {v0, v2}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 644
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->y:Landroid/widget/Button;

    invoke-static {v0, v2}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    goto :goto_0

    .line 647
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->D:Landroid/widget/Button;

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 648
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->y:Landroid/widget/Button;

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    goto :goto_0
.end method

.method private static a(Landroid/view/View;Z)Z
    .locals 2
    .parameter
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 833
    if-eqz p0, :cond_1

    .line 834
    if-eqz p1, :cond_0

    .line 835
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 836
    const/4 v0, 0x1

    .line 842
    :goto_0
    return v0

    .line 838
    :cond_0
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    move v0, v1

    .line 839
    goto :goto_0

    :cond_1
    move v0, v1

    .line 842
    goto :goto_0
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityDetailApp;)Landroid/widget/ProgressBar;
    .locals 1
    .parameter

    .prologue
    .line 66
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->s:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method private b(I)V
    .locals 7
    .parameter

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 581
    if-nez p1, :cond_0

    .line 582
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->l:Ljava/util/ArrayList;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 583
    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->l:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    move-object v6, p0

    move-object p0, v1

    move-object v1, v6

    .line 589
    :goto_0
    const v2, 0x7f02009e

    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 590
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 592
    invoke-virtual {p0, v3}, Landroid/view/View;->setFocusable(Z)V

    .line 593
    invoke-virtual {p0, v3}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 594
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 595
    invoke-virtual {p0}, Landroid/view/View;->requestFocusFromTouch()Z

    .line 596
    invoke-virtual {v1, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 598
    check-cast p0, Landroid/widget/TextView;

    .line 599
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 601
    move-object v0, v1

    check-cast v0, Landroid/widget/TextView;

    move-object p0, v0

    .line 602
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 603
    return-void

    .line 585
    :cond_0
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->l:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 586
    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->l:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    move-object v6, p0

    move-object p0, v1

    move-object v1, v6

    goto :goto_0
.end method

.method static synthetic c(Lcom/yingyonghui/market/ActivityDetailApp;)Landroid/widget/TextView;
    .locals 1
    .parameter

    .prologue
    .line 66
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->t:Landroid/widget/TextView;

    return-object v0
.end method

.method private d()V
    .locals 13

    .prologue
    const/16 v11, 0x64

    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 653
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->F:Landroid/widget/Button;

    invoke-static {v0, v10}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 654
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->x:Landroid/widget/Button;

    invoke-static {v0, v10}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 655
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->z:Landroid/widget/Button;

    invoke-static {v0, v10}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 656
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->v:Landroid/widget/Button;

    invoke-static {v0, v10}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 657
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->A:Landroid/widget/Button;

    invoke-static {v0, v10}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 658
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->B:Landroid/widget/Button;

    invoke-static {v0, v10}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 659
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->C:Landroid/widget/Button;

    invoke-static {v0, v10}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 660
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->y:Landroid/widget/Button;

    invoke-static {v0, v10}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 661
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->w:Landroid/widget/Button;

    invoke-static {v0, v10}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 662
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->p:Landroid/view/View;

    invoke-static {v0, v10}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 663
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->D:Landroid/widget/Button;

    invoke-static {v0, v10}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 664
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->E:Landroid/widget/Button;

    invoke-static {v0, v10}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 665
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->G:Landroid/widget/Button;

    invoke-static {v0, v10}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 666
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->H:Landroid/widget/Button;

    invoke-static {v0, v10}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 668
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->L:Z

    if-eqz v0, :cond_0

    .line 669
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->B:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 670
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->D:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 671
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->C:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 828
    :goto_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->q:Landroid/view/View;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 829
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->r:Landroid/view/View;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 830
    :goto_1
    return-void

    .line 673
    :cond_0
    iget v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->m:I

    if-nez v0, :cond_2

    .line 674
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->I:Landroid/view/View;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 681
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->i:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/yingyonghui/market/provider/k;->a(Landroid/content/ContentResolver;Ljava/lang/String;)Lcom/yingyonghui/market/provider/k;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->k:Lcom/yingyonghui/market/provider/k;

    .line 685
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->k:Lcom/yingyonghui/market/provider/k;

    if-nez v0, :cond_3

    .line 686
    sget-object v0, Lcom/yingyonghui/market/provider/m;->a:Lcom/yingyonghui/market/provider/m;

    .line 687
    const/4 v1, 0x0

    move-object v12, v1

    move-object v1, v0

    move-object v0, v12

    .line 700
    :goto_2
    :try_start_0
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->i:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 702
    iget-object v3, v2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    and-int/lit8 v3, v3, 0x1

    if-ne v3, v9, :cond_4

    move v3, v9

    .line 705
    :goto_3
    :try_start_1
    invoke-static {}, Lcom/yingyonghui/market/util/p;->a()I

    move-result v4

    const/16 v5, 0xa

    if-lt v4, v5, :cond_17

    .line 706
    const-class v4, Landroid/content/pm/PackageInfo;

    .line 707
    const-string v5, "lastUpdateTime"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    .line 709
    const-string v6, "firstInstallTime"

    invoke-virtual {v4, v6}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 711
    invoke-virtual {v5, v2}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v5

    .line 713
    invoke-virtual {v4, v2}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-wide v7

    .line 717
    cmp-long v4, v5, v7

    if-lez v4, :cond_5

    move v4, v9

    .line 719
    :goto_4
    :try_start_2
    iget v5, p0, Lcom/yingyonghui/market/ActivityDetailApp;->j:I

    iget v6, v2, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    if-le v5, v6, :cond_6

    move v5, v9

    .line 720
    :goto_5
    :try_start_3
    iget v2, v2, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    if-lez v2, :cond_7

    move v2, v9

    :goto_6
    move v12, v4

    move v4, v5

    move v5, v2

    move v2, v12

    .line 725
    :goto_7
    sget-object v6, Lcom/yingyonghui/market/provider/m;->b:Lcom/yingyonghui/market/provider/m;

    if-eq v1, v6, :cond_1

    sget-object v6, Lcom/yingyonghui/market/provider/m;->h:Lcom/yingyonghui/market/provider/m;

    if-ne v1, v6, :cond_8

    .line 727
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->z:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 728
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->u:Landroid/widget/TextView;

    const v1, 0x7f0900a1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 729
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->p:Landroid/view/View;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 732
    const-string v0, "download_error"

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->S:Ljava/lang/String;

    .line 733
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->E:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 734
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->G:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 736
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->k:Lcom/yingyonghui/market/provider/k;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->s:Landroid/widget/ProgressBar;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->t:Landroid/widget/TextView;

    invoke-direct {p0, v0, v1, v2}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Lcom/yingyonghui/market/provider/k;Landroid/widget/ProgressBar;Landroid/widget/TextView;)V

    goto/16 :goto_0

    .line 676
    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->I:Landroid/view/View;

    invoke-static {v0, v10}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 677
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->p:Landroid/view/View;

    invoke-static {v0, v10}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    goto/16 :goto_1

    .line 689
    :cond_3
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->k:Lcom/yingyonghui/market/provider/k;

    invoke-virtual {v0}, Lcom/yingyonghui/market/provider/k;->d()Lcom/yingyonghui/market/provider/m;

    move-result-object v0

    .line 690
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->k:Lcom/yingyonghui/market/provider/k;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/yingyonghui/market/provider/k;->a(Landroid/content/ContentResolver;)Ljava/io/File;

    move-result-object v1

    move-object v12, v1

    move-object v1, v0

    move-object v0, v12

    goto/16 :goto_2

    :cond_4
    move v3, v10

    .line 702
    goto/16 :goto_3

    :cond_5
    move v4, v10

    .line 717
    goto :goto_4

    :cond_6
    move v5, v10

    .line 719
    goto :goto_5

    :cond_7
    move v2, v10

    .line 720
    goto :goto_6

    :catch_0
    move-exception v2

    move v2, v10

    move v3, v10

    move v4, v10

    :goto_8
    move v5, v10

    goto :goto_7

    .line 738
    :cond_8
    sget-object v6, Lcom/yingyonghui/market/provider/m;->f:Lcom/yingyonghui/market/provider/m;

    if-eq v1, v6, :cond_9

    sget-object v6, Lcom/yingyonghui/market/provider/m;->m:Lcom/yingyonghui/market/provider/m;

    if-ne v1, v6, :cond_c

    .line 740
    :cond_9
    if-eqz v4, :cond_b

    .line 741
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->x:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 750
    :cond_a
    :goto_9
    invoke-direct {p0, v3, v2}, Lcom/yingyonghui/market/ActivityDetailApp;->a(ZZ)V

    .line 753
    const-string v0, "feedback"

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->S:Ljava/lang/String;

    .line 754
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->E:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 755
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->H:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    goto/16 :goto_0

    .line 743
    :cond_b
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->v:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 744
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->i:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/yingyonghui/market/util/GlobalUtil;->c(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 746
    if-eqz v0, :cond_a

    .line 747
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->v:Landroid/widget/Button;

    invoke-virtual {v0, v9}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_9

    .line 756
    :cond_c
    sget-object v6, Lcom/yingyonghui/market/provider/m;->j:Lcom/yingyonghui/market/provider/m;

    if-ne v1, v6, :cond_e

    .line 757
    if-eqz v0, :cond_d

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 758
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->w:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 760
    invoke-direct {p0, v3, v2}, Lcom/yingyonghui/market/ActivityDetailApp;->a(ZZ)V

    .line 763
    const-string v0, "feedback"

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->S:Ljava/lang/String;

    .line 764
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->E:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 765
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->H:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    goto/16 :goto_0

    .line 767
    :cond_d
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->k:Lcom/yingyonghui/market/provider/k;

    sget-object v1, Lcom/yingyonghui/market/provider/m;->l:Lcom/yingyonghui/market/provider/m;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/provider/k;->a(Lcom/yingyonghui/market/provider/m;)V

    .line 768
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->k:Lcom/yingyonghui/market/provider/k;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/provider/k;->b(Landroid/content/ContentResolver;)V

    .line 770
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->ab:Landroid/os/Handler;

    invoke-virtual {v0, v11}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_1

    .line 774
    :cond_e
    sget-object v6, Lcom/yingyonghui/market/provider/m;->d:Lcom/yingyonghui/market/provider/m;

    if-ne v1, v6, :cond_11

    .line 775
    if-eqz v0, :cond_10

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 776
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->w:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 777
    if-eqz v5, :cond_f

    .line 778
    invoke-direct {p0, v3, v2}, Lcom/yingyonghui/market/ActivityDetailApp;->a(ZZ)V

    .line 780
    const-string v0, "feedback"

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->S:Ljava/lang/String;

    .line 781
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->E:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 782
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->H:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    goto/16 :goto_0

    .line 785
    :cond_f
    const-string v0, "install_error"

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->S:Ljava/lang/String;

    .line 786
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->E:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 787
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->G:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    goto/16 :goto_0

    .line 790
    :cond_10
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->k:Lcom/yingyonghui/market/provider/k;

    sget-object v1, Lcom/yingyonghui/market/provider/m;->g:Lcom/yingyonghui/market/provider/m;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/provider/k;->a(Lcom/yingyonghui/market/provider/m;)V

    .line 791
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->k:Lcom/yingyonghui/market/provider/k;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/provider/k;->b(Landroid/content/ContentResolver;)V

    .line 793
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->ab:Landroid/os/Handler;

    invoke-virtual {v0, v11}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_1

    .line 797
    :cond_11
    sget-object v0, Lcom/yingyonghui/market/provider/m;->e:Lcom/yingyonghui/market/provider/m;

    if-eq v1, v0, :cond_12

    sget-object v0, Lcom/yingyonghui/market/provider/m;->k:Lcom/yingyonghui/market/provider/m;

    if-ne v1, v0, :cond_13

    .line 799
    :cond_12
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->u:Landroid/widget/TextView;

    const v1, 0x7f090014

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto/16 :goto_0

    .line 801
    :cond_13
    if-eqz v4, :cond_14

    .line 802
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->x:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 803
    invoke-direct {p0, v3, v2}, Lcom/yingyonghui/market/ActivityDetailApp;->a(ZZ)V

    .line 806
    const-string v0, "feedback"

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->S:Ljava/lang/String;

    .line 807
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->E:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 808
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->H:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    goto/16 :goto_0

    .line 809
    :cond_14
    if-eqz v5, :cond_16

    .line 810
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->v:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 811
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->i:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/yingyonghui/market/util/GlobalUtil;->c(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 813
    if-eqz v0, :cond_15

    .line 814
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->v:Landroid/widget/Button;

    invoke-virtual {v0, v9}, Landroid/widget/Button;->setEnabled(Z)V

    .line 816
    :cond_15
    invoke-direct {p0, v3, v2}, Lcom/yingyonghui/market/ActivityDetailApp;->a(ZZ)V

    .line 819
    const-string v0, "feedback"

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->S:Ljava/lang/String;

    .line 820
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->E:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    .line 821
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->H:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    goto/16 :goto_0

    .line 823
    :cond_16
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->F:Landroid/widget/Button;

    invoke-static {v0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Landroid/view/View;Z)Z

    goto/16 :goto_0

    :catch_1
    move-exception v2

    move v2, v10

    move v4, v10

    goto/16 :goto_8

    :catch_2
    move-exception v2

    move v2, v4

    move v4, v10

    goto/16 :goto_8

    :catch_3
    move-exception v2

    move v2, v4

    move v4, v5

    goto/16 :goto_8

    :cond_17
    move v4, v10

    goto/16 :goto_4
.end method

.method static synthetic d(Lcom/yingyonghui/market/ActivityDetailApp;)V
    .locals 5
    .parameter

    .prologue
    const/4 v4, 0x0

    .line 66
    new-instance v0, Lcom/yingyonghui/market/eo;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/eo;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->S:Ljava/lang/String;

    const-string v2, "download_error"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const v2, 0x7f09013d

    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityDetailApp;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->g:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/eo;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->S:Ljava/lang/String;

    const-string v2, "feedback"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const v1, 0x7f090140

    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/ActivityDetailApp;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/eo;->a(Ljava/lang/CharSequence;)V

    :goto_1
    const v1, 0x7f090142

    new-instance v2, Lcom/yingyonghui/market/dc;

    invoke-direct {v2, p0, v0}, Lcom/yingyonghui/market/dc;-><init>(Lcom/yingyonghui/market/ActivityDetailApp;Lcom/yingyonghui/market/eo;)V

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/eo;->a(ILcom/yingyonghui/market/bs;)Lcom/yingyonghui/market/eo;

    const v1, 0x7f09007a

    const/4 v2, 0x0

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

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/ScrollView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->S:Ljava/lang/String;

    const-string v2, "feedback"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {v0}, Lcom/yingyonghui/market/eo;->c()Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_2
    invoke-virtual {v0}, Lcom/yingyonghui/market/eo;->c()Landroid/widget/TextView;

    move-result-object v0

    invoke-static {p0}, Lcom/yingyonghui/market/provider/g;->a(Landroid/content/Context;)Lcom/yingyonghui/market/provider/g;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yingyonghui/market/provider/g;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->S:Ljava/lang/String;

    const-string v2, "install_error"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const v2, 0x7f09013e

    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityDetailApp;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->g:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const v2, 0x7f09013f

    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityDetailApp;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->g:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    :cond_2
    const v1, 0x7f090141

    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/ActivityDetailApp;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/eo;->a(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    :cond_3
    invoke-virtual {v0}, Lcom/yingyonghui/market/eo;->d()Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {v0}, Lcom/yingyonghui/market/eo;->c()Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {v0}, Lcom/yingyonghui/market/eo;->d()Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Lcom/yingyonghui/market/db;

    invoke-direct {v2, p0, v0}, Lcom/yingyonghui/market/db;-><init>(Lcom/yingyonghui/market/ActivityDetailApp;Lcom/yingyonghui/market/eo;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    goto :goto_2
.end method

.method static synthetic e(Lcom/yingyonghui/market/ActivityDetailApp;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 66
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->i:Ljava/lang/String;

    return-object v0
.end method

.method private e()V
    .locals 5

    .prologue
    .line 968
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    if-eqz v0, :cond_0

    .line 969
    new-instance v0, Landroid/content/Intent;

    const-string v1, "send_asset_detail"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 970
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 971
    const-string v2, "_id"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget v3, v3, Lcom/yingyonghui/market/model/j;->e:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 972
    const-string v2, "title"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget-object v3, v3, Lcom/yingyonghui/market/model/j;->i:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 973
    const-string v2, "author"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget-object v3, v3, Lcom/yingyonghui/market/model/j;->j:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 974
    const-string v2, "rating"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget v3, v3, Lcom/yingyonghui/market/model/j;->l:F

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 975
    const-string v2, "ratingNumbers"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget v3, v3, Lcom/yingyonghui/market/model/j;->A:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 976
    const-string v2, "pkgName"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget-object v3, v3, Lcom/yingyonghui/market/model/j;->m:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 977
    const-string v2, "size"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget v3, v3, Lcom/yingyonghui/market/model/j;->o:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 978
    const-string v2, "version"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget-object v3, v3, Lcom/yingyonghui/market/model/j;->q:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 979
    const-string v2, "lastUpdate"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget-object v3, v3, Lcom/yingyonghui/market/model/j;->r:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 980
    const-string v2, "versionCode"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget v3, v3, Lcom/yingyonghui/market/model/j;->s:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 981
    const-string v2, "downloadCountMax"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget v3, v3, Lcom/yingyonghui/market/model/j;->y:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 982
    const-string v2, "downloadCountMin"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget v3, v3, Lcom/yingyonghui/market/model/j;->z:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 983
    const-string v2, "description"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget-object v3, v3, Lcom/yingyonghui/market/model/j;->a:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 985
    const-string v2, "myComment"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget-object v3, v3, Lcom/yingyonghui/market/model/j;->b:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 986
    const-string v2, "myCommentDate"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget-wide v3, v3, Lcom/yingyonghui/market/model/j;->c:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 987
    const-string v2, "myRating"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget v3, v3, Lcom/yingyonghui/market/model/j;->d:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 989
    const-string v2, "installed"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget v3, v3, Lcom/yingyonghui/market/model/j;->n:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 990
    const-string v2, "promotionId"

    iget v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->M:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 991
    const-string v2, "promotionAgent"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->N:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 992
    const-string v2, "promotionText"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->O:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 993
    const-string v2, "page"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Q:Lcom/yingyonghui/market/log/m;

    invoke-virtual {v3}, Lcom/yingyonghui/market/log/m;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 994
    const-string v2, "snapshotUrls"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget-object v3, v3, Lcom/yingyonghui/market/model/j;->B:[Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 995
    const-string v2, "iconUrl"

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget-object v3, v3, Lcom/yingyonghui/market/model/j;->f:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 997
    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 998
    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->sendBroadcast(Landroid/content/Intent;)V

    .line 1000
    :cond_0
    return-void
.end method

.method static synthetic f(Lcom/yingyonghui/market/ActivityDetailApp;)V
    .locals 0
    .parameter

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->d()V

    return-void
.end method

.method static synthetic g(Lcom/yingyonghui/market/ActivityDetailApp;)Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 66
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->X:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic h(Lcom/yingyonghui/market/ActivityDetailApp;)I
    .locals 1
    .parameter

    .prologue
    .line 66
    iget v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->f:I

    return v0
.end method

.method static synthetic i(Lcom/yingyonghui/market/ActivityDetailApp;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 66
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->g:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic j(Lcom/yingyonghui/market/ActivityDetailApp;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 66
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->S:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic k(Lcom/yingyonghui/market/ActivityDetailApp;)Landroid/widget/Button;
    .locals 1
    .parameter

    .prologue
    .line 66
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->z:Landroid/widget/Button;

    return-object v0
.end method


# virtual methods
.method protected final a()V
    .locals 2

    .prologue
    .line 920
    :try_start_0
    sget-object v0, Lcom/yingyonghui/market/ActivityDetailApp;->U:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 921
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/yingyonghui/market/ActivityDetailApp;->U:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/yingyonghui/market/log/l;->b(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 926
    :cond_0
    :goto_0
    return-void

    .line 923
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public final a(I)V
    .locals 4
    .parameter

    .prologue
    const v3, 0x7f09004a

    const/4 v2, 0x1

    .line 606
    invoke-static {}, Lcom/yingyonghui/market/util/p;->a()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 607
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->J:Landroid/widget/TabWidget;

    invoke-virtual {v0, v2}, Landroid/widget/TabWidget;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    .line 608
    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 609
    if-eqz v0, :cond_0

    .line 610
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v3}, Lcom/yingyonghui/market/ActivityDetailApp;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 617
    :cond_0
    :goto_0
    return-void

    .line 614
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->l:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 615
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v3}, Lcom/yingyonghui/market/ActivityDetailApp;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method protected final a(Landroid/os/Message;)V
    .locals 5
    .parameter

    .prologue
    const/4 v4, 0x0

    .line 870
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/yingyonghui/market/a/a;

    .line 871
    iget v1, v0, Lcom/yingyonghui/market/a/a;->c:I

    .line 872
    const/16 v2, 0x64

    if-ne v1, v2, :cond_1

    .line 873
    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/yingyonghui/market/a/d;->c(Landroid/content/Context;Ljava/lang/String;)Lcom/yingyonghui/market/model/j;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    .line 874
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    if-eqz v0, :cond_0

    .line 875
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget-object v1, v1, Lcom/yingyonghui/market/model/j;->m:Ljava/lang/String;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget v2, v2, Lcom/yingyonghui/market/model/j;->s:I

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget v3, v3, Lcom/yingyonghui/market/model/j;->e:I

    invoke-static {p0, v1, v2, v3}, Lcom/yingyonghui/market/util/t;->a(Landroid/content/Context;Ljava/lang/String;II)I

    move-result v1

    iput v1, v0, Lcom/yingyonghui/market/model/j;->n:I

    .line 879
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    .line 880
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->e()V

    .line 882
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->n:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 883
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->o:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 885
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 886
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 887
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Q:Lcom/yingyonghui/market/log/m;

    invoke-static {v1, v2, v0}, Lcom/yingyonghui/market/log/l;->b(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/util/List;)V

    .line 913
    :cond_0
    :goto_0
    return-void

    .line 889
    :cond_1
    const/16 v2, 0x66

    if-ne v1, v2, :cond_0

    .line 891
    iget-object v0, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 893
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    .line 894
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 895
    const/16 v2, 0x30

    if-lt v1, v2, :cond_2

    const/16 v2, 0x39

    if-gt v1, v2, :cond_2

    .line 896
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 897
    if-nez v0, :cond_2

    .line 898
    const/4 v0, 0x1

    .line 903
    :goto_1
    if-nez v0, :cond_0

    .line 908
    sget-object v0, Lcom/yingyonghui/market/ActivityDetailApp;->U:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 909
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/yingyonghui/market/ActivityDetailApp;->U:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/yingyonghui/market/log/l;->b(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    move v0, v4

    goto :goto_1
.end method

.method public final b()Lcom/yingyonghui/market/log/m;
    .locals 1

    .prologue
    .line 269
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Q:Lcom/yingyonghui/market/log/m;

    return-object v0
.end method

.method public final c()I
    .locals 1

    .prologue
    .line 634
    iget v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->m:I

    return v0
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2
    .parameter

    .prologue
    .line 243
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    .line 245
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 255
    :cond_0
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    :goto_0
    return v0

    .line 247
    :pswitch_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 248
    const-class v1, Lcom/yingyonghui/market/ActivityTab4Search;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 250
    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->startActivity(Landroid/content/Intent;)V

    .line 251
    const/4 v0, 0x1

    goto :goto_0

    .line 245
    nop

    :pswitch_data_0
    .packed-switch 0x54
        :pswitch_0
    .end packed-switch
.end method

.method protected finalize()V
    .locals 1

    .prologue
    .line 424
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Z:Lcom/yingyonghui/market/ej;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Z:Lcom/yingyonghui/market/ej;

    invoke-static {v0}, Lcom/yingyonghui/market/ej;->b(Lcom/yingyonghui/market/ej;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Z:Lcom/yingyonghui/market/ej;

    .line 425
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 426
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v1, -0x1

    .line 1099
    invoke-super {p0, p1, p2, p3}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 1101
    const/16 v0, 0x64

    if-eq p1, v0, :cond_0

    const/16 v0, 0xc8

    if-ne p1, v0, :cond_2

    .line 1103
    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    if-eqz v0, :cond_1

    if-ne p2, v1, :cond_1

    .line 1104
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    iget-object v0, v0, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    iget v1, v1, Lcom/yingyonghui/market/model/l;->s:I

    iget v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->f:I

    invoke-static {p0, v0, v1, v2}, Lcom/yingyonghui/market/util/t;->a(Landroid/content/Context;Ljava/lang/String;II)I

    move-result v0

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->h:I

    .line 1107
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->d()V

    .line 1119
    :cond_1
    :goto_0
    return-void

    .line 1109
    :cond_2
    const/16 v0, 0x190

    if-ne p1, v0, :cond_1

    .line 1110
    if-ne p2, v1, :cond_1

    .line 1111
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getLocalActivityManager()Landroid/app/LocalActivityManager;

    move-result-object v0

    .line 1112
    const-string v1, "comment"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/app/LocalActivityManager;->destroyActivity(Ljava/lang/String;Z)Landroid/view/Window;

    .line 1113
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 1114
    const-class v2, Lcom/yingyonghui/market/ActivityListComments;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 1115
    const-string v2, "_id"

    iget v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->f:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1116
    const-string v2, "comment"

    invoke-virtual {v0, v2, v1}, Landroid/app/LocalActivityManager;->startActivity(Ljava/lang/String;Landroid/content/Intent;)Landroid/view/Window;

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 14
    .parameter

    .prologue
    const/16 v1, 0xdc

    const/16 v13, 0x64

    const/4 v4, -0x1

    const/4 v12, 0x0

    .line 1003
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 1090
    :goto_0
    :pswitch_0
    return-void

    .line 1006
    :pswitch_1
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/yingyonghui/market/util/GlobalUtil;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    iget v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->h:I

    invoke-static {v0}, Lcom/yingyonghui/market/util/GlobalUtil;->a(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {p0}, Lcom/yingyonghui/market/downloader/n;->a(Landroid/content/Context;)Lcom/yingyonghui/market/downloader/n;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->g:Ljava/lang/String;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    iget v2, v2, Lcom/yingyonghui/market/model/l;->e:I

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    iget-object v3, v3, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    iget-object v4, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    iget-object v4, v4, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    iget-object v5, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    iget v5, v5, Lcom/yingyonghui/market/model/l;->o:I

    iget v6, p0, Lcom/yingyonghui/market/ActivityDetailApp;->M:I

    iget-object v7, p0, Lcom/yingyonghui/market/ActivityDetailApp;->N:Ljava/lang/String;

    iget-object v8, p0, Lcom/yingyonghui/market/ActivityDetailApp;->P:Ljava/lang/String;

    iget-object v11, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    iget-object v11, v11, Lcom/yingyonghui/market/model/l;->f:Ljava/lang/String;

    invoke-virtual/range {v0 .. v11}, Lcom/yingyonghui/market/downloader/n;->a(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->ab:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->ab:Landroid/os/Handler;

    invoke-virtual {v0, v13}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1013
    :cond_0
    iget v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->h:I

    invoke-static {v0}, Lcom/yingyonghui/market/util/GlobalUtil;->a(I)Ljava/lang/String;

    move-result-object v5

    .line 1014
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Q:Lcom/yingyonghui/market/log/m;

    const-string v2, ""

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    iget v4, v3, Lcom/yingyonghui/market/model/l;->e:I

    move v3, v12

    invoke-static/range {v0 .. v5}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/lang/String;)V

    goto :goto_0

    .line 1018
    :pswitch_2
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    iget-object v0, v0, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/yingyonghui/market/util/GlobalUtil;->c(Landroid/content/Context;Ljava/lang/String;)V

    .line 1020
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->ab:Landroid/os/Handler;

    const-wide/16 v1, 0x4b0

    invoke-virtual {v0, v13, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1022
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Q:Lcom/yingyonghui/market/log/m;

    invoke-static {v1}, Lcom/yingyonghui/market/log/h;->b(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 1026
    :pswitch_3
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1027
    const-string v1, "_id"

    iget v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->f:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1028
    const-string v1, "position"

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "position"

    invoke-virtual {v2, v3, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1029
    const-string v1, "select"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1030
    invoke-virtual {p0, v4, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->setResult(ILandroid/content/Intent;)V

    .line 1031
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->finish()V

    goto/16 :goto_0

    .line 1035
    :pswitch_4
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1036
    const-string v1, "_id"

    iget v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->f:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1037
    const-string v1, "position"

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "position"

    invoke-virtual {v2, v3, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1038
    const-string v1, "select"

    invoke-virtual {v0, v1, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1039
    invoke-virtual {p0, v4, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->setResult(ILandroid/content/Intent;)V

    .line 1040
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->finish()V

    goto/16 :goto_0

    .line 1044
    :pswitch_5
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    iget-object v0, v0, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/yingyonghui/market/util/GlobalUtil;->d(Landroid/content/Context;Ljava/lang/String;)V

    .line 1046
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Q:Lcom/yingyonghui/market/log/m;

    invoke-static {v1}, Lcom/yingyonghui/market/log/h;->c(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1052
    :pswitch_6
    :try_start_0
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->i:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 1054
    if-eqz v0, :cond_1

    .line 1056
    :try_start_1
    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 1067
    :goto_1
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Q:Lcom/yingyonghui/market/log/m;

    invoke-static {v1}, Lcom/yingyonghui/market/log/h;->d(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1058
    :catch_0
    move-exception v0

    :try_start_2
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->i:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityDetailApp;->a(Ljava/lang/String;Landroid/content/pm/PackageManager;)Landroid/content/Intent;

    move-result-object v0

    .line 1059
    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_1

    .line 1062
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->v:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1063
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->v:Landroid/widget/Button;

    const v1, -0x777778

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 1071
    :pswitch_7
    invoke-static {p0}, Lcom/yingyonghui/market/downloader/n;->a(Landroid/content/Context;)Lcom/yingyonghui/market/downloader/n;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->i:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/downloader/n;->a(Ljava/lang/String;)V

    .line 1074
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->d()V

    .line 1079
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Q:Lcom/yingyonghui/market/log/m;

    invoke-static {v1}, Lcom/yingyonghui/market/log/h;->e(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1083
    :pswitch_8
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->X:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1084
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Q:Lcom/yingyonghui/market/log/m;

    invoke-static {v1}, Lcom/yingyonghui/market/log/h;->h(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1088
    :pswitch_9
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->X:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1089
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Q:Lcom/yingyonghui/market/log/m;

    invoke-static {v1}, Lcom/yingyonghui/market/log/h;->f(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1003
    nop

    :pswitch_data_0
    .packed-switch 0x7f0b002c
        :pswitch_6
        :pswitch_1
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_5
        :pswitch_7
        :pswitch_0
        :pswitch_4
        :pswitch_0
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 12
    .parameter

    .prologue
    const/16 v11, 0x8

    const/4 v10, 0x0

    const/4 v4, -0x1

    const/4 v3, 0x1

    const/4 v9, 0x0

    .line 161
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onCreate(Landroid/os/Bundle;)V

    .line 162
    invoke-virtual {p0, v3}, Lcom/yingyonghui/market/ActivityDetailApp;->requestWindowFeature(I)Z

    .line 163
    const v0, 0x103000a

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->setTheme(I)V

    .line 165
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 167
    const-string v1, "_id"

    invoke-virtual {v0, v1, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->f:I

    .line 168
    const-string v1, "title"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->g:Ljava/lang/String;

    .line 169
    const-string v1, "pkgName"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->i:Ljava/lang/String;

    .line 170
    const-string v1, "installed"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->h:I

    .line 171
    const-string v1, "preinstall"

    invoke-virtual {v0, v1, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->L:Z

    .line 172
    const-string v1, "promotionId"

    invoke-virtual {v0, v1, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->M:I

    .line 173
    const-string v1, "promotionAgent"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->N:Ljava/lang/String;

    .line 174
    const-string v1, "promotionText"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->O:Ljava/lang/String;

    .line 175
    const-string v1, "promotionDownUrl"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->P:Ljava/lang/String;

    .line 176
    const-string v1, "versionCode"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->j:I

    .line 177
    const-string v1, "from"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->R:Ljava/lang/String;

    .line 180
    new-instance v1, Lcom/yingyonghui/market/model/l;

    invoke-direct {v1}, Lcom/yingyonghui/market/model/l;-><init>()V

    iput-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    .line 181
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    iget v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->f:I

    iput v2, v1, Lcom/yingyonghui/market/model/l;->e:I

    .line 182
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->g:Ljava/lang/String;

    iput-object v2, v1, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    .line 183
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    iget v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->h:I

    iput v2, v1, Lcom/yingyonghui/market/model/l;->n:I

    .line 184
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->i:Ljava/lang/String;

    iput-object v2, v1, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    .line 185
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    const-string v2, "size"

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, v1, Lcom/yingyonghui/market/model/l;->o:I

    .line 186
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    iget v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->j:I

    iput v2, v1, Lcom/yingyonghui/market/model/l;->s:I

    .line 188
    const-string v1, "assetDetail"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/j;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    .line 189
    new-instance v0, Lcom/yingyonghui/market/log/m;

    const-string v1, "Detail"

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    const-string v1, "assetId"

    iget v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->f:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/yingyonghui/market/log/m;

    move-result-object v0

    const-string v1, "from"

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->R:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/yingyonghui/market/log/m;

    move-result-object v0

    iget v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->M:I

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->N:Ljava/lang/String;

    const-string v2, "youyuad"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "promotionAgent"

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->N:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/yingyonghui/market/log/m;

    move-result-object v0

    const-string v1, "promotionId"

    iget v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->M:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/yingyonghui/market/log/m;

    move-result-object v0

    :cond_0
    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Q:Lcom/yingyonghui/market/log/m;

    .line 191
    const v0, 0x7f030006

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->setContentView(I)V

    .line 193
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getTabHost()Landroid/widget/TabHost;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->d:Landroid/widget/TabHost;

    .line 194
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->d:Landroid/widget/TabHost;

    invoke-virtual {v0, v3}, Landroid/widget/TabHost;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TabWidget;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->J:Landroid/widget/TabWidget;

    .line 195
    const v0, 0x7f0b0025

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->n:Landroid/view/View;

    const v0, 0x7f0b00bb

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->o:Landroid/view/View;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->n:Landroid/view/View;

    invoke-virtual {v0, v11}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->o:Landroid/view/View;

    invoke-virtual {v0, v9}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f0b0057

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    new-instance v1, Lcom/yingyonghui/market/df;

    invoke-direct {v1, p0}, Lcom/yingyonghui/market/df;-><init>(Lcom/yingyonghui/market/ActivityDetailApp;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0b0058

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    invoke-virtual {v0, v9}, Landroid/widget/ImageButton;->setVisibility(I)V

    new-instance v1, Lcom/yingyonghui/market/de;

    invoke-direct {v1, p0}, Lcom/yingyonghui/market/de;-><init>(Lcom/yingyonghui/market/ActivityDetailApp;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0b0026

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->p:Landroid/view/View;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->p:Landroid/view/View;

    const v1, 0x7f0b0028

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->s:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->p:Landroid/view/View;

    const v1, 0x7f0b0029

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->t:Landroid/widget/TextView;

    const v0, 0x7f0b002b

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->q:Landroid/view/View;

    const v0, 0x7f0b0038

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->r:Landroid/view/View;

    const v0, 0x7f0b0030

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->w:Landroid/widget/Button;

    const v0, 0x7f0b002c

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->v:Landroid/widget/Button;

    const v0, 0x7f0b002e

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->x:Landroid/widget/Button;

    const v0, 0x7f0b0031

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->y:Landroid/widget/Button;

    const v0, 0x7f0b0032

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->z:Landroid/widget/Button;

    const v0, 0x7f0b0033

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->A:Landroid/widget/Button;

    const v0, 0x7f0b002f

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->B:Landroid/widget/Button;

    const v0, 0x7f0b0034

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->C:Landroid/widget/Button;

    const v0, 0x7f0b0003

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->D:Landroid/widget/Button;

    const v0, 0x7f0b002d

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->F:Landroid/widget/Button;

    const v0, 0x7f0b0035

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->E:Landroid/widget/Button;

    const v0, 0x7f0b0036

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->G:Landroid/widget/Button;

    const v0, 0x7f0b0037

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->H:Landroid/widget/Button;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->w:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->v:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->x:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->y:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->z:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->B:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->C:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->A:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->F:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->G:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->H:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->p:Landroid/view/View;

    const v1, 0x7f0b0027

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->u:Landroid/widget/TextView;

    const v0, 0x7f0b002a

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->I:Landroid/view/View;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->I:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->I:Landroid/view/View;

    invoke-virtual {v0, v9}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    invoke-static {}, Lcom/yingyonghui/market/util/GlobalUtil;->a()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->z:Landroid/widget/Button;

    const v1, 0x7f090071

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->d:Landroid/widget/TabHost;

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getTabHost()Landroid/widget/TabHost;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->d:Landroid/widget/TabHost;

    :cond_3
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->d:Landroid/widget/TabHost;

    const-string v1, "detail"

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->l:Ljava/util/ArrayList;

    new-instance v3, Landroid/widget/TableLayout$LayoutParams;

    const/high16 v0, 0x3f80

    invoke-direct {v3, v4, v4, v0}, Landroid/widget/TableLayout$LayoutParams;-><init>(IIF)V

    const-string v0, "layout_inflater"

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    const v1, 0x7f03004e

    invoke-virtual {v0, v1, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v4, 0x7f02009e

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setBackgroundResource(I)V

    invoke-virtual {v1}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v4, v10}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    const v4, 0x7f090048

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0200ca

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    iget v4, p0, Lcom/yingyonghui/market/ActivityDetailApp;->K:F

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const-string v4, "detail"

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    :try_start_0
    const-class v4, Landroid/widget/TabHost$TabSpec;

    const-string v5, "setIndicator"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/view/View;

    aput-object v8, v6, v7

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    invoke-virtual {v4, v2, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    iget-object v4, p0, Lcom/yingyonghui/market/ActivityDetailApp;->l:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-class v4, Lcom/yingyonghui/market/ActivityDetailAppInner;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, p0, v4}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    const-string v4, "_id"

    iget v5, p0, Lcom/yingyonghui/market/ActivityDetailApp;->f:I

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/high16 v4, 0x1000

    invoke-virtual {v1, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v2, v1}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->d:Landroid/widget/TabHost;

    invoke-virtual {v1, v2}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->d:Landroid/widget/TabHost;

    const-string v2, "comment"

    invoke-virtual {v1, v2}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    const v2, 0x7f03004e

    invoke-virtual {v0, v2, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f02009e

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setBackgroundResource(I)V

    invoke-virtual {v0}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2, v10}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    const v2, 0x7f09004a

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f0200ca

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->K:F

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const-string v2, "comment"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    :try_start_1
    const-class v2, Landroid/widget/TabHost$TabSpec;

    const-string v3, "setIndicator"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/view/View;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :goto_1
    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->l:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-class v2, Lcom/yingyonghui/market/ActivityListComments;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "_id"

    iget v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->f:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->d:Landroid/widget/TabHost;

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->d:Landroid/widget/TabHost;

    invoke-virtual {v0, p0}, Landroid/widget/TabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    invoke-direct {p0, v9}, Lcom/yingyonghui/market/ActivityDetailApp;->b(I)V

    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->d()V

    iget v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->f:I

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->i:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    const v0, 0x7f0900f4

    invoke-static {p0, v0}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->finish()V

    :goto_2
    iget v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->M:I

    if-lez v0, :cond_4

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->N:Ljava/lang/String;

    const-string v1, "youyuad"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->a:Lcom/yingyonghui/market/a/d;

    iget v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->M:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->N:Ljava/lang/String;

    const-string v3, "pageview"

    invoke-virtual {v0, v1, v2, v3}, Lcom/yingyonghui/market/a/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    :cond_4
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "app_instaled_refreshview"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "app_uninstaled_refreshview"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Y:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 198
    return-void

    .line 195
    :cond_5
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget-object v1, v1, Lcom/yingyonghui/market/model/j;->m:Ljava/lang/String;

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget v2, v2, Lcom/yingyonghui/market/model/j;->s:I

    iget-object v3, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iget v3, v3, Lcom/yingyonghui/market/model/j;->e:I

    invoke-static {p0, v1, v2, v3}, Lcom/yingyonghui/market/util/t;->a(Landroid/content/Context;Ljava/lang/String;II)I

    move-result v1

    iput v1, v0, Lcom/yingyonghui/market/model/j;->n:I

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->e:Lcom/yingyonghui/market/model/j;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->e()V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->n:Landroid/view/View;

    invoke-virtual {v0, v9}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->o:Landroid/view/View;

    invoke-virtual {v0, v11}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2

    :cond_6
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->a:Lcom/yingyonghui/market/a/d;

    iget v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->f:I

    iget-object v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->i:Ljava/lang/String;

    const/16 v3, 0x64

    iget-object v4, p0, Lcom/yingyonghui/market/ActivityDetailApp;->b:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/yingyonghui/market/a/d;->a(ILjava/lang/String;ILandroid/os/Handler;)V

    goto :goto_2

    :catch_0
    move-exception v2

    goto/16 :goto_1

    :catch_1
    move-exception v4

    goto/16 :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .parameter

    .prologue
    .line 226
    invoke-static {p1}, Lcom/yingyonghui/market/util/o;->a(Landroid/view/Menu;)Z

    .line 227
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 202
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onDestroy()V

    .line 203
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->Y:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 204
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter

    .prologue
    .line 232
    invoke-static {p0, p1}, Lcom/yingyonghui/market/util/o;->a(Landroid/app/Activity;Landroid/view/MenuItem;)Z

    .line 233
    invoke-super {p0, p1}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 220
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onPause()V

    .line 221
    invoke-static {p0}, Lcom/a/a/c;->a(Landroid/content/Context;)V

    .line 222
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 208
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->i:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 209
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->i:Ljava/lang/String;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityDetailApp;->c:Lcom/yingyonghui/market/model/l;

    iget v1, v1, Lcom/yingyonghui/market/model/l;->s:I

    iget v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->f:I

    invoke-static {p0, v0, v1, v2}, Lcom/yingyonghui/market/util/t;->a(Landroid/content/Context;Ljava/lang/String;II)I

    move-result v0

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->h:I

    .line 211
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->d()V

    .line 214
    :cond_0
    invoke-super {p0}, Lcom/yingyonghui/market/HttpServiceSupportForTabActivity;->onResume()V

    .line 215
    invoke-static {p0}, Lcom/a/a/c;->b(Landroid/content/Context;)V

    .line 216
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .prologue
    .line 238
    const/4 v0, 0x0

    return v0
.end method

.method public onTabChanged(Ljava/lang/String;)V
    .locals 3
    .parameter

    .prologue
    .line 621
    const-string v0, "detail"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 622
    const/4 v0, 0x0

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->m:I

    .line 627
    :goto_0
    iget v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->m:I

    invoke-direct {p0, v0}, Lcom/yingyonghui/market/ActivityDetailApp;->b(I)V

    .line 628
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Detail"

    iget v2, p0, Lcom/yingyonghui/market/ActivityDetailApp;->m:I

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Ljava/lang/String;I)V

    .line 630
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityDetailApp;->d()V

    .line 631
    return-void

    .line 624
    :cond_0
    const/4 v0, 0x1

    iput v0, p0, Lcom/yingyonghui/market/ActivityDetailApp;->m:I

    goto :goto_0
.end method
