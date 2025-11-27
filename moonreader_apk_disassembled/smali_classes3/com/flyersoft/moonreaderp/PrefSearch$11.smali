.class Lcom/flyersoft/moonreaderp/PrefSearch$11;
.super Ljava/lang/Object;
.source "PrefSearch.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefSearch;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

.field final synthetic val$backwardCb:Landroid/widget/CheckBox;

.field final synthetic val$caseCb:Landroid/widget/CheckBox;

.field final synthetic val$forwardCb:Landroid/widget/CheckBox;

.field final synthetic val$wholeCb:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSearch;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 657
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$11;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefSearch$11;->val$backwardCb:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefSearch$11;->val$forwardCb:Landroid/widget/CheckBox;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefSearch$11;->val$caseCb:Landroid/widget/CheckBox;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefSearch$11;->val$wholeCb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 660
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$11;->val$backwardCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->searchBackwardOnly:Z

    .line 661
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$11;->val$forwardCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->searchForwardOnly:Z

    .line 662
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$11;->val$caseCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->searchCaseSensitive:Z

    .line 663
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$11;->val$wholeCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->searchWholeWord:Z

    .line 664
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$11;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/PrefSearch;->searchB:Landroid/widget/ImageButton;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/PrefSearch;->onClick(Landroid/view/View;)V

    return-void
.end method
