.class final Lcom/yingyonghui/market/c;
.super Ljava/lang/Object;
.source "ActivityListAppDownload.java"

# interfaces
.implements Lcom/yingyonghui/market/bs;


# instance fields
.field final synthetic a:Lcom/yingyonghui/market/ActivityListAppDownload;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityListAppDownload;)V
    .locals 0
    .parameter

    .prologue
    .line 675
    iput-object p1, p0, Lcom/yingyonghui/market/c;->a:Lcom/yingyonghui/market/ActivityListAppDownload;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .prologue
    .line 678
    new-instance v0, Lcom/yingyonghui/market/bp;

    invoke-direct {v0, p0}, Lcom/yingyonghui/market/bp;-><init>(Lcom/yingyonghui/market/c;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/bp;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 722
    return-void
.end method
