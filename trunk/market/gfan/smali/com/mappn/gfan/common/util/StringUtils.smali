.class public Lcom/mappn/gfan/common/util/StringUtils;
.super Ljava/lang/Object;


# static fields
.field private static final HEX_DIGIST:[C


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/mappn/gfan/common/util/StringUtils;->HEX_DIGIST:[C

    return-void

    :array_0
    .array-data 0x2
        0x30t 0x0t
        0x31t 0x0t
        0x32t 0x0t
        0x33t 0x0t
        0x34t 0x0t
        0x35t 0x0t
        0x36t 0x0t
        0x37t 0x0t
        0x38t 0x0t
        0x39t 0x0t
        0x61t 0x0t
        0x62t 0x0t
        0x63t 0x0t
        0x64t 0x0t
        0x65t 0x0t
        0x66t 0x0t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static formatSize(J)Ljava/lang/String;
    .locals 4

    const-wide/32 v0, 0x100000

    cmp-long v0, p0, v0

    if-gez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Ljava/text/DecimalFormat;

    const-string v2, "##0"

    invoke-direct {v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    long-to-float v2, p0

    const/high16 v3, 0x4480

    div-float/2addr v2, v3

    float-to-double v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "K"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-wide/32 v0, 0x40000000

    cmp-long v0, p0, v0

    if-gez v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Ljava/text/DecimalFormat;

    const-string v2, "###0.##"

    invoke-direct {v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    long-to-float v2, p0

    const/high16 v3, 0x4980

    div-float/2addr v2, v3

    float-to-double v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "M"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Ljava/text/DecimalFormat;

    const-string v2, "#######0.##"

    invoke-direct {v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    long-to-float v2, p0

    const/high16 v3, 0x4e80

    div-float/2addr v2, v3

    float-to-double v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "G"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static formatSize(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lcom/mappn/gfan/common/util/Utils;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/StringUtils;->formatSize(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static fromHexString(Ljava/lang/String;)[B
    .locals 7

    const/4 v6, 0x0

    const/4 v5, -0x1

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    array-length v1, v0

    ushr-int/lit8 v1, v1, 0x1

    new-array v1, v1, [B

    const/4 v2, 0x0

    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_2

    shl-int/lit8 v3, v2, 0x1

    aget-char v3, v0, v3

    invoke-static {v3}, Lcom/mappn/gfan/common/util/StringUtils;->getAsciiCode(C)I

    move-result v3

    shl-int/lit8 v4, v2, 0x1

    add-int/lit8 v4, v4, 0x1

    aget-char v4, v0, v4

    invoke-static {v4}, Lcom/mappn/gfan/common/util/StringUtils;->getAsciiCode(C)I

    move-result v4

    if-eq v3, v5, :cond_0

    if-ne v4, v5, :cond_1

    :cond_0
    move-object v0, v6

    :goto_1
    return-object v0

    :cond_1
    shl-int/lit8 v3, v3, 0x4

    add-int/2addr v3, v4

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    move-object v0, v1

    goto :goto_1

    :cond_3
    move-object v0, v6

    goto :goto_1
.end method

.method private static getAsciiCode(C)I
    .locals 2

    const/16 v0, 0x30

    sub-int v0, p0, v0

    const/16 v1, 0x9

    if-le v0, v1, :cond_0

    const/16 v0, 0x57

    sub-int v0, p0, v0

    :cond_0
    if-ltz v0, :cond_1

    const/16 v1, 0xf

    if-le v0, v1, :cond_2

    :cond_1
    const/4 v0, -0x1

    :cond_2
    return v0
.end method

.method public static getDownloadInterval(I)Ljava/lang/String;
    .locals 5

    const/16 v4, 0x1388

    const/16 v3, 0x3e8

    const/16 v2, 0x1f4

    const/16 v1, 0x64

    const/16 v0, 0x32

    if-ge p0, v0, :cond_0

    const-string v0, "\u5c0f\u4e8e50"

    :goto_0
    return-object v0

    :cond_0
    if-lt p0, v0, :cond_1

    if-ge p0, v1, :cond_1

    const-string v0, "50 - 100"

    goto :goto_0

    :cond_1
    if-lt p0, v1, :cond_2

    if-ge p0, v2, :cond_2

    const-string v0, "100 - 500"

    goto :goto_0

    :cond_2
    if-lt p0, v2, :cond_3

    if-ge p0, v3, :cond_3

    const-string v0, "500 - 1,000"

    goto :goto_0

    :cond_3
    if-lt p0, v3, :cond_4

    if-ge p0, v4, :cond_4

    const-string v0, "1,000 - 5,000"

    goto :goto_0

    :cond_4
    if-lt p0, v4, :cond_5

    const/16 v0, 0x2710

    if-ge p0, v0, :cond_5

    const-string v0, "5,000 - 10,000"

    goto :goto_0

    :cond_5
    const/16 v0, 0x2710

    if-lt p0, v0, :cond_6

    const v0, 0xc350

    if-ge p0, v0, :cond_6

    const-string v0, "10,000 - 50,000"

    goto :goto_0

    :cond_6
    const v0, 0xc350

    if-lt p0, v0, :cond_7

    const v0, 0x3d090

    if-ge p0, v0, :cond_7

    const-string v0, "50,000 - 250,000"

    goto :goto_0

    :cond_7
    const-string v0, "\u5927\u4e8e250,000"

    goto :goto_0
.end method

.method public static getFileNameFromUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static toHexString([BZ)Ljava/lang/String;
    .locals 7

    const/4 v1, 0x0

    if-nez p0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    array-length v0, p0

    shl-int/lit8 v0, v0, 0x1

    new-array v0, v0, [C

    move v2, v1

    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_1

    aget-byte v3, p0, v1

    add-int/lit8 v4, v2, 0x1

    sget-object v5, Lcom/mappn/gfan/common/util/StringUtils;->HEX_DIGIST:[C

    ushr-int/lit8 v6, v3, 0x4

    and-int/lit8 v6, v6, 0xf

    aget-char v5, v5, v6

    aput-char v5, v0, v2

    add-int/lit8 v2, v4, 0x1

    sget-object v5, Lcom/mappn/gfan/common/util/StringUtils;->HEX_DIGIST:[C

    and-int/lit8 v3, v3, 0xf

    aget-char v3, v5, v3

    aput-char v3, v0, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    if-eqz p1, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    move-object v0, v1

    goto :goto_0
.end method
