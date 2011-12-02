.class Lcom/mobclick/android/g;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic a:Landroid/content/Context;

.field private final synthetic b:Ljava/io/File;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/io/File;)V
    .locals 0

    iput-object p1, p0, Lcom/mobclick/android/g;->a:Landroid/content/Context;

    iput-object p2, p0, Lcom/mobclick/android/g;->b:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/mobclick/android/g;->a:Landroid/content/Context;

    iget-object v1, p0, Lcom/mobclick/android/g;->b:Ljava/io/File;

    invoke-static {v0, v1}, Lcom/mobclick/android/MobclickAgent;->a(Landroid/content/Context;Ljava/io/File;)V

    return-void
.end method
