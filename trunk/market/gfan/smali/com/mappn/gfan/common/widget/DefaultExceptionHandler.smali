.class public Lcom/mappn/gfan/common/widget/DefaultExceptionHandler;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# instance fields
.field private context:Landroid/content/Context;

.field private defaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;


# direct methods
.method public constructor <init>(Ljava/lang/Thread$UncaughtExceptionHandler;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/mappn/gfan/common/widget/DefaultExceptionHandler;->defaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    iput-object p2, p0, Lcom/mappn/gfan/common/widget/DefaultExceptionHandler;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 5

    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {p2, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    new-instance v1, Lcom/mappn/gfan/common/vo/LogEntity;

    iget-object v2, p0, Lcom/mappn/gfan/common/widget/DefaultExceptionHandler;->context:Landroid/content/Context;

    const-string v3, "crash_mobile"

    const/4 v4, 0x5

    invoke-direct {v1, v2, v3, v4}, Lcom/mappn/gfan/common/vo/LogEntity;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    new-instance v2, Lcom/mappn/gfan/common/util/Pair;

    const-string v3, "exception"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v3, v0}, Lcom/mappn/gfan/common/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Lcom/mappn/gfan/common/vo/LogEntity;->addLogContent(Lcom/mappn/gfan/common/util/Pair;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/DefaultExceptionHandler;->context:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/DBUtils;->insertLog(Landroid/content/Context;Lcom/mappn/gfan/common/vo/LogEntity;)Landroid/net/Uri;

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/DefaultExceptionHandler;->defaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    return-void
.end method
