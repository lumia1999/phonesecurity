.class public final Lcom/yingyonghui/market/downloader/h;
.super Ljava/lang/Object;
.source "DownloadInfo.java"


# instance fields
.field public a:I

.field public b:Ljava/lang/String;

.field public c:Z

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:J

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/String;

.field public q:Ljava/lang/String;

.field public r:Ljava/lang/String;

.field public s:Ljava/lang/String;

.field public t:I

.field public u:I

.field public v:Ljava/lang/String;

.field public volatile w:Z

.field private x:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIIIIIJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V
    .locals 3
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput p1, p0, Lcom/yingyonghui/market/downloader/h;->a:I

    .line 53
    iput-object p2, p0, Lcom/yingyonghui/market/downloader/h;->b:Ljava/lang/String;

    .line 54
    iput-boolean p3, p0, Lcom/yingyonghui/market/downloader/h;->c:Z

    .line 55
    iput-object p4, p0, Lcom/yingyonghui/market/downloader/h;->d:Ljava/lang/String;

    .line 56
    iput-object p5, p0, Lcom/yingyonghui/market/downloader/h;->e:Ljava/lang/String;

    .line 57
    iput-object p6, p0, Lcom/yingyonghui/market/downloader/h;->f:Ljava/lang/String;

    .line 58
    iput p7, p0, Lcom/yingyonghui/market/downloader/h;->g:I

    .line 59
    iput p8, p0, Lcom/yingyonghui/market/downloader/h;->h:I

    .line 60
    iput p9, p0, Lcom/yingyonghui/market/downloader/h;->i:I

    .line 61
    iput p10, p0, Lcom/yingyonghui/market/downloader/h;->j:I

    .line 62
    iput p11, p0, Lcom/yingyonghui/market/downloader/h;->k:I

    .line 63
    iput p12, p0, Lcom/yingyonghui/market/downloader/h;->l:I

    .line 64
    move/from16 v0, p13

    move-object v1, p0

    iput v0, v1, Lcom/yingyonghui/market/downloader/h;->m:I

    .line 65
    move-wide/from16 v0, p14

    move-object v2, p0

    iput-wide v0, v2, Lcom/yingyonghui/market/downloader/h;->n:J

    .line 66
    move-object/from16 v0, p16

    move-object v1, p0

    iput-object v0, v1, Lcom/yingyonghui/market/downloader/h;->o:Ljava/lang/String;

    .line 67
    move-object/from16 v0, p17

    move-object v1, p0

    iput-object v0, v1, Lcom/yingyonghui/market/downloader/h;->p:Ljava/lang/String;

    .line 68
    move-object/from16 v0, p18

    move-object v1, p0

    iput-object v0, v1, Lcom/yingyonghui/market/downloader/h;->x:Ljava/lang/String;

    .line 69
    move-object/from16 v0, p19

    move-object v1, p0

    iput-object v0, v1, Lcom/yingyonghui/market/downloader/h;->q:Ljava/lang/String;

    .line 70
    move-object/from16 v0, p20

    move-object v1, p0

    iput-object v0, v1, Lcom/yingyonghui/market/downloader/h;->r:Ljava/lang/String;

    .line 71
    move-object/from16 v0, p21

    move-object v1, p0

    iput-object v0, v1, Lcom/yingyonghui/market/downloader/h;->s:Ljava/lang/String;

    .line 72
    move/from16 v0, p22

    move-object v1, p0

    iput v0, v1, Lcom/yingyonghui/market/downloader/h;->t:I

    .line 73
    move/from16 v0, p23

    move-object v1, p0

    iput v0, v1, Lcom/yingyonghui/market/downloader/h;->u:I

    .line 74
    move-object/from16 v0, p24

    move-object v1, p0

    iput-object v0, v1, Lcom/yingyonghui/market/downloader/h;->v:Ljava/lang/String;

    .line 76
    return-void
.end method


# virtual methods
.method public final a()J
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 98
    iget v0, p0, Lcom/yingyonghui/market/downloader/h;->l:I

    if-lez v0, :cond_0

    .line 99
    iget-wide v0, p0, Lcom/yingyonghui/market/downloader/h;->n:J

    iget v2, p0, Lcom/yingyonghui/market/downloader/h;->l:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 101
    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/yingyonghui/market/downloader/h;->n:J

    sget-object v2, Lcom/yingyonghui/market/downloader/d;->a:Ljava/util/Random;

    const/16 v3, 0x3e9

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    add-int/lit16 v2, v2, 0x3e8

    mul-int/lit8 v2, v2, 0x1e

    iget v3, p0, Lcom/yingyonghui/market/downloader/h;->k:I

    sub-int/2addr v3, v4

    shl-int v3, v4, v3

    mul-int/2addr v2, v3

    int-to-long v2, v2

    add-long/2addr v0, v2

    goto :goto_0
.end method

.method public final a(Landroid/net/Uri;Landroid/content/Context;)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 79
    iget-object v0, p0, Lcom/yingyonghui/market/downloader/h;->o:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/yingyonghui/market/downloader/h;->p:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 80
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.DOWNLOAD_COMPLETED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 81
    iget-object v1, p0, Lcom/yingyonghui/market/downloader/h;->o:Ljava/lang/String;

    iget-object v2, p0, Lcom/yingyonghui/market/downloader/h;->p:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 82
    iget-object v1, p0, Lcom/yingyonghui/market/downloader/h;->x:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 83
    const-string v1, "notificationextras"

    iget-object v2, p0, Lcom/yingyonghui/market/downloader/h;->x:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 88
    :cond_0
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 89
    invoke-virtual {p2, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 91
    :cond_1
    return-void
.end method

.method public final a(ZZ)Z
    .locals 4
    .parameter
    .parameter

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 193
    if-nez p1, :cond_0

    move v0, v2

    .line 199
    :goto_0
    return v0

    .line 196
    :cond_0
    iget v0, p0, Lcom/yingyonghui/market/downloader/h;->g:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    .line 197
    if-nez p2, :cond_1

    move v0, v3

    goto :goto_0

    :cond_1
    move v0, v2

    goto :goto_0

    :cond_2
    move v0, v3

    .line 199
    goto :goto_0
.end method
