.class public Lcom/mappn/gfan/ui/PayMainActivity;
.super Lcom/mappn/gfan/common/widget/BaseActivity;

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;
.implements Lcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;
.implements Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/ui/PayMainActivity$AlixOnCancelListener;
    }
.end annotation


# static fields
.field private static final DIALOG_ACCOUNT_NUM_WRONG:I = 0xa

.field private static final DIALOG_CARD_IS_EMPTY:I = 0x2

.field private static final DIALOG_CHARGE_CARD_ERROR:I = 0x11

.field private static final DIALOG_CHARGE_CARD_NO_ENOUGH_BALANCE_ERROR:I = 0x12

.field private static final DIALOG_CHARGE_CARD_OR_PWD_FAILED:I = 0x14

.field private static final DIALOG_CHARGE_CONNECT_FAILED:I = 0xf

.field private static final DIALOG_CHARGE_FAILED:I = 0xe

.field private static final DIALOG_CHARGE_INFO:I = 0x16

.field private static final DIALOG_CHARGE_NETWORK_ERROR:I = 0x13

.field private static final DIALOG_CHARGE_SUCCESS:I = 0x9

.field private static final DIALOG_CHECKBOX_IS_EMPTY:I = 0x4

.field private static final DIALOG_CONFIRM:I = 0x5

.field private static final DIALOG_ERROR_1:I = 0x6

.field private static final DIALOG_ERROR_2:I = 0x7

.field private static final DIALOG_ERROR_3:I = 0x8

.field private static final DIALOG_NO_CARD_CHOOSE:I = 0x15

.field private static final DIALOG_OUT_TIME:I = 0xd

.field private static final DIALOG_PASSWORD_IS_EMPTY:I = 0x3

.field private static final DIALOG_PROGRESS_BAR:I = 0x0

.field private static final DIALOG_PSD_NUM_WRONG:I = 0xb

.field private static final DIALOG_QUERY_CREDIT:I = 0x1

.field private static final DIALOG_START_ERROR:I = 0x10

.field private static final DIALOG_UNKNOWN_ERROR:I = 0xc


# instance fields
.field private cardMoney:[I

.field private checkedId:I

.field private lastTime:J

.field private mCard:Lcom/mappn/gfan/common/vo/CardInfo;

.field private mCardNumberEditText:Landroid/widget/EditText;

.field private mCardPasswordEditText:Landroid/widget/EditText;

.field private mCardVerification:Lcom/mappn/gfan/common/vo/CardsVerification;

.field private mCardVerifications:Lcom/mappn/gfan/common/vo/CardsVerifications;

.field private mCardsSpinner:Lcom/mappn/gfan/common/widget/TitleSpinner;

.field private mCenterArea:Landroid/widget/ViewAnimator;

.field private mCredit:I

.field private mDenominationSpinner:Lcom/mappn/gfan/common/widget/TitleSpinner;

.field private mHandler:Landroid/os/Handler;

.field private mHintView:Landroid/widget/TextView;

.field private mInputEditText:Landroid/widget/EditText;

.field private mIsOnPause:Z

.field private mOrderID:Ljava/lang/String;

.field private mProgressBar:Landroid/widget/ProgressBar;

.field private mRetryButton:Landroid/widget/Button;

.field private mType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->checkedId:I

    new-instance v0, Lcom/mappn/gfan/ui/PayMainActivity$4;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/PayMainActivity$4;-><init>(Lcom/mappn/gfan/ui/PayMainActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/mappn/gfan/ui/PayMainActivity;)Lcom/mappn/gfan/common/vo/CardInfo;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCard:Lcom/mappn/gfan/common/vo/CardInfo;

    return-object v0
.end method

.method static synthetic access$002(Lcom/mappn/gfan/ui/PayMainActivity;Lcom/mappn/gfan/common/vo/CardInfo;)Lcom/mappn/gfan/common/vo/CardInfo;
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCard:Lcom/mappn/gfan/common/vo/CardInfo;

    return-object p1
.end method

.method static synthetic access$100(Lcom/mappn/gfan/ui/PayMainActivity;)Lcom/mappn/gfan/common/vo/CardsVerification;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardVerification:Lcom/mappn/gfan/common/vo/CardsVerification;

    return-object v0
.end method

.method static synthetic access$102(Lcom/mappn/gfan/ui/PayMainActivity;Lcom/mappn/gfan/common/vo/CardsVerification;)Lcom/mappn/gfan/common/vo/CardsVerification;
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardVerification:Lcom/mappn/gfan/common/vo/CardsVerification;

    return-object p1
.end method

.method static synthetic access$200(Lcom/mappn/gfan/ui/PayMainActivity;)Lcom/mappn/gfan/common/vo/CardsVerifications;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardVerifications:Lcom/mappn/gfan/common/vo/CardsVerifications;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mappn/gfan/ui/PayMainActivity;)[I
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->cardMoney:[I

    return-object v0
.end method

.method static synthetic access$302(Lcom/mappn/gfan/ui/PayMainActivity;[I)[I
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->cardMoney:[I

    return-object p1
.end method

.method static synthetic access$400(Lcom/mappn/gfan/ui/PayMainActivity;)Lcom/mappn/gfan/common/widget/TitleSpinner;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mDenominationSpinner:Lcom/mappn/gfan/common/widget/TitleSpinner;

    return-object v0
.end method

.method static synthetic access$502(Lcom/mappn/gfan/ui/PayMainActivity;I)I
    .locals 0

    iput p1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->checkedId:I

    return p1
.end method

.method static synthetic access$600(Lcom/mappn/gfan/ui/PayMainActivity;)Landroid/widget/EditText;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardNumberEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$700(Lcom/mappn/gfan/ui/PayMainActivity;)Landroid/widget/EditText;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardPasswordEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$800(Lcom/mappn/gfan/ui/PayMainActivity;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mOrderID:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$902(Lcom/mappn/gfan/ui/PayMainActivity;J)J
    .locals 0

    iput-wide p1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->lastTime:J

    return-wide p1
.end method

.method private alipay(Ljava/lang/String;)V
    .locals 3

    new-instance v0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->detectMobile_sp()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    const v1, 0x7f0900f6

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0900f7

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, p0, v0, v1, v2}, Lcom/mappn/gfan/common/MarketAPI;->getAliPayOrder(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v1, "alipay"

    invoke-static {v1, v0}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private initAlipayView()V
    .locals 7

    const/4 v6, 0x0

    const v0, 0x7f030042

    const v1, 0x7f0900f1

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->initTopBar(II)V

    const v0, 0x7f0c0066

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f0900f3

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v3}, Lcom/mappn/gfan/Session;->getUserName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    const/4 v3, 0x1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v5, "balance"

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "balance"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, v6}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    invoke-static {p0, p0}, Lcom/mappn/gfan/common/MarketAPI;->getBalance(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    :cond_0
    const v0, 0x7f0c0067

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f0c0003

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v2, 0x7f0c0041

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mInputEditText:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mInputEditText:Landroid/widget/EditText;

    new-instance v3, Lcom/mappn/gfan/ui/PayMainActivity$1;

    invoke-direct {v3, p0, v0, v1}, Lcom/mappn/gfan/ui/PayMainActivity$1;-><init>(Lcom/mappn/gfan/ui/PayMainActivity;Landroid/widget/Button;Landroid/widget/TextView;)V

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "payment"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "payment"

    const/16 v2, 0x64

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    int-to-double v0, v0

    const-wide/high16 v2, 0x4024

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    const/16 v1, 0x3e7

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mInputEditText:Landroid/widget/EditText;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->length()I

    move-result v1

    invoke-static {v0, v1}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;I)V

    return-void

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mInputEditText:Landroid/widget/EditText;

    const-string v1, "10"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private initData()V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->requestData()V

    return-void
.end method

.method private initPhoneCardView()V
    .locals 2

    const v0, 0x7f030041

    const v1, 0x7f0900fa

    invoke-direct {p0, v0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->initTopBar(II)V

    const v0, 0x7f0c0059

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ViewAnimator;

    iput-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCenterArea:Landroid/widget/ViewAnimator;

    const v0, 0x7f0c003f

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mHintView:Landroid/widget/TextView;

    const v0, 0x7f0c005c

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mRetryButton:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mRetryButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0c005b

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mProgressBar:Landroid/widget/ProgressBar;

    const v0, 0x7f0c005f

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/widget/TitleSpinner;

    iput-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardsSpinner:Lcom/mappn/gfan/common/widget/TitleSpinner;

    const v0, 0x7f0c0060

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/widget/TitleSpinner;

    iput-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mDenominationSpinner:Lcom/mappn/gfan/common/widget/TitleSpinner;

    const v0, 0x7f0c0061

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardNumberEditText:Landroid/widget/EditText;

    const v0, 0x7f0c0062

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardPasswordEditText:Landroid/widget/EditText;

    const v0, 0x7f0c0063

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0c0065

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private initTopBar(II)V
    .locals 6

    const/4 v5, -0x2

    const/4 v2, 0x0

    const/4 v4, -0x1

    const/4 v3, 0x1

    invoke-virtual {p0, p1}, Lcom/mappn/gfan/ui/PayMainActivity;->setContentView(I)V

    new-array v0, v3, [Landroid/view/View;

    const v1, 0x7f0c009e

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    aput-object v1, v0, v2

    new-array v1, v3, [I

    aput v2, v1, v2

    invoke-virtual {p0, p2}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v0, v1, v2}, Lcom/mappn/gfan/common/util/TopBar;->createTopBar(Landroid/content/Context;[Landroid/view/View;[ILjava/lang/String;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setFocusable(Z)V

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setClickable(Z)V

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f0900f2

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v5, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0xb

    invoke-virtual {v1, v2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v2, 0xf

    invoke-virtual {v1, v2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v2, 0xa

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    const/high16 v2, 0x7f0c

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private isOutTime()Z
    .locals 4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->lastTime:J

    sub-long/2addr v0, v2

    const-wide/32 v2, 0xea60

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private onClickOk()V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardNumberEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardPasswordEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCard:Lcom/mappn/gfan/common/vo/CardInfo;

    if-nez v2, :cond_1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x15

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->checkedId:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_2

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto :goto_0

    :cond_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto :goto_0

    :cond_3
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto :goto_0

    :cond_4
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardVerification:Lcom/mappn/gfan/common/vo/CardsVerification;

    iget v2, v2, Lcom/mappn/gfan/common/vo/CardsVerification;->accountNum:I

    if-eq v0, v2, :cond_5

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto :goto_0

    :cond_5
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardVerification:Lcom/mappn/gfan/common/vo/CardsVerification;

    iget v1, v1, Lcom/mappn/gfan/common/vo/CardsVerification;->passwordNum:I

    if-eq v0, v1, :cond_6

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0xb

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto :goto_0

    :cond_6
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCard:Lcom/mappn/gfan/common/vo/CardInfo;

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardNumberEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/mappn/gfan/common/vo/CardInfo;->cardAccount:Ljava/lang/String;

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCard:Lcom/mappn/gfan/common/vo/CardInfo;

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardPasswordEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/mappn/gfan/common/vo/CardInfo;->cardPassword:Ljava/lang/String;

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCard:Lcom/mappn/gfan/common/vo/CardInfo;

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->cardMoney:[I

    iget v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->checkedId:I

    aget v1, v1, v2

    mul-int/lit8 v1, v1, 0x64

    iput v1, v0, Lcom/mappn/gfan/common/vo/CardInfo;->cardCredit:I

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto/16 :goto_0
.end method

.method private onClickRetry()V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->showLoadingHint()V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->requestData()V

    return-void
.end method

.method private requestCharge()V
    .locals 3

    const/4 v0, 0x0

    const-string v1, "GFanClient"

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCard:Lcom/mappn/gfan/common/vo/CardInfo;

    invoke-static {p0, p0, v0, v1, v2}, Lcom/mappn/gfan/common/MarketAPI;->charge(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;Lcom/mappn/gfan/common/vo/CardInfo;)V

    return-void
.end method

.method private requestData()V
    .locals 0

    invoke-static {p0, p0}, Lcom/mappn/gfan/common/MarketAPI;->syncCardInfo(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    return-void
.end method

.method private requestQuery()V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mOrderID:Ljava/lang/String;

    invoke-static {p0, p0, v0}, Lcom/mappn/gfan/common/MarketAPI;->queryChargeResult(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;)V

    return-void
.end method

.method private showHint(Ljava/lang/String;Z)V
    .locals 3

    const/16 v1, 0x8

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mHintView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mRetryButton:Landroid/widget/Button;

    if-eqz p2, :cond_0

    move v1, v2

    :cond_0
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCenterArea:Landroid/widget/ViewAnimator;

    invoke-virtual {v0, v2}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    return-void
.end method

.method private showListView()V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mProgressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCenterArea:Landroid/widget/ViewAnimator;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    new-instance v0, Landroid/widget/ArrayAdapter;

    const v1, 0x1090008

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardVerifications:Lcom/mappn/gfan/common/vo/CardsVerifications;

    invoke-virtual {v2}, Lcom/mappn/gfan/common/vo/CardsVerifications;->getCardNames()[Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    const v1, 0x1090009

    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardsSpinner:Lcom/mappn/gfan/common/widget/TitleSpinner;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/widget/TitleSpinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardsSpinner:Lcom/mappn/gfan/common/widget/TitleSpinner;

    new-instance v1, Lcom/mappn/gfan/ui/PayMainActivity$2;

    invoke-direct {v1, p0}, Lcom/mappn/gfan/ui/PayMainActivity$2;-><init>(Lcom/mappn/gfan/ui/PayMainActivity;)V

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/TitleSpinner;->setOnClickListener(Landroid/content/DialogInterface$OnClickListener;)V

    return-void
.end method

.method private showLoadingHint()V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mHintView:Landroid/widget/TextView;

    const v1, 0x7f090081

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mRetryButton:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCenterArea:Landroid/widget/ViewAnimator;

    invoke-virtual {v0, v2}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    return-void
.end method

.method private startChargeTypeListActivity(Z)V
    .locals 3

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->finish()V

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mappn/gfan/ui/ChargeTypeListActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/content/Intent;)Landroid/content/Intent;

    if-eqz p1, :cond_0

    const-string v1, "error"

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mType:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_0
    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mSession:Lcom/mappn/gfan/Session;

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/Session;->setDefaultChargeType(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mSession:Lcom/mappn/gfan/Session;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/Session;->setDefaultChargeType(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_0
    :goto_0
    return-void

    :sswitch_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->onSearchRequested()Z

    goto :goto_0

    :sswitch_1
    invoke-direct {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->onClickRetry()V

    goto :goto_0

    :sswitch_2
    invoke-direct {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->onClickOk()V

    goto :goto_0

    :sswitch_3
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x16

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto :goto_0

    :sswitch_4
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->alipay(Ljava/lang/String;)V

    goto :goto_0

    :sswitch_5
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->startChargeTypeListActivity(Z)V

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x64 -> :sswitch_5
        0x7f0c005c -> :sswitch_1
        0x7f0c0063 -> :sswitch_3
        0x7f0c0065 -> :sswitch_2
        0x7f0c0067 -> :sswitch_4
        0x7f0c009a -> :sswitch_0
    .end sparse-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f030041

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "type"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mType:Ljava/lang/String;

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mType:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->finish()V

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/ChargeTypeListActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->startActivity(Landroid/content/Intent;)V

    :goto_0
    return-void

    :cond_0
    const-string v0, "phonecard"

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->initPhoneCardView()V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->initData()V

    :cond_1
    :goto_1
    const v0, 0x7f0c0064

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mType:Ljava/lang/String;

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v2}, Lcom/mappn/gfan/Session;->getDefaultChargeType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-virtual {v0, p0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    goto :goto_0

    :cond_2
    const-string v0, "alipay"

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->initAlipayView()V

    goto :goto_1
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 7

    const v6, 0x7f0900d6

    const/4 v3, 0x2

    const/4 v5, 0x1

    const/4 v2, 0x0

    const/4 v4, 0x0

    packed-switch p1, :pswitch_data_0

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    :goto_0
    return-object v0

    :pswitch_0
    const v0, 0x7f0900db

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, v4, p0}, Lcom/mappn/gfan/common/util/DialogUtil;->createIndeterminateProgressWhiteTextDialog(Landroid/content/Context;ILjava/lang/String;ZLcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    :pswitch_1
    const v0, 0x7f0900fe

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f0900dc

    new-array v2, v5, [Ljava/lang/Object;

    iget v3, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCredit:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p0, v1, v2}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p1, v0, v1}, Lcom/mappn/gfan/common/util/DialogUtil;->createShowHintOKDialog(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    :pswitch_2
    const v0, 0x7f0900dd

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, p0}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    :pswitch_3
    const v0, 0x7f090099

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, p0}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    :pswitch_4
    const v0, 0x7f0900de

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, p0}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    :pswitch_5
    const v0, 0x7f0900df

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->cardMoney:[I

    iget v3, p0, Lcom/mappn/gfan/ui/PayMainActivity;->checkedId:I

    aget v2, v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardVerification:Lcom/mappn/gfan/common/vo/CardsVerification;

    iget-object v2, v2, Lcom/mappn/gfan/common/vo/CardsVerification;->name:Ljava/lang/String;

    aput-object v2, v1, v5

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f0900e0

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p1, v0, v1, p0}, Lcom/mappn/gfan/common/util/DialogUtil;->createYesNo2TVDialog(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    :pswitch_6
    const v0, 0x7f0900e1

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, p0}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    :pswitch_7
    const v0, 0x7f0900e2

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, p0}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    :pswitch_8
    const v0, 0x7f0900e3

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, p0}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    :pswitch_9
    const v0, 0x7f0900e4

    new-array v1, v3, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardVerification:Lcom/mappn/gfan/common/vo/CardsVerification;

    iget-object v2, v2, Lcom/mappn/gfan/common/vo/CardsVerification;->name:Ljava/lang/String;

    aput-object v2, v1, v4

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardVerification:Lcom/mappn/gfan/common/vo/CardsVerification;

    iget v2, v2, Lcom/mappn/gfan/common/vo/CardsVerification;->accountNum:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-virtual {p0, v0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, p0}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    :pswitch_a
    const v0, 0x7f0900e5

    new-array v1, v3, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardVerification:Lcom/mappn/gfan/common/vo/CardsVerification;

    iget-object v2, v2, Lcom/mappn/gfan/common/vo/CardsVerification;->name:Ljava/lang/String;

    aput-object v2, v1, v4

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardVerification:Lcom/mappn/gfan/common/vo/CardsVerification;

    iget v2, v2, Lcom/mappn/gfan/common/vo/CardsVerification;->passwordNum:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-virtual {p0, v0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, p0}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    :pswitch_b
    const v0, 0x7f0900e6

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, p0}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    :pswitch_c
    const v0, 0x7f0900d5

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, p0}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    :pswitch_d
    const-string v0, "phonecard"

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-array v0, v3, [Ljava/lang/Object;

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->cardMoney:[I

    iget v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->checkedId:I

    aget v1, v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v4

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->cardMoney:[I

    iget v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->checkedId:I

    aget v1, v1, v2

    mul-int/lit8 v1, v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v5

    invoke-virtual {p0, v6, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, p0}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mInputEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    mul-int/lit8 v0, v0, 0xa

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v1, v5

    invoke-virtual {p0, v6, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, p0}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    :pswitch_e
    const v0, 0x7f0900e6

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, v2}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    :pswitch_f
    const v0, 0x7f0900e3

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, v2}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    :pswitch_10
    const v0, 0x7f0900d7

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, v2}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    :pswitch_11
    const v0, 0x7f0900e1

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, v2}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    :pswitch_12
    const v0, 0x7f0900d8

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, v2}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    :pswitch_13
    const v0, 0x7f0900d9

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, v2}, Lcom/mappn/gfan/common/util/DialogUtil;->createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0

    :pswitch_14
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0900e9

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007c

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_d
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_f
        :pswitch_11
        :pswitch_13
        :pswitch_14
    .end packed-switch
.end method

.method public onError(II)V
    .locals 6

    const v5, 0x7f0900eb

    const/4 v4, 0x1

    const/4 v3, -0x1

    const/16 v2, 0xe

    const/4 v1, 0x0

    const/16 v0, 0xcc

    if-ne p2, v0, :cond_3

    invoke-static {p0}, Lcom/mappn/gfan/common/util/DBUtils;->getAllCardsVerification(Landroid/content/Context;)Lcom/mappn/gfan/common/vo/CardsVerifications;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardVerifications:Lcom/mappn/gfan/common/vo/CardsVerifications;

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardVerifications:Lcom/mappn/gfan/common/vo/CardsVerifications;

    invoke-virtual {v0}, Lcom/mappn/gfan/common/vo/CardsVerifications;->getCardNames()[Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getCreditCardVersion()I

    move-result v0

    if-le v0, v3, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/Session;->setCreditCardVersion(I)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->requestData()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0, v5}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, v4}, Lcom/mappn/gfan/ui/PayMainActivity;->showHint(Ljava/lang/String;Z)V

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->showListView()V

    goto :goto_0

    :cond_3
    packed-switch p1, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    :pswitch_1
    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0xf

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto :goto_0

    :pswitch_3
    const/16 v0, 0xe0

    if-ne p2, v0, :cond_5

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isOutTime()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->requestQuery()V

    goto :goto_0

    :cond_4
    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mIsOnPause:Z

    if-nez v0, :cond_0

    const/16 v0, 0xd

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto :goto_0

    :cond_5
    const/16 v0, 0xdd

    if-ne p2, v0, :cond_6

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mIsOnPause:Z

    if-nez v0, :cond_0

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto :goto_0

    :cond_6
    const/16 v0, 0xdf

    if-ne p2, v0, :cond_7

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mIsOnPause:Z

    if-nez v0, :cond_0

    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto :goto_0

    :cond_7
    const/16 v0, 0xdc

    if-ne p2, v0, :cond_8

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mIsOnPause:Z

    if-nez v0, :cond_0

    const/16 v0, 0x12

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto/16 :goto_0

    :cond_8
    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mIsOnPause:Z

    if-nez v0, :cond_0

    const/16 v0, 0xc

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto/16 :goto_0

    :pswitch_4
    invoke-virtual {p0, v5}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, v4}, Lcom/mappn/gfan/ui/PayMainActivity;->showHint(Ljava/lang/String;Z)V

    goto/16 :goto_0

    :pswitch_5
    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto/16 :goto_0

    :pswitch_6
    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x15
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_6
        :pswitch_5
    .end packed-switch
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onPause()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mIsOnPause:Z

    return-void
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/mappn/gfan/common/widget/BaseActivity;->onPrepareDialog(ILandroid/app/Dialog;)V

    invoke-virtual {p2}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    return-void
.end method

.method public onProgressDialogCancel(I)V
    .locals 0

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onResume()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mIsOnPause:Z

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 7

    const/16 v1, 0x9

    const/4 v3, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    packed-switch p1, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    check-cast p2, Ljava/lang/String;

    iput-object p2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mOrderID:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->lastTime:J

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->requestQuery()V

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0, v5}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto :goto_0

    :pswitch_3
    check-cast p2, Lcom/mappn/gfan/common/vo/CardsVerifications;

    iput-object p2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardVerifications:Lcom/mappn/gfan/common/vo/CardsVerifications;

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardVerifications:Lcom/mappn/gfan/common/vo/CardsVerifications;

    if-nez v0, :cond_1

    const v0, 0x7f0900eb

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, v6}, Lcom/mappn/gfan/ui/PayMainActivity;->showHint(Ljava/lang/String;Z)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mSession:Lcom/mappn/gfan/Session;

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardVerifications:Lcom/mappn/gfan/common/vo/CardsVerifications;

    iget v1, v1, Lcom/mappn/gfan/common/vo/CardsVerifications;->version:I

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/Session;->setCreditCardVersion(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardVerifications:Lcom/mappn/gfan/common/vo/CardsVerifications;

    iget-object v0, v0, Lcom/mappn/gfan/common/vo/CardsVerifications;->cards:Ljava/util/List;

    invoke-static {p0, v0}, Lcom/mappn/gfan/common/util/DBUtils;->updataCardsVerification(Landroid/content/Context;Ljava/util/List;)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->showListView()V

    goto :goto_0

    :pswitch_4
    invoke-virtual {p0, v5}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    check-cast p2, Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v2, "balance"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const v0, 0x7f0c0066

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f0900f3

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v4}, Lcom/mappn/gfan/Session;->getUserName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v3, v6

    invoke-virtual {p0, v2, v3}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :pswitch_5
    :try_start_0
    check-cast p2, Lorg/json/JSONObject;

    const-string v0, "resultCode"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    if-ne v6, v0, :cond_2

    const-string v0, "alipayParam"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "orderNo"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mOrderID:Ljava/lang/String;

    new-instance v1, Lcom/mappn/gfan/common/util/MobileSecurePayer;

    invoke-direct {v1}, Lcom/mappn/gfan/common/util/MobileSecurePayer;-><init>()V

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v2, v3, p0}, Lcom/mappn/gfan/common/util/MobileSecurePayer;->pay(Ljava/lang/String;Landroid/os/Handler;ILandroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_0 .. :try_end_0} :catch_2

    goto/16 :goto_0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V
    :try_end_1
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    :catch_1
    move-exception v0

    goto/16 :goto_0

    :cond_2
    const/4 v0, 0x0

    :try_start_2
    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0

    :catch_2
    move-exception v0

    goto/16 :goto_0

    :pswitch_6
    check-cast p2, Lorg/json/JSONObject;

    :try_start_3
    const-string v0, "resultCode"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    if-ne v3, v0, :cond_4

    invoke-direct {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isOutTime()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    const/16 v0, 0xd

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_3 .. :try_end_3} :catch_5

    goto/16 :goto_0

    :catch_3
    move-exception v0

    const/4 v0, 0x0

    :try_start_4
    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V
    :try_end_4
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_4 .. :try_end_4} :catch_4

    goto/16 :goto_0

    :catch_4
    move-exception v0

    goto/16 :goto_0

    :cond_3
    :try_start_5
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/mappn/gfan/ui/PayMainActivity$3;

    invoke-direct {v1, p0}, Lcom/mappn/gfan/ui/PayMainActivity$3;-><init>(Lcom/mappn/gfan/ui/PayMainActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    :catch_5
    move-exception v0

    goto/16 :goto_0

    :cond_4
    if-ne v6, v0, :cond_5

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    const/16 v0, 0x9

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto/16 :goto_0

    :cond_5
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->removeDialog(I)V

    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_5 .. :try_end_5} :catch_5

    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x15
        :pswitch_4
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public onWarningDialogCancel(I)V
    .locals 0

    return-void
.end method

.method public onWarningDialogOK(I)V
    .locals 1

    packed-switch p1, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardNumberEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardPasswordEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    goto :goto_0

    :pswitch_3
    invoke-direct {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->requestCharge()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->showDialog(I)V

    goto :goto_0

    :pswitch_4
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardNumberEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    goto :goto_0

    :pswitch_5
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardNumberEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    goto :goto_0

    :pswitch_6
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardNumberEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    goto :goto_0

    :pswitch_7
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardNumberEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    goto :goto_0

    :pswitch_8
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity;->mCardPasswordEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    goto :goto_0

    :pswitch_9
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PayMainActivity;->finish()V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_9
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method
