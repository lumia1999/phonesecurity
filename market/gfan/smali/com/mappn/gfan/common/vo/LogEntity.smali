.class public Lcom/mappn/gfan/common/vo/LogEntity;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final LOG_LEVEL_D:I = 0x2

.field public static final LOG_LEVEL_D_STR:Ljava/lang/String; = "D"

.field public static final LOG_LEVEL_E:I = 0x5

.field public static final LOG_LEVEL_E_STR:Ljava/lang/String; = "E"

.field public static final LOG_LEVEL_I:I = 0x3

.field public static final LOG_LEVEL_I_STR:Ljava/lang/String; = "I"

.field public static final LOG_LEVEL_V:I = 0x1

.field public static final LOG_LEVEL_V_STR:Ljava/lang/String; = "V"

.field public static final LOG_LEVEL_W:I = 0x4

.field public static final LOG_LEVEL_W_STR:Ljava/lang/String; = "W"

.field private static final serialVersionUID:J = -0x1953b40408dbe11aL


# instance fields
.field public createTime:J

.field public level:I

.field private log:Ljava/lang/String;

.field private logObject:Lorg/json/JSONObject;

.field public module:Ljava/lang/String;

.field public network:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/mappn/gfan/common/vo/LogEntity;->module:Ljava/lang/String;

    iput p3, p0, Lcom/mappn/gfan/common/vo/LogEntity;->level:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iput-wide v0, p0, Lcom/mappn/gfan/common/vo/LogEntity;->createTime:J

    invoke-static {p1}, Lcom/mappn/gfan/common/util/Utils;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    invoke-static {p1}, Lcom/mappn/gfan/common/util/Utils;->isMobileNetwork(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "Mobile Network "

    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz v0, :cond_1

    const-string v0, "OK"

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/vo/LogEntity;->network:Ljava/lang/String;

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/vo/LogEntity;->logObject:Lorg/json/JSONObject;

    return-void

    :cond_0
    const-string v1, "Other Network "

    goto :goto_0

    :cond_1
    const-string v0, "ERROR"

    goto :goto_1
.end method


# virtual methods
.method public addLogContent(Lcom/mappn/gfan/common/util/Pair;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mappn/gfan/common/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/mappn/gfan/common/vo/LogEntity;->logObject:Lorg/json/JSONObject;

    iget-object p0, p1, Lcom/mappn/gfan/common/util/Pair;->first:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    iget-object v1, p1, Lcom/mappn/gfan/common/util/Pair;->second:Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v1, "add log content meet json exception"

    invoke-static {v1, v0}, Lcom/mappn/gfan/common/util/Utils;->E(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getLogContent()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/LogEntity;->log:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/LogEntity;->log:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/vo/LogEntity;->logObject:Lorg/json/JSONObject;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/vo/LogEntity;->logObject:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v0, ""

    goto :goto_0
.end method

.method public setLogContent(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/vo/LogEntity;->log:Ljava/lang/String;

    return-void
.end method
