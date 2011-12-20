.class public final Lcom/yingyonghui/market/util/m;
.super Ljava/lang/Object;
.source "PromotionUtil.java"


# static fields
.field private static a:Lcom/yingyonghui/market/util/m;


# instance fields
.field private final b:Landroid/content/Context;

.field private c:Ljava/util/LinkedList;

.field private d:Landroid/content/SharedPreferences;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/yingyonghui/market/util/m;->b:Landroid/content/Context;

    .line 30
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/util/m;->d:Landroid/content/SharedPreferences;

    .line 31
    invoke-direct {p0}, Lcom/yingyonghui/market/util/m;->a()Ljava/util/LinkedList;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/util/m;->c:Ljava/util/LinkedList;

    .line 32
    return-void
.end method

.method public static a(Landroid/content/Context;)Lcom/yingyonghui/market/util/m;
    .locals 1
    .parameter

    .prologue
    .line 35
    sget-object v0, Lcom/yingyonghui/market/util/m;->a:Lcom/yingyonghui/market/util/m;

    if-nez v0, :cond_0

    .line 36
    new-instance v0, Lcom/yingyonghui/market/util/m;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/util/m;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/yingyonghui/market/util/m;->a:Lcom/yingyonghui/market/util/m;

    .line 38
    :cond_0
    sget-object v0, Lcom/yingyonghui/market/util/m;->a:Lcom/yingyonghui/market/util/m;

    return-object v0
.end method

.method private a()Ljava/util/LinkedList;
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 102
    iget-object v0, p0, Lcom/yingyonghui/market/util/m;->d:Landroid/content/SharedPreferences;

    const-string v1, "promotion_list"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 103
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 105
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    move-object v0, v1

    .line 120
    :goto_0
    return-object v0

    .line 109
    :cond_1
    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 111
    array-length v2, v0

    move v3, v7

    :goto_1
    if-ge v3, v2, :cond_2

    .line 112
    new-instance v4, Lcom/yingyonghui/market/util/i;

    invoke-direct {v4}, Lcom/yingyonghui/market/util/i;-><init>()V

    .line 113
    aget-object v5, v0, v3

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 114
    aget-object v6, v5, v7

    iput-object v6, v4, Lcom/yingyonghui/market/util/i;->a:Ljava/lang/String;

    .line 115
    const/4 v6, 0x1

    aget-object v6, v5, v6

    iput-object v6, v4, Lcom/yingyonghui/market/util/i;->c:Ljava/lang/String;

    .line 116
    const/4 v6, 0x2

    aget-object v5, v5, v6

    iput-object v5, v4, Lcom/yingyonghui/market/util/i;->b:Ljava/lang/String;

    .line 117
    invoke-virtual {v1, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 111
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    move-object v0, v1

    .line 120
    goto :goto_0
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Lcom/yingyonghui/market/util/i;
    .locals 2
    .parameter

    .prologue
    .line 61
    iget-object v0, p0, Lcom/yingyonghui/market/util/m;->c:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 62
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/yingyonghui/market/util/i;

    .line 63
    iget-object v1, p0, Lcom/yingyonghui/market/util/i;->c:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move-object v0, p0

    .line 67
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v3, 0x0

    .line 42
    new-instance v0, Lcom/yingyonghui/market/util/i;

    invoke-direct {v0}, Lcom/yingyonghui/market/util/i;-><init>()V

    .line 43
    iput-object p1, v0, Lcom/yingyonghui/market/util/i;->a:Ljava/lang/String;

    .line 44
    if-nez p2, :cond_2

    const-string v1, ""

    :goto_0
    iput-object v1, v0, Lcom/yingyonghui/market/util/i;->b:Ljava/lang/String;

    .line 45
    iput-object p3, v0, Lcom/yingyonghui/market/util/i;->c:Ljava/lang/String;

    .line 47
    iget-object v1, p0, Lcom/yingyonghui/market/util/m;->c:Ljava/util/LinkedList;

    invoke-virtual {v1, v3, v0}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    .line 48
    iget-object v0, p0, Lcom/yingyonghui/market/util/m;->c:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    const/16 v1, 0x3c

    if-le v0, v1, :cond_0

    .line 50
    :goto_1
    :try_start_0
    iget-object v0, p0, Lcom/yingyonghui/market/util/m;->c:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    const/16 v1, 0x23

    if-le v0, v1, :cond_0

    .line 51
    iget-object v0, p0, Lcom/yingyonghui/market/util/m;->c:Ljava/util/LinkedList;

    iget-object v1, p0, Lcom/yingyonghui/market/util/m;->c:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->remove(I)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/util/m;->c:Ljava/util/LinkedList;

    iget-object v1, p0, Lcom/yingyonghui/market/util/m;->d:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_1
    const-string v0, "promotion_list"

    invoke-interface {v1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :goto_2
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 58
    return-void

    :cond_2
    move-object v1, p2

    .line 44
    goto :goto_0

    .line 57
    :cond_3
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/yingyonghui/market/util/i;

    if-lez v3, :cond_4

    const/16 v4, 0x20

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    :cond_4
    iget-object v4, p0, Lcom/yingyonghui/market/util/i;->a:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const/16 v5, 0x3a

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lcom/yingyonghui/market/util/i;->c:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lcom/yingyonghui/market/util/i;->b:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_5
    const-string v0, "promotion_list"

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_2
.end method
