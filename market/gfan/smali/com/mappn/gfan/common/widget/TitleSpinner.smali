.class public Lcom/mappn/gfan/common/widget/TitleSpinner;
.super Landroid/widget/Button;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/common/widget/TitleSpinner$DropDownAdapter;
    }
.end annotation


# instance fields
.field private adapter:Landroid/widget/SpinnerAdapter;

.field private mNextSelectedPosition:I

.field private mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

.field private mPrompt:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const/4 v0, -0x1

    iput v0, p0, Lcom/mappn/gfan/common/widget/TitleSpinner;->mNextSelectedPosition:I

    const/16 v0, 0x13

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/widget/TitleSpinner;->setGravity(I)V

    const v0, 0x1080006

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/widget/TitleSpinner;->setBackgroundResource(I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    const/4 v2, 0x0

    invoke-direct {p0, p1, p2}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, -0x1

    iput v0, p0, Lcom/mappn/gfan/common/widget/TitleSpinner;->mNextSelectedPosition:I

    const/16 v0, 0x13

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/widget/TitleSpinner;->setGravity(I)V

    const v0, 0x1080006

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/widget/TitleSpinner;->setBackgroundResource(I)V

    sget-object v0, Lcom/mappn/gfan/R$styleable;->TitleSpinner:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mappn/gfan/common/widget/TitleSpinner;->mPrompt:Ljava/lang/CharSequence;

    :cond_0
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    const/4 v2, 0x0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, -0x1

    iput v0, p0, Lcom/mappn/gfan/common/widget/TitleSpinner;->mNextSelectedPosition:I

    const/16 v0, 0x13

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/widget/TitleSpinner;->setGravity(I)V

    const v0, 0x1080006

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/widget/TitleSpinner;->setBackgroundResource(I)V

    sget-object v0, Lcom/mappn/gfan/R$styleable;->TitleSpinner:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mappn/gfan/common/widget/TitleSpinner;->mPrompt:Ljava/lang/CharSequence;

    :cond_0
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public getSelectedItemPosition()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/common/widget/TitleSpinner;->mNextSelectedPosition:I

    return v0
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    invoke-virtual {p0, p2}, Lcom/mappn/gfan/common/widget/TitleSpinner;->setSelection(I)V

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/TitleSpinner;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/TitleSpinner;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-interface {v0, p1, p2}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    :cond_0
    return-void
.end method

.method public performClick()Z
    .locals 4

    invoke-super {p0}, Landroid/widget/Button;->performClick()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/TitleSpinner;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/TitleSpinner;->mPrompt:Ljava/lang/CharSequence;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/TitleSpinner;->mPrompt:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    :cond_0
    new-instance v2, Lcom/mappn/gfan/common/widget/TitleSpinner$DropDownAdapter;

    iget-object v3, p0, Lcom/mappn/gfan/common/widget/TitleSpinner;->adapter:Landroid/widget/SpinnerAdapter;

    invoke-direct {v2, v3}, Lcom/mappn/gfan/common/widget/TitleSpinner$DropDownAdapter;-><init>(Landroid/widget/SpinnerAdapter;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/TitleSpinner;->getSelectedItemPosition()I

    move-result v3

    invoke-virtual {v1, v2, v3, p0}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(Landroid/widget/ListAdapter;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    :cond_1
    return v0
.end method

.method public setAdapter(Landroid/widget/SpinnerAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/widget/TitleSpinner;->adapter:Landroid/widget/SpinnerAdapter;

    return-void
.end method

.method public setOnClickListener(Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/widget/TitleSpinner;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    return-void
.end method

.method public setPrompt(Ljava/lang/CharSequence;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/widget/TitleSpinner;->mPrompt:Ljava/lang/CharSequence;

    return-void
.end method

.method public setSelection(I)V
    .locals 1

    iput p1, p0, Lcom/mappn/gfan/common/widget/TitleSpinner;->mNextSelectedPosition:I

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/TitleSpinner;->adapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1}, Landroid/widget/SpinnerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/widget/TitleSpinner;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
