.class Lcom/mappn/gfan/ui/ClientPreferenceActivity$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/ClientPreferenceActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/ClientPreferenceActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/ClientPreferenceActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/ClientPreferenceActivity$2;->this$0:Lcom/mappn/gfan/ui/ClientPreferenceActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 7

    const/4 v3, 0x2

    const/4 v6, 0x0

    const/4 v5, 0x1

    const-string v1, "update_app_notification"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ClientPreferenceActivity$2;->this$0:Lcom/mappn/gfan/ui/ClientPreferenceActivity;

    invoke-virtual {v1}, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/String;

    const-string v3, "\u8bbe\u7f6e"

    aput-object v3, v2, v6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u8bbe\u7f6e\u5347\u7ea7\u901a\u77e5"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    move v1, v5

    :goto_0
    return v1

    :cond_0
    const-string v1, "pref_market_app_not_download_image"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mappn/gfan/ui/ClientPreferenceActivity$2;->this$0:Lcom/mappn/gfan/ui/ClientPreferenceActivity;

    invoke-virtual {v1}, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/String;

    const-string v3, "\u8bbe\u7f6e"

    aput-object v3, v2, v6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u8bbe\u7f6e\u5173\u95ed\u56fe\u7247\u4e0b\u8f7d"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    move v1, v5

    goto :goto_0

    :cond_1
    const-string v1, "pref.recommend.app"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    move-object v0, p2

    check-cast v0, Ljava/lang/Boolean;

    move-object v1, v0

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/mappn/gfan/ui/ClientPreferenceActivity$2;->this$0:Lcom/mappn/gfan/ui/ClientPreferenceActivity;

    invoke-virtual {v1}, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/String;

    const-string v3, "\u8bbe\u7f6e"

    aput-object v3, v2, v6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u8bbe\u7f6e\u5f00\u542f\u63a8\u9001\u5e94\u7528"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/ClientPreferenceActivity$2;->this$0:Lcom/mappn/gfan/ui/ClientPreferenceActivity;

    invoke-virtual {v1}, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v6}, Lcom/mappn/gfan/common/util/AlarmManageUtils;->notifyPushService(Landroid/content/Context;Z)V

    :goto_1
    move v1, v5

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/mappn/gfan/ui/ClientPreferenceActivity$2;->this$0:Lcom/mappn/gfan/ui/ClientPreferenceActivity;

    invoke-virtual {v1}, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/AlarmManageUtils;->cancelPushService(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/mappn/gfan/ui/ClientPreferenceActivity$2;->this$0:Lcom/mappn/gfan/ui/ClientPreferenceActivity;

    invoke-virtual {v1}, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/String;

    const-string v3, "\u8bbe\u7f6e"

    aput-object v3, v2, v6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u8bbe\u7f6e\u5f00\u542f\u63a8\u9001\u5e94\u7528"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    const-string v1, "delete_after_installation"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    move-object v0, p2

    check-cast v0, Ljava/lang/Boolean;

    move-object v1, v0

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/mappn/gfan/ui/ClientPreferenceActivity$2;->this$0:Lcom/mappn/gfan/ui/ClientPreferenceActivity;

    invoke-virtual {v1}, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/String;

    const-string v3, "\u8bbe\u7f6e"

    aput-object v3, v2, v6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u8bbe\u7f6e\u81ea\u52a8\u5220\u9664APK\u6587\u4ef6"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    :cond_4
    :goto_2
    move v1, v6

    goto/16 :goto_0

    :cond_5
    iget-object v1, p0, Lcom/mappn/gfan/ui/ClientPreferenceActivity$2;->this$0:Lcom/mappn/gfan/ui/ClientPreferenceActivity;

    invoke-virtual {v1}, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/String;

    const-string v3, "\u8bbe\u7f6e"

    aput-object v3, v2, v6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u8bbe\u7f6e\u81ea\u52a8\u5220\u9664APK\u6587\u4ef6"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto :goto_2
.end method
