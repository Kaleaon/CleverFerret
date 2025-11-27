.class Lcom/flyersoft/moonreaderp/PrefEditBook$13;
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


# instance fields
.field final synthetic val$favCheck:Landroid/widget/CheckBox;

.field final synthetic val$favEt:Landroid/widget/EditText;

.field final synthetic val$favs:[Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/widget/EditText;[Ljava/lang/String;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 568
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$13;->val$favEt:Landroid/widget/EditText;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$13;->val$favs:[Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$13;->val$favCheck:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 570
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefEditBook;->-$$Nest$sfgetfavSelectIndex()I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_1

    .line 571
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$13;->val$favEt:Landroid/widget/EditText;

    const/4 p2, 0x1

    if-eqz p1, :cond_0

    .line 572
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$13;->val$favs:[Ljava/lang/String;

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefEditBook;->-$$Nest$sfgetfavSelectIndex()I

    move-result v1

    aget-object v0, v0, v1

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 573
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$13;->val$favEt:Landroid/widget/EditText;

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 575
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$13;->val$favCheck:Landroid/widget/CheckBox;

    if-eqz p1, :cond_1

    .line 576
    invoke-virtual {p1, p2}, Landroid/widget/CheckBox;->setChecked(Z)V

    :cond_1
    return-void
.end method
