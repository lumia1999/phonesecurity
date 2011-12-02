.class Lcom/mappn/gfan/Session$2;
.super Landroid/database/ContentObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/Session;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/Session;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/Session;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/Session$2;->this$0:Lcom/mappn/gfan/Session;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/Session$2;->this$0:Lcom/mappn/gfan/Session;

    invoke-static {v0}, Lcom/mappn/gfan/Session;->access$500(Lcom/mappn/gfan/Session;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method
