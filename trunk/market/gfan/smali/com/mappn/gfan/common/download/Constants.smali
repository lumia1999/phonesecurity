.class public Lcom/mappn/gfan/common/download/Constants;
.super Ljava/lang/Object;


# static fields
.field public static final ACTION_HIDE:Ljava/lang/String; = "gfan.intent.action.DOWNLOAD_HIDE"

.field public static final ACTION_LIST:Ljava/lang/String; = "gfan.intent.action.DOWNLOAD_LIST"

.field public static final ACTION_OPEN:Ljava/lang/String; = "gfan.intent.action.DOWNLOAD_OPEN"

.field public static final ACTION_RETRY:Ljava/lang/String; = "gfan.intent.action.DOWNLOAD_WAKEUP"

.field public static final BUFFER_SIZE:I = 0x1000

.field public static final DEFAULT_BBS_SUBDIR:Ljava/lang/String; = "gfan/bbs"

.field public static final DEFAULT_CLOUD_SUBDIR:Ljava/lang/String; = "gfan/cloud"

.field public static final DEFAULT_DL_BINARY_EXTENSION:Ljava/lang/String; = ".bin"

.field public static final DEFAULT_DL_FILENAME:Ljava/lang/String; = "downloadfile"

.field public static final DEFAULT_DL_HTML_EXTENSION:Ljava/lang/String; = ".html"

.field public static final DEFAULT_DL_TEXT_EXTENSION:Ljava/lang/String; = ".txt"

.field public static final DEFAULT_MARKET_SUBDIR:Ljava/lang/String; = "gfan/market"

.field public static final DEFAULT_SUBDIR:Ljava/lang/String; = "gfan/others"

.field public static final DESTINATION_CACHE_PARTITION:I = 0x1

.field public static final DESTINATION_EXTERNAL:I = 0x0

.field public static final DOWNLOAD_FROM_BBS:I = 0x1

.field public static final DOWNLOAD_FROM_CLOUD:I = 0x2

.field public static final DOWNLOAD_FROM_MARKET:I = 0x0

.field public static final DOWNLOAD_FROM_OTA:I = 0x3

.field public static final FILENAME_SEQUENCE_SEPARATOR:Ljava/lang/String; = "-"

.field public static final KNOWN_SPURIOUS_FILENAME:Ljava/lang/String; = "lost+found"

.field public static final MAX_DOWNLOADS:I = 0x3e8

.field public static final MAX_REDIRECTS:I = 0x5

.field public static final MAX_RETRIES:I = 0x5

.field public static final MAX_RETRY_AFTER:I = 0x15180

.field public static final MIMETYPE_APK:Ljava/lang/String; = "application/vnd.android.package-archive"

.field public static final MIMETYPE_IMAGE:Ljava/lang/String; = "image/*"

.field public static final MIN_PROGRESS_STEP:I = 0x1000

.field public static final MIN_PROGRESS_TIME:J = 0x5dcL

.field public static final MIN_RETRY_AFTER:I = 0x1e

.field public static final RECOVERY_DIRECTORY:Ljava/lang/String; = "recovery"

.field public static final RETRY_FIRST_DELAY:I = 0x1e


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
