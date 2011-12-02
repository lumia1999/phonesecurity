.class public Lcom/mappn/gfan/ui/PersonalAccountActivity;
.super Lcom/mappn/gfan/common/widget/BaseActivity;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;


# static fields
.field private static final ACCOUNT_BIND:I = 0x4

.field private static final ACCOUNT_REGIST:I = 0x0

.field public static final CLOUD_BIND:I = 0x2

.field public static final CLOUD_UNBIND:I = 0x3

.field public static final REGIST:I = 0x1

.field private static final REQUEST_CODE:I = 0x14


# instance fields
.field private isBinding:Z

.field private isFirstAccess:Z

.field private mAdapter:Lcom/mappn/gfan/ui/PersonalAccountAdapter;

.field private mHandler:Landroid/os/Handler;

.field private mList:Landroid/widget/ListView;

.field private mLoading:Landroid/widget/FrameLayout;

.field private mProgress:Landroid/widget/ProgressBar;

.field private mReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->isFirstAccess:Z

    new-instance v0, Lcom/mappn/gfan/ui/PersonalAccountActivity$1;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity$1;-><init>(Lcom/mappn/gfan/ui/PersonalAccountActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/mappn/gfan/ui/PersonalAccountActivity$2;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity$2;-><init>(Lcom/mappn/gfan/ui/PersonalAccountActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Ljava/util/ArrayList;
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->doInitFuncData()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1002(Lcom/mappn/gfan/ui/PersonalAccountActivity;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->isBinding:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/ui/PersonalAccountAdapter;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mAdapter:Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mappn/gfan/ui/PersonalAccountActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->unBindAccount()V

    return-void
.end method

.method static synthetic access$400(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$602(Lcom/mappn/gfan/ui/PersonalAccountActivity;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->isFirstAccess:Z

    return p1
.end method

.method static synthetic access$700(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$800(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$900(Lcom/mappn/gfan/ui/PersonalAccountActivity;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private doInitFuncData()Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v8, 0x3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-array v1, v8, [I

    fill-array-data v1, :array_0

    new-array v2, v8, [Ljava/lang/String;

    const v3, 0x7f090051

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    const v3, 0x7f090052

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    const v3, 0x7f09005a

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v7

    new-array v3, v8, [Ljava/lang/String;

    const v4, 0x7f090053

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    const v4, 0x7f090054

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    const v4, 0x7f090055

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    move v4, v5

    :goto_0
    if-ge v4, v8, :cond_0

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    const-string v6, "icon"

    aget v7, v1, v4

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "title"

    aget-object v7, v2, v4

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "desc"

    aget-object v7, v3, v4

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "download"

    const v7, 0x7f02001e

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "arrow"

    const v7, 0x7f02008d

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "account_type"

    const/16 v7, 0x9

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    return-object v0

    nop

    :array_0
    .array-data 0x4
        0x98t 0x0t 0x2t 0x7ft
        0x97t 0x0t 0x2t 0x7ft
        0x99t 0x0t 0x2t 0x7ft
    .end array-data
.end method

.method private doInitPayAdapter()Lcom/mappn/gfan/ui/PersonalAccountAdapter;
    .locals 7

    const/4 v6, 0x6

    new-instance v0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->doInitFuncData()Ljava/util/ArrayList;

    move-result-object v2

    const v3, 0x7f03001c

    new-array v4, v6, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v5, "icon"

    aput-object v5, v4, v1

    const/4 v1, 0x1

    const-string v5, "title"

    aput-object v5, v4, v1

    const/4 v1, 0x2

    const-string v5, "desc"

    aput-object v5, v4, v1

    const/4 v1, 0x3

    const-string v5, "time"

    aput-object v5, v4, v1

    const/4 v1, 0x4

    const-string v5, "download"

    aput-object v5, v4, v1

    const/4 v1, 0x5

    const-string v5, "arrow"

    aput-object v5, v4, v1

    new-array v5, v6, [I

    fill-array-data v5, :array_0

    iget-object v6, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mHandler:Landroid/os/Handler;

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I[Ljava/lang/String;[ILandroid/os/Handler;)V

    return-object v0

    :array_0
    .array-data 0x4
        0x10t 0x0t 0xct 0x7ft
        0x2t 0x0t 0xct 0x7ft
        0x20t 0x0t 0xct 0x7ft
        0x23t 0x0t 0xct 0x7ft
        0x2et 0x0t 0xct 0x7ft
        0x2dt 0x0t 0xct 0x7ft
    .end array-data
.end method

.method private initTopBar()V
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v4, [Landroid/view/View;

    const v2, 0x7f0c009e

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v3

    new-array v2, v4, [I

    aput v3, v2, v3

    const v3, 0x7f09004f

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/mappn/gfan/common/util/TopBar;->createTopBar(Landroid/content/Context;[Landroid/view/View;[ILjava/lang/String;)V

    return-void
.end method

.method private initView()V
    .locals 3

    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mList:Landroid/widget/ListView;

    const v0, 0x7f0c000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mLoading:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mLoading:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0004

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mProgress:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mProgress:Landroid/widget/ProgressBar;

    new-instance v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->doInitPayAdapter()Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mAdapter:Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mAdapter:Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mList:Landroid/widget/ListView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mList:Landroid/widget/ListView;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setChoiceMode(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void
.end method

.method private transferDataType(Lcom/mappn/gfan/common/vo/PayAndChargeLogs;)Ljava/util/ArrayList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mappn/gfan/common/vo/PayAndChargeLogs;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    const/4 v9, 0x0

    const/4 v8, 0x1

    const/4 v0, 0x0

    iget-object v1, p1, Lcom/mappn/gfan/common/vo/PayAndChargeLogs;->payAndChargeLogList:Ljava/util/ArrayList;

    if-eqz p1, :cond_1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_1

    new-instance v2, Ljava/util/ArrayList;

    iget v0, p1, Lcom/mappn/gfan/common/vo/PayAndChargeLogs;->totalSize:I

    add-int/lit8 v0, v0, 0x1

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v3, "account_type"

    const/16 v4, 0x8

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "time"

    const v4, 0x7f090058

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-array v5, v8, [Ljava/lang/Object;

    iget v6, p1, Lcom/mappn/gfan/common/vo/PayAndChargeLogs;->totalSize:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v9

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "title"

    const v4, 0x7f09005b

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "place_holder"

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/PayAndChargeLog;

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iget-object v4, v0, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->iconUrl:Ljava/lang/String;

    const-string v5, "icon"

    invoke-virtual {v3, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "title"

    iget-object v5, v0, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->name:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "desc"

    const v5, 0x7f0900e8

    invoke-virtual {p0, v5}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-array v6, v8, [Ljava/lang/Object;

    iget v7, v0, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->payment:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "time"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, v0, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->time:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const v6, 0x7f090059

    invoke-virtual {p0, v6}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "account_type"

    iget v0, v0, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->type:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object v0, v2

    :cond_1
    return-object v0
.end method

.method private unBindAccount()V
    .locals 2

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/hudee/HudeeUtils;->unregisterLPNS(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mappn/gfan/common/MarketAPI;->unbindAccount(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    return-void
.end method


# virtual methods
.method public getCurrentBindStatue()Z
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->isBinding:Z

    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    const/4 v2, 0x0

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f030019

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->setContentView(I)V

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.hudee.pns.intent.REGISTRATION"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.mappn.gfan"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addCategory(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0, v2, v2}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->initTopBar()V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->initView()V

    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 3

    const v1, 0x108009b

    sparse-switch p1, :sswitch_data_0

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    :goto_0
    return-object v0

    :sswitch_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f090062

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007e

    new-instance v2, Lcom/mappn/gfan/ui/PersonalAccountActivity$4;

    invoke-direct {v2, p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity$4;-><init>(Lcom/mappn/gfan/ui/PersonalAccountActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007f

    new-instance v2, Lcom/mappn/gfan/ui/PersonalAccountActivity$3;

    invoke-direct {v2, p0, p1}, Lcom/mappn/gfan/ui/PersonalAccountActivity$3;-><init>(Lcom/mappn/gfan/ui/PersonalAccountActivity;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto :goto_0

    :sswitch_1
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f090065

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f090063

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f090086

    new-instance v2, Lcom/mappn/gfan/ui/PersonalAccountActivity$6;

    invoke-direct {v2, p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity$6;-><init>(Lcom/mappn/gfan/ui/PersonalAccountActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007b

    new-instance v2, Lcom/mappn/gfan/ui/PersonalAccountActivity$5;

    invoke-direct {v2, p0, p1}, Lcom/mappn/gfan/ui/PersonalAccountActivity$5;-><init>(Lcom/mappn/gfan/ui/PersonalAccountActivity;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x4 -> :sswitch_1
    .end sparse-switch
.end method

.method protected onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onDestroy()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method public onError(II)V
    .locals 3

    const/4 v2, 0x1

    packed-switch p1, :pswitch_data_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mAdapter:Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->notifyDataSetChanged()V

    :goto_0
    return-void

    :pswitch_0
    const-string v0, "bind account error"

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f090064

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mAdapter:Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->getDataSource()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "download"

    const v2, 0x7f02001e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mAdapter:Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->notifyDataSetChanged()V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x14
        :pswitch_0
    .end packed-switch
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    const/high16 v4, 0x1000

    const/4 v3, 0x0

    packed-switch p3, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isLogin()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/LoginActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v1, 0x14

    invoke-virtual {p0, v0, v1}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isLogin()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->showDialog(I)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isDeviceBinded()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->unBindAccount()V

    goto :goto_0

    :cond_2
    iget-boolean v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->isBinding:Z

    if-nez v0, :cond_0

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->showDialog(I)V

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u4e2a\u4eba\u4e2d\u5fc3"

    aput-object v2, v1, v3

    const/4 v2, 0x1

    const-string v3, "\u70b9\u51fb\u5145\u503c"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getDefaultChargeType()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_3

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mappn/gfan/ui/ChargeTypeListActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :cond_3
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string v2, "type"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method protected onPause()V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isLogin()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->isFirstAccess:Z

    :cond_0
    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onPause()V

    invoke-static {p0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

    return-void
.end method

.method protected onResume()V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isLogin()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->isFirstAccess:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mappn/gfan/common/MarketAPI;->getBalance(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0xa

    invoke-static {v0, p0, v2, v1}, Lcom/mappn/gfan/common/MarketAPI;->getPayLog(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;II)V

    :cond_0
    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onResume()V

    invoke-static {p0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 6

    const/16 v2, 0x8

    const/4 v5, 0x0

    const/4 v3, 0x1

    sparse-switch p1, :sswitch_data_0

    :goto_0
    return-void

    :sswitch_0
    check-cast p2, Lcom/mappn/gfan/common/vo/PayAndChargeLogs;

    if-eqz p2, :cond_0

    iget v0, p2, Lcom/mappn/gfan/common/vo/PayAndChargeLogs;->totalSize:I

    if-lez v0, :cond_0

    invoke-direct {p0, p2}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->transferDataType(Lcom/mappn/gfan/common/vo/PayAndChargeLogs;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mAdapter:Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->addData(Ljava/util/List;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "account_type"

    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "title"

    const v2, 0x7f09005c

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mAdapter:Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->addData(Ljava/util/HashMap;)V

    goto :goto_0

    :sswitch_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/Session;->setDeviceBinded(Z)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f090067

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v3}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mAdapter:Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->getDataSource()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "download"

    const v2, 0x7f02001f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mAdapter:Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->notifyDataSetChanged()V

    iput-boolean v5, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->isBinding:Z

    goto :goto_0

    :sswitch_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0, v5}, Lcom/mappn/gfan/Session;->setDeviceBinded(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mAdapter:Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->getDataSource()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "download"

    const v2, 0x7f02001e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mAdapter:Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->notifyDataSetChanged()V

    goto/16 :goto_0

    :sswitch_3
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mAdapter:Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->getDataSource()Ljava/util/ArrayList;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "desc"

    const v2, 0x7f090056

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {p0, v2, v3}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountActivity;->mAdapter:Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->notifyDataSetChanged()V

    goto/16 :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x14 -> :sswitch_1
        0x15 -> :sswitch_3
        0x16 -> :sswitch_0
        0x1d -> :sswitch_2
    .end sparse-switch
.end method
