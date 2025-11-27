.class Lcom/flyersoft/moonreaderp/ActivityTxt$29;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    .line 2769
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$29;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 2771
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$29;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 2772
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$29;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const v0, 0x3dcccccd    # 0.1f

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfZoomRatio(F)V

    return-void

    .line 2775
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$29;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->web:Lcom/flyersoft/views/MRBookView;

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    .line 2776
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$29;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->webViewZoom(Z)V

    return-void

    .line 2779
    :cond_1
    sget p1, Lcom/flyersoft/tools/A;->fontSize:F

    const/high16 v1, 0x41200000    # 10.0f

    mul-float p1, p1, v1

    float-to-int p1, p1

    add-int/2addr p1, v0

    int-to-float p1, p1

    div-float/2addr p1, v1

    sput p1, Lcom/flyersoft/tools/A;->fontSize:F

    .line 2780
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$29;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mupdateFontLayValue(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return-void
.end method
