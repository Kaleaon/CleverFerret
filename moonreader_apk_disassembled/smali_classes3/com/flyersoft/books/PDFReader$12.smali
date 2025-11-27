.class Lcom/flyersoft/books/PDFReader$12;
.super Ljava/lang/Object;
.source "PDFReader.java"

# interfaces
.implements Lorg/comic/ICLayoutView$CLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/PDFReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/PDFReader;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/PDFReader;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 985
    iput-object p1, p0, Lcom/flyersoft/books/PDFReader$12;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnDoubleTapped(FF)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public OnPageChanged(I)V
    .locals 1

    .line 987
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$12;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v0, p1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$mafterPageChanged(Lcom/flyersoft/books/PDFReader;I)V

    return-void
.end method

.method public OnZoomEnd()V
    .locals 3

    .line 990
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$12;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v0}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowLockIcon(ZZ)V

    return-void
.end method

.method public OnZoomStart()V
    .locals 2

    .line 989
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$12;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v0}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowLockIcon(ZZ)V

    return-void
.end method
