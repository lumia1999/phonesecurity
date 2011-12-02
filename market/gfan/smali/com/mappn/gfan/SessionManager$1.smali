.class Lcom/mappn/gfan/SessionManager$1;
.super Ljava/lang/Thread;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/SessionManager;->writePreferenceSlowly()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/SessionManager;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/SessionManager;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/SessionManager$1;->this$0:Lcom/mappn/gfan/SessionManager;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    const-wide/16 v0, 0x2710

    :try_start_0
    invoke-static {v0, v1}, Lcom/mappn/gfan/SessionManager$1;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iget-object v0, p0, Lcom/mappn/gfan/SessionManager$1;->this$0:Lcom/mappn/gfan/SessionManager;

    invoke-static {v0}, Lcom/mappn/gfan/SessionManager;->access$000(Lcom/mappn/gfan/SessionManager;)V

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method
