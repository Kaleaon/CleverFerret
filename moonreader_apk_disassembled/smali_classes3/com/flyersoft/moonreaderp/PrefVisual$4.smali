.class Lcom/flyersoft/moonreaderp/PrefVisual$4;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Lcom/example2014/components/NumberPicker$OnValueChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->setNumberPicker()V
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

    .line 284
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$4;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValueChange(Lcom/example2014/components/NumberPicker;II)V
    .locals 0

    .line 286
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 288
    :cond_0
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->web:Lcom/flyersoft/views/MRBookView;

    if-eqz p1, :cond_2

    if-le p3, p2, :cond_1

    .line 290
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->web:Lcom/flyersoft/views/MRBookView;

    invoke-virtual {p1}, Lcom/flyersoft/views/MRBookView;->zoomIn()Z

    return-void

    .line 292
    :cond_1
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->web:Lcom/flyersoft/views/MRBookView;

    invoke-virtual {p1}, Lcom/flyersoft/views/MRBookView;->zoomOut()Z

    return-void

    .line 295
    :cond_2
    sget p1, Lcom/flyersoft/tools/A;->fontSize:F

    float-to-int p1, p1

    int-to-float p1, p1

    int-to-float p2, p3

    const/high16 p3, 0x41200000    # 10.0f

    div-float/2addr p2, p3

    add-float/2addr p1, p2

    sput p1, Lcom/flyersoft/tools/A;->fontSize:F

    .line 296
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setFontSize()V

    .line 297
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$4;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    sget p2, Lcom/flyersoft/tools/A;->fontSize:F

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mshowHint(Lcom/flyersoft/moonreaderp/PrefVisual;F)V

    return-void
.end method
