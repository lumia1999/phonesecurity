.class public Lcom/mappn/gfan/common/ApiResponseFactory;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getPayAndChargeLog(Ljava/util/List;Lcom/mappn/gfan/common/vo/PayAndChargeLogs;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mappn/gfan/common/util/XmlElement;",
            ">;",
            "Lcom/mappn/gfan/common/vo/PayAndChargeLogs;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    if-eqz p0, :cond_3

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/util/XmlElement;

    new-instance v1, Lcom/mappn/gfan/common/vo/PayAndChargeLog;

    invoke-direct {v1}, Lcom/mappn/gfan/common/vo/PayAndChargeLog;-><init>()V

    const-string v2, "flag"

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->name:Ljava/lang/String;

    const-string v2, "order_id"

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->id:I

    const-string v2, "description"

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->desc:Ljava/lang/String;

    const-string v2, "create_time"

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/mappn/gfan/common/util/Utils;->formatDate(J)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->time:Ljava/lang/String;

    const-string v2, "money"

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getFloat(Ljava/lang/String;)F

    move-result v2

    float-to-int v2, v2

    iput v2, v1, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->payment:I

    const-string v2, "consume"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    iput v2, v1, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->type:I

    :cond_0
    :goto_1
    iget-object v2, p1, Lcom/mappn/gfan/common/vo/PayAndChargeLogs;->payAndChargeLogList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const-string v2, "charge"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v2, 0x3

    iput v2, v1, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->type:I

    goto :goto_1

    :cond_2
    const-string v2, "buy_app"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "p_id"

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->id:I

    const-string v2, "name"

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->name:Ljava/lang/String;

    const-string v2, "icon_url"

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->iconUrl:Ljava/lang/String;

    const/4 v2, 0x2

    iput v2, v1, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->type:I

    const-string v2, "source_type"

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->sourceType:I

    goto :goto_1

    :cond_3
    return-void
.end method

.method public static getResponse(Landroid/content/Context;ILorg/apache/http/HttpResponse;)Ljava/lang/Object;
    .locals 6

    const/4 v4, 0x0

    const/16 v0, 0x1f

    if-eq v0, p1, :cond_0

    const/16 v0, 0x20

    if-ne v0, p1, :cond_1

    :cond_0
    invoke-static {p2}, Lcom/mappn/gfan/common/util/Utils;->getStringResponse(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_6

    move-object v0, v4

    :goto_0
    return-object v0

    :cond_1
    const/16 v0, 0x28

    if-eq v0, p1, :cond_2

    const/16 v0, 0x29

    if-ne v0, p1, :cond_3

    :cond_2
    invoke-static {p2}, Lcom/mappn/gfan/common/util/Utils;->getGzipStringResponse(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_6

    move-object v0, v4

    goto :goto_0

    :cond_3
    invoke-static {p2}, Lcom/mappn/gfan/common/util/Utils;->getInputStreamResponse(Lorg/apache/http/HttpResponse;)Ljava/io/InputStream;

    move-result-object v0

    if-nez v0, :cond_4

    move-object v0, v4

    goto :goto_0

    :cond_4
    move-object v1, v0

    move-object v0, v4

    :goto_1
    const-string v2, ""

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    move-object v0, v4

    move-object v1, v2

    :goto_2
    if-eqz v0, :cond_5

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'s Response is : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    :try_start_0
    const-string v0, "ACTION_REGISTER"
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    :try_start_1
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseLoginOrRegisterResult(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/util/HashMap;
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_2

    :pswitch_2
    :try_start_2
    const-string v0, "ACTION_LOGIN"
    :try_end_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    :try_start_3
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseLoginOrRegisterResult(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/util/HashMap;
    :try_end_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_7
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_2

    :pswitch_3
    :try_start_4
    const-string v0, "ACTION_GET_TOP_RECOMMEND"
    :try_end_4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_2

    :try_start_5
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseTopRecommend(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/util/ArrayList;
    :try_end_5
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5 .. :try_end_5} :catch_7
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_2

    :pswitch_4
    :try_start_6
    const-string v0, "ACTION_GET_HOME_RECOMMEND"
    :try_end_6
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_2

    :try_start_7
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseProductList(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;Z)Ljava/util/HashMap;
    :try_end_7
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_7 .. :try_end_7} :catch_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_2

    :pswitch_5
    :try_start_8
    const-string v0, "ACTION_GET_SEARCH_KEYWORDS"
    :try_end_8
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_8 .. :try_end_8} :catch_0
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_1
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_2

    :try_start_9
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseSearchKeywords(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/util/ArrayList;
    :try_end_9
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_9 .. :try_end_9} :catch_7
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_5
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_2

    :pswitch_6
    :try_start_a
    const-string v0, "ACTION_GET_COMMENTS"
    :try_end_a
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_a .. :try_end_a} :catch_0
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_1
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_2

    :try_start_b
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseComments(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    :try_end_b
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_b .. :try_end_b} :catch_7
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_5
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_b} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_2

    :pswitch_7
    :try_start_c
    const-string v0, "ACTION_GET_MYRATING"
    :try_end_c
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_c .. :try_end_c} :catch_0
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_1
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_c} :catch_2

    :try_start_d
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseMyRating(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    :try_end_d
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_d .. :try_end_d} :catch_7
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_5
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_d} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_8
    :try_start_e
    const-string v0, "ACTION_ADD_RATIONG"
    :try_end_e
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_e .. :try_end_e} :catch_0
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_1
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_e} :catch_2

    const/4 v1, 0x1

    :try_start_f
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_f
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_f .. :try_end_f} :catch_7
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_5
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_f} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_9
    :try_start_10
    const-string v0, "ACTION_ADD_COMMENT"
    :try_end_10
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_10 .. :try_end_10} :catch_0
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_1
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_10} :catch_2

    const/4 v1, 0x1

    :try_start_11
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_11
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_11 .. :try_end_11} :catch_7
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_5
    .catch Lorg/json/JSONException; {:try_start_11 .. :try_end_11} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_a
    :try_start_12
    const-string v0, "ACTION_GET_PRODUCT_DETAIL"
    :try_end_12
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_12 .. :try_end_12} :catch_0
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_1
    .catch Lorg/json/JSONException; {:try_start_12 .. :try_end_12} :catch_2

    :try_start_13
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseProductDetail(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    :try_end_13
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_13 .. :try_end_13} :catch_7
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_5
    .catch Lorg/json/JSONException; {:try_start_13 .. :try_end_13} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_b
    :try_start_14
    const-string v0, "ACTION_GET_RANK_BY_CATEGORY"
    :try_end_14
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_14 .. :try_end_14} :catch_0
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_1
    .catch Lorg/json/JSONException; {:try_start_14 .. :try_end_14} :catch_2

    :try_start_15
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseProductList(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;Z)Ljava/util/HashMap;
    :try_end_15
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_15 .. :try_end_15} :catch_7
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_15} :catch_5
    .catch Lorg/json/JSONException; {:try_start_15 .. :try_end_15} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_c
    :try_start_16
    const-string v0, "ACTION_GET_GROW_FAST"
    :try_end_16
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_16 .. :try_end_16} :catch_0
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_16} :catch_1
    .catch Lorg/json/JSONException; {:try_start_16 .. :try_end_16} :catch_2

    :try_start_17
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseProductList(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;Z)Ljava/util/HashMap;
    :try_end_17
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_17 .. :try_end_17} :catch_7
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_17} :catch_5
    .catch Lorg/json/JSONException; {:try_start_17 .. :try_end_17} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_d
    :try_start_18
    const-string v0, "ACTION_GET_DETAIL"
    :try_end_18
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_18 .. :try_end_18} :catch_0
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_18} :catch_1
    .catch Lorg/json/JSONException; {:try_start_18 .. :try_end_18} :catch_2

    :try_start_19
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseProductDetail(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    :try_end_19
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_19 .. :try_end_19} :catch_7
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_19} :catch_5
    .catch Lorg/json/JSONException; {:try_start_19 .. :try_end_19} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_e
    :try_start_1a
    const-string v0, "ACTION_SYNC_BUYLOG"
    :try_end_1a
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1a .. :try_end_1a} :catch_0
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1a} :catch_1
    .catch Lorg/json/JSONException; {:try_start_1a .. :try_end_1a} :catch_2

    :try_start_1b
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseSyncBuyLog(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    :try_end_1b
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1b .. :try_end_1b} :catch_7
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_1b} :catch_5
    .catch Lorg/json/JSONException; {:try_start_1b .. :try_end_1b} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_f
    :try_start_1c
    const-string v0, "ACTION_SYNC_APPS"
    :try_end_1c
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1c .. :try_end_1c} :catch_0
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_1c} :catch_1
    .catch Lorg/json/JSONException; {:try_start_1c .. :try_end_1c} :catch_2

    :try_start_1d
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseSyncApps(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    :try_end_1d
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1d .. :try_end_1d} :catch_7
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_1d} :catch_5
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_1d} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_10
    :try_start_1e
    const-string v0, "ACTION_CHECK_NEW_VERSION"
    :try_end_1e
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1e .. :try_end_1e} :catch_0
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_1e} :catch_1
    .catch Lorg/json/JSONException; {:try_start_1e .. :try_end_1e} :catch_2

    :try_start_1f
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseCheckNewVersion(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    :try_end_1f
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1f .. :try_end_1f} :catch_7
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_1f} :catch_5
    .catch Lorg/json/JSONException; {:try_start_1f .. :try_end_1f} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_11
    :try_start_20
    const-string v0, "ACTION_PURCHASE_PRODUCT"
    :try_end_20
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_20 .. :try_end_20} :catch_0
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_20} :catch_1
    .catch Lorg/json/JSONException; {:try_start_20 .. :try_end_20} :catch_2

    const/4 v1, 0x1

    :try_start_21
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_21
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_21 .. :try_end_21} :catch_7
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_21} :catch_5
    .catch Lorg/json/JSONException; {:try_start_21 .. :try_end_21} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_12
    :try_start_22
    const-string v0, "ACTION_GET_DOWNLOAD_URL"
    :try_end_22
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_22 .. :try_end_22} :catch_0
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_22} :catch_1
    .catch Lorg/json/JSONException; {:try_start_22 .. :try_end_22} :catch_2

    :try_start_23
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseDownloadInfo(Lcom/mappn/gfan/common/util/XmlElement;)Lcom/mappn/gfan/common/vo/DownloadItem;
    :try_end_23
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_23 .. :try_end_23} :catch_7
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_23} :catch_5
    .catch Lorg/json/JSONException; {:try_start_23 .. :try_end_23} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_13
    :try_start_24
    const-string v0, "ACTION_GET_ALL_CATEGORY"
    :try_end_24
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_24 .. :try_end_24} :catch_0
    .catch Ljava/io/IOException; {:try_start_24 .. :try_end_24} :catch_1
    .catch Lorg/json/JSONException; {:try_start_24 .. :try_end_24} :catch_2

    :try_start_25
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseAllCategory(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/util/ArrayList;
    :try_end_25
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_25 .. :try_end_25} :catch_7
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_25} :catch_5
    .catch Lorg/json/JSONException; {:try_start_25 .. :try_end_25} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_14
    :try_start_26
    const-string v0, "ACTION_GET_PRODUCTS"
    :try_end_26
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_26 .. :try_end_26} :catch_0
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_26} :catch_1
    .catch Lorg/json/JSONException; {:try_start_26 .. :try_end_26} :catch_2

    :try_start_27
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseProductList(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;Z)Ljava/util/HashMap;
    :try_end_27
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_27 .. :try_end_27} :catch_7
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_27} :catch_5
    .catch Lorg/json/JSONException; {:try_start_27 .. :try_end_27} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_15
    :try_start_28
    const-string v0, "ACTION_GET_RECOMMEND_PRODUCTS"
    :try_end_28
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_28 .. :try_end_28} :catch_0
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_28} :catch_1
    .catch Lorg/json/JSONException; {:try_start_28 .. :try_end_28} :catch_2

    :try_start_29
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseProductList(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;Z)Ljava/util/HashMap;
    :try_end_29
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_29 .. :try_end_29} :catch_7
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_29} :catch_5
    .catch Lorg/json/JSONException; {:try_start_29 .. :try_end_29} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_16
    :try_start_2a
    const-string v0, "ACTION_BBS_SEARCH"
    :try_end_2a
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2a .. :try_end_2a} :catch_0
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_2a} :catch_1
    .catch Lorg/json/JSONException; {:try_start_2a .. :try_end_2a} :catch_2

    :try_start_2b
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseBbsSearchResult(Ljava/lang/String;)Ljava/util/HashMap;
    :try_end_2b
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2b .. :try_end_2b} :catch_7
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_2b} :catch_5
    .catch Lorg/json/JSONException; {:try_start_2b .. :try_end_2b} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_17
    :try_start_2c
    const-string v0, "ACTION_SEARCH"
    :try_end_2c
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2c .. :try_end_2c} :catch_0
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_2c} :catch_1
    .catch Lorg/json/JSONException; {:try_start_2c .. :try_end_2c} :catch_2

    :try_start_2d
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseProductList(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;Z)Ljava/util/HashMap;
    :try_end_2d
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2d .. :try_end_2d} :catch_7
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_2d} :catch_5
    .catch Lorg/json/JSONException; {:try_start_2d .. :try_end_2d} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_18
    :try_start_2e
    const-string v0, "ACTION_GET_REQUIRED"
    :try_end_2e
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2e .. :try_end_2e} :catch_0
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_2e} :catch_1
    .catch Lorg/json/JSONException; {:try_start_2e .. :try_end_2e} :catch_2

    :try_start_2f
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseGetRequired(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    :try_end_2f
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2f .. :try_end_2f} :catch_7
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_2f} :catch_5
    .catch Lorg/json/JSONException; {:try_start_2f .. :try_end_2f} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_19
    :try_start_30
    const-string v0, "ACTION_GET_TOPIC"
    :try_end_30
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_30 .. :try_end_30} :catch_0
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_30} :catch_1
    .catch Lorg/json/JSONException; {:try_start_30 .. :try_end_30} :catch_2

    :try_start_31
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseTopicList(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;)Ljava/util/ArrayList;
    :try_end_31
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_31 .. :try_end_31} :catch_7
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_31} :catch_5
    .catch Lorg/json/JSONException; {:try_start_31 .. :try_end_31} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_1a
    :try_start_32
    const-string v0, "ACTION_CHECK_UPGRADE"
    :try_end_32
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_32 .. :try_end_32} :catch_0
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_32} :catch_1
    .catch Lorg/json/JSONException; {:try_start_32 .. :try_end_32} :catch_2

    :try_start_33
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseUpgrade(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/String;
    :try_end_33
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_33 .. :try_end_33} :catch_7
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_33} :catch_5
    .catch Lorg/json/JSONException; {:try_start_33 .. :try_end_33} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_1b
    :try_start_34
    const-string v0, "ACTION_CHECK_NEW_SPLASH"
    :try_end_34
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_34 .. :try_end_34} :catch_0
    .catch Ljava/io/IOException; {:try_start_34 .. :try_end_34} :catch_1
    .catch Lorg/json/JSONException; {:try_start_34 .. :try_end_34} :catch_2

    :try_start_35
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseNewSplash(Lcom/mappn/gfan/common/util/XmlElement;)Lcom/mappn/gfan/common/vo/SplashInfo;
    :try_end_35
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_35 .. :try_end_35} :catch_7
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_35} :catch_5
    .catch Lorg/json/JSONException; {:try_start_35 .. :try_end_35} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_1c
    :try_start_36
    const-string v0, "ACTION_GET_PAY_LOG"
    :try_end_36
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_36 .. :try_end_36} :catch_0
    .catch Ljava/io/IOException; {:try_start_36 .. :try_end_36} :catch_1
    .catch Lorg/json/JSONException; {:try_start_36 .. :try_end_36} :catch_2

    :try_start_37
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseGetPayLog(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;)Lcom/mappn/gfan/common/vo/PayAndChargeLogs;
    :try_end_37
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_37 .. :try_end_37} :catch_7
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_37} :catch_5
    .catch Lorg/json/JSONException; {:try_start_37 .. :try_end_37} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_1d
    :try_start_38
    const-string v0, "ACTION_BIND_ACCOUNT"
    :try_end_38
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_38 .. :try_end_38} :catch_0
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_38} :catch_1
    .catch Lorg/json/JSONException; {:try_start_38 .. :try_end_38} :catch_2

    const/4 v1, 0x1

    :try_start_39
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_39
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_39 .. :try_end_39} :catch_7
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_39} :catch_5
    .catch Lorg/json/JSONException; {:try_start_39 .. :try_end_39} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_1e
    :try_start_3a
    const-string v0, "ACTION_SYNC_CARDINFO"
    :try_end_3a
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3a .. :try_end_3a} :catch_0
    .catch Ljava/io/IOException; {:try_start_3a .. :try_end_3a} :catch_1
    .catch Lorg/json/JSONException; {:try_start_3a .. :try_end_3a} :catch_2

    :try_start_3b
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseSyncCardinfo(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;)Lcom/mappn/gfan/common/vo/CardsVerifications;
    :try_end_3b
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3b .. :try_end_3b} :catch_7
    .catch Ljava/io/IOException; {:try_start_3b .. :try_end_3b} :catch_5
    .catch Lorg/json/JSONException; {:try_start_3b .. :try_end_3b} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_1f
    :try_start_3c
    const-string v0, "ACTION_CHARGE"
    :try_end_3c
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3c .. :try_end_3c} :catch_0
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_3c} :catch_1
    .catch Lorg/json/JSONException; {:try_start_3c .. :try_end_3c} :catch_2

    :try_start_3d
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseChargeResult(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/String;
    :try_end_3d
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3d .. :try_end_3d} :catch_7
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_3d} :catch_5
    .catch Lorg/json/JSONException; {:try_start_3d .. :try_end_3d} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_20
    :try_start_3e
    const-string v0, "ACTION_QUERY_CHARGE_BY_ORDERID"
    :try_end_3e
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3e .. :try_end_3e} :catch_0
    .catch Ljava/io/IOException; {:try_start_3e .. :try_end_3e} :catch_1
    .catch Lorg/json/JSONException; {:try_start_3e .. :try_end_3e} :catch_2

    :try_start_3f
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseQueryChargeResultByOderID(Lcom/mappn/gfan/common/util/XmlElement;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_3f
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3f .. :try_end_3f} :catch_7
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_3f} :catch_5
    .catch Lorg/json/JSONException; {:try_start_3f .. :try_end_3f} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_21
    :try_start_40
    const-string v0, "ACTION_GET_BALANCE"
    :try_end_40
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_40 .. :try_end_40} :catch_0
    .catch Ljava/io/IOException; {:try_start_40 .. :try_end_40} :catch_1
    .catch Lorg/json/JSONException; {:try_start_40 .. :try_end_40} :catch_2

    :try_start_41
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseGetBalance(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/String;
    :try_end_41
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_41 .. :try_end_41} :catch_7
    .catch Ljava/io/IOException; {:try_start_41 .. :try_end_41} :catch_5
    .catch Lorg/json/JSONException; {:try_start_41 .. :try_end_41} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_22
    :try_start_42
    const-string v1, "ACTION_GET_ALIPAY_ORDER_INFO"
    :try_end_42
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_42 .. :try_end_42} :catch_0
    .catch Ljava/io/IOException; {:try_start_42 .. :try_end_42} :catch_1
    .catch Lorg/json/JSONException; {:try_start_42 .. :try_end_42} :catch_2

    :try_start_43
    invoke-static {v0}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseGetAlipayOrderInfo(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_43
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_43 .. :try_end_43} :catch_8
    .catch Ljava/io/IOException; {:try_start_43 .. :try_end_43} :catch_6
    .catch Lorg/json/JSONException; {:try_start_43 .. :try_end_43} :catch_4

    move-result-object v0

    goto/16 :goto_2

    :pswitch_23
    :try_start_44
    const-string v1, "ACTION_QUERY_ALIPAY_RESULT"
    :try_end_44
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_44 .. :try_end_44} :catch_0
    .catch Ljava/io/IOException; {:try_start_44 .. :try_end_44} :catch_1
    .catch Lorg/json/JSONException; {:try_start_44 .. :try_end_44} :catch_2

    :try_start_45
    invoke-static {v0}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseGetAlipayOrderInfo(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_45
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_45 .. :try_end_45} :catch_8
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_45} :catch_6
    .catch Lorg/json/JSONException; {:try_start_45 .. :try_end_45} :catch_4

    move-result-object v0

    goto/16 :goto_2

    :pswitch_24
    :try_start_46
    const-string v0, "ACTION_UNBIND"
    :try_end_46
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_46 .. :try_end_46} :catch_0
    .catch Ljava/io/IOException; {:try_start_46 .. :try_end_46} :catch_1
    .catch Lorg/json/JSONException; {:try_start_46 .. :try_end_46} :catch_2

    const/4 v1, 0x1

    :try_start_47
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_47
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_47 .. :try_end_47} :catch_7
    .catch Ljava/io/IOException; {:try_start_47 .. :try_end_47} :catch_5
    .catch Lorg/json/JSONException; {:try_start_47 .. :try_end_47} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_25
    :try_start_48
    const-string v1, "ACTION_CHECK_LOG_LEVEL"
    :try_end_48
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_48 .. :try_end_48} :catch_0
    .catch Ljava/io/IOException; {:try_start_48 .. :try_end_48} :catch_1
    .catch Lorg/json/JSONException; {:try_start_48 .. :try_end_48} :catch_2

    :try_start_49
    invoke-static {v0}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseLogLevel(Ljava/lang/String;)Ljava/util/HashMap;
    :try_end_49
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_49 .. :try_end_49} :catch_8
    .catch Ljava/io/IOException; {:try_start_49 .. :try_end_49} :catch_6
    .catch Lorg/json/JSONException; {:try_start_49 .. :try_end_49} :catch_4

    move-result-object v0

    goto/16 :goto_2

    :pswitch_26
    :try_start_4a
    const-string v1, "ACTION_INSERT_LOG"
    :try_end_4a
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4a .. :try_end_4a} :catch_0
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_4a} :catch_1
    .catch Lorg/json/JSONException; {:try_start_4a .. :try_end_4a} :catch_2

    :try_start_4b
    invoke-static {v0}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseSubmitLog(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_4b
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4b .. :try_end_4b} :catch_8
    .catch Ljava/io/IOException; {:try_start_4b .. :try_end_4b} :catch_6
    .catch Lorg/json/JSONException; {:try_start_4b .. :try_end_4b} :catch_4

    move-result-object v0

    goto/16 :goto_2

    :pswitch_27
    :try_start_4c
    const-string v0, "ACTION_GET_MASTER_RECOMMEND"
    :try_end_4c
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4c .. :try_end_4c} :catch_0
    .catch Ljava/io/IOException; {:try_start_4c .. :try_end_4c} :catch_1
    .catch Lorg/json/JSONException; {:try_start_4c .. :try_end_4c} :catch_2

    :try_start_4d
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseMasterRecommend(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    :try_end_4d
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4d .. :try_end_4d} :catch_7
    .catch Ljava/io/IOException; {:try_start_4d .. :try_end_4d} :catch_5
    .catch Lorg/json/JSONException; {:try_start_4d .. :try_end_4d} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_28
    :try_start_4e
    const-string v0, "ACTION_GET_MASTER_RECOMMEND_APPS"
    :try_end_4e
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4e .. :try_end_4e} :catch_0
    .catch Ljava/io/IOException; {:try_start_4e .. :try_end_4e} :catch_1
    .catch Lorg/json/JSONException; {:try_start_4e .. :try_end_4e} :catch_2

    :try_start_4f
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseProductList(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;Z)Ljava/util/HashMap;
    :try_end_4f
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4f .. :try_end_4f} :catch_7
    .catch Ljava/io/IOException; {:try_start_4f .. :try_end_4f} :catch_5
    .catch Lorg/json/JSONException; {:try_start_4f .. :try_end_4f} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_29
    :try_start_50
    const-string v0, "ACTION_GET_DISCUSS"
    :try_end_50
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_50 .. :try_end_50} :catch_0
    .catch Ljava/io/IOException; {:try_start_50 .. :try_end_50} :catch_1
    .catch Lorg/json/JSONException; {:try_start_50 .. :try_end_50} :catch_2

    :try_start_51
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseGetDiscuss(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    :try_end_51
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_51 .. :try_end_51} :catch_7
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_51} :catch_5
    .catch Lorg/json/JSONException; {:try_start_51 .. :try_end_51} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_2a
    :try_start_52
    const-string v0, "ACTION_ADD_DISCUSS"
    :try_end_52
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_52 .. :try_end_52} :catch_0
    .catch Ljava/io/IOException; {:try_start_52 .. :try_end_52} :catch_1
    .catch Lorg/json/JSONException; {:try_start_52 .. :try_end_52} :catch_2

    const/4 v1, 0x1

    :try_start_53
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_53
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_53 .. :try_end_53} :catch_7
    .catch Ljava/io/IOException; {:try_start_53 .. :try_end_53} :catch_5
    .catch Lorg/json/JSONException; {:try_start_53 .. :try_end_53} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_2b
    :try_start_54
    const-string v0, "ACTION_ADD_RECOMMEND_RATING"
    :try_end_54
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_54 .. :try_end_54} :catch_0
    .catch Ljava/io/IOException; {:try_start_54 .. :try_end_54} :catch_1
    .catch Lorg/json/JSONException; {:try_start_54 .. :try_end_54} :catch_2

    const/4 v1, 0x1

    :try_start_55
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_55
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_55 .. :try_end_55} :catch_7
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_55} :catch_5
    .catch Lorg/json/JSONException; {:try_start_55 .. :try_end_55} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_2c
    :try_start_56
    const-string v0, "ACTION_GET_RECOMMEND_RATING"
    :try_end_56
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_56 .. :try_end_56} :catch_0
    .catch Ljava/io/IOException; {:try_start_56 .. :try_end_56} :catch_1
    .catch Lorg/json/JSONException; {:try_start_56 .. :try_end_56} :catch_2

    :try_start_57
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseRecommendRating(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/String;
    :try_end_57
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_57 .. :try_end_57} :catch_7
    .catch Ljava/io/IOException; {:try_start_57 .. :try_end_57} :catch_5
    .catch Lorg/json/JSONException; {:try_start_57 .. :try_end_57} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_2d
    :try_start_58
    const-string v0, "ACTION_DOWN_REPORT"
    :try_end_58
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_58 .. :try_end_58} :catch_0
    .catch Ljava/io/IOException; {:try_start_58 .. :try_end_58} :catch_1
    .catch Lorg/json/JSONException; {:try_start_58 .. :try_end_58} :catch_2

    const/4 v1, 0x1

    :try_start_59
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_59
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_59 .. :try_end_59} :catch_7
    .catch Ljava/io/IOException; {:try_start_59 .. :try_end_59} :catch_5
    .catch Lorg/json/JSONException; {:try_start_59 .. :try_end_59} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :pswitch_2e
    :try_start_5a
    const-string v0, "ACTION_GET_RECOMMEND_NOTIFICATION"
    :try_end_5a
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5a .. :try_end_5a} :catch_0
    .catch Ljava/io/IOException; {:try_start_5a .. :try_end_5a} :catch_1
    .catch Lorg/json/JSONException; {:try_start_5a .. :try_end_5a} :catch_2

    :try_start_5b
    invoke-static {v1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/ApiResponseFactory;->parseNotificationRecommend(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/util/HashMap;
    :try_end_5b
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5b .. :try_end_5b} :catch_7
    .catch Ljava/io/IOException; {:try_start_5b .. :try_end_5b} :catch_5
    .catch Lorg/json/JSONException; {:try_start_5b .. :try_end_5b} :catch_3

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_2

    :catch_0
    move-exception v0

    move-object v1, v2

    :goto_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " has XmlPullParserException"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v0, v4

    goto/16 :goto_2

    :catch_1
    move-exception v0

    move-object v1, v2

    :goto_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " has IOException"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v0, v4

    goto/16 :goto_2

    :catch_2
    move-exception v0

    move-object v1, v2

    :goto_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " has JSONException"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v0, v4

    goto/16 :goto_2

    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'s Response is null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    goto/16 :goto_0

    :catch_3
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_5

    :catch_4
    move-exception v0

    goto :goto_5

    :catch_5
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_4

    :catch_6
    move-exception v0

    goto :goto_4

    :catch_7
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_3

    :catch_8
    move-exception v0

    goto :goto_3

    :cond_6
    move-object v1, v4

    goto/16 :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_6
        :pswitch_9
        :pswitch_8
        :pswitch_11
        :pswitch_0
        :pswitch_e
        :pswitch_7
        :pswitch_0
        :pswitch_19
        :pswitch_17
        :pswitch_14
        :pswitch_15
        :pswitch_a
        :pswitch_12
        :pswitch_4
        :pswitch_10
        :pswitch_0
        :pswitch_1a
        :pswitch_1d
        :pswitch_21
        :pswitch_1c
        :pswitch_1f
        :pswitch_1e
        :pswitch_20
        :pswitch_0
        :pswitch_f
        :pswitch_1b
        :pswitch_24
        :pswitch_d
        :pswitch_22
        :pswitch_23
        :pswitch_5
        :pswitch_3
        :pswitch_b
        :pswitch_c
        :pswitch_13
        :pswitch_18
        :pswitch_16
        :pswitch_25
        :pswitch_26
        :pswitch_27
        :pswitch_28
        :pswitch_2d
        :pswitch_29
        :pswitch_2a
        :pswitch_2b
        :pswitch_2c
        :pswitch_2e
    .end packed-switch
.end method

.method private static parseAllCategory(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/util/ArrayList;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mappn/gfan/common/util/XmlElement;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v14, 0x1

    const/4 v13, 0x2

    const/4 v12, 0x0

    if-nez p0, :cond_0

    move-object v0, v1

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "category"

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/util/XmlElement;->getChildren(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_f

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move v2, v14

    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_9

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/util/XmlElement;

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const-string v4, "category_name"

    const-string v5, "category_name"

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "app_count"

    const-string v5, "app_count"

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "icon_url"

    const-string v5, "icon_url"

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sub_category"

    invoke-virtual {p0, v5, v12}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v5

    const-string v6, "category_name"

    invoke-virtual {v5, v6}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "sub_category"

    invoke-virtual {p0, v5, v14}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v5

    if-eqz v5, :cond_1

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "category_name"

    invoke-virtual {v5, v6}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :cond_1
    const-string v5, "sub_category"

    invoke-virtual {p0, v5, v13}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v5

    if-eqz v5, :cond_2

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "category_name"

    invoke-virtual {v5, v6}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :cond_2
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_3

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v13

    invoke-virtual {v4, v12, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    :cond_3
    const-string v5, "top_app"

    invoke-virtual {v3, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "sub_category"

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getChildren(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/util/XmlElement;

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    const-string v7, "category_id"

    const-string v8, "category_id"

    invoke-virtual {p0, v8}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "category_name"

    const-string v8, "category_name"

    invoke-virtual {p0, v8}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "app_count"

    const-string v8, "app_count"

    invoke-virtual {p0, v8}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "icon_url"

    const-string v8, "icon_url"

    invoke-virtual {p0, v8}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "app_1"

    invoke-virtual {p0, v7}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "app_2"

    invoke-virtual {p0, v8}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "app_3"

    invoke-virtual {p0, v9}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_5

    const-string v7, ""

    :goto_3
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_6

    const-string v8, ""

    :goto_4
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_7

    const-string v8, ""

    :goto_5
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_4

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    sub-int/2addr v8, v13

    invoke-virtual {v7, v12, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    :cond_4
    const-string v8, "top_app"

    invoke-virtual {v6, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    :cond_5
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v11, ", "

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_3

    :cond_6
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, ", "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_4

    :cond_7
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_5

    :cond_8
    const-string v4, "sub_category"

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    :cond_9
    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/util/XmlElement;

    const-string v0, "sub_category"

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/util/XmlElement;->getChildren(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/util/XmlElement;

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string v3, "category_id"

    const-string v4, "category_id"

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "category_name"

    const-string v4, "category_name"

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "app_count"

    const-string v4, "app_count"

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "icon_url"

    const-string v4, "icon_url"

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "app_1"

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "app_2"

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "app_3"

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_b

    const-string v3, ""

    :goto_7
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_c

    const-string v4, ""

    :goto_8
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_d

    const-string v4, ""

    :goto_9
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_a

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v13

    invoke-virtual {v3, v12, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    :cond_a
    const-string v4, "top_app"

    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_6

    :cond_b
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ", "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_7

    :cond_c
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ", "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_8

    :cond_d
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_9

    :cond_e
    move-object v0, v1

    goto/16 :goto_0

    :cond_f
    move-object v0, v1

    goto/16 :goto_0
.end method

.method private static parseBbsSearchResult(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    const/4 v2, 0x0

    const/4 v12, 0x0

    if-nez p0, :cond_0

    move-object v0, v2

    :goto_0
    return-object v0

    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    const-string v2, "total_size"

    const-string v3, "totalSize"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "end_position"

    const-string v3, "endPosition"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "bbsAttJkVOList"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lez v2, :cond_3

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move v4, v12

    :goto_1
    if-ge v4, v2, :cond_2

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "search_result_title"

    const-string v8, "subject"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "place_holder"

    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v5, "bbsAttJkFileVOList"

    invoke-virtual {v6, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v6

    move v7, v12

    :goto_2
    if-ge v7, v6, :cond_1

    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v5, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "place_holder"

    const/4 v11, 0x0

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-virtual {v8, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v10, "search_result_title"

    const-string v11, "fileName"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v10, "downloadUrl"

    const-string v11, "downloadUrl"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_2
    const-string v0, "bbsAttJkVOList"

    invoke-virtual {v1, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    :cond_3
    move-object v0, v1

    goto/16 :goto_0

    :catch_0
    move-exception v0

    move-object v1, v2

    :goto_3
    const-string v2, "have json exception when parse search result from bbs"

    invoke-static {v2, v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v0, v1

    goto/16 :goto_0

    :catch_1
    move-exception v0

    goto :goto_3
.end method

.method private static parseChargeResult(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/String;
    .locals 3

    const/4 v2, 0x0

    if-nez p0, :cond_0

    move-object v0, v2

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "pay_result"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "order_id"

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    move-object v0, v2

    goto :goto_0
.end method

.method private static parseCheckNewVersion(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    .locals 6

    const/4 v5, 0x0

    const/4 v4, 0x0

    if-nez p1, :cond_0

    move-object v0, v5

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "update_level"

    invoke-virtual {p1, v0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/common/util/XmlElement;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v0

    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "aMarket.apk"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_1
    if-nez v0, :cond_2

    move-object v0, v5

    goto :goto_0

    :cond_2
    new-instance v1, Lcom/mappn/gfan/common/vo/UpdateInfo;

    invoke-direct {v1}, Lcom/mappn/gfan/common/vo/UpdateInfo;-><init>()V

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/vo/UpdateInfo;->setUpdageLevel(I)V

    const-string v0, "version_code"

    invoke-virtual {p1, v0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/mappn/gfan/common/util/XmlElement;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/vo/UpdateInfo;->setVersionCode(I)V

    :cond_3
    const-string v0, "version_name"

    invoke-virtual {p1, v0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lcom/mappn/gfan/common/util/XmlElement;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/vo/UpdateInfo;->setVersionName(Ljava/lang/String;)V

    :cond_4
    const-string v0, "description"

    invoke-virtual {p1, v0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Lcom/mappn/gfan/common/util/XmlElement;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/vo/UpdateInfo;->setDescription(Ljava/lang/String;)V

    :cond_5
    const-string v0, "apk_url"

    invoke-virtual {p1, v0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Lcom/mappn/gfan/common/util/XmlElement;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/vo/UpdateInfo;->setApkUrl(Ljava/lang/String;)V

    :cond_6
    move-object v0, v1

    goto :goto_0
.end method

.method private static parseComments(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    .locals 7

    const/4 v2, 0x0

    if-nez p0, :cond_0

    move-object v0, v2

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "comments"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-eqz v0, :cond_3

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "total_size"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v2

    const-string v3, "total_size"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-lez v2, :cond_2

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const-string v3, "comment"

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getChildren(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/util/XmlElement;

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const-string v4, "comment_id"

    const-string v5, "comment_id"

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "author"

    const-string v5, "author"

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "comment"

    const-string v5, "comment"

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "date"

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mappn/gfan/common/util/Utils;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    const-string v6, "date"

    invoke-static {v4, v5}, Lcom/mappn/gfan/common/util/Utils;->formatTime(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    const-string v0, "comment_list"

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    move-object v0, v1

    goto/16 :goto_0

    :cond_3
    move-object v0, v2

    goto/16 :goto_0
.end method

.method private static parseDownloadInfo(Lcom/mappn/gfan/common/util/XmlElement;)Lcom/mappn/gfan/common/vo/DownloadItem;
    .locals 3

    const/4 v2, 0x0

    if-nez p0, :cond_0

    move-object v0, v2

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "download_info"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-eqz v0, :cond_1

    new-instance v1, Lcom/mappn/gfan/common/vo/DownloadItem;

    invoke-direct {v1}, Lcom/mappn/gfan/common/vo/DownloadItem;-><init>()V

    const-string v2, "p_id"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mappn/gfan/common/vo/DownloadItem;->pId:Ljava/lang/String;

    const-string v2, "packagename"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mappn/gfan/common/vo/DownloadItem;->packageName:Ljava/lang/String;

    const-string v2, "url"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mappn/gfan/common/vo/DownloadItem;->url:Ljava/lang/String;

    const-string v2, "filemd5"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/mappn/gfan/common/vo/DownloadItem;->fileMD5:Ljava/lang/String;

    move-object v0, v1

    goto :goto_0

    :cond_1
    move-object v0, v2

    goto :goto_0
.end method

.method private static parseGetAlipayOrderInfo(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-static {p0}, Lcom/mappn/gfan/common/codec/binary/Base64;->decodeBase64(Ljava/lang/String;)[B

    move-result-object v0

    new-instance v1, Lorg/json/JSONObject;

    new-instance v2, Ljava/lang/String;

    new-instance v3, Lcom/mappn/gfan/common/util/Crypter;

    invoke-direct {v3}, Lcom/mappn/gfan/common/util/Crypter;-><init>()V

    sget-object v4, Lcom/mappn/gfan/common/util/SecurityUtil;->SECRET_KEY_HTTP_CHARGE_ALIPAY:[B

    invoke-virtual {v3, v0, v4}, Lcom/mappn/gfan/common/util/Crypter;->decrypt([B[B)[B

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([B)V

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    return-object v1
.end method

.method private static parseGetBalance(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/String;
    .locals 3

    const/4 v2, 0x0

    if-nez p0, :cond_0

    move-object v0, v2

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "result"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/mappn/gfan/common/util/XmlElement;->getText()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    move-object v0, v2

    goto :goto_0
.end method

.method private static parseGetDiscuss(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    .locals 7

    const/4 v2, 0x0

    if-nez p0, :cond_0

    move-object v0, v2

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "discusses"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-eqz v0, :cond_4

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "total_size"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v2

    const-string v3, "total_size"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-lez v2, :cond_3

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const-string v3, "discuss"

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getChildren(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/util/XmlElement;

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const-string v4, "id"

    const-string v5, "id"

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "author"

    const-string v5, "1"

    const-string v6, "is_owner"

    invoke-virtual {p0, v6}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "author"

    invoke-virtual {p0, v6}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " (\u697c\u4e3b)"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_2
    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "date"

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mappn/gfan/common/util/Utils;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    const-string v6, "date"

    invoke-static {v4, v5}, Lcom/mappn/gfan/common/util/Utils;->formatTime(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "content"

    const-string v5, "content"

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "is_owner"

    const-string v5, "is_owner"

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    const-string v5, "author"

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_2

    :cond_2
    const-string v0, "comment_list"

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    move-object v0, v1

    goto/16 :goto_0

    :cond_4
    move-object v0, v2

    goto/16 :goto_0
.end method

.method private static parseGetPayLog(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;)Lcom/mappn/gfan/common/vo/PayAndChargeLogs;
    .locals 4

    const/4 v2, 0x0

    if-nez p1, :cond_0

    move-object v0, v2

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "logs"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-eqz v0, :cond_1

    new-instance v1, Lcom/mappn/gfan/common/vo/PayAndChargeLogs;

    invoke-direct {v1}, Lcom/mappn/gfan/common/vo/PayAndChargeLogs;-><init>()V

    const-string v2, "end_position"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Lcom/mappn/gfan/common/vo/PayAndChargeLogs;->endPosition:I

    const-string v2, "total_size"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Lcom/mappn/gfan/common/vo/PayAndChargeLogs;->totalSize:I

    const-string v2, "consume"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getChildren(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    const-string v3, "consume"

    invoke-static {v2, v1, v3}, Lcom/mappn/gfan/common/ApiResponseFactory;->getPayAndChargeLog(Ljava/util/List;Lcom/mappn/gfan/common/vo/PayAndChargeLogs;Ljava/lang/String;)V

    const-string v2, "charge"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getChildren(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    const-string v3, "charge"

    invoke-static {v2, v1, v3}, Lcom/mappn/gfan/common/ApiResponseFactory;->getPayAndChargeLog(Ljava/util/List;Lcom/mappn/gfan/common/vo/PayAndChargeLogs;Ljava/lang/String;)V

    const-string v2, "buy_app"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getChildren(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    const-string v2, "buy_app"

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/ApiResponseFactory;->getPayAndChargeLog(Ljava/util/List;Lcom/mappn/gfan/common/vo/PayAndChargeLogs;Ljava/lang/String;)V

    move-object v0, v1

    goto :goto_0

    :cond_1
    move-object v0, v2

    goto :goto_0
.end method

.method private static parseGetRequired(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    .locals 9

    const/4 v2, 0x0

    const/4 v8, 0x1

    const/4 v7, 0x0

    if-nez p1, :cond_0

    move-object v0, v2

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "req_category"

    invoke-virtual {p1, v0}, Lcom/mappn/gfan/common/util/XmlElement;->getChildren(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_4

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mappn/gfan/Session;->getInstalledApps()Ljava/util/ArrayList;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/util/XmlElement;

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const-string v4, "place_holder"

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "app_title"

    const-string v5, "name"

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "product"

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getChildren(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eqz v4, :cond_1

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/util/XmlElement;

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    const-string v5, "place_holder"

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v5, "p_id"

    const-string v6, "p_id"

    invoke-virtual {p0, v6}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v5, "logo"

    const-string v6, "icon_url"

    invoke-virtual {p0, v6}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v5, "app_title"

    const-string v6, "name"

    invoke-virtual {p0, v6}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v5, "app_detail"

    const-string v6, "short_description"

    invoke-virtual {p0, v6}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v5, "packagename"

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "packagename"

    invoke-virtual {v4, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const-string v5, "is_installed"

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    const-string v5, "is_checked"

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_3
    move-object v0, v1

    goto/16 :goto_0

    :cond_4
    move-object v0, v2

    goto/16 :goto_0
.end method

.method private static parseLogLevel(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, p0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-object v2
.end method

.method private static parseLoginOrRegisterResult(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/util/HashMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mappn/gfan/common/util/XmlElement;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v3, 0x0

    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "uid"

    const-string v2, "uid"

    invoke-virtual {p0, v2, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mappn/gfan/common/util/XmlElement;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "name"

    const-string v2, "name"

    invoke-virtual {p0, v2, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mappn/gfan/common/util/XmlElement;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "email"

    const-string v2, "email"

    invoke-virtual {p0, v2, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mappn/gfan/common/util/XmlElement;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private static parseMasterRecommend(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    .locals 18

    if-nez p1, :cond_0

    const/16 p0, 0x0

    :goto_0
    return-object p0

    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/mappn/gfan/common/util/XmlElement;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    const-string v3, "total_size"

    const-string v4, "total_size"

    move-object/from16 v0, p1

    move-object v1, v4

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v10, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    const-string v3, "recommend"

    move-object/from16 v0, p1

    move-object v1, v3

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getChildren(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/mappn/gfan/common/util/XmlElement;

    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    const-string v3, "id"

    const-string v4, "id"

    move-object/from16 v0, p1

    move-object v1, v4

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v13, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "icon_url"

    const-string v4, "icon_url"

    move-object/from16 v0, p1

    move-object v1, v4

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v13, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "name"

    const-string v4, "name"

    move-object/from16 v0, p1

    move-object v1, v4

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v13, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "description"

    const-string v4, "description"

    move-object/from16 v0, p1

    move-object v1, v4

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v13, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v14, "update_time"

    const v15, 0x7f090160

    const/4 v3, 0x1

    move v0, v3

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    const-string v3, "update_time"

    move-object/from16 v0, p1

    move-object v1, v3

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mappn/gfan/common/util/Utils;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const-wide/32 v7, 0xea60

    const/high16 v9, 0x4

    invoke-static/range {v3 .. v9}, Landroid/text/format/DateUtils;->getRelativeTimeSpanString(JJJI)Ljava/lang/CharSequence;

    move-result-object v3

    aput-object v3, v16, v17

    move-object/from16 v0, p0

    move v1, v15

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v13, v14, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "like"

    const-string v4, "like"

    move-object/from16 v0, p1

    move-object v1, v4

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v13, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "dislike"

    const-string v4, "dislike"

    move-object/from16 v0, p1

    move-object v1, v4

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    move-object v0, v13

    move-object v1, v3

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_1
    const-string p0, "recommend_list"

    move-object v0, v10

    move-object/from16 v1, p0

    move-object v2, v11

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 p0, v10

    goto/16 :goto_0
.end method

.method private static parseMyRating(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    .locals 3

    const/4 v2, 0x0

    if-nez p0, :cond_0

    move-object v0, v2

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "rating"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "value"

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    move-object v0, v2

    goto :goto_0
.end method

.method private static parseNewSplash(Lcom/mappn/gfan/common/util/XmlElement;)Lcom/mappn/gfan/common/vo/SplashInfo;
    .locals 3

    const/4 v2, 0x0

    if-nez p0, :cond_1

    const/4 v0, 0x0

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Lcom/mappn/gfan/common/vo/SplashInfo;

    invoke-direct {v0}, Lcom/mappn/gfan/common/vo/SplashInfo;-><init>()V

    const-string v1, "url"

    invoke-virtual {p0, v1, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lcom/mappn/gfan/common/util/XmlElement;->getText()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/mappn/gfan/common/vo/SplashInfo;->url:Ljava/lang/String;

    :cond_2
    const-string v1, "time"

    invoke-virtual {p0, v1, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/mappn/gfan/common/util/XmlElement;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, v0, Lcom/mappn/gfan/common/vo/SplashInfo;->timestamp:J

    goto :goto_0
.end method

.method private static parseNotificationRecommend(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/util/HashMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mappn/gfan/common/util/XmlElement;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v2, 0x0

    if-nez p0, :cond_0

    move-object v0, v2

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "product"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-eqz v0, :cond_1

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "id"

    const-string v3, "id"

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "title"

    const-string v3, "title"

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "description"

    const-string v3, "description"

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "update_time"

    const-string v3, "update_time"

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v1

    goto :goto_0

    :cond_1
    move-object v0, v2

    goto :goto_0
.end method

.method private static parseProductDetail(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    .locals 9

    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "product"

    invoke-virtual {p0, v0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    new-instance v1, Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-direct {v1}, Lcom/mappn/gfan/common/vo/ProductDetail;-><init>()V

    const-string v2, "p_id"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setPid(Ljava/lang/String;)V

    const-string v2, "product_type"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setProductType(Ljava/lang/String;)V

    const-string v2, "name"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setName(Ljava/lang/String;)V

    const-string v2, "price"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setPrice(I)V

    const-string v2, "pay_category"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setPayCategory(I)V

    const-string v2, "rating"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setRating(I)V

    const-string v2, "icon_url"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setIconUrl(Ljava/lang/String;)V

    const-string v2, "ldpi_icon_url"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setIconUrlLdpi(Ljava/lang/String;)V

    const-string v2, "short_description"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setShotDes(Ljava/lang/String;)V

    const-string v2, "app_size"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setAppSize(I)V

    const-string v2, "source_type"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setSourceType(Ljava/lang/String;)V

    const-string v2, "packagename"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setPackageName(Ljava/lang/String;)V

    const-string v2, "version_name"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setVersionName(Ljava/lang/String;)V

    const-string v2, "version_code"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setVersionCode(I)V

    const-string v2, "comments_count"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setCommentsCount(I)V

    const-string v2, "ratings_count"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setRatingCount(I)V

    const-string v2, "download_count"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setDownloadCount(I)V

    const-string v2, "long_description"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setLongDescription(Ljava/lang/String;)V

    const-string v2, "author_name"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setAuthorName(Ljava/lang/String;)V

    const-string v2, "publish_time"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lcom/mappn/gfan/common/vo/ProductDetail;->setPublishTime(J)V

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "screenshot_1"

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    const-string v3, "screenshot_2"

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    const-string v3, "screenshot_3"

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    const-string v3, "screenshot_4"

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v7

    const-string v3, "screenshot_5"

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setScreenshot([Ljava/lang/String;)V

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "screenshot_1"

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    const-string v3, "screenshot_2"

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    const-string v3, "screenshot_3"

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    const-string v3, "screenshot_4"

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v7

    const-string v3, "screenshot_5"

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setScreenshotLdpi([Ljava/lang/String;)V

    const-string v2, "up_reason"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setUpReason(Ljava/lang/String;)V

    const-string v2, "up_time"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mappn/gfan/common/util/Utils;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/mappn/gfan/common/vo/ProductDetail;->setUpTime(J)V

    const-string v2, "uses_permission"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/ProductDetail;->setPermission(Ljava/lang/String;)V

    const-string v2, "rsa_md5"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/vo/ProductDetail;->setRsaMd5(Ljava/lang/String;)V

    move-object v0, v1

    goto/16 :goto_0

    :cond_1
    move-object v0, v1

    goto/16 :goto_0
.end method

.method private static parseProductList(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;Z)Ljava/util/HashMap;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/mappn/gfan/common/util/XmlElement;",
            "Z)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    const/4 v11, 0x1

    const/4 v3, 0x0

    const/4 v10, 0x0

    if-nez p1, :cond_0

    move-object v0, v3

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "products"

    invoke-virtual {p1, v0, v10}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-eqz v0, :cond_a

    invoke-static {p0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getInstalledApps()Ljava/util/ArrayList;

    move-result-object v1

    const-string v2, "product"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getChildren(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    if-nez v2, :cond_1

    move-object v0, v3

    goto :goto_0

    :cond_1
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const-string v4, "total_size"

    const-string v5, "total_size"

    invoke-virtual {v0, v5}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "end_position"

    const-string v5, "end_position"

    invoke-virtual {v0, v5}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/util/XmlElement;

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    const-string v6, "p_id"

    const-string v7, "p_id"

    invoke-virtual {v0, v7}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "packagename"

    invoke-virtual {v0, v6}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "packagename"

    invoke-virtual {v5, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "price"

    invoke-virtual {v0, v7}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v7

    if-nez v7, :cond_5

    const v7, 0x7f0900ca

    invoke-virtual {p0, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    :goto_2
    const-string v8, "price"

    invoke-virtual {v5, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "1"

    const-string v8, "is_star"

    invoke-virtual {v0, v8}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    move v7, v11

    :goto_3
    if-eqz p2, :cond_7

    const-string v8, "is_star"

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_4
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    if-eqz p2, :cond_3

    if-eqz v7, :cond_2

    :cond_3
    const-string v6, "product_download"

    const/16 v7, 0xb

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_5
    const-string v6, "name"

    const-string v7, "name"

    invoke-virtual {v0, v7}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "author_name"

    const-string v7, "author_name"

    invoke-virtual {v0, v7}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "sub_category"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "product_type"

    invoke-virtual {v0, v8}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " > "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "sub_category"

    invoke-virtual {v0, v8}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "pay_category"

    const-string v7, "pay_category"

    invoke-virtual {v0, v7}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "rating"

    const-string v7, "rating"

    invoke-virtual {v0, v7}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "app_size"

    const-string v7, "app_size"

    invoke-virtual {v0, v7}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mappn/gfan/common/util/StringUtils;->formatSize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "icon_url"

    const-string v7, "icon_url"

    invoke-virtual {v0, v7}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "ldpi_icon_url"

    const-string v7, "ldpi_icon_url"

    invoke-virtual {v0, v7}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "short_description"

    const-string v7, "short_description"

    invoke-virtual {v0, v7}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "source_type"

    invoke-virtual {v0, v6}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v6, "1"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "source_type"

    const v6, 0x7f0900b7

    invoke-virtual {p0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v0, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_5
    const v8, 0x7f09004b

    new-array v9, v11, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v9, v10

    invoke-virtual {p0, v8, v9}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_2

    :cond_6
    move v7, v10

    goto/16 :goto_3

    :cond_7
    const-string v8, "is_star"

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_4

    :cond_8
    const-string v6, "product_download"

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_5

    :cond_9
    const-string v0, "product_list"

    invoke-virtual {v3, v0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v3

    goto/16 :goto_0

    :cond_a
    move-object v0, v3

    goto/16 :goto_0
.end method

.method private static parseQueryChargeResultByOderID(Lcom/mappn/gfan/common/util/XmlElement;)I
    .locals 2

    const/4 v1, 0x0

    if-nez p0, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    const-string v0, "pay_result"

    invoke-virtual {p0, v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "status"

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method private static parseRecommendRating(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/String;
    .locals 3

    const/4 v2, 0x0

    if-nez p0, :cond_0

    move-object v0, v2

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "rating"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "value"

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    move-object v0, v2

    goto :goto_0
.end method

.method private static parseSearchKeywords(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mappn/gfan/common/util/XmlElement;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v2, 0x0

    if-nez p0, :cond_0

    move-object v0, v2

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "keys"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-eqz v0, :cond_2

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Lcom/mappn/gfan/common/util/XmlElement;->getAllChildren()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/util/XmlElement;

    const-string v2, "text"

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    move-object v0, v1

    goto :goto_0

    :cond_2
    move-object v0, v2

    goto :goto_0
.end method

.method private static parseSubmitLog(Ljava/lang/String;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "result"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "success"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static parseSyncApps(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    .locals 3

    const/4 v2, 0x0

    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/mappn/gfan/common/vo/UpdateInfo;

    invoke-direct {v0}, Lcom/mappn/gfan/common/vo/UpdateInfo;-><init>()V

    const-string v1, "update_level"

    invoke-virtual {p0, v1, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/common/util/XmlElement;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/vo/UpdateInfo;->setUpdageLevel(I)V

    const-string v1, "version_code"

    invoke-virtual {p0, v1, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/common/util/XmlElement;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/vo/UpdateInfo;->setVersionCode(I)V

    const-string v1, "version_name"

    invoke-virtual {p0, v1, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/common/util/XmlElement;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/vo/UpdateInfo;->setVersionName(Ljava/lang/String;)V

    const-string v1, "description"

    invoke-virtual {p0, v1, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/common/util/XmlElement;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/vo/UpdateInfo;->setDescription(Ljava/lang/String;)V

    const-string v1, "apk_url"

    invoke-virtual {p0, v1, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mappn/gfan/common/util/XmlElement;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/vo/UpdateInfo;->setApkUrl(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static parseSyncBuyLog(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/Object;
    .locals 7

    const/4 v3, 0x0

    const/4 v2, 0x0

    if-nez p0, :cond_0

    move-object v0, v2

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "products"

    invoke-virtual {p0, v0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-nez v0, :cond_1

    move-object v0, v2

    goto :goto_0

    :cond_1
    const-string v1, "product"

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getChildren(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    if-nez v1, :cond_2

    move-object v0, v2

    goto :goto_0

    :cond_2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    :goto_1
    if-ge v3, v1, :cond_3

    const-string v4, "product"

    invoke-virtual {v0, v4, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v4

    new-instance v5, Lcom/mappn/gfan/common/vo/BuyLog;

    invoke-direct {v5}, Lcom/mappn/gfan/common/vo/BuyLog;-><init>()V

    const-string v6, "p_id"

    invoke-virtual {v4, v6}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/mappn/gfan/common/vo/BuyLog;->pId:Ljava/lang/String;

    const-string v6, "package_name"

    invoke-virtual {v4, v6}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v5, Lcom/mappn/gfan/common/vo/BuyLog;->packageName:Ljava/lang/String;

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_3
    move-object v0, v2

    goto :goto_0
.end method

.method private static parseSyncCardinfo(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;)Lcom/mappn/gfan/common/vo/CardsVerifications;
    .locals 4

    if-nez p1, :cond_1

    const/4 v0, 0x0

    :cond_0
    return-object v0

    :cond_1
    new-instance v0, Lcom/mappn/gfan/common/vo/CardsVerifications;

    invoke-direct {v0}, Lcom/mappn/gfan/common/vo/CardsVerifications;-><init>()V

    const-string v1, "remote_version"

    invoke-virtual {p1, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/mappn/gfan/common/vo/CardsVerifications;->version:I

    const-string v1, "card"

    invoke-virtual {p1, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getChildren(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/util/XmlElement;

    new-instance v2, Lcom/mappn/gfan/common/vo/CardsVerification;

    invoke-direct {v2}, Lcom/mappn/gfan/common/vo/CardsVerification;-><init>()V

    const-string v3, "name"

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/mappn/gfan/common/vo/CardsVerification;->name:Ljava/lang/String;

    const-string v3, "pay_type"

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/mappn/gfan/common/vo/CardsVerification;->pay_type:Ljava/lang/String;

    const-string v3, "account_len"

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/mappn/gfan/common/vo/CardsVerification;->accountNum:I

    const-string v3, "password_len"

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/mappn/gfan/common/vo/CardsVerification;->passwordNum:I

    const-string v3, "credit"

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/mappn/gfan/common/vo/CardsVerification;->credit:Ljava/lang/String;

    iget-object v3, v0, Lcom/mappn/gfan/common/vo/CardsVerifications;->cards:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private static parseTopRecommend(Lcom/mappn/gfan/common/util/XmlElement;)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mappn/gfan/common/util/XmlElement;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    const/4 v1, 0x0

    if-nez p0, :cond_0

    move-object v0, v1

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/XmlElement;->getAllChildren()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_5

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/util/XmlElement;

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string v3, "category"

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/XmlElement;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "top_recommend_type"

    const-string v4, "category"

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2
    const-string v3, "id"

    const-string v4, "id"

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "pic"

    const-string v4, "pic"

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "reason"

    const-string v4, "reason"

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    const-string v3, "topic"

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/XmlElement;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "top_recommend_type"

    const-string v4, "topic"

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_2
    const-string v3, "product"

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/XmlElement;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    const-string v3, "top_recommend_type"

    const-string v4, "product"

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_3
    const-string v3, "top_recommend_type"

    const/4 v4, -0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_4
    move-object v0, v1

    goto/16 :goto_0

    :cond_5
    move-object v0, v1

    goto/16 :goto_0
.end method

.method private static parseTopicList(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;)Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/mappn/gfan/common/util/XmlElement;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v7, 0x0

    if-nez p1, :cond_0

    move-object v0, v1

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "topics"

    invoke-virtual {p1, v0, v7}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    if-eqz v0, :cond_6

    const-string v1, "topic"

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->getChildren(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/util/XmlElement;

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string v3, "id"

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "5"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "id"

    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "category_name"

    const-string v4, "name"

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "icon_url"

    const-string v4, "ldpi_app_icon_url"

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "app_1"

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "app_2"

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "app_3"

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, ", "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_2

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_2
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_3
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x1

    if-le v4, v5, :cond_4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x2

    sub-int/2addr v4, v5

    invoke-virtual {v3, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    :cond_4
    const-string v4, "top_app"

    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "app_count"

    const-string v4, "app_count"

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_5
    move-object v0, v1

    goto/16 :goto_0

    :cond_6
    move-object v0, v1

    goto/16 :goto_0
.end method

.method private static parseUpgrade(Landroid/content/Context;Lcom/mappn/gfan/common/util/XmlElement;)Ljava/lang/String;
    .locals 6

    const/4 v5, 0x0

    if-nez p1, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "products"

    invoke-virtual {p1, v0, v5}, Lcom/mappn/gfan/common/util/XmlElement;->getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;

    move-result-object v0

    const-string v1, ""

    if-eqz v0, :cond_3

    const-string v2, "product"

    invoke-virtual {v0, v2}, Lcom/mappn/gfan/common/util/XmlElement;->getChildren(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_1

    move-object v0, v1

    goto :goto_0

    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/util/XmlElement;

    new-instance v3, Lcom/mappn/gfan/common/vo/UpgradeInfo;

    invoke-direct {v3}, Lcom/mappn/gfan/common/vo/UpgradeInfo;-><init>()V

    const-string v4, "p_id"

    invoke-virtual {v0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/mappn/gfan/common/vo/UpgradeInfo;->pid:Ljava/lang/String;

    const-string v4, "packagename"

    invoke-virtual {v0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/mappn/gfan/common/vo/UpgradeInfo;->pkgName:Ljava/lang/String;

    const-string v4, "version_name"

    invoke-virtual {v0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/mappn/gfan/common/vo/UpgradeInfo;->versionName:Ljava/lang/String;

    const-string v4, "version_code"

    invoke-virtual {v0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v3, Lcom/mappn/gfan/common/vo/UpgradeInfo;->versionCode:I

    const-string v4, "rsa_md5"

    invoke-virtual {v0, v4}, Lcom/mappn/gfan/common/util/XmlElement;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v3, Lcom/mappn/gfan/common/vo/UpgradeInfo;->signature:Ljava/lang/String;

    iput v5, v3, Lcom/mappn/gfan/common/vo/UpgradeInfo;->update:I

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    invoke-static {p0, v1}, Lcom/mappn/gfan/common/util/DBUtils;->addUpdateProduct(Landroid/content/Context;Ljava/util/ArrayList;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_3
    move-object v0, v1

    goto :goto_0
.end method
