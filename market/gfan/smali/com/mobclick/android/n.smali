.class public Lcom/mobclick/android/n;
.super Ljava/lang/Object;


# static fields
.field private static A:[Ljava/lang/String; = null

.field private static B:[Ljava/lang/String; = null

.field private static C:[Ljava/lang/String; = null

.field private static D:[Ljava/lang/String; = null

.field private static E:Ljava/lang/String; = null

.field private static F:Ljava/lang/String; = null

.field private static G:Ljava/lang/String; = null

.field private static H:Ljava/lang/String; = null

.field private static I:Ljava/lang/String; = null

.field private static J:Ljava/lang/String; = null

.field private static K:Ljava/lang/String; = null

.field private static L:Ljava/lang/String; = null

.field private static M:Ljava/lang/String; = null

.field private static N:Ljava/lang/String; = null

.field private static O:Ljava/lang/String; = null

.field private static P:Ljava/lang/String; = null

.field private static Q:Ljava/lang/String; = null

.field private static R:Ljava/lang/String; = null

.field public static a:Ljava/lang/String; = null

.field public static final b:Ljava/lang/Object; = null

.field public static final c:Ljava/lang/String; = "MobclickAgent"

.field public static final d:Ljava/lang/String; = "http://www.umeng.com/app_logs"

.field public static final e:Ljava/lang/String; = "http://www.umeng.com/api/check_app_update"

.field public static final f:Ljava/lang/String; = "http://www.umeng.com/check_config_update"

.field public static final g:Ljava/lang/String; = "http://www.umeng.co/app_logs"

.field public static final h:Ljava/lang/String; = "http://www.umeng.co/api/check_app_update"

.field public static final i:Ljava/lang/String; = "http://www.umeng.co/check_config_update"

.field public static j:Z = false

.field public static k:Ljava/lang/String; = null

.field public static l:Ljava/lang/String; = null

.field public static final m:Ljava/lang/String; = "\u6b63\u5728\u66f4\u65b0\u4e2d...."

.field public static final n:Ljava/lang/String; = "Is updating...."

.field public static final o:Ljava/lang/String; = "\u6700\u65b0\u7248\u672c\u5df2\u4e0b\u8f7d\uff0c\u662f\u5426\u5b89\u88c5\uff1f"

.field public static final p:Ljava/lang/String; = "The lastest version has been downloaded, install now ?"

.field private static q:Ljava/lang/String;

.field private static r:Ljava/lang/String;

.field private static s:Ljava/lang/String;

.field private static t:Ljava/lang/String;

.field private static u:Ljava/lang/String;

.field private static v:Ljava/lang/String;

.field private static w:Ljava/lang/String;

.field private static x:Ljava/lang/String;

.field private static y:Ljava/lang/String;

.field private static z:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x0

    const/4 v3, 0x1

    const-string v0, "last_send_time"

    sput-object v0, Lcom/mobclick/android/n;->a:Ljava/lang/String;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/mobclick/android/n;->b:Ljava/lang/Object;

    sput-boolean v3, Lcom/mobclick/android/n;->j:Z

    const-string v0, "\u7528\u6237\u53cd\u9988"

    sput-object v0, Lcom/mobclick/android/n;->q:Ljava/lang/String;

    const-string v0, "Feedback"

    sput-object v0, Lcom/mobclick/android/n;->r:Ljava/lang/String;

    const-string v0, "\u672a\u8054\u7f51"

    sput-object v0, Lcom/mobclick/android/n;->k:Ljava/lang/String;

    const-string v0, "Please make sure you are connected to internet, update failed"

    sput-object v0, Lcom/mobclick/android/n;->l:Ljava/lang/String;

    const-string v0, "\u6b22\u8fce\u60a8\u63d0\u51fa\u5b9d\u8d35\u7684\u610f\u89c1\u548c\u5efa\u8bae\uff0c\u60a8\u7559\u4e0b\u7684\u6bcf\u4e2a\u5b57\u90fd\u5c07\u7528\u6765\u6539\u5584\u6211\u4eec\u7684\u670d\u52a1"

    sput-object v0, Lcom/mobclick/android/n;->s:Ljava/lang/String;

    const-string v0, "Any comments and suggestions are welcome, we believe every word you write will benefit us"

    sput-object v0, Lcom/mobclick/android/n;->t:Ljava/lang/String;

    const-string v0, "\u8bf7\u8f93\u5165\u60a8\u7684\u53cd\u9988\u610f\u89c1\uff08\u5b57\u6570500\u4ee5\u5185\uff09"

    sput-object v0, Lcom/mobclick/android/n;->u:Ljava/lang/String;

    const-string v0, "Input your suggestions here"

    sput-object v0, Lcom/mobclick/android/n;->v:Ljava/lang/String;

    const-string v0, "\u63d0\u4ea4\u53cd\u9988"

    sput-object v0, Lcom/mobclick/android/n;->w:Ljava/lang/String;

    const-string v0, "Submit suggestions"

    sput-object v0, Lcom/mobclick/android/n;->x:Ljava/lang/String;

    const-string v0, "\u8bf7\u6b63\u786e\u9009\u62e9\u5e74\u9f84\u548c\u6027\u522b\u518d\u63d0\u4ea4"

    sput-object v0, Lcom/mobclick/android/n;->y:Ljava/lang/String;

    const-string v0, "Please fill in a correct age and gender before submitting"

    sput-object v0, Lcom/mobclick/android/n;->z:Ljava/lang/String;

    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "\u5e74\u9f84"

    aput-object v1, v0, v4

    const-string v1, "18\u5c81\u4ee5\u4e0b"

    aput-object v1, v0, v3

    const-string v1, "18-24\u5c81"

    aput-object v1, v0, v5

    const-string v1, "25-30\u5c81"

    aput-object v1, v0, v6

    const-string v1, "31-35\u5c81"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, "36-40\u5c81"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "41-50\u5c81"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "51-59\u5c81"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "60\u5c81\u53ca\u4ee5\u4e0a"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mobclick/android/n;->A:[Ljava/lang/String;

    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "Age"

    aput-object v1, v0, v4

    const-string v1, "<18"

    aput-object v1, v0, v3

    const-string v1, "18~24"

    aput-object v1, v0, v5

    const-string v1, "25~30"

    aput-object v1, v0, v6

    const-string v1, "31~35"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, "36~40"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "41~50"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "51~59"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, ">=60"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mobclick/android/n;->B:[Ljava/lang/String;

    new-array v0, v6, [Ljava/lang/String;

    const-string v1, "\u6027\u522b"

    aput-object v1, v0, v4

    const-string v1, "\u7537"

    aput-object v1, v0, v3

    const-string v1, "\u5973"

    aput-object v1, v0, v5

    sput-object v0, Lcom/mobclick/android/n;->C:[Ljava/lang/String;

    new-array v0, v6, [Ljava/lang/String;

    const-string v1, "Gender"

    aput-object v1, v0, v4

    const-string v1, "Male"

    aput-object v1, v0, v3

    const-string v1, "Female"

    aput-object v1, v0, v5

    sput-object v0, Lcom/mobclick/android/n;->D:[Ljava/lang/String;

    const-string v0, "\u5e94\u7528\u7a0b\u5e8f\u6709\u65b0\u7248\u672c\u66f4\u65b0"

    sput-object v0, Lcom/mobclick/android/n;->E:Ljava/lang/String;

    const-string v0, "New version found"

    sput-object v0, Lcom/mobclick/android/n;->F:Ljava/lang/String;

    const-string v0, "\u6700\u65b0\u7248\u672c: "

    sput-object v0, Lcom/mobclick/android/n;->G:Ljava/lang/String;

    const-string v0, "Latest version: "

    sput-object v0, Lcom/mobclick/android/n;->H:Ljava/lang/String;

    const-string v0, "\uff08\u63d0\u793a\uff1a\u975eWIFI\u73af\u5883\uff09"

    sput-object v0, Lcom/mobclick/android/n;->I:Ljava/lang/String;

    const-string v0, "(Warning: Not WIFI Condition)"

    sput-object v0, Lcom/mobclick/android/n;->J:Ljava/lang/String;

    const-string v0, "\u7acb\u5373\u66f4\u65b0"

    sput-object v0, Lcom/mobclick/android/n;->K:Ljava/lang/String;

    const-string v0, "Update now"

    sput-object v0, Lcom/mobclick/android/n;->L:Ljava/lang/String;

    const-string v0, "\u5e94\u7528\u66f4\u65b0"

    sput-object v0, Lcom/mobclick/android/n;->M:Ljava/lang/String;

    const-string v0, "App updating"

    sput-object v0, Lcom/mobclick/android/n;->N:Ljava/lang/String;

    const-string v0, "\u6b63\u5728\u66f4\u65b0\u5e94\u7528\u7a0b\u5e8f..."

    sput-object v0, Lcom/mobclick/android/n;->O:Ljava/lang/String;

    const-string v0, "Updating application..."

    sput-object v0, Lcom/mobclick/android/n;->P:Ljava/lang/String;

    const-string v0, "\u4ee5\u540e\u518d\u8bf4"

    sput-object v0, Lcom/mobclick/android/n;->Q:Ljava/lang/String;

    const-string v0, "Not now"

    sput-object v0, Lcom/mobclick/android/n;->R:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static A()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyy-MM-dd"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Ljava/util/Date;Ljava/util/Date;)I
    .locals 5

    invoke-virtual {p0, p1}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p0

    move-object v1, p1

    :goto_0
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    sub-long v0, v3, v1

    const-wide/32 v2, 0x5265c00

    div-long/2addr v0, v2

    long-to-int v0, v0

    return v0

    :cond_0
    move-object v0, p1

    move-object v1, p0

    goto :goto_0
.end method

.method public static a()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->q:Ljava/lang/String;

    return-object v0
.end method

.method public static a(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mobclick/android/n;->q:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/mobclick/android/n;->r:Ljava/lang/String;

    goto :goto_0
.end method

.method public static a(Ljava/lang/String;)Ljava/util/Date;
    .locals 2

    :try_start_0
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static b()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->r:Ljava/lang/String;

    return-object v0
.end method

.method public static b(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mobclick/android/n;->s:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/mobclick/android/n;->t:Ljava/lang/String;

    goto :goto_0
.end method

.method public static c()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->s:Ljava/lang/String;

    return-object v0
.end method

.method public static c(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mobclick/android/n;->u:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/mobclick/android/n;->v:Ljava/lang/String;

    goto :goto_0
.end method

.method public static d()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->t:Ljava/lang/String;

    return-object v0
.end method

.method public static d(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mobclick/android/n;->w:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/mobclick/android/n;->x:Ljava/lang/String;

    goto :goto_0
.end method

.method public static e()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->u:Ljava/lang/String;

    return-object v0
.end method

.method public static e(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mobclick/android/n;->y:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/mobclick/android/n;->z:Ljava/lang/String;

    goto :goto_0
.end method

.method public static f()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->v:Ljava/lang/String;

    return-object v0
.end method

.method public static f(Landroid/content/Context;)[Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mobclick/android/n;->A:[Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/mobclick/android/n;->B:[Ljava/lang/String;

    goto :goto_0
.end method

.method public static g()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->w:Ljava/lang/String;

    return-object v0
.end method

.method public static g(Landroid/content/Context;)[Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mobclick/android/n;->C:[Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/mobclick/android/n;->D:[Ljava/lang/String;

    goto :goto_0
.end method

.method public static h()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->x:Ljava/lang/String;

    return-object v0
.end method

.method public static h(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mobclick/android/n;->E:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/mobclick/android/n;->F:Ljava/lang/String;

    goto :goto_0
.end method

.method public static i()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->y:Ljava/lang/String;

    return-object v0
.end method

.method public static i(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mobclick/android/n;->G:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/mobclick/android/n;->H:Ljava/lang/String;

    goto :goto_0
.end method

.method public static j()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->z:Ljava/lang/String;

    return-object v0
.end method

.method public static j(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mobclick/android/n;->I:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/mobclick/android/n;->J:Ljava/lang/String;

    goto :goto_0
.end method

.method public static k(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mobclick/android/n;->K:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/mobclick/android/n;->L:Ljava/lang/String;

    goto :goto_0
.end method

.method public static k()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->A:[Ljava/lang/String;

    return-object v0
.end method

.method public static l(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mobclick/android/n;->M:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/mobclick/android/n;->N:Ljava/lang/String;

    goto :goto_0
.end method

.method public static l()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->B:[Ljava/lang/String;

    return-object v0
.end method

.method public static m(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mobclick/android/n;->O:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/mobclick/android/n;->P:Ljava/lang/String;

    goto :goto_0
.end method

.method public static m()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->C:[Ljava/lang/String;

    return-object v0
.end method

.method public static n(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mobclick/android/n;->Q:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/mobclick/android/n;->R:Ljava/lang/String;

    goto :goto_0
.end method

.method public static n()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->D:[Ljava/lang/String;

    return-object v0
.end method

.method public static o()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->E:Ljava/lang/String;

    return-object v0
.end method

.method public static o(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\u6b63\u5728\u66f4\u65b0\u4e2d...."

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "Is updating...."

    goto :goto_0
.end method

.method public static p()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->F:Ljava/lang/String;

    return-object v0
.end method

.method public static p(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\u6700\u65b0\u7248\u672c\u5df2\u4e0b\u8f7d\uff0c\u662f\u5426\u5b89\u88c5\uff1f"

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "The lastest version has been downloaded, install now ?"

    goto :goto_0
.end method

.method public static q()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->G:Ljava/lang/String;

    return-object v0
.end method

.method public static r()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->H:Ljava/lang/String;

    return-object v0
.end method

.method public static s()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->K:Ljava/lang/String;

    return-object v0
.end method

.method public static t()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->L:Ljava/lang/String;

    return-object v0
.end method

.method public static u()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->M:Ljava/lang/String;

    return-object v0
.end method

.method public static v()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->N:Ljava/lang/String;

    return-object v0
.end method

.method public static w()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->O:Ljava/lang/String;

    return-object v0
.end method

.method public static x()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->P:Ljava/lang/String;

    return-object v0
.end method

.method public static y()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->Q:Ljava/lang/String;

    return-object v0
.end method

.method public static z()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/mobclick/android/n;->R:Ljava/lang/String;

    return-object v0
.end method
