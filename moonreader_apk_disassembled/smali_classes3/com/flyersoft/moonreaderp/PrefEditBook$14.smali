.class Lcom/flyersoft/moonreaderp/PrefEditBook$14;
.super Ljava/lang/Object;
.source "PrefEditBook.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefEditBook;->selectFavoriteName(Landroid/content/Context;Landroid/widget/EditText;Landroid/widget/CheckBox;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 563
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 565
    invoke-static {p2}, Lcom/flyersoft/moonreaderp/PrefEditBook;->-$$Nest$sfputfavSelectIndex(I)V

    return-void
.end method
