.class Lcom/gfan/sdk/statistics/Collector$ApkInfo;
.super Ljava/lang/Object;
.source "Collector.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gfan/sdk/statistics/Collector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ApkInfo"
.end annotation


# static fields
.field private static final mutex:Ljava/lang/Object;


# instance fields
.field private context:Landroid/content/Context;

.field private iResponse:Lcom/gfan/sdk/statistics/Collector$IResponse;

.field private message:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 624
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/gfan/sdk/statistics/Collector$ApkInfo;->mutex:Ljava/lang/Object;

    .line 623
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/gfan/sdk/statistics/Collector$IResponse;Landroid/content/Context;)V
    .locals 0
    .parameter "message"
    .parameter "iResponse"
    .parameter "context"

    .prologue
    .line 629
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 630
    iput-object p1, p0, Lcom/gfan/sdk/statistics/Collector$ApkInfo;->message:Ljava/lang/String;

    .line 631
    iput-object p2, p0, Lcom/gfan/sdk/statistics/Collector$ApkInfo;->iResponse:Lcom/gfan/sdk/statistics/Collector$IResponse;

    .line 632
    iput-object p3, p0, Lcom/gfan/sdk/statistics/Collector$ApkInfo;->context:Landroid/content/Context;

    .line 633
    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 636
    sget-object v6, Lcom/gfan/sdk/statistics/Collector$ApkInfo;->mutex:Ljava/lang/Object;

    monitor-enter v6

    .line 637
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 638
    .local v4, pkgname:Ljava/lang/StringBuilder;
    iget-object v7, p0, Lcom/gfan/sdk/statistics/Collector$ApkInfo;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 639
    .local v5, pm:Landroid/content/pm/PackageManager;
    const/4 v7, 0x0

    invoke-virtual {v5, v7}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v3

    .line 640
    .local v3, list:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ApplicationInfo;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    .line 641
    .local v1, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-lt v2, v1, :cond_0

    .line 647
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-lez v7, :cond_1

    .line 648
    iget-object v7, p0, Lcom/gfan/sdk/statistics/Collector$ApkInfo;->message:Ljava/lang/String;

    const-string v8, "${packagelist}"

    const/4 v9, 0x0

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    const/4 v11, 0x1

    sub-int/2addr v10, v11

    invoke-virtual {v4, v9, v10}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/gfan/sdk/statistics/Collector$ApkInfo;->message:Ljava/lang/String;

    .line 653
    :goto_1
    iget-object v7, p0, Lcom/gfan/sdk/statistics/Collector$ApkInfo;->message:Ljava/lang/String;

    iget-object v8, p0, Lcom/gfan/sdk/statistics/Collector$ApkInfo;->iResponse:Lcom/gfan/sdk/statistics/Collector$IResponse;

    invoke-static {v7, v8}, Lcom/gfan/sdk/statistics/Collector;->access$0(Ljava/lang/String;Lcom/gfan/sdk/statistics/Collector$IResponse;)Z

    .line 636
    monitor-exit v6

    .line 655
    return-void

    .line 642
    :cond_0
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ApplicationInfo;

    .line 643
    .local v0, app:Landroid/content/pm/ApplicationInfo;
    iget-object v7, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 644
    const-string v7, ","

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 641
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 650
    .end local v0           #app:Landroid/content/pm/ApplicationInfo;
    :cond_1
    iget-object v7, p0, Lcom/gfan/sdk/statistics/Collector$ApkInfo;->message:Ljava/lang/String;

    const-string v8, "${packagelist}"

    const-string v9, ""

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/gfan/sdk/statistics/Collector$ApkInfo;->message:Ljava/lang/String;

    goto :goto_1

    .line 636
    .end local v1           #count:I
    .end local v2           #i:I
    .end local v3           #list:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ApplicationInfo;>;"
    .end local v4           #pkgname:Ljava/lang/StringBuilder;
    .end local v5           #pm:Landroid/content/pm/PackageManager;
    :catchall_0
    move-exception v7

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v7
.end method
