.class public Lcom/mappn/gfan/ui/DownloadManagerActivity;
.super Lcom/mappn/gfan/common/widget/BaseActivity;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# static fields
.field private static final CONTEXT_MENU_DELETE_FILE:I


# instance fields
.field private mAdapter:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

.field private mInstallReceiver:Landroid/content/BroadcastReceiver;

.field mList:Landroid/widget/ListView;

.field private mLoading:Landroid/widget/FrameLayout;

.field private mLongClickPos:I

.field private mNoData:Landroid/widget/TextView;

.field private mProgress:Landroid/widget/ProgressBar;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;-><init>()V

    new-instance v0, Lcom/mappn/gfan/ui/DownloadManagerActivity$1;

    invoke-direct {v0, p0}, Lcom/mappn/gfan/ui/DownloadManagerActivity$1;-><init>(Lcom/mappn/gfan/ui/DownloadManagerActivity;)V

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mInstallReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/mappn/gfan/ui/DownloadManagerActivity;)Lcom/mappn/gfan/ui/DownloadManagerAdapter;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mAdapter:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    return-object v0
.end method


# virtual methods
.method public doInitListAdapter()Lcom/mappn/gfan/ui/DownloadManagerAdapter;
    .locals 3

    new-instance v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;-><init>(Landroid/content/Context;Lcom/mappn/gfan/ui/DownloadManagerAdapter$ListOrderedMap;)V

    return-object v0
.end method

.method public doInitView(Landroid/os/Bundle;)Z
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    const v0, 0x7f0c000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mLoading:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mLoading:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0004

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mProgress:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mProgress:Landroid/widget/ProgressBar;

    new-instance v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mLoading:Landroid/widget/FrameLayout;

    const v1, 0x7f0c0056

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mNoData:Landroid/widget/TextView;

    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mList:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mLoading:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, v4}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->doInitListAdapter()Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mAdapter:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mAdapter:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-virtual {v0, p0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->setActivity(Lcom/mappn/gfan/ui/DownloadManagerActivity;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mAdapter:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->registerForContextMenu(Landroid/view/View;)V

    return v4
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    :pswitch_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mAdapter:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    iget v1, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mLongClickPos:I

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->delApp(I)V

    const/4 v0, 0x1

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/mappn/gfan/common/widget/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f030003

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->setContentView(I)V

    invoke-virtual {p0, p1}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->doInitView(Landroid/os/Bundle;)Z

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

    iget-object v1, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mInstallReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 3

    const/4 v2, 0x0

    check-cast p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    iget v0, p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    iput v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mLongClickPos:I

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mAdapter:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    iget v1, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mLongClickPos:I

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    iget v0, p0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mViewType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const v0, 0x7f090120

    invoke-interface {p1, v2, v2, v2, v0}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    :cond_0
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onDestroy()V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mInstallReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mAdapter:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-virtual {v0}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mAdapter:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mAdapter:Lcom/mappn/gfan/ui/DownloadManagerAdapter;

    invoke-virtual {v0, p3}, Lcom/mappn/gfan/ui/DownloadManagerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;

    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/mappn/gfan/ui/PreloadActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "extra.key.package.name"

    iget-object v0, v0, Lcom/mappn/gfan/ui/DownloadManagerAdapter$AppItem;->mPackageName:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onPause()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onPause(Landroid/content/Context;)V

    return-void
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/mappn/gfan/common/widget/BaseActivity;->onPrepareDialog(ILandroid/app/Dialog;)V

    invoke-virtual {p2}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/mappn/gfan/common/widget/BaseActivity;->onResume()V

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->getParent()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobclick/android/MobclickAgent;->onResume(Landroid/content/Context;)V

    return-void
.end method

.method refreshNoFiles(Z)V
    .locals 6

    const/16 v5, 0x8

    const/4 v4, 0x0

    const/4 v3, 0x0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/mappn/gfan/ui/DownloadManagerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f02008f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v3, v1, v3, v3}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mNoData:Landroid/widget/TextView;

    const v1, 0x7f09010d

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mNoData:Landroid/widget/TextView;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v5}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mNoData:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/mappn/gfan/ui/DownloadManagerActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0
.end method
