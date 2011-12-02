.class public final Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$Builder;


# instance fields
.field private result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>()V

    return-void
.end method

.method static synthetic access$3000(Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 1

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->buildParsed()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3100()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->create()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method private buildParsed()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->newUninitializedMessageException(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/UninitializedMessageException;->asInvalidProtocolBufferException()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;
    .locals 3

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    invoke-direct {v0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;-><init>()V

    new-instance v1, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;-><init>(Lcom/hudee/pns/bean/c;)V

    iput-object v1, v0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->build()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->newUninitializedMessageException(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v0

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "build() has already been called on this Builder."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->clear()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot call clear() after build()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;-><init>(Lcom/hudee/pns/bean/c;)V

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    return-object p0
.end method

.method public clearLastDelay()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->access$3302(Lcom/hudee/pns/bean/MessageRouting$Heartbeat;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->access$3402(Lcom/hudee/pns/bean/MessageRouting$Heartbeat;I)I

    return-object p0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->create()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$Heartbeat;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/GeneratedMessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method

.method public getLastDelay()I
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->getLastDelay()I

    move-result v0

    return v0
.end method

.method public hasLastDelay()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->hasLastDelay()Z

    move-result v0

    return v0
.end method

.method protected bridge synthetic internalGetResult()Lcom/google/protobuf/GeneratedMessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->internalGetResult()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    return-object v0
.end method

.method protected internalGetResult()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    return-object v0
.end method

.method public isInitialized()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->isInitialized()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;
    .locals 1

    check-cast p1, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    invoke-virtual {p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$Heartbeat;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;
    .locals 1

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-virtual {p0, p1, p2, v0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, p0

    :goto_1
    return-object v0

    :sswitch_0
    move-object v0, p0

    goto :goto_1

    :sswitch_1
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->setLastDelay(I)Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
    .end sparse-switch
.end method

.method public mergeFrom(Lcom/hudee/pns/bean/MessageRouting$Heartbeat;)Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v0

    if-ne p1, v0, :cond_0

    move-object v0, p0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->hasLastDelay()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->getLastDelay()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->setLastDelay(I)Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;

    :cond_1
    move-object v0, p0

    goto :goto_0
.end method

.method public setLastDelay(I)Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->access$3302(Lcom/hudee/pns/bean/MessageRouting$Heartbeat;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Heartbeat$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->access$3402(Lcom/hudee/pns/bean/MessageRouting$Heartbeat;I)I

    return-object p0
.end method
