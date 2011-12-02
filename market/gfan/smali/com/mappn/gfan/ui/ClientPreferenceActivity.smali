.class public Lcom/mappn/gfan/ui/ClientPreferenceActivity;
.super Landroid/preference/PreferenceActivity;


# instance fields
.field private changeListener:Landroid/preference/Preference$OnPreferenceChangeListener;

.field private clickListener:Landroid/preference/Preference$OnPreferenceClickListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    new-instance v0, Lcom/mappn/gfan/ui/ClientPreferenceActivity$1;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/ClientPreferenceActivity$1;-><init>(Lcom/mappn/gfan/ui/ClientPreferenceActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->clickListener:Landroid/preference/Preference$OnPreferenceClickListener;

    new-instance v0, Lcom/mappn/gfan/ui/ClientPreferenceActivity$2;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/ClientPreferenceActivity$2;-><init>(Lcom/mappn/gfan/ui/ClientPreferenceActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->changeListener:Landroid/preference/Preference$OnPreferenceChangeListener;

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Lcom/gfan/sdk/statistics/Collector;->onError(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    const/high16 v1, 0x7f05

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->addPreferencesFromResource(I)V

    const-string v1, "tele"

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    new-instance v2, Landroid/text/SpannableString;

    const v3, 0x7f090173

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    const-string v1, "feedback"

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    new-instance v2, Landroid/text/SpannableString;

    const v3, 0x7f090171

    invoke-virtual {p0, v3}, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->clickListener:Landroid/preference/Preference$OnPreferenceClickListener;

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    const-string v1, "update_app_notification"

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->changeListener:Landroid/preference/Preference$OnPreferenceChangeListener;

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    const-string v1, "app_info"

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getVersionName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    const-string v0, "pref.recommend.app"

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/ui/ClientPreferenceActivity;->changeListener:Landroid/preference/Preference$OnPreferenceChangeListener;

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    return-void
.end method

.method protected onPause()V
    .locals 0

    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onPause()V

    invoke-static {p0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

    return-void
.end method

.method protected onResume()V
    .locals 0

    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    invoke-static {p0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    return-void
.end method
