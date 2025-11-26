.class Lcom/flyersoft/moonreaderp/PrefChapters$24;
.super Landroid/os/Handler;
.source "PrefChapters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 2107
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    .line 2109
    iget v0, p1, Landroid/os/Message;->what:I

    if-nez v0, :cond_0

    .line 2110
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->progressDlg:Landroid/app/ProgressDialog;

    if-nez v0, :cond_0

    .line 2111
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->search:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mcreateProgressDlg(Lcom/flyersoft/moonreaderp/PrefChapters;Ljava/lang/String;Ljava/lang/String;)V

    .line 2113
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 2114
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v0, :cond_1

    .line 2115
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mlocateToCurImage(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    goto :goto_0

    .line 2116
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->isPdf:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfAnnotList:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 2117
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfAnnotList:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefChapters;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v4}, Lcom/flyersoft/books/PDFReader;->getCurPageNo()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Lcom/flyersoft/books/PDFReader;->pdfGetAnnotListPageStart(Ljava/util/ArrayList;I)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->myScrollTo(I)Z

    .line 2120
    :cond_2
    :goto_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v2, 0x64

    if-ne v0, v2, :cond_3

    .line 2121
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->progressDlg:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_3

    .line 2122
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->progressDlg:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 2124
    :cond_3
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v2, 0x65

    if-ne v0, v2, :cond_4

    .line 2125
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 2126
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->progressDlg:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_4

    .line 2127
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->progressDlg:Landroid/app/ProgressDialog;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 2129
    :cond_4
    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v0, 0x66

    if-ne p1, v0, :cond_6

    .line 2130
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->progressDlg:Landroid/app/ProgressDialog;

    if-eqz p1, :cond_5

    .line 2131
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->progressDlg:Landroid/app/ProgressDialog;

    invoke-virtual {p1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 2132
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->onChangeChapter:Lcom/flyersoft/moonreaderp/PrefChapters$OnChangeChapter;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget v1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->imgChapter:I

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget v2, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->imgSplit:I

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->imgPos:I

    int-to-long v3, p1

    const/4 v5, 0x0

    invoke-interface/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefChapters$OnChangeChapter;->onGetChapter(IIJZ)V

    .line 2133
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$24;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->dismiss()V

    :cond_6
    return-void
.end method
