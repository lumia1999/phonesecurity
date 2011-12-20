.class final Lcom/yingyonghui/market/bx;
.super Ljava/lang/Thread;
.source "AdapterListApp2.java"


# instance fields
.field private a:Lcom/yingyonghui/market/model/l;

.field private b:Landroid/content/pm/ApplicationInfo;

.field private synthetic c:Lcom/yingyonghui/market/ch;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/ch;Lcom/yingyonghui/market/model/l;Landroid/content/pm/ApplicationInfo;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 377
    iput-object p1, p0, Lcom/yingyonghui/market/bx;->c:Lcom/yingyonghui/market/ch;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 378
    iput-object p2, p0, Lcom/yingyonghui/market/bx;->a:Lcom/yingyonghui/market/model/l;

    .line 379
    iput-object p3, p0, Lcom/yingyonghui/market/bx;->b:Landroid/content/pm/ApplicationInfo;

    .line 380
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .prologue
    const/16 v6, 0x66

    const/4 v5, 0x0

    .line 384
    new-instance v0, Ljava/io/File;

    const-string v1, "/sdcard/Yingyonghui_backup"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 385
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 386
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_0

    .line 387
    iget-object v0, p0, Lcom/yingyonghui/market/bx;->c:Lcom/yingyonghui/market/ch;

    invoke-static {v0}, Lcom/yingyonghui/market/ch;->f(Lcom/yingyonghui/market/ch;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/bx;->c:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->f(Lcom/yingyonghui/market/ch;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/bx;->a:Lcom/yingyonghui/market/model/l;

    invoke-virtual {v1, v6, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 388
    iget-object v0, p0, Lcom/yingyonghui/market/bx;->c:Lcom/yingyonghui/market/ch;

    invoke-static {v0}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v0

    iput-boolean v5, v0, Lcom/yingyonghui/market/model/l;->M:Z

    .line 409
    :goto_0
    return-void

    .line 393
    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/yingyonghui/market/bx;->a:Lcom/yingyonghui/market/model/l;

    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->J:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 394
    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result v1

    if-nez v1, :cond_1

    .line 395
    iget-object v0, p0, Lcom/yingyonghui/market/bx;->c:Lcom/yingyonghui/market/ch;

    invoke-static {v0}, Lcom/yingyonghui/market/ch;->f(Lcom/yingyonghui/market/ch;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/bx;->c:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->f(Lcom/yingyonghui/market/ch;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/bx;->a:Lcom/yingyonghui/market/model/l;

    invoke-virtual {v1, v6, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 396
    iget-object v0, p0, Lcom/yingyonghui/market/bx;->c:Lcom/yingyonghui/market/ch;

    invoke-static {v0}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v0

    iput-boolean v5, v0, Lcom/yingyonghui/market/model/l;->M:Z

    goto :goto_0

    .line 400
    :cond_1
    new-instance v1, Ljava/io/File;

    const-string v2, "/sdcard/Yingyonghui_backup"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/yingyonghui/market/bx;->a:Lcom/yingyonghui/market/model/l;

    iget-object v4, v4, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".apk"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    :try_start_0
    invoke-static {v0, v1}, Lcom/yingyonghui/market/util/d;->a(Ljava/io/File;Ljava/io/File;)V

    .line 403
    iget-object v0, p0, Lcom/yingyonghui/market/bx;->c:Lcom/yingyonghui/market/ch;

    invoke-static {v0}, Lcom/yingyonghui/market/ch;->f(Lcom/yingyonghui/market/ch;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/bx;->c:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->f(Lcom/yingyonghui/market/ch;)Landroid/os/Handler;

    move-result-object v1

    const/16 v2, 0x67

    iget-object v3, p0, Lcom/yingyonghui/market/bx;->b:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 404
    iget-object v0, p0, Lcom/yingyonghui/market/bx;->c:Lcom/yingyonghui/market/ch;

    invoke-static {v0}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v0

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/yingyonghui/market/model/l;->M:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 406
    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/yingyonghui/market/bx;->c:Lcom/yingyonghui/market/ch;

    invoke-static {v0}, Lcom/yingyonghui/market/ch;->f(Lcom/yingyonghui/market/ch;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/bx;->c:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->f(Lcom/yingyonghui/market/ch;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/bx;->a:Lcom/yingyonghui/market/model/l;

    invoke-virtual {v1, v6, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 407
    iget-object v0, p0, Lcom/yingyonghui/market/bx;->c:Lcom/yingyonghui/market/ch;

    invoke-static {v0}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v0

    iput-boolean v5, v0, Lcom/yingyonghui/market/model/l;->M:Z

    goto/16 :goto_0
.end method
