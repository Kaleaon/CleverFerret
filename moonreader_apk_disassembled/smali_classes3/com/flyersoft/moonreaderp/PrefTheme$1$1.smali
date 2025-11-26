.class Lcom/flyersoft/moonreaderp/PrefTheme$1$1;
.super Ljava/lang/Object;
.source "PrefTheme.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefTheme$1;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefTheme$1;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefTheme$1;Landroid/widget/EditText;)V
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

    .line 212
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$1;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1$1;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 214
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1$1;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->deleteSpecialChar(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    .line 215
    const-string p2, ""

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    return-void

    .line 216
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getThemeId(Ljava/lang/String;)I

    move-result p2

    const/4 v0, -0x1

    if-eq p2, v0, :cond_1

    .line 217
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$1;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefTheme$1;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefTheme;->res:Landroid/content/Context;

    invoke-direct {p1, p2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$1;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefTheme$1;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    .line 218
    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->theme_exists:I

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const p2, 0x104000a

    const/4 v0, 0x0

    .line 219
    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 220
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 223
    :cond_1
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$1;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefTheme$1;->val$selectedTheme:Ljava/lang/String;

    invoke-static {p2, p1}, Lcom/flyersoft/tools/A;->renameTheme(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$1$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefTheme$1;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefTheme;->adapter:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->notifyDataSetChanged()V

    return-void
.end method
