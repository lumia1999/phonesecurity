.class public final Lcom/yingyonghui/market/util/h;
.super Ljava/lang/Object;
.source "InternetManager.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroid/content/Context;)Z
    .locals 5
    .parameter

    .prologue
    const/4 v4, 0x0

    .line 23
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 24
    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    .line 26
    if-eqz p0, :cond_1

    .line 27
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getAllNetworkInfo()[Landroid/net/NetworkInfo;

    move-result-object v0

    .line 28
    if-eqz v0, :cond_1

    move v1, v4

    .line 29
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 30
    aget-object v2, v0, v1

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "WIFI"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    aget-object v2, v0, v1

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 31
    const/4 v0, 0x1

    .line 36
    :goto_1
    return v0

    .line 29
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    move v0, v4

    .line 36
    goto :goto_1
.end method

.method public static b(Landroid/content/Context;)Z
    .locals 6
    .parameter

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 39
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    .line 41
    if-nez p0, :cond_0

    move v0, v4

    .line 56
    :goto_0
    return v0

    .line 44
    :cond_0
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getAllNetworkInfo()[Landroid/net/NetworkInfo;

    move-result-object v0

    move v1, v4

    move v2, v4

    .line 46
    :goto_1
    array-length v3, v0

    if-ge v1, v3, :cond_2

    .line 47
    aget-object v3, v0, v1

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 48
    add-int/lit8 v2, v2, 0x1

    .line 46
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 51
    :cond_2
    if-le v2, v5, :cond_3

    move v0, v5

    .line 52
    goto :goto_0

    :cond_3
    move v0, v4

    .line 56
    goto :goto_0
.end method
