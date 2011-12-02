.class Lcom/mappn/gfan/common/util/NetworkManager$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljavax/net/ssl/HostnameVerifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mappn/gfan/common/util/NetworkManager;->setDefaultHostnameVerifier()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mappn/gfan/common/util/NetworkManager;


# direct methods
.method constructor <init>(Lcom/mappn/gfan/common/util/NetworkManager;)V
    .locals 0

    iput-object p1, p0, Lcom/mappn/gfan/common/util/NetworkManager$1;->this$0:Lcom/mappn/gfan/common/util/NetworkManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
