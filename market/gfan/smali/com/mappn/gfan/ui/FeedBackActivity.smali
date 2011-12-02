.class public Lcom/mappn/gfan/ui/FeedBackActivity;
.super Lcom/mappn/gfan/common/widget/BaseActivity;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/mappn/gfan/ui/FeedBackActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/FeedBackActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mappn/gfan/ui/FeedBackActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/FeedBackActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method private initTopBar()V
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/FeedBackActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v4, [Landroid/view/View;

    const v2, 0x7f0c009e

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/FeedBackActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v3

    new-array v2, v4, [I

    aput v3, v2, v3

    const v3, 0x7f090174

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/FeedBackActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/mappn/gfan/common/util/TopBar;->createTopBar(Landroid/content/Context;[Landroid/view/View;[ILjava/lang/String;)V

    return-void
.end method

.method private initViews()V
    .locals 3

    const v0, 0x7f0c0018

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/FeedBackActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v1, 0x7f0c0017

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/FeedBackActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    new-instance v2, Lcom/mappn/gfan/ui/FeedBackActivity$1;

    invoke-direct {v2, p0, v1}, Lcom/mappn/gfan/ui/FeedBackActivity$1;-><init>(Lcom/mappn/gfan/ui/FeedBackActivity;Landroid/widget/EditText;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f03000c

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/FeedBackActivity;->setContentView(I)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/FeedBackActivity;->initTopBar()V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/FeedBackActivity;->initViews()V

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
