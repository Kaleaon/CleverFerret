.class Lcom/flyersoft/moonreaderp/ActivityMain$21;
.super Landroid/os/Handler;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/os/Looper;)V
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

    .line 2515
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    .line 2518
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x3fd

    if-ne v0, v1, :cond_0

    .line 2519
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->syncLay:Landroid/view/View;

    if-eqz p1, :cond_15

    .line 2520
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->syncLay:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void

    .line 2523
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x3fe

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    .line 2524
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$minitSyncEvents(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 2525
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->syncLay:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 2526
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->syncTv:Landroid/widget/TextView;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 2529
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x3ff

    if-ne v0, v1, :cond_2

    .line 2530
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->checkIfSyncShelfBooksToCloudFinal()V

    return-void

    .line 2533
    :cond_2
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x3f3

    if-ne v0, v1, :cond_3

    .line 2534
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mopenDownloadedBook(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/os/Message;)V

    return-void

    .line 2537
    :cond_3
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x3ef

    if-ne v0, v1, :cond_4

    .line 2538
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetprogressDlg(Lcom/flyersoft/moonreaderp/ActivityMain;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 2539
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetprogressDlg(Lcom/flyersoft/moonreaderp/ActivityMain;)Landroid/app/ProgressDialog;

    move-result-object v0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    return-void

    .line 2543
    :cond_4
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x400

    if-ne v0, v1, :cond_5

    .line 2544
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    return-void

    .line 2548
    :cond_5
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x3f0

    if-ne v0, v1, :cond_7

    .line 2549
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mhideProgressDialog(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 2550
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollectionLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    if-eqz p1, :cond_6

    .line 2551
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollectionLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 2552
    :cond_6
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    return-void

    .line 2556
    :cond_7
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x3ee

    if-ne v0, v1, :cond_8

    .line 2557
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->requestGrantSD()V

    return-void

    .line 2561
    :cond_8
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x3ed

    if-ne v0, v1, :cond_9

    .line 2562
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mdoDelayStartEvents(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void

    .line 2566
    :cond_9
    iget v0, p1, Landroid/os/Message;->what:I

    if-nez v0, :cond_a

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_a

    .line 2567
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 2571
    :cond_a
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x3f1

    if-ne v0, v1, :cond_b

    .line 2572
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadBook2()V

    .line 2573
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowConnectIndicator(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    return-void

    .line 2577
    :cond_b
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x259

    if-ne v0, v1, :cond_c

    .line 2578
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->setLanguage(Landroid/content/Context;)V

    return-void

    .line 2582
    :cond_c
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x386

    if-ne v0, v1, :cond_d

    .line 2583
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mautoImportNewBooks(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void

    .line 2587
    :cond_d
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x387

    if-ne v0, v1, :cond_e

    .line 2588
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mmeasureCoverRatio(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/os/Message;)V

    return-void

    .line 2592
    :cond_e
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x3e8

    if-ne v0, v1, :cond_f

    .line 2593
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->measureDrawerButtons()V

    return-void

    .line 2597
    :cond_f
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x3ea

    if-ne v0, v1, :cond_10

    .line 2598
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateDrawerButtonText()V

    return-void

    .line 2602
    :cond_10
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x3eb

    const/4 v3, 0x1

    if-ne v0, v1, :cond_11

    .line 2603
    new-array p1, v3, [Ljava/lang/Object;

    const-string v0, "==========>>>RestartApp - main"

    aput-object v0, p1, v2

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 2604
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->restartApp2()V

    return-void

    .line 2608
    :cond_11
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mhideProgressDialog(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 2609
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowConnectIndicator(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    .line 2611
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_12

    .line 2612
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mhandle_new_catalog_need_password(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 2615
    :cond_12
    iget v0, p1, Landroid/os/Message;->what:I

    if-ne v0, v3, :cond_13

    .line 2616
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mhandle_new_catalog_ok(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/os/Message;)V

    .line 2619
    :cond_13
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_14

    .line 2620
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->appendHttpsToErrorTip(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    .line 2627
    :cond_14
    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v0, 0xa

    if-ne p1, v0, :cond_15

    .line 2628
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$21;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowFavFolderSelector(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    :cond_15
    return-void
.end method
