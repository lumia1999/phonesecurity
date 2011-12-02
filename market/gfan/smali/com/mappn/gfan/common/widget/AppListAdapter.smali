.class public Lcom/mappn/gfan/common/widget/AppListAdapter;
.super Landroid/widget/BaseAdapter;

# interfaces
.implements Ljava/util/Observer;
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/common/widget/AppListAdapter$LazyloadListener;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mCheckChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field private mCheckedList:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private mComparator:Ljava/util/Comparator;

.field private mContext:Landroid/content/Context;

.field private mDataSource:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private mDividerResource:I

.field private mDownloadExtraInfo:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private mDownloadListener:Landroid/view/View$OnClickListener;

.field private mDownloadManager:Lcom/mappn/gfan/common/download/DownloadManager;

.field private mDownloadingTask:Ljava/util/HashMap;
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

.field private mFrom:[Ljava/lang/String;

.field private mHasGroup:Z

.field private mIconCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mInflater:Landroid/view/LayoutInflater;

.field private mInstalledList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mIsAllDisabled:Z

.field private mIsLazyLoad:Z

.field private mIsNeedSort:Z

.field private mIsProductList:Z

.field private mIsRankList:Z

.field private mLazyloadListener:Lcom/mappn/gfan/common/widget/AppListAdapter$LazyloadListener;

.field private mResource:I

.field private mSession:Lcom/mappn/gfan/Session;

.field private mTo:[I

.field private mUpdateList:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mappn/gfan/common/vo/UpgradeInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/mappn/gfan/common/widget/AppListAdapter;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;I[Ljava/lang/String;[I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;I[",
            "Ljava/lang/String;",
            "[I)V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    new-instance v0, Lcom/mappn/gfan/common/widget/AppListAdapter$1;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/common/widget/AppListAdapter$1;-><init>(Lcom/mappn/gfan/common/widget/AppListAdapter;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mCheckChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    new-instance v0, Lcom/mappn/gfan/common/widget/AppListAdapter$2;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/common/widget/AppListAdapter$2;-><init>(Lcom/mappn/gfan/common/widget/AppListAdapter;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDownloadListener:Landroid/view/View$OnClickListener;

    if-nez p2, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    :cond_0
    :goto_0
    iput-object p1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mContext:Landroid/content/Context;

    iput p3, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mResource:I

    iput-object p4, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mFrom:[Ljava/lang/String;

    iput-object p5, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mTo:[I

    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mInflater:Landroid/view/LayoutInflater;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mCheckedList:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIconCache:Ljava/util/HashMap;

    invoke-static {p1}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mSession:Lcom/mappn/gfan/Session;

    return-void

    :cond_1
    iput-object p2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    iget-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIsNeedSort:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mComparator:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/mappn/gfan/common/widget/AppListAdapter;)Ljava/util/ArrayList;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mappn/gfan/common/widget/AppListAdapter;)Ljava/util/HashMap;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mCheckedList:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mappn/gfan/common/widget/AppListAdapter;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mappn/gfan/common/widget/AppListAdapter;)Landroid/app/Activity;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mappn/gfan/common/widget/AppListAdapter;Ljava/util/HashMap;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->startDownload(Ljava/util/HashMap;)V

    return-void
.end method

.method static synthetic access$500(Lcom/mappn/gfan/common/widget/AppListAdapter;)Ljava/util/HashMap;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDownloadingTask:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mappn/gfan/common/widget/AppListAdapter;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$700(Lcom/mappn/gfan/common/widget/AppListAdapter;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIsNeedSort:Z

    return v0
.end method

.method private bindView(ILandroid/view/View;)V
    .locals 9

    const/4 v8, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    if-nez v0, :cond_1

    :cond_0
    return-void

    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/view/View;

    check-cast v1, [Landroid/view/View;

    iget-object v4, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mFrom:[Ljava/lang/String;

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mTo:[I

    array-length v5, v2

    move v6, v8

    :goto_0
    if-ge v6, v5, :cond_0

    aget-object v2, v1, v6

    if-eqz v2, :cond_2

    aget-object v3, v4, v6

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_3

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    :goto_1
    add-int/lit8 v2, v6, 0x1

    move v6, v2

    goto :goto_0

    :cond_3
    invoke-virtual {v2, v8}, Landroid/view/View;->setVisibility(I)V

    instance-of v7, v2, Landroid/widget/Checkable;

    if-eqz v7, :cond_5

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    instance-of v7, v3, Ljava/lang/Boolean;

    if-eqz v7, :cond_4

    check-cast v2, Landroid/widget/Checkable;

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-interface {v2, v3}, Landroid/widget/Checkable;->setChecked(Z)V

    goto :goto_1

    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " should be bound to a Boolean, not a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    instance-of v7, v2, Landroid/widget/Button;

    if-eqz v7, :cond_6

    invoke-virtual {v2, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_1

    :cond_6
    instance-of v7, v2, Landroid/widget/ImageButton;

    if-nez v7, :cond_2

    instance-of v7, v2, Landroid/widget/ImageView;

    if-eqz v7, :cond_7

    check-cast v2, Landroid/widget/ImageView;

    invoke-direct {p0, p1, v2, v3}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setViewImage(ILandroid/widget/ImageView;Ljava/lang/Object;)V

    goto :goto_1

    :cond_7
    instance-of v7, v2, Landroid/widget/RatingBar;

    if-eqz v7, :cond_8

    check-cast v2, Landroid/widget/RatingBar;

    invoke-direct {p0, v2, v3}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setViewRating(Landroid/widget/RatingBar;Ljava/lang/Object;)V

    goto :goto_1

    :cond_8
    instance-of v7, v2, Landroid/widget/TextView;

    if-eqz v7, :cond_9

    check-cast v2, Landroid/widget/TextView;

    invoke-direct {p0, p1, v2, v3}, Lcom/mappn/gfan/common/widget/AppListAdapter;->setViewText(ILandroid/widget/TextView;Ljava/lang/Object;)V

    goto :goto_1

    :cond_9
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " view that can be bounds by this SimpleAdapter"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private isPlaceHolder(I)Z
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/HashMap;

    const-string v0, "place_holder"

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method private newView(ILandroid/view/ViewGroup;)Landroid/view/View;
    .locals 8

    const/4 v6, 0x0

    iget-boolean v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mHasGroup:Z

    if-eqz v1, :cond_1

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->isPlaceHolder(I)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mInflater:Landroid/view/LayoutInflater;

    iget v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDividerResource:I

    invoke-virtual {v1, v2, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    move-object v2, v1

    :goto_0
    iget-object v3, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mTo:[I

    array-length v4, v3

    new-array v5, v4, [Landroid/view/View;

    :goto_1
    if-ge v6, v4, :cond_2

    aget v1, v3, v6

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    aput-object v1, v5, v6

    const v1, 0x7f0c0022

    aget v7, v3, v6

    if-ne v1, v7, :cond_0

    aget-object v1, v5, v6

    if-eqz v1, :cond_0

    aget-object v1, v5, v6

    check-cast v1, Landroid/widget/CheckBox;

    iget-object v7, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mCheckChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v1, v7}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    :cond_0
    add-int/lit8 v1, v6, 0x1

    move v6, v1

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mInflater:Landroid/view/LayoutInflater;

    iget v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mResource:I

    invoke-virtual {v1, v2, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Landroid/view/ViewGroup;

    move-object v1, v0

    const/high16 v3, 0x6

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    goto :goto_0

    :cond_2
    invoke-virtual {v2, v5}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-object v2
.end method

.method private setViewImage(ILandroid/widget/ImageView;Ljava/lang/Object;)V
    .locals 2

    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_0
    instance-of v0, p3, Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_2

    check-cast p3, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    instance-of v0, p3, Ljava/lang/String;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mContext:Landroid/content/Context;

    check-cast p3, Ljava/lang/String;

    invoke-static {v0, p3, p2}, Lcom/mappn/gfan/common/util/ImageUtils;->download(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V

    goto :goto_0

    :cond_3
    instance-of v0, p3, Ljava/lang/Boolean;

    if-eqz v0, :cond_5

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    :cond_4
    const/4 v0, 0x4

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    :cond_5
    instance-of v0, p3, Landroid/content/pm/PackageInfo;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mContext:Landroid/content/Context;

    check-cast p3, Landroid/content/pm/PackageInfo;

    const v1, 0x7f02006e

    invoke-static {v0, p3, p2, v1}, Lcom/mappn/gfan/common/util/ImageUtils;->download(Landroid/content/Context;Landroid/content/pm/PackageInfo;Landroid/widget/ImageView;I)V

    goto :goto_0
.end method

.method private setViewRating(Landroid/widget/RatingBar;Ljava/lang/Object;)V
    .locals 2

    instance-of v0, p2, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x4120

    div-float/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/widget/RatingBar;->setRating(F)V

    :cond_0
    return-void
.end method

.method private setViewText(ILandroid/widget/TextView;Ljava/lang/Object;)V
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    instance-of v0, p3, [B

    if-eqz v0, :cond_1

    check-cast p3, [B

    check-cast p3, [B

    invoke-static {p3}, Lcom/mappn/gfan/common/util/Utils;->getUTF8String([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    instance-of v0, p3, Ljava/lang/CharSequence;

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIsRankList:Z

    if-eqz v0, :cond_2

    invoke-virtual {p2}, Landroid/widget/TextView;->getId()I

    move-result v0

    const v1, 0x7f0c0002

    if-ne v0, v1, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ". "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    check-cast p3, Ljava/lang/CharSequence;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_2
    check-cast p3, Ljava/lang/CharSequence;

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_3
    instance-of v0, p3, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const v1, 0x7f02000d

    invoke-virtual {p2, v2, v1, v2, v2}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    invoke-virtual {p2}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v1

    aget-object v1, v1, v4

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "price"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_1
    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDownloadListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    :cond_4
    if-ne v4, v0, :cond_5

    const v0, 0x7f090070

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    :cond_5
    const/16 v1, 0x9

    if-ne v1, v0, :cond_6

    const v0, 0x7f090071

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    :cond_6
    const/16 v1, 0xb

    if-ne v1, v0, :cond_8

    iget-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIsNeedSort:Z

    if-eqz v0, :cond_7

    const v0, 0x7f09011b

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020019

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p2, v3, v0, v3, v3}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    :cond_7
    const v0, 0x7f090073

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    :cond_8
    const/16 v1, 0xa

    if-ne v1, v0, :cond_9

    const v0, 0x7f09011c

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    :cond_9
    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "info"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method private startDownload(Ljava/util/HashMap;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mContext:Landroid/content/Context;

    const v2, 0x7f0900a4

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    :goto_0
    return-void

    :cond_0
    const-string v0, "packagename"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "p_id"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "ldpi_icon_url"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "product_download"

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIconCache:Ljava/util/HashMap;

    invoke-virtual {v3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mContext:Landroid/content/Context;

    const-string v2, "0"

    invoke-static {v0, p0, v1, v2}, Lcom/mappn/gfan/common/MarketAPI;->getDownloadUrl(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDownloadExtraInfo:Ljava/util/HashMap;

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->notifyDataSetChanged()V

    goto :goto_0
.end method


# virtual methods
.method public addData(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getCount()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    iget-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIsNeedSort:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mComparator:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_0
    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->notifyDataSetChanged()V

    :cond_1
    return-void
.end method

.method public addData(Ljava/util/HashMap;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const/4 v6, 0x1

    const/4 v5, 0x0

    if-eqz p1, :cond_2

    iget-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIsNeedSort:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v3, v5

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "packagename"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "packagename"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    add-int/lit8 v3, v3, 0x1

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v6

    move v1, v3

    :goto_0
    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    sub-int/2addr v1, v6

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getCount()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->notifyDataSetInvalidated()V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mComparator:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_2
    :goto_1
    return-void

    :cond_3
    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getCount()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->notifyDataSetChanged()V

    goto :goto_1

    :cond_4
    move v0, v5

    move v1, v3

    goto :goto_0
.end method

.method public areAllItemsEnabled()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public clearData()V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method public getCheckedList()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mCheckedList:Ljava/util/HashMap;

    return-object v0
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

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

    iget-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mHasGroup:Z

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->isPlaceHolder(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9

    const/4 v4, 0x1

    const/16 v8, 0xb

    const/16 v7, 0xa

    const/4 v6, 0x0

    iget-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIsLazyLoad:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mLazyloadListener:Lcom/mappn/gfan/common/widget/AppListAdapter$LazyloadListener;

    invoke-interface {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter$LazyloadListener;->isEnd()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getCount()I

    move-result v0

    const/4 v1, 0x4

    sub-int/2addr v0, v1

    if-ne p1, v0, :cond_1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mLazyloadListener:Lcom/mappn/gfan/common/widget/AppListAdapter$LazyloadListener;

    invoke-interface {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter$LazyloadListener;->isLoadOver()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mLazyloadListener:Lcom/mappn/gfan/common/widget/AppListAdapter$LazyloadListener;

    invoke-interface {v0}, Lcom/mappn/gfan/common/widget/AppListAdapter$LazyloadListener;->lazyload()V

    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-boolean v0, Lcom/mappn/gfan/common/widget/AppListAdapter;->$assertionsDisabled:Z

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->getCount()I

    move-result v0

    if-lt p1, v0, :cond_2

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_2
    if-nez p2, :cond_4

    invoke-direct {p0, p1, p3}, Lcom/mappn/gfan/common/widget/AppListAdapter;->newView(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    :goto_0
    iget-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIsProductList:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDownloadingTask:Ljava/util/HashMap;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "packagename"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDownloadingTask:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDownloadingTask:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mappn/gfan/common/vo/DownloadInfo;

    const-string v4, "info"

    iget-object v5, v2, Lcom/mappn/gfan/common/vo/DownloadInfo;->mProgress:Ljava/lang/String;

    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v4, v2, Lcom/mappn/gfan/common/vo/DownloadInfo;->mProgressLevel:I

    if-ne v4, v8, :cond_5

    const-string v1, "product_download"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    :goto_1
    invoke-direct {p0, p1, v3}, Lcom/mappn/gfan/common/widget/AppListAdapter;->bindView(ILandroid/view/View;)V

    return-object v3

    :cond_4
    move-object v3, p2

    goto :goto_0

    :cond_5
    iget v4, v2, Lcom/mappn/gfan/common/vo/DownloadInfo;->mProgressLevel:I

    const/16 v5, 0xc

    if-ne v4, v5, :cond_7

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mUpdateList:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    const-string v2, "rsa_md5"

    iget-object v4, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mUpdateList:Ljava/util/HashMap;

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mappn/gfan/common/vo/UpgradeInfo;

    iget-object v1, v1, Lcom/mappn/gfan/common/vo/UpgradeInfo;->signature:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "product_download"

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_6
    const-string v1, "product_download"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_7
    iget-object v4, v2, Lcom/mappn/gfan/common/vo/DownloadInfo;->mFilePath:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_9

    new-instance v4, Ljava/io/File;

    iget-object v5, v2, Lcom/mappn/gfan/common/vo/DownloadInfo;->mFilePath:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_9

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mUpdateList:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    const-string v2, "rsa_md5"

    iget-object v4, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mUpdateList:Ljava/util/HashMap;

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mappn/gfan/common/vo/UpgradeInfo;

    iget-object v1, v1, Lcom/mappn/gfan/common/vo/UpgradeInfo;->signature:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "product_download"

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_8
    const-string v1, "product_download"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_9
    const-string v1, "product_download"

    iget v2, v2, Lcom/mappn/gfan/common/vo/DownloadInfo;->mProgressLevel:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    :cond_a
    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mInstalledList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mUpdateList:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    const-string v2, "product_download"

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "rsa_md5"

    iget-object v4, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mUpdateList:Ljava/util/HashMap;

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mappn/gfan/common/vo/UpgradeInfo;

    iget-object v1, v1, Lcom/mappn/gfan/common/vo/UpgradeInfo;->signature:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    :cond_b
    const-string v1, "product_download"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    :cond_c
    const-string v1, "product_download"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_3

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, v4, :cond_d

    const-string v1, "product_download"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    :cond_d
    const/16 v2, 0x9

    if-eq v1, v2, :cond_e

    const-string v1, "product_download"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    :cond_e
    const-string v1, "product_download"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1
.end method

.method public getViewTypeCount()I
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mHasGroup:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public insertData(Ljava/util/HashMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIsNeedSort:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mComparator:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_0
    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->notifyDataSetChanged()V

    :cond_1
    return-void
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

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
    .locals 3

    const/4 v2, 0x1

    const/4 v1, 0x0

    iget-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIsAllDisabled:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    iget-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mHasGroup:Z

    if-eqz v0, :cond_2

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->isPlaceHolder(I)Z

    move-result v0

    if-nez v0, :cond_1

    move v0, v2

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    move v0, v2

    goto :goto_0
.end method

.method public onError(II)V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mContext:Landroid/content/Context;

    const v2, 0x7f0900a3

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 5

    const/4 v4, 0x0

    packed-switch p1, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    check-cast p2, Lcom/mappn/gfan/common/vo/DownloadItem;

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDownloadingTask:Ljava/util/HashMap;

    iget-object v1, p2, Lcom/mappn/gfan/common/vo/DownloadItem;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDownloadExtraInfo:Ljava/util/HashMap;

    iget-object v1, p2, Lcom/mappn/gfan/common/vo/DownloadItem;->pId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    new-instance v1, Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v2, p2, Lcom/mappn/gfan/common/vo/DownloadItem;->url:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mappn/gfan/common/download/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    const-string v2, "name"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setTitle(Ljava/lang/CharSequence;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v0, p2, Lcom/mappn/gfan/common/vo/DownloadItem;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setPackageName(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIconCache:Ljava/util/HashMap;

    iget-object v2, p2, Lcom/mappn/gfan/common/vo/DownloadItem;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setIconUrl(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    invoke-virtual {v1, v4}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setSourceType(I)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v0, p2, Lcom/mappn/gfan/common/vo/DownloadItem;->fileMD5:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setMD5(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDownloadManager:Lcom/mappn/gfan/common/download/DownloadManager;

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v1, v3}, Lcom/mappn/gfan/common/download/DownloadManager;->enqueue(Landroid/content/Context;Lcom/mappn/gfan/common/download/DownloadManager$Request;Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mContext:Landroid/content/Context;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v2, v1, v4

    const/4 v2, 0x1

    const-string v3, "\u4e0b\u8f7d\u5f00\u59cb"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mContext:Landroid/content/Context;

    iget-object v1, p2, Lcom/mappn/gfan/common/vo/DownloadItem;->url:Ljava/lang/String;

    iget-object v2, p2, Lcom/mappn/gfan/common/vo/DownloadItem;->packageName:Ljava/lang/String;

    invoke-static {v0, v4, v4, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->submitDownloadLog(Landroid/content/Context;IILjava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mContext:Landroid/content/Context;

    const v2, 0x7f090077

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v4}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0xf
        :pswitch_0
    .end packed-switch
.end method

.method public removeData(I)V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method public removeData(Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method public removeDataWithPackageName(Ljava/lang/String;)V
    .locals 6

    const/4 v5, 0x1

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move v2, v4

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    add-int/lit8 v2, v2, 0x1

    const-string v3, "packagename"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v5

    move v1, v2

    :goto_1
    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    sub-int/2addr v1, v5

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_2
    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->notifyDataSetChanged()V

    goto :goto_0

    :cond_3
    move v0, v4

    move v1, v2

    goto :goto_1
.end method

.method public setActivity(Landroid/app/Activity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mActivity:Landroid/app/Activity;

    return-void
.end method

.method public setAllDisabled()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIsAllDisabled:Z

    return-void
.end method

.method public setContainsPlaceHolder(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mHasGroup:Z

    return-void
.end method

.method public setLazyloadListener(Lcom/mappn/gfan/common/widget/AppListAdapter$LazyloadListener;)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIsLazyLoad:Z

    iput-object p1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mLazyloadListener:Lcom/mappn/gfan/common/widget/AppListAdapter$LazyloadListener;

    return-void
.end method

.method public setNeedSort(Ljava/util/Comparator;)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIsNeedSort:Z

    iput-object p1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mComparator:Ljava/util/Comparator;

    return-void
.end method

.method public setPlaceHolderResource(I)V
    .locals 0

    iput p1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDividerResource:I

    return-void
.end method

.method public setProductList()V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIsProductList:Z

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/mappn/gfan/Session;->addObserver(Ljava/util/Observer;)V

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getDownloadManager()Lcom/mappn/gfan/common/download/DownloadManager;

    move-result-object v1

    iput-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDownloadManager:Lcom/mappn/gfan/common/download/DownloadManager;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getInstalledApps()Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mInstalledList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getDownloadingList()Ljava/util/HashMap;

    move-result-object v1

    iput-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDownloadingTask:Ljava/util/HashMap;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUpdateList()Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mUpdateList:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDownloadExtraInfo:Ljava/util/HashMap;

    return-void
.end method

.method public setRankList()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mIsRankList:Z

    return-void
.end method

.method protected setViewResource(Landroid/view/View;I[I)V
    .locals 1

    instance-of v0, p1, Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    aget v0, p3, v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_0
    return-void
.end method

.method public sort()V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mComparator:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .locals 1

    instance-of v0, p2, Ljava/util/HashMap;

    if-eqz v0, :cond_1

    check-cast p2, Ljava/util/HashMap;

    iput-object p2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDownloadingTask:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->notifyDataSetChanged()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    instance-of v0, p2, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->notifyDataSetChanged()V

    goto :goto_0
.end method

.method public updateAll()V
    .locals 5

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "packagename"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mUpdateList:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mUpdateList:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mappn/gfan/common/vo/UpgradeInfo;

    iget-object v4, v2, Lcom/mappn/gfan/common/vo/UpgradeInfo;->filePath:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    new-instance v4, Ljava/io/File;

    iget-object v2, v2, Lcom/mappn/gfan/common/vo/UpgradeInfo;->filePath:Ljava/lang/String;

    invoke-direct {v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    :cond_1
    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDownloadingTask:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/AppListAdapter;->mDownloadingTask:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mappn/gfan/common/vo/DownloadInfo;

    iget v1, v1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    invoke-static {v1}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusRunning(I)Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/widget/AppListAdapter;->startDownload(Ljava/util/HashMap;)V

    goto :goto_0

    :cond_3
    return-void
.end method
