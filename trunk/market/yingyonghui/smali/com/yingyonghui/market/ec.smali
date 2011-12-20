.class final Lcom/yingyonghui/market/ec;
.super Ljava/lang/Object;
.source "ActivityDetailAppInner.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private a:Lcom/yingyonghui/market/log/m;

.field private synthetic b:Lcom/yingyonghui/market/model/l;

.field private synthetic c:I

.field private synthetic d:Lcom/yingyonghui/market/ActivityDetailAppInner;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityDetailAppInner;Lcom/yingyonghui/market/model/l;I)V
    .locals 3
    .parameter
    .parameter
    .parameter

    .prologue
    .line 505
    iput-object p1, p0, Lcom/yingyonghui/market/ec;->d:Lcom/yingyonghui/market/ActivityDetailAppInner;

    iput-object p2, p0, Lcom/yingyonghui/market/ec;->b:Lcom/yingyonghui/market/model/l;

    iput p3, p0, Lcom/yingyonghui/market/ec;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 506
    new-instance v0, Lcom/yingyonghui/market/log/m;

    const-string v1, "Relative"

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    const-string v1, "assetId"

    iget-object v2, p0, Lcom/yingyonghui/market/ec;->d:Lcom/yingyonghui/market/ActivityDetailAppInner;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityDetailAppInner;->b(Lcom/yingyonghui/market/ActivityDetailAppInner;)Lcom/yingyonghui/market/model/j;

    move-result-object v2

    iget v2, v2, Lcom/yingyonghui/market/model/j;->e:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/yingyonghui/market/log/m;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ec;->a:Lcom/yingyonghui/market/log/m;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 5
    .parameter

    .prologue
    .line 510
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 511
    iget-object v1, p0, Lcom/yingyonghui/market/ec;->d:Lcom/yingyonghui/market/ActivityDetailAppInner;

    invoke-virtual {v1}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getParent()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 512
    const/high16 v1, 0x1000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 513
    const-string v1, "_id"

    iget-object v2, p0, Lcom/yingyonghui/market/ec;->b:Lcom/yingyonghui/market/model/l;

    iget v2, v2, Lcom/yingyonghui/market/model/l;->e:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 514
    const-string v1, "title"

    iget-object v2, p0, Lcom/yingyonghui/market/ec;->b:Lcom/yingyonghui/market/model/l;

    iget-object v2, v2, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 515
    const-string v1, "installed"

    iget-object v2, p0, Lcom/yingyonghui/market/ec;->b:Lcom/yingyonghui/market/model/l;

    iget v2, v2, Lcom/yingyonghui/market/model/l;->n:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 516
    const-string v1, "pkgName"

    iget-object v2, p0, Lcom/yingyonghui/market/ec;->b:Lcom/yingyonghui/market/model/l;

    iget-object v2, v2, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 517
    const-string v1, "size"

    iget-object v2, p0, Lcom/yingyonghui/market/ec;->b:Lcom/yingyonghui/market/model/l;

    iget v2, v2, Lcom/yingyonghui/market/model/l;->o:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 518
    const-string v1, "versionName"

    iget-object v2, p0, Lcom/yingyonghui/market/ec;->b:Lcom/yingyonghui/market/model/l;

    iget-object v2, v2, Lcom/yingyonghui/market/model/l;->q:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 519
    const-string v1, "versionCode"

    iget-object v2, p0, Lcom/yingyonghui/market/ec;->b:Lcom/yingyonghui/market/model/l;

    iget v2, v2, Lcom/yingyonghui/market/model/l;->s:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 520
    const-string v1, "lastUpdate"

    iget-object v2, p0, Lcom/yingyonghui/market/ec;->b:Lcom/yingyonghui/market/model/l;

    iget-object v2, v2, Lcom/yingyonghui/market/model/l;->r:Ljava/lang/String;

    invoke-static {v2}, Lcom/yingyonghui/market/util/l;->b(Ljava/lang/String;)J

    move-result-wide v2

    const-string v4, "yyyy-MM-dd"

    invoke-static {v2, v3, v4}, Lcom/yingyonghui/market/util/r;->a(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 521
    const-string v1, "downloadCount"

    iget-object v2, p0, Lcom/yingyonghui/market/ec;->b:Lcom/yingyonghui/market/model/l;

    iget v2, v2, Lcom/yingyonghui/market/model/l;->x:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 522
    const-string v1, "rating"

    iget-object v2, p0, Lcom/yingyonghui/market/ec;->b:Lcom/yingyonghui/market/model/l;

    iget v2, v2, Lcom/yingyonghui/market/model/l;->l:F

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    .line 523
    const-string v1, "ratingCount"

    iget-object v2, p0, Lcom/yingyonghui/market/ec;->b:Lcom/yingyonghui/market/model/l;

    iget v2, v2, Lcom/yingyonghui/market/model/l;->A:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 524
    const-string v1, "from"

    iget v2, p0, Lcom/yingyonghui/market/ec;->c:I

    iget-object v3, p0, Lcom/yingyonghui/market/ec;->a:Lcom/yingyonghui/market/log/m;

    const-string v4, "index"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/yingyonghui/market/log/m;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yingyonghui/market/log/m;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 525
    iget-object v1, p0, Lcom/yingyonghui/market/ec;->d:Lcom/yingyonghui/market/ActivityDetailAppInner;

    invoke-virtual {v1}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getParent()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 527
    iget-object v0, p0, Lcom/yingyonghui/market/ec;->d:Lcom/yingyonghui/market/ActivityDetailAppInner;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivityDetailAppInner;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ec;->a:Lcom/yingyonghui/market/log/m;

    const-string v2, ""

    iget v3, p0, Lcom/yingyonghui/market/ec;->c:I

    iget-object v4, p0, Lcom/yingyonghui/market/ec;->b:Lcom/yingyonghui/market/model/l;

    iget v4, v4, Lcom/yingyonghui/market/model/l;->e:I

    invoke-static {v0, v1, v2, v3, v4}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/lang/String;II)V

    .line 529
    return-void
.end method
