.class public Lcom/flyersoft/components/cloud/webdav/WebDavFile;
.super Ljava/lang/Object;
.source "WebDavFile.java"


# static fields
.field private static final DIR:Ljava/lang/String; = "<?xml version=\"1.0\"?>\n<a:propfind xmlns:a=\"DAV:\">\n<a:prop>\n<a:displayname/>\n<a:resourcetype/>\n<a:getcontentlength/>\n<a:creationdate/>\n<a:getlastmodified/>\n%s</a:prop>\n</a:propfind>"


# instance fields
.field public code:I

.field dir400:Z

.field private displayName:Ljava/lang/String;

.field public err:Ljava/lang/String;

.field private exists:Ljava/lang/Boolean;

.field private httpUrl:Ljava/lang/String;

.field private isDirectory:Z

.field private lastModified:J

.field private okHttpClient:Lokhttp3/OkHttpClient;

.field private size:J

.field private url:Ljava/net/URL;

.field private url_Str:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    sget-object v0, Lcom/flyersoft/tools/A;->WEBDAV_TAG:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    sget-object v0, Lcom/flyersoft/tools/A;->WEBDAV_TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 59
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->getWebDavUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 60
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 61
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 63
    :cond_1
    iput-object p1, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->url_Str:Ljava/lang/String;

    .line 64
    new-instance v0, Ljava/net/URL;

    const/4 v1, 0x0

    sget-object v2, Lcom/flyersoft/components/cloud/webdav/http/WHandler;->HANDLER:Ljava/net/URLStreamHandler;

    invoke-direct {v0, v1, p1, v2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;Ljava/net/URLStreamHandler;)V

    iput-object v0, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->url:Ljava/net/URL;

    .line 81
    invoke-static {}, Lcom/flyersoft/components/cloud/webdav/http/WHttp;->getInstance()Lcom/flyersoft/components/cloud/webdav/http/WHttp;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/cloud/webdav/http/WHttp;->client()Lokhttp3/OkHttpClient;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->okHttpClient:Lokhttp3/OkHttpClient;

    .line 82
    sget-boolean p1, Lcom/flyersoft/components/cloud/webdav/http/WHttp;->dir400Append:Z

    iput-boolean p1, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->dir400:Z

    return-void
.end method

.method private execRequest(Lokhttp3/Request$Builder;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 498
    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->setAuthorization(Lokhttp3/Request$Builder;)V

    .line 499
    iget-object v0, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->okHttpClient:Lokhttp3/OkHttpClient;

    invoke-virtual {p1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p1

    invoke-virtual {v0, p1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object p1

    invoke-interface {p1}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object p1

    .line 500
    invoke-virtual {p1}, Lokhttp3/Response;->code()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->code:I

    .line 502
    invoke-virtual {p1}, Lokhttp3/Response;->isSuccessful()Z

    move-result v0

    if-nez v0, :cond_0

    .line 503
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->code:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " | "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lokhttp3/Response;->message()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private fixDir400(Lokhttp3/Response;Ljava/util/ArrayList;Z)Lokhttp3/Response;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/Response;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;Z)",
            "Lokhttp3/Response;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_2

    .line 173
    invoke-virtual {p1}, Lokhttp3/Response;->code()I

    move-result v0

    const/16 v1, 0x190

    if-ne v0, v1, :cond_2

    if-eqz p3, :cond_0

    iget-boolean p3, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->dir400:Z

    if-nez p3, :cond_2

    :cond_0
    const/4 p1, 0x1

    .line 174
    iput-boolean p1, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->dir400:Z

    .line 175
    invoke-direct {p0, p2, p1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->propFindResponse(Ljava/util/ArrayList;Z)Lokhttp3/Response;

    move-result-object p2

    .line 177
    invoke-virtual {p2}, Lokhttp3/Response;->isSuccessful()Z

    move-result p3

    if-eqz p3, :cond_1

    .line 178
    sput-boolean p1, Lcom/flyersoft/components/cloud/webdav/http/WHttp;->dir400Append:Z

    :cond_1
    return-object p2

    :cond_2
    return-object p1
.end method

.method private lastModifiedToLong(Ljava/lang/String;)J
    .locals 5

    .line 275
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_0

    return-wide v1

    .line 280
    :cond_0
    :try_start_0
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v3, "EEE, dd MMM yyyy HH:mm:ss \'GMT\'"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 282
    invoke-virtual {v0, p1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object p1

    .line 283
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    move-exception p1

    .line 285
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-wide v1
.end method

.method private parseDir(Ljava/lang/String;Z)Ljava/util/List;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/cloud/webdav/WebDavFile;",
            ">;"
        }
    .end annotation

    .line 219
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 220
    invoke-static/range {p1 .. p1}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    .line 223
    const-string v2, "d:response"

    invoke-virtual {v0, v2}, Lorg/jsoup/nodes/Document;->getElementsByTag(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v2

    .line 224
    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 225
    const-string v2, "a:response"

    invoke-virtual {v0, v2}, Lorg/jsoup/nodes/Document;->getElementsByTag(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v2

    .line 226
    const-string v0, "a"

    goto :goto_0

    .line 224
    :cond_0
    const-string v0, "d"

    :goto_0
    move-object v15, v2

    move-object v2, v0

    move-object v0, v15

    .line 229
    invoke-virtual/range {p0 .. p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual/range {p0 .. p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p0 .. p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 231
    :goto_1
    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 232
    const-string v6, ":href"

    invoke-virtual {v2, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Lorg/jsoup/nodes/Element;->getElementsByTag(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lorg/jsoup/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jsoup/nodes/Element;

    invoke-virtual {v6}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v6

    .line 233
    invoke-virtual {v6, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 234
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    :cond_2
    if-eqz p2, :cond_4

    .line 235
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_3

    goto :goto_3

    :cond_3
    move-object/from16 v6, p0

    goto :goto_2

    .line 237
    :cond_4
    :goto_3
    :try_start_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v6, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x0

    move-object v9, v8

    move-object v10, v9

    const/4 v11, 0x0

    .line 243
    :goto_4
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->getAllElements()Lorg/jsoup/select/Elements;

    move-result-object v12

    invoke-virtual {v12}, Lorg/jsoup/select/Elements;->size()I

    move-result v12

    if-ge v11, v12, :cond_8

    .line 244
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->getAllElements()Lorg/jsoup/select/Elements;

    move-result-object v12

    invoke-virtual {v12, v11}, Lorg/jsoup/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/jsoup/nodes/Element;

    .line 245
    invoke-virtual {v12}, Lorg/jsoup/nodes/Element;->getAllElements()Lorg/jsoup/select/Elements;

    move-result-object v13

    invoke-virtual {v13}, Lorg/jsoup/select/Elements;->size()I

    move-result v13

    if-lez v13, :cond_7

    .line 246
    invoke-virtual {v12}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v13

    const-string v14, ":displayname"

    invoke-virtual {v13, v14}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 247
    invoke-virtual {v12}, Lorg/jsoup/nodes/Element;->getAllElements()Lorg/jsoup/select/Elements;

    move-result-object v8

    invoke-virtual {v8, v7}, Lorg/jsoup/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/jsoup/nodes/Element;

    invoke-virtual {v8}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v8

    goto :goto_5

    .line 248
    :cond_5
    invoke-virtual {v12}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v13

    const-string v14, ":getlastmodified"

    invoke-virtual {v13, v14}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_6

    .line 249
    invoke-virtual {v12}, Lorg/jsoup/nodes/Element;->getAllElements()Lorg/jsoup/select/Elements;

    move-result-object v10

    invoke-virtual {v10, v7}, Lorg/jsoup/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/jsoup/nodes/Element;

    invoke-virtual {v10}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v10

    goto :goto_5

    .line 250
    :cond_6
    invoke-virtual {v12}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v13

    const-string v14, ":getcontentlength"

    invoke-virtual {v13, v14}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_7

    .line 251
    invoke-virtual {v12}, Lorg/jsoup/nodes/Element;->getAllElements()Lorg/jsoup/select/Elements;

    move-result-object v9

    invoke-virtual {v9, v7}, Lorg/jsoup/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/jsoup/nodes/Element;

    invoke-virtual {v9}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v9

    :cond_7
    :goto_5
    add-int/lit8 v11, v11, 0x1

    goto :goto_4

    .line 255
    :cond_8
    invoke-static {v8}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 256
    invoke-static {v6}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto :goto_6

    .line 257
    :cond_9
    const-string v7, "%"

    invoke-virtual {v8, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 258
    invoke-static {v8}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 261
    :cond_a
    :goto_6
    new-instance v7, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    invoke-direct {v7, v6}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;-><init>(Ljava/lang/String;)V

    .line 262
    invoke-virtual {v7, v8}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->setDisplayName(Ljava/lang/String;)V

    .line 263
    invoke-static {v9}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v6

    int-to-long v8, v6

    invoke-virtual {v7, v8, v9}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->setSize(J)V

    .line 264
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v6, ":collection"

    invoke-virtual {v0, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    invoke-virtual {v7, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->setIsDirectory(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-object/from16 v6, p0

    .line 265
    :try_start_1
    invoke-direct {v6, v10}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->lastModifiedToLong(Ljava/lang/String;)J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->setLastModified(J)V

    .line 266
    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2

    :catch_0
    move-exception v0

    goto :goto_7

    :catch_1
    move-exception v0

    move-object/from16 v6, p0

    .line 268
    :goto_7
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto/16 :goto_2

    :cond_b
    move-object/from16 v6, p0

    return-object v1
.end method

.method private propFindResponse(Ljava/util/ArrayList;Z)Lokhttp3/Response;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;Z)",
            "Lokhttp3/Response;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 184
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 185
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 186
    const-string v2, "<a:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 189
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    const-string v1, "<?xml version=\"1.0\"?>\n<a:propfind xmlns:a=\"DAV:\">\n<a:prop>\n<a:displayname/>\n<a:resourcetype/>\n<a:getcontentlength/>\n<a:creationdate/>\n<a:getlastmodified/>\n%s</a:prop>\n</a:propfind>"

    if-eqz p1, :cond_1

    .line 190
    const-string p1, "%s"

    const-string v0, ""

    invoke-virtual {v1, p1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 192
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v0, v2

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 194
    :goto_1
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v0

    if-eqz p2, :cond_2

    .line 195
    iget-boolean p2, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->dir400:Z

    if-eqz p2, :cond_2

    const-string p2, "/"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 196
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 197
    :cond_2
    new-instance p2, Lokhttp3/Request$Builder;

    invoke-direct {p2}, Lokhttp3/Request$Builder;-><init>()V

    .line 198
    invoke-virtual {p2, v0}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p2

    const-string v0, "text/plain"

    .line 201
    invoke-static {v0}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v0

    invoke-static {v0, p1}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object p1

    const-string v0, "PROPFIND"

    invoke-virtual {p2, v0, p1}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object p1

    .line 203
    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->setAuthorization(Lokhttp3/Request$Builder;)V

    .line 205
    const-string p2, "Depth"

    const-string v0, "1"

    invoke-virtual {p1, p2, v0}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 208
    iget-object p2, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->okHttpClient:Lokhttp3/OkHttpClient;

    invoke-virtual {p1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p1

    invoke-virtual {p2, p1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object p1

    invoke-interface {p1}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object p1

    return-object p1
.end method

.method private setAuthorization(Lokhttp3/Request$Builder;)V
    .locals 0

    return-void
.end method


# virtual methods
.method public copy(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 351
    invoke-static {p1}, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->getWebDavUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 352
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    .line 353
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 354
    const-string v1, "COPY"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 355
    const-string v3, "destination"

    invoke-virtual {v0, v3, p1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 356
    invoke-direct {p0, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->execRequest(Lokhttp3/Request$Builder;)Ljava/lang/String;

    move-result-object v0

    .line 357
    iget v4, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->code:I

    const/16 v5, 0x190

    if-ne v4, v5, :cond_0

    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 358
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 359
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 360
    invoke-virtual {v0, v1, v2}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 361
    invoke-virtual {v0, v3, p1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 362
    invoke-direct {p0, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->execRequest(Lokhttp3/Request$Builder;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v0
.end method

.method public delete()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 337
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    .line 338
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 339
    const-string v1, "DELETE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 340
    invoke-direct {p0, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->execRequest(Lokhttp3/Request$Builder;)Ljava/lang/String;

    move-result-object v0

    .line 341
    iget v3, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->code:I

    const/16 v4, 0x190

    if-ne v3, v4, :cond_0

    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 342
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 343
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 344
    invoke-virtual {v0, v1, v2}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 345
    invoke-direct {p0, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->execRequest(Lokhttp3/Request$Builder;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public download()Ljava/io/ByteArrayOutputStream;
    .locals 6

    .line 432
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 436
    :cond_0
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v3, 0x2000

    .line 439
    :try_start_0
    new-array v3, v3, [B

    .line 441
    :goto_0
    invoke-virtual {v0, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_1

    const/4 v5, 0x0

    .line 442
    invoke-virtual {v2, v3, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 451
    :cond_1
    :try_start_1
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-object v2

    :catch_0
    move-exception v0

    .line 453
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object v2

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    .line 448
    :try_start_2
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 451
    :try_start_3
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_1

    :catch_2
    move-exception v0

    .line 453
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_1
    return-object v1

    .line 451
    :goto_2
    :try_start_4
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_3

    :catch_3
    move-exception v1

    .line 453
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 455
    :goto_3
    throw v0
.end method

.method public download(Ljava/lang/String;Z)Z
    .locals 4

    .line 392
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 393
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    .line 395
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_0

    :cond_0
    return v1

    .line 401
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    if-nez p1, :cond_2

    return v1

    :cond_2
    const/4 p2, 0x0

    .line 407
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    .line 409
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/16 p2, 0x2000

    .line 410
    :try_start_1
    new-array p2, p2, [B

    .line 412
    :goto_1
    invoke-virtual {p1, p2}, Ljava/io/InputStream;->read([B)I

    move-result v0

    const/4 v3, -0x1

    if-eq v0, v3, :cond_3

    .line 413
    invoke-virtual {v2, p2, v1, v0}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_1

    .line 417
    :cond_3
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 p1, 0x1

    .line 423
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return p1

    :catch_0
    move-exception p2

    .line 425
    invoke-static {p2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return p1

    :catchall_0
    move-exception p1

    move-object p2, v2

    goto :goto_4

    :catch_1
    move-exception p1

    move-object p2, v2

    goto :goto_2

    :catchall_1
    move-exception p1

    goto :goto_4

    :catch_2
    move-exception p1

    .line 420
    :goto_2
    :try_start_3
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz p2, :cond_4

    .line 423
    :try_start_4
    invoke-virtual {p2}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_3

    :catch_3
    move-exception p1

    .line 425
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_4
    :goto_3
    return v1

    :goto_4
    if-eqz p2, :cond_5

    .line 423
    :try_start_5
    invoke-virtual {p2}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_5

    :catch_4
    move-exception p2

    .line 425
    invoke-static {p2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 427
    :cond_5
    :goto_5
    throw p1
.end method

.method public exists(Z)Z
    .locals 4

    .line 110
    iget-object v0, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->exists:Ljava/lang/Boolean;

    if-nez v0, :cond_2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 112
    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, v2, p1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->propFindResponse(Ljava/util/ArrayList;Z)Lokhttp3/Response;

    move-result-object v2

    .line 113
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, v2, v3, p1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->fixDir400(Lokhttp3/Response;Ljava/util/ArrayList;Z)Lokhttp3/Response;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 115
    invoke-virtual {p1}, Lokhttp3/Response;->isSuccessful()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->exists:Ljava/lang/Boolean;

    .line 116
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 117
    invoke-virtual {p1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object p1

    .line 118
    const-string v2, ":collection"

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    invoke-virtual {p0, v2}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->setIsDirectory(Z)V

    .line 119
    iget-boolean v2, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->isDirectory:Z

    if-nez v2, :cond_2

    .line 120
    invoke-direct {p0, p1, v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->parseDir(Ljava/lang/String;Z)Ljava/util/List;

    move-result-object p1

    .line 121
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ne v2, v0, :cond_2

    .line 122
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    invoke-virtual {v2}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getLastModified()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->setLastModified(J)V

    .line 123
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    invoke-virtual {v2}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getSize()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->setSize(J)V

    .line 124
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    invoke-virtual {p1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getDisplayName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->setDisplayName(Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    if-eqz p1, :cond_2

    .line 128
    invoke-virtual {p1}, Lokhttp3/Response;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->err:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 133
    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->err:Ljava/lang/String;

    .line 134
    const-string v3, "Unable to resolve host"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    xor-int/2addr v0, v2

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;Z)V

    return v1

    .line 137
    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->exists:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    return p1
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1

    .line 512
    iget-object v0, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 2

    .line 291
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    .line 292
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 293
    invoke-direct {p0, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->setAuthorization(Lokhttp3/Request$Builder;)V

    .line 296
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->okHttpClient:Lokhttp3/OkHttpClient;

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    invoke-virtual {v1, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    invoke-interface {v0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v0

    .line 297
    invoke-virtual {v0}, Lokhttp3/Response;->code()I

    move-result v1

    iput v1, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->code:I

    .line 298
    invoke-virtual {v0}, Lokhttp3/Response;->isSuccessful()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 299
    invoke-virtual {v0}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0

    .line 301
    :cond_0
    invoke-virtual {v0}, Lokhttp3/Response;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->err:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 303
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLastModified()J
    .locals 2

    .line 520
    iget-wide v0, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->lastModified:J

    return-wide v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSize()J
    .locals 2

    .line 528
    iget-wide v0, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->size:J

    return-wide v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 3

    .line 86
    iget-object v0, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->httpUrl:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->url_Str:Ljava/lang/String;

    const-string v1, "davs://"

    const-string v2, "https://"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "dav://"

    const-string v2, "http://"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->httpUrl:Ljava/lang/String;

    .line 97
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->httpUrl:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->httpUrl:Ljava/lang/String;

    .line 100
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->httpUrl:Ljava/lang/String;

    return-object v0
.end method

.method public isDirectory()Z
    .locals 1

    .line 536
    iget-boolean v0, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->isDirectory:Z

    return v0
.end method

.method public listFiles()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/cloud/webdav/WebDavFile;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 146
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->listFiles(Ljava/util/ArrayList;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public listFiles(Ljava/util/ArrayList;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/cloud/webdav/WebDavFile;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 157
    :try_start_0
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->propFindResponse(Ljava/util/ArrayList;Z)Lokhttp3/Response;

    move-result-object v1

    .line 158
    invoke-virtual {v1}, Lokhttp3/Response;->code()I

    move-result v2

    iput v2, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->code:I

    .line 160
    invoke-direct {p0, v1, p1, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->fixDir400(Lokhttp3/Response;Ljava/util/ArrayList;Z)Lokhttp3/Response;

    move-result-object p1

    .line 162
    invoke-virtual {p1}, Lokhttp3/Response;->isSuccessful()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 163
    invoke-virtual {p1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->parseDir(Ljava/lang/String;Z)Ljava/util/List;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 166
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 168
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    return-object p1
.end method

.method public makeDirs()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 314
    invoke-virtual {p0, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->exists(Z)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 317
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->url_Str:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 318
    invoke-static {}, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->getWebDavUrl()Ljava/lang/String;

    move-result-object v3

    .line 319
    new-instance v4, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    invoke-direct {v4, v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;-><init>(Ljava/lang/String;)V

    .line 321
    invoke-virtual {v4, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->exists(Z)Z

    move-result v0

    if-nez v0, :cond_3

    .line 322
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 325
    :cond_1
    invoke-virtual {v4}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->makeDirs()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    return-object v0

    :cond_2
    :goto_0
    return-object v2

    .line 330
    :cond_3
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    .line 331
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    const-string v1, "MKCOL"

    .line 332
    invoke-virtual {v0, v1, v2}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 333
    invoke-direct {p0, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->execRequest(Lokhttp3/Request$Builder;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public move(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 368
    invoke-static {p1}, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->getWebDavUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 369
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    .line 370
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 371
    const-string v1, "MOVE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 372
    const-string v3, "destination"

    invoke-virtual {v0, v3, p1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 373
    invoke-direct {p0, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->execRequest(Lokhttp3/Request$Builder;)Ljava/lang/String;

    move-result-object v0

    .line 374
    iget v4, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->code:I

    const/16 v5, 0x190

    if-ne v4, v5, :cond_0

    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 375
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 376
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 377
    invoke-virtual {v0, v1, v2}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 378
    invoke-virtual {v0, v3, p1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 379
    invoke-direct {p0, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->execRequest(Lokhttp3/Request$Builder;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v0
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .locals 0

    .line 516
    iput-object p1, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->displayName:Ljava/lang/String;

    return-void
.end method

.method public setIsDirectory(Z)V
    .locals 0

    .line 540
    iput-boolean p1, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->isDirectory:Z

    return-void
.end method

.method public setLastModified(J)V
    .locals 0

    .line 524
    iput-wide p1, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->lastModified:J

    return-void
.end method

.method public setSize(J)V
    .locals 0

    .line 532
    iput-wide p1, p0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->size:J

    return-void
.end method

.method public upload(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 483
    invoke-static {p1}, Lcom/flyersoft/tools/T;->inputStream2Bytes(Ljava/io/InputStream;)[B

    move-result-object p1

    invoke-static {v0, p1}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;[B)Lokhttp3/RequestBody;

    move-result-object p1

    .line 484
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    .line 485
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 486
    invoke-virtual {v0, p1}, Lokhttp3/Request$Builder;->put(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object p1

    .line 488
    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->execRequest(Lokhttp3/Request$Builder;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public upload(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 466
    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->upload(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public upload(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 470
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 471
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "\""

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\" "

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p1, Lcom/flyersoft/moonreaderp/R$string;->not_exists:I

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    if-nez p2, :cond_1

    const/4 p1, 0x0

    goto :goto_0

    .line 472
    :cond_1
    invoke-static {p2}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object p1

    .line 474
    :goto_0
    invoke-static {p1, v0}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/io/File;)Lokhttp3/RequestBody;

    move-result-object p1

    .line 475
    new-instance p2, Lokhttp3/Request$Builder;

    invoke-direct {p2}, Lokhttp3/Request$Builder;-><init>()V

    .line 476
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p2

    .line 477
    invoke-virtual {p2, p1}, Lokhttp3/Request$Builder;->put(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object p1

    .line 479
    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->execRequest(Lokhttp3/Request$Builder;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
