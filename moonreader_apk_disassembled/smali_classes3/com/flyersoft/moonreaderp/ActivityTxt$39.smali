.class Lcom/flyersoft/moonreaderp/ActivityTxt$39;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showMiscOptions(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$bionic:Z

.field final synthetic val$bluelightEnable:Z

.field final synthetic val$bluelightOpacity:I

.field final synthetic val$disableCSS:Ljava/lang/String;

.field final synthetic val$dualpage:Z

.field final synthetic val$epubPageNum:Z

.field final synthetic val$fitImageToScreen:Z

.field final synthetic val$footnoteOnBottom:Z

.field final synthetic val$fullscreenWithStatus:Z

.field final synthetic val$headsetKey:I

.field final synthetic val$imageWhiteTransparent:Z

.field final synthetic val$indentLength:I

.field final synthetic val$indentParagraph:Z

.field final synthetic val$openBookAnim:Z

.field final synthetic val$preBright:Z

.field final synthetic val$preFitCutout:I

.field final synthetic val$preFullScreen:Z

.field final synthetic val$showStatusbar:Z

.field final synthetic val$statusBarOnTop:Z

.field final synthetic val$statusUnderNotch:Z

.field final synthetic val$sysDarkModeFollow:Z

.field final synthetic val$tilt_turn_page:Z

.field final synthetic val$topBlank:Z

.field final synthetic val$trimBlank:Z

.field final synthetic val$useCssFont:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;ZIZIZZZZZZZZZZZIZZZZLjava/lang/String;ZZIZ)V
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
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
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
            null,
            null,
            null,
            null,
            null,
            null,
            null,
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

    .line 3117
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$openBookAnim:Z

    iput p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$headsetKey:I

    iput-boolean p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$fullscreenWithStatus:Z

    iput p5, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$preFitCutout:I

    iput-boolean p6, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$statusBarOnTop:Z

    iput-boolean p7, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$statusUnderNotch:Z

    iput-boolean p8, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$preFullScreen:Z

    iput-boolean p9, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$showStatusbar:Z

    iput-boolean p10, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$bionic:Z

    iput-boolean p11, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$epubPageNum:Z

    iput-boolean p12, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$preBright:Z

    iput-boolean p13, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$dualpage:Z

    iput-boolean p14, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$trimBlank:Z

    iput-boolean p15, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$topBlank:Z

    move/from16 p1, p16

    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$indentParagraph:Z

    move/from16 p1, p17

    iput p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$indentLength:I

    move/from16 p1, p18

    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$fitImageToScreen:Z

    move/from16 p1, p19

    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$imageWhiteTransparent:Z

    move/from16 p1, p20

    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$useCssFont:Z

    move/from16 p1, p21

    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$footnoteOnBottom:Z

    move-object/from16 p1, p22

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$disableCSS:Ljava/lang/String;

    move/from16 p1, p23

    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$tilt_turn_page:Z

    move/from16 p1, p24

    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$bluelightEnable:Z

    move/from16 p1, p25

    iput p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$bluelightOpacity:I

    move/from16 p1, p26

    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$sysDarkModeFollow:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 5

    .line 3119
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v0, 0x320

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restoreScrollToTopBug(I)V

    .line 3120
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$openBookAnim:Z

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mopenBookAnim(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v0

    if-eq p1, v0, :cond_0

    .line 3121
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderToTxt()V

    return-void

    .line 3124
    :cond_0
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$headsetKey:I

    const/16 v0, 0xf

    if-ne p1, v0, :cond_1

    sget p1, Lcom/flyersoft/tools/A;->doHeadsetKey:I

    if-eq p1, v0, :cond_1

    .line 3125
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void

    .line 3128
    :cond_1
    sget-boolean p1, Lcom/flyersoft/tools/A;->fullscreen:Z

    if-eqz p1, :cond_3

    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$fullscreenWithStatus:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->fullscreenWithStatus:Z

    if-ne p1, v0, :cond_2

    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$preFitCutout:I

    sget v0, Lcom/flyersoft/tools/A;->fitCutout:I

    if-eq p1, v0, :cond_3

    .line 3129
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void

    .line 3132
    :cond_3
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$statusBarOnTop:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    if-ne p1, v0, :cond_1d

    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$statusUnderNotch:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->statusUnderNotch:Z

    if-eq p1, v0, :cond_4

    goto/16 :goto_8

    .line 3136
    :cond_4
    sget-boolean p1, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusBarUpdated:Z

    if-eqz p1, :cond_5

    sget-boolean p1, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    if-nez p1, :cond_1c

    :cond_5
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$preFullScreen:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->fullscreen:Z

    if-ne p1, v0, :cond_1c

    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$showStatusbar:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->showStatusbar:Z

    if-eq p1, v0, :cond_6

    goto/16 :goto_7

    .line 3141
    :cond_6
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$bionic:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->bionic:Z

    if-ne p1, v0, :cond_1b

    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$epubPageNum:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->epubPageNum:Z

    if-eq p1, v0, :cond_7

    goto/16 :goto_6

    :cond_7
    const/4 p1, 0x1

    .line 3145
    invoke-static {p1}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Z)V

    .line 3147
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$preBright:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->adjustBrightness:Z

    const/4 v2, 0x0

    if-eq v0, v1, :cond_9

    .line 3148
    sget-boolean v0, Lcom/flyersoft/tools/A;->adjustBrightness:Z

    if-eqz v0, :cond_8

    .line 3149
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v1, Lcom/flyersoft/tools/A;->brightnessValue:I

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setScreenBrightness(IZ)V

    goto :goto_0

    .line 3151
    :cond_8
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v1, -0x64

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setScreenBrightness(IZ)V

    .line 3154
    :cond_9
    :goto_0
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$dualpage:Z

    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageFitScreen()Z

    move-result v1

    if-eq v0, v1, :cond_a

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result v0

    if-nez v0, :cond_a

    .line 3155
    sput-boolean p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->justEnabledDualPage:Z

    .line 3156
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void

    .line 3158
    :cond_a
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$trimBlank:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->trimBlankSpace:Z

    if-ne v0, v1, :cond_11

    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$topBlank:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->trimTopSpace:Z

    if-ne v0, v1, :cond_11

    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$indentParagraph:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->indentParagraph:Z

    if-ne v0, v1, :cond_11

    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$indentLength:I

    sget v1, Lcom/flyersoft/tools/A;->indentLength:I

    if-ne v0, v1, :cond_11

    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$fitImageToScreen:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->fitImageToScreen:Z

    if-ne v0, v1, :cond_11

    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$imageWhiteTransparent:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->imageWhiteTransparent:Z

    if-eq v0, v1, :cond_b

    goto/16 :goto_3

    .line 3169
    :cond_b
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v1, Lcom/flyersoft/tools/A;->disableCSS:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/flyersoft/tools/A;->cssFontStyle:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/flyersoft/tools/A;->cssFontColor:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/flyersoft/tools/A;->cssFontSize:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/flyersoft/tools/A;->cssAlignment:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/flyersoft/tools/A;->cssJustify:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/flyersoft/tools/A;->cssIndent:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/flyersoft/tools/A;->cssLineSpace:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/flyersoft/tools/A;->cssOthers:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3171
    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$useCssFont:Z

    sget-boolean v3, Lcom/flyersoft/tools/A;->useCssFont:Z

    if-ne v1, v3, :cond_d

    sget-boolean v1, Lcom/flyersoft/tools/A;->useCssFont:Z

    if-eqz v1, :cond_c

    sget-boolean v1, Lcom/flyersoft/moonreaderp/PrefFontPick;->epubIgnoreFontChanged:Z

    if-eqz v1, :cond_c

    goto :goto_1

    :cond_c
    const/4 v1, 0x0

    goto :goto_2

    :cond_d
    :goto_1
    const/4 v1, 0x1

    .line 3173
    :goto_2
    iget-boolean v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$footnoteOnBottom:Z

    sget-boolean v4, Lcom/flyersoft/tools/A;->footnoteInChapterText:Z

    if-ne v3, v4, :cond_e

    if-nez v1, :cond_e

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$disableCSS:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    :cond_e
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 3174
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result v0

    const/16 v3, 0x64

    if-eq v0, v3, :cond_f

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result v0

    if-ne v0, p1, :cond_13

    :cond_f
    if-eqz v1, :cond_10

    .line 3176
    invoke-static {}, Lcom/flyersoft/staticlayout/MyHtml;->initFamilyFontParams()V

    .line 3177
    sput-boolean v2, Lcom/flyersoft/moonreaderp/PrefFontPick;->epubIgnoreFontChanged:Z

    .line 3178
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void

    .line 3181
    :cond_10
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-object v1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcreateProgressDlg(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V

    .line 3182
    invoke-static {}, Lcom/flyersoft/tools/A;->clearEBook()V

    .line 3183
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mreloadBook(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto :goto_4

    .line 3160
    :cond_11
    :goto_3
    invoke-static {}, Lcom/flyersoft/tools/A;->resetHighlights()V

    .line 3161
    invoke-static {}, Lcom/flyersoft/tools/A;->clearTxts2()V

    .line 3162
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mclearpreNextCache(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 3163
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$trimBlank:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->trimBlankSpace:Z

    if-ne v0, v1, :cond_1a

    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$topBlank:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->trimTopSpace:Z

    if-eq v0, v1, :cond_12

    goto :goto_5

    .line 3167
    :cond_12
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mreloadBook(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 3187
    :cond_13
    :goto_4
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$tilt_turn_page:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->tilt_turn_page:Z

    if-eq v0, v1, :cond_16

    .line 3188
    sget-boolean v0, Lcom/flyersoft/tools/A;->tilt_turn_page:Z

    if-eqz v0, :cond_14

    .line 3189
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputaskedForTilt(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 3190
    :cond_14
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->shakeSensorLisener:Lcom/flyersoft/components/MyShakeSensorListener;

    if-eqz v0, :cond_15

    .line 3191
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->shakeSensorLisener:Lcom/flyersoft/components/MyShakeSensorListener;

    sget-boolean v1, Lcom/flyersoft/tools/A;->tilt_turn_page:Z

    iput-boolean v1, v0, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_turn_page:Z

    .line 3192
    :cond_15
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mregisterHardwares(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 3194
    :cond_16
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->baseFrame:Landroid/widget/FrameLayout;

    sget-boolean v1, Lcom/flyersoft/tools/A;->keepScreenAwake:Z

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setKeepScreenOn(Z)V

    .line 3195
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcheckStatusBar(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 3196
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcheckDualPageMode(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    .line 3198
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$bluelightEnable:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->bluelightEnable:Z

    if-ne v0, v1, :cond_17

    sget-boolean v0, Lcom/flyersoft/tools/A;->bluelightEnable:Z

    if-eqz v0, :cond_18

    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$bluelightOpacity:I

    sget v1, Lcom/flyersoft/tools/A;->bluelightOpacity:I

    if-eq v0, v1, :cond_18

    .line 3199
    :cond_17
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mshowShadeCoverOnView(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 3201
    :cond_18
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->val$sysDarkModeFollow:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->sysDarkModeFollow:Z

    if-eq v0, v1, :cond_19

    .line 3202
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->followSysDarkMode(Z)V

    :cond_19
    return-void

    .line 3164
    :cond_1a
    :goto_5
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void

    .line 3142
    :cond_1b
    :goto_6
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void

    .line 3138
    :cond_1c
    :goto_7
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void

    .line 3133
    :cond_1d
    :goto_8
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$39;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void
.end method
