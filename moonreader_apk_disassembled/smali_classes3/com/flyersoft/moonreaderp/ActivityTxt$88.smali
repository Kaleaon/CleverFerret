.class Lcom/flyersoft/moonreaderp/ActivityTxt$88;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->do_go_percent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$ebookWithTotalPages:Z

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/widget/EditText;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 10118
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$88;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$88;->val$et:Landroid/widget/EditText;

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$88;->val$ebookWithTotalPages:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 10120
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$88;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->web:Lcom/flyersoft/views/MRBookView;

    if-nez p1, :cond_5

    .line 10122
    :try_start_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$88;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "%"

    const-string v0, ""

    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 10123
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$88;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result p2

    const/4 v0, 0x1

    if-eqz p2, :cond_2

    .line 10124
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sub-int/2addr p1, v0

    if-lez p1, :cond_1

    .line 10125
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$88;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p2}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result p2

    if-gt p1, p2, :cond_1

    .line 10126
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$88;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v1, Lcom/radaee/pdf/Global;->def_view:I

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p2, p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfGotoPage(IZ)V

    .line 10127
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$88;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->updateProgressStatus()V

    goto :goto_1

    .line 10129
    :cond_2
    iget-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$88;->val$ebookWithTotalPages:Z

    if-eqz p2, :cond_3

    .line 10130
    invoke-static {p1}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result p1

    if-ltz p1, :cond_4

    .line 10131
    sget-object p2, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Lcom/flyersoft/books/BaseEBook;->getTotalPageCount(Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)I

    move-result p2

    if-gt p1, p2, :cond_4

    .line 10132
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$88;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p2, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showEBookbyPageNum(I)V

    goto :goto_1

    .line 10134
    :cond_3
    invoke-static {p1}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    const/high16 p2, 0x41200000    # 10.0f

    mul-float p1, p1, p2

    const/4 p2, 0x0

    cmpl-float p2, p1, p2

    if-ltz p2, :cond_4

    const/high16 p2, 0x447a0000    # 1000.0f

    cmpg-float p2, p1, p2

    if-gtz p2, :cond_4

    .line 10136
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$88;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    float-to-int p1, p1

    invoke-virtual {p2, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showBookByPercent(I)V

    .line 10137
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$88;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->updateProgressStatus()V

    .line 10141
    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$88;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->inverseLayoutVisible(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_5
    return-void
.end method
