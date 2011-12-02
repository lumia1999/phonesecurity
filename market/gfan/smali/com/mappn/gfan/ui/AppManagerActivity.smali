.class public Lcom/mappn/gfan/ui/AppManagerActivity;
.super Lcom/mappn/gfan/common/widget/BaseTabActivity;


# instance fields
.field private mClickReceiver:Landroid/content/BroadcastReceiver;

.field private mTabHost:Landroid/widget/TabHost;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseTabActivity;-><init>()V

    new-instance v0, Lcom/mappn/gfan/ui/AppManagerActivity$1;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/AppManagerActivity$1;-><init>(Lcom/mappn/gfan/ui/AppManagerActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/AppManagerActivity;->mClickReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/mappn/gfan/ui/AppManagerActivity;)Landroid/widget/TabHost;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppManagerActivity;->mTabHost:Landroid/widget/TabHost;

    return-object v0
.end method

.method private initTopBar()V
    .locals 5

    const/4 v4, 0x2

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppManagerActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v4, [Landroid/view/View;

    const/4 v2, 0x0

    const v3, 0x7f0c009e

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/AppManagerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const v3, 0x7f0c009a

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/AppManagerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    aput-object v3, v1, v2

    new-array v2, v4, [I

    fill-array-data v2, :array_0

    const v3, 0x7f090110

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/AppManagerActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/mappn/gfan/common/util/TopBar;->createTopBar(Landroid/content/Context;[Landroid/view/View;[ILjava/lang/String;)V

    return-void

    nop

    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method private initView()V
    .locals 4

    const v0, 0x1020012

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/AppManagerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TabHost;

    iput-object v0, p0, Lcom/mappn/gfan/ui/AppManagerActivity;->mTabHost:Landroid/widget/TabHost;

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppManagerActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->setup()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppManagerActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v0

    const v1, 0x7f0200b3

    invoke-virtual {v0, v1}, Landroid/widget/TabWidget;->setDividerDrawable(I)V

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppManagerActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/AppsUpdateActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/AppManagerActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v2, "installed"

    invoke-virtual {v1, v2}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppManagerActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f09006e

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/AppManagerActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mappn/gfan/common/util/Utils;->createTabView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/AppManagerActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppManagerActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/DownloadManagerActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/AppManagerActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v2, "download"

    invoke-virtual {v1, v2}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppManagerActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f09006f

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/AppManagerActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mappn/gfan/common/util/Utils;->createTabView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/AppManagerActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onCreate(Landroid/os/Bundle;)V

    const/high16 v0, 0x7f03

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/AppManagerActivity;->setContentView(I)V

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.mappn.gfan.download.intent"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/AppManagerActivity;->mClickReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/mappn/gfan/ui/AppManagerActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    invoke-direct {p0}, Lcom/mappn/gfan/ui/AppManagerActivity;->initTopBar()V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/AppManagerActivity;->initView()V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onDestroy()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppManagerActivity;->mClickReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/AppManagerActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/AppManagerActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method
