.class Lcom/mappn/gfan/common/widget/AppListAdapter$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/widget/AppListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/common/widget/AppListAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$1;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3

    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$1;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$000(Lcom/mappn/gfan/common/widget/AppListAdapter;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "is_checked"

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_0

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$1;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$100(Lcom/mappn/gfan/common/widget/AppListAdapter;)Ljava/util/HashMap;

    move-result-object v1

    const-string v2, "p_id"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    invoke-virtual {p1, p2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    return-void

    :cond_0
    iget-object v1, p0, Lcom/mappn/gfan/common/widget/AppListAdapter$1;->this$0:Lcom/mappn/gfan/common/widget/AppListAdapter;

    invoke-static {v1}, Lcom/mappn/gfan/common/widget/AppListAdapter;->access$100(Lcom/mappn/gfan/common/widget/AppListAdapter;)Ljava/util/HashMap;

    move-result-object v1

    const-string v2, "p_id"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method
