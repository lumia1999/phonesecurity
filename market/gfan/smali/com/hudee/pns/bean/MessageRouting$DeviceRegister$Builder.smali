.class public final Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$Builder;


# instance fields
.field private result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>()V

    return-void
.end method

.method static synthetic access$4000(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 1

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->buildParsed()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$4100()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->create()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    return-object v0
.end method

.method private buildParsed()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->newUninitializedMessageException(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/UninitializedMessageException;->asInvalidProtocolBufferException()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 3

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    invoke-direct {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;-><init>()V

    new-instance v1, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;-><init>(Lcom/hudee/pns/bean/c;)V

    iput-object v1, v0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->build()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->newUninitializedMessageException(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v0

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "build() has already been called on this Builder."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->clear()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot call clear() after build()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;-><init>(Lcom/hudee/pns/bean/c;)V

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    return-object p0
.end method

.method public clearCharset()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5702(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getCharset()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5802(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public clearClientVersion()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5502(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getClientVersion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5602(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public clearEtc()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5902(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getEtc()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$6002(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public clearImei()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$4302(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getImei()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$4402(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public clearOsName()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5102(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getOsName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5202(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public clearOsVersion()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5302(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getOsVersion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5402(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public clearScreenColorDepth()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$4902(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5002(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;I)I

    return-object p0
.end method

.method public clearScreenHeight()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$4702(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getScreenHeight()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$4802(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public clearScreenWidth()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$4502(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getScreenWidth()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$4602(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->create()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getCharset()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getCharset()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getClientVersion()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getClientVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/GeneratedMessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method

.method public getEtc()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getEtc()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getImei()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getImei()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOsName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getOsName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOsVersion()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getOsVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getScreenColorDepth()I
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getScreenColorDepth()I

    move-result v0

    return v0
.end method

.method public getScreenHeight()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getScreenHeight()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getScreenWidth()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getScreenWidth()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasCharset()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasCharset()Z

    move-result v0

    return v0
.end method

.method public hasClientVersion()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasClientVersion()Z

    move-result v0

    return v0
.end method

.method public hasEtc()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasEtc()Z

    move-result v0

    return v0
.end method

.method public hasImei()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasImei()Z

    move-result v0

    return v0
.end method

.method public hasOsName()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasOsName()Z

    move-result v0

    return v0
.end method

.method public hasOsVersion()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasOsVersion()Z

    move-result v0

    return v0
.end method

.method public hasScreenColorDepth()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenColorDepth()Z

    move-result v0

    return v0
.end method

.method public hasScreenHeight()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenHeight()Z

    move-result v0

    return v0
.end method

.method public hasScreenWidth()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenWidth()Z

    move-result v0

    return v0
.end method

.method protected bridge synthetic internalGetResult()Lcom/google/protobuf/GeneratedMessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->internalGetResult()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method

.method protected internalGetResult()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    return-object v0
.end method

.method public isInitialized()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->isInitialized()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;
    .locals 1

    check-cast p1, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-virtual {p0, p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 1

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-virtual {p0, p1, p2, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, p0

    :goto_1
    return-object v0

    :sswitch_0
    move-object v0, p0

    goto :goto_1

    :sswitch_1
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setImei(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setScreenWidth(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    goto :goto_0

    :sswitch_3
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setScreenHeight(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    goto :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setScreenColorDepth(I)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    goto :goto_0

    :sswitch_5
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setOsName(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    goto :goto_0

    :sswitch_6
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setOsVersion(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    goto :goto_0

    :sswitch_7
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setClientVersion(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    goto :goto_0

    :sswitch_8
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setCharset(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    goto :goto_0

    :sswitch_9
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setEtc(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_1
        0x12 -> :sswitch_2
        0x1a -> :sswitch_3
        0x20 -> :sswitch_4
        0x2a -> :sswitch_5
        0x32 -> :sswitch_6
        0x3a -> :sswitch_7
        0x42 -> :sswitch_8
        0x4a -> :sswitch_9
    .end sparse-switch
.end method

.method public mergeFrom(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    if-ne p1, v0, :cond_0

    move-object v0, p0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasImei()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getImei()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setImei(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    :cond_1
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenWidth()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getScreenWidth()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setScreenWidth(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    :cond_2
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenHeight()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getScreenHeight()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setScreenHeight(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    :cond_3
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasScreenColorDepth()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getScreenColorDepth()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setScreenColorDepth(I)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    :cond_4
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasOsName()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getOsName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setOsName(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    :cond_5
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasOsVersion()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getOsVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setOsVersion(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    :cond_6
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasClientVersion()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getClientVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setClientVersion(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    :cond_7
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasCharset()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getCharset()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setCharset(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    :cond_8
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->hasEtc()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->getEtc()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setEtc(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    :cond_9
    move-object v0, p0

    goto :goto_0
.end method

.method public setCharset(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5702(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5802(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public setClientVersion(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5502(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5602(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public setEtc(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5902(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$6002(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public setImei(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$4302(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$4402(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public setOsName(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5102(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5202(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public setOsVersion(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5302(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5402(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public setScreenColorDepth(I)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$4902(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$5002(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;I)I

    return-object p0
.end method

.method public setScreenHeight(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$4702(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$4802(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public setScreenWidth(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$4502(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->access$4602(Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method
