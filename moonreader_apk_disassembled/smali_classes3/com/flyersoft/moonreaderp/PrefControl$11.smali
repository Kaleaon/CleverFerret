.class Lcom/flyersoft/moonreaderp/PrefControl$11;
.super Ljava/lang/Object;
.source "PrefControl.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefControl;->showKecodeMapping()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefControl;

.field final synthetic val$ktv:Landroid/widget/TextView;

.field final synthetic val$sp:Landroid/widget/Spinner;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/TextView;Landroid/widget/Spinner;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 476
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$11;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefControl$11;->val$ktv:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefControl$11;->val$sp:Landroid/widget/Spinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 479
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$11;->val$ktv:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 480
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$11;->val$ktv:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefControl$11;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl$11;->val$sp:Landroid/widget/Spinner;

    const/16 v1, 0xf

    invoke-static {p2, v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$mgetAction(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/widget/Spinner;I)I

    move-result p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/A;->saveKeycodeEvent(II)V

    .line 481
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$11;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$mcreateKeycodeListView(Lcom/flyersoft/moonreaderp/PrefControl;)V

    :cond_0
    return-void
.end method
