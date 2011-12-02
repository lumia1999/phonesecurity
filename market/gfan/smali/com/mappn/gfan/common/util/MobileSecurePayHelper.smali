.class public Lcom/mappn/gfan/common/util/MobileSecurePayHelper;
.super Ljava/lang/Object;


# static fields
.field private static final FILE_NAME:Ljava/lang/String; = "alipay_plugin.apk"

.field static final TAG:Ljava/lang/String; = "MobileSecurePayHelper"


# instance fields
.field mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private mProgress:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->mProgress:Landroid/app/ProgressDialog;

    iput-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->mContext:Landroid/content/Context;

    new-instance v0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper$4;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/common/util/MobileSecurePayHelper$4;-><init>(Lcom/mappn/gfan/common/util/MobileSecurePayHelper;)V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->mHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->mContext:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$000(Lcom/mappn/gfan/common/util/MobileSecurePayHelper;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public static getApkInfo(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/PackageInfo;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getPackageArchiveInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public checkNewUpdate(Landroid/content/pm/PackageInfo;)Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->sendCheckNewUpdate(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "needUpdate"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "true"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "updateUrl"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :cond_0
    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method closeProgress()V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->mProgress:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->mProgress:Landroid/app/ProgressDialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public detectMobile_sp()Z
    .locals 7

    invoke-virtual {p0}, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->isMobile_spExist()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/temp.apk"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->mContext:Landroid/content/Context;

    const-string v3, "alipay_plugin.apk"

    invoke-virtual {p0, v2, v3, v1}, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->retrieveApkFromAssets(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    iget-object v2, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    const-string v4, "\u6b63\u5728\u68c0\u6d4b\u5b89\u5168\u652f\u4ed8\u670d\u52a1\u7248\u672c"

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-static {v2, v3, v4, v5, v6}, Lcom/mappn/gfan/common/util/BaseHelper;->showProgress(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Landroid/app/ProgressDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->mProgress:Landroid/app/ProgressDialog;

    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/mappn/gfan/common/util/MobileSecurePayHelper$1;

    invoke-direct {v3, p0, v1}, Lcom/mappn/gfan/common/util/MobileSecurePayHelper$1;-><init>(Lcom/mappn/gfan/common/util/MobileSecurePayHelper;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    :cond_0
    return v0
.end method

.method public isMobile_spExist()Z
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v0

    move v1, v4

    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/pm/PackageInfo;

    iget-object v2, p0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    const-string v3, "com.alipay.android.app"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    :goto_1
    return v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    move v0, v4

    goto :goto_1
.end method

.method public retrieveApkFromAssets(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6

    const/4 v5, 0x0

    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/16 v1, 0x400

    new-array v1, v1, [B

    :goto_0
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_0

    const/4 v4, 0x0

    invoke-virtual {v2, v1, v4, v3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    move v0, v5

    :goto_1
    return v0

    :cond_0
    :try_start_1
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    const/4 v0, 0x1

    goto :goto_1
.end method

.method public retrieveApkFromNet(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lcom/mappn/gfan/common/util/NetworkManager;

    iget-object v2, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/mappn/gfan/common/util/NetworkManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p1, p2, p3}, Lcom/mappn/gfan/common/util/NetworkManager;->urlDownloadToFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    return v0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public sendCheckNewUpdate(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 5

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "action"

    const-string v3, "update"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "platform"

    const-string v4, "android"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "version"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "partner"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "data"

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->sendRequest(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public sendRequest(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3

    new-instance v0, Lcom/mappn/gfan/common/util/NetworkManager;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/MobileSecurePayHelper;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/mappn/gfan/common/util/NetworkManager;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    :try_start_0
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    const-string v2, "https://msp.alipay.com/x.htm"

    invoke-virtual {v0, p1, v2}, Lcom/mappn/gfan/common/util/NetworkManager;->SendAndWaitResponse(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :goto_0
    if-eqz v0, :cond_0

    const-string v1, "MobileSecurePayHelper"

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/BaseHelper;->log(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-object v0

    :catchall_0
    move-exception v2

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v0, v1

    goto :goto_0
.end method

.method public showInstallConfirmDialog(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u5b89\u88c5\u63d0\u793a"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "\u4e3a\u4fdd\u8bc1\u60a8\u7684\u4ea4\u6613\u5b89\u5168\uff0c\u9700\u8981\u60a8\u5b89\u88c5\u652f\u4ed8\u5b9d\u5b89\u5168\u652f\u4ed8\u670d\u52a1\uff0c\u624d\u80fd\u8fdb\u884c\u4ed8\u6b3e\u3002\n\n\u70b9\u51fb\u786e\u5b9a\uff0c\u7acb\u5373\u5b89\u88c5\u3002"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "\u786e\u5b9a"

    new-instance v2, Lcom/mappn/gfan/common/util/MobileSecurePayHelper$2;

    invoke-direct {v2, p0, p2, p1}, Lcom/mappn/gfan/common/util/MobileSecurePayHelper$2;-><init>(Lcom/mappn/gfan/common/util/MobileSecurePayHelper;Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string v1, "\u53d6\u6d88"

    new-instance v2, Lcom/mappn/gfan/common/util/MobileSecurePayHelper$3;

    invoke-direct {v2, p0}, Lcom/mappn/gfan/common/util/MobileSecurePayHelper$3;-><init>(Lcom/mappn/gfan/common/util/MobileSecurePayHelper;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method
