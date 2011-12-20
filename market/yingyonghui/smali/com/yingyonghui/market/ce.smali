.class final Lcom/yingyonghui/market/ce;
.super Landroid/os/AsyncTask;
.source "ActivitySplash.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ah;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ah;)V
    .locals 0
    .parameter

    .prologue
    .line 154
    iput-object p1, p0, Lcom/yingyonghui/market/ce;->a:Lcom/yingyonghui/market/ah;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method private varargs a()Ljava/lang/Void;
    .locals 20

    .prologue
    .line 158
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/yingyonghui/market/ce;->a:Lcom/yingyonghui/market/ah;

    move-object v2, v0

    iget-object v2, v2, Lcom/yingyonghui/market/ah;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-virtual {v2}, Lcom/yingyonghui/market/ActivitySplash;->getApplicationContext()Landroid/content/Context;

    move-result-object v18

    invoke-static {}, Lcom/yingyonghui/market/util/p;->a()I

    move-result v2

    invoke-static/range {v18 .. v18}, Lcom/yingyonghui/market/util/p;->f(Landroid/content/Context;)I

    move-result v16

    invoke-static/range {v18 .. v18}, Lcom/yingyonghui/market/util/p;->h(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-static {v4}, Lcom/yingyonghui/market/util/c;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static/range {v18 .. v18}, Lcom/yingyonghui/market/util/GlobalUtil;->f(Landroid/content/Context;)I

    move-result v5

    invoke-static {}, Lcom/yingyonghui/market/util/p;->b()Ljava/lang/String;

    move-result-object v11

    invoke-static/range {v18 .. v18}, Lcom/yingyonghui/market/util/p;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-static/range {v18 .. v18}, Lcom/yingyonghui/market/util/p;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v15

    invoke-static/range {v18 .. v18}, Lcom/yingyonghui/market/util/p;->g(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-static/range {v18 .. v18}, Lcom/yingyonghui/market/util/GlobalUtil;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v14

    invoke-static {}, Lcom/yingyonghui/market/util/g;->a()Ljava/lang/String;

    move-result-object v12

    invoke-static/range {v18 .. v18}, Lcom/yingyonghui/market/util/p;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    invoke-static/range {v18 .. v18}, Lcom/yingyonghui/market/util/g;->f(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v9

    invoke-static {}, Lcom/yingyonghui/market/util/p;->c()Ljava/lang/String;

    move-result-object v17

    const/4 v7, 0x0

    aget-object v7, v9, v7

    const/4 v8, 0x1

    aget-object v8, v9, v8

    const/16 v19, 0x2

    aget-object v9, v9, v19

    invoke-static/range {v2 .. v17}, Lcom/yingyonghui/market/log/h;->a(ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v18

    move-object v1, v2

    invoke-static {v0, v1}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    :goto_0
    const/4 v2, 0x0

    return-object v2

    :catch_0
    move-exception v2

    goto :goto_0
.end method


# virtual methods
.method protected final bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 154
    invoke-direct {p0}, Lcom/yingyonghui/market/ce;->a()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method
