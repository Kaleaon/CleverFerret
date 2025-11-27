.class Lcom/flyersoft/moonreaderp/ActivityTxt$192;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfInitLay()V
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

    .line 18580
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$192;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 18582
    sget-boolean p1, Lcom/flyersoft/tools/A;->pdf_scoll_lock:Z

    const/4 v0, 0x1

    xor-int/2addr p1, v0

    sput-boolean p1, Lcom/flyersoft/tools/A;->pdf_scoll_lock:Z

    .line 18583
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$192;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    sget-boolean v1, Lcom/flyersoft/tools/A;->pdf_scoll_lock:Z

    invoke-virtual {p1, v1}, Lcom/flyersoft/books/PDFReader;->viewLockSide(Z)V

    .line 18584
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$192;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->inverseLayoutVisible(Z)V

    .line 18585
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$192;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfLockIv:Landroid/widget/ImageView;

    sget-boolean v0, Lcom/flyersoft/tools/A;->pdf_scoll_lock:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->pdf_unlock:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->pdf_lock:I

    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method
