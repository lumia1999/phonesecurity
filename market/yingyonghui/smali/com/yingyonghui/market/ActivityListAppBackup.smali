.class public Lcom/yingyonghui/market/ActivityListAppBackup;
.super Lcom/yingyonghui/market/AbsActivityAppListManager;
.source "ActivityListAppBackup.java"


# static fields
.field private static B:I

.field private static C:I

.field private static final c:Ljava/lang/String;


# instance fields
.field private A:I

.field private D:Landroid/os/Handler;

.field private final E:Landroid/content/BroadcastReceiver;

.field private F:Landroid/widget/AbsListView$OnScrollListener;

.field private d:Landroid/content/pm/PackageManager;

.field private s:Lcom/yingyonghui/market/u;

.field private t:Ljava/util/ArrayList;

.field private u:Ljava/util/ArrayList;

.field private v:Lcom/yingyonghui/market/ch;

.field private w:Lcom/yingyonghui/market/ch;

.field private x:Z

.field private y:Z

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 29
    const-class v0, Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/ActivityListAppBackup;->c:Ljava/lang/String;

    .line 47
    sput v1, Lcom/yingyonghui/market/ActivityListAppBackup;->B:I

    .line 48
    sput v1, Lcom/yingyonghui/market/ActivityListAppBackup;->C:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 28
    invoke-direct {p0}, Lcom/yingyonghui/market/AbsActivityAppListManager;-><init>()V

    .line 43
    iput-boolean v1, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->x:Z

    .line 44
    iput-boolean v1, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->y:Z

    .line 45
    iput v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->z:I

    .line 46
    iput v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->A:I

    .line 50
    new-instance v0, Lcom/yingyonghui/market/dz;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/dz;-><init>(Lcom/yingyonghui/market/ActivityListAppBackup;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->D:Landroid/os/Handler;

    .line 324
    new-instance v0, Lcom/yingyonghui/market/dy;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/dy;-><init>(Lcom/yingyonghui/market/ActivityListAppBackup;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->E:Landroid/content/BroadcastReceiver;

    .line 340
    new-instance v0, Lcom/yingyonghui/market/dx;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/dx;-><init>(Lcom/yingyonghui/market/ActivityListAppBackup;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->F:Landroid/widget/AbsListView$OnScrollListener;

    return-void
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListAppBackup;I)I
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 28
    iput p1, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->z:I

    return p1
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListAppBackup;Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/ch;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 28
    iput-object p1, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->v:Lcom/yingyonghui/market/ch;

    return-object p1
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 28
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->u:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListAppBackup;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 28
    iput-object p1, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->u:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic a(Lcom/yingyonghui/market/ActivityListAppBackup;II)V
    .locals 3
    .parameter
    .parameter
    .parameter

    .prologue
    .line 28
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->f:Landroid/widget/RadioButton;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const v2, 0x7f090124

    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityListAppBackup;->getString(I)Ljava/lang/String;

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

    :cond_0
    :goto_0
    return-void

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->g:Landroid/widget/RadioButton;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const v2, 0x7f090125

    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityListAppBackup;->getString(I)Ljava/lang/String;

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
    .line 28
    sput p0, Lcom/yingyonghui/market/ActivityListAppBackup;->B:I

    return p0
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityListAppBackup;I)I
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 28
    iput p1, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->A:I

    return p1
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityListAppBackup;)Lcom/yingyonghui/market/ch;
    .locals 1
    .parameter

    .prologue
    .line 28
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->v:Lcom/yingyonghui/market/ch;

    return-object v0
.end method

.method static synthetic b(Lcom/yingyonghui/market/ActivityListAppBackup;Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/ch;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 28
    iput-object p1, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->w:Lcom/yingyonghui/market/ch;

    return-object p1
.end method

.method static synthetic c(I)I
    .locals 0
    .parameter

    .prologue
    .line 28
    sput p0, Lcom/yingyonghui/market/ActivityListAppBackup;->C:I

    return p0
.end method

.method static synthetic c(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 28
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->t:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic d(Lcom/yingyonghui/market/ActivityListAppBackup;)Lcom/yingyonghui/market/ch;
    .locals 1
    .parameter

    .prologue
    .line 28
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->w:Lcom/yingyonghui/market/ch;

    return-object v0
.end method

.method static synthetic e()I
    .locals 1

    .prologue
    .line 28
    sget v0, Lcom/yingyonghui/market/ActivityListAppBackup;->B:I

    return v0
.end method

.method static synthetic e(Lcom/yingyonghui/market/ActivityListAppBackup;)I
    .locals 1
    .parameter

    .prologue
    .line 28
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->A:I

    return v0
.end method

.method static synthetic f()I
    .locals 1

    .prologue
    .line 28
    sget v0, Lcom/yingyonghui/market/ActivityListAppBackup;->C:I

    return v0
.end method

.method static synthetic f(Lcom/yingyonghui/market/ActivityListAppBackup;)I
    .locals 2
    .parameter

    .prologue
    .line 28
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->A:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->A:I

    return v0
.end method

.method static synthetic g()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 28
    invoke-static {}, Lcom/yingyonghui/market/ActivityListAppBackup;->k()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method static synthetic g(Lcom/yingyonghui/market/ActivityListAppBackup;)Z
    .locals 1
    .parameter

    .prologue
    .line 28
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->y:Z

    return v0
.end method

.method static synthetic h(Lcom/yingyonghui/market/ActivityListAppBackup;)I
    .locals 1
    .parameter

    .prologue
    .line 28
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->z:I

    return v0
.end method

.method static synthetic i(Lcom/yingyonghui/market/ActivityListAppBackup;)I
    .locals 2
    .parameter

    .prologue
    .line 28
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->z:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->z:I

    return v0
.end method

.method private j()Ljava/util/ArrayList;
    .locals 8

    .prologue
    const/4 v1, 0x0

    .line 257
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppBackup;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 259
    const/4 v1, 0x0

    .line 260
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-object v3, v1

    .line 261
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 262
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ApplicationInfo;

    .line 263
    invoke-static {v1}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/pm/ApplicationInfo;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 264
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 268
    :cond_0
    new-instance v4, Ljava/io/File;

    const-string v5, "/sdcard/Yingyonghui_backup"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".apk"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 269
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 270
    iget-object v5, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->d:Landroid/content/pm/PackageManager;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    const/16 v6, 0x80

    invoke-virtual {v5, v4, v6}, Landroid/content/pm/PackageManager;->getPackageArchiveInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    .line 272
    :try_start_0
    iget-object v5, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->d:Landroid/content/pm/PackageManager;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const/4 v6, 0x0

    invoke-virtual {v5, v1, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 276
    :goto_1
    if-eqz v4, :cond_1

    if-eqz v1, :cond_1

    .line 277
    iget v3, v4, Landroid/content/pm/PackageInfo;->versionCode:I

    iget v4, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    if-lt v3, v4, :cond_4

    .line 278
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    :cond_1
    :goto_2
    move-object v3, v1

    .line 284
    goto :goto_0

    .line 273
    :catch_0
    move-exception v1

    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    move-object v1, v3

    goto :goto_1

    .line 286
    :cond_2
    return-object v0

    :cond_3
    move-object v1, v3

    goto :goto_2

    :cond_4
    move-object v3, v1

    goto :goto_0
.end method

.method static synthetic j(Lcom/yingyonghui/market/ActivityListAppBackup;)Z
    .locals 1
    .parameter

    .prologue
    .line 28
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->x:Z

    return v0
.end method

.method private static k()Ljava/util/ArrayList;
    .locals 3

    .prologue
    .line 290
    new-instance v0, Ljava/io/File;

    const-string v1, "/sdcard/Yingyonghui_backup"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const-string v1, ".apk"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/d;->a(Ljava/io/File;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v0

    .line 292
    return-object v0
.end method

.method static synthetic k(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/yingyonghui/market/ActivityListAppBackup;->j()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method static synthetic l(Lcom/yingyonghui/market/ActivityListAppBackup;)Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 28
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->D:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public final a()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->D:Landroid/os/Handler;

    return-object v0
.end method

.method public final a(I)V
    .locals 3
    .parameter

    .prologue
    const/4 v2, 0x0

    .line 208
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->v:Lcom/yingyonghui/market/ch;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->x:Z

    if-nez v0, :cond_0

    .line 209
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->e:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->v:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 210
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->e:Landroid/widget/ListView;

    sget v1, Lcom/yingyonghui/market/ActivityListAppBackup;->B:I

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 211
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->v:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    .line 212
    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Z)V

    .line 222
    :goto_0
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppBackup;->b()Lcom/yingyonghui/market/log/m;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->r:Lcom/yingyonghui/market/log/m;

    .line 223
    return-void

    .line 213
    :cond_0
    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->w:Lcom/yingyonghui/market/ch;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->y:Z

    if-nez v0, :cond_1

    .line 214
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->e:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->w:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 215
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->e:Landroid/widget/ListView;

    sget v1, Lcom/yingyonghui/market/ActivityListAppBackup;->C:I

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 216
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->w:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    .line 217
    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Z)V

    goto :goto_0

    .line 219
    :cond_1
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppBackup;->d()V

    goto :goto_0
.end method

.method public final a(Landroid/widget/ArrayAdapter;)V
    .locals 1
    .parameter

    .prologue
    .line 297
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Z)V

    .line 298
    invoke-virtual {p0, p1}, Lcom/yingyonghui/market/ActivityListAppBackup;->b(Landroid/widget/ArrayAdapter;)V

    .line 299
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Z)V

    .line 300
    invoke-virtual {p1}, Landroid/widget/ArrayAdapter;->notifyDataSetChanged()V

    .line 301
    return-void
.end method

.method protected final b()Lcom/yingyonghui/market/log/m;
    .locals 2

    .prologue
    .line 158
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->p:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 159
    new-instance v0, Lcom/yingyonghui/market/log/m;

    const-string v1, "Backup"

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    .line 161
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/yingyonghui/market/log/m;

    const-string v1, "Backuped"

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected final c()V
    .locals 3

    .prologue
    const/16 v2, 0x8

    .line 167
    invoke-super {p0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->c()V

    .line 169
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->e:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->F:Landroid/widget/AbsListView$OnScrollListener;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 171
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->f:Landroid/widget/RadioButton;

    const v1, 0x7f090124

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(I)V

    .line 172
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->g:Landroid/widget/RadioButton;

    const v1, 0x7f090125

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(I)V

    .line 173
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->h:Landroid/widget/RadioButton;

    invoke-virtual {v0, v2}, Landroid/widget/RadioButton;->setVisibility(I)V

    .line 175
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->l:Landroid/widget/TextView;

    const v1, 0x7f09011d

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 177
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->m:Landroid/widget/RadioButton;

    const v1, 0x7f09011f

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(I)V

    .line 178
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->n:Landroid/widget/RadioButton;

    const v1, 0x7f090120

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(I)V

    .line 179
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->o:Landroid/widget/RadioButton;

    invoke-virtual {v0, v2}, Landroid/widget/RadioButton;->setVisibility(I)V

    .line 181
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->e(I)V

    .line 182
    return-void
.end method

.method protected final d()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 226
    invoke-virtual {p0, v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Z)V

    .line 227
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->p:I

    if-ne v0, v1, :cond_3

    .line 228
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->s:Lcom/yingyonghui/market/u;

    if-nez v0, :cond_1

    .line 230
    :try_start_0
    new-instance v0, Lcom/yingyonghui/market/u;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/u;-><init>(Lcom/yingyonghui/market/ActivityListAppBackup;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->s:Lcom/yingyonghui/market/u;

    .line 231
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->s:Lcom/yingyonghui/market/u;

    invoke-virtual {v0}, Lcom/yingyonghui/market/u;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 254
    :cond_0
    :goto_0
    return-void

    .line 232
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 235
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->s:Lcom/yingyonghui/market/u;

    invoke-virtual {v0}, Lcom/yingyonghui/market/u;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 236
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->x:Z

    if-eqz v0, :cond_2

    .line 238
    :try_start_1
    new-instance v0, Lcom/yingyonghui/market/u;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/u;-><init>(Lcom/yingyonghui/market/ActivityListAppBackup;)V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->s:Lcom/yingyonghui/market/u;

    .line 239
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->s:Lcom/yingyonghui/market/u;

    invoke-virtual {v0}, Lcom/yingyonghui/market/u;->start()V

    .line 240
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->x:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 241
    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 245
    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->D:Landroid/os/Handler;

    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 248
    :cond_3
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->p:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 249
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->t:Ljava/util/ArrayList;

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->y:Z

    if-eqz v0, :cond_0

    .line 250
    :cond_4
    invoke-static {}, Lcom/yingyonghui/market/ActivityListAppBackup;->k()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->t:Ljava/util/ArrayList;

    .line 251
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->D:Landroid/os/Handler;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter

    .prologue
    .line 141
    invoke-super {p0, p1}, Lcom/yingyonghui/market/AbsActivityAppListManager;->onCreate(Landroid/os/Bundle;)V

    .line 142
    const v0, 0x7f030033

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->setContentView(I)V

    .line 144
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppBackup;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->d:Landroid/content/pm/PackageManager;

    .line 146
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppBackup;->c()V

    .line 147
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

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->E:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 148
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 152
    invoke-super {p0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->onDestroy()V

    .line 153
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->E:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 154
    return-void
.end method

.method protected onResume()V
    .locals 3

    .prologue
    const/4 v2, 0x2

    .line 186
    invoke-super {p0}, Lcom/yingyonghui/market/AbsActivityAppListManager;->onResume()V

    .line 188
    iget-boolean v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->x:Z

    if-eqz v0, :cond_1

    .line 190
    invoke-virtual {p0, v2}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(I)V

    .line 204
    :cond_0
    :goto_0
    return-void

    .line 192
    :cond_1
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->p:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 193
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->v:Lcom/yingyonghui/market/ch;

    if-eqz v0, :cond_0

    .line 194
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->e:Landroid/widget/ListView;

    sget v1, Lcom/yingyonghui/market/ActivityListAppBackup;->B:I

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 195
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->v:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    goto :goto_0

    .line 197
    :cond_2
    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->p:I

    if-ne v0, v2, :cond_0

    .line 198
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->w:Lcom/yingyonghui/market/ch;

    if-eqz v0, :cond_0

    .line 199
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->e:Landroid/widget/ListView;

    sget v1, Lcom/yingyonghui/market/ActivityListAppBackup;->C:I

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 200
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->w:Lcom/yingyonghui/market/ch;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    goto :goto_0
.end method
