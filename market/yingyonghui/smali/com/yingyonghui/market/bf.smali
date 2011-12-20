.class final Lcom/yingyonghui/market/bf;
.super Ljava/lang/Object;
.source "ActivityGridCategory.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/model/k;

.field private synthetic b:I

.field private synthetic c:Lcom/yingyonghui/market/dq;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/dq;Lcom/yingyonghui/market/model/k;I)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 205
    iput-object p1, p0, Lcom/yingyonghui/market/bf;->c:Lcom/yingyonghui/market/dq;

    iput-object p2, p0, Lcom/yingyonghui/market/bf;->a:Lcom/yingyonghui/market/model/k;

    iput p3, p0, Lcom/yingyonghui/market/bf;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 5
    .parameter

    .prologue
    .line 208
    iget-object v0, p0, Lcom/yingyonghui/market/bf;->a:Lcom/yingyonghui/market/model/k;

    iget-object v0, v0, Lcom/yingyonghui/market/model/k;->b:Ljava/lang/String;

    .line 209
    iget-object v1, p0, Lcom/yingyonghui/market/bf;->a:Lcom/yingyonghui/market/model/k;

    iget v1, v1, Lcom/yingyonghui/market/model/k;->a:I

    .line 210
    iget-object v2, p0, Lcom/yingyonghui/market/bf;->c:Lcom/yingyonghui/market/dq;

    iget-object v2, v2, Lcom/yingyonghui/market/dq;->a:Lcom/yingyonghui/market/ActivityGridCategory;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityGridCategory;->a(Lcom/yingyonghui/market/ActivityGridCategory;)I

    move-result v2

    const/16 v3, 0x8

    if-ne v2, v3, :cond_0

    .line 211
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 212
    iget-object v3, p0, Lcom/yingyonghui/market/bf;->c:Lcom/yingyonghui/market/dq;

    iget-object v3, v3, Lcom/yingyonghui/market/dq;->a:Lcom/yingyonghui/market/ActivityGridCategory;

    const-class v4, Lcom/yingyonghui/market/ActivityListAppRecommend;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 213
    const-string v3, "_id"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 214
    const-string v3, "label"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 215
    iget-object v0, p0, Lcom/yingyonghui/market/bf;->c:Lcom/yingyonghui/market/dq;

    iget-object v0, v0, Lcom/yingyonghui/market/dq;->a:Lcom/yingyonghui/market/ActivityGridCategory;

    invoke-virtual {v0, v2}, Lcom/yingyonghui/market/ActivityGridCategory;->startActivity(Landroid/content/Intent;)V

    .line 224
    :goto_0
    iget-object v0, p0, Lcom/yingyonghui/market/bf;->c:Lcom/yingyonghui/market/dq;

    iget-object v0, v0, Lcom/yingyonghui/market/dq;->a:Lcom/yingyonghui/market/ActivityGridCategory;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivityGridCategory;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Lcom/yingyonghui/market/bf;->c:Lcom/yingyonghui/market/dq;

    iget-object v2, v2, Lcom/yingyonghui/market/dq;->a:Lcom/yingyonghui/market/ActivityGridCategory;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityGridCategory;->b(Lcom/yingyonghui/market/ActivityGridCategory;)Lcom/yingyonghui/market/log/m;

    move-result-object v2

    const-string v3, ""

    iget v4, p0, Lcom/yingyonghui/market/bf;->b:I

    invoke-static {v0, v2, v3, v4, v1}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/lang/String;II)V

    .line 225
    return-void

    .line 217
    :cond_0
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 218
    iget-object v3, p0, Lcom/yingyonghui/market/bf;->c:Lcom/yingyonghui/market/dq;

    iget-object v3, v3, Lcom/yingyonghui/market/dq;->a:Lcom/yingyonghui/market/ActivityGridCategory;

    const-class v4, Lcom/yingyonghui/market/ActivityListCategoryInner;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 219
    const-string v3, "_id"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 220
    const-string v3, "label"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 221
    iget-object v0, p0, Lcom/yingyonghui/market/bf;->c:Lcom/yingyonghui/market/dq;

    iget-object v0, v0, Lcom/yingyonghui/market/dq;->a:Lcom/yingyonghui/market/ActivityGridCategory;

    invoke-virtual {v0, v2}, Lcom/yingyonghui/market/ActivityGridCategory;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
