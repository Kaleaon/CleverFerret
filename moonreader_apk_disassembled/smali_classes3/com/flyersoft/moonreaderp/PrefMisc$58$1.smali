.class Lcom/flyersoft/moonreaderp/PrefMisc$58$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$58;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc$58;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$58;Landroid/widget/EditText;)V
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

    .line 1551
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$58$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$58;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$58$1;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    .line 1553
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$58$1;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->restoreBrightMins:I

    .line 1554
    sget p1, Lcom/flyersoft/tools/A;->restoreBrightMins:I

    const/4 p2, 0x0

    if-gez p1, :cond_0

    .line 1555
    sput p2, Lcom/flyersoft/tools/A;->restoreBrightMins:I

    .line 1556
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$58$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$58;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$58;->val$restoreCb:Landroid/widget/CheckBox;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$58$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$58;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc$58;->val$context:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->restore_brightness_after_pause:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v3, Lcom/flyersoft/tools/A;->restoreBrightMins:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v2, v3, p2

    invoke-virtual {v0, v1, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
