.class Lcom/flyersoft/components/cloud/Dropbox$19;
.super Ljava/lang/Object;
.source "Dropbox.java"

# interfaces
.implements Lio/reactivex/rxjava3/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Dropbox;->upload(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;ZZ)V
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


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Dropbox;Landroid/content/Context;Ljava/util/ArrayList;)V
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

    .line 766
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$19;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Dropbox$19;->val$con:Landroid/content/Context;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Dropbox$19;->val$files:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 5

    .line 769
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$19;->val$con:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->upload:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$19;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget v1, v1, Lcom/flyersoft/components/cloud/Dropbox;->fileCount:I

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$19;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$19;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget v2, v2, Lcom/flyersoft/components/cloud/Dropbox;->fileCount:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$19;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 770
    instance-of v2, p1, Lcom/flyersoft/components/cloud/Cloud$Progress;

    if-eqz v2, :cond_0

    .line 771
    check-cast p1, Lcom/flyersoft/components/cloud/Cloud$Progress;

    .line 772
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

    .line 773
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$19;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->mDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_2

    .line 774
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$19;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->mDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    return-void

    .line 778
    :cond_0
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-nez p1, :cond_1

    .line 779
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$19;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/Dropbox;->mDialog:Landroid/app/ProgressDialog;

    if-eqz v1, :cond_1

    .line 780
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$19;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/Dropbox;->mDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 783
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$19;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$19;->val$con:Landroid/content/Context;

    iget-object v1, p1, Lcom/flyersoft/components/cloud/Dropbox;->errorMsg:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/cloud/Dropbox;->afterFinish(Landroid/content/Context;Ljava/lang/String;)V

    .line 784
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$19;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$19;->val$con:Landroid/content/Context;

    sget-object v1, Lcom/flyersoft/tools/A;->lastDropboxPath:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/cloud/Dropbox;->dir(Landroid/content/Context;Ljava/lang/String;)V

    :cond_2
    return-void
.end method
