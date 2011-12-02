.class public Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/DownloadManagerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ListOrderedMap"
.end annotation


# instance fields
.field private isRefreshed:Z

.field private list:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;",
            ">;"
        }
    .end annotation
.end field

.field private mSortComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;",
            ">;"
        }
    .end annotation
.end field

.field private map:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->map:Ljava/util/HashMap;

    new-instance v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap$1;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap$1;-><init>(Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->mSortComparator:Ljava/util/Comparator;

    return-void
.end method

.method private refresh()V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->map:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->map:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    if-nez v1, :cond_0

    monitor-exit v0

    :goto_0
    return-void

    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->mSortComparator:Ljava/util/Comparator;

    invoke-static {v2, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    iput-object v2, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->list:Ljava/util/ArrayList;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->isRefreshed:Z

    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public clear()V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->map:Ljava/util/HashMap;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->isRefreshed:Z

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->map:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->list:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getValue(I)Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->map:Ljava/util/HashMap;

    monitor-enter v0

    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->isRefreshed:Z

    if-nez v1, :cond_0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->refresh()V

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->list:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object p0
.end method

.method public getValue(Ljava/lang/String;)Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->map:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->map:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public put(Ljava/lang/String;Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;)Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->map:Ljava/util/HashMap;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->isRefreshed:Z

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->map:Ljava/util/HashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public remove(Ljava/lang/String;)Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->map:Ljava/util/HashMap;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->isRefreshed:Z

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->map:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public size()I
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->map:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->map:Ljava/util/HashMap;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    monitor-exit v0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;->map:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    monitor-exit v0

    move v0, v1

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
