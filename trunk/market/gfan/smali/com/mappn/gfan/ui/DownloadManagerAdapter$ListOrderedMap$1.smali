.class Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap$1;->this$0:Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)I
    .locals 2

    iget v0, p1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mWeight:I

    iget v1, p2, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mWeight:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    check-cast p2, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    invoke-virtual {p0, p1, p2}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap$1;->compare(Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)I

    move-result v0

    return v0
.end method
