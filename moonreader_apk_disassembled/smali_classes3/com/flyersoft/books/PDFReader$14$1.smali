.class Lcom/flyersoft/books/PDFReader$14$1;
.super Ljava/lang/Object;
.source "PDFReader.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/PDFReader$14;->OnPDFOpen3D(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/books/PDFReader$14;

.field final synthetic val$cb:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/PDFReader$14;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1031
    iput-object p1, p0, Lcom/flyersoft/books/PDFReader$14$1;->this$1:Lcom/flyersoft/books/PDFReader$14;

    iput-object p2, p0, Lcom/flyersoft/books/PDFReader$14$1;->val$cb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1034
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14$1;->this$1:Lcom/flyersoft/books/PDFReader$14;

    iget-object p1, p1, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    const/4 p2, 0x0

    iput-object p2, p1, Lcom/flyersoft/books/PDFReader;->warningDlg:Lcom/flyersoft/components/MyDialog;

    .line 1035
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14$1;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 1036
    sput-boolean p1, Lcom/flyersoft/tools/A;->askPdfScrollToPage1Issue:Z

    :cond_0
    return-void
.end method
