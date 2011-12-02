.class final Lcom/mappn/gfan/common/util/DBUtils$1;
.super Landroid/content/AsyncQueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/util/DBUtils;->ignoreUpdate(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$packageName:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/ContentResolver;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    iput-object p2, p0, Lcom/mappn/gfan/common/util/DBUtils$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/mappn/gfan/common/util/DBUtils$1;->val$packageName:Ljava/lang/String;

    invoke-direct {p0, p1}, Landroid/content/AsyncQueryHandler;-><init>(Landroid/content/ContentResolver;)V

    return-void
.end method


# virtual methods
.method protected onUpdateComplete(ILjava/lang/Object;I)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/common/util/DBUtils$1;->val$context:Landroid/content/Context;

    invoke-static {v0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/util/DBUtils$1;->val$packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/Session;->removeUpdateItem(Ljava/lang/String;)V

    return-void
.end method
