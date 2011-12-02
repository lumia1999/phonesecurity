.class public Lcom/hudee/pns/c;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/hudee/pns/a;


# static fields
.field static b:Lcom/hudee/pns/h;

.field public static c:Ljava/util/concurrent/ConcurrentHashMap;

.field private static final d:Ljava/lang/String;

.field private static f:Ljava/util/concurrent/ConcurrentHashMap;


# instance fields
.field private e:Lcom/hudee/pns/b;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/hudee/pns/c;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    new-instance v0, Lcom/hudee/pns/h;

    invoke-direct {v0}, Lcom/hudee/pns/h;-><init>()V

    sput-object v0, Lcom/hudee/pns/c;->b:Lcom/hudee/pns/h;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/hudee/pns/c;->c:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/hudee/pns/c;->f:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/hudee/pns/b;->a()Lcom/hudee/pns/b;

    move-result-object v0

    iput-object v0, p0, Lcom/hudee/pns/c;->e:Lcom/hudee/pns/b;

    return-void
.end method

.method private b(Lcom/hudee/pns/bean/a;)V
    .locals 4

    sget-object v0, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "send msg : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/hudee/pns/bean/a;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lcom/hudee/pns/c;->e:Lcom/hudee/pns/b;

    invoke-virtual {p1}, Lcom/hudee/pns/bean/a;->a()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/hudee/pns/b;->a([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    sget-object v0, Lcom/hudee/pns/c;->f:Ljava/util/concurrent/ConcurrentHashMap;

    iget v1, p1, Lcom/hudee/pns/bean/a;->a:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :catch_0
    move-exception v0

    sget-object v1, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "error! sended message ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/hudee/pns/bean/a;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :try_start_1
    sget-object v1, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    const-string v2, "Exception when sendMsg, try reOpen"

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v0, p0, Lcom/hudee/pns/c;->e:Lcom/hudee/pns/b;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/hudee/pns/b;->b(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    sget-object v1, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    const-string v2, "Send msg IOException reOpen failed. "

    invoke-static {v1, v2, v0}, Lcom/hudee/pns/y;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static c()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;
    .locals 4

    sget-object v0, Lcom/hudee/pns/c;->a:Landroid/content/Context;

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    sget-object v0, Lcom/hudee/pns/c;->a:Landroid/content/Context;

    const-string v2, "phone"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setImei(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/view/Display;->getWidth()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setScreenWidth(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/view/Display;->getHeight()I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setScreenHeight(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    const-string v1, "Android"

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setOsName(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setScreenColorDepth(I)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setOsVersion(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setClientVersion(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setCharset(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->setEtc(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$DeviceRegister$Builder;->build()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 4

    invoke-static {}, Lcom/hudee/pns/c;->c()Lcom/hudee/pns/bean/MessageRouting$DeviceRegister;

    move-result-object v0

    new-instance v1, Lcom/hudee/pns/bean/a;

    sget v2, Lcom/hudee/pns/b;->c:I

    add-int/lit8 v3, v2, 0x1

    sput v3, Lcom/hudee/pns/b;->c:I

    sget-object v3, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->DEVICE_REGISTER:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-direct {v1, v2, v3, v0}, Lcom/hudee/pns/bean/a;-><init>(ILcom/hudee/pns/bean/MessageRouting$MessageCMD;Lcom/google/protobuf/MessageLite;)V

    invoke-direct {p0, v1}, Lcom/hudee/pns/c;->b(Lcom/hudee/pns/bean/a;)V

    return-void
.end method

.method public a(Lcom/hudee/pns/bean/MessageRouting$Credential;)V
    .locals 3

    sget-object v0, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    const-string v1, "msg 1.1 [DEVICE_REGISTER] is already send ! response [Credential]!"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->getSecureKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lcom/hudee/pns/t;->b(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/hudee/pns/t;->a(Ljava/lang/String;)V

    invoke-static {v1}, Lcom/hudee/pns/t;->c(Ljava/lang/String;)V

    invoke-static {}, Lcom/hudee/pns/v;->a()V

    sget-object v0, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The device ID is :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The device key is :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$Credential;->getSecureKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/hudee/pns/m;->a()V

    invoke-virtual {p0}, Lcom/hudee/pns/c;->b()V

    sget-object v0, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    const-string v1, "parameters sync !"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public a(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;Ljava/lang/String;Z)V
    .locals 7

    const/4 v0, 0x0

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getApplicationId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getClientId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, p2}, Lcom/hudee/pns/t;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez p3, :cond_1

    sget-object v4, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "subscribe old clientId:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v4, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "subscribe new clientId:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v1, p2, v2}, Lcom/hudee/pns/t;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-static {v3, v2, v1, v0}, Lcom/hudee/pns/t;->a(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    :cond_0
    :goto_0
    invoke-static {}, Lcom/hudee/pns/m;->a()V

    return-void

    :cond_1
    if-eqz p2, :cond_4

    if-eqz v2, :cond_2

    const-string v4, ""

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    invoke-static {v1, p2}, Lcom/hudee/pns/t;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    const/4 v1, 0x1

    invoke-static {v3, p2, v1, v0}, Lcom/hudee/pns/t;->a(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    sget-object v0, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    const-string v1, "Unbind success!"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/hudee/pns/aa;->g()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "There is no one bind , Stop Servcie!"

    invoke-static {v0}, Lcom/hudee/pns/r;->c(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const-string v0, "500"

    goto :goto_1

    :cond_4
    const-string v0, "404"

    goto :goto_1
.end method

.method public a(Lcom/hudee/pns/bean/a;)V
    .locals 7

    iget v0, p1, Lcom/hudee/pns/bean/a;->a:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    sget-object v0, Lcom/hudee/pns/c;->f:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/hudee/pns/bean/a;

    sget-object v1, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "read response message from server : ["

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "]"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/hudee/pns/bean/a;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "read response message from server : "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v4, Lcom/hudee/pns/c;->c:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v0, :cond_2

    sget-object v0, Lcom/hudee/pns/d;->a:[I

    iget-object v1, p1, Lcom/hudee/pns/bean/a;->b:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-virtual {v1}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    sget-object v0, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    const-string v1, "no sended msg in the map for this readed msg ! drop it!"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->b(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    sget-object v0, Lcom/hudee/pns/c;->f:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, v3}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_0
    iget-object p0, p1, Lcom/hudee/pns/bean/a;->d:Lcom/google/protobuf/MessageLite;

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Response;

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Response;->getStatus()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SUCCESS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/hudee/pns/c;->c:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    new-instance v0, Lcom/hudee/pns/w;

    invoke-direct {v0}, Lcom/hudee/pns/w;-><init>()V

    invoke-virtual {v0}, Lcom/hudee/pns/w;->a()Lcom/hudee/pns/w;

    invoke-virtual {v0, p0}, Lcom/hudee/pns/w;->a(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/hudee/pns/c;->c:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "clean the msg ["

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "] success!"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    invoke-virtual {v0}, Lcom/hudee/pns/w;->b()V

    invoke-static {}, Lcom/hudee/pns/m;->a()V

    goto :goto_0

    :cond_1
    sget-object v1, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "clean Error!["

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "]"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    sget-object v1, Lcom/hudee/pns/d;->a:[I

    iget-object v2, p1, Lcom/hudee/pns/bean/a;->b:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-virtual {v2}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_1

    goto/16 :goto_0

    :pswitch_1
    iget-object p0, p1, Lcom/hudee/pns/bean/a;->d:Lcom/google/protobuf/MessageLite;

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$Response;

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$Response;->getStatus()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Response for msg :"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/hudee/pns/bean/a;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "SUCCESS"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    sget-object v1, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/hudee/pns/bean/a;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "is success"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v0, Lcom/hudee/pns/bean/a;->b:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    sget-object v1, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->AUTH:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    const-string v1, "auth success!"

    invoke-static {v0, v1}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    sput-boolean v0, Lcom/hudee/pns/t;->b:Z

    invoke-static {}, Lcom/hudee/pns/aa;->f()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/hudee/pns/v;->a()V

    goto/16 :goto_0

    :pswitch_2
    iget-object v0, p1, Lcom/hudee/pns/bean/a;->d:Lcom/google/protobuf/MessageLite;

    check-cast v0, Lcom/hudee/pns/bean/MessageRouting$Credential;

    invoke-virtual {p0, v0}, Lcom/hudee/pns/c;->a(Lcom/hudee/pns/bean/MessageRouting$Credential;)V

    goto/16 :goto_0

    :pswitch_3
    iget-object v1, p1, Lcom/hudee/pns/bean/a;->d:Lcom/google/protobuf/MessageLite;

    check-cast v1, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    iget-object v2, v0, Lcom/hudee/pns/bean/a;->d:Lcom/google/protobuf/MessageLite;

    check-cast v2, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    invoke-virtual {v2}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getClientId()Ljava/lang/String;

    move-result-object v2

    iget-object v0, v0, Lcom/hudee/pns/bean/a;->b:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    sget-object v4, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->SERVICE_UNBIND:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-virtual {v0, v4}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {p0, v1, v2, v0}, Lcom/hudee/pns/c;->a(Lcom/hudee/pns/bean/MessageRouting$ServiceBind;Ljava/lang/String;Z)V

    goto/16 :goto_0

    :cond_3
    sget-object v2, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->SERVICE_BIND:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    iget-object v4, v0, Lcom/hudee/pns/bean/a;->b:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-virtual {v2, v4}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    sget-object v2, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->SERVICE_UNBIND:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    iget-object v4, v0, Lcom/hudee/pns/bean/a;->b:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-virtual {v2, v4}, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-object p0, v0, Lcom/hudee/pns/bean/a;->d:Lcom/google/protobuf/MessageLite;

    check-cast p0, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getClientId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->getApplicationId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/hudee/pns/t;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v4, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "bind or unbind error notify Error ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]!"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v4, 0x0

    invoke-static {v2, v0, v4, v1}, Lcom/hudee/pns/t;->a(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    goto/16 :goto_0

    :cond_5
    sget-object v2, Lcom/hudee/pns/c;->d:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/hudee/pns/bean/a;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "is "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/hudee/pns/y;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    sget-boolean v0, Lcom/hudee/pns/t;->b:Z

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->setApplicationId(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    if-eqz p2, :cond_0

    invoke-virtual {v0, p2}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->setClientId(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    :cond_0
    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->build()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    new-instance v1, Lcom/hudee/pns/bean/a;

    sget v2, Lcom/hudee/pns/b;->c:I

    add-int/lit8 v3, v2, 0x1

    sput v3, Lcom/hudee/pns/b;->c:I

    sget-object v3, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->SERVICE_BIND:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-direct {v1, v2, v3, v0}, Lcom/hudee/pns/bean/a;-><init>(ILcom/hudee/pns/bean/MessageRouting$MessageCMD;Lcom/google/protobuf/MessageLite;)V

    invoke-direct {p0, v1}, Lcom/hudee/pns/c;->b(Lcom/hudee/pns/bean/a;)V

    :cond_1
    return-void
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 4

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Message;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    move-result-object v0

    invoke-static {}, Lcom/hudee/pns/ab;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->setUid(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "@app"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->setTo(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "@dev"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->setFrom(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->setDate(J)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    invoke-static {p3}, Lcom/google/protobuf/ByteString;->copyFrom([B)Lcom/google/protobuf/ByteString;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->setContent(Lcom/google/protobuf/ByteString;)Lcom/hudee/pns/bean/MessageRouting$Message$Builder;

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Message$Builder;->build()Lcom/hudee/pns/bean/MessageRouting$Message;

    move-result-object v0

    new-instance v1, Lcom/hudee/pns/bean/a;

    sget v2, Lcom/hudee/pns/b;->c:I

    add-int/lit8 v3, v2, 0x1

    sput v3, Lcom/hudee/pns/b;->c:I

    sget-object v3, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->MESSAGE:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-direct {v1, v2, v3, v0}, Lcom/hudee/pns/bean/a;-><init>(ILcom/hudee/pns/bean/MessageRouting$MessageCMD;Lcom/google/protobuf/MessageLite;)V

    invoke-direct {p0, v1}, Lcom/hudee/pns/c;->b(Lcom/hudee/pns/bean/a;)V

    return-void
.end method

.method public b()V
    .locals 4

    invoke-static {}, Lcom/hudee/pns/aa;->b()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/hudee/pns/aa;->c()Ljava/lang/String;

    move-result-object v1

    if-eqz v0, :cond_0

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$Credential;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->setId(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->setSecureKey(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$Credential$Builder;->build()Lcom/hudee/pns/bean/MessageRouting$Credential;

    move-result-object v0

    new-instance v1, Lcom/hudee/pns/bean/a;

    sget v2, Lcom/hudee/pns/b;->c:I

    add-int/lit8 v3, v2, 0x1

    sput v3, Lcom/hudee/pns/b;->c:I

    sget-object v3, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->AUTH:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-direct {v1, v2, v3, v0}, Lcom/hudee/pns/bean/a;-><init>(ILcom/hudee/pns/bean/MessageRouting$MessageCMD;Lcom/google/protobuf/MessageLite;)V

    invoke-direct {p0, v1}, Lcom/hudee/pns/c;->b(Lcom/hudee/pns/bean/a;)V

    goto :goto_0
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    invoke-static {}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind;->newBuilder()Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->setApplicationId(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    if-eqz p2, :cond_0

    invoke-virtual {v0, p2}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->setClientId(Ljava/lang/String;)Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;

    :cond_0
    invoke-virtual {v0}, Lcom/hudee/pns/bean/MessageRouting$ServiceBind$Builder;->build()Lcom/hudee/pns/bean/MessageRouting$ServiceBind;

    move-result-object v0

    new-instance v1, Lcom/hudee/pns/bean/a;

    sget v2, Lcom/hudee/pns/b;->c:I

    add-int/lit8 v3, v2, 0x1

    sput v3, Lcom/hudee/pns/b;->c:I

    sget-object v3, Lcom/hudee/pns/bean/MessageRouting$MessageCMD;->SERVICE_UNBIND:Lcom/hudee/pns/bean/MessageRouting$MessageCMD;

    invoke-direct {v1, v2, v3, v0}, Lcom/hudee/pns/bean/a;-><init>(ILcom/hudee/pns/bean/MessageRouting$MessageCMD;Lcom/google/protobuf/MessageLite;)V

    invoke-direct {p0, v1}, Lcom/hudee/pns/c;->b(Lcom/hudee/pns/bean/a;)V

    return-void
.end method
