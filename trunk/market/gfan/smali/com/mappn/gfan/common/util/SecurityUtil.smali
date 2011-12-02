.class public Lcom/mappn/gfan/common/util/SecurityUtil;
.super Ljava/lang/Object;


# static fields
.field public static final KEY_HTTP_CHARGE_ALIPAY:Ljava/lang/String; = "h9sEVED84X81u9ev"

.field private static final SECRET_KEY_HTTP:[B

.field private static final SECRET_KEY_HTTP_CHARGE:[B

.field public static final SECRET_KEY_HTTP_CHARGE_ALIPAY:[B

.field private static final SECRET_KEY_NORMAL:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "7U727ALEWH8"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/codec/digest/DigestUtils;->md5([B)[B

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/codec/digest/DigestUtils;->md5([B)[B

    move-result-object v0

    sput-object v0, Lcom/mappn/gfan/common/util/SecurityUtil;->SECRET_KEY_NORMAL:[B

    const-string v0, "sdk_mappn_201008"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    sput-object v0, Lcom/mappn/gfan/common/util/SecurityUtil;->SECRET_KEY_HTTP:[B

    const-string v0, "MAPPN-ANDY-XIAN-"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    sput-object v0, Lcom/mappn/gfan/common/util/SecurityUtil;->SECRET_KEY_HTTP_CHARGE:[B

    const-string v0, "h9sEVED84X81u9ev"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    sput-object v0, Lcom/mappn/gfan/common/util/SecurityUtil;->SECRET_KEY_HTTP_CHARGE_ALIPAY:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decrypt(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Lcom/mappn/gfan/common/util/Utils;->getUTF8Bytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/codec/binary/Base64;->decodeBase64([B)[B

    move-result-object v0

    if-nez v0, :cond_1

    const-string v0, ""

    goto :goto_0

    :cond_1
    new-instance v1, Lcom/mappn/gfan/common/util/Crypter;

    invoke-direct {v1}, Lcom/mappn/gfan/common/util/Crypter;-><init>()V

    sget-object v2, Lcom/mappn/gfan/common/util/SecurityUtil;->SECRET_KEY_NORMAL:[B

    invoke-virtual {v1, v0, v2}, Lcom/mappn/gfan/common/util/Crypter;->decrypt([B[B)[B

    move-result-object v0

    if-nez v0, :cond_2

    const-string v0, ""

    goto :goto_0

    :cond_2
    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->getUTF8String([B)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static decryptHttpEntity(Lorg/apache/http/HttpEntity;)[B
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_0

    new-instance v1, Lcom/mappn/gfan/common/util/Crypter;

    invoke-direct {v1}, Lcom/mappn/gfan/common/util/Crypter;-><init>()V

    sget-object v2, Lcom/mappn/gfan/common/util/SecurityUtil;->SECRET_KEY_HTTP:[B

    invoke-virtual {v1, v0, v2}, Lcom/mappn/gfan/common/util/Crypter;->decrypt([B[B)[B

    move-result-object v0

    :cond_0
    return-object v0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public static encrypt(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Lcom/mappn/gfan/common/util/Utils;->getUTF8Bytes(Ljava/lang/String;)[B

    move-result-object v0

    new-instance v1, Lcom/mappn/gfan/common/util/Crypter;

    invoke-direct {v1}, Lcom/mappn/gfan/common/util/Crypter;-><init>()V

    sget-object v2, Lcom/mappn/gfan/common/util/SecurityUtil;->SECRET_KEY_NORMAL:[B

    invoke-virtual {v1, v0, v2}, Lcom/mappn/gfan/common/util/Crypter;->encrypt([B[B)[B

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->getUTF8String([B)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static encryptHttpBody(Ljava/lang/String;)[B
    .locals 3

    new-instance v0, Lcom/mappn/gfan/common/util/Crypter;

    invoke-direct {v0}, Lcom/mappn/gfan/common/util/Crypter;-><init>()V

    invoke-static {p0}, Lcom/mappn/gfan/common/util/Utils;->getUTF8Bytes(Ljava/lang/String;)[B

    move-result-object v1

    sget-object v2, Lcom/mappn/gfan/common/util/SecurityUtil;->SECRET_KEY_HTTP:[B

    invoke-virtual {v0, v1, v2}, Lcom/mappn/gfan/common/util/Crypter;->encrypt([B[B)[B

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object v0

    return-object v0
.end method

.method public static encryptHttpChargeBody(Ljava/lang/String;)[B
    .locals 3

    new-instance v0, Lcom/mappn/gfan/common/util/Crypter;

    invoke-direct {v0}, Lcom/mappn/gfan/common/util/Crypter;-><init>()V

    invoke-static {p0}, Lcom/mappn/gfan/common/util/Utils;->getUTF8Bytes(Ljava/lang/String;)[B

    move-result-object v1

    sget-object v2, Lcom/mappn/gfan/common/util/SecurityUtil;->SECRET_KEY_HTTP_CHARGE:[B

    invoke-virtual {v0, v1, v2}, Lcom/mappn/gfan/common/util/Crypter;->encrypt([B[B)[B

    move-result-object v0

    return-object v0
.end method

.method public static encryptHttpChargePalipayBody(Ljava/lang/String;)[B
    .locals 3

    new-instance v0, Lcom/mappn/gfan/common/util/Crypter;

    invoke-direct {v0}, Lcom/mappn/gfan/common/util/Crypter;-><init>()V

    invoke-static {p0}, Lcom/mappn/gfan/common/util/Utils;->getUTF8Bytes(Ljava/lang/String;)[B

    move-result-object v1

    sget-object v2, Lcom/mappn/gfan/common/util/SecurityUtil;->SECRET_KEY_HTTP_CHARGE_ALIPAY:[B

    invoke-virtual {v0, v1, v2}, Lcom/mappn/gfan/common/util/Crypter;->encrypt([B[B)[B

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object v0

    return-object v0
.end method

.method public static encryptPassword(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    invoke-static {p1}, Lcom/mappn/gfan/common/util/Utils;->getUTF8Bytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/codec/digest/DigestUtils;->md5([B)[B

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/SecurityUtil;->swapBytes([B)V

    invoke-static {v0}, Lcom/mappn/gfan/common/util/SecurityUtil;->reverseBits([B)V

    new-instance v1, Lcom/mappn/gfan/common/util/Crypter;

    invoke-direct {v1}, Lcom/mappn/gfan/common/util/Crypter;-><init>()V

    invoke-static {p0}, Lcom/mappn/gfan/common/util/Utils;->getUTF8Bytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/mappn/gfan/common/util/Crypter;->encrypt([B[B)[B

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->getUTF8String([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static reverseBits([B)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    aget-byte v1, p0, v0

    xor-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static swapBytes([B)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    aget-byte v1, p0, v0

    add-int/lit8 v2, v0, 0x1

    aget-byte v2, p0, v2

    aput-byte v2, p0, v0

    add-int/lit8 v2, v0, 0x1

    aput-byte v1, p0, v2

    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    :cond_0
    return-void
.end method
