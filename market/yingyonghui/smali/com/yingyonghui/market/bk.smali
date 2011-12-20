.class final Lcom/yingyonghui/market/bk;
.super Ljava/lang/Object;
.source "AdapterListApp2.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ch;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ch;)V
    .locals 0
    .parameter

    .prologue
    .line 239
    iput-object p1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 12
    .parameter

    .prologue
    const v8, 0x7f09014a

    const/4 v7, 0x0

    const v11, 0x7f09012b

    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 243
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 244
    const-string v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 245
    aget-object v2, v1, v10

    invoke-static {v2}, Lcom/yingyonghui/market/util/l;->a(Ljava/lang/String;)I

    move-result v3

    .line 246
    aget-object v4, v1, v9

    .line 248
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-virtual {v1, v3}, Lcom/yingyonghui/market/ch;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    .line 249
    if-nez v1, :cond_1

    .line 370
    :cond_0
    :goto_0
    return-void

    .line 255
    :cond_1
    iget-object v2, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v2, v7}, Lcom/yingyonghui/market/ch;->a(Lcom/yingyonghui/market/ch;Lcom/yingyonghui/market/model/l;)Lcom/yingyonghui/market/model/l;

    .line 256
    instance-of v2, v1, Landroid/content/pm/ApplicationInfo;

    if-eqz v2, :cond_2

    .line 257
    check-cast v1, Landroid/content/pm/ApplicationInfo;

    .line 258
    iget-object v5, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    iget-object v2, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v2}, Lcom/yingyonghui/market/ch;->a(Lcom/yingyonghui/market/ch;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v2

    iget-object v6, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yingyonghui/market/model/l;

    invoke-static {v5, v2}, Lcom/yingyonghui/market/ch;->a(Lcom/yingyonghui/market/ch;Lcom/yingyonghui/market/model/l;)Lcom/yingyonghui/market/model/l;

    move-object v2, v1

    move-object v1, v7

    .line 264
    :goto_1
    iget-object v5, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v5}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v5

    if-nez v5, :cond_3

    iget-object v5, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v5}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v5

    instance-of v5, v5, Lcom/yingyonghui/market/ActivityListAppDownload;

    if-nez v5, :cond_3

    iget-object v5, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v5}, Lcom/yingyonghui/market/ch;->d(Lcom/yingyonghui/market/ch;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 265
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v8}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto :goto_0

    .line 259
    :cond_2
    instance-of v2, v1, Ljava/io/File;

    if-eqz v2, :cond_11

    .line 260
    check-cast v1, Ljava/io/File;

    .line 261
    iget-object v5, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    iget-object v2, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v2}, Lcom/yingyonghui/market/ch;->a(Lcom/yingyonghui/market/ch;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v2

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yingyonghui/market/model/l;

    invoke-static {v5, v2}, Lcom/yingyonghui/market/ch;->a(Lcom/yingyonghui/market/ch;Lcom/yingyonghui/market/model/l;)Lcom/yingyonghui/market/model/l;

    move-object v2, v7

    goto :goto_1

    .line 267
    :cond_3
    iget-object v5, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v5}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v5

    if-eqz v5, :cond_4

    iget-object v5, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v5}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v5

    instance-of v5, v5, Lcom/yingyonghui/market/ActivityListAppManage;

    if-nez v5, :cond_4

    iget-object v5, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v5}, Lcom/yingyonghui/market/ch;->d(Lcom/yingyonghui/market/ch;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 268
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v8}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 272
    :cond_4
    const-string v5, "uninstall"

    invoke-static {v4, v5}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 273
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-virtual {v1}, Lcom/yingyonghui/market/ActivityListAppManage;->getParent()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v2}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v2

    iget-object v2, v2, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/yingyonghui/market/util/GlobalUtil;->d(Landroid/content/Context;Ljava/lang/String;)V

    .line 274
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "manageUninstall"

    iget-object v4, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v4}, Lcom/yingyonghui/market/ch;->e(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/log/m;

    move-result-object v4

    iget-object v5, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v5}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v5

    iget-object v5, v5, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v1, v2, v4, v3, v5}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Ljava/lang/String;Lcom/yingyonghui/market/log/m;ILjava/lang/String;)V

    goto/16 :goto_0

    .line 275
    :cond_5
    const-string v5, "install"

    invoke-static {v4, v5}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 276
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v2}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v2

    iget-object v2, v2, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/yingyonghui/market/util/GlobalUtil;->c(Landroid/content/Context;Ljava/lang/String;)V

    .line 277
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "manageInstall"

    iget-object v4, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v4}, Lcom/yingyonghui/market/ch;->e(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/log/m;

    move-result-object v4

    iget-object v5, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v5}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v5

    iget-object v5, v5, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v1, v2, v4, v3, v5}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Ljava/lang/String;Lcom/yingyonghui/market/log/m;ILjava/lang/String;)V

    goto/16 :goto_0

    .line 278
    :cond_6
    const-string v5, "backup"

    invoke-static {v4, v5}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 279
    invoke-static {}, Lcom/yingyonghui/market/util/GlobalUtil;->a()Z

    move-result v1

    if-nez v1, :cond_7

    .line 280
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f09012c

    invoke-static {v1, v2}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 282
    :cond_7
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v1

    iget v1, v1, Lcom/yingyonghui/market/model/l;->o:I

    int-to-long v4, v1

    invoke-static {}, Lcom/yingyonghui/market/util/GlobalUtil;->b()J

    move-result-wide v6

    cmp-long v1, v4, v6

    if-lez v1, :cond_8

    .line 283
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f09012d

    invoke-static {v1, v2}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 286
    :cond_8
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v1

    iput-boolean v9, v1, Lcom/yingyonghui/market/model/l;->M:Z

    .line 287
    move-object v0, p1

    check-cast v0, Landroid/widget/TextView;

    move-object v1, v0

    const v4, 0x7f090135

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(I)V

    .line 288
    move-object v0, p1

    check-cast v0, Landroid/widget/TextView;

    move-object v1, v0

    const v4, 0x7f02004f

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 289
    check-cast p1, Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "-"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "empty"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 290
    new-instance v1, Lcom/yingyonghui/market/bx;

    iget-object v4, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    iget-object v5, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v5}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v5

    invoke-direct {v1, v4, v5, v2}, Lcom/yingyonghui/market/bx;-><init>(Lcom/yingyonghui/market/ch;Lcom/yingyonghui/market/model/l;Landroid/content/pm/ApplicationInfo;)V

    invoke-virtual {v1}, Lcom/yingyonghui/market/bx;->start()V

    .line 292
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "manageBackup"

    iget-object v4, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v4}, Lcom/yingyonghui/market/ch;->e(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/log/m;

    move-result-object v4

    iget-object v5, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v5}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v5

    iget-object v5, v5, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v1, v2, v4, v3, v5}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Ljava/lang/String;Lcom/yingyonghui/market/log/m;ILjava/lang/String;)V

    goto/16 :goto_0

    .line 293
    :cond_9
    const-string v2, "downloaded"

    invoke-virtual {v4, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 294
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_b

    .line 295
    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    .line 296
    const-string v5, "sdcard/Yingyonghui"

    invoke-virtual {v2, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_b

    .line 298
    :try_start_0
    new-instance v5, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, "/apk/"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v5, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 299
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_a

    .line 300
    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    .line 302
    :cond_a
    new-instance v2, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v2

    .line 309
    :cond_b
    :goto_2
    const-string v2, "downloaded_delete"

    invoke-static {v4, v2}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 310
    iget-object v2, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v2}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v2

    instance-of v2, v2, Lcom/yingyonghui/market/ActivityListAppDownload;

    if-eqz v2, :cond_c

    .line 311
    iget-object v2, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v2}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v2

    if-eqz v2, :cond_d

    iget-object v2, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v2}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v2

    iget-object v2, v2, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    .line 313
    :goto_3
    :try_start_1
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 314
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    .line 315
    const/16 v4, 0x67

    iput v4, v1, Landroid/os/Message;->what:I

    .line 316
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iput-object v4, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 317
    iget-object v4, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v4}, Lcom/yingyonghui/market/ch;->f(Lcom/yingyonghui/market/ch;)Landroid/os/Handler;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 318
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v1

    iget-object v4, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v4}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f09012a

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v2, v6, v7

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 324
    :cond_c
    :goto_4
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "manageDelete"

    iget-object v4, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v4}, Lcom/yingyonghui/market/ch;->e(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/log/m;

    move-result-object v4

    iget-object v5, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v5}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v5

    iget-object v5, v5, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v1, v2, v4, v3, v5}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Ljava/lang/String;Lcom/yingyonghui/market/log/m;ILjava/lang/String;)V

    goto/16 :goto_0

    .line 303
    :catch_0
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 311
    :cond_d
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    goto :goto_3

    .line 319
    :catch_1
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 321
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v1

    iget-object v4, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v4}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v4

    new-array v5, v9, [Ljava/lang/Object;

    aput-object v2, v5, v10

    invoke-virtual {v4, v11, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_4

    .line 325
    :cond_e
    const-string v2, "downloaded_install"

    invoke-static {v4, v2}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 326
    iget-object v2, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-virtual {v2}, Lcom/yingyonghui/market/ch;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;Ljava/io/File;)V

    .line 327
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "manageInstall"

    iget-object v4, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v4}, Lcom/yingyonghui/market/ch;->e(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/log/m;

    move-result-object v4

    iget-object v5, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v5}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v5

    iget-object v5, v5, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v1, v2, v4, v3, v5}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Ljava/lang/String;Lcom/yingyonghui/market/log/m;ILjava/lang/String;)V

    goto/16 :goto_0

    .line 329
    :cond_f
    const-string v2, "backuped_install"

    invoke-static {v4, v2}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 333
    :try_start_2
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-virtual {v1}, Lcom/yingyonghui/market/ch;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    iget-object v4, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v4}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v4

    iget-object v4, v4, Lcom/yingyonghui/market/model/l;->J:Ljava/lang/String;

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v2}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;Ljava/io/File;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 339
    :goto_5
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 341
    :try_start_3
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "manageInstall"

    iget-object v4, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v4}, Lcom/yingyonghui/market/ch;->e(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/log/m;

    move-result-object v4

    iget-object v5, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v5}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v5

    iget-object v5, v5, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v1, v2, v4, v3, v5}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Ljava/lang/String;Lcom/yingyonghui/market/log/m;ILjava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_0

    .line 343
    :catch_2
    move-exception v1

    goto/16 :goto_0

    .line 335
    :catch_3
    move-exception v1

    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-virtual {v1}, Lcom/yingyonghui/market/ch;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-virtual {v2}, Lcom/yingyonghui/market/ch;->getContext()Landroid/content/Context;

    move-result-object v2

    const v4, 0x7f090170

    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_5

    .line 346
    :cond_10
    const-string v2, "backuped_delete"

    invoke-static {v4, v2}, Lcom/yingyonghui/market/util/c;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 348
    :try_start_4
    new-instance v2, Ljava/io/File;

    iget-object v4, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v4}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v4

    iget-object v4, v4, Lcom/yingyonghui/market/model/l;->J:Ljava/lang/String;

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 349
    iget-object v2, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v2}, Lcom/yingyonghui/market/ch;->f(Lcom/yingyonghui/market/ch;)Landroid/os/Handler;

    move-result-object v2

    iget-object v4, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v4}, Lcom/yingyonghui/market/ch;->f(Lcom/yingyonghui/market/ch;)Landroid/os/Handler;

    move-result-object v4

    const/16 v5, 0x68

    invoke-virtual {v4, v5, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_5

    .line 362
    :goto_6
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 364
    :try_start_5
    iget-object v1, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v1}, Lcom/yingyonghui/market/ch;->c(Lcom/yingyonghui/market/ch;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "manageDelete"

    iget-object v4, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v4}, Lcom/yingyonghui/market/ch;->e(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/log/m;

    move-result-object v4

    iget-object v5, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v5}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v5

    iget-object v5, v5, Lcom/yingyonghui/market/model/l;->m:Ljava/lang/String;

    invoke-static {v1, v2, v4, v3, v5}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Ljava/lang/String;Lcom/yingyonghui/market/log/m;ILjava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    goto/16 :goto_0

    :catch_4
    move-exception v1

    goto/16 :goto_0

    .line 350
    :catch_5
    move-exception v1

    .line 354
    :try_start_6
    iget-object v2, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-virtual {v2}, Lcom/yingyonghui/market/ch;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v4, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-virtual {v4}, Lcom/yingyonghui/market/ch;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f09012b

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-static {v8}, Lcom/yingyonghui/market/ch;->b(Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/model/l;

    move-result-object v8

    iget-object v8, v8, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    aput-object v8, v6, v7

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    .line 358
    :goto_7
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_6

    .line 356
    :catch_6
    move-exception v2

    iget-object v2, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-virtual {v2}, Lcom/yingyonghui/market/ch;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v4, p0, Lcom/yingyonghui/market/bk;->a:Lcom/yingyonghui/market/ch;

    invoke-virtual {v4}, Lcom/yingyonghui/market/ch;->getContext()Landroid/content/Context;

    move-result-object v4

    new-array v5, v9, [Ljava/lang/Object;

    const-string v6, ""

    aput-object v6, v5, v10

    invoke-virtual {v4, v11, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_7

    :cond_11
    move-object v1, v7

    move-object v2, v7

    goto/16 :goto_1
.end method
