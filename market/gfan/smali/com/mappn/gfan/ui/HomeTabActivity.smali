.class public Lcom/mappn/gfan/ui/HomeTabActivity;
.super Lcom/mappn/gfan/common/widget/BaseTabActivity;

# interfaces
.implements Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;
.implements Landroid/widget/TabHost$OnTabChangeListener;
.implements Ljava/util/Observer;
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final DIALOG_EXIT:I = 0x1

.field private static final DIALOG_FORCE_UPDATE:I = 0x3

.field private static final DIALOG_OPT_UPDATE:I = 0x2

.field private static final HIDE_NOTIFICATION:I = 0x1

.field private static final NOTIFICATION_DURATION:I = 0x1388

.field private static final NOTIFICATION_FLAG:Ljava/lang/String; = "notification"

.field private static final NOTIFICATION_UPDATE:I = 0x4

.field private static final TAB_APP:Ljava/lang/String; = " app"

.field private static final TAB_CATEGORY:Ljava/lang/String; = "category"

.field private static final TAB_HOME:Ljava/lang/String; = "home"

.field private static final TAB_RANK:Ljava/lang/String; = "rank"

.field private static final TAB_RECOMMEND:Ljava/lang/String; = "recommend"


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mInstallReceiver:Landroid/content/BroadcastReceiver;

.field private mIsAnimationReady:Z

.field private mMover:Landroid/widget/ImageView;

.field private mNetworkReceiver:Landroid/content/BroadcastReceiver;

.field private mNotificationApps:Landroid/content/BroadcastReceiver;

.field private mNotificationContent:Landroid/widget/TextView;

.field private mNotificationView:Landroid/widget/RelativeLayout;

.field private mStartX:I

.field private mTabHost:Landroid/widget/TabHost;

.field private mTimer:Ljava/util/Timer;

.field private mUpdateCounter:I

.field private mUpdateReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseTabActivity;-><init>()V

    new-instance v0, Lcom/mappn/gfan/ui/HomeTabActivity$1;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/HomeTabActivity$1;-><init>(Lcom/mappn/gfan/ui/HomeTabActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mNotificationApps:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/mappn/gfan/ui/HomeTabActivity$2;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/HomeTabActivity$2;-><init>(Lcom/mappn/gfan/ui/HomeTabActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mNetworkReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/mappn/gfan/ui/HomeTabActivity$3;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/HomeTabActivity$3;-><init>(Lcom/mappn/gfan/ui/HomeTabActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mInstallReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/mappn/gfan/ui/HomeTabActivity$4;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/HomeTabActivity$4;-><init>(Lcom/mappn/gfan/ui/HomeTabActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mUpdateReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/mappn/gfan/ui/HomeTabActivity$13;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/HomeTabActivity$13;-><init>(Lcom/mappn/gfan/ui/HomeTabActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/mappn/gfan/ui/HomeTabActivity;)Landroid/widget/TabHost;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mappn/gfan/ui/HomeTabActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->exit()V

    return-void
.end method

.method static synthetic access$1000(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/mappn/gfan/ui/HomeTabActivity;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mIsAnimationReady:Z

    return v0
.end method

.method static synthetic access$1300(Lcom/mappn/gfan/ui/HomeTabActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->initTabAnimationParameter()V

    return-void
.end method

.method static synthetic access$1400(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/mappn/gfan/ui/HomeTabActivity;)Landroid/widget/RelativeLayout;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mNotificationView:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$700(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$800(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method static synthetic access$900(Lcom/mappn/gfan/ui/HomeTabActivity;)Lcom/mappn/gfan/Session;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    return-object v0
.end method

.method private checkNewSplash()V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.mappn.market.broadcast.splash.CHECK_UPGRADE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method private checkUpdateAppsNotification()V
    .locals 9

    const v8, 0x7f090005

    const/4 v5, 0x1

    const/4 v7, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isNotificationUpdateApps()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUpgradeNumber()I

    move-result v0

    if-lez v0, :cond_0

    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    new-instance v1, Landroid/app/Notification;

    invoke-direct {v1}, Landroid/app/Notification;-><init>()V

    const v2, 0x7f020090

    iput v2, v1, Landroid/app/Notification;->icon:I

    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v3}, Lcom/mappn/gfan/Session;->getUpgradeNumber()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-virtual {p0, v8, v2}, Lcom/mappn/gfan/ui/HomeTabActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v1, Landroid/app/Notification;->when:J

    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.mappn.gfan.broadcast.notification"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v3, "notification"

    const/4 v4, 0x4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v7, v2, v7}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f090004

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/ui/HomeTabActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v6}, Lcom/mappn/gfan/Session;->getUpgradeNumber()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {p0, v8, v5}, Lcom/mappn/gfan/ui/HomeTabActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v3, v4, v5, v2}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    iget v2, v1, Landroid/app/Notification;->flags:I

    or-int/lit8 v2, v2, 0x10

    iput v2, v1, Landroid/app/Notification;->flags:I

    const v2, 0x7f02000a

    invoke-virtual {v0, v2, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    :cond_0
    return-void
.end method

.method private createTabView(Landroid/content/Context;Ljava/lang/String;I)Landroid/view/View;
    .locals 4

    const v3, 0x7f0c001e

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030010

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const/4 v0, -0x1

    if-ne p3, v0, :cond_1

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iget-object v2, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v2}, Lcom/mappn/gfan/Session;->getUpgradeNumber()I

    move-result v2

    if-lez v2, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/4 v3, 0x1

    invoke-direct {p0, p0, v2, v0, v3}, Lcom/mappn/gfan/ui/HomeTabActivity;->drawUpdateCount(Landroid/app/Activity;Landroid/content/res/Resources;Landroid/widget/ImageView;Z)V

    :goto_0
    const v0, 0x7f0c001f

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object v1

    :cond_0
    const v2, 0x7f020074

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    :cond_1
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/ImageView;

    invoke-virtual {p0, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0
.end method

.method private drawBitmap(Landroid/util/DisplayMetrics;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 7

    const/4 v6, 0x0

    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    invoke-virtual {p2, p1}, Landroid/graphics/Bitmap;->getScaledHeight(Landroid/util/DisplayMetrics;)I

    move-result v1

    invoke-virtual {p2, p1}, Landroid/graphics/Bitmap;->getScaledWidth(Landroid/util/DisplayMetrics;)I

    move-result v2

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v1, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    new-instance v3, Landroid/graphics/Paint;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Landroid/graphics/Paint;-><init>(I)V

    invoke-virtual {v0, p2, v6, v6, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    new-instance v4, Landroid/graphics/PorterDuffXfermode;

    sget-object v5, Landroid/graphics/PorterDuff$Mode;->SRC_OVER:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v4, v5}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    invoke-virtual {p3, p1}, Landroid/graphics/Bitmap;->getScaledWidth(Landroid/util/DisplayMetrics;)I

    move-result v4

    sub-int/2addr v2, v4

    int-to-float v2, v2

    invoke-virtual {v0, p3, v2, v6, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    return-object v1
.end method

.method private drawText(Landroid/util/DisplayMetrics;Landroid/content/res/Resources;Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 8

    invoke-virtual {p3, p1}, Landroid/graphics/Bitmap;->getScaledHeight(Landroid/util/DisplayMetrics;)I

    move-result v0

    invoke-virtual {p3, p1}, Landroid/graphics/Bitmap;->getScaledWidth(Landroid/util/DisplayMetrics;)I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v0, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v4, Landroid/graphics/Matrix;

    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    new-instance v5, Landroid/graphics/Paint;

    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    invoke-virtual {v3, p3, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    new-instance v4, Landroid/graphics/Paint;

    const/4 v5, 0x1

    invoke-direct {v4, v5}, Landroid/graphics/Paint;-><init>(I)V

    const v5, 0x7f07000e

    invoke-virtual {p2, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    iget v5, p1, Landroid/util/DisplayMetrics;->scaledDensity:F

    const/high16 v6, 0x4140

    mul-float/2addr v5, v6

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    sget-object v5, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v5

    const/high16 v6, 0x4000

    div-float/2addr v5, v6

    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    sub-float/2addr v1, v5

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    iget v5, p1, Landroid/util/DisplayMetrics;->scaledDensity:F

    const/high16 v7, 0x40c0

    mul-float/2addr v5, v7

    add-float/2addr v0, v5

    invoke-virtual {v3, v6, v1, v0, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    invoke-virtual {v3}, Landroid/graphics/Canvas;->save()I

    return-object v2
.end method

.method private drawUpdateCount(Landroid/app/Activity;Landroid/content/res/Resources;Landroid/widget/ImageView;Z)V
    .locals 9

    const/4 v8, 0x1

    const/4 v7, 0x0

    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    const v1, 0x7f020092

    invoke-static {p2, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    const v2, 0x7f020076

    invoke-static {p2, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v2

    const v3, 0x7f020075

    invoke-static {p2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v3

    new-instance v4, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    const v5, 0x10100a1

    if-eqz p4, :cond_0

    iget-object v6, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v6}, Lcom/mappn/gfan/Session;->getUpgradeNumber()I

    move-result v6

    invoke-direct {p0, v0, p2, v1, v6}, Lcom/mappn/gfan/ui/HomeTabActivity;->drawText(Landroid/util/DisplayMetrics;Landroid/content/res/Resources;Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {p0, v0, v2, v1}, Lcom/mappn/gfan/ui/HomeTabActivity;->drawBitmap(Landroid/util/DisplayMetrics;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-direct {p0, v0, v3, v1}, Lcom/mappn/gfan/ui/HomeTabActivity;->drawBitmap(Landroid/util/DisplayMetrics;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    new-array v1, v8, [I

    neg-int v3, v5

    aput v3, v1, v7

    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v3, p2, v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v4, v1, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-array v1, v8, [I

    aput v5, v1, v7

    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, p2, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v4, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {p3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_0
    return-void

    :cond_0
    const v0, 0x7f020074

    invoke-virtual {p3, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0
.end method

.method private exit()V
    .locals 3

    invoke-static {}, Lcom/mappn/gfan/common/ResponseCacheManager;->getInstance()Lcom/mappn/gfan/common/ResponseCacheManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/common/ResponseCacheManager;->clear()V

    invoke-static {}, Lcom/mappn/gfan/common/util/CacheManager;->getInstance()Lcom/mappn/gfan/common/util/CacheManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/common/util/CacheManager;->clearFromMemory()V

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/common/download/DownloadService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "clear"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->deleteObservers()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isAutoClearCache()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->clearCache(Landroid/content/Context;)V

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    :cond_1
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->finish()V

    return-void
.end method

.method private handleInstallApp(Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getInstalledApps()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v3, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v4, "packagename"

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    add-int/lit8 v0, v3, 0x1

    const/4 v3, 0x5

    if-lt v0, v3, :cond_1

    :goto_1
    return-void

    :cond_0
    move v0, v3

    :cond_1
    move v3, v0

    goto :goto_0

    :cond_2
    invoke-direct {p0, v3}, Lcom/mappn/gfan/ui/HomeTabActivity;->showNotification(I)V

    goto :goto_1
.end method

.method private handleUpdate(Lcom/mappn/gfan/common/vo/UpdateInfo;)V
    .locals 7

    const/4 v6, 0x2

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    if-eqz v0, :cond_0

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/UpdateInfo;->getUpdageLevel()I

    move-result v5

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/UpdateInfo;->getVersionName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/UpdateInfo;->getVersionCode()I

    move-result v2

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/UpdateInfo;->getDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/mappn/gfan/common/vo/UpdateInfo;->getApkUrl()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {v0 .. v5}, Lcom/mappn/gfan/Session;->setUpdateInfo(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    if-ne v6, v5, :cond_2

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->showDialog(I)V

    goto :goto_0

    :cond_2
    const/4 v0, 0x1

    if-ne v0, v5, :cond_0

    invoke-virtual {p0, v6}, Lcom/mappn/gfan/ui/HomeTabActivity;->showDialog(I)V

    goto :goto_0
.end method

.method private initTabAnimationParameter()V
    .locals 4

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mIsAnimationReady:Z

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->getCurrentTabView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->getCurrentTabView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v2

    const v0, 0x7f0c001d

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mMover:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mMover:Landroid/widget/ImageView;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v1, " app"

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->setCurrentTabByTag(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private initView(Ljava/util/HashMap;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const v0, 0x1020012

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TabHost;

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->setup()V

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mappn/gfan/ui/HomeActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "extra.home.data"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v2, "home"

    invoke-virtual {v1, v2}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090031

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/HomeTabActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f02007e

    invoke-direct {p0, v2, v3, v4}, Lcom/mappn/gfan/ui/HomeTabActivity;->createTabView(Landroid/content/Context;Ljava/lang/String;I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v1, "category"

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f090032

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/HomeTabActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f02007b

    invoke-direct {p0, v1, v2, v3}, Lcom/mappn/gfan/ui/HomeTabActivity;->createTabView(Landroid/content/Context;Ljava/lang/String;I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/mappn/gfan/ui/CategoryActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v1, "recommend"

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f090034

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/HomeTabActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f020084

    invoke-direct {p0, v1, v2, v3}, Lcom/mappn/gfan/ui/HomeTabActivity;->createTabView(Landroid/content/Context;Ljava/lang/String;I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/mappn/gfan/ui/RecommendListActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v1, "rank"

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f090033

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/HomeTabActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f020081

    invoke-direct {p0, v1, v2, v3}, Lcom/mappn/gfan/ui/HomeTabActivity;->createTabView(Landroid/content/Context;Ljava/lang/String;I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/mappn/gfan/ui/RankTabActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v1, " app"

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f090035

    invoke-virtual {p0, v2}, Lcom/mappn/gfan/ui/HomeTabActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, -0x1

    invoke-direct {p0, v1, v2, v3}, Lcom/mappn/gfan/ui/HomeTabActivity;->createTabView(Landroid/content/Context;Ljava/lang/String;I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/mappn/gfan/ui/AppManagerActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/mappn/gfan/ui/HomeTabActivity$6;

    invoke-direct {v1, p0}, Lcom/mappn/gfan/ui/HomeTabActivity$6;-><init>(Lcom/mappn/gfan/ui/HomeTabActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0, p0}, Landroid/widget/TabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    return-void
.end method

.method private registerReceivers()V
    .locals 2

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mNetworkReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.PACKAGE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "package"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mInstallReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.mappn.gfan.broadcast.FORCE_EXIT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.mappn.gfan.broadcast.REMIND_LATTER"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.mappn.gfan.broadcast.DOWNLOAD_OPT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.mappn.gfan.broadcast.DOWNLOAD"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mUpdateReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.mappn.gfan.broadcast.notification"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mNotificationApps:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method private showNotification(I)V
    .locals 5

    const/4 v3, 0x1

    const/4 v4, 0x0

    const v0, 0x7f0c0078

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mNotificationView:Landroid/widget/RelativeLayout;

    const v0, 0x7f0c0079

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mNotificationContent:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mNotificationView:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mNotificationView:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mHandler:Landroid/os/Handler;

    const-wide/16 v1, 0x1388

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    new-instance v0, Landroid/text/SpannableStringBuilder;

    const v1, 0x7f090006

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p0, v1, v2}, Lcom/mappn/gfan/ui/HomeTabActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    new-instance v1, Landroid/text/style/TextAppearanceSpan;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0a0003

    invoke-direct {v1, v2, v3}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    const/4 v2, 0x5

    const/4 v3, 0x6

    const/16 v4, 0x21

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mNotificationContent:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private unregisterReceiver()V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mNetworkReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mInstallReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mUpdateReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mNotificationApps:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/InstallNecessaryActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x7f0c0078
        :pswitch_0
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    const/4 v3, 0x0

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onCreate(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0, p0}, Lcom/mappn/gfan/Session;->addObserver(Ljava/util/Observer;)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->registerReceivers()V

    const v0, 0x7f03000f

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "extra.home.data"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->initView(Ljava/util/HashMap;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->isNeedCheckUpgrade(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/mappn/gfan/Session;->setUpdataCheckTime(J)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/MarketAPI;->submitAllInstalledApps(Landroid/content/Context;)V

    :cond_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mappn/gfan/common/MarketAPI;->checkUpgrade(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mappn/gfan/common/MarketAPI;->checkUpdate(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->checkNewSplash()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isFirstLogin()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0, v3}, Lcom/mappn/gfan/Session;->setFirstLogin(Z)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mappn/gfan/common/MarketAPI;->getRequired(Landroid/content/Context;Lcom/mappn/gfan/common/ApiAsyncTask$ApiRequestListener;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v3}, Lcom/mappn/gfan/common/util/AlarmManageUtils;->notifyPushService(Landroid/content/Context;Z)V

    :cond_1
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string v1, "click.downloading"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v1, " app"

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->setCurrentTabByTag(Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 9

    const v8, 0x7f090166

    const v7, 0x7f090164

    const/4 v5, 0x1

    const/4 v6, 0x0

    const v4, 0x108009b

    packed-switch p1, :pswitch_data_0

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    :goto_0
    return-object v0

    :pswitch_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09016e

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/HomeTabActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007e

    new-instance v2, Lcom/mappn/gfan/ui/HomeTabActivity$8;

    invoke-direct {v2, p0}, Lcom/mappn/gfan/ui/HomeTabActivity$8;-><init>(Lcom/mappn/gfan/ui/HomeTabActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f09007f

    new-instance v2, Lcom/mappn/gfan/ui/HomeTabActivity$7;

    invoke-direct {v2, p0, p1}, Lcom/mappn/gfan/ui/HomeTabActivity$7;-><init>(Lcom/mappn/gfan/ui/HomeTabActivity;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUpdateVersionName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getUpdateVersionDesc()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\r"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const v4, 0x7f090165

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v6

    invoke-virtual {p0, v4, v5}, Lcom/mappn/gfan/ui/HomeTabActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mappn/gfan/ui/HomeTabActivity$10;

    invoke-direct {v1, p0, p1}, Lcom/mappn/gfan/ui/HomeTabActivity$10;-><init>(Lcom/mappn/gfan/ui/HomeTabActivity;I)V

    invoke-virtual {v0, v8, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f090167

    new-instance v2, Lcom/mappn/gfan/ui/HomeTabActivity$9;

    invoke-direct {v2, p0, p1}, Lcom/mappn/gfan/ui/HomeTabActivity$9;-><init>(Lcom/mappn/gfan/ui/HomeTabActivity;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto/16 :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUpdateVersionName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->getUpdateVersionDesc()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\r"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const v4, 0x7f090168

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v6

    invoke-virtual {p0, v4, v5}, Lcom/mappn/gfan/ui/HomeTabActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mappn/gfan/ui/HomeTabActivity$12;

    invoke-direct {v1, p0, p1}, Lcom/mappn/gfan/ui/HomeTabActivity$12;-><init>(Lcom/mappn/gfan/ui/HomeTabActivity;I)V

    invoke-virtual {v0, v8, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f090169

    new-instance v2, Lcom/mappn/gfan/ui/HomeTabActivity$11;

    invoke-direct {v2, p0, p1}, Lcom/mappn/gfan/ui/HomeTabActivity$11;-><init>(Lcom/mappn/gfan/ui/HomeTabActivity;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f0b

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method protected onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onDestroy()V

    invoke-direct {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->unregisterReceiver()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mIsAnimationReady:Z

    return-void
.end method

.method public onError(II)V
    .locals 2

    const/16 v0, 0x11

    if-ne p1, v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "check new version fail because of status : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->D(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2

    const/4 v1, 0x1

    const/4 v0, 0x4

    if-ne v0, p1, :cond_1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/HomeTabActivity;->showDialog(I)V

    :cond_0
    move v0, v1

    :goto_0
    return v0

    :cond_1
    invoke-super {p0, p1, p2}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onNewIntent(Landroid/content/Intent;)V

    if-eqz p1, :cond_0

    const-string v0, "click.downloading"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v1, " app"

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->setCurrentTabByTag(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 6

    const/4 v2, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :cond_0
    :goto_0
    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :pswitch_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "\u83dc\u5355"

    aput-object v3, v2, v5

    const-string v3, "\u70b9\u51fb\u7528\u6237\u4e2d\u5fc3"

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/PersonalAccountActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_1
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "\u83dc\u5355"

    aput-object v3, v2, v5

    const-string v3, "\u6253\u5f00\u8bbe\u7f6e"

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/ClientPreferenceActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "\u83dc\u5355"

    aput-object v3, v2, v5

    const-string v3, "\u6253\u5f00\u53cd\u9988\u9875"

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/mappn/gfan/ui/FeedBackActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_3
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "\u83dc\u5355"

    aput-object v3, v2, v5

    const-string v3, "\u6253\u5f00\u793e\u533a"

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "http://bbs.gfan.com/mobile/"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const/high16 v1, 0x1000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/HomeTabActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    :pswitch_4
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, v4}, Lcom/mappn/gfan/ui/HomeTabActivity;->showDialog(I)V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x7f0c00a0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onResume()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mIsAnimationReady:Z

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 4

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseTabActivity;->onStop()V

    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTimer:Ljava/util/Timer;

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mTimer:Ljava/util/Timer;

    new-instance v1, Lcom/mappn/gfan/ui/HomeTabActivity$5;

    invoke-direct {v1, p0}, Lcom/mappn/gfan/ui/HomeTabActivity$5;-><init>(Lcom/mappn/gfan/ui/HomeTabActivity;)V

    const-wide/32 v2, 0x493e0

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    return-void
.end method

.method public onSuccess(ILjava/lang/Object;)V
    .locals 1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    const/16 v0, 0x11

    if-ne p1, v0, :cond_2

    check-cast p2, Lcom/mappn/gfan/common/vo/UpdateInfo;

    invoke-direct {p0, p2}, Lcom/mappn/gfan/ui/HomeTabActivity;->handleUpdate(Lcom/mappn/gfan/common/vo/UpdateInfo;)V

    goto :goto_0

    :cond_2
    const/16 v0, 0x26

    if-ne p1, v0, :cond_3

    check-cast p2, Ljava/util/ArrayList;

    invoke-direct {p0, p2}, Lcom/mappn/gfan/ui/HomeTabActivity;->handleInstallApp(Ljava/util/ArrayList;)V

    goto :goto_0

    :cond_3
    const/16 v0, 0x13

    if-ne p1, v0, :cond_0

    invoke-direct {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->checkUpdateAppsNotification()V

    goto :goto_0
.end method

.method public onTabChanged(Ljava/lang/String;)V
    .locals 6

    const/4 v5, 0x0

    const/4 v1, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    const-string v0, " app"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u9996\u9875"

    aput-object v2, v1, v3

    const-string v2, "\u70b9\u51fb\u7ba1\u7406TAB"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getTabHost()Landroid/widget/TabHost;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/TabHost;->getCurrentTabView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    new-instance v1, Landroid/view/animation/TranslateAnimation;

    iget v2, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mStartX:I

    int-to-float v2, v2

    int-to-float v3, v0

    invoke-direct {v1, v2, v3, v5, v5}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    const-wide/16 v2, 0xc8

    invoke-virtual {v1, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    invoke-virtual {v1, v4}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    iget-object v2, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mMover:Landroid/widget/ImageView;

    if-nez v2, :cond_1

    invoke-direct {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->initTabAnimationParameter()V

    :cond_1
    iget-object v2, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mMover:Landroid/widget/ImageView;

    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    iput v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mStartX:I

    return-void

    :cond_2
    const-string v0, "category"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u9996\u9875"

    aput-object v2, v1, v3

    const-string v2, "\u70b9\u51fb\u5206\u7c7bTAB"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const-string v0, "recommend"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u9996\u9875"

    aput-object v2, v1, v3

    const-string v2, "\u70b9\u51fb\u8fbe\u4eba\u63a8\u8350TAB"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    const-string v0, "rank"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u9996\u9875"

    aput-object v2, v1, v3

    const-string v2, "\u70b9\u51fb\u6392\u884cTAB"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    const-string v0, "home"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u9996\u9875"

    aput-object v2, v1, v3

    const-string v2, "\u70b9\u51fb\u9996\u9875TAB"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .locals 4

    const v3, 0x7f0c001e

    const/4 v2, 0x4

    instance-of v0, p2, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUpgradeNumber()I

    move-result v0

    if-lez v0, :cond_1

    iget v1, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mUpdateCounter:I

    if-eq v0, v1, :cond_1

    iput v0, p0, Lcom/mappn/gfan/ui/HomeTabActivity;->mUpdateCounter:I

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getTabHost()Landroid/widget/TabHost;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/TabWidget;->getChildTabViewAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    check-cast v0, Landroid/widget/ImageView;

    const/4 v2, 0x1

    invoke-direct {p0, p0, v1, v0, v2}, Lcom/mappn/gfan/ui/HomeTabActivity;->drawUpdateCount(Landroid/app/Activity;Landroid/content/res/Resources;Landroid/widget/ImageView;Z)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/HomeTabActivity;->getTabHost()Landroid/widget/TabHost;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/TabWidget;->getChildTabViewAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/ImageView;

    const v0, 0x7f020074

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0
.end method
