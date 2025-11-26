.class public Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;
.super Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;
.source "StandardFileSystemManager.java"


# static fields
.field private static final CONFIG_RESOURCE:Ljava/lang/String; = "providers.xml"

.field private static final PLUGIN_CONFIG_RESOURCE:Ljava/lang/String; = "META-INF/vfs-providers.xml"


# instance fields
.field private classLoader:Ljava/lang/ClassLoader;

.field private configUri:Ljava/net/URL;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;-><init>()V

    return-void
.end method

.method private addExtensionMap(Lorg/w3c/dom/Element;)V
    .locals 2

    .line 264
    const-string v0, "extension"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 265
    const-string v1, "scheme"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 266
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 267
    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->addExtensionMap(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private addMimeTypeMap(Lorg/w3c/dom/Element;)V
    .locals 2

    .line 277
    const-string v0, "mime-type"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 278
    const-string v1, "scheme"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 279
    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->addMimeTypeMap(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private addOperationProvider(Lorg/w3c/dom/Element;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 330
    const-string v0, "class-name"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 333
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->getSchemas(Lorg/w3c/dom/Element;)[Ljava/lang/String;

    move-result-object p1

    .line 334
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    .line 335
    invoke-virtual {p0, v3}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->hasProvider(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 336
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->createInstance(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/commons/vfs2/operations/FileOperationProvider;

    .line 337
    invoke-virtual {p0, v3, v4}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->addOperationProvider(Ljava/lang/String;Lorg/apache/commons/vfs2/operations/FileOperationProvider;)V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private addProvider(Lorg/w3c/dom/Element;Z)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 290
    const-string v0, "class-name"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 293
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->getRequiredSchemes(Lorg/w3c/dom/Element;)[Ljava/lang/String;

    move-result-object v1

    .line 294
    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    const/4 v5, 0x2

    const/4 v6, 0x1

    if-ge v4, v2, :cond_1

    aget-object v7, v1, v4

    .line 295
    invoke-virtual {p0, v7}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->hasProvider(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 296
    new-array p1, v5, [Ljava/lang/Object;

    aput-object v0, p1, v3

    aput-object v7, p1, v6

    const-string p2, "vfs.impl/skipping-provider-scheme.debug"

    invoke-static {p2, p1}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 298
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object p2

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v0

    invoke-static {p2, v0, p1}, Lorg/apache/commons/vfs2/VfsLog;->debug(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;)V

    return-void

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 304
    :cond_1
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->getRequiredClasses(Lorg/w3c/dom/Element;)[Ljava/lang/String;

    move-result-object v1

    .line 305
    array-length v2, v1

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v2, :cond_3

    aget-object v7, v1, v4

    .line 306
    invoke-direct {p0, v7}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->findClass(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 307
    new-array p1, v5, [Ljava/lang/Object;

    aput-object v0, p1, v3

    aput-object v7, p1, v6

    const-string p2, "vfs.impl/skipping-provider.debug"

    invoke-static {p2, p1}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 308
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object p2

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v0

    invoke-static {p2, v0, p1}, Lorg/apache/commons/vfs2/VfsLog;->debug(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;)V

    return-void

    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 314
    :cond_3
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->createInstance(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/FileProvider;

    .line 315
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->getSchemas(Lorg/w3c/dom/Element;)[Ljava/lang/String;

    move-result-object p1

    .line 316
    array-length v1, p1

    if-lez v1, :cond_4

    .line 317
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->addProvider([Ljava/lang/String;Lorg/apache/commons/vfs2/provider/FileProvider;)V

    :cond_4
    if-eqz p2, :cond_5

    .line 322
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->setDefaultProvider(Lorg/apache/commons/vfs2/provider/FileProvider;)V

    :cond_5
    return-void
.end method

.method private configure(Ljava/lang/String;Ljava/io/InputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 190
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->createDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 191
    invoke-virtual {v0, p2}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object p2

    invoke-interface {p2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object p2

    .line 193
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->configure(Lorg/w3c/dom/Element;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p2

    .line 196
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.impl/load-config.error"

    invoke-direct {v0, v1, p1, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v0
.end method

.method private configure(Ljava/net/URL;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 160
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->createDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v1

    .line 161
    invoke-virtual {p1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    .line 162
    invoke-virtual {v1, v0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v1

    invoke-interface {v1}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v1

    .line 164
    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->configure(Lorg/w3c/dom/Element;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 170
    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 172
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/IOException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_0
    return-void

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception v1

    .line 166
    :try_start_2
    new-instance v2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v3, "vfs.impl/load-config.error"

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, v3, p1, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    if-eqz v0, :cond_1

    .line 170
    :try_start_3
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_1

    :catch_2
    move-exception v0

    .line 172
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/IOException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 173
    :cond_1
    :goto_1
    throw p1
.end method

.method private configure(Lorg/w3c/dom/Element;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 222
    const-string v0, "provider"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 223
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    .line 225
    invoke-interface {v0, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    check-cast v4, Lorg/w3c/dom/Element;

    .line 226
    invoke-direct {p0, v4, v2}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->addProvider(Lorg/w3c/dom/Element;Z)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 230
    :cond_0
    const-string v0, "operationProvider"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    const/4 v1, 0x0

    .line 231
    :goto_1
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 232
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Element;

    .line 233
    invoke-direct {p0, v3}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->addOperationProvider(Lorg/w3c/dom/Element;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 237
    :cond_1
    const-string v0, "default-provider"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 238
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-lez v1, :cond_2

    .line 239
    invoke-interface {v0, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    const/4 v1, 0x1

    .line 240
    invoke-direct {p0, v0, v1}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->addProvider(Lorg/w3c/dom/Element;Z)V

    .line 244
    :cond_2
    const-string v0, "mime-type-map"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    const/4 v1, 0x0

    .line 245
    :goto_2
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v1, v3, :cond_3

    .line 246
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Element;

    .line 247
    invoke-direct {p0, v3}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->addMimeTypeMap(Lorg/w3c/dom/Element;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 251
    :cond_3
    const-string v0, "extension-map"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object p1

    .line 252
    :goto_3
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v0

    if-ge v2, v0, :cond_4

    .line 253
    invoke-interface {p1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 254
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->addExtensionMap(Lorg/w3c/dom/Element;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_4
    return-void
.end method

.method private createDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;
        }
    .end annotation

    .line 207
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v0

    const/4 v1, 0x1

    .line 208
    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setIgnoringElementContentWhitespace(Z)V

    .line 209
    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setIgnoringComments(Z)V

    .line 210
    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setExpandEntityReferences(Z)V

    .line 211
    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    return-object v0
.end method

.method private createInstance(Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 407
    :try_start_0
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 408
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    .line 410
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.impl/create-provider.error"

    invoke-direct {v1, v2, p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private findClass(Ljava/lang/String;)Z
    .locals 0

    .line 347
    :try_start_0
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    :catch_0
    const/4 p1, 0x0

    return p1
.end method

.method private findClassLoader()Ljava/lang/ClassLoader;
    .locals 1

    .line 133
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->classLoader:Ljava/lang/ClassLoader;

    if-eqz v0, :cond_0

    return-object v0

    .line 137
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    if-nez v0, :cond_1

    .line 139
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method private getRequiredClasses(Lorg/w3c/dom/Element;)[Ljava/lang/String;
    .locals 5

    .line 358
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 359
    const-string v1, "if-available"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object p1

    .line 360
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 362
    invoke-interface {p1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Element;

    .line 363
    const-string v4, "class-name"

    invoke-interface {v3, v4}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 364
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_0

    .line 365
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 368
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    return-object p1
.end method

.method private getRequiredSchemes(Lorg/w3c/dom/Element;)[Ljava/lang/String;
    .locals 5

    .line 375
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 376
    const-string v1, "if-available"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object p1

    .line 377
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 379
    invoke-interface {p1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Element;

    .line 380
    const-string v4, "scheme"

    invoke-interface {v3, v4}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 381
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_0

    .line 382
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 385
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    return-object p1
.end method

.method private getSchemas(Lorg/w3c/dom/Element;)[Ljava/lang/String;
    .locals 5

    .line 392
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 393
    const-string v1, "scheme"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object p1

    .line 394
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    .line 396
    invoke-interface {p1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Element;

    .line 397
    const-string v4, "name"

    invoke-interface {v3, v4}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 399
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    return-object p1
.end method

.method private loadClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 422
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->findClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 424
    :catch_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method

.method private loadResources(Ljava/lang/String;)Ljava/util/Enumeration;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Enumeration<",
            "Ljava/net/URL;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 435
    invoke-direct {p0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->findClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 436
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    return-object v0

    .line 437
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method protected configurePlugins()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 121
    :try_start_0
    const-string v0, "META-INF/vfs-providers.xml"

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->loadResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 127
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/URL;

    .line 128
    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->configure(Ljava/net/URL;)V

    goto :goto_0

    :cond_0
    return-void

    :catch_0
    move-exception v0

    .line 123
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected createDefaultFileReplicator()Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;
    .locals 1

    .line 146
    new-instance v0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;-><init>()V

    return-object v0
.end method

.method public init()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 91
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->createDefaultFileReplicator()Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;

    move-result-object v0

    .line 92
    new-instance v1, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;

    invoke-direct {v1, v0}, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;-><init>(Lorg/apache/commons/vfs2/provider/FileReplicator;)V

    invoke-virtual {p0, v1}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->setReplicator(Lorg/apache/commons/vfs2/provider/FileReplicator;)V

    .line 93
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->setTemporaryFileStore(Lorg/apache/commons/vfs2/provider/TemporaryFileStore;)V

    .line 95
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->configUri:Ljava/net/URL;

    if-nez v0, :cond_1

    .line 97
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "providers.xml"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 101
    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->configUri:Ljava/net/URL;

    goto :goto_0

    .line 99
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.impl/find-config-file.error"

    invoke-direct {v0, v2, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0

    .line 104
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->configUri:Ljava/net/URL;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->configure(Ljava/net/URL;)V

    .line 105
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->configurePlugins()V

    .line 108
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->init()V

    return-void
.end method

.method public setClassLoader(Ljava/lang/ClassLoader;)V
    .locals 0

    .line 80
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->classLoader:Ljava/lang/ClassLoader;

    return-void
.end method

.method public setConfiguration(Ljava/lang/String;)V
    .locals 2

    .line 59
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->setConfiguration(Ljava/net/URL;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 61
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v0

    invoke-virtual {p1}, Ljava/net/MalformedURLException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public setConfiguration(Ljava/net/URL;)V
    .locals 0

    .line 71
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->configUri:Ljava/net/URL;

    return-void
.end method
