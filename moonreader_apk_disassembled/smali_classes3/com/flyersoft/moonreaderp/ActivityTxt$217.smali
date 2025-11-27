.class Lcom/flyersoft/moonreaderp/ActivityTxt$217;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowFailedAnnotInfo(Ljava/lang/String;)V
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

    .line 20092
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$217;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6

    .line 20094
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "/sdcard/Books/Pdf/"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object p2, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {p2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 20095
    new-instance p2, Ljava/io/File;

    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 20096
    invoke-virtual {p2}, Ljava/io/File;->isFile()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v2

    sget-object p2, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {p2}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v4

    cmp-long p2, v2, v4

    if-eqz p2, :cond_1

    .line 20097
    :cond_0
    sget-object p2, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {p2, p1, v1}, Lcom/flyersoft/tools/T;->copyFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 20099
    :cond_1
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 20100
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$217;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p2, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->saveLastPostion(Z)V

    .line 20101
    sget-object p2, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {p2}, Lcom/flyersoft/tools/A;->removeHistory(Ljava/lang/String;)V

    .line 20102
    sput-object p1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    .line 20103
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    .line 20104
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$217;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->saveLastPostion(Z)V

    .line 20105
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$217;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderToTxt()V

    :cond_2
    return-void
.end method
