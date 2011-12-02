.class public final Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
.super Lcom/google/protobuf/GeneratedMessageLite;


# static fields
.field public static final CAUSE_FIELD_NUMBER:I = 0x3

.field public static final LAST_EXCEPTION_FIELD_NUMBER:I = 0x1

.field public static final LAST_TIMEOUT_FIELD_NUMBER:I = 0x2

.field private static final defaultInstance:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;


# instance fields
.field private cause_:Ljava/lang/String;

.field private hasCause:Z

.field private hasLastException:Z

.field private hasLastTimeout:Z

.field private lastException_:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

.field private lastTimeout_:I

.field private memoizedSerializedSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;-><init>(Z)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting;->internalForceInit()V

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-direct {v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->initFields()V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->lastTimeout_:I

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->cause_:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->memoizedSerializedSize:I

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->initFields()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/hudee/pns/bean/c;)V
    .locals 0

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;-><init>()V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->lastTimeout_:I

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->cause_:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->memoizedSerializedSize:I

    return-void
.end method

.method static synthetic access$2402(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasLastException:Z

    return p1
.end method

.method static synthetic access$2502(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->lastException_:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    return-object p1
.end method

.method static synthetic access$2602(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasLastTimeout:Z

    return p1
.end method

.method static synthetic access$2702(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;I)I
    .locals 0

    iput p1, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->lastTimeout_:I

    return p1
.end method

.method static synthetic access$2802(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasCause:Z

    return p1
.end method

.method static synthetic access$2902(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->cause_:Ljava/lang/String;

    return-object p1
.end method

.method public static getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 1

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    return-object v0
.end method

.method private initFields()V
    .locals 1

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->none:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->lastException_:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    return-void
.end method

.method public static newBuilder()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->access$2200()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->mergeDelimitedFrom(Ljava/io/InputStream;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->access$2100(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->mergeDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->access$2100(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->mergeFrom(Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->access$2100(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->mergeFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->access$2100(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->access$2100(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->access$2100(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->mergeFrom(Ljava/io/InputStream;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->access$2100(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->mergeFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->access$2100(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom([B)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->mergeFrom([B)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->access$2100(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->mergeFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->access$2100(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getCause()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->cause_:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 1

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    return-object v0
.end method

.method public getLastException()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->lastException_:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    return-object v0
.end method

.method public getLastTimeout()I
    .locals 1

    iget v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->lastTimeout_:I

    return v0
.end method

.method public getSerializedSize()I
    .locals 3

    iget v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->memoizedSerializedSize:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasLastException()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getLastException()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    move-result-object v2

    invoke-virtual {v2}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->getNumber()I

    move-result v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasLastTimeout()Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x2

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getLastTimeout()I

    move-result v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_2
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasCause()Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v1, 0x3

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getCause()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_3
    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->memoizedSerializedSize:I

    goto :goto_0
.end method

.method public hasCause()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasCause:Z

    return v0
.end method

.method public hasLastException()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasLastException:Z

    return v0
.end method

.method public hasLastTimeout()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasLastTimeout:Z

    return v0
.end method

.method public final isInitialized()Z
    .locals 2

    const/4 v1, 0x0

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasLastException:Z

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasLastTimeout:Z

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->newBuilderForType()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    return-object v0
.end method

.method public newBuilderForType()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->toBuilder()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;
    .locals 1

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->newBuilder(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 2

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getSerializedSize()I

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasLastException()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getLastException()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->getNumber()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    :cond_0
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasLastTimeout()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getLastTimeout()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    :cond_1
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasCause()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getCause()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    :cond_2
    return-void
.end method
