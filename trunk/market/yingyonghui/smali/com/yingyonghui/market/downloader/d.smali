.class public final Lcom/yingyonghui/market/downloader/d;
.super Ljava/lang/Object;
.source "Helpers.java"


# static fields
.field public static a:Ljava/util/Random;

.field private static final b:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 33
    new-instance v0, Ljava/util/Random;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Random;-><init>(J)V

    sput-object v0, Lcom/yingyonghui/market/downloader/d;->a:Ljava/util/Random;

    .line 36
    const-string v0, "attachment;\\s*filename\\s*=\\s*\"([^\"]*)\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/yingyonghui/market/downloader/d;->b:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static a(Ljava/io/File;)J
    .locals 5
    .parameter

    .prologue
    .line 272
    new-instance v0, Landroid/os/StatFs;

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 274
    invoke-virtual {v0}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v1

    int-to-long v1, v1

    const-wide/16 v3, 0x4

    sub-long/2addr v1, v3

    .line 275
    invoke-virtual {v0}, Landroid/os/StatFs;->getBlockSize()I

    move-result v0

    int-to-long v3, v0

    mul-long v0, v3, v1

    return-wide v0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)Lcom/yingyonghui/market/downloader/f;
    .locals 14
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 83
    if-eqz p6, :cond_0

    const/4 v4, 0x2

    move/from16 v0, p6

    move v1, v4

    if-ne v0, v1, :cond_2

    .line 85
    :cond_0
    if-nez p5, :cond_1

    .line 87
    const-string p0, "DownloadManager"

    const-string p1, "external download with no mime type not allowed"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    new-instance p0, Lcom/yingyonghui/market/downloader/f;

    const/4 p1, 0x0

    const/16 p2, 0x0

    const/16 p3, 0x196

    invoke-direct/range {p0 .. p3}, Lcom/yingyonghui/market/downloader/f;-><init>(Ljava/lang/String;Ljava/io/FileOutputStream;I)V

    .line 218
    :goto_0
    return-object p0

    .line 95
    :cond_1
    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 104
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 105
    const-string v6, "file"

    const-string v7, ""

    const/4 v8, 0x0

    invoke-static {v6, v7, v8}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    move-object v0, v4

    move-object v1, v6

    move-object/from16 v2, p5

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 106
    const/high16 v6, 0x1

    invoke-virtual {v5, v4, v6}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v4

    .line 109
    if-nez v4, :cond_2

    .line 111
    const-string p0, "DownloadManager"

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "no handler found for type "

    invoke-virtual/range {p1 .. p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    move-object v0, p1

    move-object/from16 v1, p5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    new-instance p0, Lcom/yingyonghui/market/downloader/f;

    const/4 p1, 0x0

    const/16 p2, 0x0

    const/16 p3, 0x196

    invoke-direct/range {p0 .. p3}, Lcom/yingyonghui/market/downloader/f;-><init>(Ljava/lang/String;Ljava/io/FileOutputStream;I)V

    goto :goto_0

    .line 117
    :cond_2
    const/4 v4, 0x0

    if-eqz p2, :cond_15

    const-string v5, "/"

    move-object/from16 v0, p2

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_15

    const/16 v4, 0x2f

    move-object/from16 v0, p2

    move v1, v4

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    if-lez v4, :cond_3

    move-object/from16 v0, p2

    move v1, v4

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    :cond_3
    :goto_1
    if-nez p2, :cond_4

    if-eqz p3, :cond_4

    invoke-static/range {p3 .. p3}, Lcom/yingyonghui/market/downloader/d;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_4

    const/16 p3, 0x2f

    invoke-virtual/range {p2 .. p3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result p3

    add-int/lit8 p3, p3, 0x1

    if-lez p3, :cond_4

    invoke-virtual/range {p2 .. p3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    :cond_4
    if-nez p2, :cond_5

    if-eqz p4, :cond_5

    invoke-static/range {p4 .. p4}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    if-eqz p3, :cond_5

    const-string p4, "/"

    invoke-virtual/range {p3 .. p4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p4

    if-nez p4, :cond_5

    const/16 p4, 0x3f

    invoke-virtual/range {p3 .. p4}, Ljava/lang/String;->indexOf(I)I

    move-result p4

    if-gez p4, :cond_5

    const/16 p2, 0x2f

    move-object/from16 v0, p3

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result p2

    add-int/lit8 p2, p2, 0x1

    if-lez p2, :cond_8

    move-object/from16 v0, p3

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    :cond_5
    :goto_2
    if-nez p2, :cond_14

    invoke-static {p1}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_14

    const-string p3, "/"

    move-object v0, p1

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p3

    if-nez p3, :cond_14

    const/16 p3, 0x3f

    move-object v0, p1

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result p3

    if-gez p3, :cond_14

    const/16 p3, 0x2f

    move-object v0, p1

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result p3

    add-int/lit8 p3, p3, 0x1

    if-lez p3, :cond_14

    move-object v0, p1

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    :goto_3
    if-nez p1, :cond_6

    const-string p1, "downloadfile"

    :cond_6
    const-string p2, "[^a-zA-Z0-9\\.\\-_]+"

    const-string p3, "_"

    invoke-virtual/range {p1 .. p3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 122
    const/16 p2, 0x2e

    invoke-virtual/range {p1 .. p2}, Ljava/lang/String;->indexOf(I)I

    move-result p2

    .line 124
    if-gez p2, :cond_9

    .line 125
    const/16 p2, 0x1

    move-object/from16 v0, p5

    move/from16 v1, p2

    invoke-static {v0, v1}, Lcom/yingyonghui/market/downloader/d;->a(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p2

    move-object/from16 v13, p2

    move-object/from16 p2, p1

    move-object p1, v13

    .line 136
    :goto_4
    const/16 p3, 0x1

    move/from16 v0, p6

    move/from16 v1, p3

    if-eq v0, v1, :cond_7

    const/16 p3, 0x2

    move/from16 v0, p6

    move/from16 v1, p3

    if-eq v0, v1, :cond_7

    const/16 p3, 0x3

    move/from16 v0, p6

    move/from16 v1, p3

    if-ne v0, v1, :cond_f

    .line 145
    :cond_7
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p3

    .line 147
    new-instance p4, Landroid/os/StatFs;

    invoke-virtual/range {p3 .. p3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p5

    invoke-direct/range {p4 .. p5}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 153
    invoke-virtual/range {p4 .. p4}, Landroid/os/StatFs;->getBlockSize()I

    move-result p5

    .line 155
    :goto_5
    invoke-virtual/range {p4 .. p4}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v4

    .line 156
    move/from16 v0, p5

    int-to-long v0, v0

    move-wide v5, v0

    int-to-long v7, v4

    const-wide/16 v9, 0x4

    sub-long/2addr v7, v9

    mul-long/2addr v5, v7

    move/from16 v0, p7

    int-to-long v0, v0

    move-wide v7, v0

    cmp-long v5, v5, v7

    if-gez v5, :cond_e

    .line 157
    move/from16 v0, p7

    int-to-long v0, v0

    move-wide v5, v0

    move/from16 v0, p5

    int-to-long v0, v0

    move-wide v7, v0

    int-to-long v9, v4

    const-wide/16 v11, 0x4

    sub-long/2addr v9, v11

    mul-long/2addr v7, v9

    sub-long v4, v5, v7

    invoke-static {p0, v4, v5}, Lcom/yingyonghui/market/downloader/d;->a(Landroid/content/Context;J)Z

    move-result v4

    if-nez v4, :cond_d

    .line 162
    const-string p0, "DownloadManager"

    const-string p1, "download aborted - not enough free space in internal storage"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    new-instance p0, Lcom/yingyonghui/market/downloader/f;

    const/4 p1, 0x0

    const/16 p2, 0x0

    const/16 p3, 0x1ec

    invoke-direct/range {p0 .. p3}, Lcom/yingyonghui/market/downloader/f;-><init>(Ljava/lang/String;Ljava/io/FileOutputStream;I)V

    goto/16 :goto_0

    :cond_8
    move-object/from16 p2, p3

    .line 117
    goto/16 :goto_2

    .line 127
    :cond_9
    const/16 p3, 0x0

    if-eqz p5, :cond_b

    const/16 p4, 0x2e

    move-object v0, p1

    move/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result p4

    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v4

    add-int/lit8 p4, p4, 0x1

    move-object v0, p1

    move/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p4

    move-object v0, v4

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    if-eqz p4, :cond_a

    invoke-virtual/range {p4 .. p5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p4

    if-nez p4, :cond_b

    :cond_a
    const/16 p3, 0x0

    move-object/from16 v0, p5

    move/from16 v1, p3

    invoke-static {v0, v1}, Lcom/yingyonghui/market/downloader/d;->a(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p3

    :cond_b
    if-nez p3, :cond_c

    invoke-virtual/range {p1 .. p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p3

    .line 129
    :cond_c
    const/16 p4, 0x0

    move-object v0, p1

    move/from16 v1, p4

    move/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    move-object/from16 p2, p1

    move-object/from16 p1, p3

    goto/16 :goto_4

    .line 167
    :cond_d
    invoke-virtual/range {p3 .. p3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p4

    move-object v1, v4

    invoke-virtual {v0, v1}, Landroid/os/StatFs;->restat(Ljava/lang/String;)V

    goto/16 :goto_5

    :cond_e
    move-object/from16 p0, p3

    .line 202
    :goto_6
    const-string p3, "recovery"

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct/range {p4 .. p4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p4

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    move-object/from16 v0, p4

    move-object v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual/range {p4 .. p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual/range {p3 .. p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p3

    .line 204
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct/range {p4 .. p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    move-object/from16 v0, p4

    move-object v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-object p4, Ljava/io/File;->separator:Ljava/lang/String;

    move-object v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    move-object v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 213
    move/from16 v0, p6

    move-object v1, p0

    move-object v2, p1

    move/from16 v3, p3

    invoke-static {v0, v1, v2, v3}, Lcom/yingyonghui/market/downloader/d;->a(ILjava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    .line 215
    if-eqz p0, :cond_12

    .line 216
    new-instance p1, Lcom/yingyonghui/market/downloader/f;

    new-instance p2, Ljava/io/FileOutputStream;

    move-object/from16 v0, p2

    move-object v1, p0

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const/16 p3, 0x0

    move-object v0, p1

    move-object v1, p0

    move-object/from16 v2, p2

    move/from16 v3, p3

    invoke-direct {v0, v1, v2, v3}, Lcom/yingyonghui/market/downloader/f;-><init>(Ljava/lang/String;Ljava/io/FileOutputStream;I)V

    move-object p0, p1

    goto/16 :goto_0

    .line 171
    :cond_f
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object p0

    const-string p3, "mounted"

    move-object v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_11

    .line 172
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    .line 173
    new-instance p3, Ljava/io/File;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct/range {p4 .. p4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p4

    move-object v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p4, "/Yingyonghui"

    move-object v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    move-object/from16 v0, p3

    move-object v1, p0

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 174
    invoke-virtual/range {p3 .. p3}, Ljava/io/File;->isDirectory()Z

    move-result p0

    if-nez p0, :cond_10

    invoke-virtual/range {p3 .. p3}, Ljava/io/File;->mkdir()Z

    move-result p0

    if-nez p0, :cond_10

    .line 176
    const-string p0, "DownloadManager"

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "download aborted - can\'t create base directory "

    invoke-virtual/range {p1 .. p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual/range {p3 .. p3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual/range {p1 .. p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    new-instance p0, Lcom/yingyonghui/market/downloader/f;

    const/4 p1, 0x0

    const/16 p2, 0x0

    const/16 p3, 0x1ec

    invoke-direct/range {p0 .. p3}, Lcom/yingyonghui/market/downloader/f;-><init>(Ljava/lang/String;Ljava/io/FileOutputStream;I)V

    goto/16 :goto_0

    .line 181
    :cond_10
    new-instance p0, Landroid/os/StatFs;

    invoke-virtual/range {p3 .. p3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p4

    move-object v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 193
    invoke-virtual {p0}, Landroid/os/StatFs;->getBlockSize()I

    move-result p4

    move/from16 v0, p4

    int-to-long v0, v0

    move-wide/from16 p4, v0

    invoke-virtual {p0}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result p0

    int-to-long v4, p0

    const-wide/16 v6, 0x4

    sub-long/2addr v4, v6

    mul-long p4, p4, v4

    move/from16 v0, p7

    int-to-long v0, v0

    move-wide v4, v0

    cmp-long p0, p4, v4

    if-gez p0, :cond_13

    .line 195
    const-string p0, "DownloadManager"

    const-string p1, "download aborted - not enough free space"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    new-instance p0, Lcom/yingyonghui/market/downloader/f;

    const/4 p1, 0x0

    const/16 p2, 0x0

    const/16 p3, 0x1ec

    invoke-direct/range {p0 .. p3}, Lcom/yingyonghui/market/downloader/f;-><init>(Ljava/lang/String;Ljava/io/FileOutputStream;I)V

    goto/16 :goto_0

    .line 184
    :cond_11
    const-string p0, "DownloadManager"

    const-string p1, "download aborted - no external storage"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    new-instance p0, Lcom/yingyonghui/market/downloader/f;

    const/4 p1, 0x0

    const/16 p2, 0x0

    const/16 p3, 0x1ec

    invoke-direct/range {p0 .. p3}, Lcom/yingyonghui/market/downloader/f;-><init>(Ljava/lang/String;Ljava/io/FileOutputStream;I)V

    goto/16 :goto_0

    .line 218
    :cond_12
    new-instance p0, Lcom/yingyonghui/market/downloader/f;

    const/4 p1, 0x0

    const/16 p2, 0x0

    const/16 p3, 0x1ec

    invoke-direct/range {p0 .. p3}, Lcom/yingyonghui/market/downloader/f;-><init>(Ljava/lang/String;Ljava/io/FileOutputStream;I)V

    goto/16 :goto_0

    :cond_13
    move-object/from16 p0, p3

    goto/16 :goto_6

    :cond_14
    move-object/from16 p1, p2

    goto/16 :goto_3

    :cond_15
    move-object/from16 p2, v4

    goto/16 :goto_1
.end method

.method private static a(ILjava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 7
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v2, 0x1

    .line 468
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 469
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    if-eqz p3, :cond_0

    if-eq p0, v2, :cond_1

    const/4 v1, 0x2

    if-eq p0, v1, :cond_1

    const/4 v1, 0x3

    if-eq p0, v1, :cond_1

    .line 504
    :cond_0
    :goto_0
    return-object v0

    .line 476
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move v1, v2

    .line 492
    :goto_1
    const v3, 0x3b9aca00

    if-ge v1, v3, :cond_4

    .line 493
    const/4 v3, 0x0

    move v6, v3

    move v3, v2

    move v2, v6

    :goto_2
    const/16 v4, 0x9

    if-ge v2, v4, :cond_3

    .line 494
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 495
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_2

    move-object v0, v4

    .line 496
    goto :goto_0

    .line 501
    :cond_2
    sget-object v4, Lcom/yingyonghui/market/downloader/d;->a:Ljava/util/Random;

    invoke-virtual {v4, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    add-int/2addr v3, v4

    .line 493
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 492
    :cond_3
    mul-int/lit8 v1, v1, 0xa

    move v2, v3

    goto :goto_1

    .line 504
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static a(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 398
    const/4 v0, 0x0

    .line 399
    if-eqz p0, :cond_0

    .line 400
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/webkit/MimeTypeMap;->getExtensionFromMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 401
    if-eqz v0, :cond_0

    .line 405
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 412
    :cond_0
    if-nez v0, :cond_1

    .line 413
    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, "text/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 414
    const-string v1, "text/html"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 418
    const-string v0, ".html"

    .line 432
    :cond_1
    :goto_0
    return-object v0

    .line 419
    :cond_2
    if-eqz p1, :cond_1

    .line 423
    const-string v0, ".txt"

    goto :goto_0

    .line 425
    :cond_3
    if-eqz p1, :cond_1

    .line 429
    const-string v0, ".bin"

    goto :goto_0
.end method

.method public static final a(Landroid/content/Context;J)Z
    .locals 10
    .parameter
    .parameter

    .prologue
    const-wide/16 v8, 0x0

    const/4 v7, 0x0

    const/4 v2, 0x0

    .line 228
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    const-string v3, "( status = \'200\' AND destination = \'2\' )"

    const-string v5, "lastmod"

    move-object v4, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 237
    if-nez v0, :cond_0

    move v0, v7

    .line 265
    :goto_0
    return v0

    .line 242
    :cond_0
    :try_start_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-wide v1, v8

    .line 243
    :goto_1
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v3

    if-nez v3, :cond_1

    cmp-long v3, v1, p1

    if-gez v3, :cond_1

    .line 244
    new-instance v3, Ljava/io/File;

    const-string v4, "_data"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 249
    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v4

    add-long/2addr v1, v4

    .line 250
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 251
    const-string v3, "_id"

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    .line 252
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v6, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    invoke-static {v6, v3, v4}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v6, 0x0

    invoke-virtual {v5, v3, v4, v6}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 254
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 257
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw v1

    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 265
    cmp-long v0, v1, v8

    if-lez v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    move v0, v7

    goto :goto_0
.end method

.method public static a(Ljava/lang/String;)Z
    .locals 4
    .parameter

    .prologue
    .line 43
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 44
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/data/data/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/yingyonghui/market/bi;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/files"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/Yingyonghui"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter

    .prologue
    .line 57
    :try_start_0
    sget-object v0, Lcom/yingyonghui/market/downloader/d;->b:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 58
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 59
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 64
    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static b(Landroid/content/Context;J)Z
    .locals 11
    .parameter
    .parameter

    .prologue
    const/4 v4, 0x0

    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 279
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/yingyonghui/market/downloader/a;->a:Landroid/net/Uri;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "current_bytes"

    aput-object v3, v2, v10

    const-string v3, "total_bytes"

    aput-object v3, v2, v9

    const-string v3, "status == \'192\' OR status == \'190\'"

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 289
    if-nez v0, :cond_0

    move v0, v9

    .line 316
    :goto_0
    return v0

    .line 295
    :cond_0
    :try_start_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 297
    const-string v1, "current_bytes"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    .line 298
    const-string v2, "total_bytes"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    move-wide v3, p1

    .line 299
    :goto_1
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v5

    if-nez v5, :cond_1

    .line 300
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    .line 301
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    .line 302
    sub-long v5, v7, v5

    add-long/2addr v3, v5

    .line 303
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 306
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw v1

    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 309
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 311
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/yingyonghui/market/downloader/d;->a(Ljava/io/File;)J

    move-result-wide v0

    .line 316
    :goto_2
    cmp-long v0, v0, v3

    if-lez v0, :cond_3

    move v0, v9

    goto :goto_0

    .line 313
    :cond_2
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/yingyonghui/market/downloader/d;->a(Ljava/io/File;)J

    move-result-wide v0

    goto :goto_2

    :cond_3
    move v0, v10

    .line 316
    goto :goto_0
.end method
