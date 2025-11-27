.class Lcom/flyersoft/moonreaderp/ActivityTxt$105;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showTTSMoreOptions(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;Z)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$root:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 11332
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$105;->val$root:Landroid/view/View;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$105;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$105;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 11335
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$105;->val$root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->pmTtsDivides:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->tts_divide:I

    .line 11336
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$105;->val$root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->pmSpeakConfirm:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->askForTts:Z

    .line 11337
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$105;->val$root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->tts_stop_check:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->tts_stop_enable:Z

    .line 11338
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$105;->val$root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->tts_interval_check:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->tts_interval_enable:Z

    .line 11340
    :try_start_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$105;->val$root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->tts_stop_time:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->tts_stop_time:I

    .line 11341
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$105;->val$root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->tts_interval_time:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->tts_interval_time:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 11343
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 11345
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$105;->val$root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->pmSpeakBackground:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->disableAudioFocus:Z

    .line 11347
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$105;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-eqz p1, :cond_1

    const/4 p2, 0x0

    .line 11348
    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->stop_speak(Z)V

    .line 11349
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$105;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dualPageEnabledWithoutState()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 11350
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$105;->val$context:Landroid/content/Context;

    sget p2, Lcom/flyersoft/moonreaderp/R$string;->restart_manually:I

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 11352
    :cond_0
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance p2, Lcom/flyersoft/moonreaderp/ActivityTxt$105$1;

    invoke-direct {p2, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$105$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$105;)V

    const-wide/16 v0, 0x1f4

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    :goto_1
    return-void
.end method
