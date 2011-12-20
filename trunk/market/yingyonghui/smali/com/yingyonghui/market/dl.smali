.class final Lcom/yingyonghui/market/dl;
.super Ljava/lang/Object;
.source "ActivityTab4Search.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnTouchModeChangeListener;


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/ay;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ay;)V
    .locals 0
    .parameter

    .prologue
    .line 143
    iput-object p1, p0, Lcom/yingyonghui/market/dl;->a:Lcom/yingyonghui/market/ay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onTouchModeChanged(Z)V
    .locals 1
    .parameter

    .prologue
    .line 146
    iget-object v0, p0, Lcom/yingyonghui/market/dl;->a:Lcom/yingyonghui/market/ay;

    iget-object v0, v0, Lcom/yingyonghui/market/ay;->a:Lcom/yingyonghui/market/ActivityTab4Search;

    invoke-static {v0}, Lcom/yingyonghui/market/ActivityTab4Search;->d(Lcom/yingyonghui/market/ActivityTab4Search;)Landroid/widget/AutoCompleteTextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->requestFocus()Z

    .line 147
    return-void
.end method
