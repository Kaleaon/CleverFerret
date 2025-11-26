.class Lcom/flyersoft/moonreaderp/PrefMisc$21;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/EditText;)V
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

    .line 830
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$21;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$21;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 832
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$21;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "clipboard"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/text/ClipboardManager;

    .line 833
    invoke-virtual {p1}, Landroid/text/ClipboardManager;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    .line 834
    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 835
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$21;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getSelectionStart()I

    move-result p1

    const/4 v0, 0x0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 836
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$21;->val$et:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 837
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$21;->val$et:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    move v2, v0

    move-object v0, v1

    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    const/4 v4, 0x0

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v5

    invoke-interface/range {v0 .. v5}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;II)Landroid/text/Editable;

    :cond_0
    return-void
.end method
