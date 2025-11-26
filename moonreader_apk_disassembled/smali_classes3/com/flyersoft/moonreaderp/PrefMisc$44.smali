.class Lcom/flyersoft/moonreaderp/PrefMisc$44;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->showAutoScrollSettings(Landroid/content/Context;Z)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$cb:Landroid/widget/CheckBox;

.field final synthetic val$isPdf:Z

.field final synthetic val$sb:Landroid/widget/SeekBar;

.field final synthetic val$sp:Landroid/widget/Spinner;


# direct methods
.method constructor <init>(Landroid/widget/CheckBox;Landroid/widget/Spinner;ZLandroid/widget/SeekBar;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1264
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$44;->val$cb:Landroid/widget/CheckBox;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$44;->val$sp:Landroid/widget/Spinner;

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$44;->val$isPdf:Z

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$44;->val$sb:Landroid/widget/SeekBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1266
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$44;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->askForScrollEvent:Z

    .line 1267
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$44;->val$sp:Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    .line 1268
    iget-boolean p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$44;->val$isPdf:Z

    if-eqz p2, :cond_2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p2, 0x1

    if-ne p1, p2, :cond_1

    const/4 p1, 0x4

    goto :goto_0

    :cond_1
    const/4 p1, 0x5

    .line 1269
    :goto_0
    sput p1, Lcom/flyersoft/tools/A;->autoScrollMode:I

    goto :goto_1

    .line 1271
    :cond_2
    sput p1, Lcom/flyersoft/tools/A;->autoScrollMode:I

    .line 1272
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$44;->val$sb:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    rsub-int/lit8 p1, p1, 0x64

    sput p1, Lcom/flyersoft/tools/A;->autoScrollSpeed:I

    return-void
.end method
