.class Lcom/flyersoft/books/PDFReader$15;
.super Ljava/lang/Object;
.source "PDFReader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/PDFReader;->showAnnotSelect()V
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

    .line 1156
    iput-object p1, p0, Lcom/flyersoft/books/PDFReader$15;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1159
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$15;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v0}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->hPen:Landroid/widget/ImageView;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1160
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$15;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v0}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setHPenImage(Z)V

    .line 1162
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$15;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v0}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    const v1, -0x77555556

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setHBarDisableButtons(I)V

    .line 1163
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$15;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v0}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->hMore:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method
