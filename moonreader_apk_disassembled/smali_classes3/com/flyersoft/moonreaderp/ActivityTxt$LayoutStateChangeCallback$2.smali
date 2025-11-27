.class Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$2;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->accept(Landroidx/window/layout/WindowLayoutInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;

.field final synthetic val$cb:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;Landroid/widget/CheckBox;)V
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

    .line 354
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$2;->val$cb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 356
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$2;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, -0x1

    .line 357
    sput p1, Lcom/flyersoft/tools/A;->askAutoDualMode:I

    :cond_0
    const/4 p1, 0x1

    .line 358
    sput-boolean p1, Lcom/flyersoft/tools/A;->auto2PageForFoldable:Z

    .line 359
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 p2, 0x0

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->foldablePhoneDialog:Lcom/flyersoft/components/MyDialog;

    .line 360
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->foldablePhoneFlat:Z

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mrestartForDualPhoneChanged(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return-void
.end method
