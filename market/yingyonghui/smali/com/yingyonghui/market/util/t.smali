.class public final Lcom/yingyonghui/market/util/t;
.super Ljava/lang/Object;
.source "PackageInstallInfo.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;II)I
    .locals 6
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 18
    .line 20
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/16 v1, 0x2000

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 22
    if-eqz v0, :cond_0

    move v1, v5

    :goto_0
    add-int/lit8 v1, v1, 0x0

    .line 24
    if-eqz v0, :cond_5

    .line 25
    :try_start_1
    iget v2, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 27
    const-string v3, "com.yingyonghui.market"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 28
    const/16 v0, 0x270f

    if-ne p3, v0, :cond_5

    .line 29
    if-ge v2, p2, :cond_1

    move v0, v5

    :goto_1
    add-int/2addr v0, v1

    .line 46
    :goto_2
    return v0

    :cond_0
    move v1, v4

    .line 22
    goto :goto_0

    :cond_1
    move v0, v4

    .line 29
    goto :goto_1

    .line 32
    :cond_2
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 33
    if-eqz v0, :cond_3

    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    if-eqz v3, :cond_3

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    const-string v3, "/system/app"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v0

    if-nez v0, :cond_5

    .line 36
    :cond_3
    if-ge v2, p2, :cond_4

    move v0, v5

    :goto_3
    add-int/2addr v0, v1

    goto :goto_2

    :cond_4
    move v0, v4

    goto :goto_3

    :catch_0
    move-exception v0

    move v0, v4

    goto :goto_2

    :catch_1
    move-exception v0

    move v0, v1

    goto :goto_2

    :cond_5
    move v0, v1

    goto :goto_2
.end method
