.class public final Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$Builder;


# instance fields
.field private result:Lcom/hudee/pns/bean/MessageRouting$Message;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/hudee/pns/bean/MessageRouting$Message$Builder;)Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 1

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->buildParsed()Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->create()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    return-object v0
.end method

.method private buildParsed()Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->newUninitializedMessageException(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/UninitializedMessageException;->asInvalidProtocolBufferException()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 3

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    invoke-direct {v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;-><init>()V

    new-instance v1, Lcom/hudee/pns/bean/MessageRouting$Message;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/hudee/pns/bean/MessageRouting$Message;-><init>(Lcom/hudee/pns/bean/c;)V

    iput-object v1, v0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    return-object v0
.end method


# virtual methods
.method public addAllVia(Ljava/lang/Iterable;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$300(Lcom/hudee/pns/bean/MessageRouting$Message;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$302(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/util/List;)Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$300(Lcom/hudee/pns/bean/MessageRouting$Message;)Ljava/util/List;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    return-object p0
.end method

.method public addVia(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$300(Lcom/hudee/pns/bean/MessageRouting$Message;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$302(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/util/List;)Ljava/util/List;

    :cond_1
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$300(Lcom/hudee/pns/bean/MessageRouting$Message;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->build()Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->newUninitializedMessageException(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v0

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->buildPartial()Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "build() has already been called on this Builder."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$300(Lcom/hudee/pns/bean/MessageRouting$Message;)Ljava/util/List;

    move-result-object v0

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    iget-object v1, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$300(Lcom/hudee/pns/bean/MessageRouting$Message;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$302(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/util/List;)Ljava/util/List;

    :cond_1
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->clear()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot call clear() after build()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$Message;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;-><init>(Lcom/hudee/pns/bean/c;)V

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    return-object p0
.end method

.method public clearContent()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$1002(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->getContent()Lcom/google/protobuf/ByteString;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$1102(Lcom/hudee/pns/bean/MessageRouting$Message;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/ByteString;

    return-object p0
.end method

.method public clearDate()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 3

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$1202(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    const-wide/16 v1, 0x0

    invoke-static {v0, v1, v2}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$1302(Lcom/hudee/pns/bean/MessageRouting$Message;J)J

    return-object p0
.end method

.method public clearFrom()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$802(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->getFrom()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$902(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public clearReplyFor()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$1402(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->getReplyFor()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$1502(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public clearTo()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$602(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->getTo()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$702(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public clearUid()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$402(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->getUid()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$502(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public clearVia()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$302(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/util/List;)Ljava/util/List;

    return-object p0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->create()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$Message;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->clone()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getContent()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getContent()Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getDate()J
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getDate()J

    move-result-wide v0

    return-wide v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/GeneratedMessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method

.method public getFrom()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getFrom()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getReplyFor()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getReplyFor()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getTo()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUid()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getUid()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVia(I)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->getVia(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getViaCount()I
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getViaCount()I

    move-result v0

    return v0
.end method

.method public getViaList()Ljava/util/List;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$300(Lcom/hudee/pns/bean/MessageRouting$Message;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public hasContent()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasContent()Z

    move-result v0

    return v0
.end method

.method public hasDate()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasDate()Z

    move-result v0

    return v0
.end method

.method public hasFrom()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasFrom()Z

    move-result v0

    return v0
.end method

.method public hasReplyFor()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasReplyFor()Z

    move-result v0

    return v0
.end method

.method public hasTo()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasTo()Z

    move-result v0

    return v0
.end method

.method public hasUid()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasUid()Z

    move-result v0

    return v0
.end method

.method protected bridge synthetic internalGetResult()Lcom/google/protobuf/GeneratedMessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->internalGetResult()Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method

.method protected internalGetResult()Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    return-object v0
.end method

.method public isInitialized()Z
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->isInitialized()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;
    .locals 1

    check-cast p1, Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-virtual {p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$Message;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-virtual {p0, p1, p2, v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

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

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->setUid(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->setTo(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    goto :goto_0

    :sswitch_3
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->setFrom(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    goto :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBytes()Lcom/google/protobuf/ByteString;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->setContent(Lcom/google/protobuf/ByteString;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    goto :goto_0

    :sswitch_5
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt64()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->setDate(J)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    goto :goto_0

    :sswitch_6
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->setReplyFor(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    goto :goto_0

    :sswitch_7
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->addVia(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_1
        0x12 -> :sswitch_2
        0x1a -> :sswitch_3
        0x22 -> :sswitch_4
        0x28 -> :sswitch_5
        0x32 -> :sswitch_6
        0x3a -> :sswitch_7
    .end sparse-switch
.end method

.method public mergeFrom(Lcom/hudee/pns/bean/MessageRouting$Message;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    if-ne p1, v0, :cond_0

    move-object v0, p0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasUid()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->getUid()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->setUid(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    :cond_1
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasTo()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->getTo()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->setTo(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    :cond_2
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasFrom()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->getFrom()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->setFrom(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    :cond_3
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasContent()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->getContent()Lcom/google/protobuf/ByteString;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->setContent(Lcom/google/protobuf/ByteString;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    :cond_4
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasDate()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->getDate()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->setDate(J)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    :cond_5
    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasReplyFor()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->getReplyFor()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->setReplyFor(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    :cond_6
    invoke-static {p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$300(Lcom/hudee/pns/bean/MessageRouting$Message;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$300(Lcom/hudee/pns/bean/MessageRouting$Message;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$302(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/util/List;)Ljava/util/List;

    :cond_7
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$300(Lcom/hudee/pns/bean/MessageRouting$Message;)Ljava/util/List;

    move-result-object v0

    invoke-static {p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$300(Lcom/hudee/pns/bean/MessageRouting$Message;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_8
    move-object v0, p0

    goto :goto_0
.end method

.method public setContent(Lcom/google/protobuf/ByteString;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$1002(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$1102(Lcom/hudee/pns/bean/MessageRouting$Message;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/ByteString;

    return-object p0
.end method

.method public setDate(J)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$1202(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v0, p1, p2}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$1302(Lcom/hudee/pns/bean/MessageRouting$Message;J)J

    return-object p0
.end method

.method public setFrom(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$802(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$902(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public setReplyFor(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$1402(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$1502(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public setTo(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$602(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$702(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public setUid(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$402(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$502(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method

.method public setVia(ILjava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 1

    if-nez p2, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->result:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->access$300(Lcom/hudee/pns/bean/MessageRouting$Message;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method
