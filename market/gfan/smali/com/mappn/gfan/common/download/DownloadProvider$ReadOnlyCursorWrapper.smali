.class Lcom/mappn/gfan/common/download/DownloadProvider$ReadOnlyCursorWrapper;
.super Landroid/database/CursorWrapper;

# interfaces
.implements Landroid/database/CrossProcessCursor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/download/DownloadProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReadOnlyCursorWrapper"
.end annotation


# instance fields
.field private mCursor:Landroid/database/CrossProcessCursor;

.field final synthetic this$0:Lcom/mappn/gfan/common/download/DownloadProvider;


# direct methods
.method public constructor <init>(Lcom/mappn/gfan/common/download/DownloadProvider;Landroid/database/Cursor;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadProvider$ReadOnlyCursorWrapper;->this$0:Lcom/mappn/gfan/common/download/DownloadProvider;

    invoke-direct {p0, p2}, Landroid/database/CursorWrapper;-><init>(Landroid/database/Cursor;)V

    check-cast p2, Landroid/database/CrossProcessCursor;

    iput-object p2, p0, Lcom/mappn/gfan/common/download/DownloadProvider$ReadOnlyCursorWrapper;->mCursor:Landroid/database/CrossProcessCursor;

    return-void
.end method


# virtual methods
.method public fillWindow(ILandroid/database/CursorWindow;)V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadProvider$ReadOnlyCursorWrapper;->mCursor:Landroid/database/CrossProcessCursor;

    invoke-interface {v0, p1, p2}, Landroid/database/CrossProcessCursor;->fillWindow(ILandroid/database/CursorWindow;)V

    return-void
.end method

.method public getWindow()Landroid/database/CursorWindow;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadProvider$ReadOnlyCursorWrapper;->mCursor:Landroid/database/CrossProcessCursor;

    invoke-interface {v0}, Landroid/database/CrossProcessCursor;->getWindow()Landroid/database/CursorWindow;

    move-result-object v0

    return-object v0
.end method

.method public onMove(II)Z
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadProvider$ReadOnlyCursorWrapper;->mCursor:Landroid/database/CrossProcessCursor;

    invoke-interface {v0, p1, p2}, Landroid/database/CrossProcessCursor;->onMove(II)Z

    move-result v0

    return v0
.end method
