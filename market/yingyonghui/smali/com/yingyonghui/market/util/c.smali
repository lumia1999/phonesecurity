.class public final Lcom/yingyonghui/market/util/c;
.super Ljava/lang/Object;
.source "StringUtil.java"


# static fields
.field private static final a:Ljava/util/regex/Pattern;

.field private static final b:Ljava/util/regex/Pattern;

.field private static final c:Ljava/util/regex/Pattern;

.field private static final d:Ljava/util/regex/Pattern;

.field private static final e:Ljava/util/regex/Pattern;

.field private static final f:Ljava/util/regex/Pattern;

.field private static final g:Ljava/util/regex/Pattern;

.field private static h:Ljava/util/Map;

.field private static final i:[Ljava/lang/String;

.field private static final j:Ljava/util/Set;

.field private static k:[C

.field private static synthetic l:Z


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/16 v6, 0xfc

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 35
    const-class v0, Lcom/yingyonghui/market/util/c;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v5

    :goto_0
    sput-boolean v0, Lcom/yingyonghui/market/util/c;->l:Z

    .line 47
    const-string v0, "</?[a-zA-Z][^>]*>"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/util/c;->a:Ljava/util/regex/Pattern;

    .line 50
    const-string v0, "&#?[a-zA-Z0-9]{1,8};"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/util/c;->b:Ljava/util/regex/Pattern;

    .line 53
    const-string v0, "(.*)\\{(\\d+),(\\d+)\\}(.*)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/util/c;->c:Ljava/util/regex/Pattern;

    .line 56
    const-string v0, "^[\\w]+[\\w\\.\\-\\+\\_]+@[\\w\\.\\-\\_]+\\.[\\w]+$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/util/c;->d:Ljava/util/regex/Pattern;

    .line 58
    const-string v0, "^[1-9][0-9]{4,10}$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/util/c;->e:Ljava/util/regex/Pattern;

    .line 60
    const-string v0, "^\\d{3}\\-\\d{8}|\\d{4}\\-\\d{7}$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/util/c;->f:Ljava/util/regex/Pattern;

    .line 62
    const-string v0, "^1[358]\\d{9}$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/util/c;->g:Ljava/util/regex/Pattern;

    .line 882
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v6}, Ljava/util/HashMap;-><init>(I)V

    .line 884
    sput-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&nbsp;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xa0

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 885
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&iexcl;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xa1

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 886
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&cent;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xa2

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 887
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&pound;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xa3

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 888
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&curren;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xa4

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 889
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&yen;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xa5

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 890
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&brvbar;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xa6

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 891
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&sect;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xa7

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 892
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&uml;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xa8

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 893
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&copy;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xa9

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 894
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ordf;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xaa

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 895
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&laquo;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xab

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 896
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&not;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xac

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 897
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&shy;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xad

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 898
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&reg;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xae

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 899
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&macr;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xaf

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 900
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&deg;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xb0

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 901
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&plusmn;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xb1

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 902
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&sup2;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xb2

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 903
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&sup3;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xb3

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 904
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&acute;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xb4

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 905
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&micro;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xb5

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 906
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&para;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xb6

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 907
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&middot;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xb7

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 908
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&cedil;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xb8

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 909
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&sup1;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xb9

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 910
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ordm;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xba

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 911
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&raquo;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xbb

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 912
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&frac14;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xbc

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 913
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&frac12;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xbd

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 914
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&frac34;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xbe

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 915
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&iquest;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xbf

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 916
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Agrave;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xc0

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 917
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Aacute;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xc1

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 918
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Acirc;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xc2

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 919
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Atilde;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xc3

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 920
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Auml;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xc4

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 921
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Aring;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xc5

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 922
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&AElig;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xc6

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 923
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Ccedil;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xc7

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 924
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Egrave;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xc8

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 925
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Eacute;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xc9

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 926
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Ecirc;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xca

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 927
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Euml;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xcb

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 928
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Igrave;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xcc

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 929
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Iacute;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xcd

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 930
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Icirc;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xce

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 931
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Iuml;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xcf

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 932
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ETH;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xd0

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 933
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Ntilde;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xd1

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 934
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Ograve;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xd2

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 935
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Oacute;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xd3

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 936
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Ocirc;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xd4

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 937
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Otilde;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xd5

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 938
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Ouml;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xd6

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 939
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&times;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xd7

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 940
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Oslash;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xd8

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 941
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Ugrave;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xd9

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 942
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Uacute;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xda

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 943
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Ucirc;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xdb

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 944
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Uuml;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xdc

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 945
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Yacute;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xdd

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 946
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&THORN;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xde

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 947
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&szlig;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xdf

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 948
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&agrave;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xe0

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 949
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&aacute;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xe1

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 950
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&acirc;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xe2

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 951
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&atilde;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xe3

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 952
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&auml;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xe4

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 953
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&aring;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xe5

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 954
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&aelig;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xe6

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 955
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ccedil;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xe7

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 956
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&egrave;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xe8

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 957
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&eacute;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xe9

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 958
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ecirc;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xea

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 959
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&euml;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xeb

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 960
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&igrave;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xec

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 961
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&iacute;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xed

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 962
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&icirc;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xee

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 963
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&iuml;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xef

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 964
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&eth;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xf0

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 965
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ntilde;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xf1

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 966
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ograve;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xf2

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 967
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&oacute;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xf3

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 968
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ocirc;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xf4

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 969
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&otilde;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xf5

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 970
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ouml;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xf6

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 971
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&divide;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xf7

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 972
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&oslash;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xf8

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 973
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ugrave;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xf9

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 974
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&uacute;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xfa

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 975
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ucirc;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xfb

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 976
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&uuml;"

    new-instance v2, Ljava/lang/Character;

    invoke-direct {v2, v6}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 977
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&yacute;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xfd

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 978
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&thorn;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xfe

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 979
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&yuml;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0xff

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 980
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&fnof;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x192

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 981
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Alpha;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x391

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 982
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Beta;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x392

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 983
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Gamma;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x393

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 984
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Delta;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x394

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 985
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Epsilon;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x395

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 986
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Zeta;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x396

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 987
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Eta;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x397

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 988
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Theta;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x398

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 989
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Iota;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x399

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 990
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Kappa;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x39a

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 991
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Lambda;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x39b

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 992
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Mu;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x39c

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 993
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Nu;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x39d

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 994
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Xi;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x39e

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 995
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Omicron;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x39f

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 996
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Pi;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3a0

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 997
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Rho;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3a1

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 998
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Sigma;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3a3

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 999
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Tau;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3a4

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1000
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Upsilon;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3a5

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1001
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Phi;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3a6

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1002
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Chi;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3a7

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1003
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Psi;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3a8

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1004
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Omega;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3a9

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1005
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&alpha;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3b1

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1006
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&beta;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3b2

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1007
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&gamma;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3b3

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1008
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&delta;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3b4

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1009
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&epsilon;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3b5

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1010
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&zeta;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3b6

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1011
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&eta;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3b7

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1012
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&theta;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3b8

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1013
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&iota;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3b9

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1014
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&kappa;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3ba

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1015
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&lambda;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3bb

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1016
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&mu;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3bc

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1017
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&nu;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3bd

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1018
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&xi;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3be

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1019
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&omicron;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3bf

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1020
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&pi;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3c0

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1021
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&rho;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3c1

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1022
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&sigmaf;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3c2

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1023
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&sigma;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3c3

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1024
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&tau;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3c4

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1025
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&upsilon;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3c5

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1026
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&phi;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3c6

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1027
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&chi;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3c7

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1028
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&psi;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3c8

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1029
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&omega;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3c9

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1030
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&thetasym;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3d1

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1031
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&upsih;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3d2

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1032
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&piv;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3d6

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1033
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&bull;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2022

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1034
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&hellip;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2026

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1035
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&prime;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2032

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1036
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Prime;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2033

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1037
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&oline;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x203e

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1038
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&frasl;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2044

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1039
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&weierp;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2118

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1040
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&image;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2111

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1041
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&real;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x211c

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1042
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&trade;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2122

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1043
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&alefsym;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2135

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1044
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&larr;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2190

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1045
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&uarr;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2191

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1046
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&rarr;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2192

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1047
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&darr;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2193

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1048
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&harr;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2194

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1049
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&crarr;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x21b5

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1050
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&lArr;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x21d0

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1051
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&uArr;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x21d1

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1052
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&rArr;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x21d2

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1053
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&dArr;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x21d3

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1054
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&hArr;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x21d4

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1055
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&forall;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2200

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1056
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&part;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2202

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1057
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&exist;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2203

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1058
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&empty;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2205

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1059
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&nabla;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2207

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1060
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&isin;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2208

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1061
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&notin;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2209

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1062
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ni;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x220b

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1063
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&prod;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x220f

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1064
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&sum;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2211

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1065
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&minus;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2212

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1066
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&lowast;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2217

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1067
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&radic;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x221a

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1068
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&prop;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x221d

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1069
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&infin;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x221e

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1070
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ang;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2220

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1071
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&and;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2227

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1072
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&or;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2228

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1073
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&cap;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2229

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1074
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&cup;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x222a

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1075
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&int;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x222b

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1076
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&there4;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2234

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1077
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&sim;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x223c

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1078
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&cong;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2245

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1079
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&asymp;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2248

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1080
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ne;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2260

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1081
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&equiv;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2261

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1082
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&le;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2264

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1083
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ge;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2265

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1084
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&sub;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2282

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1085
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&sup;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2283

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1086
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&nsub;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2284

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1087
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&sube;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2286

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1088
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&supe;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2287

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1089
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&oplus;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2295

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1090
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&otimes;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2297

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1091
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&perp;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x22a5

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1092
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&sdot;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x22c5

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1093
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&lceil;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2308

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1094
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&rceil;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2309

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1095
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&lfloor;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x230a

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1096
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&rfloor;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x230b

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1097
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&lang;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2329

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1098
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&rang;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x232a

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1099
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&loz;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x25ca

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1100
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&spades;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2660

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1101
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&clubs;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2663

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1102
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&hearts;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2665

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1103
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&diams;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2666

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1104
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&quot;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x22

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1105
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&amp;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x26

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1106
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&lt;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3c

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1107
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&gt;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x3e

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1108
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&OElig;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x152

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1109
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&oelig;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x153

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1110
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Scaron;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x160

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1111
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&scaron;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x161

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1112
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Yuml;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x178

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1113
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&circ;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2c6

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1114
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&tilde;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2dc

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1115
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ensp;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2002

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1116
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&emsp;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2003

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1117
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&thinsp;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2009

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1118
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&zwnj;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x200c

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1119
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&zwj;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x200d

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1120
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&lrm;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x200e

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1121
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&rlm;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x200f

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1122
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ndash;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2013

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1123
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&mdash;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2014

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1124
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&lsquo;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2018

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1125
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&rsquo;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2019

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1126
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&sbquo;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x201a

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1127
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&ldquo;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x201c

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1128
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&rdquo;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x201d

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1129
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&bdquo;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x201e

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1130
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&dagger;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2020

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1131
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&Dagger;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2021

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1132
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&permil;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2030

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1133
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&lsaquo;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x2039

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1134
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&rsaquo;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x203a

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1135
    sget-object v0, Lcom/yingyonghui/market/util/c;->h:Ljava/util/Map;

    const-string v1, "&euro;"

    new-instance v2, Ljava/lang/Character;

    const/16 v3, 0x20ac

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1262
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "script"

    aput-object v1, v0, v4

    const-string v1, "style"

    aput-object v1, v0, v5

    const/4 v1, 0x2

    const-string v2, "object"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "applet"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "!--"

    aput-object v2, v0, v1

    sput-object v0, Lcom/yingyonghui/market/util/c;->i:[Ljava/lang/String;

    .line 2368
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 2369
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->HANGUL_JAMO:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2370
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->CJK_RADICALS_SUPPLEMENT:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2371
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->KANGXI_RADICALS:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2372
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->CJK_SYMBOLS_AND_PUNCTUATION:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2373
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->HIRAGANA:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2374
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->KATAKANA:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2375
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->BOPOMOFO:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2376
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->HANGUL_COMPATIBILITY_JAMO:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2377
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->KANBUN:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2378
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->BOPOMOFO_EXTENDED:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2379
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->KATAKANA_PHONETIC_EXTENSIONS:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2380
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->ENCLOSED_CJK_LETTERS_AND_MONTHS:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2381
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->CJK_COMPATIBILITY:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2382
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2383
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->CJK_UNIFIED_IDEOGRAPHS:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2384
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->HANGUL_SYLLABLES:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2385
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->CJK_COMPATIBILITY_IDEOGRAPHS:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2386
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->CJK_COMPATIBILITY_FORMS:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2387
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->HALFWIDTH_AND_FULLWIDTH_FORMS:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2388
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->CJK_UNIFIED_IDEOGRAPHS_EXTENSION_B:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2389
    sget-object v1, Ljava/lang/Character$UnicodeBlock;->CJK_COMPATIBILITY_IDEOGRAPHS_SUPPLEMENT:Ljava/lang/Character$UnicodeBlock;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2390
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/util/c;->j:Ljava/util/Set;

    .line 2712
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/yingyonghui/market/util/c;->k:[C

    return-void

    :cond_0
    move v0, v4

    .line 35
    goto/16 :goto_0

    .line 2712
    nop

    :array_0
    .array-data 0x2
        0x30t 0x0t
        0x31t 0x0t
        0x32t 0x0t
        0x33t 0x0t
        0x34t 0x0t
        0x35t 0x0t
        0x36t 0x0t
        0x37t 0x0t
        0x38t 0x0t
        0x39t 0x0t
        0x61t 0x0t
        0x62t 0x0t
        0x63t 0x0t
        0x64t 0x0t
        0x65t 0x0t
        0x66t 0x0t
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Ljava/lang/String;)Z
    .locals 1
    .parameter

    .prologue
    .line 68
    sget-object v0, Lcom/yingyonghui/market/util/c;->d:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    return v0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 2275
    if-ne p0, p1, :cond_0

    .line 2276
    const/4 v0, 0x1

    .line 2283
    :goto_0
    return v0

    .line 2278
    :cond_0
    if-eqz p0, :cond_1

    .line 2279
    if-eqz p1, :cond_1

    .line 2280
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    .line 2283
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static b(Ljava/lang/String;)Z
    .locals 1
    .parameter

    .prologue
    .line 72
    sget-object v0, Lcom/yingyonghui/market/util/c;->e:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    return v0
.end method

.method public static c(Ljava/lang/String;)Z
    .locals 1
    .parameter

    .prologue
    .line 76
    sget-object v0, Lcom/yingyonghui/market/util/c;->f:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    return v0
.end method

.method public static d(Ljava/lang/String;)Z
    .locals 1
    .parameter

    .prologue
    .line 80
    sget-object v0, Lcom/yingyonghui/market/util/c;->g:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    return v0
.end method

.method public static e(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter

    .prologue
    .line 375
    const-string v0, " \r\n\t\u3000\u00a0\u2007\u202f"

    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    :goto_1
    if-gt v1, v2, :cond_1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-ltz v3, :cond_1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    :goto_2
    if-lt v2, v1, :cond_2

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-ltz v3, :cond_2

    add-int/lit8 v2, v2, -0x1

    goto :goto_2

    :cond_2
    add-int/lit8 v0, v2, 0x1

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static f(Ljava/lang/String;)Z
    .locals 1
    .parameter

    .prologue
    .line 2187
    invoke-static {p0}, Lcom/yingyonghui/market/util/c;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static g(Ljava/lang/String;)Z
    .locals 5
    .parameter

    .prologue
    const/4 v4, 0x0

    .line 2197
    invoke-static {p0}, Lcom/yingyonghui/market/util/c;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2198
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    move v2, v4

    :goto_0
    if-ge v2, v1, :cond_1

    .line 2199
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    if-nez v3, :cond_0

    move v0, v4

    .line 2203
    :goto_1
    return v0

    .line 2198
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2203
    :cond_1
    const/4 v0, 0x1

    goto :goto_1
.end method

.method public static h(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 2212
    if-nez p0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    move-object v0, p0

    goto :goto_0
.end method
