.class public Lcom/hudee/pns/service/SubscriptionService;
.super Landroid/app/IntentService;


# instance fields
.field private a:Lcom/hudee/pns/v;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/hudee/pns/service/SubscriptionService;->a()V

    return-void
.end method

.method private a()V
    .locals 1

    iget-object v0, p0, Lcom/hudee/pns/service/SubscriptionService;->a:Lcom/hudee/pns/v;

    if-nez v0, :cond_0

    new-instance v0, Lcom/hudee/pns/v;

    invoke-direct {v0}, Lcom/hudee/pns/v;-><init>()V

    iput-object v0, p0, Lcom/hudee/pns/service/SubscriptionService;->a:Lcom/hudee/pns/v;

    :cond_0
    return-void
.end method


# virtual methods
.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 1

    invoke-direct {p0}, Lcom/hudee/pns/service/SubscriptionService;->a()V

    iget-object v0, p0, Lcom/hudee/pns/service/SubscriptionService;->a:Lcom/hudee/pns/v;

    invoke-virtual {v0, p1}, Lcom/hudee/pns/v;->a(Landroid/content/Intent;)V

    return-void
.end method
