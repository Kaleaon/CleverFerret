.class Lcom/flyersoft/moonreaderp/ActivityTxt$212;
.super Ljava/lang/Thread;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfSaveReadStatistics()V
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

    .line 19609
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$212;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 19613
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$212;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetpdfStatisticsPages(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/util/ArrayList;

    move-result-object v0

    if-nez v0, :cond_0

    .line 19614
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$212;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputpdfStatisticsPages(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/util/ArrayList;)V

    .line 19615
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$212;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->turnedPages:Ljava/util/ArrayList;

    sget-wide v1, Lcom/flyersoft/tools/A;->lastPosition:J

    long-to-int v2, v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 19616
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$212;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->turnedPages:Ljava/util/ArrayList;

    sget-wide v2, Lcom/flyersoft/tools/A;->lastPosition:J

    long-to-int v3, v2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19617
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$212;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->turnedPages:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 19618
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$212;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetpdfStatisticsPages(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v4

    if-ne v4, v1, :cond_2

    .line 19619
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$212;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetpdfStatisticsPages(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19620
    sget-wide v4, Lcom/flyersoft/tools/A;->statistics_pages:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    sput-wide v4, Lcom/flyersoft/tools/A;->statistics_pages:J

    .line 19621
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$212;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v2, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfGetPageText(I)Ljava/lang/String;

    move-result-object v2

    .line 19622
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2

    .line 19623
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$212;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v3, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$maddStatisticsWords(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V

    goto :goto_0

    .line 19625
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$212;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->turnedPages:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 19627
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method
