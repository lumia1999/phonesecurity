.class public final Lcom/yingyonghui/market/b/b;
.super Ljava/lang/Object;
.source "JsonUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Ljava/lang/String;)Lcom/yingyonghui/market/model/a;
    .locals 11
    .parameter

    .prologue
    const/4 v10, 0x0

    .line 226
    new-instance v0, Lcom/yingyonghui/market/model/a;

    invoke-direct {v0}, Lcom/yingyonghui/market/model/a;-><init>()V

    .line 229
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 230
    const-string v2, "newsheader"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 231
    invoke-virtual {v0}, Lcom/yingyonghui/market/model/a;->a()Lcom/yingyonghui/market/model/b;

    move-result-object v3

    .line 232
    const-string v4, "news_url"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/yingyonghui/market/model/b;->a:Ljava/lang/String;

    .line 233
    const-string v4, "hot"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, v3, Lcom/yingyonghui/market/model/b;->c:Z

    .line 234
    const-string v4, "highlight"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, v3, Lcom/yingyonghui/market/model/b;->d:Z

    .line 235
    const-string v4, "new"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, v3, Lcom/yingyonghui/market/model/b;->e:Z

    .line 236
    const-string v4, "date"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 237
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v5

    if-nez v5, :cond_0

    .line 239
    const/4 v5, 0x1

    :try_start_1
    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "yyyyMMdd"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Lcom/yingyonghui/market/util/r;->a(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Date;

    move-result-object v5

    const-string v6, "yyyy-MM-dd"

    invoke-static {v5, v6}, Lcom/yingyonghui/market/util/r;->a(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 245
    :cond_0
    :goto_0
    :try_start_2
    iput-object v4, v3, Lcom/yingyonghui/market/model/b;->f:Ljava/lang/String;

    .line 246
    const-string v4, "title"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/yingyonghui/market/model/b;->b:Ljava/lang/String;

    .line 247
    const-string v4, "visit"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v3, Lcom/yingyonghui/market/model/b;->g:I

    .line 248
    const-string v4, "icon_url"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v3, Lcom/yingyonghui/market/model/b;->h:Ljava/lang/String;

    .line 250
    const-string v2, "subnews"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 251
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    move v3, v10

    .line 252
    :goto_1
    if-ge v3, v2, :cond_2

    .line 257
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 258
    new-instance v5, Lcom/yingyonghui/market/model/g;

    invoke-direct {v5, v0}, Lcom/yingyonghui/market/model/g;-><init>(Lcom/yingyonghui/market/model/a;)V

    .line 259
    const-string v6, "subtitle"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/yingyonghui/market/model/g;->b:Ljava/lang/String;

    .line 260
    const-string v6, "blocks"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    move v6, v10

    .line 261
    :goto_2
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v6, v7, :cond_5

    .line 262
    invoke-virtual {v4, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 263
    const-string v8, "type"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 264
    const-string v9, "content"

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 265
    const-string v9, "text"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 266
    invoke-virtual {v5, v7}, Lcom/yingyonghui/market/model/g;->a(Ljava/lang/String;)V

    .line 261
    :cond_1
    :goto_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 241
    :catch_0
    move-exception v5

    invoke-virtual {v5}, Ljava/text/ParseException;->printStackTrace()V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 275
    :catch_1
    move-exception v1

    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 279
    :cond_2
    return-object v0

    .line 267
    :cond_3
    :try_start_3
    const-string v9, "image"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 268
    invoke-virtual {v5, v7}, Lcom/yingyonghui/market/model/g;->b(Ljava/lang/String;)V

    goto :goto_3

    .line 269
    :cond_4
    const-string v9, "package_id"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 270
    invoke-virtual {v5, v7}, Lcom/yingyonghui/market/model/g;->c(Ljava/lang/String;)V

    goto :goto_3

    .line 273
    :cond_5
    invoke-virtual {v0, v5}, Lcom/yingyonghui/market/model/a;->a(Lcom/yingyonghui/market/model/g;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    .line 256
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 8
    .parameter
    .parameter

    .prologue
    .line 85
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 87
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 88
    const-string v2, "list"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 89
    const/4 v2, 0x0

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    :goto_0
    if-ge v2, v3, :cond_7

    .line 90
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 91
    new-instance v5, Lcom/yingyonghui/market/model/l;

    invoke-direct {v5}, Lcom/yingyonghui/market/model/l;-><init>()V

    .line 92
    const-string v6, "id"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, v5, Lcom/yingyonghui/market/model/l;->e:I

    .line 93
    const-string v6, "name"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    .line 94
    const-string v6, "packageName"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    .line 95
    const-string v6, "size"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, v5, Lcom/yingyonghui/market/model/l;->o:I

    .line 96
    iget v6, v5, Lcom/yingyonghui/market/model/l;->o:I

    int-to-long v6, v6

    invoke-static {p0, v6, v7}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/yingyonghui/market/model/l;->p:Ljava/lang/String;

    .line 97
    const-string v6, "versionName"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/yingyonghui/market/model/l;->q:Ljava/lang/String;

    .line 98
    const-string v6, "versionCode"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, v5, Lcom/yingyonghui/market/model/l;->s:I

    .line 99
    const-string v6, "rating"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v6

    double-to-float v6, v6

    iput v6, v5, Lcom/yingyonghui/market/model/l;->l:F

    .line 100
    const-string v6, "ratingCount"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, v5, Lcom/yingyonghui/market/model/l;->A:I

    .line 101
    const-string v6, "shorDesc"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/yingyonghui/market/model/l;->u:Ljava/lang/String;

    .line 102
    const-string v6, "downloadMax"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, v5, Lcom/yingyonghui/market/model/l;->y:I

    .line 103
    const-string v6, "downloadMin"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, v5, Lcom/yingyonghui/market/model/l;->z:I

    .line 104
    const-string v6, "iconUrl"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/yingyonghui/market/model/l;->f:Ljava/lang/String;

    .line 105
    const-string v6, "apkUrl"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/yingyonghui/market/model/l;->g:Ljava/lang/String;

    .line 108
    const-string v6, "pubkeyHash"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 109
    const-string v6, "pubkeyHash"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/yingyonghui/market/model/l;->C:Ljava/lang/String;

    .line 112
    :cond_0
    const-string v6, "lastUpdate"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 113
    const-string v6, "lastUpdate"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/yingyonghui/market/model/l;->r:Ljava/lang/String;

    .line 116
    :cond_1
    const-string v6, "promotionId"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 117
    const-string v6, "promotionId"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, v5, Lcom/yingyonghui/market/model/l;->D:I

    .line 119
    :cond_2
    const-string v6, "promotionAgent"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 120
    const-string v6, "promotionAgent"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/yingyonghui/market/model/l;->E:Ljava/lang/String;

    .line 122
    :cond_3
    const-string v6, "promotionText"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 123
    const-string v6, "promotionText"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/yingyonghui/market/model/l;->G:Ljava/lang/String;

    .line 125
    :cond_4
    const-string v6, "promotionDownUrl"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 126
    const-string v6, "promotionDownUrl"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v5, Lcom/yingyonghui/market/model/l;->F:Ljava/lang/String;

    .line 139
    :cond_5
    iget-object v4, v5, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_6

    .line 140
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 143
    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 147
    :cond_7
    return-object v0
.end method

.method public static a(Ljava/lang/String;I)Ljava/util/ArrayList;
    .locals 7
    .parameter
    .parameter

    .prologue
    const/4 v3, 0x0

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 39
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 40
    const-string v2, "cats"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 41
    const/4 v2, 0x0

    .line 43
    sparse-switch p1, :sswitch_data_0

    move-object v1, v2

    .line 52
    :goto_0
    const-string v2, "children"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 60
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    :goto_1
    if-ge v3, v2, :cond_0

    .line 61
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 62
    new-instance v5, Lcom/yingyonghui/market/model/k;

    invoke-direct {v5}, Lcom/yingyonghui/market/model/k;-><init>()V

    .line 63
    const-string v6, "id"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, v5, Lcom/yingyonghui/market/model/k;->a:I

    .line 64
    const-string v6, "name"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/yingyonghui/market/model/k;->b:Ljava/lang/String;

    .line 65
    const-string v6, "description"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/yingyonghui/market/model/k;->c:Ljava/lang/String;

    .line 66
    const-string v6, "iconUrl"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v5, Lcom/yingyonghui/market/model/k;->d:Ljava/lang/String;

    .line 67
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 60
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 45
    :sswitch_0
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/json/JSONObject;

    move-object v1, p0

    .line 46
    goto :goto_0

    .line 48
    :sswitch_1
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/json/JSONObject;

    move-object v1, p0

    .line 49
    goto :goto_0

    .line 51
    :sswitch_2
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, p0

    goto :goto_0

    .line 70
    :catch_0
    move-exception v1

    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 74
    :cond_0
    return-object v0

    .line 43
    nop

    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_2
        0x1e -> :sswitch_0
        0x28 -> :sswitch_1
    .end sparse-switch
.end method

.method public static b(Landroid/content/Context;Ljava/lang/String;)Lcom/yingyonghui/market/model/j;
    .locals 7
    .parameter
    .parameter

    .prologue
    .line 159
    new-instance v0, Lcom/yingyonghui/market/model/j;

    invoke-direct {v0}, Lcom/yingyonghui/market/model/j;-><init>()V

    .line 162
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 163
    const-string v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v0, Lcom/yingyonghui/market/model/j;->e:I

    .line 164
    const-string v2, "name"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/yingyonghui/market/model/j;->i:Ljava/lang/String;

    .line 165
    const-string v2, "packageName"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/yingyonghui/market/model/j;->m:Ljava/lang/String;

    .line 166
    const-string v2, "iconUrl"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/yingyonghui/market/model/j;->f:Ljava/lang/String;

    .line 167
    const-string v2, "rating"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    double-to-float v2, v2

    iput v2, v0, Lcom/yingyonghui/market/model/j;->l:F

    .line 168
    const-string v2, "ratingCount"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v0, Lcom/yingyonghui/market/model/j;->A:I

    .line 169
    const-string v2, "description"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "\r"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/yingyonghui/market/model/j;->a:Ljava/lang/String;

    .line 170
    const-string v2, "size"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v0, Lcom/yingyonghui/market/model/j;->o:I

    .line 171
    iget v2, v0, Lcom/yingyonghui/market/model/j;->o:I

    int-to-long v2, v2

    invoke-static {p0, v2, v3}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/yingyonghui/market/model/j;->p:Ljava/lang/String;

    .line 172
    const-string v2, "versionCode"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v0, Lcom/yingyonghui/market/model/j;->s:I

    .line 173
    const-string v2, "versionName"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/yingyonghui/market/model/j;->q:Ljava/lang/String;

    .line 174
    const-string v2, "lastUpdate"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/yingyonghui/market/model/j;->r:Ljava/lang/String;

    .line 175
    const-string v2, "apkUrl"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/yingyonghui/market/model/j;->g:Ljava/lang/String;

    .line 176
    const-string v2, "downloadMax"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v0, Lcom/yingyonghui/market/model/j;->y:I

    .line 177
    const-string v2, "downloadMin"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v0, Lcom/yingyonghui/market/model/j;->z:I

    .line 178
    const-string v2, "developer"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/yingyonghui/market/model/j;->j:Ljava/lang/String;

    .line 181
    iget-object v2, v0, Lcom/yingyonghui/market/model/j;->m:Ljava/lang/String;

    iget v3, v0, Lcom/yingyonghui/market/model/j;->s:I

    iget v4, v0, Lcom/yingyonghui/market/model/j;->e:I

    invoke-static {p0, v2, v3, v4}, Lcom/yingyonghui/market/util/t;->a(Landroid/content/Context;Ljava/lang/String;II)I

    move-result v2

    iput v2, v0, Lcom/yingyonghui/market/model/j;->n:I

    .line 184
    const-string v2, "snapshotUrls"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 185
    const-string v2, "snapshotUrls"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 186
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    .line 187
    if-lez v2, :cond_0

    .line 188
    new-array v3, v2, [Ljava/lang/String;

    iput-object v3, v0, Lcom/yingyonghui/market/model/j;->B:[Ljava/lang/String;

    .line 190
    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    .line 191
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 192
    iget-object v5, v0, Lcom/yingyonghui/market/model/j;->B:[Ljava/lang/String;

    const-string v6, "url"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v5, v3
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 190
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 217
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 219
    const/4 v0, 0x0

    .line 222
    :cond_0
    return-object v0
.end method

.method public static b(Ljava/lang/String;)[Ljava/lang/Object;
    .locals 11
    .parameter

    .prologue
    const/4 v5, 0x0

    .line 289
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    .line 290
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 291
    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 293
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 294
    const/4 v3, 0x0

    const-string v4, "totalCount"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v0, v3

    .line 296
    const-string v3, "list"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 297
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    .line 298
    const/4 v4, 0x0

    move v10, v5

    move-object v5, v4

    move v4, v10

    .line 299
    :goto_0
    if-ge v4, v3, :cond_3

    .line 300
    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 301
    new-instance v7, Lcom/yingyonghui/market/model/n;

    invoke-direct {v7}, Lcom/yingyonghui/market/model/n;-><init>()V

    .line 302
    const-string v8, "commentId"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    iput v8, v7, Lcom/yingyonghui/market/model/n;->a:I

    .line 303
    const-string v8, "deviceName"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/yingyonghui/market/model/n;->b:Ljava/lang/String;

    .line 304
    const-string v8, "isdelete"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v8

    iput-boolean v8, v7, Lcom/yingyonghui/market/model/n;->c:Z

    .line 305
    const-string v8, "message"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/yingyonghui/market/model/n;->g:Ljava/lang/String;

    .line 306
    const-string v8, "commentTime"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v8

    iput-wide v8, v7, Lcom/yingyonghui/market/model/n;->h:J

    .line 307
    const-string v8, "type"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/yingyonghui/market/model/n;->i:Ljava/lang/String;

    .line 308
    const-string v8, "userId"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    iput v8, v7, Lcom/yingyonghui/market/model/n;->d:I

    .line 309
    const-string v8, "userName"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/yingyonghui/market/model/n;->e:Ljava/lang/String;

    .line 310
    const-string v8, "isMine"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v8

    iput-boolean v8, v7, Lcom/yingyonghui/market/model/n;->k:Z

    .line 313
    iget-object v8, v7, Lcom/yingyonghui/market/model/n;->i:Ljava/lang/String;

    const-string v9, "comment"

    invoke-static {v8, v9}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 314
    const-string v8, "score"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v8

    iput-wide v8, v7, Lcom/yingyonghui/market/model/n;->f:D

    .line 319
    :cond_0
    :goto_1
    iget-object v6, v7, Lcom/yingyonghui/market/model/n;->i:Ljava/lang/String;

    const-string v8, "comment"

    invoke-static {v6, v8}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 321
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v5, v7

    .line 299
    :cond_1
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 315
    :cond_2
    iget-object v8, v7, Lcom/yingyonghui/market/model/n;->i:Ljava/lang/String;

    const-string v9, "error"

    invoke-static {v8, v9}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 316
    const-string v8, "errorType"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, v7, Lcom/yingyonghui/market/model/n;->j:I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 330
    :catch_0
    move-exception v1

    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 334
    :cond_3
    return-object v0

    .line 322
    :cond_4
    :try_start_1
    iget-object v6, v7, Lcom/yingyonghui/market/model/n;->i:Ljava/lang/String;

    const-string v8, "error"

    invoke-static {v6, v8}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 324
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v5, v7

    goto :goto_2

    .line 325
    :cond_5
    iget-object v6, v7, Lcom/yingyonghui/market/model/n;->i:Ljava/lang/String;

    const-string v8, "reply"

    invoke-static {v6, v8}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 326
    iget-object v6, v5, Lcom/yingyonghui/market/model/n;->l:Ljava/util/ArrayList;

    if-nez v6, :cond_6

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, v5, Lcom/yingyonghui/market/model/n;->l:Ljava/util/ArrayList;

    :cond_6
    iget-object v6, v5, Lcom/yingyonghui/market/model/n;->l:Ljava/util/ArrayList;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method public static c(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 5
    .parameter

    .prologue
    .line 338
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 340
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 341
    const-string v2, "list"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 342
    const/4 v2, 0x0

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    :goto_0
    if-ge v2, v3, :cond_0

    .line 343
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 342
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 345
    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 349
    :cond_0
    return-object v0
.end method

.method public static c(Landroid/content/Context;Ljava/lang/String;)[Ljava/lang/Object;
    .locals 9
    .parameter
    .parameter

    .prologue
    const/4 v2, 0x2

    const/4 v4, 0x0

    .line 353
    new-array v0, v2, [Ljava/lang/Object;

    .line 355
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ne v1, v2, :cond_2

    .line 356
    :cond_0
    const/4 v0, 0x0

    .line 407
    :cond_1
    :goto_0
    return-object v0

    .line 359
    :cond_2
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 360
    const/4 v2, 0x0

    const-string v3, "nextIndexStart"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    .line 361
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 362
    const/4 v3, 0x1

    aput-object v2, v0, v3

    .line 363
    const-string v3, "list"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 364
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    .line 365
    :goto_1
    if-ge v4, v3, :cond_1

    .line 366
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 368
    new-instance v6, Lcom/yingyonghui/market/model/l;

    invoke-direct {v6}, Lcom/yingyonghui/market/model/l;-><init>()V

    .line 369
    const-string v7, "id"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v6, Lcom/yingyonghui/market/model/l;->e:I

    .line 370
    const-string v7, "iconUrl"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/yingyonghui/market/model/l;->f:Ljava/lang/String;

    .line 371
    const-string v7, "name"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    .line 372
    const-string v7, "rating"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v7

    double-to-float v7, v7

    iput v7, v6, Lcom/yingyonghui/market/model/l;->l:F

    .line 373
    const-string v7, "ratingCount"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v6, Lcom/yingyonghui/market/model/l;->A:I

    .line 374
    const-string v7, "packageName"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    .line 375
    const-string v7, "versionName"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/yingyonghui/market/model/l;->q:Ljava/lang/String;

    .line 376
    const-string v7, "versionCode"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v6, Lcom/yingyonghui/market/model/l;->s:I

    .line 377
    const-string v7, "size"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v6, Lcom/yingyonghui/market/model/l;->o:I

    .line 378
    iget v7, v6, Lcom/yingyonghui/market/model/l;->o:I

    int-to-long v7, v7

    invoke-static {p0, v7, v8}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/yingyonghui/market/model/l;->p:Ljava/lang/String;

    .line 379
    const-string v7, "shorDesc"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/yingyonghui/market/model/l;->u:Ljava/lang/String;

    .line 380
    const-string v7, "apkUrl"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/yingyonghui/market/model/l;->g:Ljava/lang/String;

    .line 381
    const-string v7, "downloadMax"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v6, Lcom/yingyonghui/market/model/l;->y:I

    .line 382
    const-string v7, "downloadMin"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v6, Lcom/yingyonghui/market/model/l;->z:I

    .line 383
    const-string v7, "lastUpdate"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v6, Lcom/yingyonghui/market/model/l;->r:Ljava/lang/String;

    .line 399
    iget-object v5, v6, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    if-eqz v5, :cond_3

    .line 400
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 365
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_1

    .line 403
    :catch_0
    move-exception v1

    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public static d(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 9
    .parameter

    .prologue
    const/4 v3, 0x0

    .line 411
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 413
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 414
    const-string v2, "news"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 415
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    :goto_0
    if-ge v3, v2, :cond_1

    .line 416
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 417
    new-instance v5, Lcom/yingyonghui/market/model/e;

    invoke-direct {v5}, Lcom/yingyonghui/market/model/e;-><init>()V

    .line 418
    const-string v6, "icon_url"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/yingyonghui/market/model/e;->h:Ljava/lang/String;

    .line 419
    const-string v6, "title"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/yingyonghui/market/model/e;->b:Ljava/lang/String;

    .line 420
    const-string v6, "highlight"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    iput-boolean v6, v5, Lcom/yingyonghui/market/model/e;->f:Z

    .line 421
    const-string v6, "hot"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    iput-boolean v6, v5, Lcom/yingyonghui/market/model/e;->e:Z

    .line 422
    const-string v6, "new"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    iput-boolean v6, v5, Lcom/yingyonghui/market/model/e;->g:Z

    .line 423
    const-string v6, "visit"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, v5, Lcom/yingyonghui/market/model/e;->c:I

    .line 424
    const-string v6, "news_url"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/yingyonghui/market/model/e;->a:Ljava/lang/String;

    .line 425
    const-string v6, "date"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 426
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v6

    if-nez v6, :cond_0

    .line 428
    const/4 v6, 0x1

    :try_start_1
    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "yyyyMMdd"

    aput-object v8, v6, v7

    invoke-static {v4, v6}, Lcom/yingyonghui/market/util/r;->a(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Date;

    move-result-object v6

    const-string v7, "yyyy-MM-dd"

    invoke-static {v6, v7}, Lcom/yingyonghui/market/util/r;->a(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 433
    :cond_0
    :goto_1
    :try_start_2
    iput-object v4, v5, Lcom/yingyonghui/market/model/e;->d:Ljava/lang/String;

    .line 435
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 415
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 429
    :catch_0
    move-exception v6

    invoke-virtual {v6}, Ljava/text/ParseException;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 437
    :catch_1
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 441
    :cond_1
    return-object v0
.end method
