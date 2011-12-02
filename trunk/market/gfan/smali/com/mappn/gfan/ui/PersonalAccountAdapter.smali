.class public Lcom/mappn/gfan/ui/PersonalAccountAdapter;
.super Landroid/widget/BaseAdapter;

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDataSource:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private mFrom:[Ljava/lang/String;

.field private mHandler:Landroid/os/Handler;

.field private final mHolders:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Landroid/view/View;",
            "[",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mInflater:Landroid/view/LayoutInflater;

.field private mResource:I

.field private mSession:Lcom/mappn/gfan/Session;

.field private mTo:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;I[Ljava/lang/String;[ILandroid/os/Handler;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;I[",
            "Ljava/lang/String;",
            "[I",
            "Landroid/os/Handler;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mHolders:Ljava/util/WeakHashMap;

    if-nez p2, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mDataSource:Ljava/util/ArrayList;

    :goto_0
    iput-object p1, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mContext:Landroid/content/Context;

    iput p3, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mResource:I

    iput-object p4, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mFrom:[Ljava/lang/String;

    iput-object p5, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mTo:[I

    iput-object p6, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mHandler:Landroid/os/Handler;

    invoke-static {p1}, Lcom/mappn/gfan/Session;->get(Landroid/content/Context;)Lcom/mappn/gfan/Session;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mSession:Lcom/mappn/gfan/Session;

    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mInflater:Landroid/view/LayoutInflater;

    return-void

    :cond_0
    iput-object p2, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mDataSource:Ljava/util/ArrayList;

    goto :goto_0
.end method

.method private bindView(ILandroid/view/View;)V
    .locals 11

    const v10, 0x7f0c002e

    const/4 v9, 0x0

    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    if-nez v1, :cond_1

    :cond_0
    return-void

    :cond_1
    iget-object v2, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mHolders:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Landroid/view/View;

    iget-object v6, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mFrom:[Ljava/lang/String;

    iget-object v3, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mTo:[I

    array-length v7, v3

    move v8, v9

    :goto_0
    if-ge v8, v7, :cond_0

    aget-object v4, v2, v8

    if-eqz v4, :cond_2

    aget-object v3, v6, v8

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    instance-of v3, v4, Landroid/widget/CheckBox;

    if-eqz v3, :cond_5

    if-eqz v5, :cond_2

    instance-of v3, v5, Ljava/lang/Integer;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v3}, Lcom/mappn/gfan/Session;->isLogin()Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v3}, Lcom/mappn/gfan/Session;->isDeviceBinded()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {p2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    check-cast v3, Landroid/widget/CheckBox;

    const v5, 0x7f02001f

    invoke-virtual {v3, v5}, Landroid/widget/CheckBox;->setButtonDrawable(I)V

    :goto_1
    check-cast v4, Landroid/widget/CheckBox;

    invoke-virtual {v4, p0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    :cond_2
    :goto_2
    add-int/lit8 v3, v8, 0x1

    move v8, v3

    goto :goto_0

    :cond_3
    move-object v0, v4

    check-cast v0, Landroid/widget/CheckBox;

    move-object v3, v0

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v3, v5}, Landroid/widget/CheckBox;->setButtonDrawable(I)V

    goto :goto_1

    :cond_4
    invoke-virtual {p2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    check-cast v3, Landroid/widget/CheckBox;

    const v5, 0x7f02001e

    invoke-virtual {v3, v5}, Landroid/widget/CheckBox;->setButtonDrawable(I)V

    goto :goto_1

    :cond_5
    instance-of v3, v4, Landroid/widget/TextView;

    if-eqz v3, :cond_6

    check-cast v4, Landroid/widget/TextView;

    invoke-direct {p0, v4, v5, p1}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->setTextViewValue(Landroid/widget/TextView;Ljava/lang/Object;I)V

    goto :goto_2

    :cond_6
    instance-of v3, v4, Landroid/widget/ImageView;

    if-eqz v3, :cond_2

    check-cast v4, Landroid/widget/ImageView;

    instance-of v3, v5, Ljava/lang/Integer;

    if-eqz v3, :cond_8

    if-nez v5, :cond_7

    const v3, 0x7f02002a

    :goto_3
    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_2

    :cond_7
    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_3

    :cond_8
    instance-of v3, v5, Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_a

    if-nez v5, :cond_9

    iget-object v3, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v5, 0x7f02002d

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    :goto_4
    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_2

    :cond_9
    check-cast v5, Landroid/graphics/drawable/Drawable;

    move-object v3, v5

    goto :goto_4

    :cond_a
    instance-of v3, v5, Ljava/lang/String;

    if-eqz v3, :cond_b

    iget-object v3, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mContext:Landroid/content/Context;

    check-cast v5, Ljava/lang/String;

    invoke-static {v3, v5, v4}, Lcom/mappn/gfan/common/util/ImageUtils;->download(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V

    goto :goto_2

    :cond_b
    instance-of v3, v5, Ljava/lang/Boolean;

    if-eqz v3, :cond_2

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_c

    if-nez p1, :cond_c

    invoke-virtual {v4, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_2

    :cond_c
    const/16 v3, 0x8

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_2
.end method

.method private isGroupOrHeader(ILjava/lang/String;)Z
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mDataSource:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/HashMap;

    if-nez p0, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_3

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_0

    :cond_3
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_4

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_0

    :cond_4
    move v0, v1

    goto :goto_0
.end method

.method private newView(ILandroid/view/ViewGroup;I)Landroid/view/View;
    .locals 11

    const/4 v10, 0x1

    const v9, 0x7f0c002e

    const/16 v8, 0x8

    const v7, 0x7f0c002d

    const/4 v6, 0x0

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mInflater:Landroid/view/LayoutInflater;

    iget v1, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mResource:I

    invoke-virtual {v0, v1, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mTo:[I

    array-length v2, v1

    new-array v3, v2, [Landroid/view/View;

    move v4, v6

    :goto_1
    if-ge v4, v2, :cond_0

    aget v5, v1, v4

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    aput-object v5, v3, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :pswitch_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f030012

    invoke-virtual {v0, v1, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mInflater:Landroid/view/LayoutInflater;

    iget v1, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mResource:I

    invoke-virtual {v0, v1, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f03001f

    invoke-virtual {v0, v1, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    :pswitch_4
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f03001e

    invoke-virtual {v0, v1, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    :pswitch_5
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f03001d

    invoke-virtual {v0, v1, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->isLogin()Z

    move-result v1

    if-eqz v1, :cond_4

    if-ne p3, v10, :cond_2

    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v8}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    :goto_2
    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mHolders:Ljava/util/WeakHashMap;

    invoke-virtual {v1, v0, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-object v0

    :cond_2
    if-eqz p3, :cond_3

    const/4 v1, 0x2

    if-ne p3, v1, :cond_1

    :cond_3
    invoke-virtual {v0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v8}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2

    :cond_4
    if-nez p3, :cond_5

    invoke-virtual {v0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    :cond_5
    if-ne p3, v10, :cond_6

    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v8}, Landroid/view/View;->setVisibility(I)V

    :cond_6
    const/4 v1, 0x2

    if-ne p3, v1, :cond_1

    invoke-virtual {v0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v8}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private setTextViewValue(Landroid/widget/TextView;Ljava/lang/Object;I)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isLogin()Z

    move-result v0

    if-eqz v0, :cond_2

    if-nez p3, :cond_2

    invoke-virtual {p1}, Landroid/widget/TextView;->getId()I

    move-result v0

    const v1, 0x7f0c0002

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->getUserName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    invoke-virtual {p1}, Landroid/widget/TextView;->getId()I

    move-result v0

    const v1, 0x7f0c0020

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mContext:Landroid/content/Context;

    const v1, 0x7f090050

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    check-cast p2, Ljava/lang/CharSequence;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method


# virtual methods
.method public addData(Ljava/util/HashMap;)V
    .locals 2
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

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->getCount()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method public addData(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->getCount()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method public changeDataSource(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method public clearData()V
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mDataSource:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getDataSource()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mDataSource:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mDataSource:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1

    const-string v0, "place_holder"

    invoke-direct {p0, p1, v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->isGroupOrHeader(ILjava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const-string v0, "header"

    invoke-direct {p0, p1, v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->isGroupOrHeader(ILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    sget-boolean v0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->getCount()I

    move-result v0

    if-lt p1, v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "account_type"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez p2, :cond_1

    invoke-direct {p0, v1, p3, p1}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->newView(ILandroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object v0

    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->bindView(ILandroid/view/View;)V

    return-object v0

    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v2, 0x9

    if-ne v2, v1, :cond_2

    invoke-direct {p0, v1, p3, p1}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->newView(ILandroid/view/ViewGroup;I)Landroid/view/View;

    :cond_2
    if-eq v0, v1, :cond_3

    invoke-direct {p0, v1, p3, p1}, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->newView(ILandroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    :cond_3
    move-object v0, p2

    goto :goto_0
.end method

.method public isEnabled(I)Z
    .locals 4

    const/4 v3, 0x0

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mDataSource:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "account_type"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    move v0, v2

    :goto_0
    return v0

    :pswitch_0
    move v0, v3

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isLogin()Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v0}, Lcom/mappn/gfan/Session;->isLogin()Z

    move-result v0

    if-nez v0, :cond_1

    if-nez p1, :cond_1

    move v0, v2

    goto :goto_0

    :cond_1
    move v0, v3

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/mappn/gfan/ui/PersonalAccountActivity;

    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->isLogin()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mSession:Lcom/mappn/gfan/Session;

    invoke-virtual {v1}, Lcom/mappn/gfan/Session;->isDeviceBinded()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/PersonalAccountActivity;->getCurrentBindStatue()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/mappn/gfan/ui/PersonalAccountAdapter;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0
.end method
