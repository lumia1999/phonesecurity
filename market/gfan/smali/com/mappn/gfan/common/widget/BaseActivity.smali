.class public Lcom/mappn/gfan/common/widget/BaseActivity;
.super Landroid/app/ActivityGroup;


# instance fields
.field protected mSession:Lcom/mappn/gfan/Session;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/ActivityGroup;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/app/ActivityGroup;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/widget/BaseActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-static {p0}, Lcom/mobclick/android/MobclickAgent;->onError(Landroid/content/Context;)V

    return-void
.end method

.method public onLowMemory()V
    .locals 1

    invoke-super {p0}, Landroid/app/ActivityGroup;->onLowMemory()V

    invoke-static {}, Lcom/mappn/gfan/common/ResponseCacheManager;->getInstance()Lcom/mappn/gfan/common/ResponseCacheManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/common/ResponseCacheManager;->clear()V

    return-void
.end method
