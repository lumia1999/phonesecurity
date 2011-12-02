.class final Lcom/mappn/gfan/common/download/DownloadProvider$DatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/download/DownloadProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "DatabaseHelper"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/download/DownloadProvider;


# direct methods
.method public constructor <init>(Lcom/mappn/gfan/common/download/DownloadProvider;Landroid/content/Context;)V
    .locals 3

    iput-object p1, p0, Lcom/mappn/gfan/common/download/DownloadProvider$DatabaseHelper;->this$0:Lcom/mappn/gfan/common/download/DownloadProvider;

    const-string v0, "downloads.db"

    const/4 v1, 0x0

    const/16 v2, 0x6d

    invoke-direct {p0, p2, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    return-void
.end method

.method private createDownloadsTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    :try_start_0
    const-string v0, "DROP TABLE IF EXISTS downloads"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE downloads(_id INTEGER PRIMARY KEY AUTOINCREMENT,uri TEXT, redirectcount INTEGER, entity TEXT, hint TEXT, _data TEXT, mimetype TEXT, destination INTEGER, visibility INTEGER, control INTEGER, status INTEGER, numfailed INTEGER, lastmod BIGINT, notificationpackage TEXT, notificationclass TEXT, notificationextras TEXT, total_bytes INTEGER DEFAULT -1, current_bytes INTEGER DEFAULT 0, etag TEXT, md5 TEXT, package_name TEXT, allow_network INTEGER, title TEXT, description TEXT, deleted BOOLEAN NOT NULL DEFAULT 0, source INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const-string v1, "couldn\'t create table in downloads database"

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->E(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    const-string v0, "populating new database"

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    const/4 v0, 0x0

    const/16 v1, 0x6d

    invoke-virtual {p0, p1, v0, v1}, Lcom/mappn/gfan/common/download/DownloadProvider$DatabaseHelper;->onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V

    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/download/DownloadProvider$DatabaseHelper;->createDownloadsTable(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void
.end method
