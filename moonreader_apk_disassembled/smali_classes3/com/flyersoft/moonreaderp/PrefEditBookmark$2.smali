.class Lcom/flyersoft/moonreaderp/PrefEditBookmark$2;
.super Ljava/lang/Object;
.source "PrefEditBookmark.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefEditBookmark;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefEditBookmark$OnAfterEdit;Ljava/lang/Integer;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefEditBookmark;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 38
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$2;->val$v:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 41
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->et:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->text:Ljava/lang/String;

    .line 42
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->noAskCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    const/4 p2, 0x1

    xor-int/2addr p1, p2

    sput-boolean p1, Lcom/flyersoft/tools/A;->bookmarkManually:Z

    .line 43
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->editColor:Ljava/lang/Integer;

    if-nez p1, :cond_0

    .line 44
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->colorCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    xor-int/2addr p1, p2

    sput-boolean p1, Lcom/flyersoft/tools/A;->bookmarkNoColor:Z

    goto :goto_0

    .line 45
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->colorCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    if-nez p1, :cond_1

    .line 46
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p1, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->editColor:Ljava/lang/Integer;

    .line 47
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->onAfterEdit:Lcom/flyersoft/moonreaderp/PrefEditBookmark$OnAfterEdit;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->text:Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->editColor:Ljava/lang/Integer;

    invoke-interface {p1, v0, v1}, Lcom/flyersoft/moonreaderp/PrefEditBookmark$OnAfterEdit;->AfterEdit(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 48
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark$2;->val$v:Landroid/view/View;

    if-eqz p1, :cond_2

    const/4 v0, 0x0

    .line 49
    invoke-static {v0, p1, p2}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Landroid/app/Activity;Landroid/view/View;Z)V

    :cond_2
    return-void
.end method
