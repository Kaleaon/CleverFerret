.class Lcom/flyersoft/moonreaderp/PrefMisc$17;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 707
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$17;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 709
    check-cast p1, Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object p1

    .line 710
    invoke-virtual {p1}, Landroid/widget/ListView;->getCheckedItemPosition()I

    move-result p1

    .line 711
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "selected:"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    if-ltz p1, :cond_5

    const/16 p2, 0x64

    .line 713
    sput p2, Lcom/flyersoft/tools/A;->screenAwakeExtend:I

    if-nez p1, :cond_0

    .line 715
    sput v0, Lcom/flyersoft/tools/A;->screenAwakeExtend:I

    goto :goto_0

    :cond_0
    const/4 p2, 0x2

    if-ne p1, v0, :cond_1

    .line 717
    sput p2, Lcom/flyersoft/tools/A;->screenAwakeExtend:I

    goto :goto_0

    :cond_1
    if-ne p1, p2, :cond_2

    const/4 p1, 0x5

    .line 719
    sput p1, Lcom/flyersoft/tools/A;->screenAwakeExtend:I

    goto :goto_0

    :cond_2
    const/4 p2, 0x3

    if-ne p1, p2, :cond_3

    const/16 p1, 0xa

    .line 721
    sput p1, Lcom/flyersoft/tools/A;->screenAwakeExtend:I

    goto :goto_0

    :cond_3
    const/4 p2, 0x4

    if-ne p1, p2, :cond_4

    const/16 p1, 0x1e

    .line 723
    sput p1, Lcom/flyersoft/tools/A;->screenAwakeExtend:I

    .line 724
    :cond_4
    :goto_0
    sput-boolean v0, Lcom/flyersoft/tools/A;->keepScreenAwake:Z

    .line 725
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$17;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->pmKeepScreenAwake:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p1, v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    :cond_5
    return-void
.end method
