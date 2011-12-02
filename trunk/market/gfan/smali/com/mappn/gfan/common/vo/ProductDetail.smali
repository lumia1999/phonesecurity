.class public Lcom/mappn/gfan/common/vo/ProductDetail;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x7d48d6be66919c8dL


# instance fields
.field private appSize:I

.field private authorName:Ljava/lang/String;

.field private commentsCount:I

.field private downloadCount:I

.field private iconUrl:Ljava/lang/String;

.field private iconUrlLdpi:Ljava/lang/String;

.field private longDescription:Ljava/lang/String;

.field private mFilePath:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private packageName:Ljava/lang/String;

.field private payCategory:I

.field private permission:Ljava/lang/String;

.field private pid:Ljava/lang/String;

.field private price:I

.field private productType:Ljava/lang/String;

.field private publishTime:J

.field private rating:I

.field private ratingCount:I

.field private rsaMd5:Ljava/lang/String;

.field private screenshot:[Ljava/lang/String;

.field private screenshotLdpi:[Ljava/lang/String;

.field private shotDes:Ljava/lang/String;

.field private sourceType:Ljava/lang/String;

.field private upReason:Ljava/lang/String;

.field private upTime:J

.field private versionCode:I

.field private versionName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->screenshot:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAppSize()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->appSize:I

    return v0
.end method

.method public getAuthorName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->authorName:Ljava/lang/String;

    return-object v0
.end method

.method public getCommentsCount()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->commentsCount:I

    return v0
.end method

.method public getDownloadCount()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->downloadCount:I

    return v0
.end method

.method public getFilePath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->mFilePath:Ljava/lang/String;

    return-object v0
.end method

.method public getIconUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->iconUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getIconUrlLdpi()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->iconUrlLdpi:Ljava/lang/String;

    return-object v0
.end method

.method public getLongDescription()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->longDescription:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->packageName:Ljava/lang/String;

    return-object v0
.end method

.method public getPayCategory()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->payCategory:I

    return v0
.end method

.method public getPermission()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->permission:Ljava/lang/String;

    return-object v0
.end method

.method public getPid()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->pid:Ljava/lang/String;

    return-object v0
.end method

.method public getPrice()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->price:I

    return v0
.end method

.method public getProductType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->productType:Ljava/lang/String;

    return-object v0
.end method

.method public getPublishTime()J
    .locals 2

    iget-wide v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->publishTime:J

    return-wide v0
.end method

.method public getRating()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->rating:I

    return v0
.end method

.method public getRatingCount()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->ratingCount:I

    return v0
.end method

.method public getRsaMd5()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->rsaMd5:Ljava/lang/String;

    return-object v0
.end method

.method public getScreenshot()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->screenshot:[Ljava/lang/String;

    return-object v0
.end method

.method public getScreenshotLdpi()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->screenshotLdpi:[Ljava/lang/String;

    return-object v0
.end method

.method public getShotDes()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->shotDes:Ljava/lang/String;

    return-object v0
.end method

.method public getSourceType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->sourceType:Ljava/lang/String;

    return-object v0
.end method

.method public getUpReason()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->upReason:Ljava/lang/String;

    return-object v0
.end method

.method public getUpTime()J
    .locals 2

    iget-wide v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->upTime:J

    return-wide v0
.end method

.method public getVersionCode()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->versionCode:I

    return v0
.end method

.method public getVersionName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->versionName:Ljava/lang/String;

    return-object v0
.end method

.method public setAppSize(I)V
    .locals 0

    iput p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->appSize:I

    return-void
.end method

.method public setAuthorName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->authorName:Ljava/lang/String;

    return-void
.end method

.method public setCommentsCount(I)V
    .locals 0

    iput p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->commentsCount:I

    return-void
.end method

.method public setDownloadCount(I)V
    .locals 0

    iput p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->downloadCount:I

    return-void
.end method

.method public setFilePath(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->mFilePath:Ljava/lang/String;

    return-void
.end method

.method public setIconUrl(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->iconUrl:Ljava/lang/String;

    return-void
.end method

.method public setIconUrlLdpi(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->iconUrlLdpi:Ljava/lang/String;

    return-void
.end method

.method public setLongDescription(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->longDescription:Ljava/lang/String;

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->name:Ljava/lang/String;

    return-void
.end method

.method public setPackageName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->packageName:Ljava/lang/String;

    return-void
.end method

.method public setPayCategory(I)V
    .locals 0

    iput p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->payCategory:I

    return-void
.end method

.method public setPermission(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->permission:Ljava/lang/String;

    return-void
.end method

.method public setPid(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->pid:Ljava/lang/String;

    return-void
.end method

.method public setPrice(I)V
    .locals 0

    iput p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->price:I

    return-void
.end method

.method public setProductType(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->productType:Ljava/lang/String;

    return-void
.end method

.method public setPublishTime(J)V
    .locals 0

    iput-wide p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->publishTime:J

    return-void
.end method

.method public setRating(I)V
    .locals 0

    iput p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->rating:I

    return-void
.end method

.method public setRatingCount(I)V
    .locals 0

    iput p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->ratingCount:I

    return-void
.end method

.method public setRsaMd5(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->rsaMd5:Ljava/lang/String;

    return-void
.end method

.method public setScreenshot([Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->screenshot:[Ljava/lang/String;

    return-void
.end method

.method public setScreenshotLdpi([Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->screenshotLdpi:[Ljava/lang/String;

    return-void
.end method

.method public setShotDes(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->shotDes:Ljava/lang/String;

    return-void
.end method

.method public setSourceType(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->sourceType:Ljava/lang/String;

    return-void
.end method

.method public setUpReason(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->upReason:Ljava/lang/String;

    return-void
.end method

.method public setUpTime(J)V
    .locals 0

    iput-wide p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->upTime:J

    return-void
.end method

.method public setVersionCode(I)V
    .locals 0

    iput p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->versionCode:I

    return-void
.end method

.method public setVersionName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->versionName:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "ProductDetail["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lcom/mappn/gfan/common/vo/ProductDetail;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
