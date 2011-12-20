.class public Lcom/yingyonghui/market/ActivityWarningShowIcon;
.super Landroid/app/Activity;
.source "ActivityWarningShowIcon.java"


# instance fields
.field private a:Landroid/widget/Button;

.field private b:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter

    .prologue
    .line 18
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 19
    const v0, 0x7f030027

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityWarningShowIcon;->setContentView(I)V

    .line 22
    const-string v0, "show_display_icons_dialog"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/yingyonghui/market/util/s;->a(Landroid/app/Activity;Ljava/lang/String;Z)V

    .line 24
    const v0, 0x7f0b00ac

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityWarningShowIcon;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityWarningShowIcon;->a:Landroid/widget/Button;

    const v0, 0x7f0b00ad

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityWarningShowIcon;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityWarningShowIcon;->b:Landroid/widget/Button;

    .line 25
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityWarningShowIcon;->a:Landroid/widget/Button;

    new-instance v1, Lcom/yingyonghui/market/dm;

    invoke-direct {v1, p0}, Lcom/yingyonghui/market/dm;-><init>(Lcom/yingyonghui/market/ActivityWarningShowIcon;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityWarningShowIcon;->b:Landroid/widget/Button;

    new-instance v1, Lcom/yingyonghui/market/dn;

    invoke-direct {v1, p0}, Lcom/yingyonghui/market/dn;-><init>(Lcom/yingyonghui/market/ActivityWarningShowIcon;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 26
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 30
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 31
    const-string v0, "checkbox_display_icons"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/yingyonghui/market/util/k;->a(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 32
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityWarningShowIcon;->finish()V

    .line 34
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method
