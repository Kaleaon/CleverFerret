.class Lcom/flyersoft/moonreaderp/ActivityTxt$7;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field waitTransCount:I


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

    .line 1125
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    const/4 p1, 0x0

    .line 1523
    iput p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->waitTransCount:I

    return-void
.end method

.method private waitActTransFinish(Landroid/os/Message;)Z
    .locals 5

    .line 1526
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mopenBookAnim(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->hasActTrans:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->isSplitScreen(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_2

    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->waitTransCount:I

    const/16 v2, 0xf

    if-ge v0, v2, :cond_2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->actTransArrive:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->actTransEnd:Z

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->baseFrame:Landroid/widget/FrameLayout;

    .line 1527
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v0

    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenWidth()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 1528
    :cond_1
    invoke-static {p1}, Landroid/os/Message;->obtain(Landroid/os/Message;)Landroid/os/Message;

    move-result-object p1

    .line 1529
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "-waitActTransFinish, re_send: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", baseFrame: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->baseFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", system: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenWidth()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    aput-object v0, v3, v1

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 1531
    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->waitTransCount:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->waitTransCount:I

    .line 1532
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const-wide/16 v3, 0x32

    invoke-virtual {v0, p1, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    const/4 v1, 0x1

    .line 1534
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    xor-int/lit8 v0, v1, 0x1

    iput-boolean v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->openAnimatDone:Z

    return v1
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 19

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    .line 1127
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isFinishing()Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_4

    .line 1129
    :cond_0
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msetStatusBarHeight(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 1131
    iget v2, v0, Landroid/os/Message;->what:I

    const/16 v3, 0x3dc

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    if-ne v2, v3, :cond_1

    .line 1132
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-wide v4, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->lastCheckProgressTime:J

    .line 1133
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showReadProgress(I)V

    return-void

    .line 1136
    :cond_1
    iget v2, v0, Landroid/os/Message;->what:I

    const/16 v3, 0x3db

    if-ne v2, v3, :cond_2

    .line 1137
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mresetTotalPageCount(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void

    .line 1140
    :cond_2
    iget v2, v0, Landroid/os/Message;->what:I

    const/16 v3, 0x3da

    if-ne v2, v3, :cond_3

    .line 1141
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mshowUnKnownTotalPages(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void

    .line 1144
    :cond_3
    iget v2, v0, Landroid/os/Message;->what:I

    const/16 v3, 0x3d9

    if-ne v2, v3, :cond_4

    .line 1145
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcheckIfLookupWordAutomatically(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void

    .line 1148
    :cond_4
    iget v2, v0, Landroid/os/Message;->what:I

    const/16 v3, 0x3ce

    const/4 v7, 0x1

    if-ne v2, v3, :cond_5

    .line 1149
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideProgressDlg()V

    .line 1150
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v7}, Lcom/flyersoft/moonreaderp/ActivityTxt;->saveLastPostion(Z)V

    .line 1151
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mreloadBook(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void

    .line 1154
    :cond_5
    iget v2, v0, Landroid/os/Message;->what:I

    const/16 v3, 0x3cf

    if-ne v2, v3, :cond_6

    .line 1155
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideProgressDlg()V

    .line 1156
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v2, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 1159
    :cond_6
    iget v2, v0, Landroid/os/Message;->what:I

    const/16 v3, 0x3c0

    if-ne v2, v3, :cond_7

    .line 1160
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoFinish(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void

    .line 1163
    :cond_7
    iget v2, v0, Landroid/os/Message;->what:I

    const/16 v3, 0x3c1

    if-ne v2, v3, :cond_9

    .line 1164
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget v0, v0, Landroid/os/Message;->arg1:I

    if-ne v0, v7, :cond_8

    const/4 v6, 0x1

    :cond_8
    invoke-static {v2, v3, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$merror_and_exit(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;Z)V

    return-void

    .line 1169
    :cond_9
    :try_start_0
    iget v2, v0, Landroid/os/Message;->what:I

    const-wide/16 v8, 0x1f4

    const-wide/16 v10, 0x32

    const/4 v3, -0x1

    const/16 v12, 0x64

    const/4 v13, 0x0

    sparse-switch v2, :sswitch_data_0

    goto/16 :goto_4

    .line 1380
    :sswitch_0
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mendCachingShot(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto/16 :goto_4

    .line 1376
    :sswitch_1
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcreateCachePageShots2(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto/16 :goto_4

    .line 1372
    :sswitch_2
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcreateCachePageShots(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    goto/16 :goto_4

    .line 1350
    :sswitch_3
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_a

    goto/16 :goto_4

    .line 1352
    :cond_a
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mupdateBarTime(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto/16 :goto_4

    .line 1216
    :sswitch_4
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hide_ebook_cover()Z

    goto/16 :goto_4

    .line 1512
    :sswitch_5
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetprogressDlg(Lcom/flyersoft/moonreaderp/ActivityTxt;)Landroid/app/Dialog;

    move-result-object v2

    if-eqz v2, :cond_34

    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetprogressDlg(Lcom/flyersoft/moonreaderp/ActivityTxt;)Landroid/app/Dialog;

    move-result-object v2

    instance-of v2, v2, Landroid/app/ProgressDialog;

    if-eqz v2, :cond_34

    .line 1513
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetprogressDlg(Lcom/flyersoft/moonreaderp/ActivityTxt;)Landroid/app/Dialog;

    move-result-object v2

    check-cast v2, Landroid/app/ProgressDialog;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->loading:I

    invoke-virtual {v4, v5}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v0, Landroid/os/Message;->arg1:I

    mul-int/lit8 v4, v4, 0x64

    iget v0, v0, Landroid/os/Message;->arg2:I

    div-int/2addr v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "%"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .line 1508
    :sswitch_6
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->doPostInvalidate()V

    goto/16 :goto_4

    .line 1501
    :sswitch_7
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpdfLoadLastPositionHandler(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 1502
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const-wide/16 v2, 0xc8

    const/16 v4, 0x3d6

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1503
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v4, v8, v9}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1504
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_4

    .line 1497
    :sswitch_8
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mifShowFullAdOnResume(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    goto/16 :goto_4

    .line 1493
    :sswitch_9
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoValueAnimationEnd(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto/16 :goto_4

    .line 1489
    :sswitch_a
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mhideTxtCacheHandler(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto/16 :goto_4

    .line 1485
    :sswitch_b
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msimulatePdfTouchEvent(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/os/Message;)V

    goto/16 :goto_4

    .line 1481
    :sswitch_c
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    goto/16 :goto_4

    .line 1477
    :sswitch_d
    invoke-static {v6}, Ljava/lang/System;->exit(I)V

    goto/16 :goto_4

    .line 1473
    :sswitch_e
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcreateNextChapterCurlCache2(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto/16 :goto_4

    .line 1469
    :sswitch_f
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcreateNextChapterCurlCache(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto/16 :goto_4

    .line 1465
    :sswitch_10
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_book_info_count_done(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto/16 :goto_4

    .line 1460
    :sswitch_11
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mshowShadeCoverOnView(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 1461
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->bluelight_filter_enabled:I

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v6}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    goto/16 :goto_4

    .line 1456
    :sswitch_12
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mupdateForFitHardwareAccelerate(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    goto/16 :goto_4

    .line 1452
    :sswitch_13
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->eraseGPUShadow(I)V

    goto/16 :goto_4

    .line 1407
    :sswitch_14
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->checkBottomHalfLineHandler()V

    .line 1408
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->contentLay:Lcom/flyersoft/views/ContentLay;

    invoke-virtual {v0}, Lcom/flyersoft/views/ContentLay;->postInvalidate()V

    goto/16 :goto_4

    .line 1400
    :sswitch_15
    sget-object v0, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    invoke-static {v0, v6}, Lcom/flyersoft/tools/A;->setTxtScrollPadding(Landroid/widget/ScrollView;Z)V

    .line 1401
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dualPageEnabled()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 1402
    sget-object v0, Lcom/flyersoft/tools/A;->txtScroll2:Landroid/widget/ScrollView;

    invoke-static {v0, v6}, Lcom/flyersoft/tools/A;->setTxtScrollPadding(Landroid/widget/ScrollView;Z)V

    .line 1403
    :cond_b
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->contentLay:Lcom/flyersoft/views/ContentLay;

    invoke-virtual {v0}, Lcom/flyersoft/views/ContentLay;->postInvalidate()V

    goto/16 :goto_4

    .line 1396
    :sswitch_16
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msetFontSizeHandler(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto/16 :goto_4

    .line 1392
    :sswitch_17
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v0, v0, Landroid/os/Message;->arg1:I

    invoke-static {v2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtScrollNoDelay(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    goto/16 :goto_4

    .line 1444
    :sswitch_18
    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenHeight2()I

    move-result v2

    iget-object v3, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->baseFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v3

    if-gt v2, v3, :cond_c

    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenHeight2()I

    move-result v2

    iget-object v3, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->baseFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v3

    if-le v2, v3, :cond_d

    :cond_c
    const/4 v6, 0x1

    :cond_d
    if-nez v6, :cond_e

    .line 1446
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msetTxtView2Visible(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    :cond_e
    if-nez v6, :cond_f

    .line 1447
    iget v0, v0, Landroid/os/Message;->arg1:I

    if-eq v0, v7, :cond_34

    .line 1448
    :cond_f
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const/16 v3, 0x3b6

    invoke-virtual {v2, v3, v7, v7}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v2

    if-eqz v6, :cond_10

    goto :goto_0

    :cond_10
    const-wide/16 v8, 0x64

    :goto_0
    invoke-virtual {v0, v2, v8, v9}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto/16 :goto_4

    .line 1439
    :sswitch_19
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetrestart_after_sync_finish(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 1440
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v12, v7, v10, v11}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mrestartWhenLowMemory(Lcom/flyersoft/moonreaderp/ActivityTxt;IZJ)Z

    goto/16 :goto_4

    .line 1429
    :sswitch_1a
    new-instance v2, Lcom/flyersoft/components/MyDialog;

    iget-object v3, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {v2, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object v3, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v3, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v0}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const v2, 0x104000a

    .line 1430
    invoke-virtual {v0, v2, v13}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/ActivityTxt$7$1;

    invoke-direct {v2, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt$7$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$7;)V

    const/high16 v3, 0x1040000

    .line 1431
    invoke-virtual {v0, v3, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 1435
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    goto/16 :goto_4

    .line 1424
    :sswitch_1b
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgetSpeakText(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputspeakLines(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/util/ArrayList;)V

    .line 1425
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msetSpeakQueue(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    goto/16 :goto_4

    .line 1419
    :sswitch_1c
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const/16 v2, 0x38e

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 1420
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpreNextChapter(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    goto/16 :goto_4

    .line 1412
    :sswitch_1d
    sget-boolean v0, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-eqz v0, :cond_11

    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$misEndOfBook(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 1413
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->stop_speak()V

    goto/16 :goto_4

    .line 1415
    :cond_11
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pageDownToNextChapter()V

    goto/16 :goto_4

    .line 1388
    :sswitch_1e
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pageDirection:I

    if-ne v2, v7, :cond_12

    const/4 v6, 0x1

    :cond_12
    invoke-virtual {v0, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showPageAnimation(Z)V

    goto/16 :goto_4

    .line 1384
    :sswitch_1f
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v0, v0, Landroid/os/Message;->arg1:I

    iget-object v3, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->hMotionEvent:Landroid/view/MotionEvent;

    invoke-static {v2, v0, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcreateCurlMsg(Lcom/flyersoft/moonreaderp/ActivityTxt;ILandroid/view/MotionEvent;)Landroid/os/Message;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mhandleCurlMessage(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/os/Message;)V

    goto/16 :goto_4

    .line 1365
    :sswitch_20
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mneedPreCurl(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 1366
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v6, v13}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mget3dCurlShot(Lcom/flyersoft/moonreaderp/ActivityTxt;ZLcom/flyersoft/tools/T$OnResult;)Z

    goto/16 :goto_4

    .line 1368
    :cond_13
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgetValueShot(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)Z

    goto/16 :goto_4

    .line 1340
    :sswitch_21
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_14

    goto/16 :goto_4

    .line 1342
    :cond_14
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcheckRemindEvent(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    .line 1343
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcheckTiltEvent(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 1344
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->checkScreenAwake()V

    .line 1345
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const/16 v2, 0x386

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 1346
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const-wide/16 v3, 0x7530

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_4

    .line 1336
    :sswitch_22
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v4, v0, Landroid/os/Message;->arg1:I

    iget v0, v0, Landroid/os/Message;->arg1:I

    if-ne v0, v3, :cond_15

    const/4 v6, 0x1

    :cond_15
    invoke-virtual {v2, v4, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->refresh_ebook_remaining_time(IZ)V

    goto/16 :goto_4

    .line 1360
    :sswitch_23
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$minitCurl3d(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 1361
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const/16 v2, 0x352

    invoke-virtual {v0, v2, v10, v11}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_4

    .line 1356
    :sswitch_24
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$minitCurl3dRender(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto/16 :goto_4

    .line 1323
    :sswitch_25
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showHintForCloudPositionSync()V

    goto/16 :goto_4

    .line 1319
    :sswitch_26
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->setLanguage(Landroid/content/Context;)V

    goto/16 :goto_4

    .line 1311
    :sswitch_27
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const/16 v3, 0x1f6

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 1312
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->footnoteLongTimeTapEvent:Z

    if-eqz v2, :cond_34

    .line 1313
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean v6, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->footnoteLongTimeTapEvent:Z

    .line 1314
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->copyFootnoteToClipboard(Landroid/os/Message;)V

    goto/16 :goto_4

    .line 1301
    :sswitch_28
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputlongTimeTapEventSent(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 1302
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->longTimeTapEvent:Z

    if-eqz v0, :cond_34

    .line 1303
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean v6, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->longTimeTapEvent:Z

    .line 1304
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPaused:Z

    if-nez v0, :cond_34

    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->hMotionEvent:Landroid/view/MotionEvent;

    invoke-static {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mstopLongTap(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_34

    .line 1305
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v7}, Lcom/flyersoft/moonreaderp/ActivityTxt;->doLongTimeTapEvent(Z)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 1306
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->longTapTime:J

    goto/16 :goto_4

    .line 1297
    :sswitch_29
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_autoscroll_message(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto/16 :goto_4

    .line 1235
    :sswitch_2a
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->inExiting:Z

    if-eqz v2, :cond_16

    goto/16 :goto_4

    .line 1238
    :cond_16
    invoke-direct/range {p0 .. p1}, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->waitActTransFinish(Landroid/os/Message;)Z

    move-result v2

    if-eqz v2, :cond_17

    goto/16 :goto_4

    .line 1240
    :cond_17
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v2, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->initClickTip(Z)Z

    move-result v2

    .line 1242
    iget-object v3, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result v3

    if-eqz v3, :cond_1f

    if-eq v3, v7, :cond_1f

    if-eq v3, v12, :cond_18

    goto/16 :goto_2

    .line 1256
    :cond_18
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcheckStatusBar(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 1257
    invoke-static {}, Lcom/flyersoft/tools/A;->isEBookOK()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 1258
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isDrmBook()Z

    move-result v0

    if-eqz v0, :cond_19

    goto/16 :goto_4

    .line 1261
    :cond_19
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->isTxtScrollReady:Z

    if-nez v0, :cond_1a

    sget v0, Lcom/flyersoft/tools/A;->lastChapter:I

    if-nez v0, :cond_1a

    sget-wide v8, Lcom/flyersoft/tools/A;->lastPosition:J

    cmp-long v0, v8, v4

    if-nez v0, :cond_1a

    const/4 v0, 0x1

    goto :goto_1

    :cond_1a
    const/4 v0, 0x0

    .line 1262
    :goto_1
    iget-object v3, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->isTxtScrollReady:Z

    if-nez v3, :cond_1b

    sget-wide v8, Lcom/flyersoft/tools/A;->lastPosition:J

    cmp-long v3, v8, v4

    if-lez v3, :cond_1b

    .line 1263
    iget-object v3, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v4, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    iput-boolean v7, v4, Lcom/flyersoft/staticlayout/MRTextView;->disableDraw:Z

    iput-boolean v7, v3, Lcom/flyersoft/staticlayout/MRTextView;->disableDraw:Z

    .line 1264
    :cond_1b
    iget-object v13, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v14, Lcom/flyersoft/tools/A;->lastChapter:I

    sget v15, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    sget-wide v16, Lcom/flyersoft/tools/A;->lastPosition:J

    const/16 v18, 0x1

    invoke-virtual/range {v13 .. v18}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showEBookByPosition(IIJZ)V

    .line 1265
    iget-object v3, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->ignoreChapterListAtBegin:Z

    if-nez v3, :cond_1c

    if-eqz v0, :cond_1c

    sget-object v3, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v3}, Lcom/flyersoft/books/BaseEBook;->showChaptersAtBegin()Z

    move-result v3

    if-eqz v3, :cond_1c

    sget-object v3, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v3}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x3

    if-le v3, v4, :cond_1c

    if-nez v2, :cond_1c

    .line 1266
    sget-boolean v2, Lcom/flyersoft/tools/A;->listChaptersForNewBook:Z

    if-eqz v2, :cond_1c

    .line 1267
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v2, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_show_chapters(I)V

    :cond_1c
    if-eqz v0, :cond_21

    .line 1269
    invoke-static {}, Lcom/flyersoft/tools/A;->getFileType()I

    move-result v0

    const/4 v2, 0x6

    if-eq v0, v2, :cond_1d

    invoke-static {}, Lcom/flyersoft/tools/A;->isMhtmlPreview()Z

    move-result v0

    if-eqz v0, :cond_21

    .line 1270
    :cond_1d
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->inverseLayoutVisible(Z)V

    goto :goto_2

    .line 1272
    :cond_1e
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideProgressDlg()V

    .line 1273
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v13, v7}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$merror_and_exit(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;Z)V

    return-void

    .line 1246
    :cond_1f
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v3, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    iput-boolean v6, v3, Lcom/flyersoft/staticlayout/MRTextView;->disableDraw:Z

    iput-boolean v6, v2, Lcom/flyersoft/staticlayout/MRTextView;->disableDraw:Z

    .line 1247
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v2

    if-nez v2, :cond_20

    goto/16 :goto_4

    .line 1250
    :cond_20
    iget v0, v0, Landroid/os/Message;->arg1:I

    invoke-virtual {v2, v0}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForOffset(I)I

    move-result v0

    .line 1251
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgetLineTopForPageTurn(Lcom/flyersoft/moonreaderp/ActivityTxt;I)I

    move-result v0

    .line 1252
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtScrollTo(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 1278
    :cond_21
    :goto_2
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result v0

    if-eq v0, v12, :cond_22

    .line 1279
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideProgressDlg()V

    .line 1281
    :cond_22
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->resetPageCount()V

    .line 1282
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputebook_inLoading(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 1283
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->isTxtScrollReady:Z

    if-nez v0, :cond_23

    .line 1284
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean v7, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->isTxtScrollReady:Z

    .line 1285
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->loadNotes()V

    .line 1287
    :cond_23
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpdfHideLay(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 1288
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtLay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v2, 0x8

    if-ne v0, v2, :cond_24

    .line 1289
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtLay:Landroid/view/View;

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 1290
    :cond_24
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mneedPreCurl(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 1291
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mopenBookAnim(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v0

    if-eqz v0, :cond_25

    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->coverShowed:Z

    if-nez v0, :cond_26

    .line 1292
    :cond_25
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$minit3dHandler(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 1293
    :cond_26
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->checkScreenAwake()V

    goto/16 :goto_4

    .line 1226
    :sswitch_2b
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->inExiting:Z

    if-eqz v2, :cond_27

    goto/16 :goto_4

    .line 1228
    :cond_27
    invoke-direct/range {p0 .. p1}, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->waitActTransFinish(Landroid/os/Message;)Z

    move-result v2

    if-eqz v2, :cond_28

    goto/16 :goto_4

    .line 1230
    :cond_28
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideProgressDlg()V

    .line 1231
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget v0, v0, Landroid/os/Message;->arg1:I

    invoke-virtual {v2, v3, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showPreText(Ljava/lang/String;I)V

    goto/16 :goto_4

    .line 1327
    :sswitch_2c
    invoke-direct/range {p0 .. p1}, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->waitActTransFinish(Landroid/os/Message;)Z

    move-result v0

    if-eqz v0, :cond_29

    goto/16 :goto_4

    .line 1329
    :cond_29
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-object v2, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfOpen(Ljava/lang/String;)V

    .line 1330
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mneedPreCurl(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 1331
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mopenBookAnim(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v0

    if-eqz v0, :cond_2a

    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->coverShowed:Z

    if-nez v0, :cond_34

    .line 1332
    :cond_2a
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$minit3dHandler(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto/16 :goto_4

    .line 1220
    :sswitch_2d
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->inExiting:Z

    if-eqz v0, :cond_2b

    goto/16 :goto_4

    .line 1222
    :cond_2b
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const/16 v2, 0xca

    const-wide/16 v3, 0x1e

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_4

    .line 1185
    :sswitch_2e
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->inExiting:Z

    if-eqz v2, :cond_2c

    goto/16 :goto_4

    .line 1187
    :cond_2c
    invoke-direct/range {p0 .. p1}, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->waitActTransFinish(Landroid/os/Message;)Z

    move-result v0

    if-eqz v0, :cond_2d

    goto/16 :goto_4

    .line 1189
    :cond_2d
    invoke-static {}, Lcom/flyersoft/tools/A;->useWebView()Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 1190
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideProgressDlg()V

    .line 1191
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-string v2, ""

    invoke-static {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mshowInWebView(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V

    return-void

    .line 1194
    :cond_2e
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->isTxtScrollReady:Z

    if-nez v0, :cond_2f

    sget-wide v8, Lcom/flyersoft/tools/A;->lastPosition:J

    cmp-long v0, v8, v4

    if-lez v0, :cond_2f

    .line 1195
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    iput-boolean v7, v2, Lcom/flyersoft/staticlayout/MRTextView;->disableDraw:Z

    iput-boolean v7, v0, Lcom/flyersoft/staticlayout/MRTextView;->disableDraw:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 1197
    :cond_2f
    :try_start_1
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->htmlText:Ljava/lang/String;

    invoke-static {v2, v7}, Lcom/flyersoft/tools/T;->getHtmlBody(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->deleteHtmlStyle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->htmlText:Ljava/lang/String;

    .line 1198
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->htmlText:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->adjustChapterHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->htmlSrc:Ljava/lang/String;

    .line 1199
    invoke-static {}, Lcom/flyersoft/tools/A;->noSplitHtmls()Z

    move-result v0

    if-nez v0, :cond_31

    .line 1200
    sget v0, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    sget-object v2, Lcom/flyersoft/tools/A;->splitHtmls:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v7

    if-le v0, v2, :cond_30

    .line 1201
    sput v6, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    .line 1202
    :cond_30
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-object v2, Lcom/flyersoft/tools/A;->splitHtmls:Ljava/util/ArrayList;

    sget v4, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->htmlSrc:Ljava/lang/String;

    .line 1204
    :cond_31
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->htmlSrc:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->htmlSrc:Ljava/lang/String;

    .line 1205
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->htmlSrc:Ljava/lang/String;

    iget-object v4, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->createHtmlBookImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    move-result-object v4

    invoke-static {v2, v4, v3}, Lcom/flyersoft/staticlayout/MyHtml;->fromHtml(Ljava/lang/String;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;I)Landroid/text/Spanned;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtViewSetText(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/CharSequence;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    .line 1207
    :try_start_2
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1208
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->htmlText:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtViewSetText(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/CharSequence;)V

    .line 1210
    :goto_3
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-wide v2, Lcom/flyersoft/tools/A;->lastPosition:J

    invoke-static {v0, v2, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtFileFinalScrollAtStartup(Lcom/flyersoft/moonreaderp/ActivityTxt;J)V

    .line 1211
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideProgressDlg()V

    .line 1212
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hide_ebook_cover()Z

    goto :goto_4

    .line 1171
    :sswitch_2f
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->inExiting:Z

    if-eqz v2, :cond_32

    goto :goto_4

    .line 1173
    :cond_32
    invoke-direct/range {p0 .. p1}, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->waitActTransFinish(Landroid/os/Message;)Z

    move-result v0

    if-eqz v0, :cond_33

    goto :goto_4

    .line 1175
    :cond_33
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-wide v2, Lcom/flyersoft/tools/A;->lastPosition:J

    invoke-virtual {v0, v2, v3, v13}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showTxtByPosition(JLjava/lang/String;)V

    .line 1176
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->resetPageCount()V

    .line 1177
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showReadProgress(I)V

    .line 1178
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->preShowTxtChapterList()V

    .line 1179
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideProgressDlg()V

    .line 1180
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$7;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hide_ebook_cover()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    return-void

    :catch_1
    move-exception v0

    .line 1519
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_34
    :goto_4
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x65 -> :sswitch_2f
        0x66 -> :sswitch_2e
        0x67 -> :sswitch_2d
        0x69 -> :sswitch_2c
        0xc9 -> :sswitch_2b
        0xca -> :sswitch_2a
        0x12d -> :sswitch_29
        0x1f5 -> :sswitch_28
        0x1f6 -> :sswitch_27
        0x259 -> :sswitch_26
        0x321 -> :sswitch_25
        0x352 -> :sswitch_24
        0x353 -> :sswitch_23
        0x385 -> :sswitch_22
        0x386 -> :sswitch_21
        0x388 -> :sswitch_20
        0x38a -> :sswitch_1f
        0x38b -> :sswitch_1e
        0x38d -> :sswitch_1d
        0x38e -> :sswitch_1c
        0x398 -> :sswitch_1b
        0x399 -> :sswitch_1a
        0x39a -> :sswitch_19
        0x3b6 -> :sswitch_18
        0x3b7 -> :sswitch_17
        0x3b8 -> :sswitch_16
        0x3b9 -> :sswitch_15
        0x3ba -> :sswitch_14
        0x3bc -> :sswitch_13
        0x3bd -> :sswitch_12
        0x3be -> :sswitch_11
        0x3c2 -> :sswitch_10
        0x3c3 -> :sswitch_f
        0x3c4 -> :sswitch_e
        0x3c5 -> :sswitch_d
        0x3c6 -> :sswitch_c
        0x3d0 -> :sswitch_b
        0x3d1 -> :sswitch_a
        0x3d3 -> :sswitch_9
        0x3d4 -> :sswitch_8
        0x3d5 -> :sswitch_7
        0x3d6 -> :sswitch_6
        0x3d8 -> :sswitch_5
        0x412 -> :sswitch_4
        0x233d -> :sswitch_3
        0x2352 -> :sswitch_2
        0x2353 -> :sswitch_1
        0x2354 -> :sswitch_0
    .end sparse-switch
.end method
