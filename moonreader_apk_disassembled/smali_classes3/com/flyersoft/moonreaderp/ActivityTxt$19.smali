.class Lcom/flyersoft/moonreaderp/ActivityTxt$19;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    .line 2503
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 2506
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hidePop(Z)Z

    .line 2507
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdisableFunctionsInWebView(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_0

    .line 2509
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_0

    .line 2531
    :pswitch_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/tools/A;->showRuler:I

    if-ne v0, v1, :cond_1

    const/4 v1, -0x1

    :cond_1
    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showRuler(I)V

    return-void

    .line 2530
    :pswitch_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoSyncFromCloud(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void

    .line 2529
    :pswitch_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoSyncToCloud(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void

    .line 2528
    :pswitch_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v1}, Lcom/flyersoft/components/DragSort/ReaderBar;->customizeBottomIcons(Landroid/content/Context;Z)Landroid/view/View;

    return-void

    .line 2527
    :pswitch_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdualpage_switch(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void

    .line 2526
    :pswitch_5
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->terminate_reader()V

    return-void

    .line 2525
    :pswitch_6
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_options_menu()V

    return-void

    .line 2524
    :pswitch_7
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_change_theme()V

    return-void

    .line 2523
    :pswitch_8
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showMiscOptions()V

    return-void

    .line 2522
    :pswitch_9
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showControlOptions()V

    return-void

    .line 2521
    :pswitch_a
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showVisualOptions()V

    return-void

    .line 2520
    :pswitch_b
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_tilt(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void

    .line 2519
    :pswitch_c
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_search()V

    return-void

    .line 2518
    :pswitch_d
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_font_size(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void

    .line 2517
    :pswitch_e
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_brightness(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void

    .line 2516
    :pswitch_f
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_bookmark()V

    return-void

    .line 2514
    :pswitch_10
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->inverseLayoutVisible(Z)V

    .line 2515
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_show_chapters(I)V

    return-void

    .line 2513
    :pswitch_11
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_AutoScrollAsk(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void

    .line 2512
    :pswitch_12
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_speak(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void

    .line 2511
    :pswitch_13
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoDayNightButton(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void

    .line 2510
    :pswitch_14
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$19;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoOrientationButton(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    :goto_0
    return-void

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
.end method
