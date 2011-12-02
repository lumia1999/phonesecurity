.class public Lcom/mappn/gfan/common/download/DownloadManager$Request;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/download/DownloadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Request"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private mDescription:Ljava/lang/CharSequence;

.field private mDestination:I

.field private mIconUrl:Ljava/lang/String;

.field private mMD5:Ljava/lang/String;

.field private mMimeType:Ljava/lang/String;

.field private mPackageName:Ljava/lang/String;

.field private mShowNotification:Z

.field private mSourceType:I

.field private mTitle:Ljava/lang/CharSequence;

.field private mUri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/mappn/gfan/common/download/DownloadManager;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Landroid/net/Uri;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mShowNotification:Z

    const-string v0, "application/vnd.android.package-archive"

    iput-object v0, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mMimeType:Ljava/lang/String;

    const/4 v0, 0x0

    iput v0, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mDestination:I

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "http"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can only download HTTP URIs: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mUri:Landroid/net/Uri;

    return-void
.end method

.method static synthetic access$000(Lcom/mappn/gfan/common/download/DownloadManager$Request;)Ljava/lang/CharSequence;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mTitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mappn/gfan/common/download/DownloadManager$Request;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mPackageName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mappn/gfan/common/download/DownloadManager$Request;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mMD5:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mappn/gfan/common/download/DownloadManager$Request;)I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mSourceType:I

    return v0
.end method

.method static synthetic access$400(Lcom/mappn/gfan/common/download/DownloadManager$Request;)I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mDestination:I

    return v0
.end method

.method private putIfNonNull(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public setDescription(Ljava/lang/CharSequence;)Lcom/mappn/gfan/common/download/DownloadManager$Request;
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mDescription:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public setDestination(I)Lcom/mappn/gfan/common/download/DownloadManager$Request;
    .locals 0

    iput p1, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mDestination:I

    return-object p0
.end method

.method public setIconUrl(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mIconUrl:Ljava/lang/String;

    return-object p0
.end method

.method public setMD5(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mMD5:Ljava/lang/String;

    return-object p0
.end method

.method public setMimeType(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mMimeType:Ljava/lang/String;

    return-object p0
.end method

.method public setPackageName(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mPackageName:Ljava/lang/String;

    return-object p0
.end method

.method public setShowRunningNotification(Z)Lcom/mappn/gfan/common/download/DownloadManager$Request;
    .locals 0

    iput-boolean p1, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mShowNotification:Z

    return-object p0
.end method

.method public setSourceType(I)Lcom/mappn/gfan/common/download/DownloadManager$Request;
    .locals 0

    iput p1, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mSourceType:I

    return-object p0
.end method

.method public setTitle(Ljava/lang/CharSequence;)Lcom/mappn/gfan/common/download/DownloadManager$Request;
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mTitle:Ljava/lang/CharSequence;

    return-object p0
.end method

.method toContentValues(Ljava/lang/String;)Landroid/content/ContentValues;
    .locals 3

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    sget-boolean v1, Lcom/mappn/gfan/common/download/DownloadManager$Request;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mUri:Landroid/net/Uri;

    if-nez v1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_0
    const-string v1, "uri"

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "notificationpackage"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "mimetype"

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mMimeType:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "notificationextras"

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mIconUrl:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "source"

    iget v2, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mSourceType:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "title"

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mTitle:Ljava/lang/CharSequence;

    invoke-direct {p0, v0, v1, v2}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->putIfNonNull(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "description"

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mDescription:Ljava/lang/CharSequence;

    invoke-direct {p0, v0, v1, v2}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->putIfNonNull(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "visibility"

    iget-boolean v2, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mShowNotification:Z

    if-eqz v2, :cond_2

    const/4 v2, 0x1

    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget v1, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mSourceType:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    const-string v1, "application/vnd.android.package-archive"

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadManager$Request;->mMimeType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "visibility"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :cond_1
    return-object v0

    :cond_2
    const/4 v2, 0x2

    goto :goto_0
.end method
