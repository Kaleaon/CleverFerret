.class Lcom/flyersoft/moonreaderp/ActivityTxt$26;
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

    .line 2724
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$26;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 2726
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$26;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 2727
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$26;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const v0, 0x3e4ccccd    # 0.2f

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfZoomRatio(F)V

    return-void

    .line 2730
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$26;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->web:Lcom/flyersoft/views/MRBookView;

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    .line 2731
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$26;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->webViewZoom(Z)V

    return-void

    .line 2734
    :cond_1
    sget p1, Lcom/flyersoft/tools/A;->fontSize:F

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr p1, v1

    sput p1, Lcom/flyersoft/tools/A;->fontSize:F

    .line 2735
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$26;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mupdateFontLayValue(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return-void
.end method
