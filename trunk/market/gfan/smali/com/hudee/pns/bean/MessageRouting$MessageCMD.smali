.class public final enum Lcom/hudee/pns/bean/MessageRouting$MessageCMD;
.super Ljava/lang/Enum;

# interfaces
.implements Lcom/google/protobuf/Internal$EnumLite;


# static fields
.field private static final synthetic $VALUES:[Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

.field public static final enum ACKNOWLEDGEMENT:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

.field public static final enum AUTH:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

.field public static final enum CREDENTIAL:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

.field public static final enum DEVICE_REGISTER:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

.field public static final enum HEARTBEAT:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

.field public static final enum HEARTBEAT_INIT:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

.field public static final enum HEARTBEAT_RESPONSE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

.field public static final enum MESSAGE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

.field public static final enum RESPONSE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

.field public static final enum SERVICE_BIND:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

.field public static final enum SERVICE_BIND_UPDATE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

.field public static final enum SERVICE_UNBIND:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

.field private static internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;


# instance fields
.field private final index:I

.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    const-string v1, "HEARTBEAT_INIT"

    invoke-direct {v0, v1, v5, v5, v5}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->HEARTBEAT_INIT:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    const-string v1, "HEARTBEAT"

    invoke-direct {v0, v1, v6, v6, v6}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->HEARTBEAT:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    const-string v1, "HEARTBEAT_RESPONSE"

    invoke-direct {v0, v1, v7, v7, v7}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->HEARTBEAT_RESPONSE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    const-string v1, "MESSAGE"

    const/16 v2, 0x81

    invoke-direct {v0, v1, v8, v8, v2}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->MESSAGE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    const-string v1, "ACKNOWLEDGEMENT"

    const/16 v2, 0x82

    invoke-direct {v0, v1, v9, v9, v2}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->ACKNOWLEDGEMENT:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    const-string v1, "DEVICE_REGISTER"

    const/4 v2, 0x5

    const/4 v3, 0x5

    const/16 v4, 0x83

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->DEVICE_REGISTER:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    const-string v1, "AUTH"

    const/4 v2, 0x6

    const/4 v3, 0x6

    const/16 v4, 0x84

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->AUTH:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    const-string v1, "SERVICE_BIND"

    const/4 v2, 0x7

    const/4 v3, 0x7

    const/16 v4, 0x85

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->SERVICE_BIND:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    const-string v1, "SERVICE_UNBIND"

    const/16 v2, 0x8

    const/16 v3, 0x8

    const/16 v4, 0x86

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->SERVICE_UNBIND:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    const-string v1, "RESPONSE"

    const/16 v2, 0x9

    const/16 v3, 0x9

    const/16 v4, 0x87

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->RESPONSE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    const-string v1, "CREDENTIAL"

    const/16 v2, 0xa

    const/16 v3, 0xa

    const/16 v4, 0x88

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->CREDENTIAL:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    const-string v1, "SERVICE_BIND_UPDATE"

    const/16 v2, 0xb

    const/16 v3, 0xb

    const/16 v4, 0x89

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->SERVICE_BIND_UPDATE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    const/16 v0, 0xc

    new-array v0, v0, [Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    sget-object v1, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->HEARTBEAT_INIT:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    aput-object v1, v0, v5

    sget-object v1, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->HEARTBEAT:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    aput-object v1, v0, v6

    sget-object v1, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->HEARTBEAT_RESPONSE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    aput-object v1, v0, v7

    sget-object v1, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->MESSAGE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    aput-object v1, v0, v8

    sget-object v1, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->ACKNOWLEDGEMENT:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    aput-object v1, v0, v9

    const/4 v1, 0x5

    sget-object v2, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->DEVICE_REGISTER:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->AUTH:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->SERVICE_BIND:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->SERVICE_UNBIND:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->RESPONSE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->CREDENTIAL:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->SERVICE_BIND_UPDATE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    aput-object v2, v0, v1

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->$VALUES:[Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    new-instance v0, Lcom/hudee/pns/bean/e;

    invoke-direct {v0}, Lcom/hudee/pns/bean/e;-><init>()V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->index:I

    iput p4, p0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->value:I

    return-void
.end method

.method public static internalGetValueMap()Lcom/google/protobuf/Internal$EnumLiteMap;
    .locals 1

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    return-object v0
.end method

.method public static valueOf(I)Lcom/hudee/pns/bean/MessageRouting$MessageCMD;
    .locals 1

    sparse-switch p0, :sswitch_data_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :sswitch_0
    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->HEARTBEAT_INIT:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    goto :goto_0

    :sswitch_1
    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->HEARTBEAT:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    goto :goto_0

    :sswitch_2
    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->HEARTBEAT_RESPONSE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    goto :goto_0

    :sswitch_3
    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->MESSAGE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    goto :goto_0

    :sswitch_4
    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->ACKNOWLEDGEMENT:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    goto :goto_0

    :sswitch_5
    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->DEVICE_REGISTER:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    goto :goto_0

    :sswitch_6
    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->AUTH:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    goto :goto_0

    :sswitch_7
    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->SERVICE_BIND:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    goto :goto_0

    :sswitch_8
    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->SERVICE_UNBIND:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    goto :goto_0

    :sswitch_9
    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->RESPONSE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    goto :goto_0

    :sswitch_a
    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->CREDENTIAL:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    goto :goto_0

    :sswitch_b
    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->SERVICE_BIND_UPDATE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x81 -> :sswitch_3
        0x82 -> :sswitch_4
        0x83 -> :sswitch_5
        0x84 -> :sswitch_6
        0x85 -> :sswitch_7
        0x86 -> :sswitch_8
        0x87 -> :sswitch_9
        0x88 -> :sswitch_a
        0x89 -> :sswitch_b
    .end sparse-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$MessageCMD;
    .locals 1

    const-class v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    return-object p0
.end method

.method public static values()[Lcom/hudee/pns/bean/MessageRouting$MessageCMD;
    .locals 1

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->$VALUES:[Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-virtual {v0}, [Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .locals 1

    iget v0, p0, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->value:I

    return v0
.end method
