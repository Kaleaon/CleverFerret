.class Lcom/flyersoft/moonreaderp/ActivityTxt$195;
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

    .line 18604
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$195;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 18606
    sget p1, Lcom/radaee/pdf/Global;->def_view:I

    const/4 v0, 0x2

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    const/4 p1, 0x2

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    sput p1, Lcom/flyersoft/tools/A;->pdf_view_mode:I

    .line 18607
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$195;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean p1, p1, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz p1, :cond_1

    sget p1, Lcom/flyersoft/tools/A;->pdf_view_mode:I

    if-ne p1, v0, :cond_1

    .line 18608
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$195;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->saveLastPostion(Z)V

    .line 18609
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$195;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    .line 18610
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$195;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderToTxt()V

    return-void

    .line 18612
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$195;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void
.end method
