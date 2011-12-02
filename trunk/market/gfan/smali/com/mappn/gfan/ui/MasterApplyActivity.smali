.class public Lcom/mappn/gfan/ui/MasterApplyActivity;
.super Lcom/mappn/gfan/common/widget/BaseActivity;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f030054

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/MasterApplyActivity;->setContentView(I)V

    new-array v0, v3, [Landroid/view/View;

    const v1, 0x7f0c009e

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/MasterApplyActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    aput-object v1, v0, v2

    new-array v1, v3, [I

    aput v2, v1, v2

    const v2, 0x7f090159

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/MasterApplyActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v0, v1, v2}, Lcom/mappn/gfan/common/util/TopBar;->createTopBar(Landroid/content/Context;[Landroid/view/View;[ILjava/lang/String;)V

    const v0, 0x7f0c0090

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/MasterApplyActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const v1, 0x7f0c0091

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/MasterApplyActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    const v2, 0x7f0c0018

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/MasterApplyActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    new-instance v3, Lcom/mappn/gfan/ui/MasterApplyActivity$1;

    invoke-direct {v3, p0, v0, v1}, Lcom/mappn/gfan/ui/MasterApplyActivity$1;-><init>(Lcom/mappn/gfan/ui/MasterApplyActivity;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    return-void
.end method

.method protected onPause()V
    .locals 0

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onPause()V

    invoke-static {p0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->onPause(Landroid/content/Context;)V

    return-void
.end method

.method protected onResume()V
    .locals 0

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onResume()V

    invoke-static {p0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->onResume(Landroid/content/Context;)V

    return-void
.end method
