.class Lcom/flyersoft/moonreaderp/ActivityTxt$96;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->do_speak()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$askCheck:Landroid/widget/CheckBox;

.field final synthetic val$sp:Landroid/widget/Spinner;

.field final synthetic val$stopCheck:Landroid/widget/CheckBox;

.field final synthetic val$stopEt:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/widget/CheckBox;Landroid/widget/EditText;Landroid/widget/CheckBox;Landroid/widget/Spinner;)V
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

    .line 10653
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$96;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$96;->val$stopCheck:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$96;->val$stopEt:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$96;->val$askCheck:Landroid/widget/CheckBox;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$96;->val$sp:Landroid/widget/Spinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 10655
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$96;->val$stopCheck:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->tts_stop_enable:Z

    .line 10656
    sget p1, Lcom/flyersoft/tools/A;->tts_stop_time:I

    .line 10657
    :try_start_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$96;->val$stopEt:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10658
    :catch_0
    sput p1, Lcom/flyersoft/tools/A;->tts_stop_time:I

    .line 10659
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$96;->val$askCheck:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    sput-boolean p1, Lcom/flyersoft/tools/A;->askForTts:Z

    .line 10660
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$96;->val$sp:Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->tts_divide:I

    .line 10662
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$96;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$minitTTS(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 10663
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$96;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputttsAlertDlg(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/components/MyDialog;)V

    return-void
.end method
