.class Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;
.super Ljava/lang/Object;
.source "PrefDownloadCover.java"

# interfaces
.implements Ljava/lang/Runnable;


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

.field final synthetic val$fullHandler:Landroid/os/Handler;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefDownloadCover;Ljava/lang/String;Landroid/os/Handler;)V
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

    .line 415
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->val$url:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->val$fullHandler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private setConnProperties(Ljava/net/URLConnection;)V
    .locals 2

    const/16 v0, 0x2710

    .line 498
    invoke-virtual {p1, v0}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 499
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb_url:Ljava/lang/String;

    const-string v1, "Referer"

    invoke-virtual {p1, v1, v0}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 500
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb_cookie:Ljava/lang/String;

    const-string v1, "Cookie"

    invoke-virtual {p1, v1, v0}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 501
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb_agent:Ljava/lang/String;

    const-string v1, "User-Agent"

    invoke-virtual {p1, v1, v0}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .line 417
    const-string v0, "\""

    const-string v1, "filename="

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttfCancelled:Z

    .line 418
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    const/4 v4, 0x1

    iput-boolean v4, v2, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttfDownloadStarted:Z

    .line 420
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->val$url:Ljava/lang/String;

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    add-int/2addr v7, v4

    invoke-virtual {v5, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v2, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_tmp:Ljava/lang/String;

    const/4 v2, 0x0

    .line 424
    :try_start_0
    new-instance v5, Ljava/net/URL;

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->val$url:Ljava/lang/String;

    invoke-direct {v5, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    .line 425
    invoke-direct {p0, v5}, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->setConnProperties(Ljava/net/URLConnection;)V

    .line 427
    invoke-virtual {v5}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v7

    .line 429
    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move-object v8, v2

    move-object v9, v8

    :cond_0
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    const/4 v11, -0x1

    if-eqz v10, :cond_6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Map$Entry;

    .line 430
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "header:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v10}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v13, " "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v10}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    new-array v13, v4, [Ljava/lang/Object;

    aput-object v12, v13, v3

    invoke-static {v13}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 431
    invoke-interface {v10}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 432
    const-string v13, "]"

    if-eqz v12, :cond_3

    :try_start_1
    invoke-virtual {v12, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v14

    if-eq v14, v11, :cond_3

    .line 433
    invoke-virtual {v12, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    add-int/lit8 v9, v9, 0x9

    invoke-virtual {v12, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    .line 434
    invoke-virtual {v9, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 435
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v11

    invoke-virtual {v9, v4, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 436
    :cond_1
    :goto_1
    const-string v11, ";"

    invoke-virtual {v9, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_2

    invoke-virtual {v9, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_2

    invoke-virtual {v9, v13}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 437
    :cond_2
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v11

    sub-int/2addr v11, v4

    invoke-virtual {v9, v3, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    goto :goto_1

    .line 439
    :cond_3
    invoke-interface {v10}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_0

    invoke-interface {v10}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    const-string v11, "Location"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 440
    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 441
    :goto_2
    const-string v10, "["

    invoke-virtual {v8, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 442
    invoke-virtual {v8, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    goto :goto_2

    .line 443
    :cond_4
    :goto_3
    invoke-virtual {v8, v13}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 444
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v10

    sub-int/2addr v10, v4

    invoke-virtual {v8, v3, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    goto :goto_3

    .line 445
    :cond_5
    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_0

    :cond_6
    if-eqz v8, :cond_7

    .line 450
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "----------redirection to: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v1, v4, [Ljava/lang/Object;

    aput-object v0, v1, v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 451
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    .line 452
    invoke-direct {p0, v5}, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->setConnProperties(Ljava/net/URLConnection;)V

    :cond_7
    if-eqz v9, :cond_8

    .line 455
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-static {v0, v9}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->-$$Nest$misTtfUrl(Lcom/flyersoft/moonreaderp/PrefDownloadCover;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 456
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iput-object v9, v0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_tmp:Ljava/lang/String;

    .line 457
    :cond_8
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_tmp:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->-$$Nest$misTtfUrl(Lcom/flyersoft/moonreaderp/PrefDownloadCover;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 458
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->val$fullHandler:Landroid/os/Handler;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->no_ttf_found:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ": "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_tmp:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    .line 461
    :cond_9
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "/sdcard/"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_tmp:Ljava/lang/String;

    invoke-static {v7}, Lcom/flyersoft/tools/T;->deleteSpecialChar(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_tmp:Ljava/lang/String;

    .line 462
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "*save to:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_tmp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v1, v4, [Ljava/lang/Object;

    aput-object v0, v1, v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 464
    invoke-virtual {v5}, Ljava/net/URLConnection;->getContentLength()I

    move-result v0

    .line 465
    invoke-virtual {v5}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    const/16 v5, 0x2000

    .line 468
    new-array v5, v5, [B

    .line 470
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_tmp:Ljava/lang/String;

    invoke-static {v7}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v2

    const/4 v7, 0x0

    .line 471
    :goto_4
    invoke-virtual {v1, v5}, Ljava/io/InputStream;->read([B)I

    move-result v8

    if-eq v8, v11, :cond_b

    .line 472
    iget-object v9, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-boolean v9, v9, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttfCancelled:Z

    if-eqz v9, :cond_a

    .line 473
    new-array v0, v4, [Ljava/lang/Object;

    const-string v1, "--------download cancelled-------"

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 474
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iput-boolean v3, v0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttfDownloadStarted:Z

    .line 475
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->-$$Nest$mdeleteTtfTmpFile(Lcom/flyersoft/moonreaderp/PrefDownloadCover;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_c

    .line 490
    :try_start_2
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    return-void

    .line 478
    :cond_a
    :try_start_3
    invoke-virtual {v2, v5, v3, v8}, Ljava/io/OutputStream;->write([BII)V

    add-int/2addr v7, v8

    .line 480
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    new-array v9, v4, [Ljava/lang/Object;

    aput-object v8, v9, v3

    invoke-static {v9}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 481
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->val$fullHandler:Landroid/os/Handler;

    invoke-virtual {v8, v4, v7, v0}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_4

    .line 483
    :cond_b
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->val$fullHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v2, :cond_c

    .line 490
    :try_start_4
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    return-void

    :catchall_0
    move-exception v0

    goto :goto_6

    :catch_0
    move-exception v0

    .line 485
    :try_start_5
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 486
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;->val$fullHandler:Landroid/os/Handler;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz v2, :cond_c

    .line 490
    :try_start_6
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_5

    :catch_1
    move-exception v0

    .line 492
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_c
    :goto_5
    return-void

    :goto_6
    if-eqz v2, :cond_d

    .line 490
    :try_start_7
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_7

    :catch_2
    move-exception v1

    .line 492
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 494
    :cond_d
    :goto_7
    throw v0
.end method
