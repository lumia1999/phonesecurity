.class final Lcom/mappn/gfan/common/util/MarketProvider$DatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/util/MarketProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "DatabaseHelper"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/util/MarketProvider;


# direct methods
.method public constructor <init>(Lcom/mappn/gfan/common/util/MarketProvider;Landroid/content/Context;)V
    .locals 3

    iput-object p1, p0, Lcom/mappn/gfan/common/util/MarketProvider$DatabaseHelper;->this$0:Lcom/mappn/gfan/common/util/MarketProvider;

    const-string v0, "market.db"

    const/4 v1, 0x0

    const/16 v2, 0x47

    invoke-direct {p0, p2, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    return-void
.end method

.method private createCardTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    :try_start_0
    const-string v0, "DROP TABLE IF EXISTS card"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE card (_id INTEGER PRIMARY KEY AUTOINCREMENT,card_name TEXT,card_pay_type TEXT,card_account_num INTEGER,card_password_num INTEGER,card_credit TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const-string v1, "couldn\'t create card table in market database"

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    throw v0
.end method

.method private createLogTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    :try_start_0
    const-string v0, "DROP TABLE IF EXISTS log"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE log (_id INTEGER PRIMARY KEY AUTOINCREMENT,module TEXT,level INTEGER,content TEXT,network TEXT,create_time INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const-string v1, "couldn\'t create log table in market database"

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    throw v0
.end method

.method private createPurchesdTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    :try_start_0
    const-string v0, "DROP TABLE IF EXISTS buy"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE buy (_id INTEGER PRIMARY KEY AUTOINCREMENT ,p_id TEXT ,p_package_name TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const-string v1, "couldn\'t create buy table in market database"

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    throw v0
.end method

.method private createSearchHistoryTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    :try_start_0
    const-string v0, "DROP TABLE IF EXISTS search_history"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE search_history(_id INTEGER PRIMARY KEY AUTOINCREMENT, keyword TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const-string v1, "couldn\'t create search_history table in market database"

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    throw v0
.end method

.method private createUpdateTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    :try_start_0
    const-string v0, "DROP TABLE IF EXISTS updates"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE updates(_id INTEGER PRIMARY KEY AUTOINCREMENT, p_id TEXT, p_package_name TEXT, p_new_version_name TEXT, p_new_version_code TEXT, p_signature TEXT, p_update_ingore INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const-string v1, "couldn\'t create updates table in market database"

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    const-string v0, "create the new database..."

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    const/4 v0, 0x0

    const/16 v1, 0x47

    invoke-virtual {p0, p1, v0, v1}, Lcom/mappn/gfan/common/util/MarketProvider$DatabaseHelper;->onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V

    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 3

    const-string v0, "update the database..."

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    if-ge p2, p3, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/MarketProvider$DatabaseHelper;->this$0:Lcom/mappn/gfan/common/util/MarketProvider;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/util/MarketProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/mappn/gfan/Session;->setUpdataCheckTime(J)V

    iget-object v0, p0, Lcom/mappn/gfan/common/util/MarketProvider$DatabaseHelper;->this$0:Lcom/mappn/gfan/common/util/MarketProvider;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/util/MarketProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/Session;->setUpgradeNumber(I)V

    const-string v0, "DROP TABLE IF EXISTS installed"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_0
    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/util/MarketProvider$DatabaseHelper;->createSearchHistoryTable(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/util/MarketProvider$DatabaseHelper;->createUpdateTable(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/util/MarketProvider$DatabaseHelper;->createPurchesdTable(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/util/MarketProvider$DatabaseHelper;->createCardTable(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/util/MarketProvider$DatabaseHelper;->createLogTable(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void
.end method
