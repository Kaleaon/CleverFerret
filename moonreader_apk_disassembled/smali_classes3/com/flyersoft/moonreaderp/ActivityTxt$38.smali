.class Lcom/flyersoft/moonreaderp/ActivityTxt$38;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showThemeWindow(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$italic:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V
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

    .line 3046
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$38;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$38;->val$italic:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getTheme(Ljava/lang/String;)V
    .locals 3

    .line 3048
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$38;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 3049
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$38;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfRemoveThumb()V

    .line 3050
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sput p1, Lcom/radaee/pdf/Global;->pdf_theme:I

    .line 3051
    sget p1, Lcom/radaee/pdf/Global;->pdf_theme:I

    if-ne p1, v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    sput-boolean v1, Lcom/radaee/pdf/Global;->dark_mode:Z

    .line 3052
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$38;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->resetDrawCache()V

    .line 3053
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$38;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->setBackgroundColor()V

    .line 3054
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$38;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setStatusBarProperties(Z)V

    .line 3055
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$38;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msetDynamicColorToIcons(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 3056
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$38;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowFullStatusBarInfo(Z)Z

    .line 3057
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$38;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->doPostInvalidate()V

    return-void

    .line 3060
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$38;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->loadTheme(Ljava/lang/String;Z)V

    .line 3061
    sget-object p1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getThemeOfBook(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_2

    .line 3062
    const-string p1, "circle_only"

    invoke-static {p1, v2}, Lcom/flyersoft/tools/A;->saveTheme(Ljava/lang/String;Z)V

    .line 3063
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$38;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->web:Lcom/flyersoft/views/MRBookView;

    if-eqz p1, :cond_3

    .line 3064
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$38;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mreloadWebView(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 3065
    :cond_3
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$38;->val$italic:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->fontItalic:Z

    if-eq p1, v0, :cond_4

    sget-boolean p1, Lcom/flyersoft/tools/A;->textJustified:Z

    if-eqz p1, :cond_4

    .line 3066
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$38;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->saveLastPostion(Z)V

    .line 3067
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$38;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderToTxt()V

    :cond_4
    return-void
.end method
