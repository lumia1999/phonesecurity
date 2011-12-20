.class final Lcom/yingyonghui/market/log/c;
.super Ljava/lang/Thread;
.source "AnalyticsService.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/log/AnalyticsService;


# direct methods
.method public constructor <init>(Lcom/yingyonghui/market/log/AnalyticsService;)V
    .locals 1
    .parameter

    .prologue
    .line 149
    iput-object p1, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    .line 150
    const-string v0, "Analytics Service"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 151
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 155
    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 157
    iget-object v0, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    invoke-static {v0}, Lcom/yingyonghui/market/log/AnalyticsService;->a(Lcom/yingyonghui/market/log/AnalyticsService;)V

    .line 161
    :goto_0
    iget-object v0, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    monitor-enter v0

    .line 165
    :try_start_0
    iget-object v1, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    invoke-static {v1}, Lcom/yingyonghui/market/log/AnalyticsService;->b(Lcom/yingyonghui/market/log/AnalyticsService;)Lcom/yingyonghui/market/log/c;

    move-result-object v1

    if-eq v1, p0, :cond_0

    .line 166
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "multiple UpdateThreads in AnalyticsService"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 180
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 169
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    iget-object v2, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    const-string v3, "app_trace_log_enable"

    invoke-static {v2, v3}, Lcom/yingyonghui/market/util/k;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    invoke-static {v1, v2}, Lcom/yingyonghui/market/log/AnalyticsService;->a(Lcom/yingyonghui/market/log/AnalyticsService;Z)Z

    .line 170
    iget-object v1, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    invoke-static {v1}, Lcom/yingyonghui/market/log/AnalyticsService;->c(Lcom/yingyonghui/market/log/AnalyticsService;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 171
    iget-object v1, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    iget-object v2, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    const-string v3, "checkbox_allow_app_trace"

    invoke-static {v2, v3}, Lcom/yingyonghui/market/util/k;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    invoke-static {v1, v2}, Lcom/yingyonghui/market/log/AnalyticsService;->a(Lcom/yingyonghui/market/log/AnalyticsService;Z)Z

    .line 174
    :cond_1
    iget-object v1, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    invoke-static {v1}, Lcom/yingyonghui/market/log/AnalyticsService;->c(Lcom/yingyonghui/market/log/AnalyticsService;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 175
    iget-object v1, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    invoke-static {v1}, Lcom/yingyonghui/market/log/AnalyticsService;->d(Lcom/yingyonghui/market/log/AnalyticsService;)Lcom/yingyonghui/market/log/c;

    .line 176
    iget-object v1, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    invoke-virtual {v1}, Lcom/yingyonghui/market/log/AnalyticsService;->stopSelf()V

    .line 178
    monitor-exit v0

    return-void

    .line 180
    :cond_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 185
    invoke-static {}, Lcom/yingyonghui/market/log/AnalyticsService;->a()Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v0

    if-lez v0, :cond_8

    .line 186
    invoke-static {}, Lcom/yingyonghui/market/log/AnalyticsService;->b()Ljava/lang/String;

    move-result-object v0

    .line 189
    :goto_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {}, Lcom/yingyonghui/market/log/AnalyticsService;->c()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_7

    .line 190
    :cond_3
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 191
    iget-object v2, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    invoke-static {v2}, Lcom/yingyonghui/market/log/AnalyticsService;->e(Lcom/yingyonghui/market/log/AnalyticsService;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "|"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {}, Lcom/yingyonghui/market/log/AnalyticsService;->d()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "|"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {v0}, Lcom/yingyonghui/market/util/c;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 195
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 198
    :goto_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 203
    invoke-static {v0}, Lcom/yingyonghui/market/log/AnalyticsService;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 205
    iget-object v1, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    invoke-static {v1}, Lcom/yingyonghui/market/util/g;->a(Landroid/content/Context;)Z

    move-result v1

    .line 206
    if-eqz v1, :cond_6

    .line 207
    iget-object v1, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v1, v0, v2, v3}, Lcom/yingyonghui/market/log/AnalyticsService;->a(Lcom/yingyonghui/market/log/AnalyticsService;Ljava/lang/String;J)Z

    move-result v1

    .line 208
    if-nez v1, :cond_4

    .line 209
    iget-object v1, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    invoke-static {v1, v0}, Lcom/yingyonghui/market/log/AnalyticsService;->a(Lcom/yingyonghui/market/log/AnalyticsService;Ljava/lang/String;)Z

    .line 212
    :cond_4
    iget-object v0, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    invoke-static {v0}, Lcom/yingyonghui/market/log/AnalyticsService;->f(Lcom/yingyonghui/market/log/AnalyticsService;)V

    .line 220
    :cond_5
    :goto_3
    const-wide/32 v0, 0xdbba0

    :try_start_2
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    .line 224
    :catch_0
    move-exception v0

    goto/16 :goto_0

    .line 214
    :cond_6
    iget-object v1, p0, Lcom/yingyonghui/market/log/c;->a:Lcom/yingyonghui/market/log/AnalyticsService;

    invoke-static {v1, v0}, Lcom/yingyonghui/market/log/AnalyticsService;->a(Lcom/yingyonghui/market/log/AnalyticsService;Ljava/lang/String;)Z

    goto :goto_3

    :cond_7
    move-object v0, v4

    goto :goto_2

    :cond_8
    move-object v0, v4

    goto :goto_1
.end method
