.class public Lcom/mappn/gfan/ui/ProductDetailActivity;
.super Lcom/mappn/gfan/common/widget/BaseTabActivity;

# interfaces
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;
.implements Ljava/util/Observer;


# static fields
.field private static final DIALOG_NO_BALANCE:I = 0x2

.field private static final DIALOG_PURCHASE:I = 0x1


# instance fields
.field private mDownloadButton:Landroid/widget/ImageButton;

.field private mIsInstalled:Z

.field private mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

.field private mTabHost:Landroid/widget/TabHost;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseTabActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/mappn/gfan/ui/ProductDetailActivity;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mIsInstalled:Z

    return v0
.end method

.method static synthetic access$100(Lcom/mappn/gfan/ui/ProductDetailActivity;)Lcom/mappn/gfan/common/vo/ProductDetail;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mappn/gfan/ui/ProductDetailActivity;)Landroid/widget/ImageButton;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mDownloadButton:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mappn/gfan/ui/ProductDetailActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method private static createTabView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;
    .locals 3

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030037

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p0
.end method

.method private initAppInfo(Lcom/mappn/gfan/common/vo/ProductDetail;)V
    .locals 8

    const/4 v7, 0x0

    const/4 v6, 0x1

    const v0, 0x7f0c008e

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPayCategory()I

    move-result v2

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getDownloadingList()Ljava/util/HashMap;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mappn/gfan/common/vo/DownloadInfo;

    iget v4, v1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    invoke-static {v4}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusInformational(I)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mDownloadButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v7}, Landroid/widget/ImageButton;->setEnabled(Z)V

    const v1, 0x7f090070

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget v4, v1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    const/16 v5, 0xc8

    if-ne v4, v5, :cond_3

    new-instance v4, Ljava/io/File;

    iget-object v5, v1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mFilePath:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mDownloadButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, v6}, Landroid/widget/ImageButton;->setEnabled(Z)V

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    iget-object v1, v1, Lcom/mappn/gfan/common/vo/DownloadInfo;->mFilePath:Ljava/lang/String;

    invoke-virtual {v2, v1}, Lcom/mappn/gfan/common/vo/ProductDetail;->setFilePath(Ljava/lang/String;)V

    const v1, 0x7f090071

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mDownloadButton:Landroid/widget/ImageButton;

    const v1, 0x7f02000e

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setBackgroundResource(I)V

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    :goto_1
    if-eqz v1, :cond_5

    iget v1, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getVersionCode()I

    move-result v2

    if-le v2, v1, :cond_4

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mDownloadButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v6}, Landroid/widget/ImageButton;->setEnabled(Z)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mDownloadButton:Landroid/widget/ImageButton;

    const v2, 0x7f02000c

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setImageResource(I)V

    const v1, 0x7f090049

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :catch_0
    move-exception v1

    move-object v1, v3

    goto :goto_1

    :cond_4
    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mDownloadButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v6}, Landroid/widget/ImageButton;->setEnabled(Z)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mDownloadButton:Landroid/widget/ImageButton;

    const v2, 0x7f020012

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setImageResource(I)V

    const v1, 0x7f09004a

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iput-boolean v6, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mIsInstalled:Z

    goto :goto_0

    :cond_5
    if-ne v6, v2, :cond_6

    const v1, 0x7f0900cb

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto/16 :goto_0

    :cond_6
    const/4 v1, 0x2

    if-ne v1, v2, :cond_0

    const v1, 0x7f09004b

    new-array v2, v6, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPrice()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-virtual {p0, v1, v2}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0
.end method

.method private initTab(Lcom/mappn/gfan/common/vo/ProductDetail;)V
    .locals 6

    const v5, 0x7f09004d

    const v2, 0x7f09004c

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getTabHost()Landroid/widget/TabHost;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mTabHost:Landroid/widget/TabHost;

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->setup()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mappn/gfan/ui/ProductDetailActivity;->createTabView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/mappn/gfan/ui/ProductInfoActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "extra.product.detail"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getCommentsCount()I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getCommentsCount()I

    move-result v1

    :goto_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v3, v4

    invoke-virtual {p0, v5, v3}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/mappn/gfan/ui/ProductDetailActivity;->createTabView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/mappn/gfan/ui/ProductCommentActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "extra.product.detail"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    const-string v0, "1"

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getSourceType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/widget/TabWidget;->setEnabled(Z)V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0, v4}, Landroid/widget/TabHost;->setCurrentTab(I)V

    return-void

    :cond_1
    move v1, v4

    goto :goto_0
.end method

.method private initTopBar(Lcom/mappn/gfan/common/vo/ProductDetail;)V
    .locals 5

    const/4 v4, 0x1

    const v0, 0x7f0c0016

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mDownloadButton:Landroid/widget/ImageButton;

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mDownloadButton:Landroid/widget/ImageButton;

    new-instance v1, Lcom/mappn/gfan/ui/ProductDetailActivity$1;

    invoke-direct {v1, p0, p1}, Lcom/mappn/gfan/ui/ProductDetailActivity$1;-><init>(Lcom/mappn/gfan/ui/ProductDetailActivity;Lcom/mappn/gfan/common/vo/ProductDetail;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0c0010

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getIconUrl()Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f02006e

    invoke-static {v1, v2, v0, v3, v4}, Lcom/mappn/gfan/common/util/ImageUtils;->download(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;IZ)V

    const v0, 0x7f0c008d

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0c008c

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getAuthorName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0c008f

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f090048

    new-array v2, v4, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getRatingCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0c004e

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RatingBar;

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getRating()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x4120

    div-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/RatingBar;->setRating(F)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->initAppInfo(Lcom/mappn/gfan/common/vo/ProductDetail;)V

    return-void
.end method

.method private startDownload(Lcom/mappn/gfan/common/vo/DownloadItem;)V
    .locals 5

    const/4 v4, 0x0

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v1, p1, Lcom/mappn/gfan/common/vo/DownloadItem;->url:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setPackageName(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setTitle(Ljava/lang/CharSequence;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getIconUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setIconUrl(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v1, p1, Lcom/mappn/gfan/common/vo/DownloadItem;->fileMD5:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setMD5(Ljava/lang/String;)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    invoke-virtual {v0, v4}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->setSourceType(I)Lcom/mappn/gfan/common/download/DownloadManager$Request;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getDownloadManager()Lcom/mappn/gfan/common/download/DownloadManager;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, v3}, Lcom/mappn/gfan/common/download/DownloadManager;->enqueue(Landroid/content/Context;Lcom/mappn/gfan/common/download/DownloadManager$Request;Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900be

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v4}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u4e0b\u8f7d\u65e5\u5fd7"

    aput-object v2, v1, v4

    const/4 v2, 0x1

    const-string v3, "\u4e0b\u8f7d\u5f00\u59cb"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p1, Lcom/mappn/gfan/common/vo/DownloadItem;->url:Ljava/lang/String;

    iget-object v2, p1, Lcom/mappn/gfan/common/vo/DownloadItem;->packageName:Ljava/lang/String;

    invoke-static {v0, v4, v4, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->submitDownloadLog(Landroid/content/Context;IILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method changeCommentCount(I)V
    .locals 5

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/TabWidget;->getChildTabViewAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f09004d

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public download()V
    .locals 6

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v5, [Ljava/lang/String;

    const-string v2, "\u8be6\u60c5"

    aput-object v2, v1, v3

    const-string v2, "\u70b9\u51fb\u4e0b\u8f7d\u6216\u66f4\u65b0"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPayCategory()I

    move-result v0

    if-ne v5, v0, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isLogin()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPid()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/DBUtils;->isBought(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/ui/ProductDetailActivity;->showDialog(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/LoginActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/vo/ProductDetail;->getFilePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getDownloadingList()Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f09004e

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v3}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->getRsaMd5()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->isSameSign(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPid()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->getSourceType()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, p0, v1, v2}, Lcom/mappn/gfan/common/MarketAPI;->getDownloadUrl(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mDownloadButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto :goto_0

    :cond_4
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/mappn/gfan/ui/ProductDetailActivity$2;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/ProductDetailActivity$2;-><init>(Lcom/mappn/gfan/ui/ProductDetailActivity;)V

    invoke-static {p0, v4, v0}, Lcom/mappn/gfan/common/util/DialogUtil;->createComfirmDownloadDialog(Landroid/content/Context;ZLcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    goto :goto_0

    :cond_5
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getFilePath()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->compareFileWithPathAndPkg(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->getFilePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->installApk(Landroid/content/Context;Ljava/io/File;)V

    goto/16 :goto_0

    :cond_6
    new-instance v0, Lcom/mappn/gfan/ui/ProductDetailActivity$3;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/ProductDetailActivity$3;-><init>(Lcom/mappn/gfan/ui/ProductDetailActivity;)V

    invoke-static {p0, v3, v0}, Lcom/mappn/gfan/common/util/DialogUtil;->createComfirmDownloadDialog(Landroid/content/Context;ZLcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    goto/16 :goto_0
.end method

.method public gotoDepositPage()V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getDefaultChargeType()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/ChargeTypeListActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "payment"

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPrice()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->startActivity(Landroid/content/Intent;)V

    :goto_0
    return-void

    :cond_0
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "type"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "payment"

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPrice()I

    move-result v2

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ProductDetailActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f030020

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v0, "extra.product.detail"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/ProductDetail;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->initTopBar(Lcom/mappn/gfan/common/vo/ProductDetail;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->initTab(Lcom/mappn/gfan/common/vo/ProductDetail;)V

    const-string v0, "is_buy"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->showDialog(I)V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0, p0}, Lcom/mappn/gfan/Session;->addObserver(Ljava/util/Observer;)V

    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 4

    packed-switch p1, :pswitch_data_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :pswitch_0
    const v0, 0x7f09009a

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v3}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPrice()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/mappn/gfan/common/util/DialogUtil;->newEnsurePurchaseDialog(Lcom/mappn/gfan/ui/ProductDetailActivity;ILjava/lang/String;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    :pswitch_1
    const v0, 0x7f09009e

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/mappn/gfan/common/util/DialogUtil;->newInsufficientBalanceDialog(Lcom/mappn/gfan/ui/ProductDetailActivity;ILjava/lang/String;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    const/4 v1, 0x0

    const v0, 0x7f09016f

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v1, v1, v1, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x7f020053

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    const/4 v0, 0x1

    return v0
.end method

.method protected onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onDestroy()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0, p0}, Lcom/mappn/gfan/Session;->deleteObserver(Ljava/util/Observer;)V

    return-void
.end method

.method public onError(II)V
    .locals 3

    const/4 v2, 0x0

    sparse-switch p1, :sswitch_data_0

    :cond_0
    :goto_0
    return-void

    :sswitch_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mDownloadButton:Landroid/widget/ImageButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900bf

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    :sswitch_1
    const/16 v0, 0xdb

    if-ne v0, p2, :cond_1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->showDialog(I)V

    goto :goto_0

    :cond_1
    const/16 v0, 0xd4

    if-ne v0, p2, :cond_2

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f09009d

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f09009c

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x5 -> :sswitch_1
        0xf -> :sswitch_0
    .end sparse-switch
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :pswitch_0
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/SafeActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->startActivity(Landroid/content/Intent;)V

    const/4 v0, 0x1

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onResume()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->initAppInfo(Lcom/mappn/gfan/common/vo/ProductDetail;)V

    :cond_0
    return-void
.end method

.method protected onStart()V
    .locals 4

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onStart()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "\u8be6\u60c5"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "\u6253\u5f00\u8be6\u60c5\u9875"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 2

    sparse-switch p1, :sswitch_data_0

    :goto_0
    return-void

    :sswitch_0
    check-cast p2, Lcom/mappn/gfan/common/vo/DownloadItem;

    invoke-direct {p0, p2}, Lcom/mappn/gfan/ui/ProductDetailActivity;->startDownload(Lcom/mappn/gfan/common/vo/DownloadItem;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mDownloadButton:Landroid/widget/ImageButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->finish()V

    goto :goto_0

    :sswitch_1
    new-instance v0, Lcom/mappn/gfan/common/vo/BuyLog;

    invoke-direct {v0}, Lcom/mappn/gfan/common/vo/BuyLog;-><init>()V

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPid()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/mappn/gfan/common/vo/BuyLog;->pId:Ljava/lang/String;

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/mappn/gfan/common/vo/BuyLog;->packageName:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/mappn/gfan/common/util/DBUtils;->insertBuyLog(Landroid/content/Context;Lcom/mappn/gfan/common/vo/BuyLog;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPid()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/vo/ProductDetail;->getSourceType()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p0, v0, v1}, Lcom/mappn/gfan/common/MarketAPI;->getDownloadUrl(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x5 -> :sswitch_1
        0xf -> :sswitch_0
    .end sparse-switch
.end method

.method public purchaseProduct(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPid()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p0, v0, p1}, Lcom/mappn/gfan/common/MarketAPI;->purchaseProduct(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .locals 4

    instance-of v0, p2, Ljava/util/HashMap;

    if-eqz v0, :cond_0

    check-cast p2, Ljava/util/HashMap;

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/vo/ProductDetail;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/DownloadInfo;

    if-eqz v0, :cond_2

    const v1, 0x7f0c008e

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ProductDetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget v2, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    const/16 v3, 0xc8

    if-ne v2, v3, :cond_1

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mDownloadButton:Landroid/widget/ImageButton;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    iget-object v2, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mDownloadButton:Landroid/widget/ImageButton;

    const v3, 0x7f02000e

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setBackgroundResource(I)V

    const v2, 0x7f090071

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    iget-object v0, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mFilePath:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/vo/ProductDetail;->setFilePath(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget v0, v0, Lcom/mappn/gfan/common/vo/DownloadInfo;->mStatus:I

    invoke-static {v0}, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->isStatusError(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->initAppInfo(Lcom/mappn/gfan/common/vo/ProductDetail;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/ProductDetailActivity;->mProduct:Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/ProductDetailActivity;->initAppInfo(Lcom/mappn/gfan/common/vo/ProductDetail;)V

    goto :goto_0
.end method
