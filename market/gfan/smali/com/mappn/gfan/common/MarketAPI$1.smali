.class final Lcom/mappn/gfan/common/MarketAPI$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/MarketAPI;->submitLogs(Landroid/content/Context;ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$level:I

.field final synthetic val$module:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/MarketAPI$1;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/mappn/gfan/common/MarketAPI$1;->val$module:Ljava/lang/String;

    iput p3, p0, Lcom/mappn/gfan/common/MarketAPI$1;->val$level:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(II)V
    .locals 0

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/common/MarketAPI$1;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/mappn/gfan/common/MarketAPI$1;->val$module:Ljava/lang/String;

    iget v2, p0, Lcom/mappn/gfan/common/MarketAPI$1;->val$level:I

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/util/DBUtils;->delLogs(Landroid/content/Context;Ljava/lang/String;I)V

    return-void
.end method
