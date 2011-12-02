.class public Lcom/mappn/gfan/common/vo/PayAndChargeLog;
.super Ljava/lang/Object;


# static fields
.field public static final TYPE_CHARGE:I = 0x3

.field public static final TYPE_CONSUME:I = 0x1

.field public static final TYPE_MARKET:I = 0x2


# instance fields
.field public desc:Ljava/lang/String;

.field public iconUrl:Ljava/lang/String;

.field public id:I

.field public name:Ljava/lang/String;

.field public payment:I

.field public sourceType:I

.field public time:Ljava/lang/String;

.field public type:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    iput v0, p0, Lcom/mappn/gfan/common/vo/PayAndChargeLog;->type:I

    return-void
.end method
