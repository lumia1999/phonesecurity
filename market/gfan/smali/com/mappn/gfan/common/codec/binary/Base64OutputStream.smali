.class public Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;
.super Ljava/io/FilterOutputStream;


# instance fields
.field private final base64:Lcom/mappn/gfan/common/codec/binary/Base64;

.field private final doEncode:Z

.field private final singleByte:[B


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;-><init>(Ljava/io/OutputStream;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Z)V
    .locals 1

    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->singleByte:[B

    iput-boolean p2, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->doEncode:Z

    new-instance v0, Lcom/mappn/gfan/common/codec/binary/Base64;

    invoke-direct {v0}, Lcom/mappn/gfan/common/codec/binary/Base64;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->base64:Lcom/mappn/gfan/common/codec/binary/Base64;

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;ZI[B)V
    .locals 1

    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->singleByte:[B

    iput-boolean p2, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->doEncode:Z

    new-instance v0, Lcom/mappn/gfan/common/codec/binary/Base64;

    invoke-direct {v0, p3, p4}, Lcom/mappn/gfan/common/codec/binary/Base64;-><init>(I[B)V

    iput-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->base64:Lcom/mappn/gfan/common/codec/binary/Base64;

    return-void
.end method

.method private flush(Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->base64:Lcom/mappn/gfan/common/codec/binary/Base64;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/codec/binary/Base64;->avail()I

    move-result v0

    if-lez v0, :cond_0

    new-array v1, v0, [B

    iget-object v2, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->base64:Lcom/mappn/gfan/common/codec/binary/Base64;

    invoke-virtual {v2, v1, v3, v0}, Lcom/mappn/gfan/common/codec/binary/Base64;->readResults([BII)I

    move-result v0

    if-lez v0, :cond_0

    iget-object v2, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v2, v1, v3, v0}, Ljava/io/OutputStream;->write([BII)V

    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    :cond_1
    return-void
.end method


# virtual methods
.method public close()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v3, 0x0

    const/4 v2, -0x1

    iget-boolean v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->doEncode:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->base64:Lcom/mappn/gfan/common/codec/binary/Base64;

    iget-object v1, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->singleByte:[B

    invoke-virtual {v0, v1, v3, v2}, Lcom/mappn/gfan/common/codec/binary/Base64;->encode([BII)V

    :goto_0
    invoke-virtual {p0}, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->flush()V

    iget-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->base64:Lcom/mappn/gfan/common/codec/binary/Base64;

    iget-object v1, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->singleByte:[B

    invoke-virtual {v0, v1, v3, v2}, Lcom/mappn/gfan/common/codec/binary/Base64;->decode([BII)V

    goto :goto_0
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->flush(Z)V

    return-void
.end method

.method public write(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->singleByte:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->singleByte:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

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
    if-lez p3, :cond_5

    iget-boolean v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->doEncode:Z

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->base64:Lcom/mappn/gfan/common/codec/binary/Base64;

    invoke-virtual {v0, p1, p2, p3}, Lcom/mappn/gfan/common/codec/binary/Base64;->encode([BII)V

    :goto_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->flush(Z)V

    :cond_5
    return-void

    :cond_6
    iget-object v0, p0, Lcom/mappn/gfan/common/codec/binary/Base64OutputStream;->base64:Lcom/mappn/gfan/common/codec/binary/Base64;

    invoke-virtual {v0, p1, p2, p3}, Lcom/mappn/gfan/common/codec/binary/Base64;->decode([BII)V

    goto :goto_0
.end method
