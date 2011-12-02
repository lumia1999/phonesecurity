.class public Lcom/mobclick/android/a;
.super Ljava/lang/Object;


# static fields
.field private static g:Landroid/app/Notification;


# instance fields
.field private a:Landroid/content/Context;

.field private b:I

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;

.field private h:Landroid/app/NotificationManager;

.field private i:I

.field private j:Z

.field private k:Z

.field private l:I

.field private m:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/mobclick/android/a;->g:Landroid/app/Notification;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const/4 v1, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x32

    iput v0, p0, Lcom/mobclick/android/a;->b:I

    iput-boolean v1, p0, Lcom/mobclick/android/a;->j:Z

    iput-boolean v1, p0, Lcom/mobclick/android/a;->k:Z

    sget v0, Lcom/mobclick/android/d;->a:I

    iput v0, p0, Lcom/mobclick/android/a;->l:I

    new-instance v0, Lcom/mobclick/android/b;

    invoke-direct {v0, p0}, Lcom/mobclick/android/b;-><init>(Lcom/mobclick/android/a;)V

    iput-object v0, p0, Lcom/mobclick/android/a;->m:Landroid/os/Handler;

    :try_start_0
    invoke-direct/range {p0 .. p6}, Lcom/mobclick/android/a;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mobclick/android/a;->j:Z

    goto :goto_0
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mobclick/android/a;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ".R$"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    const-string v1, "getIdByReflection error"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic a(Lcom/mobclick/android/a;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mobclick/android/a;->c:Ljava/lang/String;

    return-object v0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".apk"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    const/4 v4, 0x0

    iput-object p1, p0, Lcom/mobclick/android/a;->a:Landroid/content/Context;

    iput-object p6, p0, Lcom/mobclick/android/a;->f:Ljava/lang/String;

    invoke-direct {p0}, Lcom/mobclick/android/a;->e()V

    iget v0, p0, Lcom/mobclick/android/a;->l:I

    sget v1, Lcom/mobclick/android/d;->b:I

    if-ne v0, v1, :cond_0

    iput-boolean v4, p0, Lcom/mobclick/android/a;->j:Z

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/download"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mobclick/android/a;->c:Ljava/lang/String;

    iput-object p2, p0, Lcom/mobclick/android/a;->e:Ljava/lang/String;

    const v0, 0x1080081

    iput v0, p0, Lcom/mobclick/android/a;->i:I

    new-instance v0, Landroid/app/Notification;

    iget v1, p0, Lcom/mobclick/android/a;->i:I

    const-wide/16 v2, 0x1

    invoke-direct {v0, v1, p3, v2, v3}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    sput-object v0, Lcom/mobclick/android/a;->g:Landroid/app/Notification;

    sget-object v0, Lcom/mobclick/android/a;->g:Landroid/app/Notification;

    iget v1, v0, Landroid/app/Notification;->flags:I

    or-int/lit8 v1, v1, 0x2

    iput v1, v0, Landroid/app/Notification;->flags:I

    new-instance v0, Landroid/widget/RemoteViews;

    iget-object v1, p0, Lcom/mobclick/android/a;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "layout"

    const-string v3, "umeng_download_notification"

    invoke-direct {p0, v2, v3}, Lcom/mobclick/android/a;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    const-string v1, "id"

    const-string v2, "progress_bar"

    invoke-direct {p0, v1, v2}, Lcom/mobclick/android/a;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    const/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v4, v4}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    const-string v1, "id"

    const-string v2, "progress_text"

    invoke-direct {p0, v1, v2}, Lcom/mobclick/android/a;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    const-string v2, "0%"

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const-string v1, "id"

    const-string v2, "title"

    invoke-direct {p0, v1, v2}, Lcom/mobclick/android/a;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1, p4}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const-string v1, "id"

    const-string v2, "description"

    invoke-direct {p0, v1, v2}, Lcom/mobclick/android/a;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1, p5}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const-string v1, "id"

    const-string v2, "appIcon"

    invoke-direct {p0, v1, v2}, Lcom/mobclick/android/a;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    iget v2, p0, Lcom/mobclick/android/a;->i:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    sget-object v1, Lcom/mobclick/android/a;->g:Landroid/app/Notification;

    iput-object v0, v1, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    sget-object v1, Lcom/mobclick/android/a;->g:Landroid/app/Notification;

    iget-object v2, p0, Lcom/mobclick/android/a;->a:Landroid/content/Context;

    const/high16 v3, 0x800

    invoke-static {v2, v4, v0, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    iput-object v0, v1, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    iget-object v0, p0, Lcom/mobclick/android/a;->a:Landroid/content/Context;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/mobclick/android/a;->h:Landroid/app/NotificationManager;

    goto/16 :goto_0
.end method

.method static synthetic a(Lcom/mobclick/android/a;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/mobclick/android/a;->j:Z

    return-void
.end method

.method static synthetic b(Lcom/mobclick/android/a;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mobclick/android/a;->d:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic b(Lcom/mobclick/android/a;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mobclick/android/a;->b(Z)V

    return-void
.end method

.method private b(Z)V
    .locals 12

    const/4 v11, 0x0

    :try_start_0
    new-instance v0, Ljava/net/URL;

    iget-object v1, p0, Lcom/mobclick/android/a;->e:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    const/16 v1, 0x1388

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    iget-object v2, p0, Lcom/mobclick/android/a;->h:Landroid/app/NotificationManager;

    const/4 v3, 0x0

    sget-object v4, Lcom/mobclick/android/a;->g:Landroid/app/Notification;

    invoke-virtual {v2, v3, v4}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    const/16 v2, 0x1000

    new-array v2, v2, [B

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v0

    iget-object v3, p0, Lcom/mobclick/android/a;->a:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/mobclick/android/a;->f:Ljava/lang/String;

    invoke-static {v3, v4, v0}, Lcom/mobclick/android/a;->a(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mobclick/android/a;->d:Ljava/lang/String;

    if-eqz p1, :cond_0

    new-instance v3, Ljava/io/FileOutputStream;

    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lcom/mobclick/android/a;->c:Ljava/lang/String;

    iget-object v6, p0, Lcom/mobclick/android/a;->d:Ljava/lang/String;

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move v4, v11

    move v5, v11

    :goto_0
    invoke-virtual {v1, v2}, Ljava/io/InputStream;->read([B)I

    move-result v6

    if-gtz v6, :cond_1

    :goto_1
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    iget-boolean v0, p0, Lcom/mobclick/android/a;->j:Z

    if-nez v0, :cond_4

    invoke-direct {p0}, Lcom/mobclick/android/a;->d()V

    :goto_2
    return-void

    :cond_0
    iget-object v3, p0, Lcom/mobclick/android/a;->a:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mobclick/android/a;->c:Ljava/lang/String;

    iget-object v3, p0, Lcom/mobclick/android/a;->a:Landroid/content/Context;

    iget-object v4, p0, Lcom/mobclick/android/a;->d:Ljava/lang/String;

    const/4 v5, 0x3

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v3

    move v4, v11

    move v5, v11

    goto :goto_0

    :cond_1
    const/4 v7, 0x0

    invoke-virtual {v3, v2, v7, v6}, Ljava/io/FileOutputStream;->write([BII)V

    add-int/2addr v4, v6

    add-int/lit8 v6, v5, 0x1

    iget v7, p0, Lcom/mobclick/android/a;->b:I

    rem-int/2addr v5, v7

    if-nez v5, :cond_3

    invoke-direct {p0}, Lcom/mobclick/android/a;->f()Z

    move-result v5

    if-nez v5, :cond_2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mobclick/android/a;->j:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    iput-boolean v11, p0, Lcom/mobclick/android/a;->j:Z

    invoke-direct {p0}, Lcom/mobclick/android/a;->d()V

    goto :goto_2

    :cond_2
    int-to-float v5, v4

    const/high16 v7, 0x42c8

    mul-float/2addr v5, v7

    int-to-float v7, v0

    div-float/2addr v5, v7

    float-to-int v5, v5

    :try_start_1
    sget-object v7, Lcom/mobclick/android/a;->g:Landroid/app/Notification;

    iget-object v7, v7, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    const-string v8, "id"

    const-string v9, "progress_bar"

    invoke-direct {p0, v8, v9}, Lcom/mobclick/android/a;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v8

    const/16 v9, 0x64

    const/4 v10, 0x0

    invoke-virtual {v7, v8, v9, v5, v10}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    sget-object v7, Lcom/mobclick/android/a;->g:Landroid/app/Notification;

    iget-object v7, v7, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    const-string v8, "id"

    const-string v9, "progress_text"

    invoke-direct {p0, v8, v9}, Lcom/mobclick/android/a;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v9, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "%"

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v8, v5}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    iget-object v5, p0, Lcom/mobclick/android/a;->h:Landroid/app/NotificationManager;

    const/4 v7, 0x0

    sget-object v8, Lcom/mobclick/android/a;->g:Landroid/app/Notification;

    invoke-virtual {v5, v7, v8}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    :cond_3
    move v5, v6

    goto/16 :goto_0

    :cond_4
    invoke-direct {p0}, Lcom/mobclick/android/a;->d()V

    iget-object v0, p0, Lcom/mobclick/android/a;->m:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2
.end method

.method public static b()Z
    .locals 1

    sget-object v0, Lcom/mobclick/android/a;->g:Landroid/app/Notification;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method static synthetic c(Lcom/mobclick/android/a;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/mobclick/android/a;->a:Landroid/content/Context;

    return-object v0
.end method

.method private c(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_0
    return-void
.end method

.method static synthetic d(Lcom/mobclick/android/a;)I
    .locals 1

    iget v0, p0, Lcom/mobclick/android/a;->l:I

    return v0
.end method

.method private d()V
    .locals 2

    iget-object v0, p0, Lcom/mobclick/android/a;->h:Landroid/app/NotificationManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    const/4 v0, 0x0

    sput-object v0, Lcom/mobclick/android/a;->g:Landroid/app/Notification;

    return-void
.end method

.method private e()V
    .locals 3

    invoke-direct {p0}, Lcom/mobclick/android/a;->f()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mobclick/android/a;->a:Landroid/content/Context;

    invoke-direct {p0}, Lcom/mobclick/android/a;->h()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    sget v0, Lcom/mobclick/android/d;->b:I

    iput v0, p0, Lcom/mobclick/android/a;->l:I

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0}, Lcom/mobclick/android/a;->g()Z

    move-result v0

    if-nez v0, :cond_1

    sget v0, Lcom/mobclick/android/d;->c:I

    iput v0, p0, Lcom/mobclick/android/a;->l:I

    goto :goto_0

    :cond_1
    sget v0, Lcom/mobclick/android/d;->a:I

    iput v0, p0, Lcom/mobclick/android/a;->l:I

    goto :goto_0
.end method

.method static synthetic e(Lcom/mobclick/android/a;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/mobclick/android/a;->k:Z

    return v0
.end method

.method private f()Z
    .locals 3

    const/4 v2, 0x0

    :try_start_0
    iget-object v0, p0, Lcom/mobclick/android/a;->a:Landroid/content/Context;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    return v0

    :cond_0
    move v0, v2

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move v0, v2

    goto :goto_0
.end method

.method private g()Z
    .locals 2

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private h()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/mobclick/android/a;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mobclick/android/n;->k:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/mobclick/android/n;->l:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public a(I)V
    .locals 3

    iput p1, p0, Lcom/mobclick/android/a;->i:I

    sget-object v0, Lcom/mobclick/android/a;->g:Landroid/app/Notification;

    iput p1, v0, Landroid/app/Notification;->icon:I

    sget-object v0, Lcom/mobclick/android/a;->g:Landroid/app/Notification;

    iget-object v0, v0, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    const-string v1, "id"

    const-string v2, "appIcon"

    invoke-direct {p0, v1, v2}, Lcom/mobclick/android/a;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 3

    sget-object v0, Lcom/mobclick/android/a;->g:Landroid/app/Notification;

    iget-object v0, v0, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    const-string v1, "id"

    const-string v2, "title"

    invoke-direct {p0, v1, v2}, Lcom/mobclick/android/a;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    return-void
.end method

.method public a(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/mobclick/android/a;->k:Z

    return-void
.end method

.method public a()Z
    .locals 1

    iget-boolean v0, p0, Lcom/mobclick/android/a;->j:Z

    return v0
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mobclick/android/a;->c:Ljava/lang/String;

    return-void
.end method

.method public c()V
    .locals 2

    iget-boolean v0, p0, Lcom/mobclick/android/a;->j:Z

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/mobclick/android/a;->c:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/mobclick/android/a;->c(Ljava/lang/String;)V

    new-instance v0, Lcom/mobclick/android/c;

    invoke-direct {v0, p0}, Lcom/mobclick/android/c;-><init>(Lcom/mobclick/android/a;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "MobclickAgent"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
