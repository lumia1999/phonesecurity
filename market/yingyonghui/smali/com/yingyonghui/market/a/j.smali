.class final Lcom/yingyonghui/market/a/j;
.super Ljava/lang/Object;
.source "HttpCache.java"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/a/c;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/a/c;)V
    .locals 0
    .parameter

    .prologue
    .line 100
    iput-object p1, p0, Lcom/yingyonghui/market/a/j;->a:Lcom/yingyonghui/market/a/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 6
    .parameter
    .parameter

    .prologue
    const-wide/16 v4, 0x0

    .line 100
    check-cast p1, Lcom/yingyonghui/market/util/n;

    check-cast p2, Lcom/yingyonghui/market/util/n;

    iget-object v0, p1, Lcom/yingyonghui/market/util/n;->b:Ljava/lang/Object;

    if-nez v0, :cond_0

    move-wide v0, v4

    :goto_0
    iget-object v2, p2, Lcom/yingyonghui/market/util/n;->b:Ljava/lang/Object;

    if-nez v2, :cond_1

    move-wide v2, v4

    :goto_1
    sub-long/2addr v0, v2

    cmp-long v2, v0, v4

    if-lez v2, :cond_2

    const/4 v0, 0x1

    :goto_2
    return v0

    :cond_0
    iget-object p0, p1, Lcom/yingyonghui/market/util/n;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    goto :goto_0

    :cond_1
    iget-object p0, p2, Lcom/yingyonghui/market/util/n;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    goto :goto_1

    :cond_2
    cmp-long v0, v0, v4

    if-gez v0, :cond_3

    const/4 v0, -0x1

    goto :goto_2

    :cond_3
    const/4 v0, 0x0

    goto :goto_2
.end method
