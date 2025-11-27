.class Lcom/flyersoft/components/cloud/Ftp$20;
.super Ljava/lang/Object;
.source "Ftp.java"

# interfaces
.implements Lio/reactivex/rxjava3/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Ftp;->dir(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/rxjava3/functions/Consumer<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Ftp;

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$onDone:Lcom/flyersoft/tools/T$OnResult;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Ftp;Lcom/flyersoft/tools/T$OnResult;Landroid/content/Context;)V
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

    .line 919
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Ftp$20;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Ftp$20;->val$con:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 14

    .line 922
    instance-of v0, p1, Ljava/lang/Throwable;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 923
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {p1}, Lcom/flyersoft/components/cloud/Ftp;->disconnect()V

    .line 924
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$20;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$20;->val$con:Landroid/content/Context;

    :goto_0
    iget-object v0, p1, Lcom/flyersoft/components/cloud/Ftp;->errorMsg:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/components/cloud/Ftp;->afterFinish(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 927
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$20;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    const-string v2, "/"

    const/4 v3, 0x0

    if-eqz v0, :cond_5

    .line 928
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->isError(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 929
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 930
    check-cast p1, [Lorg/apache/commons/net/ftp/FTPFile;

    .line 931
    array-length v1, p1

    :goto_1
    if-ge v3, v1, :cond_3

    aget-object v4, p1, v3

    .line 932
    invoke-virtual {v4}, Lorg/apache/commons/net/ftp/FTPFile;->isDirectory()Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v4}, Lorg/apache/commons/net/ftp/FTPFile;->getSize()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v9, v5, v7

    if-lez v9, :cond_2

    iget-object v5, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v4}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mavailableName(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 933
    invoke-virtual {v4}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/flyersoft/tools/T$FileItem;

    .line 934
    invoke-virtual {v4}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v10, v9, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    invoke-static {v9, v10}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 935
    invoke-virtual {v4}, Lorg/apache/commons/net/ftp/FTPFile;->getTimestamp()Ljava/util/Calendar;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v10

    invoke-virtual {v4}, Lorg/apache/commons/net/ftp/FTPFile;->getSize()J

    move-result-wide v12

    const/4 v9, -0x1

    invoke-direct/range {v6 .. v13}, Lcom/flyersoft/tools/T$FileItem;-><init>(Ljava/lang/String;Ljava/lang/String;IJJ)V

    .line 933
    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 936
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$20;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    invoke-interface {p1, v0}, Lcom/flyersoft/tools/T$OnResult;->done(Ljava/lang/Object;)V

    return-void

    .line 938
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$20;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    invoke-interface {p1, v1}, Lcom/flyersoft/tools/T$OnResult;->done(Ljava/lang/Object;)V

    return-void

    .line 942
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$20;->val$con:Landroid/content/Context;

    iget-object v4, v0, Lcom/flyersoft/components/cloud/Ftp;->errorMsg:Ljava/lang/String;

    invoke-virtual {v0, v1, v4}, Lcom/flyersoft/components/cloud/Ftp;->afterFinish(Landroid/content/Context;Ljava/lang/String;)V

    .line 944
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->isError(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Ftp;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_a

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Ftp;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    if-eqz v0, :cond_a

    .line 945
    check-cast p1, [Lorg/apache/commons/net/ftp/FTPFile;

    .line 946
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->FTP_TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/A;->lastFtpPath:Ljava/lang/String;

    .line 947
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Ftp;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->setPathText()V

    .line 949
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Ftp;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    .line 950
    array-length v0, p1

    :goto_2
    if-ge v3, v0, :cond_9

    aget-object v1, p1, v3

    .line 951
    sget-boolean v4, Lcom/flyersoft/tools/A;->showHiddenFiles:Z

    if-nez v4, :cond_6

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    goto :goto_4

    .line 953
    :cond_6
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mavailableName(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_7

    goto :goto_4

    .line 955
    :cond_7
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v4, v4, Lcom/flyersoft/components/cloud/Ftp;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    new-instance v5, Lcom/flyersoft/tools/T$FileItem;

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v9, v8, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    .line 956
    invoke-static {v8, v9}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 957
    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->isDirectory()Z

    move-result v8

    if-eqz v8, :cond_8

    sget v8, Lcom/flyersoft/moonreaderp/R$drawable;->iconfolder:I

    goto :goto_3

    :cond_8
    const/4 v8, -0x1

    .line 958
    :goto_3
    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->getTimestamp()Ljava/util/Calendar;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v9

    .line 959
    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->getSize()J

    move-result-wide v11

    invoke-direct/range {v5 .. v12}, Lcom/flyersoft/tools/T$FileItem;-><init>(Ljava/lang/String;Ljava/lang/String;IJJ)V

    .line 955
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_9
    const/16 p1, 0x8

    .line 962
    sput p1, Lcom/flyersoft/tools/A;->files_type:I

    .line 963
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Ftp;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Ftp;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    sget v1, Lcom/flyersoft/tools/A;->files_sort_by:I

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->sortFileLv(Ljava/util/ArrayList;I)V

    .line 964
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Ftp;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/Ftp;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 965
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$20;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Ftp;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget-object v0, Lcom/flyersoft/tools/A;->lastFtpPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLvSetSelection(Ljava/lang/String;)Z

    :cond_a
    return-void
.end method
