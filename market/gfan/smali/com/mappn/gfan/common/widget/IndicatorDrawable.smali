.class public Lcom/mappn/gfan/common/widget/IndicatorDrawable;
.super Landroid/graphics/drawable/LevelListDrawable;


# instance fields
.field private mCanvas:Landroid/graphics/Canvas;

.field private mContext:Landroid/content/Context;

.field private mIndicatorNum:I

.field private mIsWhite:Z

.field private mPainter:Landroid/graphics/Paint;

.field private mPointSize:I

.field private mStepWidth:I

.field private mWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;IZ)V
    .locals 2

    invoke-direct {p0}, Landroid/graphics/drawable/LevelListDrawable;-><init>()V

    iput-object p1, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mContext:Landroid/content/Context;

    iput p2, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mIndicatorNum:I

    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f080010

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mPointSize:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f080011

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mStepWidth:I

    iget v0, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mStepWidth:I

    mul-int/2addr v0, p2

    iput v0, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mWidth:I

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mPainter:Landroid/graphics/Paint;

    iput-boolean p3, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mIsWhite:Z

    invoke-direct {p0}, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->initDrawable()V

    return-void
.end method

.method private initDrawable()V
    .locals 12

    const/4 v11, 0x0

    iget-object v0, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f02005b

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mIsWhite:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020059

    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    :goto_0
    move v2, v11

    :cond_0
    :goto_1
    iget v3, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mIndicatorNum:I

    if-ge v2, v3, :cond_4

    const/4 v3, 0x0

    :try_start_0
    iget v4, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mWidth:I

    iget v5, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mPointSize:I

    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    :goto_2
    if-eqz v3, :cond_0

    iget-object v4, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v4, v3}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    iget-object v4, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v4, v11}, Landroid/graphics/Canvas;->drawColor(I)V

    iget v4, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mPointSize:I

    div-int/lit8 v4, v4, 0x2

    iget v5, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mPointSize:I

    div-int/lit8 v5, v5, 0x2

    move v6, v4

    move v4, v11

    :goto_3
    iget v7, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mIndicatorNum:I

    if-ge v4, v7, :cond_3

    if-ne v2, v4, :cond_2

    iget-object v7, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mCanvas:Landroid/graphics/Canvas;

    int-to-float v8, v6

    int-to-float v9, v5

    iget-object v10, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mPainter:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v8, v9, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    :goto_4
    iget v7, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mStepWidth:I

    add-int/2addr v6, v7

    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :cond_1
    iget-object v1, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020058

    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0

    :cond_2
    iget-object v7, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mCanvas:Landroid/graphics/Canvas;

    int-to-float v8, v6

    int-to-float v9, v5

    iget-object v10, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mPainter:Landroid/graphics/Paint;

    invoke-virtual {v7, v0, v8, v9, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_4

    :cond_3
    iget-object v4, p0, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v4}, Landroid/graphics/Canvas;->save()I

    new-instance v4, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v4, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, v2, v2, v4}, Lcom/mappn/gfan/common/widget/IndicatorDrawable;->addLevel(IILandroid/graphics/drawable/Drawable;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_4
    return-void

    :catch_0
    move-exception v4

    goto :goto_2
.end method
