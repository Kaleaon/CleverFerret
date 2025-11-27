.class Lcom/flyersoft/moonreaderp/ActivityTxt$189;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->doSpeakLongTap(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 18457
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$189;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 4

    .line 18459
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$189;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mkill_tts(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    .line 18461
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$189;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-string v0, "clipboard"

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/text/ClipboardManager;

    .line 18462
    invoke-virtual {p1}, Landroid/text/ClipboardManager;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    .line 18463
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 18464
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$189;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputttsTextFromClipboard(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V

    .line 18465
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$189;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$minitTTS(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    :cond_0
    return-void

    .line 18468
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$189;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v2, 0x1

    if-nez p1, :cond_2

    const/4 v3, 0x1

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    :goto_0
    invoke-static {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputforce_tts_not_stop(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 18469
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$189;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-ne p1, v2, :cond_3

    const/4 v1, 0x1

    :cond_3
    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputforce_tts_stop(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 18470
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$189;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$minitTTS(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void
.end method
