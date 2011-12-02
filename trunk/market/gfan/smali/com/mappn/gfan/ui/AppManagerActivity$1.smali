.class Lcom/mappn/gfan/ui/AppManagerActivity$1;
.super Landroid/content/BroadcastReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/ui/AppManagerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/ui/AppManagerActivity;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/ui/AppManagerActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/ui/AppManagerActivity$1;->this$0:Lcom/mappn/gfan/ui/AppManagerActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    iget-object v0, p0, Lcom/mappn/gfan/ui/AppManagerActivity$1;->this$0:Lcom/mappn/gfan/ui/AppManagerActivity;

    invoke-static {v0}, Lcom/mappn/gfan/ui/AppManagerActivity;->access$000(Lcom/mappn/gfan/ui/AppManagerActivity;)Landroid/widget/TabHost;

    move-result-object v0

    const-string v1, "download"

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->setCurrentTabByTag(Ljava/lang/String;)V

    return-void
.end method
