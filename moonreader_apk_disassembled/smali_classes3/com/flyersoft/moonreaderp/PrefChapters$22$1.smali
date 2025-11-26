.class Lcom/flyersoft/moonreaderp/PrefChapters$22$1;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters$22;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters$22;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$22;Landroid/widget/EditText;)V
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

    .line 2051
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$22$1;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$22;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$22$1;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 2053
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$22$1;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 2054
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$22$1;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$22;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefChapters$22;->val$content:Ljava/lang/CharSequence;

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 2055
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$22$1;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$22;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefChapters$22;->val$context:Landroid/content/Context;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$22$1;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$22;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$22;->val$context:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->export_success:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 2057
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$22$1;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$22;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$22;->val$context:Landroid/content/Context;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$22$1;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$22;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefChapters$22;->val$context:Landroid/content/Context;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->export_failed:I

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void
.end method
