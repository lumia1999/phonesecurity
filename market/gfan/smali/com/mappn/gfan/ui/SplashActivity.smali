.class public Lcom/mappn/gfan/ui/SplashActivity;
.super Lcom/mappn/gfan/common/widget/BaseActivity;

# interfaces
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;


# static fields
.field private static final LOAD:I = 0x2

.field private static final VALID:I = 0x1


# instance fields
.field private mContent:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private mPreloadResult:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;-><init>()V

    new-instance v0, Lcom/mappn/gfan/ui/SplashActivity$1;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/SplashActivity$1;-><init>(Lcom/mappn/gfan/ui/SplashActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/mappn/gfan/ui/SplashActivity;)I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mPreloadResult:I

    return v0
.end method

.method static synthetic access$100(Lcom/mappn/gfan/ui/SplashActivity;)Ljava/util/HashMap;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mContent:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mappn/gfan/ui/SplashActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/SplashActivity;->preload()V

    return-void
.end method

.method private handleHomeRecommend(Ljava/util/HashMap;)V
    .locals 3
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

    const-string v0, "product_list"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-gtz v1, :cond_2

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mContent:Ljava/util/HashMap;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mContent:Ljava/util/HashMap;

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v1, p0, Lcom/mappn/gfan/ui/SplashActivity;->mContent:Ljava/util/HashMap;

    if-nez v1, :cond_3

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/mappn/gfan/ui/SplashActivity;->mContent:Ljava/util/HashMap;

    :cond_3
    iget-object v1, p0, Lcom/mappn/gfan/ui/SplashActivity;->mContent:Ljava/util/HashMap;

    const-string v2, "extra.home.data.bottom"

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private handleTopRecommend(Ljava/lang/Object;)V
    .locals 2

    check-cast p1, Ljava/util/ArrayList;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mContent:Ljava/util/HashMap;

    if-nez v0, :cond_2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mContent:Ljava/util/HashMap;

    :cond_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mContent:Ljava/util/HashMap;

    const-string v1, "extra.home.data.top"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private initSplashBg()V
    .locals 3

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SplashActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "splash.png"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/SplashActivity;->setSplashBitmap(Landroid/graphics/Bitmap;)V

    :goto_1
    return-void

    :catch_0
    move-exception v0

    const-string v2, "initSplashBg OutOfMemoryError"

    invoke-static {v2, v0}, Lcom/mappn/gfan/common/util/Utils;->E(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SplashActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0200ad

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/SplashActivity;->setSplashBitmap(Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mSession:Lcom/mappn/gfan/Session;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/mappn/gfan/Session;->setSplashTime(J)V

    goto :goto_1
.end method

.method private preload()V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0, p0}, Lcom/mappn/gfan/Session;->setScreenSize(Landroid/app/Activity;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getInstalledApps()Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SplashActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x2

    iput v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mPreloadResult:I

    iget-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SplashActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->detectProxy(Landroid/content/Context;)Lorg/apache/http/HttpHost;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/mappn/gfan/common/HttpClientFactory;->get()Lcom/mappn/gfan/common/HttpClientFactory;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/common/HttpClientFactory;->getHttpClient()Lcom/mappn/gfan/common/AndroidHttpClient;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/AndroidHttpClient;->useProxyConnection(Lorg/apache/http/HttpHost;)V

    :goto_1
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SplashActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mappn/gfan/common/MarketAPI;->getTopRecommend(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SplashActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const/16 v2, 0x32

    invoke-static {v0, p0, v1, v2}, Lcom/mappn/gfan/common/MarketAPI;->getHomeRecommend(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;II)V

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/mappn/gfan/common/HttpClientFactory;->get()Lcom/mappn/gfan/common/HttpClientFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/common/HttpClientFactory;->getHttpClient()Lcom/mappn/gfan/common/AndroidHttpClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/common/AndroidHttpClient;->useDefaultConnection()V

    goto :goto_1
.end method

.method private setSplashBitmap(Landroid/graphics/Bitmap;)V
    .locals 2

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SplashActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/mappn/gfan/common/util/ImageUtils;->sacleBitmap(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    const v1, 0x7f0c0038

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/SplashActivity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/ImageView;

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const v1, 0x7f030029

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/SplashActivity;->setContentView(I)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/SplashActivity;->initSplashBg()V

    const v1, 0x7f0c003a

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/SplashActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Landroid/widget/ProgressBar;

    move-object v7, v0

    new-instance v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/SplashActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    const/high16 v4, 0x7f07

    const v5, 0x7f070007

    const/16 v6, 0xc8

    invoke-direct/range {v1 .. v6}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;IIII)V

    invoke-virtual {v7, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/SplashActivity;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method protected onDestroy()V
    .locals 0

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onDestroy()V

    return-void
.end method

.method public onError(II)V
    .locals 2

    iget v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mPreloadResult:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mPreloadResult:I

    iget-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method protected onPause()V
    .locals 0

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onPause()V

    invoke-static {p0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

    return-void
.end method

.method protected onResume()V
    .locals 0

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onResume()V

    invoke-static {p0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 2

    iget v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mPreloadResult:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mPreloadResult:I

    const/16 v0, 0x22

    if-ne p1, v0, :cond_1

    invoke-direct {p0, p2}, Lcom/mappn/gfan/ui/SplashActivity;->handleTopRecommend(Ljava/lang/Object;)V

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/SplashActivity;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    :cond_1
    const/16 v0, 0x10

    if-ne p1, v0, :cond_0

    check-cast p2, Ljava/util/HashMap;

    invoke-direct {p0, p2}, Lcom/mappn/gfan/ui/SplashActivity;->handleHomeRecommend(Ljava/util/HashMap;)V

    goto :goto_0
.end method
