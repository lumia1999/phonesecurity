.class public final Lcom/yingyonghui/market/log/h;
.super Ljava/lang/Object;
.source "JsonLog.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 147
    const-string v0, "searchMoreHotwords"

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 149
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(I)Ljava/lang/String;
    .locals 3
    .parameter

    .prologue
    .line 94
    const-string v0, "tabClick"

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 95
    const-string v1, "index"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 97
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(II)Ljava/lang/String;
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 252
    const-string v0, "addReply"

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 253
    const-string v1, "parentId"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 254
    const-string v1, "applicationId"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 256
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 63
    const-string v3, "launch"

    invoke-static {v3}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 64
    const-string v4, "hardware"

    invoke-static {v3, v4, p2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    .line 65
    const-string v3, "sdkVersion"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {p2, v3, p0}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 66
    const-string p2, "resolution"

    invoke-static {p0, p2, p1}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 67
    const-string p1, "dpi"

    invoke-static/range {p14 .. p14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 68
    const-string p1, "clientVersionCode"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 69
    const-string p1, "channel"

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v2, p12

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 70
    const-string p1, "deviceId"

    invoke-static {p0, p1, p4}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 71
    const-string p1, "IMSI"

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v2, p13

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 72
    const-string p1, "networkType"

    invoke-static {p0, p1, p5}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 73
    const-string p1, "networkSubType"

    invoke-static {p0, p1, p7}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 74
    const-string p1, "networkExtraInfo"

    invoke-static {p0, p1, p6}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 75
    const-string p1, "ipAddress"

    invoke-static {p0, p1, p10}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 76
    const-string p1, "phoneNumber"

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v2, p11

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 77
    const-string p1, "androidId"

    invoke-static {p0, p1, p8}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 78
    const-string p1, "serialNumber"

    invoke-static {p0, p1, p9}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 79
    const-string p1, "abi"

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v2, p15

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 81
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(J)Ljava/lang/String;
    .locals 3
    .parameter

    .prologue
    .line 440
    const-string v0, "apiResponseTime"

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->h(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 441
    const-string v1, "time"

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 443
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 171
    const-string v0, "detailShare"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->b(Ljava/lang/String;Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 313
    const-string v0, "appListFeatured"

    invoke-static {p0, v0, p1, p2, p3}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/util/List;)Lorg/json/JSONObject;

    move-result-object v0

    .line 315
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Lcom/yingyonghui/market/log/m;ILjava/util/List;)Ljava/lang/String;
    .locals 2
    .parameter
    .parameter
    .parameter

    .prologue
    .line 369
    const-string v0, "appListUpdate"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1, p1, p2}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/util/List;)Lorg/json/JSONObject;

    move-result-object v0

    .line 371
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 154
    const-string v0, "newsGuid"

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 155
    invoke-static {v0, p0}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Lcom/yingyonghui/market/log/m;)Lorg/json/JSONObject;

    move-result-object v0

    .line 156
    const-string v1, "button"

    invoke-static {v0, v1, p1}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 158
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;II)Ljava/lang/String;
    .locals 3
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 111
    const-string v0, "listClick"

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 112
    invoke-static {v0, p0}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Lcom/yingyonghui/market/log/m;)Lorg/json/JSONObject;

    move-result-object v0

    .line 113
    const-string v1, "module"

    invoke-static {v0, v1, p1}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 114
    const-string v1, "index"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 115
    const-string v1, "applicationId"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 117
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 122
    const-string v0, "listDLClick"

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 123
    invoke-static {v0, p0}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Lcom/yingyonghui/market/log/m;)Lorg/json/JSONObject;

    move-result-object v0

    .line 124
    const-string v1, "module"

    invoke-static {v0, v1, p1}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 125
    const-string v1, "index"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 126
    const-string v1, "applicationId"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 127
    const-string v1, "type"

    invoke-static {v0, v1, p4}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 129
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Lcom/yingyonghui/market/log/m;Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 306
    const-string v0, "appListBanner"

    const/4 v1, 0x0

    const/4 v2, 0x4

    invoke-static {p0, v0, v1, v2, p1}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/util/List;)Lorg/json/JSONObject;

    move-result-object v0

    .line 308
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter

    .prologue
    .line 86
    const-string v0, "exit"

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 87
    const-string v1, "button"

    invoke-static {v0, v1, p0}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 89
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Ljava/lang/String;I)Ljava/lang/String;
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 102
    const-string v0, "tab2Click"

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 103
    const-string v1, "name"

    invoke-static {v0, v1, p0}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 104
    const-string v1, "index"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 106
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Ljava/lang/String;Lcom/yingyonghui/market/log/m;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 298
    invoke-static {p0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 299
    invoke-static {v0, p1}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Lcom/yingyonghui/market/log/m;)Lorg/json/JSONObject;

    move-result-object v0

    .line 301
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Ljava/lang/String;Lcom/yingyonghui/market/log/m;II)Ljava/lang/String;
    .locals 3
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 279
    invoke-static {p0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 280
    invoke-static {v0, p1}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Lcom/yingyonghui/market/log/m;)Lorg/json/JSONObject;

    move-result-object v0

    .line 281
    const-string v1, "index"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 282
    const-string v1, "applicationId"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 284
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Ljava/lang/String;Lcom/yingyonghui/market/log/m;ILjava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 288
    invoke-static {p0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 289
    invoke-static {v0, p1}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Lcom/yingyonghui/market/log/m;)Lorg/json/JSONObject;

    move-result-object v0

    .line 290
    const-string v1, "index"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 291
    const-string v1, "packageName"

    invoke-static {v0, v1, p3}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 293
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 134
    const-string v0, "search"

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 135
    const-string v1, "searchType"

    invoke-static {v0, v1, p0}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 136
    const-string v1, "searchByKeyword"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "searchByHotword"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 137
    :cond_0
    const-string v1, "keyword"

    invoke-static {v0, v1, p1}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 142
    :cond_1
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 138
    :cond_2
    const-string v1, "searchByDeveloper"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 139
    const-string v1, "developer"

    invoke-static {v0, v1, p1}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 449
    const-string v0, "networkChange"

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->h(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 450
    const-string v1, "networkType"

    invoke-static {v0, v1, p0}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 451
    const-string v1, "networkSubType"

    invoke-static {v0, v1, p1}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 452
    const-string v1, "networkExtraInfo"

    invoke-static {v0, v1, p2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 453
    const-string v1, "ipAddress"

    invoke-static {v0, v1, p3}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 455
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Ljava/util/Map;)Ljava/lang/String;
    .locals 4
    .parameter

    .prologue
    .line 48
    const-string v0, "exit"

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 49
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 50
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move-object v2, v0

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 51
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v0, v3}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    move-object v2, v0

    goto :goto_0

    .line 54
    :cond_0
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/util/List;)Lorg/json/JSONObject;
    .locals 3
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 29
    invoke-static {}, Lcom/yingyonghui/market/log/h;->b()Lorg/json/JSONObject;

    move-result-object v0

    .line 30
    const-string v1, "d"

    invoke-virtual {p0}, Lcom/yingyonghui/market/log/m;->b()Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 31
    const-string v1, "type"

    invoke-static {v0, v1, p1}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 32
    const-string v1, "start"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 33
    const-string v1, "size"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 34
    const-string v1, "list"

    invoke-static {v0, v1, p4}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 36
    return-object v0
.end method

.method public static b(I)Ljava/lang/String;
    .locals 3
    .parameter

    .prologue
    .line 236
    const-string v0, "addComment"

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 237
    const-string v1, "applicationId"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 239
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static b(II)Ljava/lang/String;
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 261
    const-string v0, "submitReply"

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 262
    const-string v1, "parentId"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 263
    const-string v1, "applicationId"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 265
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static b(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 176
    const-string v0, "detailInstall"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->b(Ljava/lang/String;Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static b(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 320
    const-string v0, "appListLatest"

    invoke-static {p0, v0, p1, p2, p3}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/util/List;)Lorg/json/JSONObject;

    move-result-object v0

    .line 322
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static b(Lcom/yingyonghui/market/log/m;ILjava/util/List;)Ljava/lang/String;
    .locals 2
    .parameter
    .parameter
    .parameter

    .prologue
    .line 390
    const-string v0, "newsContent"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1, p1, p2}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/util/List;)Lorg/json/JSONObject;

    move-result-object v0

    .line 392
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static b(Lcom/yingyonghui/market/log/m;Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 376
    const-string v0, "appDetail"

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {p0, v0, v1, v2, p1}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/util/List;)Lorg/json/JSONObject;

    move-result-object v0

    .line 378
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 412
    const-string v0, "download_pause"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->c(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 414
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static b(Ljava/lang/String;Lcom/yingyonghui/market/log/m;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 163
    invoke-static {p0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 164
    invoke-static {v0, p1}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Lcom/yingyonghui/market/log/m;)Lorg/json/JSONObject;

    move-result-object v0

    .line 166
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 404
    const-string v0, "download_start"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->c(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 405
    const-string v1, "type"

    invoke-static {v0, v1, p1}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 407
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static b()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 13
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 14
    invoke-static {v0}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/yingyonghui/market/util/j;->b(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v0

    .line 17
    return-object v0
.end method

.method public static c(I)Ljava/lang/String;
    .locals 3
    .parameter

    .prologue
    .line 244
    const-string v0, "submitComment"

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 245
    const-string v1, "applicationId"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 247
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static c(II)Ljava/lang/String;
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 270
    const-string v0, "deleteComment"

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 271
    const-string v1, "commentId"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 272
    const-string v1, "applicationId"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 274
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static c(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 181
    const-string v0, "detailUninstall"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->b(Ljava/lang/String;Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static c(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 327
    const-string v0, "appListRank"

    invoke-static {p0, v0, p1, p2, p3}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/util/List;)Lorg/json/JSONObject;

    move-result-object v0

    .line 329
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static c(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 419
    const-string v0, "download_resume"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->c(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 421
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static c(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 396
    invoke-static {p0}, Lcom/yingyonghui/market/log/h;->h(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 397
    const-string v1, "packageName"

    invoke-static {v0, v1, p1}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 399
    return-object v0
.end method

.method public static d(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 186
    const-string v0, "detailLaunch"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->b(Ljava/lang/String;Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static d(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 334
    const-string v0, "appListFast"

    invoke-static {p0, v0, p1, p2, p3}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/util/List;)Lorg/json/JSONObject;

    move-result-object v0

    .line 336
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static d(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 426
    const-string v0, "download_cancel"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->c(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 428
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static e(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 191
    const-string v0, "detailCancelDownload"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->b(Ljava/lang/String;Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static e(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 341
    const-string v0, "appListCategory"

    invoke-static {p0, v0, p1, p2, p3}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/util/List;)Lorg/json/JSONObject;

    move-result-object v0

    .line 343
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static e(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 433
    const-string v0, "download_done"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->c(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 435
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static f(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 196
    const-string v0, "detailFeedback"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->b(Ljava/lang/String;Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static f(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 348
    const-string v0, "appListRecommend"

    invoke-static {p0, v0, p1, p2, p3}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/util/List;)Lorg/json/JSONObject;

    move-result-object v0

    .line 350
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static f(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter

    .prologue
    .line 460
    const-string v0, "error"

    invoke-static {v0}, Lcom/yingyonghui/market/log/h;->g(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 461
    const-string v1, "params"

    invoke-static {v0, v1, p0}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 463
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static g(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 201
    const-string v0, "detailSubmitFeedback"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->b(Ljava/lang/String;Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static g(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 355
    const-string v0, "hotSearchWords"

    invoke-static {p0, v0, p1, p2, p3}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/util/List;)Lorg/json/JSONObject;

    move-result-object v0

    .line 357
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static g(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2
    .parameter

    .prologue
    .line 21
    invoke-static {}, Lcom/yingyonghui/market/log/h;->b()Lorg/json/JSONObject;

    move-result-object v0

    .line 22
    const-string v1, "a"

    invoke-static {v0, v1, p0}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 24
    return-object v0
.end method

.method public static h(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 206
    const-string v0, "detailReportError"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->b(Ljava/lang/String;Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static h(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 362
    const-string v0, "appListSearch"

    invoke-static {p0, v0, p1, p2, p3}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/util/List;)Lorg/json/JSONObject;

    move-result-object v0

    .line 364
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static h(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2
    .parameter

    .prologue
    .line 40
    invoke-static {}, Lcom/yingyonghui/market/log/h;->b()Lorg/json/JSONObject;

    move-result-object v0

    .line 41
    const-string v1, "i"

    invoke-static {v0, v1, p0}, Lcom/yingyonghui/market/util/j;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 43
    return-object v0
.end method

.method public static i(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 211
    const-string v0, "detailSubmitReportError"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->b(Ljava/lang/String;Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static i(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 383
    const-string v0, "appListRelative"

    invoke-static {p0, v0, p1, p2, p3}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/util/List;)Lorg/json/JSONObject;

    move-result-object v0

    .line 385
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static j(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 216
    const-string v0, "detailSendMail"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->b(Ljava/lang/String;Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static k(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 221
    const-string v0, "detailScreenshot"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->b(Ljava/lang/String;Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static l(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 226
    const-string v0, "detailMoreDescription"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->b(Ljava/lang/String;Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static m(Lcom/yingyonghui/market/log/m;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 231
    const-string v0, "detailMoreRelative"

    invoke-static {v0, p0}, Lcom/yingyonghui/market/log/h;->b(Ljava/lang/String;Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
