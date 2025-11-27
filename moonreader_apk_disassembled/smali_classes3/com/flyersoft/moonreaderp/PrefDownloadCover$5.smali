.class Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;
.super Landroid/os/Handler;
.source "PrefDownloadCover.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefDownloadCover;->downloadFontFile(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

.field final synthetic val$dlg:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefDownloadCover;Landroid/os/Looper;Landroid/app/ProgressDialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 352
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->val$dlg:Landroid/app/ProgressDialog;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8

    .line 354
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 355
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iput-boolean v1, v0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttfDownloadStarted:Z

    .line 356
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->val$dlg:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 357
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->cancel()V

    .line 358
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-static {v0, v2, v3}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    .line 360
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_3

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->val$dlg:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_3

    .line 361
    iget v0, p1, Landroid/os/Message;->arg2:I

    const/4 v3, -0x1

    if-ne v0, v3, :cond_2

    iget v0, p1, Landroid/os/Message;->arg1:I

    sub-int/2addr v0, v2

    goto :goto_0

    :cond_2
    iget v0, p1, Landroid/os/Message;->arg2:I

    .line 362
    :goto_0
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->val$dlg:Landroid/app/ProgressDialog;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->download:I

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_tmp:Ljava/lang/String;

    .line 363
    invoke-static {v6}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object v5

    int-to-long v6, v0

    invoke-static {v5, v6, v7}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 362
    invoke-virtual {v3, v4}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 364
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->val$dlg:Landroid/app/ProgressDialog;

    invoke-virtual {v3, v0}, Landroid/app/ProgressDialog;->setMax(I)V

    .line 365
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->val$dlg:Landroid/app/ProgressDialog;

    iget v3, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 367
    :cond_3
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_e

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttfCancelled:Z

    if-nez p1, :cond_e

    .line 368
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iput-boolean v1, p1, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttfDownloadStarted:Z

    .line 369
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    .line 370
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    .line 371
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_tmp:Ljava/lang/String;

    const-string v3, ".zip"

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_tmp:Ljava/lang/String;

    const-string v3, ".rar"

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto/16 :goto_2

    .line 375
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_tmp:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 376
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-static {v3, v0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->-$$Nest$misTtfUrl(Lcom/flyersoft/moonreaderp/PrefDownloadCover;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 377
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_tmp:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v2}, Lcom/flyersoft/tools/T;->moveFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 378
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    goto :goto_1

    .line 379
    :cond_5
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_tmp:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/flyersoft/tools/A;->getDefaultFontFolder()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v2}, Lcom/flyersoft/tools/T;->moveFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 380
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/flyersoft/tools/A;->getDefaultFontFolder()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    :cond_6
    :goto_1
    move-object v0, v1

    goto :goto_3

    .line 372
    :cond_7
    :goto_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->-$$Nest$mgetTtfFontFile(Lcom/flyersoft/moonreaderp/PrefDownloadCover;)Ljava/lang/String;

    move-result-object v0

    .line 373
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->-$$Nest$mdeleteTtfTmpFile(Lcom/flyersoft/moonreaderp/PrefDownloadCover;)V

    .line 383
    :goto_3
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    const-string v3, ": "

    if-eqz v2, :cond_a

    .line 384
    new-instance v2, Ljava/io/File;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 385
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 386
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v2, v4, v6

    if-lez v2, :cond_8

    .line 388
    :try_start_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->tipTv:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v2

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    invoke-static {v4}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 389
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->tipTv:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->ttf_downloaded:I

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    invoke-static {v5}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception v0

    .line 391
    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    .line 392
    const-string v2, "Font not found"

    const-string v4, "Invalid font: "

    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 393
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iput-object v1, v2, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    goto :goto_4

    .line 396
    :cond_8
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 397
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iput-object v1, v2, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    goto :goto_4

    .line 400
    :cond_9
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iput-object v1, v2, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    .line 402
    :cond_a
    :goto_4
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->val$dlg:Landroid/app/ProgressDialog;

    if-eqz v1, :cond_b

    .line 403
    invoke-virtual {v1}, Landroid/app/ProgressDialog;->cancel()V

    .line 404
    :cond_b
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    if-nez v1, :cond_d

    .line 405
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iput-object p1, v1, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    .line 406
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->-$$Nest$mdeleteTtfTmpFile(Lcom/flyersoft/moonreaderp/PrefDownloadCover;)V

    if-nez v0, :cond_c

    .line 407
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->invalid_file:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 408
    :cond_c
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1, v0}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 410
    :cond_d
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->ttf_downloaded:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_e
    :goto_5
    return-void
.end method
