.class public Lcom/yingyonghui/market/ActivityTab5Manage;
.super Landroid/app/TabActivity;
.source "ActivityTab5Manage.java"

# interfaces
.implements Landroid/widget/TabHost$OnTabChangeListener;


# static fields
.field private static final a:Ljava/lang/String;


# instance fields
.field private b:Landroid/widget/TabHost;

.field private c:Landroid/widget/TabWidget;

.field private d:Ljava/util/ArrayList;

.field private e:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const-class v0, Lcom/yingyonghui/market/ActivityTab5Manage;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/ActivityTab5Manage;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/app/TabActivity;-><init>()V

    return-void
.end method

.method private a(I)V
    .locals 8
    .parameter

    .prologue
    const/4 v7, 0x0

    const v6, 0x7f0200a9

    const/4 v5, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 170
    if-nez p1, :cond_0

    .line 171
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->d:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 172
    iget-object v2, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->d:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 173
    iget-object v3, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->d:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 174
    invoke-virtual {v1, v6}, Landroid/view/View;->setBackgroundResource(I)V

    .line 188
    :goto_0
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 189
    invoke-virtual {v2, v7}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 190
    invoke-virtual {v3, v7}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 192
    check-cast v1, Landroid/widget/TextView;

    .line 193
    sget-object v4, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 194
    const/4 v4, -0x1

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 196
    move-object v0, v2

    check-cast v0, Landroid/widget/TextView;

    move-object v1, v0

    .line 197
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 198
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityTab5Manage;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f08000f

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 200
    move-object v0, v3

    check-cast v0, Landroid/widget/TextView;

    move-object v1, v0

    .line 201
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 202
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityTab5Manage;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f08000f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 204
    return-void

    .line 175
    :cond_0
    if-ne p1, v4, :cond_1

    .line 176
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->d:Ljava/util/ArrayList;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 177
    iget-object v2, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->d:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 178
    iget-object v3, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->d:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 179
    invoke-virtual {v1, v6}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    .line 182
    :cond_1
    iget-object v1, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->d:Ljava/util/ArrayList;

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 183
    iget-object v2, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->d:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 184
    iget-object v3, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->d:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 185
    invoke-virtual {v1, v6}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 13
    .parameter

    .prologue
    const/high16 v12, 0x1000

    const/high16 v11, 0x4190

    const/4 v10, 0x0

    const/4 v0, 0x1

    const/4 v9, 0x0

    .line 46
    invoke-super {p0, p1}, Landroid/app/TabActivity;->onCreate(Landroid/os/Bundle;)V

    .line 48
    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityTab5Manage;->requestWindowFeature(I)Z

    .line 50
    const v0, 0x7f030004

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityTab5Manage;->setContentView(I)V

    .line 52
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityTab5Manage;->getTabHost()Landroid/widget/TabHost;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->b:Landroid/widget/TabHost;

    .line 53
    iget-object v0, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->b:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v0

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->c:Landroid/widget/TabWidget;

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->d:Ljava/util/ArrayList;

    new-instance v2, Landroid/widget/TableLayout$LayoutParams;

    const/4 v0, -0x2

    const/4 v1, -0x1

    const/high16 v3, 0x3f80

    invoke-direct {v2, v0, v1, v3}, Landroid/widget/TableLayout$LayoutParams;-><init>(IIF)V

    const-string v0, "layout_inflater"

    invoke-virtual {p0, v0}, Lcom/yingyonghui/market/ActivityTab5Manage;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->b:Landroid/widget/TabHost;

    const-string v3, "app"

    invoke-virtual {v1, v3}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v3

    const v1, 0x7f03004e

    invoke-virtual {v0, v1, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v4, 0x7f0200d0

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setBackgroundResource(I)V

    invoke-virtual {v1}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v4, v10}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    const v4, 0x7f090113

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {v1, v11}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :try_start_0
    const-class v4, Landroid/widget/TabHost$TabSpec;

    const-string v5, "setIndicator"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/view/View;

    aput-object v8, v6, v7

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    invoke-virtual {v4, v3, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    iget-object v4, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->d:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-class v4, Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, p0, v4}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, v12}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v3, v1}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->b:Landroid/widget/TabHost;

    invoke-virtual {v1, v3}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->b:Landroid/widget/TabHost;

    const-string v3, "download"

    invoke-virtual {v1, v3}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v3

    const v1, 0x7f03004e

    invoke-virtual {v0, v1, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v4, 0x7f0200d0

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setBackgroundResource(I)V

    invoke-virtual {v1}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v4, v10}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    const v4, 0x7f090114

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {v1, v11}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :try_start_1
    const-class v4, Landroid/widget/TabHost$TabSpec;

    const-string v5, "setIndicator"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/view/View;

    aput-object v8, v6, v7

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    invoke-virtual {v4, v3, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    iget-object v4, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->d:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const v4, 0x7f03004e

    invoke-virtual {v0, v4, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-class v4, Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, p0, v4}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, v12}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v3, v1}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->b:Landroid/widget/TabHost;

    invoke-virtual {v1, v3}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v1, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->b:Landroid/widget/TabHost;

    const-string v3, "backup"

    invoke-virtual {v1, v3}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    const v3, 0x7f0200d0

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setBackgroundResource(I)V

    invoke-virtual {v0}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v3, v10}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    const v3, 0x7f090115

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {v0, v11}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :try_start_2
    const-class v2, Landroid/widget/TabHost$TabSpec;

    const-string v3, "setIndicator"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/view/View;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    iget-object v2, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->d:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-class v2, Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v0, v12}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->b:Landroid/widget/TabHost;

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v0, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->b:Landroid/widget/TabHost;

    invoke-virtual {v0, p0}, Landroid/widget/TabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    iput v9, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->e:I

    iget v0, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->e:I

    invoke-direct {p0, v0}, Lcom/yingyonghui/market/ActivityTab5Manage;->a(I)V

    .line 56
    return-void

    :catch_0
    move-exception v2

    goto :goto_2

    :catch_1
    move-exception v4

    goto/16 :goto_1

    :catch_2
    move-exception v4

    goto/16 :goto_0
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 60
    invoke-super {p0}, Landroid/app/TabActivity;->onResume()V

    .line 61
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .prologue
    .line 65
    const/4 v0, 0x0

    return v0
.end method

.method public onTabChanged(Ljava/lang/String;)V
    .locals 3
    .parameter

    .prologue
    .line 70
    const-string v0, "app"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 71
    const/4 v0, 0x0

    iput v0, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->e:I

    .line 78
    :goto_0
    iget v0, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->e:I

    invoke-direct {p0, v0}, Lcom/yingyonghui/market/ActivityTab5Manage;->a(I)V

    .line 79
    invoke-virtual {p0}, Lcom/yingyonghui/market/ActivityTab5Manage;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Manage"

    iget v2, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->e:I

    invoke-static {v0, v1, v2}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Ljava/lang/String;I)V

    .line 80
    return-void

    .line 72
    :cond_0
    const-string v0, "download"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 73
    const/4 v0, 0x1

    iput v0, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->e:I

    goto :goto_0

    .line 75
    :cond_1
    const/4 v0, 0x2

    iput v0, p0, Lcom/yingyonghui/market/ActivityTab5Manage;->e:I

    goto :goto_0
.end method
