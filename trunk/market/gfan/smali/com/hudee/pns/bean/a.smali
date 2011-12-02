.class public Lcom/hudee/pns/bean/a;
.super Ljava/lang/Object;


# instance fields
.field public a:I

.field public b:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

.field public c:I

.field public d:Lcom/google/protobuf/MessageLite;


# direct methods
.method public constructor <init>(IIILcom/google/protobuf/MessageLite;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/hudee/pns/bean/a;->a:I

    invoke-static {p2}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->valueOf(I)Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    move-result-object v0

    iput-object v0, p0, Lcom/hudee/pns/bean/a;->b:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    iput p3, p0, Lcom/hudee/pns/bean/a;->c:I

    iput-object p4, p0, Lcom/hudee/pns/bean/a;->d:Lcom/google/protobuf/MessageLite;

    return-void
.end method

.method public constructor <init>(ILcom/hudee/pns/bean/MessageRouting$MessageCMD;Lcom/google/protobuf/MessageLite;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lcom/hudee/pns/bean/a;->d:Lcom/google/protobuf/MessageLite;

    iput p1, p0, Lcom/hudee/pns/bean/a;->a:I

    iput-object p2, p0, Lcom/hudee/pns/bean/a;->b:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-interface {p3}, Lcom/google/protobuf/MessageLite;->getSerializedSize()I

    move-result v0

    iput v0, p0, Lcom/hudee/pns/bean/a;->c:I

    return-void
.end method

.method public static a([B)Lcom/hudee/pns/bean/a;
    .locals 7

    const/4 v6, 0x0

    const/4 v4, 0x4

    const/4 v5, 0x0

    new-array v0, v4, [B

    invoke-static {p0, v5, v0, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {v0}, Lcom/hudee/pns/bean/a;->b([B)I

    move-result v1

    invoke-static {p0, v4, v0, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {v0}, Lcom/hudee/pns/bean/a;->b([B)I

    move-result v2

    const/16 v3, 0x8

    invoke-static {p0, v3, v0, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {v0}, Lcom/hudee/pns/bean/a;->b([B)I

    move-result v0

    new-array v3, v0, [B

    const/16 v4, 0xc

    invoke-static {p0, v4, v3, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :try_start_0
    sget-object v4, Lcom/hudee/pns/bean/b;->a:[I

    invoke-static {v2}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->valueOf(I)Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    move-result-object v5

    invoke-virtual {v5}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->ordinal()I

    move-result v5

    aget v4, v4, v5
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0

    packed-switch v4, :pswitch_data_0

    move-object v3, v6

    :goto_0
    new-instance v4, Lcom/hudee/pns/bean/a;

    invoke-direct {v4, v1, v2, v0, v3}, Lcom/hudee/pns/bean/a;-><init>(IIILcom/google/protobuf/MessageLite;)V

    return-object v4

    :pswitch_0
    :try_start_1
    invoke-static {v3}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;->parseFrom([B)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit;

    move-result-object v3

    goto :goto_0

    :pswitch_1
    invoke-static {v3}, Lcom/hudee/pns/bean/MessageRouting$Heartbeat;->parseFrom([B)Lcom/hudee/pns/bean/MessageRouting$Heartbeat;

    move-result-object v3

    goto :goto_0

    :pswitch_2
    invoke-static {v3}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatResponse;->parseFrom([B)Lcom/hudee/pns/bean/MessageRouting$HeartbeatResponse;

    move-result-object v3

    goto :goto_0

    :pswitch_3
    invoke-static {v3}, Lcom/hudee/pns/bean/MessageRouting$Message;->parseFrom([B)Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v3

    goto :goto_0

    :pswitch_4
    invoke-static {v3}, Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;->parseFrom([B)Lcom/hudee/pns/bean/MessageRouting$Acknowledgement;

    move-result-object v3

    goto :goto_0

    :pswitch_5
    invoke-static {v3}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->parseFrom([B)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v3

    goto :goto_0

    :pswitch_6
    invoke-static {v3}, Lcom/hudee/pns/bean/MessageRouting$Credential;->parseFrom([B)Lcom/hudee/pns/bean/MessageRouting$Credential;

    move-result-object v3

    goto :goto_0

    :pswitch_7
    invoke-static {v3}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->parseFrom([B)Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v3

    goto :goto_0

    :pswitch_8
    invoke-static {v3}, Lcom/hudee/pns/bean/MessageRouting$Response;->parseFrom([B)Lcom/hudee/pns/bean/MessageRouting$Response;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    goto :goto_0

    :catch_0
    move-exception v3

    invoke-virtual {v3}, Lcom/google/protobuf/InvalidProtocolBufferException;->printStackTrace()V

    move-object v3, v6

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_6
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method private a(I)[B
    .locals 3

    const/4 v0, 0x4

    new-array v0, v0, [B

    const/4 v1, 0x0

    shr-int/lit8 v2, p1, 0x18

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x1

    shr-int/lit8 v2, p1, 0x10

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x2

    shr-int/lit8 v2, p1, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x3

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    return-object v0
.end method

.method public static b([B)I
    .locals 2

    const/4 v1, 0x0

    aget-byte v0, p0, v1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x18

    add-int/2addr v0, v1

    const/4 v1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    add-int/2addr v0, v1

    const/4 v1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    add-int/2addr v0, v1

    const/4 v1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x0

    add-int/2addr v0, v1

    return v0
.end method


# virtual methods
.method public a()[B
    .locals 5

    const/4 v3, 0x4

    const/4 v4, 0x0

    iget v0, p0, Lcom/hudee/pns/bean/a;->c:I

    add-int/lit8 v0, v0, 0xc

    new-array v0, v0, [B

    iget v1, p0, Lcom/hudee/pns/bean/a;->a:I

    invoke-direct {p0, v1}, Lcom/hudee/pns/bean/a;->a(I)[B

    move-result-object v1

    invoke-static {v1, v4, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v1, p0, Lcom/hudee/pns/bean/a;->b:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->getNumber()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/hudee/pns/bean/a;->a(I)[B

    move-result-object v1

    invoke-static {v1, v4, v0, v3, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v1, p0, Lcom/hudee/pns/bean/a;->c:I

    invoke-direct {p0, v1}, Lcom/hudee/pns/bean/a;->a(I)[B

    move-result-object v1

    const/16 v2, 0x8

    invoke-static {v1, v4, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v1, p0, Lcom/hudee/pns/bean/a;->d:Lcom/google/protobuf/MessageLite;

    invoke-interface {v1}, Lcom/google/protobuf/MessageLite;->toByteArray()[B

    move-result-object v1

    const/16 v2, 0xc

    iget v3, p0, Lcom/hudee/pns/bean/a;->c:I

    invoke-static {v1, v4, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MessageBean [label="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/hudee/pns/bean/a;->a:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/hudee/pns/bean/a;->b:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/hudee/pns/bean/a;->b:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->getNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "], msgLength="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/hudee/pns/bean/a;->c:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", messageBody="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/hudee/pns/bean/a;->d:Lcom/google/protobuf/MessageLite;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
