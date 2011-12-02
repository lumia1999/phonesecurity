.class public Lcom/mappn/gfan/common/codec/binary/Base64InputStream;
.super Ljava/io/FilterInputStream;


# instance fields
.field private final base64:Lcom/mappn/gfan/common/codec/binary/Base64;

.field private final doEncode:Z

.field private final singleByte:[B


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;-><init>(Ljava/io/InputStream;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Z)V
    .locals 1

    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->singleByte:[B

    iput-boolean p2, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->doEncode:Z

    new-instance v0, Lcom/mappn/gfan/common/codec/binary/Base64;

    invoke-direct {v0}, Lcom/mappn/gfan/common/codec/binary/Base64;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->base64:Lcom/mappn/gfan/common/codec/binary/Base64;

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;ZI[B)V
    .locals 1

    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->singleByte:[B

    iput-boolean p2, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->doEncode:Z

    new-instance v0, Lcom/mappn/gfan/common/codec/binary/Base64;

    invoke-direct {v0, p3, p4}, Lcom/mappn/gfan/common/codec/binary/Base64;-><init>(I[B)V

    iput-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->base64:Lcom/mappn/gfan/common/codec/binary/Base64;

    return-void
.end method


# virtual methods
.method public markSupported()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v2, 0x1

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->singleByte:[B

    invoke-virtual {p0, v0, v1, v2}, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->read([BII)I

    move-result v0

    :goto_0
    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->singleByte:[B

    invoke-virtual {p0, v0, v1, v2}, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->read([BII)I

    move-result v0

    goto :goto_0

    :cond_0
    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->singleByte:[B

    aget-byte v0, v0, v1

    if-gez v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->singleByte:[B

    aget-byte v0, v0, v1

    add-int/lit16 v0, v0, 0x100

    :goto_1
    return v0

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->singleByte:[B

    aget-byte v0, v0, v1

    goto :goto_1

    :cond_2
    const/4 v0, -0x1

    goto :goto_1
.end method

.method public read([BII)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v3, 0x0

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    if-ltz p2, :cond_1

    if-gez p3, :cond_2

    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    :cond_2
    array-length v0, p1

    if-gt p2, v0, :cond_3

    add-int v0, p2, p3

    array-length v1, p1

    if-le v0, v1, :cond_4

    :cond_3
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    :cond_4
    if-nez p3, :cond_5

    move v0, v3

    :goto_0
    return v0

    :cond_5
    iget-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->base64:Lcom/mappn/gfan/common/codec/binary/Base64;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/codec/binary/Base64;->hasData()Z

    move-result v0

    if-nez v0, :cond_7

    iget-boolean v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->doEncode:Z

    if-eqz v0, :cond_8

    const/16 v0, 0x1000

    :goto_1
    new-array v0, v0, [B

    iget-object v1, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    if-lez v1, :cond_6

    array-length v2, p1

    if-ne v2, p3, :cond_6

    iget-object v2, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->base64:Lcom/mappn/gfan/common/codec/binary/Base64;

    invoke-virtual {v2, p1, p2, p3}, Lcom/mappn/gfan/common/codec/binary/Base64;->setInitialBuffer([BII)V

    :cond_6
    iget-boolean v2, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->doEncode:Z

    if-eqz v2, :cond_9

    iget-object v2, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->base64:Lcom/mappn/gfan/common/codec/binary/Base64;

    invoke-virtual {v2, v0, v3, v1}, Lcom/mappn/gfan/common/codec/binary/Base64;->encode([BII)V

    :cond_7
    :goto_2
    iget-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->base64:Lcom/mappn/gfan/common/codec/binary/Base64;

    invoke-virtual {v0, p1, p2, p3}, Lcom/mappn/gfan/common/codec/binary/Base64;->readResults([BII)I

    move-result v0

    goto :goto_0

    :cond_8
    const/16 v0, 0x2000

    goto :goto_1

    :cond_9
    iget-object v2, p0, Lcom/mappn/gfan/common/codec/binary/Base64InputStream;->base64:Lcom/mappn/gfan/common/codec/binary/Base64;

    invoke-virtual {v2, v0, v3, v1}, Lcom/mappn/gfan/common/codec/binary/Base64;->decode([BII)V

    goto :goto_2
.end method
