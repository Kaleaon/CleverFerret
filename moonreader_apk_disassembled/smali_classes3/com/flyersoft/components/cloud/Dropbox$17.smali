.class Lcom/flyersoft/components/cloud/Dropbox$17;
.super Ljava/lang/Object;
.source "Dropbox.java"

# interfaces
.implements Lio/reactivex/rxjava3/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Dropbox;->download(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;ZLcom/flyersoft/tools/T$OnResult;)V
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
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Dropbox;

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$files:Ljava/util/ArrayList;

.field final synthetic val$onDone:Lcom/flyersoft/tools/T$OnResult;

.field final synthetic val$openAfterDownload:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Dropbox;Landroid/content/Context;Ljava/util/ArrayList;ZLcom/flyersoft/tools/T$OnResult;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
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

    .line 653
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->val$con:Landroid/content/Context;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->val$files:Ljava/util/ArrayList;

    iput-boolean p4, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->val$openAfterDownload:Z

    iput-object p5, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 5

    .line 656
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->val$con:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->download:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget v1, v1, Lcom/flyersoft/components/cloud/Dropbox;->fileCount:I

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget v2, v2, Lcom/flyersoft/components/cloud/Dropbox;->fileCount:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 657
    instance-of v2, p1, Lcom/flyersoft/components/cloud/Cloud$Progress;

    if-eqz v2, :cond_0

    .line 658
    check-cast p1, Lcom/flyersoft/components/cloud/Cloud$Progress;

    .line 659
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n\n"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v3, p1, Lcom/flyersoft/components/cloud/Cloud$Progress;->progress:J

    invoke-static {v3, v4}, Lcom/flyersoft/tools/T;->formatSize(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v0, p1, Lcom/flyersoft/components/cloud/Cloud$Progress;->total:J

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->formatSize(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " ("

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v0, p1, Lcom/flyersoft/components/cloud/Cloud$Progress;->progress:J

    iget-wide v3, p1, Lcom/flyersoft/components/cloud/Cloud$Progress;->total:J

    invoke-static {v0, v1, v3, v4}, Lcom/flyersoft/tools/T;->getPercentStr(JJ)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 660
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->mDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_6

    .line 661
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->mDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    return-void

    .line 665
    :cond_0
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-nez p1, :cond_1

    .line 666
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Dropbox;->mDialog:Landroid/app/ProgressDialog;

    if-eqz v2, :cond_1

    .line 667
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Dropbox;->mDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v2, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_6

    .line 670
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->val$con:Landroid/content/Context;

    iget-object v2, p1, Lcom/flyersoft/components/cloud/Dropbox;->errorMsg:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Lcom/flyersoft/components/cloud/Dropbox;->afterFinish(Landroid/content/Context;Ljava/lang/String;)V

    .line 671
    iget-boolean p1, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->val$openAfterDownload:Z

    if-eqz p1, :cond_5

    .line 672
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 674
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    if-eqz v0, :cond_2

    .line 675
    invoke-interface {v0, p1}, Lcom/flyersoft/tools/T$OnResult;->done(Ljava/lang/Object;)V

    return-void

    .line 677
    :cond_2
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    .line 679
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".zip"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "fb2.zip"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 680
    sget v0, Lcom/flyersoft/tools/A;->lastTab:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_6

    .line 681
    sput-object p1, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    .line 682
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFilesCloudIndicator(ZI)V

    return-void

    .line 685
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->openFile(Ljava/lang/String;)V

    return-void

    .line 688
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$17;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget-object v0, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->showFileList(Ljava/lang/String;)V

    :cond_6
    :goto_0
    return-void
.end method
