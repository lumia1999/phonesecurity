.class public Lcom/mappn/gfan/common/download/DownloadManager;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/common/download/DownloadManager$Impl;,
        Lcom/mappn/gfan/common/download/DownloadManager$Query;,
        Lcom/mappn/gfan/common/download/DownloadManager$Request;,
        Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;
    }
.end annotation


# static fields
.field public static final STATUS_FAILED:I = 0x10

.field public static final STATUS_PAUSED:I = 0x4

.field public static final STATUS_PENDING:I = 0x1

.field public static final STATUS_RUNNING:I = 0x2

.field public static final STATUS_SUCCESSFUL:I = 0x8


# instance fields
.field private mBaseUri:Landroid/net/Uri;

.field private mPackageName:Ljava/lang/String;

.field private mResolver:Landroid/content/ContentResolver;


# direct methods
.method public constructor <init>(Landroid/content/ContentResolver;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    iput-object v0, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mBaseUri:Landroid/net/Uri;

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mResolver:Landroid/content/ContentResolver;

    iput-object p2, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mPackageName:Ljava/lang/String;

    return-void
.end method

.method static getWhereArgsForIds([J)[Ljava/lang/String;
    .locals 4

    array-length v0, p0

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    aget-wide v2, p0, v1

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method static getWhereArgsForPackageName(Ljava/lang/String;)[Ljava/lang/String;
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const/16 v2, 0xc8

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object p0, v0, v1

    return-object v0
.end method

.method static getWhereClauseForIds([J)Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    if-lez v1, :cond_0

    const-string v2, "OR "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    const-string v2, "_id"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " = ? "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static getWhereClauseForPackageName()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "status"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " = ? AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "package_name"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " = ? )"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public varargs cancelDownload([J)V
    .locals 7

    if-eqz p1, :cond_0

    array-length v0, p1

    if-nez v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "input param \'ids\' can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    const-string v0, "status"

    const/16 v1, 0x1ea

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v4, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadManager$2;

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mResolver:Landroid/content/ContentResolver;

    invoke-direct {v0, p0, v1}, Lcom/mappn/gfan/common/download/DownloadManager$2;-><init>(Lcom/mappn/gfan/common/download/DownloadManager;Landroid/content/ContentResolver;)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mBaseUri:Landroid/net/Uri;

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereClauseForIds([J)Ljava/lang/String;

    move-result-object v5

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereArgsForIds([J)[Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {v0 .. v6}, Landroid/content/AsyncQueryHandler;->startUpdate(ILjava/lang/Object;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method public completeInstallation(Ljava/lang/String;)V
    .locals 5

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "visibility"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "status"

    const/16 v2, 0x104

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "deleted"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mBaseUri:Landroid/net/Uri;

    invoke-static {}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereClauseForPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereArgsForPackageName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0
.end method

.method public enqueue(Landroid/content/Context;Lcom/mappn/gfan/common/download/DownloadManager$Request;Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;)V
    .locals 5

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mPackageName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->toContentValues(Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v1

    const-string v2, "hint"

    invoke-static {p2}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->access$000(Lcom/mappn/gfan/common/download/DownloadManager$Request;)Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "package_name"

    invoke-static {p2}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->access$100(Lcom/mappn/gfan/common/download/DownloadManager$Request;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "notificationclass"

    const-class v2, Lcom/mappn/gfan/ui/AppManagerActivity;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "md5"

    invoke-static {p2}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->access$200(Lcom/mappn/gfan/common/download/DownloadManager$Request;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "allow_network"

    invoke-static {p1}, Lcom/mappn/gfan/common/download/Helper;->getActiveNetworkType(Landroid/content/Context;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-static {p2}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->access$300(Lcom/mappn/gfan/common/download/DownloadManager$Request;)I

    move-result v0

    const/4 v2, 0x3

    if-ne v0, v2, :cond_0

    const-string v0, "destination"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :goto_0
    new-instance v0, Lcom/mappn/gfan/common/download/DownloadManager$1;

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mResolver:Landroid/content/ContentResolver;

    invoke-direct {v0, p0, v2, p3}, Lcom/mappn/gfan/common/download/DownloadManager$1;-><init>(Lcom/mappn/gfan/common/download/DownloadManager;Landroid/content/ContentResolver;Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    sget-object v4, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/content/AsyncQueryHandler;->startInsert(ILjava/lang/Object;Landroid/net/Uri;Landroid/content/ContentValues;)V

    return-void

    :cond_0
    const-string v0, "destination"

    invoke-static {p2}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->access$400(Lcom/mappn/gfan/common/download/DownloadManager$Request;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0
.end method

.method public enqueueWaitRequest(Lcom/mappn/gfan/common/download/DownloadManager$Request;)J
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mPackageName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->toContentValues(Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v1

    const-string v2, "hint"

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->access$000(Lcom/mappn/gfan/common/download/DownloadManager$Request;)Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "package_name"

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->access$100(Lcom/mappn/gfan/common/download/DownloadManager$Request;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "md5"

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->access$200(Lcom/mappn/gfan/common/download/DownloadManager$Request;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "destination"

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager$Request;->access$400(Lcom/mappn/gfan/common/download/DownloadManager$Request;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "control"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mResolver:Landroid/content/ContentResolver;

    sget-object v2, Lcom/mappn/gfan/common/download/DownloadManager$Impl;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_0

    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {v0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    goto :goto_0
.end method

.method public getDownloadErrorApks()Landroid/database/Cursor;
    .locals 6

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mBaseUri:Landroid/net/Uri;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v3

    const/4 v3, 0x1

    const-string v5, "title"

    aput-object v5, v2, v3

    const/4 v3, 0x2

    const-string v5, "status"

    aput-object v5, v2, v3

    const-string v3, "((status >= \'400\' AND status < \'500\') AND destination = \'0\' AND mimetype = \'application/vnd.android.package-archive\')"

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public getDownloadingApks()Landroid/database/Cursor;
    .locals 6

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mBaseUri:Landroid/net/Uri;

    const/16 v2, 0x9

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v3

    const/4 v3, 0x1

    const-string v5, "_data"

    aput-object v5, v2, v3

    const/4 v3, 0x2

    const-string v5, "title"

    aput-object v5, v2, v3

    const/4 v3, 0x3

    const-string v5, "description"

    aput-object v5, v2, v3

    const/4 v3, 0x4

    const-string v5, "current_bytes"

    aput-object v5, v2, v3

    const/4 v3, 0x5

    const-string v5, "total_bytes"

    aput-object v5, v2, v3

    const/4 v3, 0x6

    const-string v5, "status"

    aput-object v5, v2, v3

    const/4 v3, 0x7

    const-string v5, "package_name"

    aput-object v5, v2, v3

    const/16 v3, 0x8

    const-string v5, "notificationextras"

    aput-object v5, v2, v3

    const-string v3, "(((status >= \'190\' AND status <= \'200\') OR status = \'490\') AND destination = \'0\' AND mimetype = \'application/vnd.android.package-archive\')"

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public varargs hideDownload([J)I
    .locals 5

    if-eqz p1, :cond_0

    array-length v0, p1

    if-nez v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "input param \'ids\' can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "visibility"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mBaseUri:Landroid/net/Uri;

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereClauseForIds([J)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereArgsForIds([J)[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public varargs markRowDeleted([J)I
    .locals 5

    if-eqz p1, :cond_0

    array-length v0, p1

    if-nez v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "input param \'ids\' can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "deleted"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mBaseUri:Landroid/net/Uri;

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereClauseForIds([J)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereArgsForIds([J)[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public varargs pauseDownload([J)I
    .locals 5

    if-eqz p1, :cond_0

    array-length v0, p1

    if-nez v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "input param \'ids\' can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "control"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mBaseUri:Landroid/net/Uri;

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereClauseForIds([J)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereArgsForIds([J)[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public query(Lcom/mappn/gfan/common/download/DownloadManager$Query;)Landroid/database/Cursor;
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mResolver:Landroid/content/ContentResolver;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mBaseUri:Landroid/net/Uri;

    invoke-virtual {p1, v0, v1, v2}, Lcom/mappn/gfan/common/download/DownloadManager$Query;->runQuery(Landroid/content/ContentResolver;[Ljava/lang/String;Landroid/net/Uri;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public varargs remove([J)V
    .locals 6

    if-eqz p1, :cond_0

    array-length v0, p1

    if-nez v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "input param \'ids\' can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Lcom/mappn/gfan/common/download/DownloadManager$3;

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mResolver:Landroid/content/ContentResolver;

    invoke-direct {v0, p0, v1}, Lcom/mappn/gfan/common/download/DownloadManager$3;-><init>(Lcom/mappn/gfan/common/download/DownloadManager;Landroid/content/ContentResolver;)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mBaseUri:Landroid/net/Uri;

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereClauseForIds([J)Ljava/lang/String;

    move-result-object v4

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereArgsForIds([J)[Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Landroid/content/AsyncQueryHandler;->startDelete(ILjava/lang/Object;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method public replacePackageName(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "package_name"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mBaseUri:Landroid/net/Uri;

    invoke-static {}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereClauseForPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereArgsForPackageName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method public varargs restartDownload([J)V
    .locals 5

    new-instance v0, Lcom/mappn/gfan/common/download/DownloadManager$Query;

    invoke-direct {v0}, Lcom/mappn/gfan/common/download/DownloadManager$Query;-><init>()V

    invoke-virtual {v0, p1}, Lcom/mappn/gfan/common/download/DownloadManager$Query;->setFilterById([J)Lcom/mappn/gfan/common/download/DownloadManager$Query;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/download/DownloadManager;->query(Lcom/mappn/gfan/common/download/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v0

    :try_start_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "status"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_0

    const/16 v2, 0x10

    if-eq v1, v2, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot restart incomplete download: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_id"

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw v1

    :cond_0
    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "current_bytes"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "total_bytes"

    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "_data"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v1, "status"

    const/16 v2, 0xbe

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mBaseUri:Landroid/net/Uri;

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereClauseForIds([J)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereArgsForIds([J)[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method public varargs resumeDownload([J)I
    .locals 5

    if-eqz p1, :cond_0

    array-length v0, p1

    if-nez v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "input param \'ids\' can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "control"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v1, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/mappn/gfan/common/download/DownloadManager;->mBaseUri:Landroid/net/Uri;

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereClauseForIds([J)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1}, Lcom/mappn/gfan/common/download/DownloadManager;->getWhereArgsForIds([J)[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method
