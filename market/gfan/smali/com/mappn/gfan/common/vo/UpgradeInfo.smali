.class public Lcom/mappn/gfan/common/vo/UpgradeInfo;
.super Ljava/lang/Object;


# instance fields
.field public filePath:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public pid:Ljava/lang/String;

.field public pkgName:Ljava/lang/String;

.field public signature:Ljava/lang/String;

.field public status:I

.field public update:I

.field public versionCode:I

.field public versionName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContentValues()Landroid/content/ContentValues;
    .locals 3

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "p_id"

    iget-object v2, p0, Lcom/mappn/gfan/common/vo/UpgradeInfo;->pid:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "p_new_version_name"

    iget-object v2, p0, Lcom/mappn/gfan/common/vo/UpgradeInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "p_new_version_code"

    iget v2, p0, Lcom/mappn/gfan/common/vo/UpgradeInfo;->versionCode:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "p_package_name"

    iget-object v2, p0, Lcom/mappn/gfan/common/vo/UpgradeInfo;->pkgName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "p_signature"

    iget-object v2, p0, Lcom/mappn/gfan/common/vo/UpgradeInfo;->signature:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "p_update_ingore"

    iget v2, p0, Lcom/mappn/gfan/common/vo/UpgradeInfo;->update:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    return-object v0
.end method
