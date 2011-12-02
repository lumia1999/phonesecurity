.class Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;
.super Lcom/mappn/gfan/common/util/AsyncTaskEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/util/ImageUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DrawableDownloaderTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mappn/gfan/common/util/AsyncTaskEx",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field cache:Lcom/mappn/gfan/common/util/CacheManager;

.field private context:Landroid/content/Context;

.field private final imageViewReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mPackageInfo:Landroid/content/pm/PackageInfo;


# direct methods
.method public constructor <init>(Landroid/widget/ImageView;)V
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/util/AsyncTaskEx;-><init>()V

    invoke-static {}, Lcom/mappn/gfan/common/util/CacheManager;->getInstance()Lcom/mappn/gfan/common/util/CacheManager;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;->cache:Lcom/mappn/gfan/common/util/CacheManager;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;->imageViewReference:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Object;)Landroid/graphics/Bitmap;
    .locals 3

    const/4 v0, 0x0

    aget-object v0, p1, v0

    check-cast v0, Landroid/content/Context;

    iput-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;->context:Landroid/content/Context;

    const/4 v0, 0x1

    aget-object v0, p1, v0

    check-cast v0, Landroid/content/pm/PackageInfo;

    iput-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v1, v0}, Landroid/content/pm/ApplicationInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;->cache:Lcom/mappn/gfan/common/util/CacheManager;

    iget-object v2, p0, Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Lcom/mappn/gfan/common/util/CacheManager;->cacheDrawable(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;->doInBackground([Ljava/lang/Object;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 3

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    move-object v1, v0

    :goto_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;->imageViewReference:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;->imageViewReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-static {v0}, Lcom/mappn/gfan/common/util/ImageUtils;->access$000(Landroid/widget/ImageView;)Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;

    move-result-object v2

    if-ne p0, v2, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    iget-object v1, p0, Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;->context:Landroid/content/Context;

    const/high16 v2, 0x7f04

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_0
    return-void

    :cond_1
    move-object v1, p1

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/mappn/gfan/common/util/ImageUtils$DrawableDownloaderTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
