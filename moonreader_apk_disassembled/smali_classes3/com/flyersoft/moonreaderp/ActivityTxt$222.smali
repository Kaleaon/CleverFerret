.class Lcom/flyersoft/moonreaderp/ActivityTxt$222;
.super Ljava/lang/Thread;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->preNextChapter(Z)V
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

    .line 20488
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$222;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 20491
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$222;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputpreNextInProgress(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    const/4 v0, 0x0

    .line 20493
    :try_start_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$222;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isFinishing()Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    .line 20506
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$222;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputpreNextInProgress(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return-void

    .line 20495
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$222;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetpreNextChapterSplit(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v2

    if-lez v2, :cond_2

    .line 20496
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$222;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-object v3, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$222;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->createHtmlBookImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    move-result-object v3

    goto :goto_1

    :cond_1
    sget-object v3, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v3}, Lcom/flyersoft/books/BaseEBook;->getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    move-result-object v3

    :goto_1
    invoke-static {v2, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputimageGetter(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;)V

    .line 20497
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$222;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-object v3, Lcom/flyersoft/tools/A;->splitHtmls:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$222;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetpreNextChapterSplit(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputpreNextHtmlSrc(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V

    .line 20498
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$222;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetpreNextHtmlSrc(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$222;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetimageGetter(Lcom/flyersoft/moonreaderp/ActivityTxt;)Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    move-result-object v4

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$222;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v5}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetpreNextChapterId(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v5

    invoke-static {v3, v4, v5}, Lcom/flyersoft/staticlayout/MyHtml;->fromHtml(Ljava/lang/String;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;I)Landroid/text/Spanned;

    move-result-object v3

    invoke-static {v2, v3, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msavePreNextChapterText(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/CharSequence;Z)V

    .line 20499
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$222;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-object v2, Lcom/flyersoft/tools/A;->splitHtmls:Ljava/util/ArrayList;

    invoke-static {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputpreNextSplitHtmls(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/util/ArrayList;)V

    goto :goto_0

    .line 20501
    :cond_2
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$222;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgenerateChapterText(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_2

    :catch_0
    move-exception v1

    .line 20504
    :try_start_2
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 20506
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$222;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputpreNextInProgress(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return-void

    :goto_2
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$222;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputpreNextInProgress(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 20507
    throw v1
.end method
