.class Lcom/flyersoft/moonreaderp/PrefVisual$23;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->setSytleMaterialSwitchEvents()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefVisual;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 687
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$23;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 4

    .line 690
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual$23;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    if-eqz v0, :cond_0

    goto/16 :goto_0

    :cond_0
    if-eqz p2, :cond_1

    .line 693
    new-instance p2, Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual$23;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 694
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$23;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 695
    new-instance v1, Landroid/widget/CheckBox;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$23;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 696
    sget v2, Lcom/flyersoft/moonreaderp/R$string;->text_dense_tip:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    const/high16 v2, 0x41200000    # 10.0f

    .line 697
    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3, v3, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 698
    sget v2, Lcom/flyersoft/moonreaderp/R$string;->text_dense_punc:I

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setText(I)V

    .line 699
    sget-boolean v2, Lcom/flyersoft/tools/A;->textDensePunc:Z

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    const/4 v2, 0x1

    .line 700
    invoke-virtual {p2, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 701
    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 702
    invoke-virtual {p2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 703
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$23;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->text_dense:I

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefVisual$23$3;

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/moonreaderp/PrefVisual$23$3;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual$23;Landroid/widget/CheckBox;)V

    const v1, 0x104000a

    .line 704
    invoke-virtual {p2, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefVisual$23$2;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/moonreaderp/PrefVisual$23$2;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual$23;Landroid/widget/CompoundButton;)V

    const/high16 v1, 0x1040000

    .line 711
    invoke-virtual {p2, v1, v0}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefVisual$23$1;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/moonreaderp/PrefVisual$23$1;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual$23;Landroid/widget/CompoundButton;)V

    .line 716
    invoke-virtual {p2, v0}, Lcom/flyersoft/components/MyDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 721
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 722
    :cond_1
    sget-boolean p1, Lcom/flyersoft/tools/A;->textDense:Z

    if-eq p1, p2, :cond_2

    .line 723
    sput-boolean p2, Lcom/flyersoft/tools/A;->textDense:Z

    .line 724
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$23;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mrefreshTxtRender(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    :cond_2
    :goto_0
    return-void
.end method
