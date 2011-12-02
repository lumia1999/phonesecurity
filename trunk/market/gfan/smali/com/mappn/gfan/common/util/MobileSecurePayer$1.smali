.class Lcom/mappn/gfan/common/util/MobileSecurePayer$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/util/MobileSecurePayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/util/MobileSecurePayer;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/common/util/MobileSecurePayer;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer$1;->this$0:Lcom/mappn/gfan/common/util/MobileSecurePayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer$1;->this$0:Lcom/mappn/gfan/common/util/MobileSecurePayer;

    iget-object v0, v0, Lcom/mappn/gfan/common/util/MobileSecurePayer;->lock:Ljava/lang/Integer;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer$1;->this$0:Lcom/mappn/gfan/common/util/MobileSecurePayer;

    invoke-static {p2}, Lcom/alipay/android/app/IAlixPay$Stub;->asInterface(Landroid/os/IBinder;)Lcom/alipay/android/app/IAlixPay;

    move-result-object v2

    iput-object v2, v1, Lcom/mappn/gfan/common/util/MobileSecurePayer;->mAlixPay:Lcom/alipay/android/app/IAlixPay;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer$1;->this$0:Lcom/mappn/gfan/common/util/MobileSecurePayer;

    iget-object v1, v1, Lcom/mappn/gfan/common/util/MobileSecurePayer;->lock:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayer$1;->this$0:Lcom/mappn/gfan/common/util/MobileSecurePayer;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/mappn/gfan/common/util/MobileSecurePayer;->mAlixPay:Lcom/alipay/android/app/IAlixPay;

    return-void
.end method
