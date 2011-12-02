.class public Lcom/mappn/gfan/common/vo/CardsVerifications;
.super Ljava/lang/Object;


# instance fields
.field public cards:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mappn/gfan/common/vo/CardsVerification;",
            ">;"
        }
    .end annotation
.end field

.field public version:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/vo/CardsVerifications;->cards:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getCardNames()[Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/mappn/gfan/common/vo/CardsVerifications;->cards:Ljava/util/List;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mappn/gfan/common/vo/CardsVerifications;->cards:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/CardsVerifications;->cards:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v0, 0x0

    move v3, v0

    :goto_0
    if-ge v3, v1, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/CardsVerifications;->cards:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/CardsVerification;

    iget-object v0, v0, Lcom/mappn/gfan/common/vo/CardsVerification;->name:Ljava/lang/String;

    aput-object v0, v2, v3

    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_0

    :cond_0
    move-object v0, v2

    :cond_1
    return-object v0
.end method
