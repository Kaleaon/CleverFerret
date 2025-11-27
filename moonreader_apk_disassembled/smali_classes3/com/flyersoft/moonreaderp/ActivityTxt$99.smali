.class Lcom/flyersoft/moonreaderp/ActivityTxt$99;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->initTtsPanel()V
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

    .line 11041
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$99;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 2

    if-eqz p3, :cond_0

    .line 11058
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$99;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/16 v0, 0x11

    const/4 v1, 0x0

    invoke-static {p3, p2, v1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;II)V

    .line 11059
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$99;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->keepTtsPanelVisible()V

    .line 11060
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$99;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_volume:Landroid/widget/SeekBar;

    if-ne p1, p2, :cond_0

    .line 11061
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$99;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-string p3, "audio"

    invoke-virtual {p2, p3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/media/AudioManager;

    const/4 p3, 0x3

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    invoke-virtual {p2, p3, p1, v1}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 11062
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$99;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mshow_tts_return_buttons(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1

    .line 11043
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$99;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_speed:Landroid/widget/SeekBar;

    if-eq p1, v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$99;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_pitch:Landroid/widget/SeekBar;

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    return-void

    .line 11044
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$99;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_speed:Landroid/widget/SeekBar;

    if-ne p1, v0, :cond_2

    .line 11045
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->tts_speed:I

    .line 11046
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$99;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_pitch:Landroid/widget/SeekBar;

    if-ne p1, v0, :cond_3

    .line 11047
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->tts_pitch:I

    .line 11048
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$99;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mrestore_speak(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 11049
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$99;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mshow_tts_return_buttons(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void
.end method
