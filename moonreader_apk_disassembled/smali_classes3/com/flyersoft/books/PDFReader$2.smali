.class Lcom/flyersoft/books/PDFReader$2;
.super Ljava/lang/Object;
.source "PDFReader.java"

# interfaces
.implements Lcom/radaee/reader/PDFLayoutView$OnBeforeLinkJump;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/PDFReader;->initView(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V
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

    .line 166
    iput-object p1, p0, Lcom/flyersoft/books/PDFReader$2;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public beforePageJump(I)V
    .locals 1

    .line 169
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$2;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p1

    const/4 v0, 0x0

    iput-boolean v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->longTimeTapEvent:Z

    .line 170
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$2;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->saveLinkBackInfo(Z)Lcom/flyersoft/moonreaderp/ActivityTxt$LINK_BACK;

    .line 171
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$2;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->linkBackSetVisible()V

    .line 172
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$2;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->pdfAnnotEnd()V

    return-void
.end method
