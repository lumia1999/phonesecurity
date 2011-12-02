.class Lcom/mappn/gfan/common/download/DownloadManager$3;
.super Landroid/content/AsyncQueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/download/DownloadManager;->remove([J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/download/DownloadManager;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/common/download/DownloadManager;Landroid/content/ContentResolver;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadManager$3;->this$0:Lcom/mappn/gfan/common/download/DownloadManager;

    invoke-direct {p0, p2}, Landroid/content/AsyncQueryHandler;-><init>(Landroid/content/ContentResolver;)V

    return-void
.end method
