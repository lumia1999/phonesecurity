.class final Lcom/yingyonghui/market/d;
.super Ljava/lang/Object;
.source "ActivityListAppDownload.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityListAppDownload;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityListAppDownload;)V
    .locals 0
    .parameter

    .prologue
    .line 273
    iput-object p1, p0, Lcom/yingyonghui/market/d;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3
    .parameter

    .prologue
    .line 277
    iget-object v0, p0, Lcom/yingyonghui/market/d;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->b(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yingyonghui/market/d;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->b(Lcom/yingyonghui/market/ActivityListAppDownload;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 279
    iget-object v0, p0, Lcom/yingyonghui/market/d;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->h(Lcom/yingyonghui/market/ActivityListAppDownload;)V

    .line 280
    iget-object v0, p0, Lcom/yingyonghui/market/d;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivityListAppDownload;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "manageDeleteAll"

    iget-object v2, p0, Lcom/yingyonghui/market/d;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-virtual {v2}, Lcom/yingyonghui/market/ActivityListAppDownload;->i()Lcom/yingyonghui/market/log/m;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Ljava/lang/String;Lcom/yingyonghui/market/log/m;)V

    .line 283
    :goto_0
    return-void

    .line 282
    :cond_0
    iget-object v0, p0, Lcom/yingyonghui/market/d;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    const v1, 0x7f09014a

    invoke-static {v0, v1}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto :goto_0
.end method
