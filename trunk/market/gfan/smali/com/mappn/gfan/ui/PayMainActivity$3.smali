.class Lcom/mappn/gfan/ui/PayMainActivity$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/ui/PayMainActivity;->onSuccess(ILjava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/PayMainActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/PayMainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/PayMainActivity$3;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    const-wide/16 v0, 0xbb8

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/PayMainActivity$3;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    iget-object v1, p0, Lcom/mappn/gfan/ui/PayMainActivity$3;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    iget-object v2, p0, Lcom/mappn/gfan/ui/PayMainActivity$3;->this$0:Lcom/mappn/gfan/ui/PayMainActivity;

    invoke-static {v2}, Lcom/mappn/gfan/ui/PayMainActivity;->access$800(Lcom/mappn/gfan/ui/PayMainActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/mappn/gfan/common/MarketAPI;->queryAliPayResult(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;Ljava/lang/String;)V

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method
