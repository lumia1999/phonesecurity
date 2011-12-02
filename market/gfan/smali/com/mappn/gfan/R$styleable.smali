.class public final Lcom/mappn/gfan/R$styleable;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final BubbleTextView:[I

.field public static final BubbleTextView_number:I

.field public static final Gallery:[I

.field public static final Gallery_android_galleryItemBackground:I

.field public static final TitleSpinner:[I

.field public static final TitleSpinner_prompt:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-array v0, v3, [I

    const/high16 v1, 0x7f01

    aput v1, v0, v2

    sput-object v0, Lcom/mappn/gfan/R$styleable;->BubbleTextView:[I

    new-array v0, v3, [I

    const v1, 0x101004c

    aput v1, v0, v2

    sput-object v0, Lcom/mappn/gfan/R$styleable;->Gallery:[I

    new-array v0, v3, [I

    const v1, 0x7f010001

    aput v1, v0, v2

    sput-object v0, Lcom/mappn/gfan/R$styleable;->TitleSpinner:[I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
