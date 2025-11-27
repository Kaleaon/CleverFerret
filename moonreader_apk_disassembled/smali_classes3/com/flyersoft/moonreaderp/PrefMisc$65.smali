.class Lcom/flyersoft/moonreaderp/PrefMisc$65;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->setTiltOptions(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$cb:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1716
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$65;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$65;->val$cb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1718
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$65;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-eqz p1, :cond_0

    .line 1719
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$65;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    sput-boolean p1, Lcom/flyersoft/tools/A;->askForTiltAction:Z

    const/4 p1, 0x0

    .line 1720
    sput-boolean p1, Lcom/flyersoft/tools/A;->tilt_turn_page:Z

    :cond_0
    return-void
.end method
