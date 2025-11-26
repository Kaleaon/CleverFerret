.class Lcom/flyersoft/moonreaderp/PrefMisc$57;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->setBrightnessOptions(Landroid/content/Context;ZZ)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$restoreCb:Landroid/widget/CheckBox;

.field final synthetic val$sp:Landroid/widget/Spinner;


# direct methods
.method constructor <init>(Landroid/widget/Spinner;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1535
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$57;->val$sp:Landroid/widget/Spinner;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$57;->val$restoreCb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1537
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$57;->val$sp:Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->brightness_edge:I

    .line 1538
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$57;->val$restoreCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->restoreAutoBright:Z

    return-void
.end method
