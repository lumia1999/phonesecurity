.class public final Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
.super Lcom/google/protobuf/GeneratedMessageLite;


# static fields
.field public static final LAST_DELAY_FIELD_NUMBER:I = 0x1

.field private static final defaultInstance:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;


# instance fields
.field private hasLastDelay:Z

.field private lastDelay_:I

.field private memoizedSerializedSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;-><init>(Z)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting;->internalForceInit()V

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    invoke-direct {v0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->initFields()V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->lastDelay_:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->memoizedSerializedSize:I

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->initFields()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/hudee/pns/bean/c;)V
    .locals 0

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;-><init>()V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->lastDelay_:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->memoizedSerializedSize:I

    return-void
.end method

.method static synthetic access$3302(Lcom/hudee/pns/bean/MessageRouting$Heartbeat;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->hasLastDelay:Z

    return p1
.end method

.method static synthetic access$3402(Lcom/hudee/pns/bean/MessageRouting$Heartbeat;I)I
    .locals 0

    iput p1, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->lastDelay_:I

    return p1
.end method

.method public static getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 1

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    return-object v0
.end method

.method private initFields()V
    .locals 0

    return-void
.end method

.method public static newBuilder()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->access$3100()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/hudee/pns/bean/MessageRouting$Heartbeat;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$Heartbeat;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->mergeDelimitedFrom(Ljava/io/InputStream;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->access$3000(Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->mergeDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->access$3000(Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->mergeFrom(Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->access$3000(Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->mergeFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->access$3000(Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->access$3000(Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->access$3000(Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->mergeFrom(Ljava/io/InputStream;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->access$3000(Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->mergeFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->access$3000(Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom([B)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->mergeFrom([B)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->access$3000(Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->mergeFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->access$3000(Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 1

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    return-object v0
.end method

.method public getLastDelay()I
    .locals 1

    iget v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->lastDelay_:I

    return v0
.end method

.method public getSerializedSize()I
    .locals 3

    iget v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->memoizedSerializedSize:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->hasLastDelay()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->getLastDelay()I

    move-result v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->memoizedSerializedSize:I

    goto :goto_0
.end method

.method public hasLastDelay()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->hasLastDelay:Z

    return v0
.end method

.method public final isInitialized()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->newBuilderForType()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public newBuilderForType()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->toBuilder()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;
    .locals 1

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->newBuilder(Lcom/hudee/pns/bean/MessageRouting$Heartbeat;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 2

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->getSerializedSize()I

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->hasLastDelay()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->getLastDelay()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    :cond_0
    return-void
.end method
