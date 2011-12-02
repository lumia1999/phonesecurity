.class final Lcom/mappn/gfan/common/util/AppStatusReceiver$1;
.super Ljava/lang/Thread;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/util/AppStatusReceiver;->removeUpdateApp(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$pkgName:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/AppStatusReceiver$1;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/mappn/gfan/common/util/AppStatusReceiver$1;->val$pkgName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppStatusReceiver$1;->val$context:Landroid/content/Context;

    invoke-static {v0}, Lcom/mappn/gfan/common/util/DBUtils;->queryUpdateProduct(Landroid/content/Context;)Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/util/AppStatusReceiver$1;->val$pkgName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppStatusReceiver$1;->val$context:Landroid/content/Context;

    invoke-static {v0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUpdateList()Ljava/util/HashMap;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/common/util/AppStatusReceiver$1;->val$pkgName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUpgradeNumber()I

    move-result v1

    iget-object v2, p0, Lcom/mappn/gfan/common/util/AppStatusReceiver$1;->val$context:Landroid/content/Context;

    iget-object v3, p0, Lcom/mappn/gfan/common/util/AppStatusReceiver$1;->val$pkgName:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/mappn/gfan/common/util/DBUtils;->removeUpgradable(Landroid/content/Context;Ljava/lang/String;)V

    if-lez v1, :cond_0

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/Session;->setUpgradeNumber(I)V

    :cond_0
    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
