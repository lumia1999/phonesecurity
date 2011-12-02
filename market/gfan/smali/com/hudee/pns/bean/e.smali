.class final Lcom/hudee/pns/bean/e;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/protobuf/Internal$EnumLiteMap;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(I)Lcom/hudee/pns/bean/MessageRouting$MessageCMD;
    .locals 1

    invoke-static {p1}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->valueOf(I)Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic findValueByNumber(I)Lcom/google/protobuf/Internal$EnumLite;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/hudee/pns/bean/e;->a(I)Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    move-result-object v0

    return-object v0
.end method
