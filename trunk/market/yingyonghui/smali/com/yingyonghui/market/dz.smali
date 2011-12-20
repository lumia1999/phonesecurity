.class final Lcom/yingyonghui/market/dz;
.super Landroid/os/Handler;
.source "ActivityListAppBackup.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityListAppBackup;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityListAppBackup;)V
    .locals 0
    .parameter

    .prologue
    .line 50
    iput-object p1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 10
    .parameter

    .prologue
    const/4 v9, -0x1

    const/4 v8, 0x2

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 52
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 129
    :cond_0
    :goto_0
    return-void

    .line 54
    :pswitch_0
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppBackup;->p:I

    if-ne v0, v6, :cond_0

    .line 55
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;I)I

    .line 56
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-virtual {v0, v7}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Z)V

    .line 57
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    new-instance v1, Lcom/yingyonghui/market/ch;

    iget-object v2, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v3, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v3}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/yingyonghui/market/ch;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/ch;

    .line 58
    new-instance v0, Lcom/yingyonghui/market/dv;

    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v2, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListAppBackup;->b(Lcom/yingyonghui/market/ActivityListAppBackup;)Lcom/yingyonghui/market/ch;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/yingyonghui/market/dv;-><init>(Lcom/yingyonghui/market/AbsActivityAppListManager;Lcom/yingyonghui/market/ch;)V

    new-array v1, v6, [Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v2

    aput-object v2, v1, v7

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/dv;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 59
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->b(Lcom/yingyonghui/market/ActivityListAppBackup;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    invoke-virtual {v0, v7}, Lcom/yingyonghui/market/ch;->setNotifyOnChange(Z)V

    .line 60
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppBackup;->e:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->b(Lcom/yingyonghui/market/ActivityListAppBackup;)Lcom/yingyonghui/market/ch;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 61
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppBackup;->e:Landroid/widget/ListView;

    invoke-static {}, Lcom/yingyonghui/market/ActivityListAppBackup;->e()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 62
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v0, v6, v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;II)V

    .line 63
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->b(Lcom/yingyonghui/market/ActivityListAppBackup;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    goto :goto_0

    .line 67
    :pswitch_1
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppBackup;->p:I

    if-ne v0, v8, :cond_0

    .line 68
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->c(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->b(Lcom/yingyonghui/market/ActivityListAppBackup;I)I

    .line 69
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-virtual {v0, v7}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Z)V

    .line 71
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    new-instance v1, Lcom/yingyonghui/market/ch;

    iget-object v2, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v3, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v3}, Lcom/yingyonghui/market/ActivityListAppBackup;->c(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/yingyonghui/market/ch;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->b(Lcom/yingyonghui/market/ActivityListAppBackup;Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/ch;

    .line 72
    new-instance v0, Lcom/yingyonghui/market/cw;

    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v2, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListAppBackup;->d(Lcom/yingyonghui/market/ActivityListAppBackup;)Lcom/yingyonghui/market/ch;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/yingyonghui/market/cw;-><init>(Lcom/yingyonghui/market/AbsActivityAppListManager;Lcom/yingyonghui/market/ch;)V

    new-array v1, v6, [Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListAppBackup;->c(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v2

    aput-object v2, v1, v7

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/cw;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 73
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->d(Lcom/yingyonghui/market/ActivityListAppBackup;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    invoke-virtual {v0, v7}, Lcom/yingyonghui/market/ch;->setNotifyOnChange(Z)V

    .line 74
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppBackup;->e:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->d(Lcom/yingyonghui/market/ActivityListAppBackup;)Lcom/yingyonghui/market/ch;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 75
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppBackup;->e:Landroid/widget/ListView;

    invoke-static {}, Lcom/yingyonghui/market/ActivityListAppBackup;->f()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 76
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->c(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v0, v8, v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;II)V

    .line 77
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->d(Lcom/yingyonghui/market/ActivityListAppBackup;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    goto/16 :goto_0

    .line 81
    :pswitch_2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/yingyonghui/market/model/l;

    .line 82
    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v2, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    const v3, 0x7f090129

    new-array v4, v6, [Ljava/lang/Object;

    iget-object v0, v0, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    aput-object v0, v4, v7

    invoke-virtual {v2, v3, v4}, Lcom/yingyonghui/market/ActivityListAppBackup;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 83
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppBackup;->p:I

    if-ne v0, v6, :cond_0

    .line 84
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->b(Lcom/yingyonghui/market/ActivityListAppBackup;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    goto/16 :goto_0

    .line 89
    :pswitch_3
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/content/pm/ApplicationInfo;

    .line 90
    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v1, v1, Lcom/yingyonghui/market/ActivityListAppBackup;->q:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yingyonghui/market/model/l;

    .line 91
    iget-object v2, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v3, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    const v4, 0x7f090128

    new-array v5, v6, [Ljava/lang/Object;

    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    aput-object v1, v5, v7

    invoke-virtual {v3, v4, v5}, Lcom/yingyonghui/market/ActivityListAppBackup;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 92
    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 93
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v0, v6, v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;II)V

    .line 94
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;I)I

    .line 95
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->e(Lcom/yingyonghui/market/ActivityListAppBackup;)I

    move-result v0

    if-eq v0, v9, :cond_1

    .line 96
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->f(Lcom/yingyonghui/market/ActivityListAppBackup;)I

    .line 97
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->e(Lcom/yingyonghui/market/ActivityListAppBackup;)I

    move-result v1

    invoke-static {v0, v8, v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;II)V

    .line 100
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppBackup;->p:I

    if-ne v0, v6, :cond_2

    .line 101
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->b(Lcom/yingyonghui/market/ActivityListAppBackup;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    .line 102
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->g(Lcom/yingyonghui/market/ActivityListAppBackup;)Z

    goto/16 :goto_0

    .line 103
    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppBackup;->p:I

    if-ne v0, v8, :cond_0

    .line 104
    invoke-static {}, Lcom/yingyonghui/market/ActivityListAppBackup;->g()Ljava/util/ArrayList;

    move-result-object v0

    .line 105
    if-eqz v0, :cond_3

    .line 106
    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->c(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 107
    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->c(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 109
    :cond_3
    new-instance v0, Lcom/yingyonghui/market/cw;

    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v2, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListAppBackup;->d(Lcom/yingyonghui/market/ActivityListAppBackup;)Lcom/yingyonghui/market/ch;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/yingyonghui/market/cw;-><init>(Lcom/yingyonghui/market/AbsActivityAppListManager;Lcom/yingyonghui/market/ch;)V

    new-array v1, v6, [Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListAppBackup;->c(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v2

    aput-object v2, v1, v7

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/cw;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 110
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->c(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v0, v8, v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;II)V

    .line 111
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->d(Lcom/yingyonghui/market/ActivityListAppBackup;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    goto/16 :goto_0

    .line 116
    :pswitch_4
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    .line 117
    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v1, v1, Lcom/yingyonghui/market/ActivityListAppBackup;->q:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yingyonghui/market/model/l;

    .line 118
    iget-object v2, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v3, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    const v4, 0x7f09012a

    new-array v5, v6, [Ljava/lang/Object;

    iget-object v1, v1, Lcom/yingyonghui/market/model/l;->i:Ljava/lang/String;

    aput-object v1, v5, v7

    invoke-virtual {v3, v4, v5}, Lcom/yingyonghui/market/ActivityListAppBackup;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/yingyonghui/market/util/GlobalUtil;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 119
    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->c(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 120
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->d(Lcom/yingyonghui/market/ActivityListAppBackup;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    .line 121
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->c(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v0, v8, v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;II)V

    .line 122
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->c(Lcom/yingyonghui/market/ActivityListAppBackup;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->b(Lcom/yingyonghui/market/ActivityListAppBackup;I)I

    .line 123
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->h(Lcom/yingyonghui/market/ActivityListAppBackup;)I

    move-result v0

    if-eq v0, v9, :cond_4

    .line 124
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->i(Lcom/yingyonghui/market/ActivityListAppBackup;)I

    .line 125
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    iget-object v1, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->h(Lcom/yingyonghui/market/ActivityListAppBackup;)I

    move-result v1

    invoke-static {v0, v6, v1}, Lcom/yingyonghui/market/ActivityListAppBackup;->a(Lcom/yingyonghui/market/ActivityListAppBackup;II)V

    .line 128
    :cond_4
    iget-object v0, p0, Lcom/yingyonghui/market/dz;->a:Lcom/yingyonghui/market/ActivityListAppBackup;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppBackup;->j(Lcom/yingyonghui/market/ActivityListAppBackup;)Z

    goto/16 :goto_0

    .line 52
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
