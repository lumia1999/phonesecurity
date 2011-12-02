.class public Lcom/mappn/gfan/common/util/AppSecurityPermissions;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mappn/gfan/common/util/AppSecurityPermissions$1;,
        Lcom/mappn/gfan/common/util/AppSecurityPermissions$PermissionInfoComparator;,
        Lcom/mappn/gfan/common/util/AppSecurityPermissions$State;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "AppSecurityPermissions"


# instance fields
.field private localLOGV:Z

.field private mContext:Landroid/content/Context;

.field private mCurrentState:Lcom/mappn/gfan/common/util/AppSecurityPermissions$State;

.field private mDangerousIcon:Landroid/graphics/drawable/Drawable;

.field private mDangerousList:Landroid/widget/LinearLayout;

.field private mDangerousMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mDefaultGrpLabel:Ljava/lang/String;

.field private mDefaultGrpName:Ljava/lang/String;

.field private mExpanded:Z

.field private mGroupLabelCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field

.field private mInflater:Landroid/view/LayoutInflater;

.field private mNoPermsView:Landroid/view/View;

.field private mNonDangerousList:Landroid/widget/LinearLayout;

.field private mNormalIcon:Landroid/graphics/drawable/Drawable;

.field private mNormalMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mPermFormat:Ljava/lang/String;

.field private mPermsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/PermissionInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mPermsView:Landroid/widget/LinearLayout;

.field private mPm:Landroid/content/pm/PackageManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;[Ljava/lang/String;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->localLOGV:Z

    const-string v0, "DefaultGrp"

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mDefaultGrpName:Ljava/lang/String;

    iput-object p1, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mPm:Landroid/content/pm/PackageManager;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mPermsList:Ljava/util/List;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-direct {p0, p2, v0}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->extractPerms([Ljava/lang/String;Ljava/util/Set;)V

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/PermissionInfo;

    iget-object v2, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mPermsList:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-void
.end method

.method private aggregateGroupDescs(Ljava/util/Map;Ljava/util/Map;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/PermissionInfo;",
            ">;>;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_1

    :cond_0
    return-void

    :cond_1
    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v3, 0x0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/PermissionInfo;

    iget-object v5, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mPm:Landroid/content/pm/PackageManager;

    invoke-virtual {v1, v5}, Landroid/content/pm/PermissionInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-direct {p0, v3, v1}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->formatPermissions(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    move-object v3, v1

    goto :goto_1

    :cond_3
    if-eqz v3, :cond_2

    iget-boolean v1, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->localLOGV:Z

    if-eqz v1, :cond_4

    const-string v1, "AppSecurityPermissions"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Group:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " description:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private canonicalizeGroupDesc(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const/4 v3, 0x1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int v1, v0, v3

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2e

    if-ne v1, v2, :cond_2

    const/4 v1, 0x0

    sub-int/2addr v0, v3

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    move-object v0, p1

    goto :goto_0
.end method

.method private displayNoPermissions()V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mNoPermsView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private displayPermissions(Z)V
    .locals 8

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mDangerousMap:Ljava/util/Map;

    move-object v2, v0

    :goto_0
    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mDangerousList:Landroid/widget/LinearLayout;

    move-object v3, v0

    :goto_1
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->removeAllViews()V

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->getGroupLabel(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v5

    iget-boolean v1, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->localLOGV:Z

    if-eqz v1, :cond_0

    const-string v6, "AppSecurityPermissions"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Adding view group:"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v7, ", desc:"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v6, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-direct {p0, v5, v0, p1}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->getPermissionItemView(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_2

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mNormalMap:Ljava/util/Map;

    move-object v2, v0

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mNonDangerousList:Landroid/widget/LinearLayout;

    move-object v3, v0

    goto :goto_1

    :cond_3
    return-void
.end method

.method private extractPerms([Ljava/lang/String;Ljava/util/Set;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Landroid/content/pm/PermissionInfo;",
            ">;)V"
        }
    .end annotation

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-nez v0, :cond_1

    :cond_0
    return-void

    :cond_1
    array-length v0, p1

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    :try_start_0
    iget-object v3, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mPm:Landroid/content/pm/PackageManager;

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Landroid/content/pm/PackageManager;->getPermissionInfo(Ljava/lang/String;I)Landroid/content/pm/PermissionInfo;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-interface {p2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    move-exception v3

    const-string v3, "AppSecurityPermissions"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Ignoring unknown permission:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private formatPermissions(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 4

    if-nez p1, :cond_2

    if-nez p2, :cond_1

    const/4 v0, 0x0

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->canonicalizeGroupDesc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz p2, :cond_0

    iget-object v1, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mPermFormat:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getGroupLabel(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 3

    if-nez p1, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mDefaultGrpLabel:Ljava/lang/String;

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mGroupLabelCache:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    if-nez v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mPm:Landroid/content/pm/PackageManager;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getPermissionGroupInfo(Ljava/lang/String;I)Landroid/content/pm/PermissionGroupInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mPm:Landroid/content/pm/PackageManager;

    invoke-virtual {v0, v1}, Landroid/content/pm/PermissionGroupInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mGroupLabelCache:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v0, "AppSecurityPermissions"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid group name:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static getPermissionItemView(Landroid/content/Context;Landroid/view/LayoutInflater;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZLandroid/graphics/drawable/Drawable;)Landroid/view/View;
    .locals 6

    const v5, 0x7f070001

    const v0, 0x7f030030

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    const v0, 0x7f0c0046

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f0c0047

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    if-eqz p4, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_0
    const v3, 0x7f0c0045

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/ImageView;

    invoke-virtual {p0, p5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-eqz p2, :cond_1

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-object v2

    :cond_1
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v0, 0x8

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method

.method public static getPermissionItemView(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Landroid/view/View;
    .locals 6

    const-string v0, "layout_inflater"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    if-eqz p3, :cond_0

    const v2, 0x7f02004a

    :goto_0
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    invoke-static/range {v0 .. v5}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->getPermissionItemView(Landroid/content/Context;Landroid/view/LayoutInflater;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZLandroid/graphics/drawable/Drawable;)Landroid/view/View;

    move-result-object v0

    return-object v0

    :cond_0
    const v2, 0x7f02004b

    goto :goto_0
.end method

.method private getPermissionItemView(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Landroid/view/View;
    .locals 6

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mInflater:Landroid/view/LayoutInflater;

    if-eqz p3, :cond_0

    iget-object v2, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mDangerousIcon:Landroid/graphics/drawable/Drawable;

    move-object v5, v2

    :goto_0
    move-object v2, p1

    move-object v3, p2

    move v4, p3

    invoke-static/range {v0 .. v5}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->getPermissionItemView(Landroid/content/Context;Landroid/view/LayoutInflater;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZLandroid/graphics/drawable/Drawable;)Landroid/view/View;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v2, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mNormalIcon:Landroid/graphics/drawable/Drawable;

    move-object v5, v2

    goto :goto_0
.end method

.method private isDisplayablePermission(Landroid/content/pm/PermissionInfo;)Z
    .locals 2

    const/4 v1, 0x1

    iget v0, p1, Landroid/content/pm/PermissionInfo;->protectionLevel:I

    if-eq v0, v1, :cond_0

    iget v0, p1, Landroid/content/pm/PermissionInfo;->protectionLevel:I

    if-nez v0, :cond_1

    :cond_0
    move v0, v1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private setPermissions(Ljava/util/List;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/PermissionInfo;",
            ">;)V"
        }
    .end annotation

    const/4 v10, 0x1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mGroupLabelCache:Ljava/util/HashMap;

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mGroupLabelCache:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mDefaultGrpName:Ljava/lang/String;

    iget-object v2, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mDefaultGrpLabel:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mDangerousMap:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mNormalMap:Ljava/util/Map;

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    new-instance v4, Lcom/mappn/gfan/common/util/AppSecurityPermissions$PermissionInfoComparator;

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mPm:Landroid/content/pm/PackageManager;

    invoke-direct {v4, v0}, Lcom/mappn/gfan/common/util/AppSecurityPermissions$PermissionInfoComparator;-><init>(Landroid/content/pm/PackageManager;)V

    if-eqz p1, :cond_9

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/PermissionInfo;

    iget-boolean v1, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->localLOGV:Z

    if-eqz v1, :cond_1

    const-string v1, "AppSecurityPermissions"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Processing permission:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v0, Landroid/content/pm/PermissionInfo;->name:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->isDisplayablePermission(Landroid/content/pm/PermissionInfo;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-boolean v1, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->localLOGV:Z

    if-eqz v1, :cond_0

    const-string v1, "AppSecurityPermissions"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Permission:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v0, v0, Landroid/content/pm/PermissionInfo;->name:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, " is not displayable"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_2
    iget v1, v0, Landroid/content/pm/PermissionInfo;->protectionLevel:I

    if-ne v1, v10, :cond_4

    move-object v6, v2

    :goto_1
    iget-object v1, v0, Landroid/content/pm/PermissionInfo;->group:Ljava/lang/String;

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mDefaultGrpName:Ljava/lang/String;

    move-object v7, v1

    :goto_2
    iget-boolean v1, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->localLOGV:Z

    if-eqz v1, :cond_3

    const-string v1, "AppSecurityPermissions"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Permission:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, v0, Landroid/content/pm/PermissionInfo;->name:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " belongs to group:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v1, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_6

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v6, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_4
    move-object v6, v3

    goto :goto_1

    :cond_5
    iget-object v1, v0, Landroid/content/pm/PermissionInfo;->group:Ljava/lang/String;

    move-object v7, v1

    goto :goto_2

    :cond_6
    invoke-static {v1, v0, v4}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v6

    iget-boolean v7, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->localLOGV:Z

    if-eqz v7, :cond_7

    const-string v7, "AppSecurityPermissions"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "idx="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", list.size="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    if-gez v6, :cond_0

    neg-int v6, v6

    sub-int/2addr v6, v10

    invoke-interface {v1, v6, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto/16 :goto_0

    :cond_8
    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mDangerousMap:Ljava/util/Map;

    invoke-direct {p0, v2, v0}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->aggregateGroupDescs(Ljava/util/Map;Ljava/util/Map;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mNormalMap:Ljava/util/Map;

    invoke-direct {p0, v3, v0}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->aggregateGroupDescs(Ljava/util/Map;Ljava/util/Map;)V

    :cond_9
    sget-object v0, Lcom/mappn/gfan/common/util/AppSecurityPermissions$State;->NO_PERMS:Lcom/mappn/gfan/common/util/AppSecurityPermissions$State;

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mCurrentState:Lcom/mappn/gfan/common/util/AppSecurityPermissions$State;

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mDangerousMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_d

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mNormalMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_c

    sget-object v0, Lcom/mappn/gfan/common/util/AppSecurityPermissions$State;->BOTH:Lcom/mappn/gfan/common/util/AppSecurityPermissions$State;

    :goto_3
    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mCurrentState:Lcom/mappn/gfan/common/util/AppSecurityPermissions$State;

    :cond_a
    :goto_4
    iget-boolean v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->localLOGV:Z

    if-eqz v0, :cond_b

    const-string v0, "AppSecurityPermissions"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mCurrentState="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mCurrentState:Lcom/mappn/gfan/common/util/AppSecurityPermissions$State;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_b
    invoke-direct {p0}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->showPermissions()V

    return-void

    :cond_c
    sget-object v0, Lcom/mappn/gfan/common/util/AppSecurityPermissions$State;->DANGEROUS_ONLY:Lcom/mappn/gfan/common/util/AppSecurityPermissions$State;

    goto :goto_3

    :cond_d
    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mNormalMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_a

    sget-object v0, Lcom/mappn/gfan/common/util/AppSecurityPermissions$State;->NORMAL_ONLY:Lcom/mappn/gfan/common/util/AppSecurityPermissions$State;

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mCurrentState:Lcom/mappn/gfan/common/util/AppSecurityPermissions$State;

    goto :goto_4
.end method

.method private showPermissions()V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    sget-object v0, Lcom/mappn/gfan/common/util/AppSecurityPermissions$1;->$SwitchMap$com$mappn$gfan$common$util$AppSecurityPermissions$State:[I

    iget-object v1, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mCurrentState:Lcom/mappn/gfan/common/util/AppSecurityPermissions$State;

    invoke-virtual {v1}, Lcom/mappn/gfan/common/util/AppSecurityPermissions$State;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    invoke-direct {p0}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->displayNoPermissions()V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0, v3}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->displayPermissions(Z)V

    goto :goto_0

    :pswitch_2
    invoke-direct {p0, v2}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->displayPermissions(Z)V

    goto :goto_0

    :pswitch_3
    invoke-direct {p0, v3}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->displayPermissions(Z)V

    invoke-direct {p0, v2}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->displayPermissions(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mNonDangerousList:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method public getPermissionCount()I
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mPermsList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getPermissionsView()Landroid/view/View;
    .locals 3

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mContext:Landroid/content/Context;

    const-string v1, "layout_inflater"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mInflater:Landroid/view/LayoutInflater;

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f030031

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mPermsView:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mPermsView:Landroid/widget/LinearLayout;

    const v1, 0x7f0c0049

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mDangerousList:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mPermsView:Landroid/widget/LinearLayout;

    const v1, 0x7f0c004a

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mNonDangerousList:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mPermsView:Landroid/widget/LinearLayout;

    const v1, 0x7f0c0048

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mNoPermsView:Landroid/view/View;

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mContext:Landroid/content/Context;

    const v1, 0x7f0900aa

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mDefaultGrpLabel:Ljava/lang/String;

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mContext:Landroid/content/Context;

    const v1, 0x7f0900ab

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mPermFormat:Ljava/lang/String;

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f02004b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mNormalIcon:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f02004a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mDangerousIcon:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mPermsList:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->setPermissions(Ljava/util/List;)V

    iget-object v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mPermsView:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    iget-boolean v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->localLOGV:Z

    if-eqz v0, :cond_0

    const-string v0, "AppSecurityPermissions"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mExpanded="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mExpanded:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-boolean v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mExpanded:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->mExpanded:Z

    invoke-direct {p0}, Lcom/mappn/gfan/common/util/AppSecurityPermissions;->showPermissions()V

    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
