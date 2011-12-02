.class public final enum Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;
.super Ljava/lang/Enum;

# interfaces
.implements Lcom/google/protobuf/Internal$EnumLite;


# static fields
.field private static final synthetic $VALUES:[Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

.field public static final enum call:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

.field public static final enum choke:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

.field public static final enum exception:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

.field private static internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

.field public static final enum none:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

.field public static final enum pause:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;


# instance fields
.field private final index:I

.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    const-string v1, "none"

    invoke-direct {v0, v1, v2, v2, v2}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->none:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    const-string v1, "call"

    invoke-direct {v0, v1, v3, v3, v3}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->call:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    const-string v1, "pause"

    invoke-direct {v0, v1, v4, v4, v4}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->pause:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    const-string v1, "choke"

    invoke-direct {v0, v1, v5, v5, v5}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->choke:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    new-instance v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    const-string v1, "exception"

    invoke-direct {v0, v1, v6, v6, v6}, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->exception:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    sget-object v1, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->none:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    aput-object v1, v0, v2

    sget-object v1, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->call:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    aput-object v1, v0, v3

    sget-object v1, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->pause:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    aput-object v1, v0, v4

    sget-object v1, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->choke:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    aput-object v1, v0, v5

    sget-object v1, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->exception:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    aput-object v1, v0, v6

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->$VALUES:[Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    new-instance v0, Lcom/hudee/pns/bean/d;

    invoke-direct {v0}, Lcom/hudee/pns/bean/d;-><init>()V

    sput-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->index:I

    iput p4, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->value:I

    return-void
.end method

.method public static internalGetValueMap()Lcom/google/protobuf/Internal$EnumLiteMap;
    .locals 1

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    return-object v0
.end method

.method public static valueOf(I)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;
    .locals 1

    packed-switch p0, :pswitch_data_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :pswitch_0
    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->none:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    goto :goto_0

    :pswitch_1
    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->call:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    goto :goto_0

    :pswitch_2
    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->pause:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    goto :goto_0

    :pswitch_3
    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->choke:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    goto :goto_0

    :pswitch_4
    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->exception:Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;
    .locals 1

    const-class v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    return-object p0
.end method

.method public static values()[Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;
    .locals 1

    sget-object v0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->$VALUES:[Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    invoke-virtual {v0}, [Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;

    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .locals 1

    iget v0, p0, Lcom/hudee/pns/bean/MessageRouting$HeartbeatInit$HeartbeatException;->value:I

    return v0
.end method
