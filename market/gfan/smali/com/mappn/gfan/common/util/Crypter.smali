.class public Lcom/mappn/gfan/common/util/Crypter;
.super Ljava/lang/Object;


# static fields
.field private static random:Ljava/util/Random;


# instance fields
.field private baos:Ljava/io/ByteArrayOutputStream;

.field private contextStart:I

.field private crypt:I

.field private header:Z

.field private key:[B

.field private out:[B

.field private padding:I

.field private plain:[B

.field private pos:I

.field private preCrypt:I

.field private prePlain:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lcom/mappn/gfan/common/util/Crypter;->random:Ljava/util/Random;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mappn/gfan/common/util/Crypter;->header:Z

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->baos:Ljava/io/ByteArrayOutputStream;

    return-void
.end method

.method private decipher([B)[B
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mappn/gfan/common/util/Crypter;->decipher([BI)[B

    move-result-object v0

    return-object v0
.end method

.method private decipher([BI)[B
    .locals 29

    const/16 v3, 0x10

    const/4 v4, 0x4

    move-object/from16 v0, p1

    move/from16 v1, p2

    move v2, v4

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Crypter;->getUnsignedInt([BII)J

    move-result-wide v4

    add-int/lit8 v6, p2, 0x4

    const/4 v7, 0x4

    move-object/from16 v0, p1

    move v1, v6

    move v2, v7

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Crypter;->getUnsignedInt([BII)J

    move-result-wide v6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/util/Crypter;->key:[B

    move-object v8, v0

    const/4 v9, 0x0

    const/4 v10, 0x4

    invoke-static {v8, v9, v10}, Lcom/mappn/gfan/common/util/Crypter;->getUnsignedInt([BII)J

    move-result-wide v8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/util/Crypter;->key:[B

    move-object v10, v0

    const/4 v11, 0x4

    const/4 v12, 0x4

    invoke-static {v10, v11, v12}, Lcom/mappn/gfan/common/util/Crypter;->getUnsignedInt([BII)J

    move-result-wide v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/util/Crypter;->key:[B

    move-object v12, v0

    const/16 v13, 0x8

    const/4 v14, 0x4

    invoke-static {v12, v13, v14}, Lcom/mappn/gfan/common/util/Crypter;->getUnsignedInt([BII)J

    move-result-wide v12

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/util/Crypter;->key:[B

    move-object v14, v0

    const/16 v15, 0xc

    const/16 v16, 0x4

    invoke-static/range {v14 .. v16}, Lcom/mappn/gfan/common/util/Crypter;->getUnsignedInt([BII)J

    move-result-wide v14

    const-wide/32 v16, -0x1c886470

    const-wide v18, 0xffffffffL

    and-long v16, v16, v18

    const-wide/32 v18, -0x61c88647

    const-wide v20, 0xffffffffL

    and-long v18, v18, v20

    move-wide/from16 v25, v16

    move-wide/from16 v16, v4

    move-wide/from16 v27, v6

    move-wide/from16 v5, v27

    move v7, v3

    move-wide/from16 v3, v25

    :goto_0
    add-int/lit8 v20, v7, -0x1

    if-lez v7, :cond_0

    const/4 v7, 0x4

    shl-long v21, v16, v7

    add-long v21, v21, v12

    add-long v23, v16, v3

    xor-long v21, v21, v23

    const/4 v7, 0x5

    ushr-long v23, v16, v7

    add-long v23, v23, v14

    xor-long v21, v21, v23

    sub-long v5, v5, v21

    const-wide v21, 0xffffffffL

    and-long v5, v5, v21

    const/4 v7, 0x4

    shl-long v21, v5, v7

    add-long v21, v21, v8

    add-long v23, v5, v3

    xor-long v21, v21, v23

    const/4 v7, 0x5

    ushr-long v23, v5, v7

    add-long v23, v23, v10

    xor-long v21, v21, v23

    sub-long v16, v16, v21

    const-wide v21, 0xffffffffL

    and-long v16, v16, v21

    sub-long v3, v3, v18

    const-wide v21, 0xffffffffL

    and-long v3, v3, v21

    move/from16 v7, v20

    goto :goto_0

    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/util/Crypter;->baos:Ljava/io/ByteArrayOutputStream;

    move-object v3, v0

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->reset()V

    move-wide/from16 v0, v16

    long-to-int v0, v0

    move v3, v0

    move-object/from16 v0, p0

    move v1, v3

    invoke-direct {v0, v1}, Lcom/mappn/gfan/common/util/Crypter;->writeInt(I)V

    long-to-int v3, v5

    move-object/from16 v0, p0

    move v1, v3

    invoke-direct {v0, v1}, Lcom/mappn/gfan/common/util/Crypter;->writeInt(I)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/util/Crypter;->baos:Ljava/io/ByteArrayOutputStream;

    move-object v3, v0

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3
.end method

.method private decrypt8Bytes([BII)Z
    .locals 7

    const/4 v6, 0x1

    const/4 v5, 0x0

    iput v5, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    :goto_0
    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    const/16 v1, 0x8

    if-ge v0, v1, :cond_1

    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->contextStart:I

    iget v1, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/2addr v0, v1

    if-lt v0, p3, :cond_0

    move v0, v6

    :goto_1
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->prePlain:[B

    iget v1, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    aget-byte v2, v0, v1

    iget v3, p0, Lcom/mappn/gfan/common/util/Crypter;->crypt:I

    add-int/2addr v3, p2

    iget v4, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/2addr v3, v4

    aget-byte v3, p1, v3

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->prePlain:[B

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/util/Crypter;->decipher([B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->prePlain:[B

    iget-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->prePlain:[B

    if-nez v0, :cond_2

    move v0, v5

    goto :goto_1

    :cond_2
    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->contextStart:I

    add-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/mappn/gfan/common/util/Crypter;->contextStart:I

    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->crypt:I

    add-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/mappn/gfan/common/util/Crypter;->crypt:I

    iput v5, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    move v0, v6

    goto :goto_1
.end method

.method private encipher([B)[B
    .locals 29

    const/16 v3, 0x10

    const/4 v4, 0x0

    const/4 v5, 0x4

    move-object/from16 v0, p1

    move v1, v4

    move v2, v5

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Crypter;->getUnsignedInt([BII)J

    move-result-wide v4

    const/4 v6, 0x4

    const/4 v7, 0x4

    move-object/from16 v0, p1

    move v1, v6

    move v2, v7

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Crypter;->getUnsignedInt([BII)J

    move-result-wide v6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/util/Crypter;->key:[B

    move-object v8, v0

    const/4 v9, 0x0

    const/4 v10, 0x4

    invoke-static {v8, v9, v10}, Lcom/mappn/gfan/common/util/Crypter;->getUnsignedInt([BII)J

    move-result-wide v8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/util/Crypter;->key:[B

    move-object v10, v0

    const/4 v11, 0x4

    const/4 v12, 0x4

    invoke-static {v10, v11, v12}, Lcom/mappn/gfan/common/util/Crypter;->getUnsignedInt([BII)J

    move-result-wide v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/util/Crypter;->key:[B

    move-object v12, v0

    const/16 v13, 0x8

    const/4 v14, 0x4

    invoke-static {v12, v13, v14}, Lcom/mappn/gfan/common/util/Crypter;->getUnsignedInt([BII)J

    move-result-wide v12

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/util/Crypter;->key:[B

    move-object v14, v0

    const/16 v15, 0xc

    const/16 v16, 0x4

    invoke-static/range {v14 .. v16}, Lcom/mappn/gfan/common/util/Crypter;->getUnsignedInt([BII)J

    move-result-wide v14

    const-wide/16 v16, 0x0

    const-wide/32 v18, -0x61c88647

    const-wide v20, 0xffffffffL

    and-long v18, v18, v20

    move-wide/from16 v25, v16

    move-wide/from16 v16, v4

    move-wide/from16 v27, v6

    move-wide/from16 v5, v27

    move v7, v3

    move-wide/from16 v3, v25

    :goto_0
    add-int/lit8 v20, v7, -0x1

    if-lez v7, :cond_0

    add-long v3, v3, v18

    const-wide v21, 0xffffffffL

    and-long v3, v3, v21

    const/4 v7, 0x4

    shl-long v21, v5, v7

    add-long v21, v21, v8

    add-long v23, v5, v3

    xor-long v21, v21, v23

    const/4 v7, 0x5

    ushr-long v23, v5, v7

    add-long v23, v23, v10

    xor-long v21, v21, v23

    add-long v16, v16, v21

    const-wide v21, 0xffffffffL

    and-long v16, v16, v21

    const/4 v7, 0x4

    shl-long v21, v16, v7

    add-long v21, v21, v12

    add-long v23, v16, v3

    xor-long v21, v21, v23

    const/4 v7, 0x5

    ushr-long v23, v16, v7

    add-long v23, v23, v14

    xor-long v21, v21, v23

    add-long v5, v5, v21

    const-wide v21, 0xffffffffL

    and-long v5, v5, v21

    move/from16 v7, v20

    goto :goto_0

    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/util/Crypter;->baos:Ljava/io/ByteArrayOutputStream;

    move-object v3, v0

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->reset()V

    move-wide/from16 v0, v16

    long-to-int v0, v0

    move v3, v0

    move-object/from16 v0, p0

    move v1, v3

    invoke-direct {v0, v1}, Lcom/mappn/gfan/common/util/Crypter;->writeInt(I)V

    long-to-int v3, v5

    move-object/from16 v0, p0

    move v1, v3

    invoke-direct {v0, v1}, Lcom/mappn/gfan/common/util/Crypter;->writeInt(I)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mappn/gfan/common/util/Crypter;->baos:Ljava/io/ByteArrayOutputStream;

    move-object v3, v0

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3
.end method

.method private encrypt8Bytes()V
    .locals 8

    const/16 v7, 0x8

    const/4 v6, 0x0

    iput v6, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    :goto_0
    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    if-ge v0, v7, :cond_1

    iget-boolean v0, p0, Lcom/mappn/gfan/common/util/Crypter;->header:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->plain:[B

    iget v1, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    aget-byte v2, v0, v1

    iget-object v3, p0, Lcom/mappn/gfan/common/util/Crypter;->prePlain:[B

    iget v4, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    aget-byte v3, v3, v4

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    :goto_1
    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->plain:[B

    iget v1, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    aget-byte v2, v0, v1

    iget-object v3, p0, Lcom/mappn/gfan/common/util/Crypter;->out:[B

    iget v4, p0, Lcom/mappn/gfan/common/util/Crypter;->preCrypt:I

    iget v5, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/2addr v4, v5

    aget-byte v3, v3, v4

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->plain:[B

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/util/Crypter;->encipher([B)[B

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/util/Crypter;->out:[B

    iget v2, p0, Lcom/mappn/gfan/common/util/Crypter;->crypt:I

    invoke-static {v0, v6, v1, v2, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput v6, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    :goto_2
    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    if-ge v0, v7, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->out:[B

    iget v1, p0, Lcom/mappn/gfan/common/util/Crypter;->crypt:I

    iget v2, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/2addr v1, v2

    aget-byte v2, v0, v1

    iget-object v3, p0, Lcom/mappn/gfan/common/util/Crypter;->prePlain:[B

    iget v4, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    aget-byte v3, v3, v4

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->plain:[B

    iget-object v1, p0, Lcom/mappn/gfan/common/util/Crypter;->prePlain:[B

    invoke-static {v0, v6, v1, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->crypt:I

    iput v0, p0, Lcom/mappn/gfan/common/util/Crypter;->preCrypt:I

    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->crypt:I

    add-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/mappn/gfan/common/util/Crypter;->crypt:I

    iput v6, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    iput-boolean v6, p0, Lcom/mappn/gfan/common/util/Crypter;->header:Z

    return-void
.end method

.method private static getUnsignedInt([BII)J
    .locals 8

    const/16 v7, 0x8

    const-wide/16 v0, 0x0

    if-le p2, v7, :cond_0

    add-int/lit8 v2, p1, 0x8

    :goto_0
    move-wide v3, v0

    move v0, p1

    :goto_1
    if-ge v0, v2, :cond_1

    shl-long/2addr v3, v7

    aget-byte v1, p0, v0

    and-int/lit16 v1, v1, 0xff

    int-to-long v5, v1

    or-long/2addr v3, v5

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_0
    add-int v2, p1, p2

    goto :goto_0

    :cond_1
    const-wide v0, 0xffffffffL

    and-long/2addr v0, v3

    const/16 v2, 0x20

    ushr-long v2, v3, v2

    or-long/2addr v0, v2

    return-wide v0
.end method

.method private rand()I
    .locals 1

    sget-object v0, Lcom/mappn/gfan/common/util/Crypter;->random:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    move-result v0

    return v0
.end method

.method private writeInt(I)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->baos:Ljava/io/ByteArrayOutputStream;

    ushr-int/lit8 v1, p1, 0x18

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    iget-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->baos:Ljava/io/ByteArrayOutputStream;

    ushr-int/lit8 v1, p1, 0x10

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    iget-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->baos:Ljava/io/ByteArrayOutputStream;

    ushr-int/lit8 v1, p1, 0x8

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    iget-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->baos:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    return-void
.end method


# virtual methods
.method public decrypt([BII[B)[B
    .locals 10

    const/4 v9, 0x1

    const/4 v4, 0x0

    const/4 v8, 0x0

    const/16 v7, 0x8

    if-nez p4, :cond_0

    move-object v0, v8

    :goto_0
    return-object v0

    :cond_0
    iput v4, p0, Lcom/mappn/gfan/common/util/Crypter;->preCrypt:I

    iput v4, p0, Lcom/mappn/gfan/common/util/Crypter;->crypt:I

    iput-object p4, p0, Lcom/mappn/gfan/common/util/Crypter;->key:[B

    add-int/lit8 v0, p2, 0x8

    new-array v0, v0, [B

    rem-int/lit8 v1, p3, 0x8

    if-nez v1, :cond_1

    const/16 v1, 0x10

    if-ge p3, v1, :cond_2

    :cond_1
    move-object v0, v8

    goto :goto_0

    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/mappn/gfan/common/util/Crypter;->decipher([BI)[B

    move-result-object v1

    iput-object v1, p0, Lcom/mappn/gfan/common/util/Crypter;->prePlain:[B

    iget-object v1, p0, Lcom/mappn/gfan/common/util/Crypter;->prePlain:[B

    aget-byte v1, v1, v4

    and-int/lit8 v1, v1, 0x7

    iput v1, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    iget v1, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    sub-int v1, p3, v1

    const/16 v2, 0xa

    sub-int/2addr v1, v2

    if-gez v1, :cond_3

    move-object v0, v8

    goto :goto_0

    :cond_3
    move v2, p2

    :goto_1
    array-length v3, v0

    if-ge v2, v3, :cond_4

    aput-byte v4, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_4
    new-array v2, v1, [B

    iput-object v2, p0, Lcom/mappn/gfan/common/util/Crypter;->out:[B

    iput v4, p0, Lcom/mappn/gfan/common/util/Crypter;->preCrypt:I

    iput v7, p0, Lcom/mappn/gfan/common/util/Crypter;->crypt:I

    iput v7, p0, Lcom/mappn/gfan/common/util/Crypter;->contextStart:I

    iget v2, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    iput v9, p0, Lcom/mappn/gfan/common/util/Crypter;->padding:I

    :cond_5
    :goto_2
    iget v2, p0, Lcom/mappn/gfan/common/util/Crypter;->padding:I

    const/4 v3, 0x2

    if-gt v2, v3, :cond_7

    iget v2, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    if-ge v2, v7, :cond_6

    iget v2, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    iget v2, p0, Lcom/mappn/gfan/common/util/Crypter;->padding:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/mappn/gfan/common/util/Crypter;->padding:I

    :cond_6
    iget v2, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    if-ne v2, v7, :cond_5

    invoke-direct {p0, p1, p2, p3}, Lcom/mappn/gfan/common/util/Crypter;->decrypt8Bytes([BII)Z

    move-result v0

    if-nez v0, :cond_11

    move-object v0, v8

    goto :goto_0

    :cond_7
    move v2, v1

    move-object v1, v0

    move v0, v4

    :cond_8
    :goto_3
    if-eqz v2, :cond_a

    iget v3, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    if-ge v3, v7, :cond_9

    iget-object v3, p0, Lcom/mappn/gfan/common/util/Crypter;->out:[B

    iget v4, p0, Lcom/mappn/gfan/common/util/Crypter;->preCrypt:I

    add-int/2addr v4, p2

    iget v5, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/2addr v4, v5

    aget-byte v4, v1, v4

    iget-object v5, p0, Lcom/mappn/gfan/common/util/Crypter;->prePlain:[B

    iget v6, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    aget-byte v5, v5, v6

    xor-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v3, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v2, v2, -0x1

    iget v3, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    :cond_9
    iget v3, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    if-ne v3, v7, :cond_8

    iget v1, p0, Lcom/mappn/gfan/common/util/Crypter;->crypt:I

    sub-int/2addr v1, v7

    iput v1, p0, Lcom/mappn/gfan/common/util/Crypter;->preCrypt:I

    invoke-direct {p0, p1, p2, p3}, Lcom/mappn/gfan/common/util/Crypter;->decrypt8Bytes([BII)Z

    move-result v1

    if-nez v1, :cond_10

    move-object v0, v8

    goto/16 :goto_0

    :cond_a
    iput v9, p0, Lcom/mappn/gfan/common/util/Crypter;->padding:I

    move-object v0, v1

    :goto_4
    iget v1, p0, Lcom/mappn/gfan/common/util/Crypter;->padding:I

    if-ge v1, v7, :cond_f

    iget v1, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    if-ge v1, v7, :cond_c

    iget v1, p0, Lcom/mappn/gfan/common/util/Crypter;->preCrypt:I

    add-int/2addr v1, p2

    iget v2, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/2addr v1, v2

    aget-byte v1, v0, v1

    iget-object v2, p0, Lcom/mappn/gfan/common/util/Crypter;->prePlain:[B

    iget v3, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    aget-byte v2, v2, v3

    xor-int/2addr v1, v2

    if-eqz v1, :cond_b

    move-object v0, v8

    goto/16 :goto_0

    :cond_b
    iget v1, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    :cond_c
    iget v1, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    if-ne v1, v7, :cond_e

    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->crypt:I

    iput v0, p0, Lcom/mappn/gfan/common/util/Crypter;->preCrypt:I

    invoke-direct {p0, p1, p2, p3}, Lcom/mappn/gfan/common/util/Crypter;->decrypt8Bytes([BII)Z

    move-result v0

    if-nez v0, :cond_d

    move-object v0, v8

    goto/16 :goto_0

    :cond_d
    move-object v0, p1

    :cond_e
    iget v1, p0, Lcom/mappn/gfan/common/util/Crypter;->padding:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/mappn/gfan/common/util/Crypter;->padding:I

    goto :goto_4

    :cond_f
    iget-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->out:[B

    goto/16 :goto_0

    :cond_10
    move-object v1, p1

    goto :goto_3

    :cond_11
    move-object v0, p1

    goto/16 :goto_2
.end method

.method public decrypt([B[B)[B
    .locals 2

    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1, p2}, Lcom/mappn/gfan/common/util/Crypter;->decrypt([BII[B)[B

    move-result-object v0

    return-object v0
.end method

.method public encrypt([BII[B)[B
    .locals 8

    const/4 v7, 0x1

    const/4 v6, 0x0

    const/16 v5, 0x8

    if-nez p4, :cond_0

    move-object v0, p1

    :goto_0
    return-object v0

    :cond_0
    new-array v0, v5, [B

    iput-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->plain:[B

    new-array v0, v5, [B

    iput-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->prePlain:[B

    iput v7, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    iput v6, p0, Lcom/mappn/gfan/common/util/Crypter;->padding:I

    iput v6, p0, Lcom/mappn/gfan/common/util/Crypter;->preCrypt:I

    iput v6, p0, Lcom/mappn/gfan/common/util/Crypter;->crypt:I

    iput-object p4, p0, Lcom/mappn/gfan/common/util/Crypter;->key:[B

    iput-boolean v7, p0, Lcom/mappn/gfan/common/util/Crypter;->header:Z

    add-int/lit8 v0, p3, 0xa

    rem-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    sub-int v0, v5, v0

    iput v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    :cond_1
    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/2addr v0, p3

    add-int/lit8 v0, v0, 0xa

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->out:[B

    iget-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->plain:[B

    invoke-direct {p0}, Lcom/mappn/gfan/common/util/Crypter;->rand()I

    move-result v1

    and-int/lit16 v1, v1, 0xf8

    iget v2, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    or-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v6

    move v0, v7

    :goto_1
    iget v1, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    if-gt v0, v1, :cond_2

    iget-object v1, p0, Lcom/mappn/gfan/common/util/Crypter;->plain:[B

    invoke-direct {p0}, Lcom/mappn/gfan/common/util/Crypter;->rand()I

    move-result v2

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    move v0, v6

    :goto_2
    if-ge v0, v5, :cond_3

    iget-object v1, p0, Lcom/mappn/gfan/common/util/Crypter;->prePlain:[B

    aput-byte v6, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_3
    iput v7, p0, Lcom/mappn/gfan/common/util/Crypter;->padding:I

    :cond_4
    :goto_3
    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->padding:I

    const/4 v1, 0x2

    if-gt v0, v1, :cond_6

    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    if-ge v0, v5, :cond_5

    iget-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->plain:[B

    iget v1, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    invoke-direct {p0}, Lcom/mappn/gfan/common/util/Crypter;->rand()I

    move-result v2

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->padding:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/common/util/Crypter;->padding:I

    :cond_5
    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    if-ne v0, v5, :cond_4

    invoke-direct {p0}, Lcom/mappn/gfan/common/util/Crypter;->encrypt8Bytes()V

    goto :goto_3

    :cond_6
    move v0, p2

    move v1, p3

    :cond_7
    :goto_4
    if-lez v1, :cond_9

    iget v2, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    if-ge v2, v5, :cond_8

    iget-object v2, p0, Lcom/mappn/gfan/common/util/Crypter;->plain:[B

    iget v3, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/lit8 v4, v0, 0x1

    aget-byte v0, p1, v0

    aput-byte v0, v2, v3

    add-int/lit8 v0, v1, -0x1

    move v1, v0

    move v0, v4

    :cond_8
    iget v2, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    if-ne v2, v5, :cond_7

    invoke-direct {p0}, Lcom/mappn/gfan/common/util/Crypter;->encrypt8Bytes()V

    goto :goto_4

    :cond_9
    iput v7, p0, Lcom/mappn/gfan/common/util/Crypter;->padding:I

    :cond_a
    :goto_5
    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->padding:I

    const/4 v1, 0x7

    if-gt v0, v1, :cond_c

    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    if-ge v0, v5, :cond_b

    iget-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->plain:[B

    iget v1, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    aput-byte v6, v0, v1

    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->padding:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/common/util/Crypter;->padding:I

    :cond_b
    iget v0, p0, Lcom/mappn/gfan/common/util/Crypter;->pos:I

    if-ne v0, v5, :cond_a

    invoke-direct {p0}, Lcom/mappn/gfan/common/util/Crypter;->encrypt8Bytes()V

    goto :goto_5

    :cond_c
    iget-object v0, p0, Lcom/mappn/gfan/common/util/Crypter;->out:[B

    goto/16 :goto_0
.end method

.method public encrypt([B[B)[B
    .locals 2

    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1, p2}, Lcom/mappn/gfan/common/util/Crypter;->encrypt([BII[B)[B

    move-result-object v0

    return-object v0
.end method
