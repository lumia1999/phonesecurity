.class final enum Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mappn/gfan/common/hudee/HudeeUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "TYPE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

.field public static final enum APK:Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

.field public static final enum IMG:Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

.field public static final enum MSG_AUTHORITY:Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

.field public static final enum OTHER:Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

.field public static final enum URL:Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    const-string v1, "URL"

    invoke-direct {v0, v1, v2}, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;->URL:Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    new-instance v0, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    const-string v1, "APK"

    invoke-direct {v0, v1, v3}, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;->APK:Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    new-instance v0, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    const-string v1, "IMG"

    invoke-direct {v0, v1, v4}, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;->IMG:Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    new-instance v0, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    const-string v1, "OTHER"

    invoke-direct {v0, v1, v5}, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;->OTHER:Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    new-instance v0, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    const-string v1, "MSG_AUTHORITY"

    invoke-direct {v0, v1, v6}, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;->MSG_AUTHORITY:Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    sget-object v1, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;->URL:Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;->APK:Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    aput-object v1, v0, v3

    sget-object v1, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;->IMG:Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    aput-object v1, v0, v4

    sget-object v1, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;->OTHER:Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    aput-object v1, v0, v5

    sget-object v1, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;->MSG_AUTHORITY:Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    aput-object v1, v0, v6

    sput-object v0, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;->$VALUES:[Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;
    .locals 1

    const-class v0, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    return-object p0
.end method

.method public static values()[Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;
    .locals 1

    sget-object v0, Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;->$VALUES:[Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    invoke-virtual {v0}, [Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mappn/gfan/common/hudee/HudeeUtils$TYPE;

    return-object v0
.end method
