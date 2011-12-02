.class public Lcom/mappn/gfan/common/util/StreamUtil;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/common/util/StreamUtil$Processhandler;
    }
.end annotation


# instance fields
.field handler:Lcom/mappn/gfan/common/util/StreamUtil$Processhandler;

.field private length:J

.field private md:Ljava/security/MessageDigest;

.field private md5:[B

.field private withMd5:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 4

    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v2, p0, Lcom/mappn/gfan/common/util/StreamUtil;->length:J

    iput-object v1, p0, Lcom/mappn/gfan/common/util/StreamUtil;->md:Ljava/security/MessageDigest;

    iput-object v1, p0, Lcom/mappn/gfan/common/util/StreamUtil;->md5:[B

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mappn/gfan/common/util/StreamUtil;->withMd5:Z

    iput-object v1, p0, Lcom/mappn/gfan/common/util/StreamUtil;->handler:Lcom/mappn/gfan/common/util/StreamUtil$Processhandler;

    iput-wide v2, p0, Lcom/mappn/gfan/common/util/StreamUtil;->length:J

    iput-boolean p1, p0, Lcom/mappn/gfan/common/util/StreamUtil;->withMd5:Z

    if-eqz p1, :cond_0

    :try_start_0
    const-string v0, "MD5"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/util/StreamUtil;->md:Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_0
.end method

.method public constructor <init>(ZLcom/mappn/gfan/common/util/StreamUtil$Processhandler;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/util/StreamUtil;-><init>(Z)V

    iput-object p2, p0, Lcom/mappn/gfan/common/util/StreamUtil;->handler:Lcom/mappn/gfan/common/util/StreamUtil$Processhandler;

    return-void
.end method

.method public static copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lcom/mappn/gfan/common/util/StreamUtil;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/mappn/gfan/common/util/StreamUtil;-><init>(Z)V

    invoke-virtual {v0, p0, p1}, Lcom/mappn/gfan/common/util/StreamUtil;->copyStreamInner(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    iget-wide v0, v0, Lcom/mappn/gfan/common/util/StreamUtil;->length:J

    return-wide v0
.end method


# virtual methods
.method public copyStreamInner(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v4, 0x0

    const/16 v0, 0x1000

    new-array v3, v0, [B

    :cond_0
    invoke-virtual {p1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v5

    if-ltz v5, :cond_3

    if-eqz p2, :cond_1

    invoke-virtual {p2, v3, v4, v5}, Ljava/io/OutputStream;->write([BII)V

    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V

    :cond_1
    iget-wide v0, p0, Lcom/mappn/gfan/common/util/StreamUtil;->length:J

    int-to-long v6, v5

    add-long/2addr v0, v6

    iput-wide v0, p0, Lcom/mappn/gfan/common/util/StreamUtil;->length:J

    iget-boolean v0, p0, Lcom/mappn/gfan/common/util/StreamUtil;->withMd5:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/common/util/StreamUtil;->md:Ljava/security/MessageDigest;

    invoke-virtual {v0, v3, v4, v5}, Ljava/security/MessageDigest;->update([BII)V

    :cond_2
    iget-object v0, p0, Lcom/mappn/gfan/common/util/StreamUtil;->handler:Lcom/mappn/gfan/common/util/StreamUtil$Processhandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/StreamUtil;->handler:Lcom/mappn/gfan/common/util/StreamUtil$Processhandler;

    iget-wide v1, p0, Lcom/mappn/gfan/common/util/StreamUtil;->length:J

    invoke-interface/range {v0 .. v5}, Lcom/mappn/gfan/common/util/StreamUtil$Processhandler;->onProcess(J[BII)Z

    move-result v0

    if-nez v0, :cond_0

    :cond_3
    return-void
.end method

.method public getLength()J
    .locals 2

    iget-wide v0, p0, Lcom/mappn/gfan/common/util/StreamUtil;->length:J

    return-wide v0
.end method

.method public getMD5()[B
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/common/util/StreamUtil;->withMd5:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/StreamUtil;->md5:[B

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/StreamUtil;->md:Ljava/security/MessageDigest;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/util/StreamUtil;->md5:[B

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/common/util/StreamUtil;->md5:[B

    goto :goto_0
.end method
