.class Lcom/flyersoft/moonreaderp/ActivityTxt$90;
.super Landroid/speech/tts/UtteranceProgressListener;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->setSpeakOnUtteranceComplete()V
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

    .line 10263
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Landroid/speech/tts/UtteranceProgressListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDone(Ljava/lang/String;)V
    .locals 2

    .line 10297
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputtts_utteranceId(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 10299
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 10300
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flyersoft/books/PDFReader;->delForceSel(Z)V

    .line 10301
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-nez v0, :cond_1

    goto :goto_0

    .line 10303
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_stopped:Z

    if-eqz v0, :cond_2

    goto :goto_0

    .line 10306
    :cond_2
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetspeakLines(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_3

    .line 10307
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->doAfterAllUtteranceFinished()V

    :cond_3
    :goto_0
    return-void
.end method

.method public onError(Ljava/lang/String;)V
    .locals 2

    .line 10312
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "###TTS ERROR### id: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method

.method public onStart(Ljava/lang/String;)V
    .locals 5

    .line 10266
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 10267
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetspeakLines(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    goto/16 :goto_0

    .line 10269
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetspeakLines(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/A$TtsLine;

    .line 10270
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "tts_onStart id: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetspeakLines(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " chapter: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p1, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "\n##"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, v0, Lcom/flyersoft/tools/A$TtsLine;->s:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "##"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 10272
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v0, Lcom/flyersoft/tools/A$TtsLine;->s:Ljava/lang/String;

    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msetTTSNotificationText(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V

    .line 10273
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetspeak_in_background(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 10274
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v0, Lcom/flyersoft/tools/A$TtsLine;->s:Ljava/lang/String;

    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$maddStatisticsWords(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V

    .line 10276
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result p1

    if-nez p1, :cond_4

    .line 10277
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetlastStartOfSpeakText(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v1

    iget v3, v0, Lcom/flyersoft/tools/A$TtsLine;->start:I

    add-int/2addr v1, v3

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetlastStartOfSpeakText(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v3

    iget v4, v0, Lcom/flyersoft/tools/A$TtsLine;->end:I

    add-int/2addr v3, v4

    invoke-static {p1, v1, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mhighlightText(Lcom/flyersoft/moonreaderp/ActivityTxt;II)V

    .line 10278
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPaused:Z

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetspeak_in_background(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget p1, p1, Lcom/flyersoft/staticlayout/MRTextView;->hStart:I

    if-ltz p1, :cond_2

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 10279
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mconfirmSpeakHighlightInScreen(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 10280
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPaused:Z

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetspeak_in_background(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 10281
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-string v1, "positions10"

    invoke-virtual {p1, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    sget-object v1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v3, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v3, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "#"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetlastStartOfSpeakText(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v3

    iget v0, v0, Lcom/flyersoft/tools/A$TtsLine;->start:I

    add-int/2addr v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ":"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 10283
    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgetPercentStr2(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 10281
    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 10283
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_3
    :goto_0
    return-void

    .line 10285
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v1, v0, Lcom/flyersoft/tools/A$TtsLine;->start:I

    iget v0, v0, Lcom/flyersoft/tools/A$TtsLine;->end:I

    invoke-static {p1, v1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpdfSetForceSel(Lcom/flyersoft/moonreaderp/ActivityTxt;II)V

    .line 10286
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityTxt$90$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$90$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$90;)V

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
