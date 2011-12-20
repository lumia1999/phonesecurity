.class public Lcom/yingyonghui/market/ch;
.super Landroid/widget/ArrayAdapter;
.source "AdapterListApp2.java"


# static fields
.field private static final a:Ljava/lang/String;


# instance fields
.field private b:Landroid/view/LayoutInflater;

.field private c:Landroid/content/Context;

.field private d:Landroid/content/pm/PackageManager;

.field private e:Landroid/os/Handler;

.field private f:Lcom/yingyonghui/market/model/l;

.field private g:Ljava/util/concurrent/ConcurrentHashMap;

.field private h:Z

.field private i:Landroid/view/View$OnClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lcom/yingyonghui/market/ch;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/ch;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 3
    .parameter
    .parameter

    .prologue
    const/4 v2, 0x0

    .line 45
    invoke-direct {p0, p1, v2, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 41
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/yingyonghui/market/ch;->g:Ljava/util/concurrent/ConcurrentHashMap;

    .line 42
    iput-boolean v2, p0, Lcom/yingyonghui/market/ch;->h:Z

    .line 239
    new-instance v1, Lcom/yingyonghui/market/bk;

    invoke-direct {v1, p0}, Lcom/yingyonghui/market/bk;-><init>(Lcom/yingyonghui/market/ch;)V

    iput-object v1, p0, Lcom/yingyonghui/market/ch;->i:Landroid/view/View$OnClickListener;

    .line 47
    const-string v1, "layout_inflater"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    iput-object v1, p0, Lcom/yingyonghui/market/ch;->b:Landroid/view/LayoutInflater;

    .line 48
    iput-object p1, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    .line 49
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iput-object v1, p0, Lcom/yingyonghui/market/ch;->d:Landroid/content/pm/PackageManager;

    .line 50
    move-object v0, p1

    check-cast v0, Lcom/yingyonghui/market/AbsActivityAppListManager;

    move-object v1, v0

    invoke-virtual {v1}, Lcom/yingyonghui/market/AbsActivityAppListManager;->h()Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v1

    iput-object v1, p0, Lcom/yingyonghui/market/ch;->g:Ljava/util/concurrent/ConcurrentHashMap;

    .line 52
    iget-object v1, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    instance-of v1, v1, Lcom/yingyonghui/market/ActivityListAppDownload;

    if-eqz v1, :cond_1

    .line 53
    check-cast p1, Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-virtual {p1}, Lcom/yingyonghui/market/ActivityListAppDownload;->a()Landroid/os/Handler;

    move-result-object v1

    iput-object v1, p0, Lcom/yingyonghui/market/ch;->e:Landroid/os/Handler;

    .line 57
    :cond_0
    :goto_0
    return-void

    .line 54
    :cond_1
    iget-object v1, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    instance-of v1, v1, Lcom/yingyonghui/market/ActivityListAppBackup;

    if-eqz v1, :cond_0

    .line 55
    check-cast p1, Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-virtual {p1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a()Landroid/os/Handler;

    move-result-object v1

    iput-object v1, p0, Lcom/yingyonghui/market/ch;->e:Landroid/os/Handler;

    goto :goto_0
.end method

.method static synthetic a(Lcom/yingyonghui/market/ch;Lcom/yingyonghui/market/model/l;)Lcom/yingyonghui/market/model/l;
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 34
    iput-object p1, p0, Lcom/yingyonghui/market/ch;->f:Lcom/yingyonghui/market/model/l;

    return-object p1
.end method

.method static synthetic a(Lcom/yingyonghui/market/ch;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1
    .parameter

    .prologue
    .line 34
    iget-object v0, p0, Lcom/yingyonghui/market/ch;->g:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method

.method static synthetic b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;
    .locals 1
    .parameter

    .prologue
    .line 34
    iget-object v0, p0, Lcom/yingyonghui/market/ch;->f:Lcom/yingyonghui/market/model/l;

    return-object v0
.end method

.method static synthetic c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;
    .locals 1
    .parameter

    .prologue
    .line 34
    iget-object v0, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic d(Lcom/yingyonghui/market/ch;)Z
    .locals 1
    .parameter

    .prologue
    .line 34
    iget-boolean v0, p0, Lcom/yingyonghui/market/ch;->h:Z

    return v0
.end method

.method static synthetic e(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/log/m;
    .locals 2
    .parameter

    .prologue
    .line 34
    new-instance v0, Lcom/yingyonghui/market/log/m;

    invoke-direct {v0}, Lcom/yingyonghui/market/log/m;-><init>()V

    iget-object v1, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    instance-of v1, v1, Lcom/yingyonghui/market/ActivityListAppManage;

    if-eqz v1, :cond_1

    iget-object p0, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    check-cast p0, Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppManage;->i()Lcom/yingyonghui/market/log/m;

    move-result-object v0

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    iget-object v1, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    instance-of v1, v1, Lcom/yingyonghui/market/ActivityListAppDownload;

    if-eqz v1, :cond_2

    iget-object p0, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    check-cast p0, Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppDownload;->i()Lcom/yingyonghui/market/log/m;

    move-result-object v0

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    instance-of v1, v1, Lcom/yingyonghui/market/ActivityListAppBackup;

    if-eqz v1, :cond_0

    iget-object p0, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    check-cast p0, Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityListAppBackup;->i()Lcom/yingyonghui/market/log/m;

    move-result-object v0

    goto :goto_0
.end method

.method static synthetic f(Lcom/yingyonghui/market/ch;)Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 34
    iget-object v0, p0, Lcom/yingyonghui/market/ch;->e:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public final a()V
    .locals 1

    .prologue
    .line 60
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/yingyonghui/market/ch;->h:Z

    .line 61
    return-void
.end method

.method public final b()Z
    .locals 1

    .prologue
    .line 64
    iget-boolean v0, p0, Lcom/yingyonghui/market/ch;->h:Z

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 12
    .parameter
    .parameter
    .parameter

    .prologue
    const v11, 0x7f090127

    const v10, 0x7f090132

    const v9, 0x7f02004b

    const/16 v8, 0x8

    const/4 v7, 0x0

    .line 97
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/yingyonghui/market/i;

    if-nez v0, :cond_2

    .line 98
    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/ch;->b:Landroid/view/LayoutInflater;

    const v1, 0x7f030014

    invoke-virtual {v0, v1, p3, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 99
    new-instance v2, Lcom/yingyonghui/market/i;

    invoke-direct {v2}, Lcom/yingyonghui/market/i;-><init>()V

    .line 101
    const v0, 0x7f0b006c

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, v2, Lcom/yingyonghui/market/i;->a:Landroid/widget/LinearLayout;

    .line 102
    const v0, 0x7f0b003f

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, v2, Lcom/yingyonghui/market/i;->b:Landroid/widget/ImageView;

    .line 103
    const v0, 0x7f0b006e

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, v2, Lcom/yingyonghui/market/i;->c:Landroid/widget/TextView;

    .line 104
    const v0, 0x7f0b0041

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, v2, Lcom/yingyonghui/market/i;->d:Landroid/widget/TextView;

    .line 105
    const v0, 0x7f0b0072

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, v2, Lcom/yingyonghui/market/i;->e:Landroid/widget/TextView;

    .line 106
    const v0, 0x7f0b0043

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RatingBar;

    iput-object v0, v2, Lcom/yingyonghui/market/i;->f:Landroid/widget/RatingBar;

    .line 107
    const v0, 0x7f0b0042

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, v2, Lcom/yingyonghui/market/i;->g:Landroid/widget/TextView;

    .line 108
    const v0, 0x7f0b0070

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, v2, Lcom/yingyonghui/market/i;->h:Landroid/widget/TextView;

    .line 109
    const v0, 0x7f0b0071

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    .line 111
    iget-object v0, v2, Lcom/yingyonghui/market/i;->e:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/yingyonghui/market/ch;->i:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    iget-object v0, v2, Lcom/yingyonghui/market/i;->h:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/yingyonghui/market/ch;->i:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 113
    iget-object v0, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/yingyonghui/market/ch;->i:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    move-object v3, v1

    .line 119
    :goto_0
    rem-int/lit8 v0, p1, 0x2

    if-eqz v0, :cond_3

    .line 120
    iget-object v0, v2, Lcom/yingyonghui/market/i;->a:Landroid/widget/LinearLayout;

    const v1, 0x7f020055

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 125
    :goto_1
    iget-object v0, v2, Lcom/yingyonghui/market/i;->f:Landroid/widget/RatingBar;

    invoke-virtual {v0, v8}, Landroid/widget/RatingBar;->setVisibility(I)V

    .line 126
    iget-object v0, v2, Lcom/yingyonghui/market/i;->g:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 128
    iget-object v0, v2, Lcom/yingyonghui/market/i;->e:Landroid/widget/TextView;

    const-string v1, "empty"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 129
    iget-object v0, v2, Lcom/yingyonghui/market/i;->e:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 130
    iget-object v0, v2, Lcom/yingyonghui/market/i;->h:Landroid/widget/TextView;

    const-string v1, "empty"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 131
    iget-object v0, v2, Lcom/yingyonghui/market/i;->h:Landroid/widget/TextView;

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 132
    iget-object v0, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    const-string v1, "empty"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 133
    iget-object v0, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 135
    invoke-virtual {p0, p1}, Lcom/yingyonghui/market/ch;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    .line 136
    instance-of v1, v0, Landroid/content/pm/ApplicationInfo;

    if-eqz v1, :cond_8

    .line 137
    check-cast v0, Landroid/content/pm/ApplicationInfo;

    .line 139
    iget-object v1, p0, Lcom/yingyonghui/market/ch;->g:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v4, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yingyonghui/market/model/l;

    .line 140
    if-nez v1, :cond_5

    .line 141
    iget-object v4, v2, Lcom/yingyonghui/market/i;->b:Landroid/widget/ImageView;

    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    iget-object v5, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    invoke-static {v5}, Lcom/yingyonghui/market/util/y;->a(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 142
    iget-object v4, v2, Lcom/yingyonghui/market/i;->c:Landroid/widget/TextView;

    iget-object v5, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 143
    new-instance v4, Ljava/io/File;

    iget-object v5, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 144
    iget-object v6, v2, Lcom/yingyonghui/market/i;->d:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    invoke-static {v7, v4, v5}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    const/4 v4, 0x0

    .line 148
    :try_start_0
    iget-object v5, p0, Lcom/yingyonghui/market/ch;->d:Landroid/content/pm/PackageManager;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const/4 v6, 0x0

    invoke-virtual {v5, v0, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 152
    :goto_2
    if-eqz v0, :cond_4

    .line 153
    iget-object v4, v2, Lcom/yingyonghui/market/i;->g:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    invoke-virtual {v6, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    :goto_3
    iget-object v0, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    instance-of v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;

    if-eqz v0, :cond_6

    .line 165
    iget-object p0, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    check-cast p0, Lcom/yingyonghui/market/ActivityListAppManage;

    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    .line 166
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 167
    iget-object v0, v2, Lcom/yingyonghui/market/i;->e:Landroid/widget/TextView;

    const v1, 0x7f09006b

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 168
    iget-object v0, v2, Lcom/yingyonghui/market/i;->e:Landroid/widget/TextView;

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 169
    iget-object v0, v2, Lcom/yingyonghui/market/i;->e:Landroid/widget/TextView;

    const-string v1, "uninstall"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 233
    :cond_1
    :goto_4
    iget-object v0, v2, Lcom/yingyonghui/market/i;->e:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "-"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, v2, Lcom/yingyonghui/market/i;->e:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 234
    iget-object v0, v2, Lcom/yingyonghui/market/i;->h:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "-"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, v2, Lcom/yingyonghui/market/i;->h:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 235
    iget-object v0, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "-"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 236
    return-object v3

    .line 116
    :cond_2
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/i;

    move-object v2, v0

    move-object v3, p2

    goto/16 :goto_0

    .line 122
    :cond_3
    iget-object v0, v2, Lcom/yingyonghui/market/i;->a:Landroid/widget/LinearLayout;

    const v1, 0x7f020056

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    goto/16 :goto_1

    .line 149
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    move-object v0, v4

    goto/16 :goto_2

    .line 155
    :cond_4
    iget-object v0, v2, Lcom/yingyonghui/market/i;->g:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    invoke-virtual {v5, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "unknow"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3

    .line 158
    :cond_5
    iget-object v0, v2, Lcom/yingyonghui/market/i;->b:Landroid/widget/ImageView;

    iget-object v4, v1, Lcom/yingyonghui/market/model/l;->h:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 159
    iget-object v0, v2, Lcom/yingyonghui/market/i;->c:Landroid/widget/TextView;

    iget-object v4, v1, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    iget-object v0, v2, Lcom/yingyonghui/market/i;->d:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    iget v5, v1, Lcom/yingyonghui/market/model/l;->o:I

    int-to-long v5, v5

    invoke-static {v4, v5, v6}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 161
    iget-object v0, v2, Lcom/yingyonghui/market/i;->g:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    invoke-virtual {v5, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Lcom/yingyonghui/market/model/l;->q:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3

    .line 171
    :cond_6
    iget-object v0, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    instance-of v0, v0, Lcom/yingyonghui/market/ActivityListAppBackup;

    if-eqz v0, :cond_1

    .line 172
    iget-object p0, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    check-cast p0, Lcom/yingyonghui/market/ActivityListAppBackup;

    iget v0, p0, Lcom/yingyonghui/market/ActivityListAppBackup;->p:I

    const/4 v4, 0x1

    if-ne v0, v4, :cond_1

    .line 173
    if-eqz v1, :cond_7

    iget-boolean v0, v1, Lcom/yingyonghui/market/model/l;->M:Z

    if-eqz v0, :cond_7

    .line 174
    iget-object v0, v2, Lcom/yingyonghui/market/i;->e:Landroid/widget/TextView;

    const v1, 0x7f090135

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 175
    iget-object v0, v2, Lcom/yingyonghui/market/i;->e:Landroid/widget/TextView;

    const v1, 0x7f02004f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    goto/16 :goto_4

    .line 177
    :cond_7
    iget-object v0, v2, Lcom/yingyonghui/market/i;->e:Landroid/widget/TextView;

    const v1, 0x7f090126

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 178
    iget-object v0, v2, Lcom/yingyonghui/market/i;->e:Landroid/widget/TextView;

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 179
    iget-object v0, v2, Lcom/yingyonghui/market/i;->e:Landroid/widget/TextView;

    const-string v1, "backup"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_4

    .line 183
    :cond_8
    instance-of v1, v0, Ljava/io/File;

    if-eqz v1, :cond_1

    .line 184
    check-cast v0, Ljava/io/File;

    .line 186
    iget-object v1, p0, Lcom/yingyonghui/market/ch;->g:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yingyonghui/market/model/l;

    .line 187
    if-nez v1, :cond_9

    .line 188
    iget-object v4, v2, Lcom/yingyonghui/market/i;->b:Landroid/widget/ImageView;

    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    iget-object v5, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    invoke-static {v5}, Lcom/yingyonghui/market/util/y;->a(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 189
    iget-object v4, v2, Lcom/yingyonghui/market/i;->c:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 190
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 191
    iget-object v0, v2, Lcom/yingyonghui/market/i;->d:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    invoke-static {v6, v4, v5}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 192
    iget-object v0, v2, Lcom/yingyonghui/market/i;->g:Landroid/widget/TextView;

    const-string v4, ""

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 194
    iget-object v0, v2, Lcom/yingyonghui/market/i;->e:Landroid/widget/TextView;

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 195
    iget-object v0, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 196
    iget-object v0, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    invoke-virtual {v0, v11}, Landroid/widget/TextView;->setText(I)V

    .line 197
    iget-object v0, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 198
    iget-object v0, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    const-string v4, "downloaded_delete"

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 206
    :goto_5
    iget-object v0, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    instance-of v0, v0, Lcom/yingyonghui/market/ActivityListAppDownload;

    if-eqz v0, :cond_a

    .line 207
    if-eqz v1, :cond_1

    .line 208
    iget-object v0, v2, Lcom/yingyonghui/market/i;->e:Landroid/widget/TextView;

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 209
    iget-object v0, v2, Lcom/yingyonghui/market/i;->h:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 210
    iget-object v0, v2, Lcom/yingyonghui/market/i;->h:Landroid/widget/TextView;

    const v1, 0x7f09006d

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 211
    iget-object v0, v2, Lcom/yingyonghui/market/i;->h:Landroid/widget/TextView;

    const v1, 0x7f020057

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 212
    iget-object v0, v2, Lcom/yingyonghui/market/i;->h:Landroid/widget/TextView;

    const-string v1, "downloaded_install"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 214
    iget-object v0, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 215
    iget-object v0, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    invoke-virtual {v0, v11}, Landroid/widget/TextView;->setText(I)V

    .line 216
    iget-object v0, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 217
    iget-object v0, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    const-string v1, "downloaded_delete"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_4

    .line 200
    :cond_9
    iget-object v0, v2, Lcom/yingyonghui/market/i;->b:Landroid/widget/ImageView;

    iget-object v4, v1, Lcom/yingyonghui/market/model/l;->h:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 201
    iget-object v0, v2, Lcom/yingyonghui/market/i;->c:Landroid/widget/TextView;

    iget-object v4, v1, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 202
    iget-object v0, v2, Lcom/yingyonghui/market/i;->d:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    iget v5, v1, Lcom/yingyonghui/market/model/l;->o:I

    int-to-long v5, v5

    invoke-static {v4, v5, v6}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 203
    iget-object v0, v2, Lcom/yingyonghui/market/i;->g:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    invoke-virtual {v5, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Lcom/yingyonghui/market/model/l;->q:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 219
    :cond_a
    iget-object v0, p0, Lcom/yingyonghui/market/ch;->c:Landroid/content/Context;

    instance-of v0, v0, Lcom/yingyonghui/market/ActivityListAppBackup;

    if-eqz v0, :cond_1

    .line 220
    iget-object v0, v2, Lcom/yingyonghui/market/i;->e:Landroid/widget/TextView;

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 221
    iget-object v0, v2, Lcom/yingyonghui/market/i;->h:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 222
    iget-object v0, v2, Lcom/yingyonghui/market/i;->h:Landroid/widget/TextView;

    const v1, 0x7f09006d

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 223
    iget-object v0, v2, Lcom/yingyonghui/market/i;->h:Landroid/widget/TextView;

    const v1, 0x7f020057

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 224
    iget-object v0, v2, Lcom/yingyonghui/market/i;->h:Landroid/widget/TextView;

    const-string v1, "backuped_install"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 226
    iget-object v0, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 227
    iget-object v0, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    invoke-virtual {v0, v11}, Landroid/widget/TextView;->setText(I)V

    .line 228
    iget-object v0, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 229
    iget-object v0, v2, Lcom/yingyonghui/market/i;->i:Landroid/widget/TextView;

    const-string v1, "backuped_delete"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_4
.end method
