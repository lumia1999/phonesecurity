.class final Lcom/yingyonghui/market/cm;
.super Ljava/lang/Object;
.source "ActivityListApp.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field private a:Lcom/yingyonghui/market/log/m;

.field private synthetic b:Lcom/yingyonghui/market/ActivityListApp;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/ActivityListApp;)V
    .locals 2
    .parameter

    .prologue
    .line 772
    iput-object p1, p0, Lcom/yingyonghui/market/cm;->b:Lcom/yingyonghui/market/ActivityListApp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 770
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yingyonghui/market/cm;->a:Lcom/yingyonghui/market/log/m;

    .line 773
    new-instance v0, Lcom/yingyonghui/market/log/m;

    const-string v1, "Featured"

    invoke-direct {v0, v1}, Lcom/yingyonghui/market/log/m;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/yingyonghui/market/cm;->a:Lcom/yingyonghui/market/log/m;

    .line 774
    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 7
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 779
    iget-object v0, p0, Lcom/yingyonghui/market/cm;->b:Lcom/yingyonghui/market/ActivityListApp;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListApp;->r(Lcom/yingyonghui/market/ActivityListApp;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    rem-int v1, p3, v0

    .line 780
    iget-object v0, p0, Lcom/yingyonghui/market/cm;->b:Lcom/yingyonghui/market/ActivityListApp;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListApp;->r(Lcom/yingyonghui/market/ActivityListApp;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yingyonghui/market/model/l;

    .line 781
    if-eqz v0, :cond_0

    .line 782
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 783
    iget-object v3, p0, Lcom/yingyonghui/market/cm;->b:Lcom/yingyonghui/market/ActivityListApp;

    const-class v4, Lcom/yingyonghui/market/ActivityDetailApp;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 784
    const-string v3, "_id"

    iget v4, v0, Lcom/yingyonghui/market/model/l;->e:I

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 785
    const-string v3, "title"

    iget-object v4, v0, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 786
    const-string v3, "installed"

    iget v4, v0, Lcom/yingyonghui/market/model/l;->n:I

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 787
    const-string v3, "pkgName"

    iget-object v4, v0, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 788
    const-string v3, "size"

    iget v4, v0, Lcom/yingyonghui/market/model/l;->o:I

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 789
    const-string v3, "versionName"

    iget-object v4, v0, Lcom/yingyonghui/market/model/l;->q:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 790
    const-string v3, "versionCode"

    iget v4, v0, Lcom/yingyonghui/market/model/l;->s:I

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 791
    const-string v3, "lastUpdate"

    iget-object v4, v0, Lcom/yingyonghui/market/model/l;->r:Ljava/lang/String;

    invoke-static {v4}, Lcom/yingyonghui/market/util/l;->b(Ljava/lang/String;)J

    move-result-wide v4

    const-string v6, "yyyy-MM-dd"

    invoke-static {v4, v5, v6}, Lcom/yingyonghui/market/util/r;->a(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 792
    const-string v3, "rating"

    iget v4, v0, Lcom/yingyonghui/market/model/l;->l:F

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    .line 793
    const-string v3, "ratingCount"

    iget v4, v0, Lcom/yingyonghui/market/model/l;->A:I

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 794
    const-string v3, "from"

    iget-object v4, p0, Lcom/yingyonghui/market/cm;->a:Lcom/yingyonghui/market/log/m;

    const-string v5, "module"

    const-string v6, "Banner"

    invoke-virtual {v4, v5, v6}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/yingyonghui/market/log/m;

    move-result-object v4

    const-string v5, "index"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/yingyonghui/market/log/m;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/yingyonghui/market/log/m;

    move-result-object v4

    invoke-virtual {v4}, Lcom/yingyonghui/market/log/m;->a()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 795
    iget-object v3, p0, Lcom/yingyonghui/market/cm;->b:Lcom/yingyonghui/market/ActivityListApp;

    invoke-virtual {v3, v2}, Lcom/yingyonghui/market/ActivityListApp;->startActivity(Landroid/content/Intent;)V

    .line 797
    iget-object v2, p0, Lcom/yingyonghui/market/cm;->b:Lcom/yingyonghui/market/ActivityListApp;

    invoke-virtual {v2}, Lcom/yingyonghui/market/ActivityListApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/yingyonghui/market/cm;->a:Lcom/yingyonghui/market/log/m;

    const-string v4, "Banner"

    iget v0, v0, Lcom/yingyonghui/market/model/l;->e:I

    invoke-static {v2, v3, v4, v1, v0}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;Ljava/lang/String;II)V

    .line 799
    :cond_0
    return-void
.end method
