.class public Lcom/mappn/gfan/ui/RegisterActivity;
.super Lcom/mappn/gfan/common/widget/BaseActivity;

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnFocusChangeListener;
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;


# static fields
.field private static final DIALOG_REGISTERING:I = 0x0

.field public static final EMAIL_ADDRESS_PATTERN:Ljava/util/regex/Pattern; = null

.field private static final ERROR_CODE_EMAIL_EXIST:I = 0xd8

.field private static final ERROR_CODE_EMAIL_INVALID_FORMAT:I = 0xd7

.field private static final ERROR_CODE_PASSWORD_INVALID:I = 0xd9

.field private static final ERROR_CODE_USERNAME_EXIST:I = 0xd6

.field private static final ERROR_CODE_USERNAME_INVALID:I = 0xd5


# instance fields
.field private etEmail:Landroid/widget/EditText;

.field private etPassword:Landroid/widget/EditText;

.field private etPassword2:Landroid/widget/EditText;

.field private etUsername:Landroid/widget/EditText;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "[a-zA-Z0-9\\+\\.\\_\\%\\-]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/mappn/gfan/ui/RegisterActivity;->EMAIL_ADDRESS_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;-><init>()V

    return-void
.end method

.method private checkEmail()Z
    .locals 5

    const/4 v4, 0x0

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etEmail:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etEmail:Landroid/widget/EditText;

    const v1, 0x7f09001a

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/RegisterActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    move v0, v3

    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etEmail:Landroid/widget/EditText;

    invoke-virtual {v1, v4}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x6

    if-lt v1, v2, :cond_1

    const/16 v2, 0x20

    if-le v1, v2, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etEmail:Landroid/widget/EditText;

    const v1, 0x7f09001c

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/RegisterActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    move v0, v3

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etEmail:Landroid/widget/EditText;

    invoke-virtual {v1, v4}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    sget-object v1, Lcom/mappn/gfan/ui/RegisterActivity;->EMAIL_ADDRESS_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etEmail:Landroid/widget/EditText;

    const v1, 0x7f09001b

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/RegisterActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    move v0, v3

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etEmail:Landroid/widget/EditText;

    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    const/4 v0, 0x1

    goto :goto_0
.end method

.method private checkPassword(Landroid/widget/EditText;)Z
    .locals 4

    const/4 v3, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const v0, 0x7f09001d

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    move v0, v2

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1, v3}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x10

    if-le v0, v1, :cond_1

    const v0, 0x7f09001e

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    move v0, v2

    goto :goto_0

    :cond_1
    invoke-virtual {p1, v3}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    const/4 v0, 0x1

    goto :goto_0
.end method

.method private checkPasswordSame()Z
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etPassword:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etPassword2:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etPassword2:Landroid/widget/EditText;

    const v1, 0x7f09001f

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/RegisterActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etPassword2:Landroid/widget/EditText;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    const/4 v0, 0x1

    goto :goto_0
.end method

.method private checkUserName()Z
    .locals 4

    const/4 v3, 0x0

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etUsername:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etUsername:Landroid/widget/EditText;

    const v1, 0x7f090018

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/RegisterActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    move v0, v2

    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etUsername:Landroid/widget/EditText;

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :try_start_0
    const-string v1, "UTF8"

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    array-length v0, v0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    const/4 v1, 0x3

    if-lt v0, v1, :cond_2

    const/16 v1, 0xf

    if-le v0, v1, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etUsername:Landroid/widget/EditText;

    const v1, 0x7f090019

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/RegisterActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    move v0, v2

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    move v0, v2

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etUsername:Landroid/widget/EditText;

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    const/4 v0, 0x1

    goto :goto_0
.end method

.method private initView()V
    .locals 7

    const/4 v2, 0x1

    const/4 v6, 0x0

    new-array v0, v2, [Landroid/view/View;

    const v1, 0x7f0c009e

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/RegisterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    aput-object v1, v0, v6

    new-array v1, v2, [I

    aput v6, v1, v6

    const v2, 0x7f090010

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/RegisterActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v0, v1, v2}, Lcom/mappn/gfan/common/util/TopBar;->createTopBar(Landroid/content/Context;[Landroid/view/View;[ILjava/lang/String;)V

    const v0, 0x7f0c0024

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etUsername:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etUsername:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etUsername:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    const v0, 0x7f0c0034

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etEmail:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etEmail:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    const v0, 0x7f0c0025

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etPassword:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etPassword:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    const v0, 0x7f0c0035

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etPassword2:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etPassword2:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    const v0, 0x7f0c0026

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0c0036

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    new-instance v2, Landroid/text/SpannableString;

    invoke-direct {v2, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    new-instance v3, Landroid/text/style/UnderlineSpan;

    invoke-direct {v3}, Landroid/text/style/UnderlineSpan;-><init>()V

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    const/4 v5, 0x4

    sub-int/2addr v4, v5

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-virtual {v2, v3, v4, v1, v6}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private onClickRegister()V
    .locals 4

    invoke-direct {p0}, Lcom/mappn/gfan/ui/RegisterActivity;->checkUserName()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/RegisterActivity;->checkEmail()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etPassword:Landroid/widget/EditText;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->checkPassword(Landroid/widget/EditText;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etPassword2:Landroid/widget/EditText;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->checkPassword(Landroid/widget/EditText;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/RegisterActivity;->checkPasswordSame()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etUsername:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etPassword:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etEmail:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RegisterActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, p0, v0, v1, v2}, Lcom/mappn/gfan/common/MarketAPI;->register(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RegisterActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->showDialog(I)V

    :cond_0
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :goto_0
    return-void

    :sswitch_0
    invoke-direct {p0}, Lcom/mappn/gfan/ui/RegisterActivity;->onClickRegister()V

    goto :goto_0

    :sswitch_1
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RegisterActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/LoginActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RegisterActivity;->finish()V

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x7f0c0026 -> :sswitch_0
        0x7f0c0036 -> :sswitch_1
    .end sparse-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f030024

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->setContentView(I)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/RegisterActivity;->initView()V

    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    const v1, 0x7f090012

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/RegisterActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    const/4 v0, 0x0

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onDestroy()V

    iput-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etUsername:Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etEmail:Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etPassword:Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etPassword2:Landroid/widget/EditText;

    return-void
.end method

.method public onError(II)V
    .locals 3

    const/4 v2, 0x0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->dismissDialog(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    packed-switch p2, :pswitch_data_0

    const v0, 0x7f090025

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RegisterActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0, v2}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    return-void

    :pswitch_0
    const v0, 0x7f090020

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :pswitch_1
    const v0, 0x7f090021

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :pswitch_2
    const v0, 0x7f090022

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :pswitch_3
    const v0, 0x7f090023

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :pswitch_4
    const v0, 0x7f090024

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0xd5
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public onFocusChange(Landroid/view/View;Z)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_0
    :goto_0
    return-void

    :sswitch_0
    if-nez p2, :cond_0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/RegisterActivity;->checkUserName()Z

    goto :goto_0

    :sswitch_1
    if-nez p2, :cond_0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/RegisterActivity;->checkEmail()Z

    goto :goto_0

    :sswitch_2
    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etPassword:Landroid/widget/EditText;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->checkPassword(Landroid/widget/EditText;)Z

    goto :goto_0

    :sswitch_3
    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->etPassword2:Landroid/widget/EditText;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->checkPassword(Landroid/widget/EditText;)Z

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        0x7f0c0024 -> :sswitch_0
        0x7f0c0025 -> :sswitch_2
        0x7f0c0034 -> :sswitch_1
        0x7f0c0035 -> :sswitch_3
    .end sparse-switch
.end method

.method protected onPause()V
    .locals 0

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onPause()V

    invoke-static {p0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

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

.method protected onResume()V
    .locals 0

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onResume()V

    invoke-static {p0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->dismissDialog(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RegisterActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f090011

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/RegisterActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v3}, Lcom/mappn/gfan/common/util/Utils;->makeEventToast(Landroid/content/Context;Ljava/lang/String;Z)V

    check-cast p2, Ljava/util/HashMap;

    iget-object v1, p0, Lcom/mappn/gfan/ui/RegisterActivity;->mSession:Lcom/mappn/gfan/Session;

    const-string v0, "uid"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/Session;->setUid(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/RegisterActivity;->mSession:Lcom/mappn/gfan/Session;

    const-string v0, "name"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/Session;->setUserName(Ljava/lang/String;)V

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/RegisterActivity;->setResult(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/RegisterActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0, v4}, Lcom/mappn/gfan/Session;->setLogin(Z)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RegisterActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u4e2a\u4eba\u4e2d\u5fc3"

    aput-object v2, v1, v3

    const-string v2, "\u6ce8\u518c\u6210\u529f"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/RegisterActivity;->finish()V

    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method
