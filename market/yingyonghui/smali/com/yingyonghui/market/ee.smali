.class final Lcom/yingyonghui/market/ee;
.super Ljava/lang/Object;
.source "ActivityListApp.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# direct methods
.method synthetic constructor <init>()V
    .locals 1

    .prologue
    .line 867
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/yingyonghui/market/ee;-><init>(B)V

    return-void
.end method

.method private constructor <init>(B)V
    .locals 0
    .parameter

    .prologue
    .line 867
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 870
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 877
    const/4 v0, 0x0

    return v0
.end method
