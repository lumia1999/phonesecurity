.class final Lcom/yingyonghui/market/eb;
.super Landroid/os/Handler;
.source "ActivityDetailAppInner.java"


# instance fields
.field private synthetic a:Lcom/yingyonghui/market/model/l;

.field private synthetic b:Landroid/widget/RelativeLayout;

.field private synthetic c:Lcom/yingyonghui/market/ActivityDetailAppInner;


# direct methods
.method constructor <init>(Lcom/yingyonghui/market/ActivityDetailAppInner;Lcom/yingyonghui/market/model/l;Landroid/widget/RelativeLayout;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 551
    iput-object p1, p0, Lcom/yingyonghui/market/eb;->c:Lcom/yingyonghui/market/ActivityDetailAppInner;

    iput-object p2, p0, Lcom/yingyonghui/market/eb;->a:Lcom/yingyonghui/market/model/l;

    iput-object p3, p0, Lcom/yingyonghui/market/eb;->b:Landroid/widget/RelativeLayout;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 4
    .parameter

    .prologue
    .line 557
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/yingyonghui/market/a/a;

    if-eqz v0, :cond_0

    .line 558
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/yingyonghui/market/a/a;

    .line 560
    iget v1, v0, Lcom/yingyonghui/market/a/a;->c:I

    const/16 v2, 0x63

    if-ne v1, v2, :cond_0

    .line 561
    iget-object v1, v0, Lcom/yingyonghui/market/a/a;->h:Ljava/lang/Object;

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    .line 562
    const/4 v2, 0x0

    array-length v3, v1

    invoke-static {v1, v2, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 563
    if-eqz v1, :cond_0

    .line 564
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 565
    invoke-static {}, Lcom/yingyonghui/market/util/y;->a()Lcom/yingyonghui/market/util/y;

    iget-object v1, v0, Lcom/yingyonghui/market/a/a;->e:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/yingyonghui/market/util/y;->a(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 566
    iget v0, v0, Lcom/yingyonghui/market/a/a;->d:I

    iget-object v1, p0, Lcom/yingyonghui/market/eb;->a:Lcom/yingyonghui/market/model/l;

    iget v1, v1, Lcom/yingyonghui/market/model/l;->e:I

    if-ne v0, v1, :cond_0

    .line 567
    iget-object v0, p0, Lcom/yingyonghui/market/eb;->b:Landroid/widget/RelativeLayout;

    const v1, 0x7f0b00dd

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/ImageView;

    invoke-virtual {p0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 574
    :cond_0
    return-void
.end method
