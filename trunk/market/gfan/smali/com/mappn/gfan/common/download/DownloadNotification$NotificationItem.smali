.class Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/download/DownloadNotification;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NotificationItem"
.end annotation


# instance fields
.field mCurrentBytes:J

.field mId:I

.field mPackageName:Ljava/lang/String;

.field mPausedText:Ljava/lang/String;

.field mTitleCount:I

.field mTitles:[Ljava/lang/String;

.field mTotalBytes:J


# direct methods
.method constructor <init>()V
    .locals 2

    const-wide/16 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mCurrentBytes:J

    iput-wide v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTotalBytes:J

    const/4 v0, 0x0

    iput v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTitleCount:I

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTitles:[Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mPausedText:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method addItem(Ljava/lang/String;JJ)V
    .locals 4

    const-wide/16 v2, -0x1

    iget-wide v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mCurrentBytes:J

    add-long/2addr v0, p2

    iput-wide v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mCurrentBytes:J

    const-wide/16 v0, 0x0

    cmp-long v0, p4, v0

    if-lez v0, :cond_0

    iget-wide v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTotalBytes:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    :cond_0
    iput-wide v2, p0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTotalBytes:J

    :goto_0
    iget v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTitleCount:I

    const/4 v1, 0x2

    if-ge v0, v1, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTitles:[Ljava/lang/String;

    iget v1, p0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTitleCount:I

    aput-object p1, v0, v1

    :cond_1
    iget v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTitleCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTitleCount:I

    return-void

    :cond_2
    iget-wide v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTotalBytes:J

    add-long/2addr v0, p4

    iput-wide v0, p0, Lcom/mappn/gfan/common/download/DownloadNotification$NotificationItem;->mTotalBytes:J

    goto :goto_0
.end method
