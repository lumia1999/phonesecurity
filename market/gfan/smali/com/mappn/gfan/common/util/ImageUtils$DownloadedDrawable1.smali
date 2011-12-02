.class Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable1;
.super Landroid/graphics/drawable/BitmapDrawable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/util/ImageUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DownloadedDrawable1"
.end annotation


# instance fields
.field private final bitmapDownloaderTaskReference1:Ljava/lang/ref/WeakReference;
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
    .locals 1

    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable1;->bitmapDownloaderTaskReference1:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public getBitmapDownloaderTask()Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/ImageUtils$DownloadedDrawable1;->bitmapDownloaderTaskReference1:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/util/ImageUtils$BitmapDownloaderTask;

    return-object p0
.end method
