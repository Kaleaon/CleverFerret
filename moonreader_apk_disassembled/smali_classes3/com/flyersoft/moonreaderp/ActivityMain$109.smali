.class Lcom/flyersoft/moonreaderp/ActivityMain$109;
.super Ljava/lang/Thread;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->addBatchBooksToShelfThread(Ljava/util/ArrayList;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$fav:Ljava/lang/String;

.field final synthetic val$files:Ljava/util/ArrayList;

.field final synthetic val$fromAddFilesToFavrotie:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/util/ArrayList;ZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 9638
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->val$files:Ljava/util/ArrayList;

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->val$fromAddFilesToFavrotie:Z

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->val$fav:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 9641
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9643
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 9644
    invoke-static {v2}, Lcom/flyersoft/tools/A;->isReadableFile(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 9645
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 9649
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 9653
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->importedBookFiles:Ljava/util/ArrayList;

    .line 9654
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->beginTransition()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 9655
    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x5

    const/4 v6, 0x1

    if-ge v2, v4, :cond_b

    .line 9656
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->isFinishing()Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_2

    .line 9658
    :cond_2
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetstopFileOperation(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 9659
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->endTransition()V

    .line 9660
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->importedBookFiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 9661
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    iget-boolean v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->val$fromAddFilesToFavrotie:Z

    xor-int/2addr v3, v6

    invoke-virtual {v2, v5, v3, v1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_3
    :goto_2
    return-void

    .line 9666
    :cond_4
    :try_start_1
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 9667
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    invoke-virtual {v5, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 9668
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v9, v2, 0x1

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9669
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, "] "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 9668
    invoke-virtual {v7, v1, v8}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 9671
    invoke-static {v4}, Lcom/flyersoft/tools/BookDb;->getBook(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v5

    .line 9672
    iget-boolean v7, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->val$fromAddFilesToFavrotie:Z

    if-eqz v5, :cond_5

    .line 9674
    iget-object v4, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->val$fav:Ljava/lang/String;

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    add-int/lit8 v3, v3, 0x1

    .line 9676
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->val$fav:Ljava/lang/String;

    iput-object v4, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    .line 9677
    invoke-static {v5, v1}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    goto :goto_3

    .line 9680
    :cond_5
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->val$fav:Ljava/lang/String;

    invoke-static {v5, v4, v6}, Lcom/flyersoft/tools/BookDb;->createBookInfoFromFile(Ljava/lang/String;Ljava/lang/String;Z)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v5

    if-eqz v5, :cond_6

    add-int/lit8 v3, v3, 0x1

    :cond_6
    const/4 v7, 0x1

    :cond_7
    :goto_3
    if-lez v3, :cond_8

    .line 9686
    rem-int/lit8 v4, v3, 0x5

    if-nez v4, :cond_8

    .line 9687
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->endTransition()V

    .line 9688
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->beginTransition()V

    :cond_8
    if-eqz v5, :cond_9

    if-eqz v7, :cond_9

    .line 9692
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->importedBookFiles:Ljava/util/ArrayList;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9695
    :cond_9
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->val$fav:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_a

    .line 9696
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v4, v1}, Lcom/flyersoft/tools/A;->updateWidget(Landroid/content/Context;Z)V
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    :catch_1
    move-exception v4

    .line 9701
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v7, "**ERROR BOOK***(2) "

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, " "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v5, v6, v1

    invoke-static {v6}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 9702
    invoke-static {v4}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :catch_2
    :cond_a
    :goto_4
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    .line 9705
    :cond_b
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->endTransition()V

    .line 9707
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    iget-boolean v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$109;->val$fromAddFilesToFavrotie:Z

    xor-int/2addr v3, v6

    invoke-virtual {v2, v5, v3, v1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
