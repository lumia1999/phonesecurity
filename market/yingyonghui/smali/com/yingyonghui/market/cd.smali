.class final Lcom/yingyonghui/market/cd;
.super Ljava/lang/Object;
.source "AbsActivityAppListManager.java"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field private a:Ljava/text/Collator;

.field private synthetic b:I

.field private synthetic c:Lcom/yingyonghui/market/AbsActivityAppListManager;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/AbsActivityAppListManager;)V
    .locals 1
    .parameter

    .prologue
    .line 328
    iput-object p1, p0, Lcom/yingyonghui/market/cd;->c:Lcom/yingyonghui/market/AbsActivityAppListManager;

    const/4 v0, 0x1

    iput v0, p0, Lcom/yingyonghui/market/cd;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 329
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/cd;->a:Ljava/text/Collator;

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 4
    .parameter
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 332
    .line 334
    instance-of v0, p1, Lcom/yingyonghui/market/model/l;

    if-eqz v0, :cond_2

    .line 335
    check-cast p1, Lcom/yingyonghui/market/model/l;

    .line 336
    check-cast p2, Lcom/yingyonghui/market/model/l;

    .line 337
    iget-object v0, p1, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    .line 338
    :goto_0
    iget-object v1, p2, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    if-nez v1, :cond_1

    iget-object v1, p2, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    :goto_1
    move-object v3, v1

    move-object v1, v0

    move-object v0, v3

    .line 354
    :goto_2
    iget-object v2, p0, Lcom/yingyonghui/market/cd;->a:Ljava/text/Collator;

    invoke-virtual {v2, v1, v0}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iget v1, p0, Lcom/yingyonghui/market/cd;->b:I

    mul-int/2addr v0, v1

    return v0

    .line 337
    :cond_0
    iget-object v0, p1, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    goto :goto_0

    .line 338
    :cond_1
    iget-object v1, p2, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    goto :goto_1

    .line 339
    :cond_2
    instance-of v0, p1, Landroid/content/pm/ApplicationInfo;

    if-eqz v0, :cond_5

    .line 340
    check-cast p1, Landroid/content/pm/ApplicationInfo;

    .line 341
    check-cast p2, Landroid/content/pm/ApplicationInfo;

    .line 342
    iget-object v0, p0, Lcom/yingyonghui/market/cd;->c:Lcom/yingyonghui/market/AbsActivityAppListManager;

    iget-object v0, v0, Lcom/yingyonghui/market/AbsActivityAppListManager;->q:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v1, p1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/l;

    .line 343
    iget-object v1, p0, Lcom/yingyonghui/market/cd;->c:Lcom/yingyonghui/market/AbsActivityAppListManager;

    iget-object v1, v1, Lcom/yingyonghui/market/AbsActivityAppListManager;->q:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v2, p2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yingyonghui/market/model/l;

    .line 344
    if-nez v0, :cond_3

    iget-object v0, p1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 345
    :goto_3
    if-nez v1, :cond_4

    iget-object v1, p2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    :goto_4
    move-object v3, v1

    move-object v1, v0

    move-object v0, v3

    .line 346
    goto :goto_2

    .line 344
    :cond_3
    iget-object v0, v0, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    goto :goto_3

    .line 345
    :cond_4
    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    goto :goto_4

    .line 346
    :cond_5
    instance-of v0, p1, Ljava/io/File;

    if-eqz v0, :cond_8

    .line 347
    check-cast p1, Ljava/io/File;

    .line 348
    check-cast p2, Ljava/io/File;

    .line 349
    iget-object v0, p0, Lcom/yingyonghui/market/cd;->c:Lcom/yingyonghui/market/AbsActivityAppListManager;

    iget-object v0, v0, Lcom/yingyonghui/market/AbsActivityAppListManager;->q:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/l;

    .line 350
    iget-object v1, p0, Lcom/yingyonghui/market/cd;->c:Lcom/yingyonghui/market/AbsActivityAppListManager;

    iget-object v1, v1, Lcom/yingyonghui/market/AbsActivityAppListManager;->q:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yingyonghui/market/model/l;

    .line 351
    if-nez v0, :cond_6

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 352
    :goto_5
    if-nez v1, :cond_7

    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    :goto_6
    move-object v3, v1

    move-object v1, v0

    move-object v0, v3

    goto :goto_2

    .line 351
    :cond_6
    iget-object v0, v0, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    goto :goto_5

    .line 352
    :cond_7
    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    goto :goto_6

    :cond_8
    move-object v0, v1

    goto :goto_2
.end method
