.class public final Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$Builder;


# instance fields
.field private result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>()V

    return-void
.end method

.method static synthetic access$6800(Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 1

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->buildParsed()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$6900()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->create()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    return-object v0
.end method

.method private buildParsed()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->newUninitializedMessageException(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/UninitializedMessageException;->asInvalidProtocolBufferException()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;
    .locals 3

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    invoke-direct {v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;-><init>()V

    new-instance v1, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;-><init>(Lcom/hudee/pns/bean/c;)V

    iput-object v1, v0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->build()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->newUninitializedMessageException(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v0

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "build() has already been called on this Builder."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->clear()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot call clear() after build()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;-><init>(Lcom/hudee/pns/bean/c;)V

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    return-object p0
.end method

.method public clearApplicationId()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->access$7102(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getApplicationId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->access$7202(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public clearClientId()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->access$7302(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getClientId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->access$7402(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->create()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getApplicationId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getApplicationId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getClientId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getClientId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/GeneratedMessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method

.method public hasApplicationId()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->hasApplicationId()Z

    move-result v0

    return v0
.end method

.method public hasClientId()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->hasClientId()Z

    move-result v0

    return v0
.end method

.method protected bridge synthetic internalGetResult()Lcom/google/protobuf/GeneratedMessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->internalGetResult()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    return-object v0
.end method

.method protected internalGetResult()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    return-object v0
.end method

.method public isInitialized()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->isInitialized()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;
    .locals 1

    check-cast p1, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    invoke-virtual {p0, p1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;
    .locals 1

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-virtual {p0, p1, p2, v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

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

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->setApplicationId(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->setClientId(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_1
        0x12 -> :sswitch_2
    .end sparse-switch
.end method

.method public mergeFrom(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    if-ne p1, v0, :cond_0

    move-object v0, p0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->hasApplicationId()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getApplicationId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->setApplicationId(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    :cond_1
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->hasClientId()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getClientId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->setClientId(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    :cond_2
    move-object v0, p0

    goto :goto_0
.end method

.method public setApplicationId(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->access$7102(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->access$7202(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public setClientId(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->access$7302(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->access$7402(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method
