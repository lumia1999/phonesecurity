.class public Lcom/mappn/gfan/common/widget/ClientDialogPreference;
.super Landroid/preference/DialogPreference;


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object p1, p0, Lcom/mappn/gfan/common/widget/ClientDialogPreference;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5

    const/4 v2, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ClientDialogPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    packed-switch p2, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    const-string v1, "manual_clear_cache"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ClientDialogPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/Utils;->clearCache(Landroid/content/Context;)V

    invoke-static {}, Lcom/mappn/gfan/common/util/CacheManager;->getInstance()Lcom/mappn/gfan/common/util/CacheManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/common/util/CacheManager;->clearFromMemory()V

    invoke-static {}, Lcom/mappn/gfan/common/util/CacheManager;->getInstance()Lcom/mappn/gfan/common/util/CacheManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mappn/gfan/common/util/CacheManager;->clearFromFile()V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/ClientDialogPreference;->mContext:Landroid/content/Context;

    new-array v1, v2, [Ljava/lang/String;

    const-string v2, "\u8bbe\u7f6e"

    aput-object v2, v1, v3

    const-string v2, "\u6e05\u9664\u7f13\u5b58"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string v1, "manual_clear_search_history"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/common/widget/ClientDialogPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/common/util/DBUtils;->clearSearchHistory(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/ClientDialogPreference;->mContext:Landroid/content/Context;

    new-array v1, v2, [Ljava/lang/String;

    const-string v2, "\u8bbe\u7f6e"

    aput-object v2, v1, v3

    const-string v2, "\u6e05\u9664\u641c\u7d22\u5386\u53f2"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/mappn/gfan/common/util/Utils;->trackEvent(Landroid/content/Context;[Ljava/lang/String;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
