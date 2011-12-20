.class final Lcom/yingyonghui/market/q;
.super Landroid/os/Handler;
.source "ActivityListAppManage.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ActivityListAppManage;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityListAppManage;)V
    .locals 0
    .parameter

    .prologue
    .line 100
    iput-object p1, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 7
    .parameter

    .prologue
    const/16 v6, 0x384

    const/4 v2, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 102
    iget v0, p1, Landroid/os/Message;->what:I

    sparse-switch v0, :sswitch_data_0

    .line 156
    :cond_0
    :goto_0
    return-void

    .line 104
    :sswitch_0
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Lcom/yingyonghui/market/ActivityListAppManage;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 105
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget-object v1, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Lcom/yingyonghui/market/ActivityListAppManage;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Lcom/yingyonghui/market/ActivityListAppManage;I)I

    .line 106
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget-object v1, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppManage;->b(Lcom/yingyonghui/market/ActivityListAppManage;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppManage;->b(Lcom/yingyonghui/market/ActivityListAppManage;I)V

    .line 111
    :cond_1
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    if-ne v0, v5, :cond_2

    .line 112
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    new-instance v1, Lcom/yingyonghui/market/ch;

    iget-object v2, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget-object v3, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v3}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Lcom/yingyonghui/market/ActivityListAppManage;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/yingyonghui/market/ch;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Lcom/yingyonghui/market/ActivityListAppManage;Lcom/yingyonghui/market/ch;)Lcom/yingyonghui/market/ch;

    .line 113
    new-instance v0, Lcom/yingyonghui/market/dv;

    iget-object v1, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget-object v2, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListAppManage;->c(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/ch;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/yingyonghui/market/dv;-><init>(Lcom/yingyonghui/market/AbsActivityAppListManager;Lcom/yingyonghui/market/ch;)V

    new-array v1, v5, [Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Lcom/yingyonghui/market/ActivityListAppManage;)Ljava/util/ArrayList;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-virtual {v0, v1}, Lcom/yingyonghui/market/dv;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 114
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->c(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/yingyonghui/market/ch;->setNotifyOnChange(Z)V

    .line 115
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->e:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppManage;->c(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/ch;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 116
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->e:Landroid/widget/ListView;

    invoke-static {}, Lcom/yingyonghui/market/ActivityListAppManage;->e()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 117
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->c(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/ch;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/ch;->notifyDataSetChanged()V

    .line 118
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-virtual {v0, v4}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Z)V

    goto/16 :goto_0

    .line 119
    :cond_2
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 120
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget-object v1, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget-object v2, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListAppManage;->d(Lcom/yingyonghui/market/ActivityListAppManage;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/yingyonghui/market/ActivityListAppManage;->b(Lcom/yingyonghui/market/ActivityListAppManage;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Lcom/yingyonghui/market/ActivityListAppManage;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 121
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    new-instance v1, Lcom/yingyonghui/market/bc;

    iget-object v2, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget-object v3, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v3}, Lcom/yingyonghui/market/ActivityListAppManage;->e(Lcom/yingyonghui/market/ActivityListAppManage;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-direct {v1, v2, v3, v6}, Lcom/yingyonghui/market/bc;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I)V

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Lcom/yingyonghui/market/ActivityListAppManage;Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/bc;

    .line 122
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->f(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/bc;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/yingyonghui/market/bc;->setNotifyOnChange(Z)V

    .line 123
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->e:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppManage;->f(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/bc;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 124
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->e:Landroid/widget/ListView;

    invoke-static {}, Lcom/yingyonghui/market/ActivityListAppManage;->f()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 125
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->f(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/bc;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/bc;->notifyDataSetChanged()V

    .line 126
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-virtual {v0, v4}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Z)V

    goto/16 :goto_0

    .line 132
    :sswitch_1
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->b(Lcom/yingyonghui/market/ActivityListAppManage;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_3

    .line 133
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget-object v1, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppManage;->b(Lcom/yingyonghui/market/ActivityListAppManage;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppManage;->b(Lcom/yingyonghui/market/ActivityListAppManage;I)V

    .line 135
    :cond_3
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    if-ne v0, v2, :cond_0

    .line 136
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    new-instance v1, Lcom/yingyonghui/market/bc;

    iget-object v2, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget-object v3, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v3}, Lcom/yingyonghui/market/ActivityListAppManage;->g(Lcom/yingyonghui/market/ActivityListAppManage;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-direct {v1, v2, v3, v6}, Lcom/yingyonghui/market/bc;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I)V

    invoke-static {v0, v1}, Lcom/yingyonghui/market/ActivityListAppManage;->b(Lcom/yingyonghui/market/ActivityListAppManage;Lcom/yingyonghui/market/bc;)Lcom/yingyonghui/market/bc;

    .line 137
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->h(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/bc;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/yingyonghui/market/bc;->setNotifyOnChange(Z)V

    .line 139
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->e:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v1}, Lcom/yingyonghui/market/ActivityListAppManage;->h(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/bc;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 140
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget-object v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->e:Landroid/widget/ListView;

    invoke-static {}, Lcom/yingyonghui/market/ActivityListAppManage;->g()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 141
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->h(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/bc;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/bc;->notifyDataSetChanged()V

    .line 142
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-virtual {v0, v4}, Lcom/yingyonghui/market/ActivityListAppManage;->a(Z)V

    .line 144
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-virtual {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-virtual {v1}, Lcom/yingyonghui/market/ActivityListAppManage;->i()Lcom/yingyonghui/market/log/m;

    move-result-object v1

    iget-object v2, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v2}, Lcom/yingyonghui/market/ActivityListAppManage;->g(Lcom/yingyonghui/market/ActivityListAppManage;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    iget-object v3, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v3}, Lcom/yingyonghui/market/ActivityListAppManage;->g(Lcom/yingyonghui/market/ActivityListAppManage;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/yingyonghui/market/log/l;->a(Landroid/content/Context;Lcom/yingyonghui/market/log/m;ILjava/util/List;)V

    goto/16 :goto_0

    .line 149
    :sswitch_2
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    iget v0, v0, Lcom/yingyonghui/market/ActivityListAppManage;->p:I

    if-ne v0, v2, :cond_0

    .line 150
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->h(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/bc;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/yingyonghui/market/q;->a:Lcom/yingyonghui/market/ActivityListAppManage;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityListAppManage;->h(Lcom/yingyonghui/market/ActivityListAppManage;)Lcom/yingyonghui/market/bc;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yingyonghui/market/bc;->notifyDataSetChanged()V

    goto/16 :goto_0

    .line 102
    :sswitch_data_0
    .sparse-switch
        0x64 -> :sswitch_2
        0x1f4 -> :sswitch_0
        0x1f5 -> :sswitch_1
    .end sparse-switch
.end method
