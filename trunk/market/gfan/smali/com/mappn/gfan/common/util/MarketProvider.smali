.class public Lcom/mappn/gfan/common/util/MarketProvider;
.super Landroid/content/ContentProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/common/util/MarketProvider$1;,
        Lcom/mappn/gfan/common/util/MarketProvider$DatabaseHelper;,
        Lcom/mappn/gfan/common/util/MarketProvider$SqlSelection;
    }
.end annotation


# static fields
.field public static final BUY_CONTENT_URI:Landroid/net/Uri; = null

.field private static final BUY_PRODUCT:I = 0x5

.field private static final CARD:I = 0x6

.field public static final CARD_CONTENT_URI:Landroid/net/Uri; = null

.field public static final COLUMN_CARD_ACCOUNTNUM:Ljava/lang/String; = "card_account_num"

.field public static final COLUMN_CARD_CREDIT:Ljava/lang/String; = "card_credit"

.field public static final COLUMN_CARD_NAME:Ljava/lang/String; = "card_name"

.field public static final COLUMN_CARD_PASSWORDNUM:Ljava/lang/String; = "card_password_num"

.field public static final COLUMN_CARD_PAY_TYPE:Ljava/lang/String; = "card_pay_type"

.field public static final COLUMN_CONTENT:Ljava/lang/String; = "content"

.field public static final COLUMN_ID:Ljava/lang/String; = "_id"

.field public static final COLUMN_LEVEL:Ljava/lang/String; = "level"

.field public static final COLUMN_MODULE:Ljava/lang/String; = "module"

.field public static final COLUMN_NETWORK:Ljava/lang/String; = "network"

.field public static final COLUMN_P_CATEGORY:Ljava/lang/String; = "p_category"

.field public static final COLUMN_P_ICON_URL:Ljava/lang/String; = "p_icon_url"

.field public static final COLUMN_P_ID:Ljava/lang/String; = "p_id"

.field public static final COLUMN_P_IGNORE:Ljava/lang/String; = "p_update_ingore"

.field public static final COLUMN_P_IS_RECOMMEND:Ljava/lang/String; = "p_is_recommend"

.field public static final COLUMN_P_NAME:Ljava/lang/String; = "p_name"

.field public static final COLUMN_P_NEW_VERSION_CODE:Ljava/lang/String; = "p_new_version_code"

.field public static final COLUMN_P_NEW_VERSION_NAME:Ljava/lang/String; = "p_new_version_name"

.field public static final COLUMN_P_PACKAGE_NAME:Ljava/lang/String; = "p_package_name"

.field public static final COLUMN_P_PAYMENT_TYPE:Ljava/lang/String; = "p_payment_type"

.field public static final COLUMN_P_PRICE:Ljava/lang/String; = "p_price"

.field public static final COLUMN_P_SIGNATURE:Ljava/lang/String; = "p_signature"

.field public static final COLUMN_P_SIZE:Ljava/lang/String; = "p_size"

.field public static final COLUMN_SEARCH_KEY_WORD:Ljava/lang/String; = "keyword"

.field public static final COLUMN_TIME:Ljava/lang/String; = "create_time"

.field private static final DB_NAME:Ljava/lang/String; = "market.db"

.field private static final DB_VERSION:I = 0x47

.field private static final ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/"

.field private static final LIST_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/"

.field private static final LOG:I = 0x7

.field public static final LOG_CONTENT_URI:Landroid/net/Uri; = null

.field private static final PRODUCTS:I = 0x3

.field public static final PRODUCTS_CONTENT_URI:Landroid/net/Uri; = null

.field public static final SEARCH_CONTENT_URI:Landroid/net/Uri; = null

.field private static final SEARCH_HISTORY:I = 0x1

.field private static final SEARCH_HISTORY_ID:I = 0x2

.field public static final TABLE_BUY:Ljava/lang/String; = "buy"

.field public static final TABLE_CARD:Ljava/lang/String; = "card"

.field public static final TABLE_LOG:Ljava/lang/String; = "log"

.field public static final TABLE_PRODUCTS:Ljava/lang/String; = "products"

.field public static final TABLE_SEARCH_HISTORY:Ljava/lang/String; = "search_history"

.field public static final TABLE_UPDATES:Ljava/lang/String; = "updates"

.field public static final UPDATE_CONTENT_URI:Landroid/net/Uri; = null

.field private static final UPDATE_PRODUCT:I = 0x4

.field private static final sURIMatcher:Landroid/content/UriMatcher;


# instance fields
.field private mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/mappn/gfan/common/util/MarketProvider;->sURIMatcher:Landroid/content/UriMatcher;

    sget-object v0, Lcom/mappn/gfan/common/util/MarketProvider;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gfan"

    const-string v2, "search_history"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/mappn/gfan/common/util/MarketProvider;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gfan"

    const-string v2, "search_history/#"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/mappn/gfan/common/util/MarketProvider;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gfan"

    const-string v2, "products"

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/mappn/gfan/common/util/MarketProvider;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gfan"

    const-string v2, "updates"

    const/4 v3, 0x4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/mappn/gfan/common/util/MarketProvider;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gfan"

    const-string v2, "buy"

    const/4 v3, 0x5

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/mappn/gfan/common/util/MarketProvider;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gfan"

    const-string v2, "card"

    const/4 v3, 0x6

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/mappn/gfan/common/util/MarketProvider;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gfan"

    const-string v2, "log"

    const/4 v3, 0x7

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "content://gfan/search_history"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mappn/gfan/common/util/MarketProvider;->SEARCH_CONTENT_URI:Landroid/net/Uri;

    const-string v0, "content://gfan/products"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mappn/gfan/common/util/MarketProvider;->PRODUCTS_CONTENT_URI:Landroid/net/Uri;

    const-string v0, "content://gfan/updates"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mappn/gfan/common/util/MarketProvider;->UPDATE_CONTENT_URI:Landroid/net/Uri;

    const-string v0, "content://gfan/buy"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mappn/gfan/common/util/MarketProvider;->BUY_CONTENT_URI:Landroid/net/Uri;

    const-string v0, "content://gfan/card"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mappn/gfan/common/util/MarketProvider;->CARD_CONTENT_URI:Landroid/net/Uri;

    const-string v0, "content://gfan/log"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mappn/gfan/common/util/MarketProvider;->LOG_CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mappn/gfan/common/util/MarketProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    return-void
.end method

.method private static getTableFromUri(Landroid/net/Uri;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method private static getWhereClause(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Lcom/mappn/gfan/common/util/MarketProvider$SqlSelection;
    .locals 2

    new-instance v0, Lcom/mappn/gfan/common/util/MarketProvider$SqlSelection;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/mappn/gfan/common/util/MarketProvider$SqlSelection;-><init>(Lcom/mappn/gfan/common/util/MarketProvider$1;)V

    invoke-virtual {v0, p1, p2}, Lcom/mappn/gfan/common/util/MarketProvider$SqlSelection;->appendClause(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0
.end method

.method private static logVerboseQueryInfo([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4

    const/4 v3, 0x0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "starting query, database is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p4, :cond_0

    const-string v1, "not "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    const-string v1, "null; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p0, :cond_3

    const-string v1, "projection is null; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    :goto_0
    const-string v1, "selection is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p2, :cond_5

    const-string v1, "selectionArgs is null; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    :goto_1
    const-string v1, "sort is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    return-void

    :cond_3
    array-length v1, p0

    if-nez v1, :cond_4

    const-string v1, "projection is empty; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_4
    move v1, v3

    :goto_2
    array-length v2, p0

    if-ge v1, v2, :cond_1

    const-string v2, "projection["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] is "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v2, p0, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "; "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_5
    array-length v1, p2

    if-nez v1, :cond_6

    const-string v1, "selectionArgs is empty; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_6
    move v1, v3

    :goto_3
    array-length v2, p2

    if-ge v1, v2, :cond_2

    const-string v2, "selectionArgs["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] is "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v2, p2, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "; "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_3
.end method

.method private notifyContentChanged(Landroid/net/Uri;I)V
    .locals 2

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/MarketProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 5

    sget-object v0, Lcom/mappn/gfan/common/util/MarketProvider;->sURIMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    iget-object v1, p0, Lcom/mappn/gfan/common/util/MarketProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-static {p1}, Lcom/mappn/gfan/common/util/MarketProvider;->getTableFromUri(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, p2, p3}, Lcom/mappn/gfan/common/util/MarketProvider;->getWhereClause(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Lcom/mappn/gfan/common/util/MarketProvider$SqlSelection;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mappn/gfan/common/util/MarketProvider$SqlSelection;->getSelection()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Lcom/mappn/gfan/common/util/MarketProvider$SqlSelection;->getParameters()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v4, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "couldn\'t delete URI "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    move v0, v1

    :goto_0
    return v0

    :cond_0
    invoke-direct {p0, p1, v0}, Lcom/mappn/gfan/common/util/MarketProvider;->notifyContentChanged(Landroid/net/Uri;I)V

    move v0, v1

    goto :goto_0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mappn/gfan/common/util/MarketProvider;->sURIMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :pswitch_0
    const-string v0, "vnd.android.cursor.dir/search_history"

    goto :goto_0

    :pswitch_1
    const-string v0, "vnd.android.cursor.item/search_history"

    goto :goto_0

    :pswitch_2
    const-string v0, "vnd.android.cursor.dir/products"

    goto :goto_0

    :pswitch_3
    const-string v0, "vnd.android.cursor.dir/updates"

    goto :goto_0

    :pswitch_4
    const-string v0, "vnd.android.cursor.dir/buy"

    goto :goto_0

    :pswitch_5
    const-string v0, "vnd.android.cursor.dir/card"

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 8

    const/4 v7, 0x0

    sget-object v0, Lcom/mappn/gfan/common/util/MarketProvider;->sURIMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    iget-object v1, p0, Lcom/mappn/gfan/common/util/MarketProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-static {p1}, Lcom/mappn/gfan/common/util/MarketProvider;->getTableFromUri(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v7, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v3

    const-wide/16 v5, -0x1

    cmp-long v1, v3, v5

    if-nez v1, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "couldn\'t insert into "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " database"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    move-object v0, v7

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p1, v3, v4}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {p0, p1, v0}, Lcom/mappn/gfan/common/util/MarketProvider;->notifyContentChanged(Landroid/net/Uri;I)V

    move-object v0, v1

    goto :goto_0
.end method

.method public onCreate()Z
    .locals 2

    new-instance v0, Lcom/mappn/gfan/common/util/MarketProvider$DatabaseHelper;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/MarketProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/mappn/gfan/common/util/MarketProvider$DatabaseHelper;-><init>(Lcom/mappn/gfan/common/util/MarketProvider;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/MarketProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    const/4 v0, 0x1

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 9

    const/4 v8, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/MarketProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    sget-object v1, Lcom/mappn/gfan/common/util/MarketProvider;->sURIMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v1, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "querying unknown URI: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown URI: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-static {p1, p3, p4}, Lcom/mappn/gfan/common/util/MarketProvider;->getWhereClause(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Lcom/mappn/gfan/common/util/MarketProvider$SqlSelection;

    move-result-object v2

    invoke-static {p2, p3, p4, p5, v0}, Lcom/mappn/gfan/common/util/MarketProvider;->logVerboseQueryInfo([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-static {p1}, Lcom/mappn/gfan/common/util/MarketProvider;->getTableFromUri(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    :try_start_0
    invoke-virtual {v2}, Lcom/mappn/gfan/common/util/MarketProvider$SqlSelection;->getSelection()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Lcom/mappn/gfan/common/util/MarketProvider$SqlSelection;->getParameters()[Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, p2

    move-object v7, p5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    if-nez v0, :cond_1

    const-string v1, "query failed in market database"

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    :cond_1
    return-object v0

    :catch_0
    move-exception v0

    const-string v1, "query error"

    invoke-static {v1, v0}, Lcom/mappn/gfan/common/util/Utils;->E(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v0, v8

    goto :goto_0
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/common/util/MarketProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    sget-object v1, Lcom/mappn/gfan/common/util/MarketProvider;->sURIMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v1, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updating unknown URI: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown URI: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-static {p1}, Lcom/mappn/gfan/common/util/MarketProvider;->getTableFromUri(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method
