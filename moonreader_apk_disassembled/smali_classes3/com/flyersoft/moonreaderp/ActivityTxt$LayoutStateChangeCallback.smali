.class Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroidx/core/util/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LayoutStateChangeCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/core/util/Consumer<",
        "Landroidx/window/layout/WindowLayoutInfo;",
        ">;"
    }
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

    .line 311
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Landroidx/window/layout/WindowLayoutInfo;)V
    .locals 2

    .line 314
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$$ExternalSyntheticLambda0;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;Landroidx/window/layout/WindowLayoutInfo;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 311
    check-cast p1, Landroidx/window/layout/WindowLayoutInfo;

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->accept(Landroidx/window/layout/WindowLayoutInfo;)V

    return-void
.end method

.method synthetic lambda$accept$0$com-flyersoft-moonreaderp-ActivityTxt$LayoutStateChangeCallback(Landroidx/window/layout/WindowLayoutInfo;)V
    .locals 6

    .line 0
    const/4 v0, 0x1

    .line 315
    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "LayoutStateChangeCallback"

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 316
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->foldablePhoneFlat:Z

    .line 317
    invoke-virtual {p1}, Landroidx/window/layout/WindowLayoutInfo;->getDisplayFeatures()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/window/layout/DisplayFeature;

    .line 318
    instance-of v3, v1, Landroidx/window/layout/FoldingFeature;

    if-eqz v3, :cond_0

    .line 319
    check-cast v1, Landroidx/window/layout/FoldingFeature;

    .line 320
    invoke-interface {v1}, Landroidx/window/layout/FoldingFeature;->getState()Landroidx/window/layout/FoldingFeature$State;

    move-result-object v1

    .line 321
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "foldable feature: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-array v4, v0, [Ljava/lang/Object;

    aput-object v3, v4, v2

    invoke-static {v4}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 322
    sget-object v3, Landroidx/window/layout/FoldingFeature$State;->HALF_OPENED:Landroidx/window/layout/FoldingFeature$State;

    if-eq v1, v3, :cond_1

    sget-object v3, Landroidx/window/layout/FoldingFeature$State;->FLAT:Landroidx/window/layout/FoldingFeature$State;

    if-ne v1, v3, :cond_2

    .line 323
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->isFoldablePhone:Z

    .line 324
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean v0, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->foldablePhoneFlat:Z

    .line 326
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->priorFoldablePhoneFlat:Z

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->foldablePhoneFlat:Z

    if-ne v1, v3, :cond_3

    goto/16 :goto_2

    .line 328
    :cond_3
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v3, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->foldablePhoneFlat:Z

    iput-boolean v3, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->priorFoldablePhoneFlat:Z

    goto :goto_0

    .line 332
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->fromFoldablePhoneStateChanged:Z

    if-eqz p1, :cond_5

    .line 333
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean v2, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->fromFoldablePhoneStateChanged:Z

    return-void

    .line 337
    :cond_5
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result p1

    if-nez p1, :cond_a

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result p1

    if-eqz p1, :cond_6

    goto/16 :goto_2

    .line 340
    :cond_6
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->isFoldablePhone:Z

    if-eqz p1, :cond_a

    .line 341
    sget-boolean p1, Lcom/flyersoft/tools/A;->auto2PageForFoldable:Z

    if-nez p1, :cond_9

    .line 342
    sget p1, Lcom/flyersoft/tools/A;->askAutoDualMode:I

    const/4 v1, -0x1

    if-eq p1, v1, :cond_a

    .line 343
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->foldablePhoneDialog:Lcom/flyersoft/components/MyDialog;

    if-eqz p1, :cond_7

    .line 344
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->foldablePhoneDialog:Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->dismiss()V

    .line 345
    :cond_7
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->foldable_tip:I

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ScrollView;

    .line 346
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ofTextView:I

    invoke-virtual {p1, v1}, Landroid/widget/ScrollView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 347
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->ofNeverAskAgain:I

    invoke-virtual {p1, v3}, Landroid/widget/ScrollView;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    .line 348
    sget v4, Lcom/flyersoft/tools/A;->askAutoDualMode:I

    add-int/lit8 v5, v4, 0x1

    sput v5, Lcom/flyersoft/tools/A;->askAutoDualMode:I

    const/4 v5, 0x2

    if-le v4, v5, :cond_8

    goto :goto_1

    :cond_8
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {v3, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 349
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->auto_dual_for_foldable:I

    invoke-virtual {v4, v5}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "?"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v0, 0x41a00000    # 20.0f

    .line 350
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 351
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    new-instance v1, Lcom/flyersoft/components/MyDialog;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {v1, v4}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->foldablePhoneDialog:Lcom/flyersoft/components/MyDialog;

    .line 352
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->foldablePhoneDialog:Lcom/flyersoft/components/MyDialog;

    .line 353
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$2;

    invoke-direct {v0, p0, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;Landroid/widget/CheckBox;)V

    const v1, 0x104000a

    .line 354
    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->cancel:I

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$1;

    invoke-direct {v1, p0, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;Landroid/widget/CheckBox;)V

    .line 362
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 368
    invoke-virtual {p1, v2}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 371
    :cond_9
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->foldablePhoneFlat:Z

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mrestartForDualPhoneChanged(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    :cond_a
    :goto_2
    return-void
.end method
