.class public Lcom/mappn/gfan/ui/ChargeTypeListActivity;
.super Landroid/app/ListActivity;


# static fields
.field public static final TYPE_ALIPAY:Ljava/lang/String; = "alipay"

.field public static final TYPE_PHONECARD:Ljava/lang/String; = "phonecard"


# instance fields
.field private mChargeTypes:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mTvInfoTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    return-void
.end method

.method private getChargeTypeStrings()[Ljava/lang/String;
    .locals 5

    const/4 v4, 0x2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v4}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->mChargeTypes:Ljava/util/HashMap;

    const v0, 0x7f0900f1

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f0900fa

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->mChargeTypes:Ljava/util/HashMap;

    const-string v3, "alipay"

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p0, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->mChargeTypes:Ljava/util/HashMap;

    const-string v3, "phonecard"

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-array v2, v4, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    return-object v2
.end method

.method private showError(Landroid/content/Intent;)V
    .locals 5

    const/4 v4, 0x0

    const-string v0, "error"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "error"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->getChargeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->mTvInfoTitle:Landroid/widget/TextView;

    const v2, 0x7f0900f0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v4

    invoke-virtual {p0, v2, v3}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->mTvInfoTitle:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->mTvInfoTitle:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method public getChargeType(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->mChargeTypes:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method protected getType(I)Ljava/lang/String;
    .locals 1

    packed-switch p1, :pswitch_data_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :pswitch_0
    const-string v0, "alipay"

    goto :goto_0

    :pswitch_1
    const-string v0, "phonecard"

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    const/4 v0, -0x1

    invoke-super {p0, p1, p2, p3}, Landroid/app/ListActivity;->onActivityResult(IILandroid/content/Intent;)V

    if-ne v0, p2, :cond_0

    if-nez p1, :cond_0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->setResult(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->finish()V

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f03003e

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->setContentView(I)V

    new-array v0, v3, [Landroid/view/View;

    const v1, 0x7f0c009e

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    aput-object v1, v0, v2

    new-array v1, v3, [I

    aput v2, v1, v2

    const v2, 0x7f0900ed

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v0, v1, v2}, Lcom/mappn/gfan/common/util/TopBar;->createTopBar(Landroid/content/Context;[Landroid/view/View;[ILjava/lang/String;)V

    const v0, 0x7f0c0057

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->mTvInfoTitle:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->showError(Landroid/content/Intent;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setHeight(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->getListView()Landroid/widget/ListView;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2, v3}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;Ljava/lang/Object;Z)V

    new-instance v0, Landroid/widget/ArrayAdapter;

    const v1, 0x7f030044

    const v2, 0x7f0c0002

    invoke-direct {p0}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->getChargeTypeStrings()[Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, p0, v1, v2, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;II[Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->setListAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 5

    const/4 v4, 0x0

    invoke-super/range {p0 .. p5}, Landroid/app/ListActivity;->onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "type"

    invoke-virtual {p0, p3}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->getType(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "balance"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "balance"

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "balance"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    :cond_0
    invoke-virtual {p0, v0, v4}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->startActivityForResult(Landroid/content/Intent;I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->mTvInfoTitle:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 4

    invoke-super {p0, p1}, Landroid/app/ListActivity;->onNewIntent(Landroid/content/Intent;)V

    const-string v0, "balance"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "balance"

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "balance"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    :cond_0
    invoke-direct {p0, p1}, Lcom/mappn/gfan/ui/ChargeTypeListActivity;->showError(Landroid/content/Intent;)V

    return-void
.end method
