.class Lcom/mobclick/android/i;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic a:Landroid/content/Context;

.field private final synthetic b:Ljava/lang/String;

.field private final synthetic c:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mobclick/android/i;->a:Landroid/content/Context;

    iput-object p2, p0, Lcom/mobclick/android/i;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/mobclick/android/i;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 7

    new-instance v0, Lcom/mobclick/android/a;

    iget-object v1, p0, Lcom/mobclick/android/i;->a:Landroid/content/Context;

    iget-object v2, p0, Lcom/mobclick/android/i;->b:Ljava/lang/String;

    iget-object v3, p0, Lcom/mobclick/android/i;->a:Landroid/content/Context;

    invoke-static {v3}, Lcom/mobclick/android/n;->l(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/mobclick/android/i;->a:Landroid/content/Context;

    invoke-static {v4}, Lcom/mobclick/android/n;->m(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    iget-object v6, p0, Lcom/mobclick/android/i;->c:Ljava/lang/String;

    invoke-direct/range {v0 .. v6}, Lcom/mobclick/android/a;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/mobclick/android/a;->c()V

    return-void
.end method
