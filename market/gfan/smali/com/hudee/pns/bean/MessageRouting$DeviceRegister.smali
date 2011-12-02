.class public final Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
.super Lcom/google/protobuf/GeneratedMessageLite;


# static fields
.field public static final CHARSET_FIELD_NUMBER:I = 0x8

.field public static final CLIENT_VERSION_FIELD_NUMBER:I = 0x7

.field public static final ETC_FIELD_NUMBER:I = 0x9

.field public static final IMEI_FIELD_NUMBER:I = 0x1

.field public static final OS_NAME_FIELD_NUMBER:I = 0x5

.field public static final OS_VERSION_FIELD_NUMBER:I = 0x6

.field public static final SCREEN_COLOR_DEPTH_FIELD_NUMBER:I = 0x4

.field public static final SCREEN_HEIGHT_FIELD_NUMBER:I = 0x3

.field public static final SCREEN_WIDTH_FIELD_NUMBER:I = 0x2

.field private static final defaultInstance:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;


# instance fields
.field private charset_:Ljava/lang/String;

.field private clientVersion_:Ljava/lang/String;

.field private etc_:Ljava/lang/String;

.field private hasCharset:Z

.field private hasClientVersion:Z

.field private hasEtc:Z

.field private hasImei:Z

.field private hasOsName:Z

.field private hasOsVersion:Z

.field private hasScreenColorDepth:Z

.field private hasScreenHeight:Z

.field private hasScreenWidth:Z

.field private imei_:Ljava/lang/String;

.field private memoizedSerializedSize:I

.field private osName_:Ljava/lang/String;

.field private osVersion_:Ljava/lang/String;

.field private screenColorDepth_:I

.field private screenHeight_:Ljava/lang/String;

.field private screenWidth_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;-><init>(Z)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting;->internalForceInit()V

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-direct {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->initFields()V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->imei_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->screenWidth_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->screenHeight_:Ljava/lang/String;

    const/4 v0, 0x0

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->screenColorDepth_:I

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->osName_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->osVersion_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->clientVersion_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->charset_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->etc_:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->memoizedSerializedSize:I

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->initFields()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/hudee/pns/bean/c;)V
    .locals 0

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;-><init>()V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->imei_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->screenWidth_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->screenHeight_:Ljava/lang/String;

    const/4 v0, 0x0

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->screenColorDepth_:I

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->osName_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->osVersion_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->clientVersion_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->charset_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->etc_:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->memoizedSerializedSize:I

    return-void
.end method

.method static synthetic access$4302(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasImei:Z

    return p1
.end method

.method static synthetic access$4402(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->imei_:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$4502(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenWidth:Z

    return p1
.end method

.method static synthetic access$4602(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->screenWidth_:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$4702(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenHeight:Z

    return p1
.end method

.method static synthetic access$4802(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->screenHeight_:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$4902(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenColorDepth:Z

    return p1
.end method

.method static synthetic access$5002(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;I)I
    .locals 0

    iput p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->screenColorDepth_:I

    return p1
.end method

.method static synthetic access$5102(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasOsName:Z

    return p1
.end method

.method static synthetic access$5202(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->osName_:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$5302(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasOsVersion:Z

    return p1
.end method

.method static synthetic access$5402(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->osVersion_:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$5502(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasClientVersion:Z

    return p1
.end method

.method static synthetic access$5602(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->clientVersion_:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$5702(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasCharset:Z

    return p1
.end method

.method static synthetic access$5802(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->charset_:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$5902(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasEtc:Z

    return p1
.end method

.method static synthetic access$6002(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->etc_:Ljava/lang/String;

    return-object p1
.end method

.method public static getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 1

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    return-object v0
.end method

.method private initFields()V
    .locals 0

    return-void
.end method

.method public static newBuilder()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->access$4100()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->mergeDelimitedFrom(Ljava/io/InputStream;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->access$4000(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->mergeDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->access$4000(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->mergeFrom(Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->access$4000(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->mergeFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->access$4000(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->access$4000(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->access$4000(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->mergeFrom(Ljava/io/InputStream;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->access$4000(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->mergeFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->access$4000(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom([B)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->mergeFrom([B)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->access$4000(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->mergeFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->access$4000(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getCharset()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->charset_:Ljava/lang/String;

    return-object v0
.end method

.method public getClientVersion()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->clientVersion_:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 1

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    return-object v0
.end method

.method public getEtc()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->etc_:Ljava/lang/String;

    return-object v0
.end method

.method public getImei()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->imei_:Ljava/lang/String;

    return-object v0
.end method

.method public getOsName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->osName_:Ljava/lang/String;

    return-object v0
.end method

.method public getOsVersion()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->osVersion_:Ljava/lang/String;

    return-object v0
.end method

.method public getScreenColorDepth()I
    .locals 1

    iget v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->screenColorDepth_:I

    return v0
.end method

.method public getScreenHeight()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->screenHeight_:Ljava/lang/String;

    return-object v0
.end method

.method public getScreenWidth()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->screenWidth_:Ljava/lang/String;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 3

    iget v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->memoizedSerializedSize:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasImei()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getImei()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenWidth()Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x2

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getScreenWidth()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_2
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenHeight()Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v1, 0x3

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getScreenHeight()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_3
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenColorDepth()Z

    move-result v1

    if-eqz v1, :cond_4

    const/4 v1, 0x4

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getScreenColorDepth()I

    move-result v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_4
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasOsName()Z

    move-result v1

    if-eqz v1, :cond_5

    const/4 v1, 0x5

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getOsName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_5
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasOsVersion()Z

    move-result v1

    if-eqz v1, :cond_6

    const/4 v1, 0x6

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getOsVersion()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_6
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasClientVersion()Z

    move-result v1

    if-eqz v1, :cond_7

    const/4 v1, 0x7

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getClientVersion()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_7
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasCharset()Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v1, 0x8

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getCharset()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_8
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasEtc()Z

    move-result v1

    if-eqz v1, :cond_9

    const/16 v1, 0x9

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getEtc()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_9
    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->memoizedSerializedSize:I

    goto/16 :goto_0
.end method

.method public hasCharset()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasCharset:Z

    return v0
.end method

.method public hasClientVersion()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasClientVersion:Z

    return v0
.end method

.method public hasEtc()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasEtc:Z

    return v0
.end method

.method public hasImei()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasImei:Z

    return v0
.end method

.method public hasOsName()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasOsName:Z

    return v0
.end method

.method public hasOsVersion()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasOsVersion:Z

    return v0
.end method

.method public hasScreenColorDepth()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenColorDepth:Z

    return v0
.end method

.method public hasScreenHeight()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenHeight:Z

    return v0
.end method

.method public hasScreenWidth()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenWidth:Z

    return v0
.end method

.method public final isInitialized()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->newBuilderForType()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    return-object v0
.end method

.method public newBuilderForType()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->toBuilder()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 1

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->newBuilder(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 2

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getSerializedSize()I

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasImei()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getImei()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    :cond_0
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenWidth()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getScreenWidth()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    :cond_1
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenHeight()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getScreenHeight()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    :cond_2
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenColorDepth()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x4

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getScreenColorDepth()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    :cond_3
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasOsName()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x5

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getOsName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    :cond_4
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasOsVersion()Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x6

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getOsVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    :cond_5
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasClientVersion()Z

    move-result v0

    if-eqz v0, :cond_6

    const/4 v0, 0x7

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getClientVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    :cond_6
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasCharset()Z

    move-result v0

    if-eqz v0, :cond_7

    const/16 v0, 0x8

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getCharset()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    :cond_7
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasEtc()Z

    move-result v0

    if-eqz v0, :cond_8

    const/16 v0, 0x9

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getEtc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    :cond_8
    return-void
.end method
