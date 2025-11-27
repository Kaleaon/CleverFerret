.class Lcom/flyersoft/moonreaderp/ActivityTxt$67;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->initBrightSeek()V
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

    .line 6307
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$67;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    if-eqz p3, :cond_0

    .line 6310
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$67;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    add-int/lit8 p2, p2, -0x32

    const/4 p3, 0x1

    invoke-virtual {p1, p2, p3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setScreenBrightness(IZ)V

    .line 6311
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$67;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->brightAutoCheck:Landroid/widget/CheckBox;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 6312
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$67;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->brightnessPanel:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 6313
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$67;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->brightnessPanel:Landroid/view/View;

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
