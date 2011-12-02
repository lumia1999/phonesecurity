.class Lcom/mappn/gfan/Session$DbStatusRefreshTask;
.super Landroid/content/AsyncQueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/Session;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DbStatusRefreshTask"
.end annotation


# static fields
.field private static final DOWNLOAD:I = 0x0

.field private static final UPDATE:I = 0x1


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/Session;


# direct methods
.method public constructor <init>(Lcom/mappn/gfan/Session;Landroid/content/ContentResolver;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/Session$DbStatusRefreshTask;->this$0:Lcom/mappn/gfan/Session;

    invoke-direct {p0, p2}, Landroid/content/AsyncQueryHandler;-><init>(Landroid/content/ContentResolver;)V

    return-void
.end method


# virtual methods
.method protected onQueryComplete(ILjava/lang/Object;Landroid/database/Cursor;)V
    .locals 1

    packed-switch p1, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/mappn/gfan/Session$DbStatusRefreshTask;->this$0:Lcom/mappn/gfan/Session;

    invoke-virtual {v0, p3}, Lcom/mappn/gfan/Session;->refreshDownloadApp(Landroid/database/Cursor;)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/mappn/gfan/Session$DbStatusRefreshTask;->this$0:Lcom/mappn/gfan/Session;

    invoke-static {v0, p3}, Lcom/mappn/gfan/Session;->access$600(Lcom/mappn/gfan/Session;Landroid/database/Cursor;)V

    invoke-interface {p3}, Landroid/database/Cursor;->close()V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
