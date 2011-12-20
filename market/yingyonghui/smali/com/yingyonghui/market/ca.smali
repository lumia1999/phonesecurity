.class final Lcom/yingyonghui/market/ca;
.super Ljava/lang/Object;
.source "AbsActivityAppListManager.java"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field private synthetic a:I

.field private synthetic b:Lcom/yingyonghui/market/AbsActivityAppListManager;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/AbsActivityAppListManager;)V
    .locals 1
    .parameter

    .prologue
    .line 358
    iput-object p1, p0, Lcom/yingyonghui/market/ca;->b:Lcom/yingyonghui/market/AbsActivityAppListManager;

    const/4 v0, 0x1

    iput v0, p0, Lcom/yingyonghui/market/ca;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 5
    .parameter
    .parameter

    .prologue
    const/4 v3, 0x0

    .line 361
    .line 363
    instance-of v0, p1, Lcom/yingyonghui/market/model/l;

    if-eqz v0, :cond_0

    .line 364
    check-cast p1, Lcom/yingyonghui/market/model/l;

    .line 365
    check-cast p2, Lcom/yingyonghui/market/model/l;

    .line 366
    iget v0, p1, Lcom/yingyonghui/market/model/l;->o:I

    .line 367
    iget v1, p2, Lcom/yingyonghui/market/model/l;->o:I

    move v4, v1

    move v1, v0

    move v0, v4

    .line 379
    :goto_0
    if-ne v1, v0, :cond_2

    move v0, v3

    :goto_1
    iget v1, p0, Lcom/yingyonghui/market/ca;->a:I

    mul-int/2addr v0, v1

    return v0

    .line 368
    :cond_0
    instance-of v0, p1, Landroid/content/pm/ApplicationInfo;

    if-eqz v0, :cond_1

    .line 369
    check-cast p1, Landroid/content/pm/ApplicationInfo;

    .line 370
    check-cast p2, Landroid/content/pm/ApplicationInfo;

    .line 371
    new-instance v0, Ljava/io/File;

    iget-object v1, p1, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    long-to-int v0, v0

    .line 372
    new-instance v1, Ljava/io/File;

    iget-object v2, p2, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v1

    long-to-int v1, v1

    move v4, v1

    move v1, v0

    move v0, v4

    .line 373
    goto :goto_0

    :cond_1
    instance-of v0, p1, Ljava/io/File;

    if-eqz v0, :cond_4

    .line 374
    check-cast p1, Ljava/io/File;

    .line 375
    check-cast p2, Ljava/io/File;

    .line 376
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    long-to-int v0, v0

    .line 377
    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v1

    long-to-int v1, v1

    move v4, v1

    move v1, v0

    move v0, v4

    goto :goto_0

    .line 379
    :cond_2
    if-ge v1, v0, :cond_3

    const/4 v0, -0x1

    goto :goto_1

    :cond_3
    const/4 v0, 0x1

    goto :goto_1

    :cond_4
    move v0, v3

    move v1, v3

    goto :goto_0
.end method
