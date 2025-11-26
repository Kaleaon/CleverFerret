.class Lcom/flyersoft/moonreaderp/PrefGroupBooks$3;
.super Ljava/lang/Object;
.source "PrefGroupBooks.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefGroupBooks;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 184
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$3;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    const/4 p1, 0x6

    if-eq p2, p1, :cond_0

    const/4 p1, 0x5

    if-ne p2, p1, :cond_1

    .line 188
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$3;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getWindow()Landroid/view/Window;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$3;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->titleEt:Lcom/flyersoft/views/ClearableEditText;

    invoke-static {p1, p2}, Lcom/flyersoft/tools/A;->hideKeyboard(Landroid/view/Window;Landroid/widget/EditText;)V

    .line 189
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$3;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->titleEt:Lcom/flyersoft/views/ClearableEditText;

    invoke-virtual {p1}, Lcom/flyersoft/views/ClearableEditText;->clearFocus()V

    :cond_1
    const/4 p1, 0x0

    return p1
.end method
