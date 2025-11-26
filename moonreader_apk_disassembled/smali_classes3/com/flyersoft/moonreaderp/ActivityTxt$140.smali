.class Lcom/flyersoft/moonreaderp/ActivityTxt$140;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->getReceiveHandler()Landroid/os/Handler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 14056
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    .line 14059
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    .line 14060
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "received key:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", msg.waht:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 14062
    iget v1, p1, Landroid/os/Message;->what:I

    if-ne v1, v2, :cond_c

    .line 14063
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x4f

    if-eq v1, v2, :cond_8

    const/16 v2, 0x55

    if-eq v1, v2, :cond_4

    const/16 v2, 0x57

    if-eq v1, v2, :cond_2

    const/16 v2, 0x58

    if-eq v1, v2, :cond_0

    const/16 v2, 0x7e

    if-eq v1, v2, :cond_8

    const/16 v2, 0x7f

    if-eq v1, v2, :cond_4

    goto/16 :goto_0

    .line 14097
    :cond_0
    sget-boolean v1, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-eqz v1, :cond_1

    .line 14098
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_prior:Landroid/view/View;

    invoke-virtual {v1, v2, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_tts_buttons(Landroid/view/View;Z)V

    goto/16 :goto_0

    .line 14100
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v2, Lcom/flyersoft/tools/A;->doMediaPlayPrevious:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->doEvent2(I)Z

    goto/16 :goto_0

    .line 14090
    :cond_2
    sget-boolean v1, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-eqz v1, :cond_3

    .line 14091
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_next:Landroid/view/View;

    invoke-virtual {v1, v2, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_tts_buttons(Landroid/view/View;Z)V

    goto/16 :goto_0

    .line 14093
    :cond_3
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v2, Lcom/flyersoft/tools/A;->doMediaPlayNext:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->doEvent2(I)Z

    goto :goto_0

    .line 14078
    :cond_4
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mheadsetPauseForSpeaking(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 14079
    sget-boolean v1, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-eqz v1, :cond_6

    .line 14080
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_panel_visible:Z

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_paused:Z

    if-eqz v1, :cond_5

    .line 14081
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mshowTtsPanel(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 14082
    :cond_5
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_play:Landroid/view/View;

    invoke-virtual {v1, v2, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_tts_buttons(Landroid/view/View;Z)V

    goto :goto_0

    .line 14084
    :cond_6
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_speak(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto :goto_0

    .line 14086
    :cond_7
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v2, Lcom/flyersoft/tools/A;->doMediaPlayPause:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->doEvent2(I)Z

    goto :goto_0

    .line 14066
    :cond_8
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mheadsetForSpeaking(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 14067
    sget-boolean v1, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-eqz v1, :cond_a

    .line 14068
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_panel_visible:Z

    if-eqz v1, :cond_9

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_paused:Z

    if-eqz v1, :cond_9

    .line 14069
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mshowTtsPanel(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 14070
    :cond_9
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_play:Landroid/view/View;

    invoke-virtual {v1, v2, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_tts_buttons(Landroid/view/View;Z)V

    goto :goto_0

    .line 14072
    :cond_a
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_speak(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto :goto_0

    .line 14074
    :cond_b
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v2, Lcom/flyersoft/tools/A;->doHeadsetKey:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->doEvent2(I)Z

    .line 14105
    :cond_c
    :goto_0
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    if-ne p1, v1, :cond_e

    .line 14106
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-nez p1, :cond_e

    .line 14107
    sget-boolean p1, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-eqz p1, :cond_e

    .line 14108
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->stopTtsFromCalling:I

    if-ne p1, v1, :cond_d

    .line 14109
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput v4, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->stopTtsFromCalling:I

    return-void

    .line 14110
    :cond_d
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetttsStartTime(Lcom/flyersoft/moonreaderp/ActivityTxt;)J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0xbb8

    cmp-long p1, v0, v2

    if-lez p1, :cond_e

    .line 14111
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-wide v4, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->resumeTime:J

    sub-long/2addr v0, v4

    cmp-long p1, v0, v2

    if-lez p1, :cond_e

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-wide v2, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pausedTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x7d0

    cmp-long p1, v0, v2

    if-lez p1, :cond_e

    .line 14112
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->stop_speak()V

    :cond_e
    return-void
.end method
