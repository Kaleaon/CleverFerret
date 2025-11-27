.class Lcom/flyersoft/moonreaderp/PrefControl$14;
.super Ljava/lang/Object;
.source "PrefControl.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefControl;->initGallery()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefControl;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefControl;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 570
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$14;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    const/16 p1, 0x8

    const/4 p2, 0x0

    if-ge p3, p1, :cond_1

    .line 574
    rem-int/lit8 p1, p3, 0x2

    const/4 p4, 0x1

    if-ne p1, p4, :cond_0

    const/4 p2, 0x1

    :cond_0
    sput-boolean p2, Lcom/flyersoft/tools/A;->toggleTapMode:Z

    .line 575
    div-int/lit8 p3, p3, 0x2

    sput p3, Lcom/flyersoft/tools/A;->tapMode:I

    goto :goto_0

    .line 577
    :cond_1
    sput-boolean p2, Lcom/flyersoft/tools/A;->toggleTapMode:Z

    add-int/lit8 p3, p3, -0x4

    .line 578
    sput p3, Lcom/flyersoft/tools/A;->tapMode:I

    .line 581
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$14;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefControl;->setTapZoneEnable()V

    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    return-void
.end method
