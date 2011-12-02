.class Lcom/mappn/gfan/ui/PayMainActivity$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/PayMainActivity;->showListView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/PayMainActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/PayMainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 11

    const v10, 0x7f0900da

    const/4 v9, 0x1

    const/4 v8, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    new-instance v1, Lcom/mappn/gfan/common/vo/CardInfo;

    invoke-direct {v1}, Lcom/mappn/gfan/common/vo/CardInfo;-><init>()V

    invoke-static {v0, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->access$002(Lcom/mappn/gfan/ui/PayMainActivity;Lcom/mappn/gfan/common/vo/CardInfo;)Lcom/mappn/gfan/common/vo/CardInfo;

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/PayMainActivity;->access$200(Lcom/mappn/gfan/ui/PayMainActivity;)Lcom/mappn/gfan/common/vo/CardsVerifications;

    move-result-object v0

    iget-object v0, v0, Lcom/mappn/gfan/common/vo/CardsVerifications;->cards:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/vo/CardsVerification;

    invoke-static {v1, v0}, Lcom/mappn/gfan/ui/PayMainActivity;->access$102(Lcom/mappn/gfan/ui/PayMainActivity;Lcom/mappn/gfan/common/vo/CardsVerification;)Lcom/mappn/gfan/common/vo/CardsVerification;

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/PayMainActivity;->access$100(Lcom/mappn/gfan/ui/PayMainActivity;)Lcom/mappn/gfan/common/vo/CardsVerification;

    move-result-object v0

    iget-object v0, v0, Lcom/mappn/gfan/common/vo/CardsVerification;->credit:Ljava/lang/String;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    new-array v3, v1, [I

    invoke-static {v2, v3}, Lcom/mappn/gfan/ui/PayMainActivity;->access$302(Lcom/mappn/gfan/ui/PayMainActivity;[I)[I

    new-array v2, v1, [Ljava/lang/String;

    move v3, v8

    :goto_0
    if-ge v3, v1, :cond_0

    iget-object v4, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-static {v4}, Lcom/mappn/gfan/ui/PayMainActivity;->access$300(Lcom/mappn/gfan/ui/PayMainActivity;)[I

    move-result-object v4

    aget-object v5, v0, v3

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    aput v5, v4, v3

    iget-object v4, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    const v5, 0x7f0900ea

    new-array v6, v9, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-static {v7}, Lcom/mappn/gfan/ui/PayMainActivity;->access$300(Lcom/mappn/gfan/ui/PayMainActivity;)[I

    move-result-object v7

    aget v7, v7, v3

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v4, v5, v6}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/PayMainActivity;->access$000(Lcom/mappn/gfan/ui/PayMainActivity;)Lcom/mappn/gfan/common/vo/CardInfo;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/PayMainActivity;->access$100(Lcom/mappn/gfan/ui/PayMainActivity;)Lcom/mappn/gfan/common/vo/CardsVerification;

    move-result-object v1

    iget-object v1, v1, Lcom/mappn/gfan/common/vo/CardsVerification;->pay_type:Ljava/lang/String;

    iput-object v1, v0, Lcom/mappn/gfan/common/vo/CardInfo;->payType:Ljava/lang/String;

    new-instance v0, Landroid/widget/ArrayAdapter;

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    const v3, 0x1090008

    invoke-direct {v0, v1, v3, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    const v1, 0x1090009

    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/PayMainActivity;->access$400(Lcom/mappn/gfan/ui/PayMainActivity;)Lcom/mappn/gfan/common/widget/TitleSpinner;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/mappn/gfan/common/widget/TitleSpinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/PayMainActivity;->access$400(Lcom/mappn/gfan/ui/PayMainActivity;)Lcom/mappn/gfan/common/widget/TitleSpinner;

    move-result-object v0

    new-instance v1, Lcom/mappn/gfan/ui/PayMainActivity$2$1;

    invoke-direct {v1, p0}, Lcom/mappn/gfan/ui/PayMainActivity$2$1;-><init>(Lcom/mappn/gfan/ui/PayMainActivity$2;)V

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/TitleSpinner;->setOnClickListener(Landroid/content/DialogInterface$OnClickListener;)V

    const-string v0, ""

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/PayMainActivity;->access$100(Lcom/mappn/gfan/ui/PayMainActivity;)Lcom/mappn/gfan/common/vo/CardsVerification;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    new-array v1, v9, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-static {v2}, Lcom/mappn/gfan/ui/PayMainActivity;->access$100(Lcom/mappn/gfan/ui/PayMainActivity;)Lcom/mappn/gfan/common/vo/CardsVerification;

    move-result-object v2

    iget v2, v2, Lcom/mappn/gfan/common/vo/CardsVerification;->accountNum:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v8

    invoke-virtual {v0, v10, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :cond_1
    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/PayMainActivity;->access$600(Lcom/mappn/gfan/ui/PayMainActivity;)Landroid/widget/EditText;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    const v4, 0x7f0900d0

    invoke-virtual {v3, v4}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    const-string v0, ""

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/PayMainActivity;->access$100(Lcom/mappn/gfan/ui/PayMainActivity;)Lcom/mappn/gfan/common/vo/CardsVerification;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    new-array v1, v9, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-static {v2}, Lcom/mappn/gfan/ui/PayMainActivity;->access$100(Lcom/mappn/gfan/ui/PayMainActivity;)Lcom/mappn/gfan/common/vo/CardsVerification;

    move-result-object v2

    iget v2, v2, Lcom/mappn/gfan/common/vo/CardsVerification;->passwordNum:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v8

    invoke-virtual {v0, v10, v1}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :cond_2
    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-static {v1}, Lcom/mappn/gfan/ui/PayMainActivity;->access$700(Lcom/mappn/gfan/ui/PayMainActivity;)Landroid/widget/EditText;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/mappn/gfan/ui/PayMainActivity$2;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    const v4, 0x7f0900d1

    invoke-virtual {v3, v4}, Lcom/mappn/gfan/ui/PayMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    return-void
.end method
