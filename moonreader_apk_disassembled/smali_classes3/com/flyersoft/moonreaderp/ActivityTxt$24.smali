.class Lcom/flyersoft/moonreaderp/ActivityTxt$24;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->getFontLay()Landroid/view/View;
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

    .line 2694
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$24;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    if-eqz p3, :cond_1

    .line 2696
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$24;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$24;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->web:Lcom/flyersoft/views/MRBookView;

    if-eqz p1, :cond_0

    goto :goto_0

    .line 2699
    :cond_0
    sget p1, Lcom/flyersoft/tools/A;->fontSize:F

    sget p3, Lcom/flyersoft/tools/A;->fontSize:F

    float-to-int p3, p3

    int-to-float p3, p3

    rem-float/2addr p1, p3

    const/high16 p3, 0x41200000    # 10.0f

    mul-float p1, p1, p3

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p1, p3

    .line 2700
    sget p3, Lcom/flyersoft/tools/A;->minFontSize:I

    add-int/2addr p2, p3

    int-to-float p2, p2

    add-float/2addr p2, p1

    sput p2, Lcom/flyersoft/tools/A;->fontSize:F

    .line 2701
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$24;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mupdateFontLayValue(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    :cond_1
    :goto_0
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
