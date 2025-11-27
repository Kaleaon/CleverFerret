.class Lcom/flyersoft/moonreaderp/PrefEditBook$3;
.super Ljava/lang/Object;
.source "PrefEditBook.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefEditBook;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefEditBook;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 232
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$3;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    .line 239
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$3;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverTv:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$3;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverEt:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 240
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$3;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverTv:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setClickable(Z)V

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
