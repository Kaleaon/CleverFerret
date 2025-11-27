.class Lcom/flyersoft/moonreaderp/ActivityTxt$20;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


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

    .line 2536
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 5

    .line 2539
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdisableFunctionsInWebView(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 2541
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 2542
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x9

    const/4 v4, 0x0

    if-le v2, v3, :cond_1

    .line 2543
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    .line 2566
    :pswitch_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v1}, Lcom/flyersoft/views/RulerView;->showRulerOptions(Landroid/content/Context;Z)V

    goto/16 :goto_0

    .line 2565
    :pswitch_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoSyncFromCloudLongTap(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/View;)V

    goto/16 :goto_0

    .line 2563
    :pswitch_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoSyncToCloudLongTap(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/View;)V

    goto/16 :goto_0

    .line 2561
    :pswitch_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->customize_bottom_bar1:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 2560
    :pswitch_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->button_dualpage:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 2559
    :pswitch_5
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->button_shutdown:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 2558
    :pswitch_6
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->button_options:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 2557
    :pswitch_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v1, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoDayNightLongTap(Lcom/flyersoft/moonreaderp/ActivityTxt;ILandroid/view/View;)V

    goto/16 :goto_0

    .line 2556
    :pswitch_8
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->miscellaneous:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 2555
    :pswitch_9
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->control_options:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 2554
    :pswitch_a
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->visual_options:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 2553
    :pswitch_b
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->tilt_turn_page:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 2552
    :pswitch_c
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->button_search:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 2551
    :pswitch_d
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->button_fontsize:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 2550
    :pswitch_e
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->button_brightness:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 2549
    :pswitch_f
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->button_bookmarks:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 2548
    :pswitch_10
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->button_chapters:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 2547
    :pswitch_11
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->button_autoscroll:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 2546
    :pswitch_12
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->button_speak:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 2545
    :pswitch_13
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->button_daynight:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 2544
    :pswitch_14
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->button_orientation:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :goto_0
    return v4

    .line 2570
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    goto :goto_1

    .line 2583
    :pswitch_15
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v1}, Lcom/flyersoft/components/DragSort/ReaderBar;->customizeBottomIcons(Landroid/content/Context;Z)Landroid/view/View;

    goto :goto_1

    .line 2582
    :pswitch_16
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdualpage_switch(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto :goto_1

    .line 2581
    :pswitch_17
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->terminate_reader()V

    goto :goto_1

    .line 2580
    :pswitch_18
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->setTiltOptions(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto :goto_1

    .line 2579
    :pswitch_19
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoSearchLongTap(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/View;)V

    return v4

    .line 2578
    :pswitch_1a
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoFontSizeLongTap(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/View;)V

    goto :goto_1

    .line 2577
    :pswitch_1b
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoBrightnessLongTap(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/View;)V

    goto :goto_1

    .line 2576
    :pswitch_1c
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoBookmarkLongTap(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/View;)V

    goto :goto_1

    .line 2575
    :pswitch_1d
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoChaptersLongTap(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/View;)V

    goto :goto_1

    .line 2574
    :pswitch_1e
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoAutoScrollLongTap(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/View;)V

    goto :goto_1

    .line 2573
    :pswitch_1f
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoSpeakLongTap(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/View;)V

    goto :goto_1

    .line 2572
    :pswitch_20
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v4, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoDayNightLongTap(Lcom/flyersoft/moonreaderp/ActivityTxt;ILandroid/view/View;)V

    goto :goto_1

    .line 2571
    :pswitch_21
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoOrientationLongTap(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/View;)V

    :goto_1
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0xf
        :pswitch_17
        :pswitch_16
        :pswitch_15
    .end packed-switch
.end method
