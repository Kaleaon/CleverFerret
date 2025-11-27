.class Lcom/flyersoft/moonreaderp/PrefControl$17;
.super Ljava/lang/Object;
.source "PrefControl.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefControl;->setNineGridEvents()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefControl;

.field final synthetic val$sp1:Landroid/widget/Spinner;

.field final synthetic val$sp2:Landroid/widget/Spinner;

.field final synthetic val$sp3:Landroid/widget/Spinner;

.field final synthetic val$sp4:Landroid/widget/Spinner;

.field final synthetic val$sp5:Landroid/widget/Spinner;

.field final synthetic val$sp6:Landroid/widget/Spinner;

.field final synthetic val$sp7:Landroid/widget/Spinner;

.field final synthetic val$sp8:Landroid/widget/Spinner;

.field final synthetic val$sp9:Landroid/widget/Spinner;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
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
            null,
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

    .line 670
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp1:Landroid/widget/Spinner;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp2:Landroid/widget/Spinner;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp3:Landroid/widget/Spinner;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp4:Landroid/widget/Spinner;

    iput-object p6, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp5:Landroid/widget/Spinner;

    iput-object p7, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp6:Landroid/widget/Spinner;

    iput-object p8, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp7:Landroid/widget/Spinner;

    iput-object p9, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp8:Landroid/widget/Spinner;

    iput-object p10, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp9:Landroid/widget/Spinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    .line 673
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp1:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->do91:I

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$mgetAction(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/Spinner;I)I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->do91:I

    .line 674
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp2:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->do92:I

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$mgetAction(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/Spinner;I)I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->do92:I

    .line 675
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp3:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->do93:I

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$mgetAction(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/Spinner;I)I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->do93:I

    .line 676
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp4:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->do94:I

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$mgetAction(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/Spinner;I)I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->do94:I

    .line 677
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp5:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->do95:I

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$mgetAction(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/Spinner;I)I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->do95:I

    .line 678
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp6:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->do96:I

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$mgetAction(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/Spinner;I)I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->do96:I

    .line 679
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp7:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->do97:I

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$mgetAction(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/Spinner;I)I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->do97:I

    .line 680
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp8:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->do98:I

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$mgetAction(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/Spinner;I)I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->do98:I

    .line 681
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->val$sp9:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->do99:I

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$mgetAction(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/Spinner;I)I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->do99:I

    .line 682
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$17;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$msetNineGridText(Lcom/flyersoft/moonreaderp/PrefControl;)V

    return-void
.end method
