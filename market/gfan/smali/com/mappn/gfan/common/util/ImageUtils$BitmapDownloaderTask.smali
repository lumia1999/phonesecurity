.class Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;
.super Lcom/mappn/gfan/common/util/AsyncTaskEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/util/ImageUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BitmapDownloaderTask"
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

.field private type:I

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/widget/ImageView;)V
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/util/AsyncTaskEx;-><init>()V

    invoke-static {}, Lcom/mappn/gfan/common/util/CacheManager;->getInstance()Lcom/mappn/gfan/common/util/CacheManager;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->cache:Lcom/mappn/gfan/common/util/CacheManager;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->imageViewReference:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static synthetic access$500(Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->url:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Object;)Landroid/graphics/Bitmap;
    .locals 3

    const/4 v2, 0x2

    const/4 v0, 0x0

    aget-object v0, p1, v0

    check-cast v0, Landroid/content/Context;

    iput-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->context:Landroid/content/Context;

    const/4 v0, 0x1

    aget-object v0, p1, v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->url:Ljava/lang/String;

    aget-object v0, p1, v2

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->type:I

    iget-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->url:Ljava/lang/String;

    invoke-static {v0}, Lcom/mappn/gfan/common/util/ImageUtils;->getImageFromUrl(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_1

    iget v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->type:I

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->type:I

    const/4 v2, 0x3

    if-eq v0, v2, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->imageViewReference:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->imageViewReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getId()I

    move-result v0

    const v2, 0x7f0c002f

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->context:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/ImageUtils;->access$100(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->cache:Lcom/mappn/gfan/common/util/CacheManager;

    iget-object v2, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->url:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Lcom/mappn/gfan/common/util/CacheManager;->cacheDrawable(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    :goto_1
    return-object v0

    :cond_0
    move-object v0, v1

    goto :goto_0

    :cond_1
    move-object v0, v1

    goto :goto_1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->doInBackground([Ljava/lang/Object;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 5

    const/4 v4, 0x0

    const/4 v3, 0x2

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_5

    move-object v1, v4

    :goto_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->imageViewReference:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->imageViewReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iget v2, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->type:I

    if-ne v2, v3, :cond_1

    invoke-static {v0}, Lcom/mappn/gfan/common/util/ImageUtils;->access$200(Landroid/widget/ImageView;)Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;

    move-result-object v2

    :goto_1
    if-ne p0, v2, :cond_0

    if-eqz v1, :cond_0

    iget v2, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->type:I

    if-ne v2, v3, :cond_2

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-static {v1}, Lcom/mappn/gfan/common/util/ImageUtils;->rotateImage(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :goto_2
    iget-object v1, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->context:Landroid/content/Context;

    const/high16 v2, 0x7f04

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_0
    return-void

    :cond_1
    invoke-static {v0}, Lcom/mappn/gfan/common/util/ImageUtils;->access$300(Landroid/widget/ImageView;)Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;

    move-result-object v2

    goto :goto_1

    :cond_2
    iget v2, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->type:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_3

    invoke-static {v1}, Lcom/mappn/gfan/common/util/ImageUtils;->rotateImage(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_2

    :cond_3
    iget v2, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->type:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_4

    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    iget-object v1, p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/mappn/gfan/common/util/ImageUtils;->access$400(Landroid/content/Context;)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_2

    :cond_4
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_2

    :cond_5
    move-object v1, p1

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
