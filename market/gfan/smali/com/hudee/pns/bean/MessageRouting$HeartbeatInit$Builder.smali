.class public final Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$Builder;


# instance fields
.field private result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>()V

    return-void
.end method

.method static synthetic access$2100(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 1

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->buildParsed()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2200()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->create()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    return-object v0
.end method

.method private buildParsed()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->newUninitializedMessageException(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/UninitializedMessageException;->asInvalidProtocolBufferException()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;
    .locals 3

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    invoke-direct {v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;-><init>()V

    new-instance v1, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;-><init>(Lcom/hudee/pns/bean/c;)V

    iput-object v1, v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->build()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->newUninitializedMessageException(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v0

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "build() has already been called on this Builder."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->clear()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot call clear() after build()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;-><init>(Lcom/hudee/pns/bean/c;)V

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    return-object p0
.end method

.method public clearCause()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->access$2802(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getCause()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->access$2902(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public clearLastException()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->access$2402(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    sget-object v1, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->none:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->access$2502(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    return-object p0
.end method

.method public clearLastTimeout()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->access$2602(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->access$2702(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;I)I

    return-object p0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->create()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getCause()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getCause()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/GeneratedMessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method

.method public getLastException()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getLastException()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    move-result-object v0

    return-object v0
.end method

.method public getLastTimeout()I
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getLastTimeout()I

    move-result v0

    return v0
.end method

.method public hasCause()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasCause()Z

    move-result v0

    return v0
.end method

.method public hasLastException()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasLastException()Z

    move-result v0

    return v0
.end method

.method public hasLastTimeout()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasLastTimeout()Z

    move-result v0

    return v0
.end method

.method protected bridge synthetic internalGetResult()Lcom/google/protobuf/GeneratedMessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->internalGetResult()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    return-object v0
.end method

.method protected internalGetResult()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    return-object v0
.end method

.method public isInitialized()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->isInitialized()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;
    .locals 1

    check-cast p1, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-virtual {p0, p1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;
    .locals 1

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-virtual {p0, p1, p2, v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, p0

    :goto_1
    return-object v0

    :sswitch_0
    move-object v0, p0

    goto :goto_1

    :sswitch_1
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->valueOf(I)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->setLastException(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->setLastTimeout(I)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    goto :goto_0

    :sswitch_3
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->setCause(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x10 -> :sswitch_2
        0x1a -> :sswitch_3
    .end sparse-switch
.end method

.method public mergeFrom(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v0

    if-ne p1, v0, :cond_0

    move-object v0, p0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasLastException()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getLastException()Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->setLastException(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    :cond_1
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasLastTimeout()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getLastTimeout()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->setLastTimeout(I)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    :cond_2
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->hasCause()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->getCause()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->setCause(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;

    :cond_3
    move-object v0, p0

    goto :goto_0
.end method

.method public setCause(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->access$2802(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->access$2902(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public setLastException(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->access$2402(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->access$2502(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    return-object p0
.end method

.method public setLastTimeout(I)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->access$2602(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->access$2702(Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;I)I

    return-object p0
.end method
