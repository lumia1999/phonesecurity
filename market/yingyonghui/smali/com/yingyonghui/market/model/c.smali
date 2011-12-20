.class public final Lcom/yingyonghui/market/model/c;
.super Lcom/yingyonghui/market/model/d;
.source "NewsContent.java"


# instance fields
.field public a:I

.field private synthetic c:Lcom/yingyonghui/market/model/a;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/model/a;)V
    .locals 1
    .parameter

    .prologue
    .line 157
    iput-object p1, p0, Lcom/yingyonghui/market/model/c;->c:Lcom/yingyonghui/market/model/a;

    invoke-direct {p0, p1}, Lcom/yingyonghui/market/model/d;-><init>(Lcom/yingyonghui/market/model/a;)V

    .line 158
    const/4 v0, 0x2

    iput v0, p0, Lcom/yingyonghui/market/model/c;->b:I

    .line 159
    return-void
.end method
