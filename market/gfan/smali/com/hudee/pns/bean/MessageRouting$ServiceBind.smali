.class public final Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
.super Lcom/google/protobuf/GeneratedMessageLite;


# static fields
.field public static final APPLICATION_ID_FIELD_NUMBER:I = 0x1

.field public static final CLIENT_ID_FIELD_NUMBER:I = 0x2

.field private static final defaultInstance:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;


# instance fields
.field private applicationId_:Ljava/lang/String;

.field private clientId_:Ljava/lang/String;

.field private hasApplicationId:Z

.field private hasClientId:Z

.field private memoizedSerializedSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;-><init>(Z)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting;->internalForceInit()V

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    invoke-direct {v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->initFields()V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->applicationId_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->clientId_:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->memoizedSerializedSize:I

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->initFields()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/hudee/pns/bean/c;)V
    .locals 0

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;-><init>()V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->applicationId_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->clientId_:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->memoizedSerializedSize:I

    return-void
.end method

.method static synthetic access$7102(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->hasApplicationId:Z

    return p1
.end method

.method static synthetic access$7202(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->applicationId_:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$7302(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->hasClientId:Z

    return p1
.end method

.method static synthetic access$7402(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->clientId_:Ljava/lang/String;

    return-object p1
.end method

.method public static getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 1

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    return-object v0
.end method

.method private initFields()V
    .locals 0

    return-void
.end method

.method public static newBuilder()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->access$6900()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->mergeDelimitedFrom(Ljava/io/InputStream;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->access$6800(Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->mergeDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->access$6800(Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->mergeFrom(Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->access$6800(Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->mergeFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->access$6800(Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->access$6800(Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->access$6800(Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->mergeFrom(Ljava/io/InputStream;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->access$6800(Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->mergeFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->access$6800(Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom([B)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->mergeFrom([B)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->access$6800(Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->mergeFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->access$6800(Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getApplicationId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->applicationId_:Ljava/lang/String;

    return-object v0
.end method

.method public getClientId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->clientId_:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 1

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 3

    iget v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->memoizedSerializedSize:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->hasApplicationId()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getApplicationId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->hasClientId()Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x2

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getClientId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_2
    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->memoizedSerializedSize:I

    goto :goto_0
.end method

.method public hasApplicationId()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->hasApplicationId:Z

    return v0
.end method

.method public hasClientId()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->hasClientId:Z

    return v0
.end method

.method public final isInitialized()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->hasApplicationId:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->newBuilderForType()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    return-object v0
.end method

.method public newBuilderForType()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->toBuilder()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;
    .locals 1

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->newBuilder(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 2

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getSerializedSize()I

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->hasApplicationId()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getApplicationId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    :cond_0
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->hasClientId()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getClientId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    :cond_1
    return-void
.end method
