.class final Lcom/yingyonghui/market/cb;
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
    .line 383
    iput-object p1, p0, Lcom/yingyonghui/market/cb;->b:Lcom/yingyonghui/market/AbsActivityAppListManager;

    const/4 v0, 0x1

    iput v0, p0, Lcom/yingyonghui/market/cb;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 383
    check-cast p1, Lcom/yingyonghui/market/model/l;

    check-cast p2, Lcom/yingyonghui/market/model/l;

    iget v0, p1, Lcom/yingyonghui/market/model/l;->H:I

    iget v1, p2, Lcom/yingyonghui/market/model/l;->H:I

    sub-int/2addr v0, v1

    if-nez v0, :cond_2

    iget-object v0, p1, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    :goto_0
    iget-object v1, p2, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    if-nez v1, :cond_1

    iget-object v1, p2, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    :goto_1
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iget v1, p0, Lcom/yingyonghui/market/cb;->a:I

    mul-int/2addr v0, v1

    :goto_2
    return v0

    :cond_0
    iget-object v0, p1, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object v1, p2, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_2
    iget v0, p1, Lcom/yingyonghui/market/model/l;->H:I

    iget v1, p2, Lcom/yingyonghui/market/model/l;->H:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/yingyonghui/market/cb;->a:I

    mul-int/2addr v0, v1

    goto :goto_2
.end method
