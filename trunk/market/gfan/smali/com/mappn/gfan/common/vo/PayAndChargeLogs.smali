.class public Lcom/mappn/gfan/common/vo/PayAndChargeLogs;
.super Ljava/lang/Object;


# instance fields
.field public endPosition:I

.field public payAndChargeLogList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mappn/gfan/common/vo/PayAndChargeLog;",
            ">;"
        }
    .end annotation
.end field

.field public totalSize:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/vo/PayAndChargeLogs;->payAndChargeLogList:Ljava/util/ArrayList;

    return-void
.end method
