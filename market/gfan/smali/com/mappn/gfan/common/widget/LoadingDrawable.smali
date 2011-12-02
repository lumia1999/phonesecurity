.class public Lcom/mappn/gfan/common/widget/LoadingDrawable;
.super Landroid/graphics/drawable/AnimationDrawable;


# static fields
.field private static final BLOCK_NUMBER:I = 0x4

.field private static final DURATION:I = 0xc8

.field private static final HEIGHT_LARGE:I = 0x28

.field private static final HEIGHT_MEDIUM:I = 0x14

.field private static final HEIGHT_SMALL:I = 0xc

.field public static final SIZE_LARGE:I = 0x2

.field public static final SIZE_MEDIUM:I = 0x1

.field public static final SIZE_SMALL:I = 0x0

.field private static final WIDTH_LARGE:I = 0xb4

.field private static final WIDTH_MEDIUM:I = 0x5a

.field private static final WIDTH_SMALL:I = 0x36


# instance fields
.field private color1:I

.field private color2:I

.field private mDuration:I

.field private mLoadingStyle:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 6

    const/4 v2, 0x0

    const/16 v5, 0xc8

    move-object v0, p0

    move-object v1, p1

    move v3, v2

    move v4, v2

    invoke-direct/range {v0 .. v5}, Lcom/mappn/gfan/common/widget/LoadingDrawable;-><init>(Landroid/content/Context;IIII)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IIII)V
    .locals 23

    invoke-direct/range {p0 .. p0}, Landroid/graphics/drawable/AnimationDrawable;-><init>()V

    move/from16 v0, p2

    move-object/from16 v1, p0

    iput v0, v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;->mLoadingStyle:I

    if-nez p3, :cond_1

    const-string v3, "#80ff9600"

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    move v0, v3

    move-object/from16 v1, p0

    iput v0, v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;->color1:I

    const-string v3, "#30000000"

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    move v0, v3

    move-object/from16 v1, p0

    iput v0, v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;->color2:I

    :goto_0
    move/from16 v0, p5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;->mDuration:I

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move v1, v4

    invoke-virtual {v0, v1}, Lcom/mappn/gfan/common/widget/LoadingDrawable;->setOneShot(Z)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mappn/gfan/common/widget/LoadingDrawable;->mLoadingStyle:I

    move v10, v0

    packed-switch v10, :pswitch_data_0

    move v10, v8

    move v11, v7

    move v12, v6

    move v13, v5

    move v14, v4

    :goto_1
    new-instance v15, Landroid/graphics/Paint;

    invoke-direct {v15}, Landroid/graphics/Paint;-><init>()V

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mappn/gfan/common/widget/LoadingDrawable;->color1:I

    move v3, v0

    invoke-virtual {v15, v3}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v15, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 v3, 0x1

    invoke-virtual {v15, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    new-instance v16, Landroid/graphics/Paint;

    invoke-direct/range {v16 .. v16}, Landroid/graphics/Paint;-><init>()V

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mappn/gfan/common/widget/LoadingDrawable;->color2:I

    move v3, v0

    move-object/from16 v0, v16

    move v1, v3

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    move-object/from16 v0, v16

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 v3, 0x1

    move-object/from16 v0, v16

    move v1, v3

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3}, Landroid/graphics/Canvas;-><init>()V

    const/4 v4, 0x0

    move/from16 v17, v4

    :cond_0
    :goto_2
    const/4 v4, 0x6

    move/from16 v0, v17

    move v1, v4

    if-ge v0, v1, :cond_6

    const/4 v4, 0x0

    :try_start_0
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    invoke-static {v10, v9, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    move-object/from16 v18, v4

    :goto_3
    if-eqz v18, :cond_0

    move-object v0, v3

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/graphics/Canvas;->drawColor(I)V

    const/4 v4, 0x0

    div-int/lit8 v19, v9, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x4

    move/from16 v0, v17

    move v1, v6

    if-ge v0, v1, :cond_2

    move/from16 v20, v17

    :goto_4
    move/from16 v21, v5

    :goto_5
    const/4 v5, 0x4

    move/from16 v0, v21

    move v1, v5

    if-ge v0, v1, :cond_5

    if-nez v21, :cond_3

    int-to-float v4, v4

    add-float v5, v14, v13

    add-float/2addr v4, v5

    float-to-int v4, v4

    move/from16 v22, v4

    :goto_6
    move/from16 v0, v21

    move/from16 v1, v20

    if-ne v0, v1, :cond_4

    move/from16 v0, v22

    int-to-float v0, v0

    move v4, v0

    sub-float/2addr v4, v11

    move/from16 v0, v19

    int-to-float v0, v0

    move v5, v0

    sub-float/2addr v5, v11

    move/from16 v0, v22

    int-to-float v0, v0

    move v6, v0

    add-float/2addr v6, v11

    move/from16 v0, v19

    int-to-float v0, v0

    move v7, v0

    add-float/2addr v7, v11

    move-object v8, v15

    :goto_7
    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v4, v21, 0x1

    move/from16 v21, v4

    move/from16 v4, v22

    goto :goto_5

    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    move-object v0, v3

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    move v0, v3

    move-object/from16 v1, p0

    iput v0, v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;->color1:I

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    move-object v0, v3

    move/from16 v1, p4

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    move v0, v3

    move-object/from16 v1, p0

    iput v0, v1, Lcom/mappn/gfan/common/widget/LoadingDrawable;->color2:I

    goto/16 :goto_0

    :pswitch_0
    const v4, 0x7f080002

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v4

    const/high16 v5, 0x4000

    div-float v5, v4, v5

    const v6, 0x7f080003

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v6

    const/high16 v7, 0x4000

    div-float/2addr v6, v7

    const v7, 0x7f080008

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v7

    float-to-int v7, v7

    const v8, 0x7f080009

    invoke-virtual {v3, v8}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    float-to-int v3, v3

    move v9, v3

    move v10, v7

    move v11, v6

    move v12, v4

    move v13, v5

    move v14, v4

    goto/16 :goto_1

    :pswitch_1
    const v4, 0x7f080004

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v4

    const/high16 v5, 0x4000

    div-float v5, v4, v5

    const v6, 0x7f080005

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v6

    const/high16 v7, 0x4000

    div-float/2addr v6, v7

    const v7, 0x7f08000a

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v7

    float-to-int v7, v7

    const v8, 0x7f08000b

    invoke-virtual {v3, v8}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    float-to-int v3, v3

    move v9, v3

    move v10, v7

    move v11, v6

    move v12, v4

    move v13, v5

    move v14, v4

    goto/16 :goto_1

    :pswitch_2
    const v4, 0x7f080006

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v4

    const/high16 v5, 0x4000

    div-float v5, v4, v5

    const v6, 0x7f080007

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v6

    const/high16 v7, 0x4000

    div-float/2addr v6, v7

    const v7, 0x7f08000c

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v7

    float-to-int v7, v7

    const v8, 0x7f08000d

    invoke-virtual {v3, v8}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    float-to-int v3, v3

    move v9, v3

    move v10, v7

    move v11, v6

    move v12, v4

    move v13, v5

    move v14, v4

    goto/16 :goto_1

    :catch_0
    move-exception v5

    move-object/from16 v18, v4

    goto/16 :goto_3

    :cond_2
    const/4 v6, 0x3

    rem-int/lit8 v7, v17, 0x3

    sub-int/2addr v6, v7

    move/from16 v20, v6

    goto/16 :goto_4

    :cond_3
    int-to-float v4, v4

    add-float v5, v14, v12

    add-float/2addr v4, v5

    float-to-int v4, v4

    move/from16 v22, v4

    goto/16 :goto_6

    :cond_4
    move/from16 v0, v22

    int-to-float v0, v0

    move v4, v0

    sub-float/2addr v4, v13

    move/from16 v0, v19

    int-to-float v0, v0

    move v5, v0

    sub-float/2addr v5, v13

    move/from16 v0, v22

    int-to-float v0, v0

    move v6, v0

    add-float/2addr v6, v13

    move/from16 v0, v19

    int-to-float v0, v0

    move v7, v0

    add-float/2addr v7, v13

    move-object/from16 v8, v16

    goto/16 :goto_7

    :cond_5
    add-int/lit8 v4, v17, 0x1

    invoke-virtual {v3}, Landroid/graphics/Canvas;->save()I

    new-instance v5, Landroid/graphics/drawable/BitmapDrawable;

    move-object v0, v5

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mappn/gfan/common/widget/LoadingDrawable;->mDuration:I

    move v6, v0

    move-object/from16 v0, p0

    move-object v1, v5

    move v2, v6

    invoke-virtual {v0, v1, v2}, Lcom/mappn/gfan/common/widget/LoadingDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    move/from16 v17, v4

    goto/16 :goto_2

    :cond_6
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public getMinimumHeight()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/common/widget/LoadingDrawable;->mLoadingStyle:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0}, Landroid/graphics/drawable/AnimationDrawable;->getMinimumHeight()I

    move-result v0

    :goto_0
    return v0

    :pswitch_0
    const/16 v0, 0xc

    goto :goto_0

    :pswitch_1
    const/16 v0, 0x14

    goto :goto_0

    :pswitch_2
    const/16 v0, 0x28

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public getMinimumWidth()I
    .locals 1

    iget v0, p0, Lcom/mappn/gfan/common/widget/LoadingDrawable;->mLoadingStyle:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0}, Landroid/graphics/drawable/AnimationDrawable;->getMinimumWidth()I

    move-result v0

    :goto_0
    return v0

    :pswitch_0
    const/16 v0, 0x36

    goto :goto_0

    :pswitch_1
    const/16 v0, 0x5a

    goto :goto_0

    :pswitch_2
    const/16 v0, 0xb4

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
