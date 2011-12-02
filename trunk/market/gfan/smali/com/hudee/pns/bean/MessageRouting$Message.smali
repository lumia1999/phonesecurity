.class public final Lcom/hudee/pns/bean/MessageRouting$Message;
.super Lcom/google/protobuf/GeneratedMessageLite;


# static fields
.field public static final CONTENT_FIELD_NUMBER:I = 0x4

.field public static final DATE_FIELD_NUMBER:I = 0x5

.field public static final FROM_FIELD_NUMBER:I = 0x3

.field public static final REPLY_FOR_FIELD_NUMBER:I = 0x6

.field public static final TO_FIELD_NUMBER:I = 0x2

.field public static final UID_FIELD_NUMBER:I = 0x1

.field public static final VIA_FIELD_NUMBER:I = 0x7

.field private static final defaultInstance:Lcom/hudee/pns/bean/MessageRouting$Message;


# instance fields
.field private content_:Lcom/google/protobuf/ByteString;

.field private date_:J

.field private from_:Ljava/lang/String;

.field private hasContent:Z

.field private hasDate:Z

.field private hasFrom:Z

.field private hasReplyFor:Z

.field private hasTo:Z

.field private hasUid:Z

.field private memoizedSerializedSize:I

.field private replyFor_:Ljava/lang/String;

.field private to_:Ljava/lang/String;

.field private uid_:Ljava/lang/String;

.field private via_:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$Message;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message;-><init>(Z)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$Message;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting;->internalForceInit()V

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$Message;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$Message;

    invoke-direct {v0}, Lcom/hudee/pns/bean/MessageRouting$Message;->initFields()V

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->uid_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->to_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->from_:Ljava/lang/String;

    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->content_:Lcom/google/protobuf/ByteString;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->date_:J

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->replyFor_:Ljava/lang/String;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->via_:Ljava/util/List;

    const/4 v0, -0x1

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->memoizedSerializedSize:I

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->initFields()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/hudee/pns/bean/c;)V
    .locals 0

    invoke-direct {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;-><init>()V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 2

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->uid_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->to_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->from_:Ljava/lang/String;

    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->content_:Lcom/google/protobuf/ByteString;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->date_:J

    const-string v0, ""

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->replyFor_:Ljava/lang/String;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->via_:Ljava/util/List;

    const/4 v0, -0x1

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->memoizedSerializedSize:I

    return-void
.end method

.method static synthetic access$1002(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->hasContent:Z

    return p1
.end method

.method static synthetic access$1102(Lcom/hudee/pns/bean/MessageRouting$Message;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/ByteString;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->content_:Lcom/google/protobuf/ByteString;

    return-object p1
.end method

.method static synthetic access$1202(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->hasDate:Z

    return p1
.end method

.method static synthetic access$1302(Lcom/hudee/pns/bean/MessageRouting$Message;J)J
    .locals 0

    iput-wide p1, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->date_:J

    return-wide p1
.end method

.method static synthetic access$1402(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->hasReplyFor:Z

    return p1
.end method

.method static synthetic access$1502(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->replyFor_:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$300(Lcom/hudee/pns/bean/MessageRouting$Message;)Ljava/util/List;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->via_:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$302(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/util/List;)Ljava/util/List;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->via_:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$402(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->hasUid:Z

    return p1
.end method

.method static synthetic access$502(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->uid_:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$602(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->hasTo:Z

    return p1
.end method

.method static synthetic access$702(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->to_:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$802(Lcom/hudee/pns/bean/MessageRouting$Message;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->hasFrom:Z

    return p1
.end method

.method static synthetic access$902(Lcom/hudee/pns/bean/MessageRouting$Message;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->from_:Ljava/lang/String;

    return-object p1
.end method

.method public static getDefaultInstance()Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 1

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$Message;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$Message;

    return-object v0
.end method

.method private initFields()V
    .locals 0

    return-void
.end method

.method public static newBuilder()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->access$100()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/hudee/pns/bean/MessageRouting$Message;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->mergeFrom(Lcom/hudee/pns/bean/MessageRouting$Message;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->mergeDelimitedFrom(Ljava/io/InputStream;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->access$000(Lcom/hudee/pns/bean/MessageRouting$Message$Builder;)Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 2

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->mergeDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->access$000(Lcom/hudee/pns/bean/MessageRouting$Message$Builder;)Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->mergeFrom(Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->access$000(Lcom/hudee/pns/bean/MessageRouting$Message$Builder;)Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->mergeFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->access$000(Lcom/hudee/pns/bean/MessageRouting$Message$Builder;)Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->access$000(Lcom/hudee/pns/bean/MessageRouting$Message$Builder;)Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    invoke-static {v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->access$000(Lcom/hudee/pns/bean/MessageRouting$Message$Builder;)Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->mergeFrom(Ljava/io/InputStream;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->access$000(Lcom/hudee/pns/bean/MessageRouting$Message$Builder;)Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->mergeFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->access$000(Lcom/hudee/pns/bean/MessageRouting$Message$Builder;)Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom([B)Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->mergeFrom([B)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->access$000(Lcom/hudee/pns/bean/MessageRouting$Message$Builder;)Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->mergeFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->access$000(Lcom/hudee/pns/bean/MessageRouting$Message$Builder;)Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getContent()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->content_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getDate()J
    .locals 2

    iget-wide v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->date_:J

    return-wide v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/hudee/pns/bean/MessageRouting$Message;
    .locals 1

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$Message;->defaultInstance:Lcom/hudee/pns/bean/MessageRouting$Message;

    return-object v0
.end method

.method public getFrom()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->from_:Ljava/lang/String;

    return-object v0
.end method

.method public getReplyFor()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->replyFor_:Ljava/lang/String;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 5

    const/4 v4, 0x0

    iget v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->memoizedSerializedSize:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasUid()Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getUid()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v0, v4

    :goto_1
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasTo()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getTo()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasFrom()Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x3

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getFrom()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_2
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasContent()Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v1, 0x4

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getContent()Lcom/google/protobuf/ByteString;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_3
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasDate()Z

    move-result v1

    if-eqz v1, :cond_4

    const/4 v1, 0x5

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getDate()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeInt64Size(IJ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_4
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasReplyFor()Z

    move-result v1

    if-eqz v1, :cond_6

    const/4 v1, 0x6

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getReplyFor()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    move v1, v0

    :goto_2
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getViaList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v3, v4

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/google/protobuf/CodedOutputStream;->computeStringSizeNoTag(Ljava/lang/String;)I

    move-result v0

    add-int/2addr v0, v3

    move v3, v0

    goto :goto_3

    :cond_5
    add-int v0, v1, v3

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getViaList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->memoizedSerializedSize:I

    goto/16 :goto_0

    :cond_6
    move v1, v0

    goto :goto_2

    :cond_7
    move v0, v4

    goto/16 :goto_1
.end method

.method public getTo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->to_:Ljava/lang/String;

    return-object v0
.end method

.method public getUid()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->uid_:Ljava/lang/String;

    return-object v0
.end method

.method public getVia(I)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->via_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public getViaCount()I
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->via_:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getViaList()Ljava/util/List;
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->via_:Ljava/util/List;

    return-object v0
.end method

.method public hasContent()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->hasContent:Z

    return v0
.end method

.method public hasDate()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->hasDate:Z

    return v0
.end method

.method public hasFrom()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->hasFrom:Z

    return v0
.end method

.method public hasReplyFor()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->hasReplyFor:Z

    return v0
.end method

.method public hasTo()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->hasTo:Z

    return v0
.end method

.method public hasUid()Z
    .locals 1

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->hasUid:Z

    return v0
.end method

.method public final isInitialized()Z
    .locals 2

    const/4 v1, 0x0

    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->hasUid:Z

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->hasTo:Z

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->hasFrom:Z

    if-nez v0, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->hasContent:Z

    if-nez v0, :cond_3

    move v0, v1

    goto :goto_0

    :cond_3
    iget-boolean v0, p0, Lcom/hudee/pns/bean/MessageRouting$Message;->hasDate:Z

    if-nez v0, :cond_4

    move v0, v1

    goto :goto_0

    :cond_4
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->newBuilderForType()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    return-object v0
.end method

.method public newBuilderForType()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->toBuilder()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;
    .locals 1

    invoke-static {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->newBuilder(Lcom/hudee/pns/bean/MessageRouting$Message;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 3

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getSerializedSize()I

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasUid()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getUid()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    :cond_0
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasTo()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getTo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    :cond_1
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasFrom()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getFrom()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    :cond_2
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasContent()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x4

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getContent()Lcom/google/protobuf/ByteString;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    :cond_3
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasDate()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x5

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getDate()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->writeInt64(IJ)V

    :cond_4
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->hasReplyFor()Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x6

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getReplyFor()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    :cond_5
    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Message;->getViaList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    const/4 v1, 0x7

    invoke-virtual {p1, v1, p0}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    goto :goto_0

    :cond_6
    return-void
.end method
