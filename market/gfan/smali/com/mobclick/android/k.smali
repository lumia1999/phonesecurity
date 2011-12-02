.class final Lcom/mobclick/android/k;
.super Ljava/lang/Thread;


# static fields
.field private static final a:Ljava/lang/Object;


# instance fields
.field private b:Landroid/content/Context;

.field private c:I

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;

.field private g:Ljava/lang/String;

.field private h:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/mobclick/android/k;->a:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    iput-object p1, p0, Lcom/mobclick/android/k;->b:Landroid/content/Context;

    iput p2, p0, Lcom/mobclick/android/k;->c:I

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    iput-object p1, p0, Lcom/mobclick/android/k;->b:Landroid/content/Context;

    iput p3, p0, Lcom/mobclick/android/k;->c:I

    iput-object p2, p0, Lcom/mobclick/android/k;->d:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    iput-object p1, p0, Lcom/mobclick/android/k;->b:Landroid/content/Context;

    iput p4, p0, Lcom/mobclick/android/k;->c:I

    iput-object p2, p0, Lcom/mobclick/android/k;->d:Ljava/lang/String;

    iput-object p3, p0, Lcom/mobclick/android/k;->e:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    iput-object p1, p0, Lcom/mobclick/android/k;->b:Landroid/content/Context;

    iput-object p2, p0, Lcom/mobclick/android/k;->d:Ljava/lang/String;

    iput-object p3, p0, Lcom/mobclick/android/k;->f:Ljava/lang/String;

    iput-object p4, p0, Lcom/mobclick/android/k;->g:Ljava/lang/String;

    iput p5, p0, Lcom/mobclick/android/k;->h:I

    iput p6, p0, Lcom/mobclick/android/k;->c:I

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    :try_start_0
    sget-object v6, Lcom/mobclick/android/k;->a:Ljava/lang/Object;

    monitor-enter v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget v0, p0, Lcom/mobclick/android/k;->c:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_2

    :try_start_2
    iget-object v0, p0, Lcom/mobclick/android/k;->b:Landroid/content/Context;

    if-nez v0, :cond_0

    const-string v0, "MobclickAgent"

    const-string v1, "unexpected null context"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :try_start_3
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_0
    return-void

    :cond_0
    :try_start_4
    invoke-static {}, Lcom/mobclick/android/MobclickAgent;->a()Lcom/mobclick/android/MobclickAgent;

    move-result-object v0

    iget-object v1, p0, Lcom/mobclick/android/k;->b:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/mobclick/android/MobclickAgent;->a(Lcom/mobclick/android/MobclickAgent;Landroid/content/Context;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    :cond_1
    :goto_1
    :try_start_5
    monitor-exit v6

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    :catch_0
    move-exception v0

    const-string v1, "MobclickAgent"

    const-string v2, "Exception occurred when recording usage."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v0

    :try_start_7
    const-string v1, "MobclickAgent"

    const-string v2, "Exception occurred in Mobclick.onRause(). "

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    :cond_2
    iget v0, p0, Lcom/mobclick/android/k;->c:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    invoke-static {}, Lcom/mobclick/android/MobclickAgent;->a()Lcom/mobclick/android/MobclickAgent;

    move-result-object v0

    iget-object v1, p0, Lcom/mobclick/android/k;->b:Landroid/content/Context;

    iget-object v2, p0, Lcom/mobclick/android/k;->d:Ljava/lang/String;

    iget-object v3, p0, Lcom/mobclick/android/k;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Lcom/mobclick/android/MobclickAgent;->a(Lcom/mobclick/android/MobclickAgent;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    iget v0, p0, Lcom/mobclick/android/k;->c:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_4

    invoke-static {}, Lcom/mobclick/android/MobclickAgent;->a()Lcom/mobclick/android/MobclickAgent;

    move-result-object v0

    iget-object v1, p0, Lcom/mobclick/android/k;->b:Landroid/content/Context;

    iget-object v2, p0, Lcom/mobclick/android/k;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/mobclick/android/MobclickAgent;->a(Lcom/mobclick/android/MobclickAgent;Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    iget v0, p0, Lcom/mobclick/android/k;->c:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    invoke-static {}, Lcom/mobclick/android/MobclickAgent;->a()Lcom/mobclick/android/MobclickAgent;

    move-result-object v0

    iget-object v1, p0, Lcom/mobclick/android/k;->b:Landroid/content/Context;

    iget-object v2, p0, Lcom/mobclick/android/k;->d:Ljava/lang/String;

    iget-object v3, p0, Lcom/mobclick/android/k;->f:Ljava/lang/String;

    iget-object v4, p0, Lcom/mobclick/android/k;->g:Ljava/lang/String;

    iget v5, p0, Lcom/mobclick/android/k;->h:I

    invoke-static/range {v0 .. v5}, Lcom/mobclick/android/MobclickAgent;->a(Lcom/mobclick/android/MobclickAgent;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_1
.end method
