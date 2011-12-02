.class public Lcom/mappn/gfan/common/util/ImageUtils;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable2;,
        Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable3;,
        Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable1;,
        Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;,
        Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;
    }
.end annotation


# static fields
.field private static final TYPE_IMAGE:I = 0x2

.field private static final TYPE_NORAML:I = 0x1

.field private static final TYPE_SCREENSHOT:I = 0x3

.field private static final TYPE_TOP:I = 0x4


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/widget/ImageView;)Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;
    .locals 1

    invoke-static {p0}, Lcom/mappn/gfan/common/util/ImageUtils;->getBitmapDownloaderTask3(Landroid/widget/ImageView;)Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 1

    invoke-static {p0, p1}, Lcom/mappn/gfan/common/util/ImageUtils;->createUserIcon(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Landroid/widget/ImageView;)Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;
    .locals 1

    invoke-static {p0}, Lcom/mappn/gfan/common/util/ImageUtils;->getBitmapDownloaderTask2(Landroid/widget/ImageView;)Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Landroid/widget/ImageView;)Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;
    .locals 1

    invoke-static {p0}, Lcom/mappn/gfan/common/util/ImageUtils;->getBitmapDownloaderTask1(Landroid/widget/ImageView;)Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Landroid/content/Context;)Landroid/graphics/drawable/StateListDrawable;
    .locals 1

    invoke-static {p0}, Lcom/mappn/gfan/common/util/ImageUtils;->getMaskDrawable(Landroid/content/Context;)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v0

    return-object v0
.end method

.method private static cancelPotentialBitmapDownload(Ljava/lang/String;Landroid/widget/ImageView;)Z
    .locals 3

    const/4 v2, 0x1

    invoke-static {p1}, Lcom/mappn/gfan/common/util/ImageUtils;->getBitmapDownloaderTask1(Landroid/widget/ImageView;)Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {v0}, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->access$500(Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    :cond_0
    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->cancel(Z)Z

    :cond_1
    move v0, v2

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static cancelPotentialImageDownload(Ljava/lang/String;Landroid/widget/ImageView;)Z
    .locals 3

    const/4 v2, 0x1

    invoke-static {p1}, Lcom/mappn/gfan/common/util/ImageUtils;->getBitmapDownloaderTask2(Landroid/widget/ImageView;)Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {v0}, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->access$500(Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    :cond_0
    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->cancel(Z)Z

    :cond_1
    move v0, v2

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static createUserIcon(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 10

    const/4 v9, 0x0

    const/high16 v8, 0x3f00

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x4260

    mul-float/2addr v0, v1

    add-float/2addr v0, v8

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    mul-int v3, v1, v0

    mul-int v4, v0, v2

    if-le v3, v4, :cond_0

    int-to-float v3, v0

    int-to-float v2, v2

    div-float v2, v3, v2

    int-to-float v3, v0

    int-to-float v1, v1

    mul-float/2addr v1, v2

    sub-float v1, v3, v1

    mul-float/2addr v1, v8

    move v3, v2

    move v2, v1

    move v1, v9

    :goto_0
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v0, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    new-instance v4, Landroid/graphics/Canvas;

    invoke-direct {v4, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    new-instance v6, Landroid/graphics/Paint;

    const/4 v7, 0x1

    invoke-direct {v6, v7}, Landroid/graphics/Paint;-><init>(I)V

    invoke-virtual {v5, v3, v3}, Landroid/graphics/Matrix;->setScale(FF)V

    add-float/2addr v2, v8

    float-to-int v2, v2

    int-to-float v2, v2

    add-float/2addr v1, v8

    float-to-int v1, v1

    int-to-float v1, v1

    invoke-virtual {v5, v2, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {v4, p1, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020023

    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    new-instance v2, Landroid/graphics/PorterDuffXfermode;

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->DST_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v2, v3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    invoke-virtual {v4, v1, v9, v9, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    return-object v0

    :cond_0
    int-to-float v3, v0

    int-to-float v1, v1

    div-float v1, v3, v1

    int-to-float v3, v0

    int-to-float v2, v2

    mul-float/2addr v2, v1

    sub-float v2, v3, v2

    mul-float/2addr v2, v8

    move v3, v1

    move v1, v2

    move v2, v9

    goto :goto_0
.end method

.method public static download(Landroid/content/Context;Landroid/content/pm/PackageInfo;Landroid/widget/ImageView;I)V
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-static {}, Lcom/mappn/gfan/common/util/CacheManager;->getInstance()Lcom/mappn/gfan/common/util/CacheManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/util/CacheManager;->existsDrawable(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/util/CacheManager;->getDrawableFromCache(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_2
    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mappn/gfan/Session;->isStopDownloadImage()Z

    move-result v2

    if-eqz v2, :cond_3

    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    :cond_3
    invoke-virtual {p2, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    invoke-static {v0, p2}, Lcom/mappn/gfan/common/util/ImageUtils;->cancelPotentialBitmapDownload(Ljava/lang/String;Landroid/widget/ImageView;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;

    invoke-direct {v0, p2}, Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;-><init>(Landroid/widget/ImageView;)V

    new-instance v2, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable3;

    invoke-direct {v2, v1, v0}, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable3;-><init>(Landroid/graphics/drawable/Drawable;Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;)V

    invoke-virtual {p2, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x2

    :try_start_0
    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;->execute([Ljava/lang/Object;)Lcom/mappn/gfan/common/util/AsyncTaskEx;
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "RejectedExecutionException when download image"

    invoke-static {v1, v0}, Lcom/mappn/gfan/common/util/Utils;->E(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static download(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V
    .locals 2

    const v0, 0x7f02006e

    const/4 v1, 0x0

    invoke-static {p0, p1, p2, v0, v1}, Lcom/mappn/gfan/common/util/ImageUtils;->download(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;IZ)V

    return-void
.end method

.method public static download(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;IZ)V
    .locals 4

    const/4 v3, 0x0

    invoke-static {}, Lcom/mappn/gfan/common/util/CacheManager;->getInstance()Lcom/mappn/gfan/common/util/CacheManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mappn/gfan/common/util/CacheManager;->existsDrawable(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0, p1}, Lcom/mappn/gfan/common/util/CacheManager;->getDrawableFromCache(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_2

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_2
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->isStopDownloadImage()Z

    move-result v1

    if-eqz v1, :cond_4

    if-eqz p4, :cond_3

    invoke-virtual {p2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    :cond_3
    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    :cond_4
    invoke-virtual {p2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    invoke-static {p1, p2}, Lcom/mappn/gfan/common/util/ImageUtils;->cancelPotentialBitmapDownload(Ljava/lang/String;Landroid/widget/ImageView;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;

    invoke-direct {v1, p2}, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;-><init>(Landroid/widget/ImageView;)V

    new-instance v2, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable1;

    invoke-direct {v2, v0, v1}, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable1;-><init>(Landroid/graphics/drawable/Drawable;Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;)V

    invoke-virtual {p2, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 v0, 0x3

    :try_start_0
    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v0, v2

    const/4 v2, 0x1

    aput-object p1, v0, v2

    const/4 v2, 0x2

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->execute([Ljava/lang/Object;)Lcom/mappn/gfan/common/util/AsyncTaskEx;
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "RejectedExecutionException when download image"

    invoke-static {v1, v0}, Lcom/mappn/gfan/common/util/Utils;->E(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static downloadDeatilScreenshot(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V
    .locals 4

    const/4 v3, 0x3

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isStopDownloadImage()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    invoke-static {p1, p2}, Lcom/mappn/gfan/common/util/ImageUtils;->cancelPotentialBitmapDownload(Ljava/lang/String;Landroid/widget/ImageView;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;

    invoke-direct {v1, p2}, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;-><init>(Landroid/widget/ImageView;)V

    new-instance v2, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable1;

    invoke-direct {v2, v0, v1}, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable1;-><init>(Landroid/graphics/drawable/Drawable;Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;)V

    invoke-virtual {p2, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    new-array v0, v3, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v0, v2

    const/4 v2, 0x1

    aput-object p1, v0, v2

    const/4 v2, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->execute([Ljava/lang/Object;)Lcom/mappn/gfan/common/util/AsyncTaskEx;

    goto :goto_0
.end method

.method public static downloadHomeTopDrawable(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V
    .locals 4

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isStopDownloadImage()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-static {}, Lcom/mappn/gfan/common/util/CacheManager;->getInstance()Lcom/mappn/gfan/common/util/CacheManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mappn/gfan/common/util/CacheManager;->existsDrawable(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0, p1}, Lcom/mappn/gfan/common/util/CacheManager;->getDrawableFromCache(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-static {p0}, Lcom/mappn/gfan/common/util/ImageUtils;->getMaskDrawable(Landroid/content/Context;)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_2
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020008

    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-static {p1, p2}, Lcom/mappn/gfan/common/util/ImageUtils;->cancelPotentialBitmapDownload(Ljava/lang/String;Landroid/widget/ImageView;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;

    invoke-direct {v1, p2}, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;-><init>(Landroid/widget/ImageView;)V

    new-instance v2, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable1;

    invoke-direct {v2, v0, v1}, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable1;-><init>(Landroid/graphics/drawable/Drawable;Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;)V

    invoke-virtual {p2, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v0, v2

    const/4 v2, 0x1

    aput-object p1, v0, v2

    const/4 v2, 0x2

    const/4 v3, 0x4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->execute([Ljava/lang/Object;)Lcom/mappn/gfan/common/util/AsyncTaskEx;

    goto :goto_0
.end method

.method public static downloadScreenShot(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V
    .locals 4

    const/4 v3, 0x2

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isStopDownloadImage()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    new-instance v0, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;)V

    invoke-static {p1, p2}, Lcom/mappn/gfan/common/util/ImageUtils;->cancelPotentialImageDownload(Ljava/lang/String;Landroid/widget/ImageView;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;

    invoke-direct {v1, p2}, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;-><init>(Landroid/widget/ImageView;)V

    new-instance v2, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable2;

    invoke-direct {v2, v0, v1}, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable2;-><init>(Landroid/graphics/drawable/Drawable;Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;)V

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p2, v2}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v2}, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable2;->start()V

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v0, v2

    const/4 v2, 0x1

    aput-object p1, v0, v2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v3

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->execute([Ljava/lang/Object;)Lcom/mappn/gfan/common/util/AsyncTaskEx;

    goto :goto_0
.end method

.method private static getBitmapDownloaderTask1(Landroid/widget/ImageView;)Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;
    .locals 2

    const/4 v1, 0x0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_0

    instance-of v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable1;

    if-nez v0, :cond_1

    :cond_0
    move-object v0, v1

    :goto_0
    return-object v0

    :cond_1
    check-cast p0, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable1;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable1;->getBitmapDownloaderTask()Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;

    move-result-object v0

    goto :goto_0

    :cond_2
    move-object v0, v1

    goto :goto_0
.end method

.method private static getBitmapDownloaderTask2(Landroid/widget/ImageView;)Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;
    .locals 2

    const/4 v1, 0x0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_0

    instance-of v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable2;

    if-nez v0, :cond_1

    :cond_0
    move-object v0, v1

    :goto_0
    return-object v0

    :cond_1
    check-cast p0, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable2;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable2;->getBitmapDownloaderTask()Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;

    move-result-object v0

    goto :goto_0

    :cond_2
    move-object v0, v1

    goto :goto_0
.end method

.method private static getBitmapDownloaderTask3(Landroid/widget/ImageView;)Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;
    .locals 2

    const/4 v1, 0x0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_0

    instance-of v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable3;

    if-nez v0, :cond_1

    :cond_0
    move-object v0, v1

    :goto_0
    return-object v0

    :cond_1
    check-cast p0, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable3;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable3;->getBitmapDownloaderTask()Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;

    move-result-object v0

    goto :goto_0

    :cond_2
    move-object v0, v1

    goto :goto_0
.end method

.method public static getImageFromUrl(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 8

    const/4 v6, 0x0

    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v0, p0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/mappn/gfan/common/HttpClientFactory;->get()Lcom/mappn/gfan/common/HttpClientFactory;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/common/HttpClientFactory;->getHttpClient()Lcom/mappn/gfan/common/AndroidHttpClient;

    move-result-object v1

    :try_start_0
    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/AndroidHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    const/16 v3, 0xc8

    if-eq v2, v3, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " while retrieving bitmap from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_3

    invoke-virtual {v0}, Lorg/apache/http/client/methods/HttpGet;->abort()V

    move-object v0, v6

    :goto_0
    return-object v0

    :cond_0
    :try_start_1
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_3

    move-result-object v1

    if-eqz v1, :cond_3

    :try_start_2
    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    :try_start_3
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v4, 0x1

    iput-boolean v4, v3, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    new-instance v4, Lcom/mappn/gfan/common/util/FlushedInputStream;

    invoke-direct {v4, v2}, Lcom/mappn/gfan/common/util/FlushedInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v5, 0x0

    invoke-static {v4, v5, v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    move-result-object v3

    if-eqz v2, :cond_1

    :try_start_4
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    :cond_1
    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_4 .. :try_end_4} :catch_3

    invoke-virtual {v0}, Lorg/apache/http/client/methods/HttpGet;->abort()V

    move-object v0, v3

    goto :goto_0

    :catchall_0
    move-exception v2

    move-object v3, v6

    :goto_1
    if-eqz v3, :cond_2

    :try_start_5
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    :cond_2
    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->consumeContent()V

    throw v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_5 .. :try_end_5} :catch_3

    :catch_0
    move-exception v1

    :try_start_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ClientProtocolException "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :cond_3
    :goto_2
    invoke-virtual {v0}, Lorg/apache/http/client/methods/HttpGet;->abort()V

    move-object v0, v6

    goto :goto_0

    :catch_1
    move-exception v1

    :try_start_7
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "IOException "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v1

    invoke-virtual {v0}, Lorg/apache/http/client/methods/HttpGet;->abort()V

    throw v1

    :catch_2
    move-exception v1

    :try_start_8
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "other exception when download images from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    :catch_3
    move-exception v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "OutOfMemoryError when download images from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_2

    :catchall_2
    move-exception v3

    move-object v7, v3

    move-object v3, v2

    move-object v2, v7

    goto :goto_1
.end method

.method private static getMaskDrawable(Landroid/content/Context;)Landroid/graphics/drawable/StateListDrawable;
    .locals 5

    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    const v1, 0x10100a7

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [I

    const/4 v4, 0x0

    aput v1, v3, v4

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    const v4, 0x7f020009

    invoke-static {v2, v4}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-direct {v1, v2, v4}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v3, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    return-object v0
.end method

.method public static rotateImage(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 8

    if-nez p0, :cond_0

    move-object v0, p0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v0, v4

    int-to-float v1, v3

    div-float/2addr v0, v1

    const/high16 v1, 0x3f80

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    move-object v0, p0

    goto :goto_0

    :cond_1
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    const/high16 v0, 0x42b4

    invoke-virtual {v5, v0}, Landroid/graphics/Matrix;->postRotate(F)Z

    const/4 v7, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    :try_start_0
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v0, v7

    goto :goto_0
.end method

.method public static sacleBitmap(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v3, v2

    int-to-float v0, v0

    div-float v0, v3, v0

    int-to-float v1, v1

    mul-float/2addr v0, v1

    float-to-int v0, v0

    const/4 v1, 0x0

    const/4 v3, 0x0

    :try_start_0
    invoke-static {p1, v2, v0, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    move-object v0, v1

    goto :goto_0
.end method
