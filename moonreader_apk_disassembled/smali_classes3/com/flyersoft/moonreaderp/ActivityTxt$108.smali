.class Lcom/flyersoft/moonreaderp/ActivityTxt$108;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->do_AutoScrollAsk()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$checkBox:Landroid/widget/CheckBox;

.field final synthetic val$sb:Landroid/widget/SeekBar;

.field final synthetic val$sp:Landroid/widget/Spinner;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/widget/CheckBox;Landroid/widget/Spinner;Landroid/widget/SeekBar;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 11706
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$108;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$108;->val$checkBox:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$108;->val$sp:Landroid/widget/Spinner;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$108;->val$sb:Landroid/widget/SeekBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 11708
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$108;->val$checkBox:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    const/4 p2, 0x1

    xor-int/2addr p1, p2

    sput-boolean p1, Lcom/flyersoft/tools/A;->askForScrollEvent:Z

    .line 11709
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$108;->val$sp:Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    .line 11710
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$108;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result v0

    if-eqz v0, :cond_2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    if-ne p1, p2, :cond_1

    const/4 p1, 0x4

    goto :goto_0

    :cond_1
    const/4 p1, 0x5

    .line 11711
    :goto_0
    sput p1, Lcom/flyersoft/tools/A;->autoScrollMode:I

    goto :goto_1

    .line 11713
    :cond_2
    sput p1, Lcom/flyersoft/tools/A;->autoScrollMode:I

    .line 11714
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$108;->val$sb:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    rsub-int/lit8 p1, p1, 0x64

    sput p1, Lcom/flyersoft/tools/A;->autoScrollSpeed:I

    .line 11715
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$108;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_AutoScroll(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return-void
.end method
