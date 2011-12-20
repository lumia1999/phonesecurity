.class public final Lcom/yingyonghui/market/util/n;
.super Ljava/lang/Object;
.source "Pair.java"


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/yingyonghui/market/util/n;->a:Ljava/lang/Object;

    .line 36
    iput-object p2, p0, Lcom/yingyonghui/market/util/n;->b:Ljava/lang/Object;

    .line 37
    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 45
    if-ne p1, p0, :cond_0

    move v0, v3

    .line 53
    :goto_0
    return v0

    .line 46
    :cond_0
    instance-of v0, p1, Lcom/yingyonghui/market/util/n;

    if-nez v0, :cond_1

    move v0, v2

    goto :goto_0

    .line 49
    :cond_1
    :try_start_0
    check-cast p1, Lcom/yingyonghui/market/util/n;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    iget-object v0, p0, Lcom/yingyonghui/market/util/n;->a:Ljava/lang/Object;

    iget-object v1, p1, Lcom/yingyonghui/market/util/n;->a:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/yingyonghui/market/util/n;->b:Ljava/lang/Object;

    iget-object v1, p1, Lcom/yingyonghui/market/util/n;->b:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    move v0, v3

    goto :goto_0

    .line 51
    :catch_0
    move-exception v0

    move v0, v2

    goto :goto_0

    :cond_2
    move v0, v2

    .line 53
    goto :goto_0
.end method

.method public final hashCode()I
    .locals 2

    .prologue
    .line 61
    iget-object v0, p0, Lcom/yingyonghui/market/util/n;->a:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/lit16 v0, v0, 0x20f

    .line 63
    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/yingyonghui/market/util/n;->b:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 64
    return v0
.end method
