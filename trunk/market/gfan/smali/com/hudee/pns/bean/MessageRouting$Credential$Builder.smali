.class public final Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$Builder;


# instance fields
.field private result:Lcom/hudee/pns/bean/MessageRouting$Credential;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>()V

    return-void
.end method

.method static synthetic access$6100(Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;)Lcom/hudee/pns/bean/MessageRouting$Credential;
    .locals 1

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->buildParsed()Lcom/hudee/pns/bean/MessageRouting$Credential;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$6200()Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->create()Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    move-result-object v0

    return-object v0
.end method

.method private buildParsed()Lcom/hudee/pns/bean/MessageRouting$Credential;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->newUninitializedMessageException(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/UninitializedMessageException;->asInvalidProtocolBufferException()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$Credential;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;
    .locals 3

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    invoke-direct {v0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;-><init>()V

    new-instance v1, Lcom/hudee/pns/bean/MessageRouting$Credential;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/hudee/pns/bean/MessageRouting$Credential;-><init>(Lcom/hudee/pns/bean/c;)V

    iput-object v1, v0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->build()Lcom/hudee/pns/bean/MessageRouting$Credential;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/hudee/pns/bean/MessageRouting$Credential;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->newUninitializedMessageException(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v0

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$Credential;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$Credential;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/hudee/pns/bean/MessageRouting$Credential;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "build() has already been called on this Builder."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->clear()Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot call clear() after build()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$Credential;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Credential;-><init>(Lcom/hudee/pns/bean/c;)V

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    return-object p0
.end method

.method public clearId()Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->access$6402(Lcom/hudee/pns/bean/MessageRouting$Credential;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Credential;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$Credential;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->access$6502(Lcom/hudee/pns/bean/MessageRouting$Credential;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public clearSecureKey()Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->access$6602(Lcom/hudee/pns/bean/MessageRouting$Credential;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Credential;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$Credential;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->getSecureKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->access$6702(Lcom/hudee/pns/bean/MessageRouting$Credential;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->create()Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$Credential;)Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/GeneratedMessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$Credential;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$Credential;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$Credential;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Credential;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$Credential;

    move-result-object v0

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Credential;->getId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSecureKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Credential;->getSecureKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasId()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Credential;->hasId()Z

    move-result v0

    return v0
.end method

.method public hasSecureKey()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Credential;->hasSecureKey()Z

    move-result v0

    return v0
.end method

.method protected bridge synthetic internalGetResult()Lcom/google/protobuf/GeneratedMessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->internalGetResult()Lcom/hudee/pns/bean/MessageRouting$Credential;

    move-result-object v0

    return-object v0
.end method

.method protected internalGetResult()Lcom/hudee/pns/bean/MessageRouting$Credential;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    return-object v0
.end method

.method public isInitialized()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Credential;->isInitialized()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;
    .locals 1

    check-cast p1, Lcom/hudee/pns/bean/MessageRouting$Credential;

    invoke-virtual {p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$Credential;)Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;
    .locals 1

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-virtual {p0, p1, p2, v0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

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

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->setId(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->setSecureKey(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_1
        0x12 -> :sswitch_2
    .end sparse-switch
.end method

.method public mergeFrom(Lcom/hudee/pns/bean/MessageRouting$Credential;)Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Credential;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$Credential;

    move-result-object v0

    if-ne p1, v0, :cond_0

    move-object v0, p0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->hasId()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->setId(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    :cond_1
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->hasSecureKey()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->getSecureKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->setSecureKey(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    :cond_2
    move-object v0, p0

    goto :goto_0
.end method

.method public setId(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->access$6402(Lcom/hudee/pns/bean/MessageRouting$Credential;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->access$6502(Lcom/hudee/pns/bean/MessageRouting$Credential;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public setSecureKey(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->access$6602(Lcom/hudee/pns/bean/MessageRouting$Credential;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Credential;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->access$6702(Lcom/hudee/pns/bean/MessageRouting$Credential;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method
