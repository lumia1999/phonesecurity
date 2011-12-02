.class public Lcom/mappn/gfan/common/MarketAPI;
.super Ljava/lang/Object;


# static fields
.field public static final ACTION_ADD_COMMENT:I = 0x3

.field public static final ACTION_ADD_DISCUSS:I = 0x2e

.field public static final ACTION_ADD_RATING:I = 0x4

.field public static final ACTION_ADD_RECOMMEND_RATING:I = 0x2f

.field public static final ACTION_BBS_SEARCH:I = 0x27

.field public static final ACTION_BIND_ACCOUNT:I = 0x14

.field public static final ACTION_CHARGE:I = 0x17

.field public static final ACTION_CHECK_LOG_LEVEL:I = 0x28

.field public static final ACTION_CHECK_NEW_SPLASH:I = 0x1c

.field public static final ACTION_CHECK_NEW_VERSION:I = 0x11

.field public static final ACTION_CHECK_UPGRADE:I = 0x13

.field public static final ACTION_DOWN_REPORT:I = 0x2c

.field public static final ACTION_GET_ALIPAY_ORDER_INFO:I = 0x1f

.field public static final ACTION_GET_ALL_CATEGORY:I = 0x25

.field public static final ACTION_GET_BALANCE:I = 0x15

.field public static final ACTION_GET_CATEGORY:I = 0x12

.field public static final ACTION_GET_COMMENTS:I = 0x2

.field public static final ACTION_GET_CONSUMESUM:I = 0x6

.field public static final ACTION_GET_CONSUME_DETAIL:I = 0x9

.field public static final ACTION_GET_DETAIL:I = 0x1e

.field public static final ACTION_GET_DISCUSS:I = 0x2d

.field public static final ACTION_GET_DOWNLOAD_URL:I = 0xf

.field public static final ACTION_GET_GROW_FAST:I = 0x24

.field public static final ACTION_GET_HOME_RECOMMEND:I = 0x10

.field public static final ACTION_GET_MASTER_RECOMMEND:I = 0x2a

.field public static final ACTION_GET_MASTER_RECOMMEND_APPS:I = 0x2b

.field public static final ACTION_GET_MYRATING:I = 0x8

.field public static final ACTION_GET_PAY_LOG:I = 0x16

.field public static final ACTION_GET_PRODUCTS:I = 0xc

.field public static final ACTION_GET_PRODUCT_DETAIL:I = 0xe

.field public static final ACTION_GET_RANK_BY_CATEGORY:I = 0x23

.field public static final ACTION_GET_RECOMMEND_NOTIFICATION:I = 0x31

.field public static final ACTION_GET_RECOMMEND_PRODUCTS:I = 0xd

.field public static final ACTION_GET_RECOMMEND_RATING:I = 0x30

.field public static final ACTION_GET_REQUIRED:I = 0x26

.field public static final ACTION_GET_SEARCH_KEYWORDS:I = 0x21

.field public static final ACTION_GET_TOPIC:I = 0xa

.field public static final ACTION_GET_TOP_RECOMMEND:I = 0x22

.field public static final ACTION_INSERT_LOG:I = 0x29

.field public static final ACTION_LOGIN:I = 0x0

.field public static final ACTION_PURCHASE_PRODUCT:I = 0x5

.field public static final ACTION_QUERY_ALIPAY_RESULT:I = 0x20

.field public static final ACTION_QUERY_CHARGE:I = 0x1a

.field public static final ACTION_QUERY_CHARGE_BY_ORDERID:I = 0x19

.field public static final ACTION_REGISTER:I = 0x1

.field public static final ACTION_SEARCH:I = 0xb

.field public static final ACTION_SYNC_APPS:I = 0x1b

.field public static final ACTION_SYNC_BUYLOG:I = 0x7

.field public static final ACTION_SYNC_CARDINFO:I = 0x18

.field public static final ACTION_UNBIND:I = 0x1d

.field public static final API_BASE_URL:Ljava/lang/String; = "http://api.gfan.com/"

.field public static final API_HOST_CLOUD:Ljava/lang/String; = "http://passport.gfan.com/gfan_center/"

.field public static final API_HOST_JAVA:Ljava/lang/String; = "http://api.gfan.com/market/api/"

.field public static final API_UCENTER_HOST:Ljava/lang/String; = "http://api.gfan.com/uc1/common/"

.field static final API_URLS:[Ljava/lang/String; = null

.field public static final BBS_SEARCH_API:Ljava/lang/String; = "http://search.gfan.com/search/search/luntanAttJk"

.field private static final LOG_HOST:Ljava/lang/String; = "http://logcollect.gfan.com"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0x32

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "http://api.gfan.com/uc1/common/login"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "http://api.gfan.com/uc1/common/register"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "http://api.gfan.com/market/api/getComments"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "http://api.gfan.com/market/api/addComment"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "http://api.gfan.com/market/api/addRating"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "http://api.gfan.com/sdk/pay/purchaseProduct"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "http://api.gfan.com/sdk/pay/getConsumeSum"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "http://api.gfan.com/market/api/syncBuyLog"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "http://api.gfan.com/market/api/getMyRating"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "http://api.gfan.com/sdk/pay/getConsumeDetail"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "http://api.gfan.com/market/api/getTopic"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "http://api.gfan.com/market/api/search"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "http://api.gfan.com/market/api/getProducts"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "http://api.gfan.com/market/api/getRecommendProducts"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "http://api.gfan.com/market/api/getProductDetail"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "http://api.gfan.com/market/api/getDownloadUrl"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "http://api.gfan.com/market/api/getHomeRecommend"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "http://api.gfan.com/market/api/checkNewVersion"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "http://api.gfan.com/market/api/getCategory"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "http://api.gfan.com/market/api/checkUpgrade"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "http://passport.gfan.com/gfan_center/?mo=cloud_phone&do=addDev"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "http://api.gfan.com/uc1/common/query_balance"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "http://api.gfan.com/sdk/pay/chargeConsumeLog"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "http://api.gfan.com/pay/szf/servlet/rechargeRequest"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "http://api.gfan.com/pay/szf/getCardConfigServlet"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, "http://api.gfan.com/pay/szf/sdk/queryServlet"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "http://api.gfan.com/uc1/common/query_charge_log_list"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "http://api.gfan.com/market/api/syncApps"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "http://api.gfan.com/market/api/checkNewSplash"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string v2, "http://passport.gfan.com/gfan_center/?mo=cloud_phone&do=delDev&uid="

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    const-string v2, "http://api.gfan.com/market/api/getDetail"

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string v2, "http://api.gfan.com/pay/szf/servlet/businessProcess.do"

    aput-object v2, v0, v1

    const/16 v1, 0x20

    const-string v2, "http://api.gfan.com/pay/szf/servlet/businessProcess.do"

    aput-object v2, v0, v1

    const/16 v1, 0x21

    const-string v2, "http://api.gfan.com/market/api/getKeywords"

    aput-object v2, v0, v1

    const/16 v1, 0x22

    const-string v2, "http://api.gfan.com/market/api/getTopRecommend"

    aput-object v2, v0, v1

    const/16 v1, 0x23

    const-string v2, "http://api.gfan.com/market/api/getRankByCategory"

    aput-object v2, v0, v1

    const/16 v1, 0x24

    const-string v2, "http://api.gfan.com/market/api/getGrowFast"

    aput-object v2, v0, v1

    const/16 v1, 0x25

    const-string v2, "http://api.gfan.com/market/api/getAllCategory"

    aput-object v2, v0, v1

    const/16 v1, 0x26

    const-string v2, "http://api.gfan.com/market/api/getRequired"

    aput-object v2, v0, v1

    const/16 v1, 0x27

    const-string v2, "http://search.gfan.com/search/search/luntanAttJk"

    aput-object v2, v0, v1

    const/16 v1, 0x28

    const-string v2, "http://logcollect.gfan.com/marketExceptionReport/api/getModuleLogLevel"

    aput-object v2, v0, v1

    const/16 v1, 0x29

    const-string v2, "http://logcollect.gfan.com/marketExceptionReport/api/insertModuleExceptionLog"

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    const-string v2, "http://api.gfan.com/market/api/masterRecommend"

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    const-string v2, "http://api.gfan.com/market/api/masterRecommendApps"

    aput-object v2, v0, v1

    const/16 v1, 0x2c

    const-string v2, "http://api.gfan.com/market/api/downReport"

    aput-object v2, v0, v1

    const/16 v1, 0x2d

    const-string v2, "http://api.gfan.com/market/api/masterRecommendDiscuss"

    aput-object v2, v0, v1

    const/16 v1, 0x2e

    const-string v2, "http://api.gfan.com/market/api/addMasterRecommendDiscuss"

    aput-object v2, v0, v1

    const/16 v1, 0x2f

    const-string v2, "http://api.gfan.com/market/api/addMasterRecommendRating"

    aput-object v2, v0, v1

    const/16 v1, 0x30

    const-string v2, "http://api.gfan.com/market/api/masterRecommendRating"

    aput-object v2, v0, v1

    const/16 v1, 0x31

    const-string v2, "http://api.gfan.com/market/api/notification"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mappn/gfan/common/MarketAPI;->API_URLS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addComment(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    const/4 v6, 0x3

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getPassword()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/SecurityUtil;->encryptPassword(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUserName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/codec/digest/DigestUtils;->md5(Ljava/lang/String;)[B

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getUTF8String([B)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3, v6}, Ljava/util/HashMap;-><init>(I)V

    const-string v4, "p_id"

    invoke-virtual {v3, v4, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "uid"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUid()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "comment"

    invoke-virtual {v3, v4, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "username"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUserName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "password"

    invoke-virtual {v3, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "verify_code"

    invoke-virtual {v3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    invoke-direct {v0, p0, v6, p1, v3}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static addMasterRecommendDiscuss(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getPassword()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/SecurityUtil;->encryptPassword(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUserName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/codec/digest/DigestUtils;->md5(Ljava/lang/String;)[B

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getUTF8String([B)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/util/HashMap;

    const/4 v4, 0x6

    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(I)V

    const-string v4, "uid"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUid()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "content"

    invoke-virtual {v3, v4, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "promotion_id"

    invoke-virtual {v3, v4, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "username"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUserName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "password"

    invoke-virtual {v3, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "verify_code"

    invoke-virtual {v3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v1, 0x2e

    invoke-direct {v0, p0, v1, p1, v3}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static addMasterRecommendRating(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;ILjava/lang/String;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "promotion_id"

    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "rating"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x2f

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static addRating(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;I)V
    .locals 6

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getPassword()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/SecurityUtil;->encryptPassword(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUserName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/codec/digest/DigestUtils;->md5(Ljava/lang/String;)[B

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getUTF8String([B)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/util/HashMap;

    const/4 v4, 0x6

    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(I)V

    const-string v4, "p_id"

    invoke-virtual {v3, v4, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "uid"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUid()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "rating"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "username"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUserName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "password"

    invoke-virtual {v3, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "verify_code"

    invoke-virtual {v3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1, p1, v3}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static bindAccount(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V
    .locals 4

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "uid"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "devid"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getDeviceId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "imei"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getIMEI()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "phonemodel"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getModel()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "version"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x14

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static charge(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;Lcom/mappn/gfan/common/vo/CardInfo;)V
    .locals 4

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x7

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "user_id"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "password"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUid()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/mappn/gfan/common/util/SecurityUtil;->encryptPassword(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "type"

    invoke-virtual {v1, v0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "pay_type"

    iget-object v2, p4, Lcom/mappn/gfan/common/vo/CardInfo;->payType:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "card_account"

    iget-object v2, p4, Lcom/mappn/gfan/common/vo/CardInfo;->cardAccount:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "card_password"

    iget-object v2, p4, Lcom/mappn/gfan/common/vo/CardInfo;->cardPassword:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "card_credit"

    iget v2, p4, Lcom/mappn/gfan/common/vo/CardInfo;->cardCredit:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x17

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static checkLogLevel(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V
    .locals 4

    const/4 v3, 0x0

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "download"

    aput-object v1, v0, v3

    const/4 v1, 0x1

    const-string v2, "crash_mobile"

    aput-object v2, v0, v1

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x28

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    new-array v0, v3, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static checkNewSplash(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V
    .locals 5

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "package_name"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "version_code"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getVersionCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "sdk_id"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getCpid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "time"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getSplashTime()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x1c

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static checkUpdate(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V
    .locals 4

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "package_name"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "version_code"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getVersionCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "sdk_id"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getCpid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "type"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getDebugType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x11

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static checkUpgrade(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "upgradeList"

    invoke-static {p0}, Lcom/mappn/gfan/common/util/Utils;->getInstalledApps(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x13

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getAliPayOrder(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;ILjava/lang/String;Ljava/lang/String;)V
    .locals 3

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "uid"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUid()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "money"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "productName"

    invoke-virtual {v1, v0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "productDesc"

    invoke-virtual {v1, v0, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x1f

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getAllCategory(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v1

    const-string v2, "platform"

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getOsVersion()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "screen_size"

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getScreenSize()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "match_type"

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->isFilterApps()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x25

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getBalance(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V
    .locals 3

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "uid"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUid()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x15

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getCategory(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;)V
    .locals 4

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x5

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "local_version"

    const/4 v3, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "category_cord"

    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "platform"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getOsVersion()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "screen_size"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getScreenSize()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "match_type"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isFilterApps()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x12

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getComments(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;II)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "p_id"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "size"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "start_position"

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getConsumeDetail(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "uid"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "type"

    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x9

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getConsumeSum(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "uid"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/4 v2, 0x6

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getDownloadUrl(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "p_id"

    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "uid"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUid()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "source_type"

    invoke-virtual {v1, v0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0xf

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getGrowFast(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;II)V
    .locals 4

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x5

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "size"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "start_position"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "platform"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getOsVersion()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "screen_size"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getScreenSize()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "match_type"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isFilterApps()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x24

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getHomeRecommend(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;II)V
    .locals 4

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x5

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "size"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "start_position"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "platform"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getOsVersion()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "screen_size"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getScreenSize()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "match_type"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isFilterApps()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x10

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getMasterRecommend(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;II)V
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v1

    const-string v2, "platform"

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getOsVersion()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "screen_size"

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getScreenSize()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "match_type"

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->isFilterApps()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "size"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "start_position"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x2a

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getMasterRecommendApps(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;IILjava/lang/String;)V
    .locals 4

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "size"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "start_position"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "platform"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getOsVersion()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "screen_size"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getScreenSize()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "promotion_id"

    invoke-virtual {v1, v2, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "match_type"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isFilterApps()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x2b

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getMasterRecommendDiscuss(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;IILjava/lang/String;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "size"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "start_position"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "promotion_id"

    invoke-virtual {v0, v1, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x2d

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getMasterRecommendRating(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "promotion_id"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x30

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getMyRating(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;)V
    .locals 3

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "uid"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUid()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "p_id"

    invoke-virtual {v1, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x8

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getNotificationRecommend(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v1

    const-string v2, "platform"

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getOsVersion()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "screen_size"

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getScreenSize()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "match_type"

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->isFilterApps()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x31

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getPayLog(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;II)V
    .locals 3

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "uid"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUid()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "start_position"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "size"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x16

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getProductDetailWithId(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;ILjava/lang/String;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "local_version"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "p_id"

    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "source_type"

    invoke-virtual {v0, v1, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0xe

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getProductDetailWithPackageName(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;ILjava/lang/String;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "local_version"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "packagename"

    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x1e

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getProducts(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;IIILjava/lang/String;)V
    .locals 4

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "size"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "start_position"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "platform"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getOsVersion()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "screen_size"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getScreenSize()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "orderby"

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "category_id"

    invoke-virtual {v1, v2, p5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "match_type"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isFilterApps()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0xc

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getRankByCategory(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;IILjava/lang/String;)V
    .locals 4

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "size"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "start_position"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "category"

    invoke-virtual {v1, v2, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "platform"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getOsVersion()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "screen_size"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getScreenSize()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "match_type"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isFilterApps()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x23

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getRecommendProducts(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;II)V
    .locals 4

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "type"

    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "size"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "start_position"

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "platform"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getOsVersion()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "screen_size"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getScreenSize()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "match_type"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isFilterApps()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0xd

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getRequired(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v1

    const-string v2, "platform"

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getOsVersion()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "screen_size"

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getScreenSize()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "match_type"

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->isFilterApps()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x26

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getSearchFromBBS(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;II)V
    .locals 4

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "searchWord"

    invoke-direct {v1, v2, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "startPosition"

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "size"

    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x27

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getSearchKeywords(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "size"

    const/16 v2, 0xf

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x21

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getTopRecommend(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v1

    const-string v2, "platform"

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getOsVersion()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "screen_size"

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getScreenSize()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "match_type"

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->isFilterApps()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x22

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static getTopic(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V
    .locals 4

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "platform"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getOsVersion()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "screen_size"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getScreenSize()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "match_type"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isFilterApps()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0xa

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static login(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    const/4 v2, 0x0

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "username"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "password"

    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    new-array v0, v2, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static purchaseProduct(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUserName()Ljava/lang/String;

    move-result-object v1

    invoke-static {p3, v1}, Lcom/mappn/gfan/common/util/SecurityUtil;->encryptPassword(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUserName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/codec/digest/DigestUtils;->md5(Ljava/lang/String;)[B

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getUTF8String([B)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/util/HashMap;

    const/4 v4, 0x4

    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(I)V

    const-string v4, "pid"

    invoke-virtual {v3, v4, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "username"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUserName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "password"

    invoke-virtual {v3, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "verify_code"

    invoke-virtual {v3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1, p1, v3}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static queryAliPayResult(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "orderNo"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x20

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static queryChargeResult(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "order_id"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x19

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static register(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "username"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "password"

    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "email"

    invoke-virtual {v0, v1, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2, p1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static search(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;IIILjava/lang/String;)V
    .locals 4

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x7

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "size"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "start_position"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "platform"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getOsVersion()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "screen_size"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getScreenSize()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "orderby"

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "keyword"

    invoke-virtual {v1, v2, p5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "match_type"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isFilterApps()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0xb

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static submitAllInstalledApps(Landroid/content/Context;)V
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "appList"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x1b

    const/4 v3, 0x0

    invoke-direct {v1, p0, v2, v3, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static submitDownloadLog(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 4

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/16 v2, 0x8

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUid()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v2, "-1"

    :cond_0
    const-string v3, "uid"

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "p_id"

    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "source_type"

    invoke-virtual {v1, v2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "url"

    invoke-virtual {v1, v2, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "cpid"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getCpid()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "net_context"

    invoke-virtual {v1, v0, p5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "report_type"

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "package_name"

    invoke-virtual {v1, v0, p7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x2c

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static submitLogs(Landroid/content/Context;ILjava/lang/String;)V
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "module"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "level"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x29

    new-instance v3, Lcom/mappn/gfan/common/MarketAPI$1;

    invoke-direct {v3, p0, p2, p1}, Lcom/mappn/gfan/common/MarketAPI$1;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    invoke-direct {v1, p0, v2, v3, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static syncBuyLog(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V
    .locals 3

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "uid"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUid()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/4 v2, 0x7

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static syncCardInfo(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V
    .locals 3

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "local_version"

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getCreditCardVersion()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v2, 0x18

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static unbindAccount(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V
    .locals 3

    new-instance v0, Lcom/mappn/gfan/common/ApiAsyncTask;

    const/16 v1, 0x1d

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, p1, v2}, Lcom/mappn/gfan/common/ApiAsyncTask;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/Object;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/ApiAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
