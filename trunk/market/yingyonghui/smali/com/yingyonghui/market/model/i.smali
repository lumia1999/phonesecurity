.class public final Lcom/yingyonghui/market/model/i;
.super Lcom/yingyonghui/market/model/d;
.source "NewsContent.java"


# instance fields
.field public a:Ljava/lang/String;

.field private synthetic c:Lcom/yingyonghui/market/model/a;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/model/a;)V
    .locals 1
    .parameter

    .prologue
    .line 149
    iput-object p1, p0, Lcom/yingyonghui/market/model/i;->c:Lcom/yingyonghui/market/model/a;

    invoke-direct {p0, p1}, Lcom/yingyonghui/market/model/d;-><init>(Lcom/yingyonghui/market/model/a;)V

    .line 150
    const/4 v0, 0x1

    iput v0, p0, Lcom/yingyonghui/market/model/i;->b:I

    .line 151
    return-void
.end method
