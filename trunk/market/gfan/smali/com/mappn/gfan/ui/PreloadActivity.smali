.class public Lcom/mappn/gfan/ui/PreloadActivity;
.super Lcom/mappn/gfan/common/widget/BaseActivity;

# interfaces
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;


# static fields
.field private static final ACTION_PACKAGENAME:Ljava/lang/String; = "pkgName"

.field private static final ACTION_PID:Ljava/lang/String; = "pid"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;-><init>()V

    return-void
.end method

.method private checkBarcode(Landroid/content/Intent;)Z
    .locals 6

    const/4 v5, -0x1

    const/4 v4, 0x1

    const/4 v3, 0x0

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->parserUri(Landroid/net/Uri;)Ljava/util/HashMap;

    move-result-object v0

    if-eqz v0, :cond_3

    const-string v1, "p"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    array-length v1, v0

    const/4 v2, 0x2

    if-ge v1, v2, :cond_1

    :cond_0
    move v0, v4

    :goto_0
    return v0

    :cond_1
    aget-object v1, v0, v3

    aget-object v0, v0, v4

    const-string v2, "pid"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v1, "0"

    invoke-static {p0, p0, v5, v0, v1}, Lcom/mappn/gfan/common/MarketAPI;->getProductDetailWithId(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;ILjava/lang/String;Ljava/lang/String;)V

    move v0, v3

    goto :goto_0

    :cond_2
    const-string v2, "pkgName"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {p0, p0, v5, v0}, Lcom/mappn/gfan/common/MarketAPI;->getProductDetailWithPackageName(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;ILjava/lang/String;)V

    move v0, v3

    goto :goto_0

    :cond_3
    move v0, v4

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10

    const/4 v3, 0x0

    const/4 v9, -0x1

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const v1, 0x7f03004d

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PreloadActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PreloadActivity;->getIntent()Landroid/content/Intent;

    move-result-object v8

    const v1, 0x7f0c0004

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PreloadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Landroid/widget/ProgressBar;

    move-object v7, v0

    new-instance v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PreloadActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v4, 0x7f070011

    const/high16 v5, 0x7f07

    const/16 v6, 0xc8

    invoke-direct/range {v1 .. v6}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;IIII)V

    invoke-virtual {v7, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v7, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-direct {p0, v8}, Lcom/mappn/gfan/ui/PreloadActivity;->checkBarcode(Landroid/content/Intent;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "extra.key.package.name"

    invoke-virtual {v8, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v1, "extra.key.pid"

    invoke-virtual {v8, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "extra.key.source.type"

    invoke-virtual {v8, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v2, "0"

    :cond_0
    invoke-static {p0, p0, v9, v1, v2}, Lcom/mappn/gfan/common/MarketAPI;->getProductDetailWithId(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;ILjava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    invoke-static {p0, p0, v9, v1}, Lcom/mappn/gfan/common/MarketAPI;->getProductDetailWithPackageName(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;ILjava/lang/String;)V

    goto :goto_0
.end method

.method public onError(II)V
    .locals 3

    const/4 v2, 0x0

    const/16 v0, 0x258

    if-ne v0, p2, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PreloadActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900ba

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PreloadActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    :goto_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PreloadActivity;->finish()V

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PreloadActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f090098

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PreloadActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method protected onPause()V
    .locals 0

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onPause()V

    invoke-static {p0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

    return-void
.end method

.method protected onResume()V
    .locals 0

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onResume()V

    invoke-static {p0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 7

    const/4 v5, 0x0

    new-instance v2, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PreloadActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v3, Lcom/mappn/gfan/ui/ProductDetailActivity;

    invoke-direct {v2, v1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v3, "extra.product.detail"

    move-object v0, p2

    check-cast v0, Lcom/mappn/gfan/common/vo/ProductDetail;

    move-object v1, v0

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string v1, "is_buy"

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PreloadActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "is_buy"

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PreloadActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v3, "extra.app.push"

    invoke-virtual {v1, v3, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PreloadActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "\u9996\u9875"

    aput-object v4, v3, v5

    const/4 v4, 0x1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u70b9\u51fb\u63a8\u9001\u5e94\u7528->"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    check-cast p2, Lcom/mappn/gfan/common/vo/ProductDetail;

    invoke-virtual {p2}, Lcom/mappn/gfan/common/vo/ProductDetail;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v3}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PreloadActivity;->finish()V

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/PreloadActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
