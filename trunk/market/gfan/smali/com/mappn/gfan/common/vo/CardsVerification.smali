.class public Lcom/mappn/gfan/common/vo/CardsVerification;
.super Ljava/lang/Object;


# instance fields
.field public accountNum:I

.field public credit:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public passwordNum:I

.field public pay_type:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAddToDatabase(Landroid/content/ContentValues;)V
    .locals 2

    const-string v0, "card_name"

    iget-object v1, p0, Lcom/mappn/gfan/common/vo/CardsVerification;->name:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "card_pay_type"

    iget-object v1, p0, Lcom/mappn/gfan/common/vo/CardsVerification;->pay_type:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "card_account_num"

    iget v1, p0, Lcom/mappn/gfan/common/vo/CardsVerification;->accountNum:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "card_password_num"

    iget v1, p0, Lcom/mappn/gfan/common/vo/CardsVerification;->passwordNum:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "card_credit"

    iget-object v1, p0, Lcom/mappn/gfan/common/vo/CardsVerification;->credit:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
