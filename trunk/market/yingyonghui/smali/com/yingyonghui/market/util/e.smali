.class public Lcom/yingyonghui/market/util/e;
.super Ljava/lang/Object;
.source "ApkInspector.java"


# static fields
.field private static a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-string v0, "SHA-512"

    sput-object v0, Lcom/yingyonghui/market/util/e;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .parameter

    .prologue
    const/4 v6, 0x0

    .line 22
    :try_start_0
    new-instance v0, Ljava/util/zip/ZipFile;

    invoke-direct {v0, p0}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

    .line 26
    invoke-virtual {v0}, Ljava/util/zip/ZipFile;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/yingyonghui/market/util/e;->b(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 27
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 28
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_0

    .line 29
    const-class v3, Lcom/yingyonghui/market/util/e;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Certificate: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    :cond_0
    const/4 v3, 0x0

    .line 32
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/security/cert/Certificate;

    .line 33
    invoke-virtual {p0}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v4

    invoke-interface {v4}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v4

    sget-object v5, Lcom/yingyonghui/market/util/e;->a:Ljava/lang/String;

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v4

    invoke-static {v4}, Lcom/yingyonghui/market/util/f;->a([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 34
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 37
    :cond_1
    if-nez v3, :cond_2

    move-object v0, v6

    .line 54
    :goto_1
    return-object v0

    .line 40
    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/yingyonghui/market/util/e;->a:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/yingyonghui/market/util/f;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 41
    invoke-virtual {v0}, Ljava/util/zip/ZipFile;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-object v0, v1

    .line 53
    goto :goto_1

    .line 43
    :catch_0
    move-exception v0

    .line 44
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "Read file error"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    move-object v0, v6

    .line 53
    goto :goto_1

    .line 47
    :catch_1
    move-exception v0

    .line 48
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "Hash algorithm not supported"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    move-object v0, v6

    .line 53
    goto :goto_1

    .line 51
    :catch_2
    move-exception v0

    move-object v0, v6

    goto :goto_1
.end method

.method private static b(Ljava/lang/String;)Ljava/util/List;
    .locals 8
    .parameter

    .prologue
    const/4 v7, 0x0

    .line 59
    new-instance v0, Ljava/util/jar/JarFile;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Ljava/util/jar/JarFile;-><init>(Ljava/lang/String;Z)V

    .line 60
    invoke-virtual {v0}, Ljava/util/jar/JarFile;->entries()Ljava/util/Enumeration;

    move-result-object v1

    .line 61
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 63
    const/16 v3, 0x2000

    new-array v3, v3, [B

    .line 64
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 65
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/jar/JarEntry;

    .line 66
    invoke-virtual {v2, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 67
    invoke-virtual {v0, p0}, Ljava/util/jar/JarFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v4

    .line 69
    :cond_1
    array-length v5, v3

    invoke-virtual {v4, v3, v7, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_1

    .line 70
    if-eqz v4, :cond_0

    .line 71
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    goto :goto_0

    .line 74
    :cond_2
    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 75
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 76
    :cond_3
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 77
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/jar/JarEntry;

    .line 78
    invoke-virtual {v0}, Ljava/util/jar/JarFile;->getManifest()Ljava/util/jar/Manifest;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-virtual {v0}, Ljava/util/jar/JarFile;->getManifest()Ljava/util/jar/Manifest;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/jar/Manifest;->getEntries()Ljava/util/Map;

    move-result-object v3

    invoke-virtual {p0}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 80
    invoke-virtual {p0}, Ljava/util/jar/JarEntry;->getCertificates()[Ljava/security/cert/Certificate;

    move-result-object v0

    array-length v1, v0

    move v3, v7

    :goto_1
    if-ge v3, v1, :cond_4

    aget-object v4, v0, v3

    .line 81
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_4
    move-object v0, v2

    .line 87
    :goto_2
    return-object v0

    .line 86
    :cond_5
    invoke-virtual {v0}, Ljava/util/jar/JarFile;->close()V

    move-object v0, v2

    .line 87
    goto :goto_2
.end method
