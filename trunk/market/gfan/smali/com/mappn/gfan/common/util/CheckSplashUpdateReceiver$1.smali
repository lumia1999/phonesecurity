.class Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/mappn/gfan/common/download/DownloadManager$EnqueueListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver;->onSuccess(ILjava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver;

.field final synthetic val$session:Lcom/mappn/gfan/Session;

.field final synthetic val$upgrades:Lcom/mappn/gfan/common/vo/SplashInfo;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver;Lcom/mappn/gfan/Session;Lcom/mappn/gfan/common/vo/SplashInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver$1;->this$0:Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver;

    iput-object p2, p0, Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver$1;->val$session:Lcom/mappn/gfan/Session;

    iput-object p3, p0, Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver$1;->val$upgrades:Lcom/mappn/gfan/common/vo/SplashInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinish(J)V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver$1;->val$session:Lcom/mappn/gfan/Session;

    invoke-virtual {v0, p1, p2}, Lcom/mappn/gfan/Session;->setSplashId(J)V

    iget-object v0, p0, Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver$1;->val$session:Lcom/mappn/gfan/Session;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/CheckSplashUpdateReceiver$1;->val$upgrades:Lcom/mappn/gfan/common/vo/SplashInfo;

    iget-wide v1, v1, Lcom/mappn/gfan/common/vo/SplashInfo;->timestamp:J

    invoke-virtual {v0, v1, v2}, Lcom/mappn/gfan/Session;->setSplashTime(J)V

    return-void
.end method
