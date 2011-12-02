.class Lcom/mappn/gfan/common/util/AsyncTaskEx$AsyncTaskResult;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/util/AsyncTaskEx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AsyncTaskResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Data:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final mData:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TData;"
        }
    .end annotation
.end field

.field final mTask:Lcom/mappn/gfan/common/util/AsyncTaskEx;


# direct methods
.method varargs constructor <init>(Lcom/mappn/gfan/common/util/AsyncTaskEx;[Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mappn/gfan/common/util/AsyncTaskEx;",
            "[TData;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx$AsyncTaskResult;->mTask:Lcom/mappn/gfan/common/util/AsyncTaskEx;

    iput-object p2, p0, Lcom/mappn/gfan/common/util/AsyncTaskEx$AsyncTaskResult;->mData:[Ljava/lang/Object;

    return-void
.end method
