.class Lcom/flyersoft/moonreaderp/ActivityTxt$119;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->foropenFromUri()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$checkBox:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/widget/CheckBox;)V
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

    .line 12374
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$119;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$119;->val$checkBox:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 12376
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$119;->val$checkBox:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    sput-boolean p1, Lcom/flyersoft/tools/A;->saveFileConfirm:Z

    const/4 p1, 0x0

    .line 12377
    sput-boolean p1, Lcom/flyersoft/tools/A;->saveFileDirectly:Z

    .line 12378
    sget-object p1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 12379
    sget-object p1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->removeHistory(Ljava/lang/String;)V

    .line 12380
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->preLastFile:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 12381
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->preLastFile:Ljava/lang/String;

    sput-object p1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    .line 12382
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$119;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoFinishEvent(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void
.end method
