.class public Lcom/mappn/gfan/ui/RecommendActivity;
.super Lcom/mappn/gfan/common/widget/BaseTabActivity;

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;


# instance fields
.field private mDown:Landroid/widget/TextView;

.field private mHandler:Landroid/os/Handler;

.field private mIsFirstRank:Z

.field private mPreRank:I

.field private mRankTask:Ljava/lang/Runnable;

.field private mTabHost:Landroid/widget/TabHost;

.field private mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

.field private mUp:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseTabActivity;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mIsFirstRank:Z

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/mappn/gfan/ui/RecommendActivity$1;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/RecommendActivity$1;-><init>(Lcom/mappn/gfan/ui/RecommendActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mRankTask:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/mappn/gfan/ui/RecommendActivity;)I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mPreRank:I

    return v0
.end method

.method static synthetic access$100(Lcom/mappn/gfan/ui/RecommendActivity;)Lcom/mappn/gfan/common/vo/RecommendTopic;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    return-object v0
.end method

.method private static createTabView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;
    .locals 3

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030037

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p0
.end method

.method private initTab()V
    .locals 5

    const v4, 0x7f090162

    const v2, 0x7f090161

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendActivity;->getTabHost()Landroid/widget/TabHost;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTabHost:Landroid/widget/TabHost;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->setup()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/RecommendActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/RecommendActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mappn/gfan/ui/RecommendActivity;->createTabView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/mappn/gfan/ui/RecommendAppsActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "extra.recommend.detail"

    iget-object v3, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/ui/RecommendActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/ui/RecommendActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mappn/gfan/ui/RecommendActivity;->createTabView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/mappn/gfan/ui/RecommendDiscussActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "extra.recommend.detail"

    iget-object v3, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTabHost:Landroid/widget/TabHost;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->setCurrentTab(I)V

    return-void
.end method

.method private initTopBar(Lcom/mappn/gfan/common/vo/RecommendTopic;)V
    .locals 5

    const v0, 0x7f0c002f

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p1, Lcom/mappn/gfan/common/vo/RecommendTopic;->icon:Ljava/lang/String;

    const v3, 0x7f020022

    const/4 v4, 0x1

    invoke-static {v1, v2, v0, v3, v4}, Lcom/mappn/gfan/common/util/ImageUtils;->download(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;IZ)V

    const v0, 0x7f0c0028

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p1, Lcom/mappn/gfan/common/vo/RecommendTopic;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Landroid/widget/TextView;->requestFocus()Z

    const v0, 0x7f0c0076

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mUp:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mUp:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/mappn/gfan/common/vo/RecommendTopic;->up:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mUp:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0c0077

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mDown:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mDown:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/mappn/gfan/common/vo/RecommendTopic;->down:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mDown:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private ranking()V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mRankTask:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mRankTask:Ljava/lang/Runnable;

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private switchRankStatus(I)V
    .locals 6

    const/4 v5, 0x0

    const/4 v4, 0x1

    packed-switch p1, :pswitch_data_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mUp:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mDown:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mUp:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mDown:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    goto :goto_0

    :pswitch_1
    iget-boolean v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mIsFirstRank:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mDown:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    iget v3, v2, Lcom/mappn/gfan/common/vo/RecommendTopic;->down:I

    sub-int/2addr v3, v4

    iput v3, v2, Lcom/mappn/gfan/common/vo/RecommendTopic;->down:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mUp:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    iget v3, v2, Lcom/mappn/gfan/common/vo/RecommendTopic;->up:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v2, Lcom/mappn/gfan/common/vo/RecommendTopic;->up:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iput-boolean v5, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mIsFirstRank:Z

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mUp:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setEnabled(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mDown:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    goto :goto_0

    :pswitch_2
    iget-boolean v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mIsFirstRank:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mUp:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    iget v3, v2, Lcom/mappn/gfan/common/vo/RecommendTopic;->up:I

    sub-int/2addr v3, v4

    iput v3, v2, Lcom/mappn/gfan/common/vo/RecommendTopic;->up:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mDown:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    iget v3, v2, Lcom/mappn/gfan/common/vo/RecommendTopic;->down:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v2, Lcom/mappn/gfan/common/vo/RecommendTopic;->down:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iput-boolean v5, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mIsFirstRank:Z

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mUp:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mDown:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setEnabled(Z)V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 3

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "extra.recommend.detail"

    iget-object v2, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/mappn/gfan/ui/RecommendActivity;->setResult(ILandroid/content/Intent;)V

    :cond_0
    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    const/4 v0, 0x1

    iput v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mPreRank:I

    iget v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mPreRank:I

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/RecommendActivity;->switchRankStatus(I)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/RecommendActivity;->ranking()V

    goto :goto_0

    :pswitch_1
    const/4 v0, -0x1

    iput v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mPreRank:I

    iget v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mPreRank:I

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/RecommendActivity;->switchRankStatus(I)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/RecommendActivity;->ranking()V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x7f0c0076
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f030018

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RecommendActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "extra.recommend.detail"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/RecommendTopic;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/RecommendActivity;->initTopBar(Lcom/mappn/gfan/common/vo/RecommendTopic;)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/RecommendActivity;->initTab()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mTopic:Lcom/mappn/gfan/common/vo/RecommendTopic;

    iget-object v1, v1, Lcom/mappn/gfan/common/vo/RecommendTopic;->id:Ljava/lang/String;

    invoke-static {v0, p0, v1}, Lcom/mappn/gfan/common/MarketAPI;->getMasterRecommendRating(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;)V

    return-void
.end method

.method public onError(II)V
    .locals 3

    const/4 v2, -0x1

    const/4 v1, 0x1

    const/16 v0, 0x2f

    if-ne p1, v0, :cond_2

    iget v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mPreRank:I

    if-ne v0, v1, :cond_1

    invoke-direct {p0, v2}, Lcom/mappn/gfan/ui/RecommendActivity;->switchRankStatus(I)V

    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RecommendActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0900a3

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/RecommendActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    return-void

    :cond_1
    iget v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mPreRank:I

    if-ne v0, v2, :cond_0

    invoke-direct {p0, v1}, Lcom/mappn/gfan/ui/RecommendActivity;->switchRankStatus(I)V

    goto :goto_0

    :cond_2
    const/16 v0, 0x30

    if-ne p1, v0, :cond_0

    iput-boolean v1, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mIsFirstRank:Z

    goto :goto_0
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 4

    const/4 v3, 0x0

    const/4 v2, 0x1

    const/16 v0, 0x30

    if-ne p1, v0, :cond_0

    check-cast p2, Ljava/lang/String;

    invoke-static {p2}, Lcom/mappn/gfan/common/util/Utils;->getInt(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    iput-boolean v2, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mIsFirstRank:Z

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mUp:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mDown:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-ne v0, v2, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mUp:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mDown:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    goto :goto_0

    :cond_2
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mUp:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity;->mDown:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    goto :goto_0
.end method
