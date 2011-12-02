.class public Lcom/mappn/gfan/common/vo/UpdateInfo;
.super Ljava/lang/Object;


# instance fields
.field apkUrl:Ljava/lang/String;

.field description:Ljava/lang/String;

.field updageLevel:I

.field versionCode:I

.field versionName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getApkUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/UpdateInfo;->apkUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/UpdateInfo;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdageLevel()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/common/vo/UpdateInfo;->updageLevel:I

    return v0
.end method

.method public getVersionCode()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/common/vo/UpdateInfo;->versionCode:I

    return v0
.end method

.method public getVersionName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/UpdateInfo;->versionName:Ljava/lang/String;

    return-object v0
.end method

.method public setApkUrl(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/UpdateInfo;->apkUrl:Ljava/lang/String;

    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/UpdateInfo;->description:Ljava/lang/String;

    return-void
.end method

.method public setUpdageLevel(I)V
    .locals 0

    iput p1, p0, Lcom/mappn/gfan/common/vo/UpdateInfo;->updageLevel:I

    return-void
.end method

.method public setVersionCode(I)V
    .locals 0

    iput p1, p0, Lcom/mappn/gfan/common/vo/UpdateInfo;->versionCode:I

    return-void
.end method

.method public setVersionName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/UpdateInfo;->versionName:Ljava/lang/String;

    return-void
.end method
