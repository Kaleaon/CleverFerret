.class Lcom/flyersoft/moonreaderp/PrefVisual$23$3;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual$23;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefVisual$23;

.field final synthetic val$cb:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual$23;Landroid/widget/CheckBox;)V
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

    .line 704
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$23$3;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$23;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$23$3;->val$cb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x1

    .line 707
    sput-boolean p1, Lcom/flyersoft/tools/A;->textDense:Z

    .line 708
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$23$3;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->textDensePunc:Z

    .line 709
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$23$3;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$23;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefVisual$23;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mrefreshTxtRender(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    return-void
.end method
