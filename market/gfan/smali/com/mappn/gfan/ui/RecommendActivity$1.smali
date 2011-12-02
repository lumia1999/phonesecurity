.class Lcom/mappn/gfan/ui/RecommendActivity$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/RecommendActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/RecommendActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/RecommendActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/RecommendActivity$1;->this$0:Lcom/mappn/gfan/ui/RecommendActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/mappn/gfan/ui/RecommendActivity$1;->this$0:Lcom/mappn/gfan/ui/RecommendActivity;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/RecommendActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/RecommendActivity$1;->this$0:Lcom/mappn/gfan/ui/RecommendActivity;

    iget-object v2, p0, Lcom/mappn/gfan/ui/RecommendActivity$1;->this$0:Lcom/mappn/gfan/ui/RecommendActivity;

    invoke-static {v2}, Lcom/mappn/gfan/ui/RecommendActivity;->access$000(Lcom/mappn/gfan/ui/RecommendActivity;)I

    move-result v2

    iget-object v3, p0, Lcom/mappn/gfan/ui/RecommendActivity$1;->this$0:Lcom/mappn/gfan/ui/RecommendActivity;

    invoke-static {v3}, Lcom/mappn/gfan/ui/RecommendActivity;->access$100(Lcom/mappn/gfan/ui/RecommendActivity;)Lcom/mappn/gfan/common/vo/RecommendTopic;

    move-result-object v3

    iget-object v3, v3, Lcom/mappn/gfan/common/vo/RecommendTopic;->id:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Lcom/mappn/gfan/common/MarketAPI;->addMasterRecommendRating(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;ILjava/lang/String;)V

    return-void
.end method
