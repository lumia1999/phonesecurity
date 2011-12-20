.class public final Lcom/yingyonghui/market/log/l;
.super Ljava/lang/Object;
.source "ClientLogger.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static a(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .parameter

    .prologue
    .line 337
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 339
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/yingyonghui/market/model/l;

    .line 340
    if-eqz p0, :cond_0

    .line 341
    iget v2, p0, Lcom/yingyonghui/market/model/l;->e:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 345
    :cond_1
    return-object v0
.end method

.method public static a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;IILjava/util/List;)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 198
    invoke-static {p4}, Lcom/yingyonghui/market/log/l;->a(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 199
    invoke-static {p1, p2, p3, v0}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;

    move-result-object v0

    .line 200
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 201
    return-void
.end method

.method public static a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;ILjava/util/List;)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 245
    invoke-static {p3}, Lcom/yingyonghui/market/log/l;->a(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 246
    invoke-static {p1, p2, v0}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;ILjava/util/List;)Ljava/lang/String;

    move-result-object v0

    .line 247
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 248
    return-void
.end method

.method public static a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/lang/String;)V
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 77
    invoke-static {p1, p2}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 78
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 79
    return-void
.end method

.method public static a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/lang/String;II)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 57
    invoke-static {p1, p2, p3, p4}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    .line 58
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 59
    return-void
.end method

.method public static a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/lang/String;)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 62
    invoke-static {p1, p2, p3, p4, p5}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;Ljava/lang/String;IILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 63
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 64
    return-void
.end method

.method public static a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/util/List;)V
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 192
    invoke-static {p2}, Lcom/yingyonghui/market/log/l;->a(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 193
    invoke-static {p1, v0}, Lcom/yingyonghui/market/log/h;->a(Lcom/yingyonghui/market/log/m;Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    .line 194
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 195
    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 42
    invoke-static {p1}, Lcom/yingyonghui/market/log/h;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 43
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 52
    invoke-static {p1, p2}, Lcom/yingyonghui/market/log/h;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 53
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;Lcom/yingyonghui/market/log/m;)V
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 182
    invoke-static {p1, p2}, Lcom/yingyonghui/market/log/h;->a(Ljava/lang/String;Lcom/yingyonghui/market/log/m;)Ljava/lang/String;

    move-result-object v0

    .line 183
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 184
    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;Lcom/yingyonghui/market/log/m;II)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 172
    invoke-static {p1, p2, p3, p4}, Lcom/yingyonghui/market/log/h;->a(Ljava/lang/String;Lcom/yingyonghui/market/log/m;II)Ljava/lang/String;

    move-result-object v0

    .line 173
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 174
    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;Lcom/yingyonghui/market/log/m;ILjava/lang/String;)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 177
    invoke-static {p1, p2, p3, p4}, Lcom/yingyonghui/market/log/h;->a(Ljava/lang/String;Lcom/yingyonghui/market/log/m;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 178
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 179
    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 67
    invoke-static {p1, p2}, Lcom/yingyonghui/market/log/h;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 68
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 69
    return-void
.end method

.method public static b(Landroid/content/Context;Lcom/yingyonghui/market/log/m;IILjava/util/List;)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 204
    invoke-static {p4}, Lcom/yingyonghui/market/log/l;->a(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 205
    invoke-static {p1, p2, p3, v0}, Lcom/yingyonghui/market/log/h;->b(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;

    move-result-object v0

    .line 206
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 207
    return-void
.end method

.method public static b(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/util/List;)V
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 251
    invoke-static {p2}, Lcom/yingyonghui/market/log/l;->a(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 252
    invoke-static {p1, v0}, Lcom/yingyonghui/market/log/h;->b(Lcom/yingyonghui/market/log/m;Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    .line 253
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 254
    return-void
.end method

.method public static b(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 187
    invoke-static {p1}, Lcom/yingyonghui/market/log/h;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 188
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 189
    return-void
.end method

.method public static c(Landroid/content/Context;Lcom/yingyonghui/market/log/m;IILjava/util/List;)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 210
    invoke-static {p4}, Lcom/yingyonghui/market/log/l;->a(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 211
    invoke-static {p1, p2, p3, v0}, Lcom/yingyonghui/market/log/h;->c(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;

    move-result-object v0

    .line 212
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 213
    return-void
.end method

.method public static d(Landroid/content/Context;Lcom/yingyonghui/market/log/m;IILjava/util/List;)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 216
    invoke-static {p4}, Lcom/yingyonghui/market/log/l;->a(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 217
    invoke-static {p1, p2, p3, v0}, Lcom/yingyonghui/market/log/h;->d(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;

    move-result-object v0

    .line 218
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 219
    return-void
.end method

.method public static e(Landroid/content/Context;Lcom/yingyonghui/market/log/m;IILjava/util/List;)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 222
    invoke-static {p4}, Lcom/yingyonghui/market/log/l;->a(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 223
    invoke-static {p1, p2, p3, v0}, Lcom/yingyonghui/market/log/h;->e(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;

    move-result-object v0

    .line 224
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 225
    return-void
.end method

.method public static f(Landroid/content/Context;Lcom/yingyonghui/market/log/m;IILjava/util/List;)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 228
    invoke-static {p4}, Lcom/yingyonghui/market/log/l;->a(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 229
    invoke-static {p1, p2, p3, v0}, Lcom/yingyonghui/market/log/h;->f(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;

    move-result-object v0

    .line 230
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 231
    return-void
.end method

.method public static g(Landroid/content/Context;Lcom/yingyonghui/market/log/m;IILjava/util/List;)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 239
    invoke-static {p4}, Lcom/yingyonghui/market/log/l;->a(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 240
    invoke-static {p1, p2, p3, v0}, Lcom/yingyonghui/market/log/h;->h(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;

    move-result-object v0

    .line 241
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 242
    return-void
.end method

.method public static h(Landroid/content/Context;Lcom/yingyonghui/market/log/m;IILjava/util/List;)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 257
    invoke-static {p4}, Lcom/yingyonghui/market/log/l;->a(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 258
    invoke-static {p1, p2, p3, v0}, Lcom/yingyonghui/market/log/h;->i(Lcom/yingyonghui/market/log/m;IILjava/util/List;)Ljava/lang/String;

    move-result-object v0

    .line 259
    invoke-static {p0, v0}, Lcom/yingyonghui/market/log/LogService;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 260
    return-void
.end method
