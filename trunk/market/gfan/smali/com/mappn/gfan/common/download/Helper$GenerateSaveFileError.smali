.class public Lcom/mappn/gfan/common/download/Helper$GenerateSaveFileError;
.super Ljava/lang/Exception;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/download/Helper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GenerateSaveFileError"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x6b8dc06d47cfc4efL


# instance fields
.field mMessage:Ljava/lang/String;

.field mStatus:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    iput p1, p0, Lcom/mappn/gfan/common/download/Helper$GenerateSaveFileError;->mStatus:I

    iput-object p2, p0, Lcom/mappn/gfan/common/download/Helper$GenerateSaveFileError;->mMessage:Ljava/lang/String;

    return-void
.end method
