.class public Lcom/mappn/gfan/common/codec/StringEncoderComparator;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field private final stringEncoder:Lcom/mappn/gfan/common/codec/StringEncoder;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mappn/gfan/common/codec/StringEncoderComparator;->stringEncoder:Lcom/mappn/gfan/common/codec/StringEncoder;

    return-void
.end method

.method public constructor <init>(Lcom/mappn/gfan/common/codec/StringEncoder;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/mappn/gfan/common/codec/StringEncoderComparator;->stringEncoder:Lcom/mappn/gfan/common/codec/StringEncoder;

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/mappn/gfan/common/codec/StringEncoderComparator;->stringEncoder:Lcom/mappn/gfan/common/codec/StringEncoder;

    invoke-interface {v0, p1}, Lcom/mappn/gfan/common/codec/StringEncoder;->encode(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Comparable;

    iget-object v1, p0, Lcom/mappn/gfan/common/codec/StringEncoderComparator;->stringEncoder:Lcom/mappn/gfan/common/codec/StringEncoder;

    invoke-interface {v1, p2}, Lcom/mappn/gfan/common/codec/StringEncoder;->encode(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Comparable;

    invoke-interface {v0, p0}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I
    :try_end_0
    .catch Lcom/mappn/gfan/common/codec/EncoderException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method
