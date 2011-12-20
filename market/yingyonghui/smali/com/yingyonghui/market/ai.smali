.class final Lcom/yingyonghui/market/ai;
.super Landroid/os/AsyncTask;
.source "ActivitySplash.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivitySplash;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivitySplash;)V
    .locals 0
    .parameter

    .prologue
    .line 88
    iput-object p1, p0, Lcom/yingyonghui/market/ai;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected final bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .parameter

    .prologue
    .line 88
    iget-object v0, p0, Lcom/yingyonghui/market/ai;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivitySplash;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/ai;->a:Lcom/yingyonghui/market/ActivitySplash;

    invoke-virtual {v1}, Lcom/yingyonghui/market/ActivitySplash;->getPackageManager()Landroid/content/pm/PackageManager;

    invoke-static {v0}, Lcom/yingyonghui/market/util/GlobalUtil;->c(Landroid/content/Context;)V

    const/4 v0, 0x0

    return-object v0
.end method
