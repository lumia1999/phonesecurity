.class Lcom/mappn/gfan/SessionManager$2;
.super Ljava/lang/Thread;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/SessionManager;->writePreferenceQuickly()V
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

    iput-object p1, p0, Lcom/mappn/gfan/SessionManager$2;->this$0:Lcom/mappn/gfan/SessionManager;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/SessionManager$2;->this$0:Lcom/mappn/gfan/SessionManager;

    invoke-static {v0}, Lcom/mappn/gfan/SessionManager;->access$000(Lcom/mappn/gfan/SessionManager;)V

    return-void
.end method
