.class public Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/DownloadManagerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AppItem"
.end annotation


# instance fields
.field public mAppName:Ljava/lang/CharSequence;

.field public mCurrentVersion:Ljava/lang/String;

.field public mCurrentVersionString:Ljava/lang/String;

.field public mData:Ljava/lang/Object;

.field public mFilePath:Ljava/lang/String;

.field public mIcon:Ljava/lang/Object;

.field public mId:J

.field public mInfo:Ljava/lang/String;

.field public mInfo2:Ljava/lang/String;

.field public mIsSystemApp:Z

.field public mIsUpdate:Z

.field public mKey:Ljava/lang/String;

.field public mNewVersion:Ljava/lang/String;

.field public mNewVersionString:Ljava/lang/String;

.field public mPackageName:Ljava/lang/String;

.field public mProductId:Ljava/lang/String;

.field public mProgress:I

.field public mRsaMd5:Ljava/lang/String;

.field public mTitle:Ljava/lang/String;

.field public mViewType:I

.field public mWeight:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mAppName:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] weight "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mWeight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " viewType "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mViewType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
