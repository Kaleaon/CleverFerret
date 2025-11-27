.class Lcom/flyersoft/moonreaderp/ActivityTxt$28;
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

    .line 2755
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$28;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 2757
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$28;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 2758
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$28;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const v0, -0x42333333    # -0.1f

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfZoomRatio(F)V

    return-void

    .line 2761
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$28;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->web:Lcom/flyersoft/views/MRBookView;

    if-eqz p1, :cond_1

    .line 2762
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$28;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->webViewZoom(Z)V

    return-void

    .line 2765
    :cond_1
    sget p1, Lcom/flyersoft/tools/A;->fontSize:F

    const/high16 v0, 0x41200000    # 10.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    const/4 v1, 0x1

    sub-int/2addr p1, v1

    int-to-float p1, p1

    div-float/2addr p1, v0

    sput p1, Lcom/flyersoft/tools/A;->fontSize:F

    .line 2766
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$28;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mupdateFontLayValue(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return-void
.end method
