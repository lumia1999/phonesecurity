.class public final Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;
.super Lcom/google/protobuf/GeneratedMessageLite;


# static fields
.field public static final UID_FIELD_NUMBER:I = 0x1

.field private static final defaultInstance:Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;


# instance fields
.field private hasUid:Z

.field private memoizedSerializedSize:I

.field private uid_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;-><init>(Z)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting;->internalForceInit()V

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    invoke-direct {v0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->initFields()V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->uid_:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->memoizedSerializedSize:I

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->initFields()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/hudee/pns/bean/c;)V
    .locals 0

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;-><init>()V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->uid_:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->memoizedSerializedSize:I

    return-void
.end method

.method static synthetic access$1902(Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->hasUid:Z

    return p1
.end method

.method static synthetic access$2002(Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->uid_:Ljava/lang/String;

    return-object p1
.end method

.method public static getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;
    .locals 1

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    return-object v0
.end method

.method private initFields()V
    .locals 0

    return-void
.end method

.method public static newBuilder()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->access$1700()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->mergeDelimitedFrom(Ljava/io/InputStream;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->access$1600(Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->mergeDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->access$1600(Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->mergeFrom(Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->access$1600(Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->mergeFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->access$1600(Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->access$1600(Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->access$1600(Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->mergeFrom(Ljava/io/InputStream;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->access$1600(Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->mergeFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->access$1600(Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom([B)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->mergeFrom([B)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->access$1600(Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->mergeFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;->access$1600(Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;
    .locals 1

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 3

    iget v0, p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->memoizedSerializedSize:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->hasUid()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->getUid()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->memoizedSerializedSize:I

    goto :goto_0
.end method

.method public getUid()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->uid_:Ljava/lang/String;

    return-object v0
.end method

.method public hasUid()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->hasUid:Z

    return v0
.end method

.method public final isInitialized()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->hasUid:Z

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

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->newBuilderForType()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    return-object v0
.end method

.method public newBuilderForType()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->toBuilder()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;
    .locals 1

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->newBuilder(Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement$Builder;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 2

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->getSerializedSize()I

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->hasUid()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->getUid()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    :cond_0
    return-void
.end method
