.class public Lcom/mappn/gfan/common/util/MobileSecurePayer;
.super Ljava/lang/Object;


# static fields
.field static TAG:Ljava/lang/String;


# instance fields
.field lock:Ljava/lang/Integer;

.field mActivity:Landroid/app/Activity;

.field mAlixPay:Lcom/alipay/android/app/IAlixPay;

.field private mAlixPayConnection:Landroid/content/ServiceConnection;

.field private mCallback:Lcom/alipay/android/app/IRemoteServiceCallback;

.field mbPaying:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "pay"

    sput-object v0, Lcom/mappn/gfan/common/util/MobileSecurePayer;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer;->lock:Ljava/lang/Integer;

    iput-object v2, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer;->mAlixPay:Lcom/alipay/android/app/IAlixPay;

    iput-boolean v1, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer;->mbPaying:Z

    iput-object v2, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer;->mActivity:Landroid/app/Activity;

    new-instance v0, Lcom/mappn/gfan/common/util/MobileSecurePayer$1;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/common/util/MobileSecurePayer$1;-><init>(Lcom/mappn/gfan/common/util/MobileSecurePayer;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer;->mAlixPayConnection:Landroid/content/ServiceConnection;

    new-instance v0, Lcom/mappn/gfan/common/util/MobileSecurePayer$3;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/common/util/MobileSecurePayer$3;-><init>(Lcom/mappn/gfan/common/util/MobileSecurePayer;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer;->mCallback:Lcom/alipay/android/app/IRemoteServiceCallback;

    return-void
.end method

.method static synthetic access$000(Lcom/mappn/gfan/common/util/MobileSecurePayer;)Lcom/alipay/android/app/IRemoteServiceCallback;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer;->mCallback:Lcom/alipay/android/app/IRemoteServiceCallback;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mappn/gfan/common/util/MobileSecurePayer;)Landroid/content/ServiceConnection;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer;->mAlixPayConnection:Landroid/content/ServiceConnection;

    return-object v0
.end method


# virtual methods
.method public pay(Ljava/lang/String;Landroid/os/Handler;ILandroid/app/Activity;)Z
    .locals 4

    const/4 v3, 0x1

    iget-boolean v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer;->mbPaying:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iput-boolean v3, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer;->mbPaying:Z

    iput-object p4, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer;->mActivity:Landroid/app/Activity;

    iget-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer;->mAlixPay:Lcom/alipay/android/app/IAlixPay;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer;->mActivity:Landroid/app/Activity;

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/alipay/android/app/IAlixPay;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer;->mAlixPayConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/Activity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    :cond_1
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/mappn/gfan/common/util/MobileSecurePayer$2;

    invoke-direct {v1, p0, p1, p3, p2}, Lcom/mappn/gfan/common/util/MobileSecurePayer$2;-><init>(Lcom/mappn/gfan/common/util/MobileSecurePayer;Ljava/lang/String;ILandroid/os/Handler;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    move v0, v3

    goto :goto_0
.end method
