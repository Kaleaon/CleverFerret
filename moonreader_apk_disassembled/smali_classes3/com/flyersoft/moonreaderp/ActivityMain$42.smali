.class Lcom/flyersoft/moonreaderp/ActivityMain$42;
.super Ljava/lang/Thread;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->rebuildCoverThread(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 4160
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 4165
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfBooks:Ljava/util/ArrayList;

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 4166
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_10

    .line 4168
    :try_start_0
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    .line 4169
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v7, v2, 0x1

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4170
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "] "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 4169
    invoke-virtual {v5, v1, v6}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 4172
    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 4173
    const-string v5, ".epub"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const/4 v6, 0x1

    if-nez v5, :cond_e

    const-string v5, ".epub3"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_e

    invoke-static {v4}, Lcom/flyersoft/tools/A;->isMobiExt(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto/16 :goto_5

    .line 4175
    :cond_0
    const-string v5, ".fb2"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_d

    const-string v5, ".fb2.zip"

    invoke-virtual {v3, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto/16 :goto_4

    .line 4177
    :cond_1
    const-string v5, ".umd"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    goto/16 :goto_6

    .line 4179
    :cond_2
    const-string v5, ".chm"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    goto/16 :goto_6

    .line 4181
    :cond_3
    const-string v5, ".docx"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    const-string v5, ".odt"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    goto/16 :goto_3

    .line 4183
    :cond_4
    const-string v5, ".rtf"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    goto/16 :goto_6

    .line 4185
    :cond_5
    const-string v5, ".md"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    goto/16 :goto_6

    .line 4187
    :cond_6
    const-string v5, ".mht"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_f

    const-string v5, ".mhtml"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    goto/16 :goto_6

    .line 4190
    :cond_7
    const-string v5, ".pdf"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/4 v6, 0x0

    if-eqz v5, :cond_8

    .line 4192
    :try_start_1
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v5}, Lcom/radaee/pdf/Global;->Init(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 4193
    new-instance v5, Lcom/radaee/pdf/Document;

    invoke-direct {v5}, Lcom/radaee/pdf/Document;-><init>()V

    .line 4194
    const-string v7, ""

    invoke-virtual {v5, v3, v7}, Lcom/radaee/pdf/Document;->Open(Ljava/lang/String;Ljava/lang/String;)I

    move-result v7

    if-nez v7, :cond_8

    .line 4195
    invoke-static {v5, v1, v6}, Lcom/flyersoft/books/PDFReader;->createBitmapOfPdfPage(Lcom/radaee/pdf/Document;ILandroid/util/DisplayMetrics;)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 4196
    invoke-static {v5, v3, v1}, Lcom/flyersoft/tools/A;->generateBookCovers(Landroid/graphics/Bitmap;Ljava/lang/String;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v5

    .line 4200
    :try_start_2
    invoke-static {v5}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 4203
    :cond_8
    :goto_1
    const-string v5, ".djvu"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz v5, :cond_9

    .line 4205
    :try_start_3
    new-instance v5, Lorg/djvu/DDocument;

    invoke-direct {v5}, Lorg/djvu/DDocument;-><init>()V

    .line 4206
    invoke-virtual {v5, v3, v6, v1}, Lorg/djvu/DDocument;->Open(Ljava/lang/String;Landroid/os/Handler;I)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_9

    .line 4207
    invoke-static {v5, v1, v6}, Lcom/flyersoft/books/PDFReader;->createBitmapOfDjvuPage(Lorg/djvu/DDocument;ILandroid/util/DisplayMetrics;)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 4208
    invoke-static {v5, v3, v1}, Lcom/flyersoft/tools/A;->generateBookCovers(Landroid/graphics/Bitmap;Ljava/lang/String;Z)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v5

    .line 4211
    :try_start_4
    invoke-static {v5}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 4214
    :cond_9
    :goto_2
    const-string v5, ".cbz"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_a

    const-string v5, ".cbr"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 4215
    :cond_a
    invoke-static {v3, v6, v6}, Lcom/flyersoft/tools/compress/BaseCompressor;->createCbzBookCover(Ljava/lang/String;Lcom/flyersoft/tools/compress/BaseCompressor;Ljava/lang/String;)V

    .line 4218
    :cond_b
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetstopFileOperation(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    move-result v3

    if-eqz v3, :cond_f

    goto :goto_7

    .line 4182
    :cond_c
    :goto_3
    new-instance v4, Lcom/flyersoft/books/Docx;

    invoke-direct {v4, v3, v6}, Lcom/flyersoft/books/Docx;-><init>(Ljava/lang/String;Z)V

    goto :goto_6

    .line 4176
    :cond_d
    :goto_4
    new-instance v4, Lcom/flyersoft/books/Fb2;

    invoke-direct {v4, v3, v6}, Lcom/flyersoft/books/Fb2;-><init>(Ljava/lang/String;Z)V

    goto :goto_6

    .line 4174
    :cond_e
    :goto_5
    new-instance v4, Lcom/flyersoft/books/Epub;

    invoke-direct {v4, v3, v6}, Lcom/flyersoft/books/Epub;-><init>(Ljava/lang/String;Z)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_6

    :catchall_2
    move-exception v3

    .line 4223
    invoke-static {v3}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_f
    :goto_6
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 4226
    :cond_10
    :goto_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    const/16 v1, 0x14

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method
