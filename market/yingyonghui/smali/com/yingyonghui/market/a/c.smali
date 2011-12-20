.class final Lcom/yingyonghui/market/a/c;
.super Ljava/lang/Thread;
.source "HttpCache.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/a/m;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/a/m;)V
    .locals 0
    .parameter

    .prologue
    .line 54
    iput-object p1, p0, Lcom/yingyonghui/market/a/c;->a:Lcom/yingyonghui/market/a/m;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 57
    new-instance v0, Ljava/io/File;

    invoke-static {}, Lcom/yingyonghui/market/a/m;->a()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 60
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 61
    const-string v2, ".meta"

    invoke-static {v2}, Lcom/yingyonghui/market/a/m;->a(Ljava/lang/String;)Ljava/io/FilenameFilter;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    .line 63
    if-nez v0, :cond_0

    .line 132
    :goto_0
    return-void

    :cond_0
    move v2, v7

    .line 67
    :goto_1
    array-length v3, v0

    if-ge v2, v3, :cond_2

    .line 69
    aget-object v3, v0, v2

    .line 70
    new-instance v4, Lcom/yingyonghui/market/util/n;

    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-direct {v4, v3, v5}, Lcom/yingyonghui/market/util/n;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 71
    invoke-virtual {v1, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 72
    rem-int/lit8 v3, v2, 0x64

    if-nez v3, :cond_1

    .line 74
    const-wide/16 v3, 0xfa

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    :cond_1
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 75
    :catch_0
    move-exception v3

    invoke-virtual {v3}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_2

    .line 115
    :cond_2
    new-instance v0, Lcom/yingyonghui/market/a/j;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/a/j;-><init>(Lcom/yingyonghui/market/a/c;)V

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 124
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 125
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v3

    move v4, v7

    :goto_3
    if-ge v4, v3, :cond_4

    .line 126
    invoke-virtual {v1, v4}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/util/n;

    .line 127
    if-eqz v0, :cond_3

    iget-object v5, v0, Lcom/yingyonghui/market/util/n;->a:Ljava/lang/Object;

    if-eqz v5, :cond_3

    .line 128
    iget-object v0, v0, Lcom/yingyonghui/market/util/n;->a:Ljava/lang/Object;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 125
    :cond_3
    add-int/lit8 v0, v4, 0x1

    move v4, v0

    goto :goto_3

    .line 131
    :cond_4
    iget-object v0, p0, Lcom/yingyonghui/market/a/c;->a:Lcom/yingyonghui/market/a/m;

    invoke-static {v0, v2}, Lcom/yingyonghui/market/a/m;->a(Lcom/yingyonghui/market/a/m;Ljava/util/LinkedList;)Ljava/util/LinkedList;

    goto :goto_0
.end method
