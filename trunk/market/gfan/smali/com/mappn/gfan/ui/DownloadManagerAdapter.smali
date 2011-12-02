.class public Lcom/mappn/gfan/ui/DownloadManagerAdapter;
.super Landroid/widget/BaseAdapter;

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;,
        Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;,
        Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;
    }
.end annotation


# static fields
.field static final ITEM_DOWNLOAD_TITLE:Ljava/lang/String; = "download_title"

.field static final ITEM_INSTALLED_TITLE:Ljava/lang/String; = "installed_title"

.field static final ITEM_UPDATE_ALL:Ljava/lang/String; = "update_all"

.field private static final REFRESH_DOWNLOADING:I = 0x0

.field private static final REFRESH_INTERVAL:I = 0x7d0

.field private static final REMOVING_ITEM:I = 0x1

.field static final TITLE_DOWNLOADED:Ljava/lang/String; = "title_downloaded"

.field static final TITLE_DOWNLOADING:Ljava/lang/String; = "title_downloading"

.field static final VIEW_TYPE_DOWNLOADED:I = 0x2

.field static final VIEW_TYPE_DOWNLOADING:I = 0x1

.field static final VIEW_TYPE_TITLE:I = 0x0

.field static final WEIGHT_DOWNLOADED_ITEM:I = 0x4

.field static final WEIGHT_DOWNLOADED_TITLE:I = 0x3

.field static final WEIGHT_DOWNLOADING_ITEM:I = 0x1

.field static final WEIGHT_DOWNLOADING_PENDING_ITEM:I = 0x2

.field static final WEIGHT_DOWNLOADING_TITLE:I


# instance fields
.field private mActivity:Lcom/mappn/gfan/ui/DownloadManagerActivity;

.field private mContext:Landroid/content/Context;

.field private mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

.field private mDownloadManager:Lcom/mappn/gfan/common/download/DownloadManager;

.field private mDownloadingList:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mappn/gfan/common/vo/DownloadInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mInflater:Landroid/view/LayoutInflater;

.field private mIsRefreshing:Z

.field private mLastModified:J

.field private mOperationListener:Landroid/view/View$OnClickListener;

.field private mRefreshThread:Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;

.field private mRefreshTime:J

.field private mSession:Lcom/mappn/gfan/Session;

.field private mTrashList:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;",
            ">;"
        }
    .end annotation
.end field

.field private mUiHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;)V
    .locals 1

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    new-instance v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$1;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$1;-><init>(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mUiHandler:Landroid/os/Handler;

    new-instance v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$2;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$2;-><init>(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mOperationListener:Landroid/view/View$OnClickListener;

    if-nez p2, :cond_0

    new-instance v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    invoke-direct {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    :goto_0
    iput-object p1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mSession:Lcom/mappn/gfan/Session;

    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mInflater:Landroid/view/LayoutInflater;

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0, p0}, Lcom/mappn/gfan/Session;->addObserver(Ljava/util/Observer;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getDownloadManager()Lcom/mappn/gfan/common/download/DownloadManager;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDownloadManager:Lcom/mappn/gfan/common/download/DownloadManager;

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getDownloadingList()Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDownloadingList:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mTrashList:Ljava/util/HashMap;

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDownloadingList:Ljava/util/HashMap;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->onDownloadingChanged(Ljava/util/HashMap;)V

    return-void

    :cond_0
    iput-object p2, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)Lcom/mappn/gfan/ui/DownloadManagerActivity;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mActivity:Lcom/mappn/gfan/ui/DownloadManagerActivity;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)Lcom/mappn/gfan/common/download/DownloadManager;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDownloadManager:Lcom/mappn/gfan/common/download/DownloadManager;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$202(Lcom/mappn/gfan/ui/DownloadManagerAdapter;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mIsRefreshing:Z

    return p1
.end method

.method static synthetic access$300(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)J
    .locals 2

    iget-wide v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mLastModified:J

    return-wide v0
.end method

.method static synthetic access$400(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)J
    .locals 2

    iget-wide v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mRefreshTime:J

    return-wide v0
.end method

.method static synthetic access$402(Lcom/mappn/gfan/ui/DownloadManagerAdapter;J)J
    .locals 0

    iput-wide p1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mRefreshTime:J

    return-wide p1
.end method

.method static synthetic access$500(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->requestRefresh()V

    return-void
.end method

.method static synthetic access$600(Lcom/mappn/gfan/ui/DownloadManagerAdapter;Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->judgeInstallStatus(Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)V

    return-void
.end method

.method static synthetic access$700(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$800(Lcom/mappn/gfan/ui/DownloadManagerAdapter;Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->cancelDownloadItem(Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)V

    return-void
.end method

.method static synthetic access$900(Lcom/mappn/gfan/ui/DownloadManagerAdapter;)Ljava/util/HashMap;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDownloadingList:Ljava/util/HashMap;

    return-object v0
.end method

.method private bindDownloadingView(I[Landroid/view/View;Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p3, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mIcon:Ljava/lang/Object;

    instance-of v0, v0, Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1

    aget-object v0, p2, v1

    check-cast v0, Landroid/widget/ImageView;

    iget-object v1, p3, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mIcon:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/drawable/Drawable;

    invoke-static {v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->setImageView(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    :cond_0
    :goto_0
    const/4 v0, 0x1

    aget-object v0, p2, v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p3, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mAppName:Ljava/lang/CharSequence;

    invoke-static {v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->setTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    const/4 v0, 0x2

    aget-object v0, p2, v0

    check-cast v0, Landroid/widget/ProgressBar;

    iget v1, p3, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mProgress:I

    invoke-static {v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->setProgressBar(Landroid/widget/ProgressBar;I)V

    const/4 v0, 0x3

    aget-object v0, p2, v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p3, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mInfo:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->setTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    const/4 v0, 0x4

    aget-object v0, p2, v0

    check-cast v0, Landroid/widget/TextView;

    iget v1, p3, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mWeight:I

    invoke-direct {p0, p1, v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->setTextView(ILandroid/widget/TextView;I)V

    return-void

    :cond_1
    iget-object v0, p3, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mIcon:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    aget-object v0, p2, v1

    check-cast v0, Landroid/widget/ImageView;

    iget-object v1, p3, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mIcon:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->setImageView(Landroid/widget/ImageView;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private bindTitleView([Landroid/view/View;Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)V
    .locals 1

    const/4 v0, 0x0

    aget-object p0, p1, v0

    check-cast p0, Landroid/widget/TextView;

    iget-object v0, p2, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mTitle:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->setTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    const/4 v0, 0x1

    aget-object p0, p1, v0

    check-cast p0, Landroid/widget/TextView;

    iget-object v0, p2, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mInfo:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->setTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    return-void
.end method

.method private bindUninstalledView(I[Landroid/view/View;Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p3, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mIcon:Ljava/lang/Object;

    instance-of v0, v0, Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1

    aget-object v0, p2, v1

    check-cast v0, Landroid/widget/ImageView;

    iget-object v1, p3, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mIcon:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/drawable/Drawable;

    invoke-static {v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->setImageView(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    :cond_0
    :goto_0
    const/4 v0, 0x1

    aget-object v0, p2, v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p3, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mAppName:Ljava/lang/CharSequence;

    invoke-static {v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->setTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    const/4 v0, 0x2

    aget-object v0, p2, v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p3, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mInfo:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->setTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    const/4 v0, 0x3

    aget-object v0, p2, v0

    check-cast v0, Landroid/widget/TextView;

    iget v1, p3, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mWeight:I

    invoke-direct {p0, p1, v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->setTextView(ILandroid/widget/TextView;I)V

    return-void

    :cond_1
    iget-object v0, p3, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mIcon:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    aget-object v0, p2, v1

    check-cast v0, Landroid/widget/ImageView;

    iget-object v1, p3, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mIcon:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->setImageView(Landroid/widget/ImageView;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private bindView(ILandroid/view/View;I)V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    invoke-virtual {v0, p1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->getValue(I)Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    move-result-object v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/view/View;

    check-cast v0, [Landroid/view/View;

    if-nez p3, :cond_2

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->bindTitleView([Landroid/view/View;Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)V

    goto :goto_0

    :cond_2
    const/4 v2, 0x1

    if-ne p3, v2, :cond_3

    invoke-direct {p0, p1, v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->bindDownloadingView(I[Landroid/view/View;Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)V

    goto :goto_0

    :cond_3
    const/4 v2, 0x2

    if-ne p3, v2, :cond_0

    invoke-direct {p0, p1, v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->bindUninstalledView(I[Landroid/view/View;Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)V

    goto :goto_0
.end method

.method private cancelDownloadItem(Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mTrashList:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mUiHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    const/4 v1, 0x1

    iput v1, v0, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mUiHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mTrashList:Ljava/util/HashMap;

    iget-object v1, p1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit p0

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private clearNotification(J)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mContext:Landroid/content/Context;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    long-to-int v0, p1

    invoke-virtual {p0, v0}, Landroid/app/NotificationManager;->cancel(I)V

    return-void
.end method

.method private isPlaceHolder(I)Z
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->size()I

    move-result v0

    if-lt p1, v0, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    invoke-virtual {v0, p1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->getValue(I)Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    move-result-object v0

    iget v0, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mViewType:I

    if-nez v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_0
.end method

.method private judgeInstallStatus(Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)V
    .locals 3

    iget-object v0, p1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mFilePath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mContext:Landroid/content/Context;

    iget-object v1, p1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mFilePath:Ljava/lang/String;

    iget-object v2, p1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mPackageName:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->compareFileWithPathAndPkg(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mContext:Landroid/content/Context;

    new-instance v1, Ljava/io/File;

    iget-object v2, p1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mFilePath:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->installApk(Landroid/content/Context;Ljava/io/File;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mActivity:Lcom/mappn/gfan/ui/DownloadManagerActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mActivity:Lcom/mappn/gfan/ui/DownloadManagerActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    new-instance v2, Lcom/mappn/gfan/ui/DownloadManagerAdapter$3;

    invoke-direct {v2, p0, p1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$3;-><init>(Lcom/mappn/gfan/ui/DownloadManagerAdapter;Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)V

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/DialogUtil;->createComfirmDownloadDialog(Landroid/content/Context;ZLcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    goto :goto_0
.end method

.method private newView(ILandroid/view/ViewGroup;I)Landroid/view/View;
    .locals 9

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v0, 0x0

    const/4 v1, 0x0

    if-nez p3, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f030004

    invoke-virtual {v0, v1, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    new-array v1, v5, [Landroid/view/View;

    const v2, 0x7f0c000b

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v3

    const v2, 0x7f0c000c

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v4

    move-object v8, v1

    move-object v1, v0

    move-object v0, v8

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-object v1

    :cond_0
    if-ne p3, v4, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f030001

    invoke-virtual {v0, v1, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x5

    new-array v1, v1, [Landroid/view/View;

    const v2, 0x7f0c0001

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v3

    const v2, 0x7f0c0002

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v4

    const v2, 0x7f0c0004

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v5

    const v2, 0x7f0c0003

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v6

    const v2, 0x7f0c0006

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v7

    move-object v8, v1

    move-object v1, v0

    move-object v0, v8

    goto :goto_0

    :cond_1
    if-ne p3, v5, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f030005

    invoke-virtual {v0, v1, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    new-array v1, v7, [Landroid/view/View;

    const v2, 0x7f0c0001

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v3

    const v2, 0x7f0c0002

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v4

    const v2, 0x7f0c0003

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v5

    const v2, 0x7f0c0006

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v6

    move-object v8, v1

    move-object v1, v0

    move-object v0, v8

    goto :goto_0

    :cond_2
    move-object v8, v1

    move-object v1, v0

    move-object v0, v8

    goto :goto_0
.end method

.method private onDownloadingChanged(Ljava/util/HashMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mappn/gfan/common/vo/DownloadInfo;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDownloadingList:Ljava/util/HashMap;

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mLastModified:J

    iget-boolean v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mIsRefreshing:Z

    if-nez v0, :cond_0

    new-instance v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;-><init>(Lcom/mappn/gfan/ui/DownloadManagerAdapter;Lcom/mappn/gfan/ui/DownloadManagerAdapter$1;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mRefreshThread:Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mRefreshThread:Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;->setPriority(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mRefreshThread:Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$RefreshThread;->start()V

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private requestRefresh()V
    .locals 12

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDownloadingList:Ljava/util/HashMap;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    new-instance v1, Ljava/util/HashMap;

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDownloadingList:Ljava/util/HashMap;

    invoke-direct {v1, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move v11, v4

    move v4, v3

    move v3, v11

    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/DownloadInfo;

    iget-object v6, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mTrashList:Ljava/util/HashMap;

    iget-object v7, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mPackageName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    iget v6, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mProgressLevel:I

    const/16 v7, 0xc

    if-ne v6, v7, :cond_2

    new-instance v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    invoke-direct {v6}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;-><init>()V

    iget-object v0, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mPackageName:Ljava/lang/String;

    iput-object v0, v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mPackageName:Ljava/lang/String;

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mUiHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    iput-object v6, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    const/4 v6, 0x1

    iput v6, v0, Landroid/os/Message;->what:I

    iget-object v6, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mUiHandler:Landroid/os/Handler;

    invoke-virtual {v6, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_1

    :cond_2
    iget-object v6, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    iget-object v7, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mPackageName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->getValue(Ljava/lang/String;)Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    move-result-object v6

    if-nez v6, :cond_3

    new-instance v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    invoke-direct {v6}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;-><init>()V

    iget-object v7, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mAppName:Ljava/lang/String;

    iput-object v7, v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mAppName:Ljava/lang/CharSequence;

    iget-object v7, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mPackageName:Ljava/lang/String;

    iput-object v7, v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mPackageName:Ljava/lang/String;

    iget-object v7, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mKey:Ljava/lang/String;

    iput-object v7, v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mKey:Ljava/lang/String;

    iget-object v7, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mIconUrl:Ljava/lang/Object;

    iput-object v7, v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mIcon:Ljava/lang/Object;

    :cond_3
    iget v7, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    invoke-static {v7}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusRunning(I)Z

    move-result v7

    if-eqz v7, :cond_4

    add-int/lit8 v4, v4, 0x1

    const/4 v7, 0x1

    iput v7, v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mViewType:I

    const/4 v7, 0x1

    iput v7, v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mWeight:I

    iget v7, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mProgressNumber:I

    iput v7, v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mProgress:I

    iget-object v7, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mContext:Landroid/content/Context;

    iget-wide v8, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mCurrentSize:J

    long-to-float v8, v8

    iget-wide v9, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mTotalSize:J

    long-to-float v0, v9

    invoke-static {v7, v8, v0}, Lcom/mappn/gfan/common/util/Utils;->calculateRemainBytes(Landroid/content/Context;FF)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mInfo:Ljava/lang/String;

    move v0, v3

    move v3, v4

    :goto_2
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v4, v3

    move v3, v0

    goto :goto_1

    :cond_4
    iget v7, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    invoke-static {v7}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusPending(I)Z

    move-result v7

    if-eqz v7, :cond_5

    add-int/lit8 v0, v4, 0x1

    const/4 v4, 0x1

    iput v4, v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mViewType:I

    const/4 v4, 0x2

    iput v4, v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mWeight:I

    const/4 v4, -0x1

    iput v4, v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mProgress:I

    iget-object v4, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mContext:Landroid/content/Context;

    const v7, 0x7f090115

    invoke-virtual {v4, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mInfo:Ljava/lang/String;

    move v11, v3

    move v3, v0

    move v0, v11

    goto :goto_2

    :cond_5
    iget v7, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    const/16 v8, 0xc8

    if-ne v7, v8, :cond_1

    iget-object v7, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mFilePath:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_6

    new-instance v7, Ljava/io/File;

    iget-object v8, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mFilePath:Ljava/lang/String;

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_1

    :cond_6
    add-int/lit8 v3, v3, 0x1

    const/4 v7, 0x2

    iput v7, v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mViewType:I

    const/4 v7, 0x4

    iput v7, v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mWeight:I

    iget-object v0, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mFilePath:Ljava/lang/String;

    iput-object v0, v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mFilePath:Ljava/lang/String;

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mContext:Landroid/content/Context;

    const v7, 0x7f090119

    invoke-virtual {v0, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mInfo:Ljava/lang/String;

    move v0, v3

    move v3, v4

    goto :goto_2

    :cond_7
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mTrashList:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_8
    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    iget-object v7, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mPackageName:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_8

    iget-object v0, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mPackageName:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_9
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    monitor-enter p0

    :try_start_0
    iget-object v5, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mTrashList:Ljava/util/HashMap;

    invoke-virtual {v5, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit p0

    goto :goto_4

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_a
    if-lez v4, :cond_b

    new-instance v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    invoke-direct {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;-><init>()V

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mContext:Landroid/content/Context;

    const v5, 0x7f090118

    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mTitle:Ljava/lang/String;

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mContext:Landroid/content/Context;

    const v5, 0x7f090112

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v6, v7

    invoke-virtual {v1, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mInfo:Ljava/lang/String;

    const/4 v1, 0x0

    iput v1, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mViewType:I

    const/4 v1, 0x0

    iput v1, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mWeight:I

    const-string v1, "title_downloading"

    iput-object v1, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mPackageName:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_5
    if-lez v3, :cond_c

    new-instance v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    invoke-direct {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;-><init>()V

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mContext:Landroid/content/Context;

    const v4, 0x7f090117

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mTitle:Ljava/lang/String;

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mContext:Landroid/content/Context;

    const v4, 0x7f090112

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v5, v6

    invoke-virtual {v1, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mInfo:Ljava/lang/String;

    const/4 v1, 0x0

    iput v1, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mViewType:I

    const/4 v1, 0x3

    iput v1, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mWeight:I

    const-string v1, "title_downloaded"

    iput-object v1, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mPackageName:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_6
    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mUiHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x0

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object v2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mUiHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    :cond_b
    new-instance v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    invoke-direct {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;-><init>()V

    const-string v1, "title_downloading"

    iput-object v1, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mPackageName:Ljava/lang/String;

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mUiHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    const/4 v0, 0x1

    iput v0, v1, Landroid/os/Message;->what:I

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mUiHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_5

    :cond_c
    new-instance v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    invoke-direct {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;-><init>()V

    const-string v1, "title_downloaded"

    iput-object v1, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mPackageName:Ljava/lang/String;

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mUiHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    const/4 v0, 0x1

    iput v0, v1, Landroid/os/Message;->what:I

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mUiHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_6
.end method

.method private static setImageView(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V
    .locals 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method private setImageView(Landroid/widget/ImageView;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mContext:Landroid/content/Context;

    invoke-static {v0, p2, p1}, Lcom/mappn/gfan/common/util/ImageUtils;->download(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V

    return-void
.end method

.method private static setProgressBar(Landroid/widget/ProgressBar;I)V
    .locals 2

    const/4 v1, 0x0

    if-gez p1, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    invoke-virtual {p0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0, v1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    invoke-virtual {p0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    invoke-virtual {p0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0
.end method

.method private setTextView(ILandroid/widget/TextView;I)V
    .locals 4

    const/4 v1, 0x4

    const/4 v3, 0x0

    const/4 v2, 0x0

    if-ne v1, p3, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    invoke-virtual {v0, p1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->getValue(I)Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    move-result-object v0

    iget-object v0, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mFilePath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const v0, 0x7f090071

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020034

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p2, v2, v0, v2, v2}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mOperationListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setFocusable(Z)V

    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setFocusableInTouchMode(Z)V

    return-void

    :cond_1
    const/4 v0, 0x1

    if-eq v0, p3, :cond_2

    const/4 v0, 0x2

    if-ne v0, p3, :cond_3

    :cond_2
    const v0, 0x7f09011a

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f02000b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p2, v2, v0, v2, v2}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_3
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method

.method private static setTextView(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    return-void

    :cond_0
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public clearData()V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->clear()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method close()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0, p0}, Lcom/mappn/gfan/Session;->deleteObserver(Ljava/util/Observer;)V

    iput-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDownloadingList:Ljava/util/HashMap;

    iput-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDownloadManager:Lcom/mappn/gfan/common/download/DownloadManager;

    return-void
.end method

.method delApp(I)V
    .locals 7

    const/4 v6, 0x1

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    invoke-virtual {v0, p1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->getValue(I)Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v0, v1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mFilePath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/File;

    iget-object v2, v1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mFilePath:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    iget-wide v2, v1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mId:J

    invoke-direct {p0, v2, v3}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->clearNotification(J)V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDownloadingList:Ljava/util/HashMap;

    iget-object v2, v1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/DownloadInfo;

    const/16 v2, 0x10e

    iput v2, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDownloadManager:Lcom/mappn/gfan/common/download/DownloadManager;

    const/4 v2, 0x1

    new-array v2, v2, [J

    const/4 v3, 0x0

    iget-wide v4, v1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mId:J

    aput-wide v4, v2, v3

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/download/DownloadManager;->remove([J)V

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mUiHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput v6, v0, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mUiHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    invoke-virtual {v0, p1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->getValue(I)Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    invoke-virtual {v0, p1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->getValue(I)Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x2

    :goto_0
    return v0

    :cond_0
    iget v0, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mViewType:I

    goto :goto_0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    invoke-virtual {v0, p1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->getValue(I)Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    move-result-object v0

    iget v0, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mViewType:I

    if-nez p2, :cond_0

    invoke-direct {p0, p1, p3, v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->newView(ILandroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object v1

    :goto_0
    invoke-direct {p0, p1, v1, v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->bindView(ILandroid/view/View;I)V

    return-object v1

    :cond_0
    move-object v1, p2

    goto :goto_0
.end method

.method public getViewTypeCount()I
    .locals 1

    const/4 v0, 0x3

    return v0
.end method

.method installAppWithPackageName(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    invoke-virtual {v0, p1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->getValue(Ljava/lang/String;)Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    move-result-object v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->isAutoDelete()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mFilePath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Ljava/io/File;

    iget-object v2, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mFilePath:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_1
    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mUiHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    const/4 v0, 0x1

    iput v0, v1, Landroid/os/Message;->what:I

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mUiHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mDataSource:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->size()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    invoke-super {p0}, Landroid/widget/BaseAdapter;->isEmpty()Z

    move-result v0

    goto :goto_0
.end method

.method public isEnabled(I)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->isPlaceHolder(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setActivity(Lcom/mappn/gfan/ui/DownloadManagerActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->mActivity:Lcom/mappn/gfan/ui/DownloadManagerActivity;

    return-void
.end method

.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .locals 1

    instance-of v0, p2, Ljava/util/HashMap;

    if-eqz v0, :cond_0

    check-cast p2, Ljava/util/HashMap;

    invoke-direct {p0, p2}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->onDownloadingChanged(Ljava/util/HashMap;)V

    :cond_0
    return-void
.end method
