.class public Lcom/mappn/gfan/common/util/DialogUtil;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/common/util/DialogUtil$RatingDialogListener;,
        Lcom/mappn/gfan/common/util/DialogUtil$ListDialogListener2;,
        Lcom/mappn/gfan/common/util/DialogUtil$ListDIalogListener;,
        Lcom/mappn/gfan/common/util/DialogUtil$ListCheckboxDialogListener;,
        Lcom/mappn/gfan/common/util/DialogUtil$RegisterDialogListener;,
        Lcom/mappn/gfan/common/util/DialogUtil$UserPwdDialogListener;,
        Lcom/mappn/gfan/common/util/DialogUtil$EditTextDialogListener;,
        Lcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;,
        Lcom/mappn/gfan/common/util/DialogUtil$InfoDialogListener;,
        Lcom/mappn/gfan/common/util/DialogUtil$CheckBoxWarningDialogListener;,
        Lcom/mappn/gfan/common/util/DialogUtil$YesNoDialogListener;,
        Lcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;,
        Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;
    }
.end annotation


# static fields
.field private static mItemIds:[I

.field private static mRating:I

.field private static mWhich:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()[I
    .locals 1

    sget-object v0, Lcom/mappn/gfan/common/util/DialogUtil;->mItemIds:[I

    return-object v0
.end method

.method static synthetic access$100()I
    .locals 1

    sget v0, Lcom/mappn/gfan/common/util/DialogUtil;->mWhich:I

    return v0
.end method

.method static synthetic access$102(I)I
    .locals 0

    sput p0, Lcom/mappn/gfan/common/util/DialogUtil;->mWhich:I

    return p0
.end method

.method static synthetic access$200()I
    .locals 1

    sget v0, Lcom/mappn/gfan/common/util/DialogUtil;->mRating:I

    return v0
.end method

.method static synthetic access$202(I)I
    .locals 0

    sput p0, Lcom/mappn/gfan/common/util/DialogUtil;->mRating:I

    return p0
.end method

.method public static createBigInputDialog(Landroid/content/Context;IILcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;)Landroid/app/Dialog;
    .locals 4

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03002c

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const v0, 0x7f0c0041

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, p2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f09007c

    new-instance v3, Lcom/mappn/gfan/common/util/DialogUtil$39;

    invoke-direct {v3, v0, p0, p1, p3}, Lcom/mappn/gfan/common/util/DialogUtil$39;-><init>(Landroid/widget/EditText;Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007b

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$38;

    invoke-direct {v2, p0, p1, p3}, Lcom/mappn/gfan/common/util/DialogUtil$38;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public static createComfirmDownloadDialog(Landroid/content/Context;ZLcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;
    .locals 4

    const v3, 0x7f09007f

    const v2, 0x7f09007e

    const v1, 0x7f09007d

    if-eqz p1, :cond_0

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f090088

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$46;

    invoke-direct {v1, p0, p2}, Lcom/mappn/gfan/common/util/DialogUtil$46;-><init>(Landroid/content/Context;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)V

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$45;

    invoke-direct {v1, p0}, Lcom/mappn/gfan/common/util/DialogUtil$45;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v3, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f090089

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$48;

    invoke-direct {v1, p0, p2}, Lcom/mappn/gfan/common/util/DialogUtil$48;-><init>(Landroid/content/Context;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)V

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$47;

    invoke-direct {v1, p0}, Lcom/mappn/gfan/common/util/DialogUtil$47;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v3, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto :goto_0
.end method

.method public static createDeterminateProgressDialog(Landroid/content/Context;ILjava/lang/String;ZLcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;)Landroid/app/ProgressDialog;
    .locals 3

    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    const v1, 0x108009b

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIcon(I)V

    invoke-virtual {v0, p2}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    if-eqz p3, :cond_0

    const v1, 0x7f09007b

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$6;

    invoke-direct {v2, p0, p1, p4}, Lcom/mappn/gfan/common/util/DialogUtil$6;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/ProgressDialog;->setButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$7;

    invoke-direct {v1, p0, p1, p4}, Lcom/mappn/gfan/common/util/DialogUtil$7;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;)V

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    :cond_0
    if-nez p3, :cond_1

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$8;

    invoke-direct {v1, p0, p1}, Lcom/mappn/gfan/common/util/DialogUtil$8;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    :cond_1
    return-object v0
.end method

.method public static createIndeterminateProgressDialog(Landroid/content/Context;ILjava/lang/String;ZLcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;)Landroid/app/Dialog;
    .locals 3

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03002d

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    if-nez p2, :cond_0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Must provide a hint string for input dialog"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    const v0, 0x7f0c003f

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    if-eqz p3, :cond_1

    const v1, 0x7f09007b

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$11;

    invoke-direct {v2, p0, p1, p4}, Lcom/mappn/gfan/common/util/DialogUtil$11;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$12;

    invoke-direct {v1, p0, p1, p4}, Lcom/mappn/gfan/common/util/DialogUtil$12;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    :cond_1
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    if-nez p3, :cond_2

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$13;

    invoke-direct {v1, p0, p1}, Lcom/mappn/gfan/common/util/DialogUtil$13;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    :cond_2
    return-object v0
.end method

.method public static createIndeterminateProgressWhiteTextDialog(Landroid/content/Context;ILjava/lang/String;Z)Landroid/app/Dialog;
    .locals 3

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03002d

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    if-nez p2, :cond_0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Must provide a hint string for input dialog"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    const v0, 0x7f0c003f

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public static createIndeterminateProgressWhiteTextDialog(Landroid/content/Context;ILjava/lang/String;ZLcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;)Landroid/app/Dialog;
    .locals 3

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03002d

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    if-nez p2, :cond_0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Must provide a hint string for input dialog"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    const v0, 0x7f0c003f

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    if-eqz p3, :cond_1

    const v1, 0x7f09007b

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$40;

    invoke-direct {v2, p0, p1, p4}, Lcom/mappn/gfan/common/util/DialogUtil$40;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$41;

    invoke-direct {v1, p0, p1, p4}, Lcom/mappn/gfan/common/util/DialogUtil$41;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$ProgressDialogListener;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    :cond_1
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    if-nez p3, :cond_2

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$42;

    invoke-direct {v1, p0, p1}, Lcom/mappn/gfan/common/util/DialogUtil$42;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    :cond_2
    return-object v0
.end method

.method public static createInfoDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$InfoDialogListener;)Landroid/app/Dialog;
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x108009b

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f090080

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007c

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$18;

    invoke-direct {v2, p0, p1, p3}, Lcom/mappn/gfan/common/util/DialogUtil$18;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$InfoDialogListener;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$17;

    invoke-direct {v1, p0, p1, p3}, Lcom/mappn/gfan/common/util/DialogUtil$17;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$InfoDialogListener;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public static createInputDialog(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;)Landroid/app/Dialog;
    .locals 4

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03002f

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    if-nez p2, :cond_0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Must provide a hint string for input dialog"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    const v0, 0x7f0c003f

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    const v0, 0x7f0c0041

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    if-eqz p3, :cond_1

    invoke-virtual {v0, p3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    if-eqz p5, :cond_2

    invoke-virtual {v0, p5}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    :cond_2
    if-eqz p6, :cond_3

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    :cond_3
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x1080027

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, p4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f09007c

    new-instance v3, Lcom/mappn/gfan/common/util/DialogUtil$33;

    invoke-direct {v3, v0, p0, p1, p7}, Lcom/mappn/gfan/common/util/DialogUtil$33;-><init>(Landroid/widget/EditText;Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007b

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$32;

    invoke-direct {v2, p0, p1, p7}, Lcom/mappn/gfan/common/util/DialogUtil$32;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$31;

    invoke-direct {v1, p0, p1, p7}, Lcom/mappn/gfan/common/util/DialogUtil$31;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public static createInputDialog(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;ZLcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;)Landroid/app/Dialog;
    .locals 4

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03002f

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    if-nez p2, :cond_0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Must provide a hint string for input dialog"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    const v0, 0x7f0c003f

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0c0041

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    if-eqz p3, :cond_1

    invoke-virtual {v0, p3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    if-eqz p4, :cond_2

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    :cond_2
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x1080027

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f090084

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f09007c

    new-instance v3, Lcom/mappn/gfan/common/util/DialogUtil$30;

    invoke-direct {v3, v0, p0, p1, p5}, Lcom/mappn/gfan/common/util/DialogUtil$30;-><init>(Landroid/widget/EditText;Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007b

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$29;

    invoke-direct {v2, p0, p1, p5}, Lcom/mappn/gfan/common/util/DialogUtil$29;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$28;

    invoke-direct {v1, p0, p1, p5}, Lcom/mappn/gfan/common/util/DialogUtil$28;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$InputDialogListener;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public static createListCheckboxDialog(Landroid/content/Context;I[Ljava/lang/CharSequence;ILcom/mappn/gfan/common/util/DialogUtil$ListCheckboxDialogListener;)Landroid/app/Dialog;
    .locals 6

    const/4 v3, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move v4, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/mappn/gfan/common/util/DialogUtil;->createListCheckboxDialog(Landroid/content/Context;I[Ljava/lang/CharSequence;[IILcom/mappn/gfan/common/util/DialogUtil$ListCheckboxDialogListener;)Landroid/app/Dialog;

    move-result-object v0

    return-object v0
.end method

.method public static createListCheckboxDialog(Landroid/content/Context;I[Ljava/lang/CharSequence;[IILcom/mappn/gfan/common/util/DialogUtil$ListCheckboxDialogListener;)Landroid/app/Dialog;
    .locals 4

    sput p4, Lcom/mappn/gfan/common/util/DialogUtil;->mWhich:I

    if-eqz p3, :cond_0

    array-length v0, p3

    array-length v1, p2

    if-lt v0, v1, :cond_0

    sput-object p3, Lcom/mappn/gfan/common/util/DialogUtil;->mItemIds:[I

    :goto_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$23;

    invoke-direct {v1, p0, p1, p5, p2}, Lcom/mappn/gfan/common/util/DialogUtil$23;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$ListCheckboxDialogListener;[Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, -0x1

    if-ne p4, v1, :cond_1

    new-instance v1, Landroid/widget/ArrayAdapter;

    const v2, 0x7f030049

    invoke-direct {v1, p0, v2, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$24;

    invoke-direct {v2, p0, p1, p5, p2}, Lcom/mappn/gfan/common/util/DialogUtil$24;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$ListCheckboxDialogListener;[Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    :goto_1
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lcom/mappn/gfan/common/util/DialogUtil;->mItemIds:[I

    goto :goto_0

    :cond_1
    new-instance v1, Landroid/widget/ArrayAdapter;

    const v2, 0x7f030048

    const v3, 0x7f0c0073

    invoke-direct {v1, p0, v2, v3, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;II[Ljava/lang/Object;)V

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$27;

    invoke-direct {v2}, Lcom/mappn/gfan/common/util/DialogUtil$27;-><init>()V

    invoke-virtual {v0, v1, p4, v2}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(Landroid/widget/ListAdapter;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f09007c

    new-instance v3, Lcom/mappn/gfan/common/util/DialogUtil$26;

    invoke-direct {v3, p0, p1, p5, p2}, Lcom/mappn/gfan/common/util/DialogUtil$26;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$ListCheckboxDialogListener;[Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f09007b

    new-instance v3, Lcom/mappn/gfan/common/util/DialogUtil$25;

    invoke-direct {v3, p0, p1, p5, p2}, Lcom/mappn/gfan/common/util/DialogUtil$25;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$ListCheckboxDialogListener;[Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_1
.end method

.method public static createListDialog(Landroid/content/Context;IILcom/mappn/gfan/common/util/DialogUtil$ListDIalogListener;)Landroid/app/Dialog;
    .locals 2

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$22;

    invoke-direct {v1, p0, p1, p3}, Lcom/mappn/gfan/common/util/DialogUtil$22;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$ListDIalogListener;)V

    invoke-virtual {v0, p2, v1}, Landroid/app/AlertDialog$Builder;->setItems(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public static createOKWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007d

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007c

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$10;

    invoke-direct {v2, p0, p1, p3}, Lcom/mappn/gfan/common/util/DialogUtil$10;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$9;

    invoke-direct {v1, p0, p1, p3}, Lcom/mappn/gfan/common/util/DialogUtil$9;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public static createRatingDialog(Landroid/content/Context;IIILcom/mappn/gfan/common/util/DialogUtil$RatingDialogListener;)Landroid/app/Dialog;
    .locals 7

    const/4 v6, 0x1

    const/4 v5, 0x0

    sput p2, Lcom/mappn/gfan/common/util/DialogUtil;->mRating:I

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03002e

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    const v0, 0x7f0c0042

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f09008a

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {p0, v1, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0c0044

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v3, 0x7f06

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    sget v3, Lcom/mappn/gfan/common/util/DialogUtil;->mRating:I

    sub-int/2addr v3, v6

    aget-object v1, v1, v3

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, 0x7f0c0043

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RatingBar;

    int-to-float v3, p2

    invoke-virtual {v1, v3}, Landroid/widget/RatingBar;->setRating(F)V

    new-instance v3, Lcom/mappn/gfan/common/util/DialogUtil$34;

    invoke-direct {v3, v0, p0}, Lcom/mappn/gfan/common/util/DialogUtil$34;-><init>(Landroid/widget/TextView;Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/widget/RatingBar;->setOnRatingBarChangeListener(Landroid/widget/RatingBar$OnRatingBarChangeListener;)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f09008b

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    const v1, 0x7f09007c

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$37;

    invoke-direct {v2, p0, p1, p4}, Lcom/mappn/gfan/common/util/DialogUtil$37;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$RatingDialogListener;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f09007b

    new-instance v3, Lcom/mappn/gfan/common/util/DialogUtil$36;

    invoke-direct {v3, p0, p1, p4}, Lcom/mappn/gfan/common/util/DialogUtil$36;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$RatingDialogListener;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$35;

    invoke-direct {v2, p0, p1, p4}, Lcom/mappn/gfan/common/util/DialogUtil$35;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$RatingDialogListener;)V

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public static createShowHintOKDialog(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)Landroid/app/Dialog;
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007c

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$21;

    invoke-direct {v2, p0, p1}, Lcom/mappn/gfan/common/util/DialogUtil$21;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public static createYesNo2TVDialog(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;
    .locals 4

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03002b

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    const v0, 0x7f0c003f

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f0c0040

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const/4 v3, -0x1

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v0, -0x1

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007d

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007e

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$44;

    invoke-direct {v2, p0, p1, p4}, Lcom/mappn/gfan/common/util/DialogUtil$44;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007f

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$43;

    invoke-direct {v2, p0, p1, p4}, Lcom/mappn/gfan/common/util/DialogUtil$43;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public static createYesNoDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$YesNoDialogListener;)Landroid/app/Dialog;
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f020006

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007e

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$20;

    invoke-direct {v2, p0, p1, p3}, Lcom/mappn/gfan/common/util/DialogUtil$20;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$YesNoDialogListener;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007f

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$19;

    invoke-direct {v2, p0, p1, p3}, Lcom/mappn/gfan/common/util/DialogUtil$19;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$YesNoDialogListener;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public static createYesNoWarningDialog(Landroid/content/Context;ILjava/lang/String;Lcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)Landroid/app/Dialog;
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f09007d

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007e

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$16;

    invoke-direct {v2, p0, p1, p3}, Lcom/mappn/gfan/common/util/DialogUtil$16;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007f

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$15;

    invoke-direct {v2, p0, p1, p3}, Lcom/mappn/gfan/common/util/DialogUtil$15;-><init>(Landroid/content/Context;ILcom/mappn/gfan/common/util/DialogUtil$WarningDialogListener;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$14;

    invoke-direct {v1, p0, p1}, Lcom/mappn/gfan/common/util/DialogUtil$14;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public static newEnsurePurchaseDialog(Lcom/mappn/gfan/ui/ProductDetailActivity;ILjava/lang/String;)Landroid/app/Dialog;
    .locals 5

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03002f

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    if-nez p2, :cond_0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Must provide a hint string for input dialog"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    const v0, 0x7f0c003f

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f0c0041

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x1080027

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f090084

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v3, 0x7f09007c

    new-instance v4, Lcom/mappn/gfan/common/util/DialogUtil$2;

    invoke-direct {v4, v0, p0, p1}, Lcom/mappn/gfan/common/util/DialogUtil$2;-><init>(Landroid/widget/EditText;Lcom/mappn/gfan/ui/ProductDetailActivity;I)V

    invoke-virtual {v1, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$1;

    invoke-direct {v1, p0, p1}, Lcom/mappn/gfan/common/util/DialogUtil$1;-><init>(Lcom/mappn/gfan/ui/ProductDetailActivity;I)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public static newInsufficientBalanceDialog(Lcom/mappn/gfan/ui/ProductDetailActivity;ILjava/lang/String;)Landroid/app/Dialog;
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f09007d

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007e

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$5;

    invoke-direct {v2, p0, p1}, Lcom/mappn/gfan/common/util/DialogUtil$5;-><init>(Lcom/mappn/gfan/ui/ProductDetailActivity;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007f

    new-instance v2, Lcom/mappn/gfan/common/util/DialogUtil$4;

    invoke-direct {v2, p0, p1}, Lcom/mappn/gfan/common/util/DialogUtil$4;-><init>(Lcom/mappn/gfan/ui/ProductDetailActivity;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mappn/gfan/common/util/DialogUtil$3;

    invoke-direct {v1, p0, p1}, Lcom/mappn/gfan/common/util/DialogUtil$3;-><init>(Lcom/mappn/gfan/ui/ProductDetailActivity;I)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method
