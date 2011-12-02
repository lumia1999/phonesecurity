.class Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable2;
.super Landroid/graphics/drawable/AnimationDrawable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/util/ImageUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DownloadedDrawable2"
.end annotation


# instance fields
.field private final bitmapDownloaderTaskReference2:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;)V
    .locals 5

    const/4 v4, 0x0

    invoke-direct {p0}, Landroid/graphics/drawable/AnimationDrawable;-><init>()V

    check-cast p1, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/AnimationDrawable;->getNumberOfFrames()I

    move-result v0

    move v1, v4

    :goto_0
    if-ge v1, v0, :cond_0

    invoke-virtual {p1, v1}, Landroid/graphics/drawable/AnimationDrawable;->getFrame(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {p1, v1}, Landroid/graphics/drawable/AnimationDrawable;->getDuration(I)I

    move-result v3

    invoke-super {p0, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-super {p0, v4}, Landroid/graphics/drawable/AnimationDrawable;->setOneShot(Z)V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable2;->bitmapDownloaderTaskReference2:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public getBitmapDownloaderTask()Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable2;->bitmapDownloaderTaskReference2:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;

    return-object p0
.end method
