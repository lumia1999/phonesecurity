.class Lcom/mappn/gfan/common/AndroidHttpClient$LoggingConfiguration;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/AndroidHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LoggingConfiguration"
.end annotation


# instance fields
.field private final level:I

.field private final tag:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/mappn/gfan/common/AndroidHttpClient$LoggingConfiguration;->tag:Ljava/lang/String;

    iput p2, p0, Lcom/mappn/gfan/common/AndroidHttpClient$LoggingConfiguration;->level:I

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILcom/mappn/gfan/common/AndroidHttpClient$1;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/mappn/gfan/common/AndroidHttpClient$LoggingConfiguration;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$400(Lcom/mappn/gfan/common/AndroidHttpClient$LoggingConfiguration;)Z
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/AndroidHttpClient$LoggingConfiguration;->isLoggable()Z

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lcom/mappn/gfan/common/AndroidHttpClient$LoggingConfiguration;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/AndroidHttpClient$LoggingConfiguration;->println(Ljava/lang/String;)V

    return-void
.end method

.method private isLoggable()Z
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/common/AndroidHttpClient$LoggingConfiguration;->tag:Ljava/lang/String;

    iget v1, p0, Lcom/mappn/gfan/common/AndroidHttpClient$LoggingConfiguration;->level:I

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method private println(Ljava/lang/String;)V
    .locals 2

    iget v0, p0, Lcom/mappn/gfan/common/AndroidHttpClient$LoggingConfiguration;->level:I

    iget-object v1, p0, Lcom/mappn/gfan/common/AndroidHttpClient$LoggingConfiguration;->tag:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    return-void
.end method
