.class public final Lcom/yingyonghui/market/util/q;
.super Ljava/lang/Object;
.source "Base64.java"


# static fields
.field private static final a:[C

.field private static final b:[I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 75
    const-string v0, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/util/q;->a:[C

    .line 76
    const/16 v0, 0x100

    new-array v0, v0, [I

    .line 78
    sput-object v0, Lcom/yingyonghui/market/util/q;->b:[I

    const/4 v1, -0x1

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 79
    sget-object v0, Lcom/yingyonghui/market/util/q;->a:[C

    array-length v0, v0

    move v1, v4

    :goto_0
    if-ge v1, v0, :cond_0

    .line 80
    sget-object v2, Lcom/yingyonghui/market/util/q;->b:[I

    sget-object v3, Lcom/yingyonghui/market/util/q;->a:[C

    aget-char v3, v3, v1

    aput v1, v2, v3

    .line 79
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 81
    :cond_0
    sget-object v0, Lcom/yingyonghui/market/util/q;->b:[I

    const/16 v1, 0x3d

    aput v4, v0, v1

    .line 82
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final a([B)Ljava/lang/String;
    .locals 2
    .parameter

    .prologue
    .line 451
    new-instance v0, Ljava/lang/String;

    invoke-static {p0}, Lcom/yingyonghui/market/util/q;->b([B)[C

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    return-object v0
.end method

.method private static b([B)[C
    .locals 14
    .parameter

    .prologue
    const/16 v13, 0x3d

    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 98
    if-eqz p0, :cond_0

    array-length v0, p0

    .line 99
    :goto_0
    if-nez v0, :cond_1

    .line 100
    new-array v0, v10, [C

    .line 138
    :goto_1
    return-object v0

    :cond_0
    move v0, v10

    .line 98
    goto :goto_0

    .line 102
    :cond_1
    div-int/lit8 v1, v0, 0x3

    mul-int/lit8 v1, v1, 0x3

    .line 103
    sub-int v2, v0, v11

    div-int/lit8 v2, v2, 0x3

    add-int/lit8 v2, v2, 0x1

    shl-int/lit8 v2, v2, 0x2

    .line 104
    add-int/lit8 v2, v2, 0x0

    .line 105
    new-array v3, v2, [C

    move v4, v10

    move v5, v10

    .line 108
    :goto_2
    if-ge v5, v1, :cond_2

    .line 110
    add-int/lit8 v6, v5, 0x1

    aget-byte v5, p0, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x10

    add-int/lit8 v7, v6, 0x1

    aget-byte v6, p0, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    or-int/2addr v5, v6

    add-int/lit8 v6, v7, 0x1

    aget-byte v7, p0, v7

    and-int/lit16 v7, v7, 0xff

    or-int/2addr v5, v7

    .line 113
    add-int/lit8 v7, v4, 0x1

    sget-object v8, Lcom/yingyonghui/market/util/q;->a:[C

    ushr-int/lit8 v9, v5, 0x12

    and-int/lit8 v9, v9, 0x3f

    aget-char v8, v8, v9

    aput-char v8, v3, v4

    .line 114
    add-int/lit8 v4, v7, 0x1

    sget-object v8, Lcom/yingyonghui/market/util/q;->a:[C

    ushr-int/lit8 v9, v5, 0xc

    and-int/lit8 v9, v9, 0x3f

    aget-char v8, v8, v9

    aput-char v8, v3, v7

    .line 115
    add-int/lit8 v7, v4, 0x1

    sget-object v8, Lcom/yingyonghui/market/util/q;->a:[C

    ushr-int/lit8 v9, v5, 0x6

    and-int/lit8 v9, v9, 0x3f

    aget-char v8, v8, v9

    aput-char v8, v3, v4

    .line 116
    add-int/lit8 v4, v7, 0x1

    sget-object v8, Lcom/yingyonghui/market/util/q;->a:[C

    and-int/lit8 v5, v5, 0x3f

    aget-char v5, v8, v5

    aput-char v5, v3, v7

    move v5, v6

    .line 119
    goto :goto_2

    .line 127
    :cond_2
    sub-int v4, v0, v1

    .line 128
    if-lez v4, :cond_3

    .line 130
    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0xa

    if-ne v4, v12, :cond_4

    sub-int/2addr v0, v11

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x2

    :goto_3
    or-int/2addr v0, v1

    .line 133
    const/4 v1, 0x4

    sub-int v1, v2, v1

    sget-object v5, Lcom/yingyonghui/market/util/q;->a:[C

    shr-int/lit8 v6, v0, 0xc

    aget-char v5, v5, v6

    aput-char v5, v3, v1

    .line 134
    const/4 v1, 0x3

    sub-int v1, v2, v1

    sget-object v5, Lcom/yingyonghui/market/util/q;->a:[C

    ushr-int/lit8 v6, v0, 0x6

    and-int/lit8 v6, v6, 0x3f

    aget-char v5, v5, v6

    aput-char v5, v3, v1

    .line 135
    sub-int v1, v2, v12

    if-ne v4, v12, :cond_5

    sget-object v4, Lcom/yingyonghui/market/util/q;->a:[C

    and-int/lit8 v0, v0, 0x3f

    aget-char v0, v4, v0

    :goto_4
    aput-char v0, v3, v1

    .line 136
    sub-int v0, v2, v11

    aput-char v13, v3, v0

    :cond_3
    move-object v0, v3

    .line 138
    goto/16 :goto_1

    :cond_4
    move v0, v10

    .line 130
    goto :goto_3

    :cond_5
    move v0, v13

    .line 135
    goto :goto_4
.end method
