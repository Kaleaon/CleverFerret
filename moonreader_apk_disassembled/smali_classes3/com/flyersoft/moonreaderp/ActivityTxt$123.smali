.class Lcom/flyersoft/moonreaderp/ActivityTxt$123;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefChapters$OnChangeChapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->do_show_chapters(I)V
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

    .line 12862
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetChapter(IIJZ)V
    .locals 3

    .line 12864
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->saveLinkBackInfo(Z)Lcom/flyersoft/moonreaderp/ActivityTxt$LINK_BACK;

    const/4 v0, 0x0

    if-eqz p5, :cond_1

    .line 12866
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 12867
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfToc:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->pageNumber:I

    int-to-long p1, p1

    sput-wide p1, Lcom/flyersoft/tools/A;->lastPosition:J

    .line 12868
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-wide p2, Lcom/flyersoft/tools/A;->lastPosition:J

    long-to-int p3, p2

    sget p2, Lcom/radaee/pdf/Global;->def_view:I

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p1, p3, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfGotoPage(IZ)V

    .line 12869
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showReadProgress(I)V

    return-void

    .line 12874
    :cond_1
    sput p2, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    .line 12875
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result p2

    if-eqz p2, :cond_8

    if-eq p2, v1, :cond_8

    const/4 p5, 0x7

    if-eq p2, p5, :cond_5

    const/16 p5, 0x64

    if-eq p2, p5, :cond_2

    goto/16 :goto_3

    .line 12888
    :cond_2
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetoldPriorSplitHtmls(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/util/ArrayList;

    move-result-object p2

    if-eqz p2, :cond_3

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetoldPriorSplitHtmls(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-le p2, v1, :cond_3

    .line 12889
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 p5, 0x0

    invoke-static {p2, p5}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputoldPriorChapterText(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/CharSequence;)V

    .line 12890
    :cond_3
    sput p1, Lcom/flyersoft/tools/A;->lastChapter:I

    .line 12891
    sput-wide p3, Lcom/flyersoft/tools/A;->lastPosition:J

    .line 12892
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mclearTxtView(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 12893
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    .line 12894
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget p2, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$misBigChapter(Lcom/flyersoft/moonreaderp/ActivityTxt;I)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 12895
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-object p2, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    sget p3, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-virtual {p2, p3}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object p2

    iget-object p2, p2, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcreateProgressDlg(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V

    .line 12896
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputebookPageUp(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 12897
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mreloadBook(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto :goto_3

    .line 12901
    :cond_5
    sput-wide p3, Lcom/flyersoft/tools/A;->lastPosition:J

    .line 12902
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-wide p2, Lcom/flyersoft/tools/A;->lastPosition:J

    long-to-int p3, p2

    sget p2, Lcom/radaee/pdf/Global;->def_view:I

    if-eqz p2, :cond_6

    goto :goto_1

    :cond_6
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {p1, p3, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfGotoPage(IZ)V

    .line 12903
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfReflow()Z

    move-result p1

    if-eqz p1, :cond_7

    sget p1, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    const/16 p2, 0x2710

    if-ne p1, p2, :cond_7

    .line 12904
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget p2, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtScrollByDelay(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 12905
    :cond_7
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->updateProgressStatus()V

    .line 12906
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->resetFlipCache()V

    goto :goto_3

    :cond_8
    if-nez p5, :cond_9

    goto :goto_2

    .line 12879
    :cond_9
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/tools/A$TxTChapter;

    invoke-virtual {p2, p1}, Lcom/flyersoft/tools/A$TxTChapter;->getDisplayPosition(I)J

    move-result-wide p3

    :goto_2
    sput-wide p3, Lcom/flyersoft/tools/A;->lastPosition:J

    .line 12880
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result p1

    if-nez p1, :cond_a

    if-nez p5, :cond_a

    .line 12881
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-wide p2, Lcom/flyersoft/tools/A;->lastPosition:J

    invoke-static {p1, p2, p3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mfixTxtNoteOffset(Lcom/flyersoft/moonreaderp/ActivityTxt;J)J

    move-result-wide p1

    sput-wide p1, Lcom/flyersoft/tools/A;->lastPosition:J

    .line 12882
    :cond_a
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mreloadBook(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 12883
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcheckStatusBar(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 12884
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->resetFlipCache()V

    .line 12909
    :goto_3
    sget-boolean p1, Lcom/flyersoft/tools/A;->immersive_fullscreen:Z

    if-eqz p1, :cond_b

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dualPageEnabled()Z

    move-result p1

    if-eqz p1, :cond_b

    .line 12910
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$123;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const/16 p2, 0x3b6

    const-wide/16 p3, 0x1f4

    invoke-virtual {p1, p2, p3, p4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_b
    return-void
.end method
