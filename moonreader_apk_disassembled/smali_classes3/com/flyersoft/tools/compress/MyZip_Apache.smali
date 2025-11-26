.class public Lcom/flyersoft/tools/compress/MyZip_Apache;
.super Lcom/flyersoft/tools/compress/MyZip_Base;
.source "MyZip_Apache.java"


# instance fields
.field fileInfoList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;",
            ">;"
        }
    .end annotation
.end field

.field fileList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private zf:Lorg/apache/tools/zip/ZipFile;

.field private zipEntryCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lorg/apache/tools/zip/ZipEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 18
    invoke-direct {p0}, Lcom/flyersoft/tools/compress/MyZip_Base;-><init>()V

    .line 19
    new-instance v0, Lorg/apache/tools/zip/ZipFile;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->zf:Lorg/apache/tools/zip/ZipFile;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Lcom/flyersoft/tools/compress/MyZip_Base;-><init>()V

    .line 23
    new-instance v0, Lorg/apache/tools/zip/ZipFile;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1, p2}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->zf:Lorg/apache/tools/zip/ZipFile;

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 0

    return-void
.end method

.method public free()V
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->fileList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 99
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 100
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->fileInfoList:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 101
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_1
    return-void
.end method

.method public getFileInfoOfZip()Ljava/util/ArrayList;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;",
            ">;"
        }
    .end annotation

    .line 45
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->zf:Lorg/apache/tools/zip/ZipFile;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 47
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->fileInfoList:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    return-object v0

    .line 50
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->fileInfoList:Ljava/util/ArrayList;

    .line 51
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->zipEntryCache:Ljava/util/HashMap;

    .line 53
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->zf:Lorg/apache/tools/zip/ZipFile;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipFile;->getEntries()Ljava/util/Enumeration;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 54
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/zip/ZipEntry;

    .line 55
    iget-object v2, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->fileInfoList:Ljava/util/ArrayList;

    new-instance v3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 56
    invoke-virtual {v1}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    .line 57
    invoke-virtual {v1}, Lorg/apache/tools/zip/ZipEntry;->getSize()J

    move-result-wide v6

    .line 58
    invoke-virtual {v1}, Lorg/apache/tools/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v8

    .line 59
    invoke-virtual {v1}, Lorg/apache/tools/zip/ZipEntry;->getTime()J

    move-result-wide v10

    .line 60
    invoke-virtual {v1}, Lorg/apache/tools/zip/ZipEntry;->isDirectory()Z

    move-result v12

    .line 61
    invoke-virtual {v1}, Lorg/apache/tools/zip/ZipEntry;->getComment()Ljava/lang/String;

    move-result-object v13

    move-object v4, p0

    invoke-direct/range {v3 .. v13}, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;-><init>(Lcom/flyersoft/tools/compress/MyZip_Base;Ljava/lang/String;JJJZLjava/lang/String;)V

    .line 55
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    iget-object v2, v4, Lcom/flyersoft/tools/compress/MyZip_Apache;->zipEntryCache:Ljava/util/HashMap;

    invoke-virtual {v1}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    move-object v4, p0

    .line 66
    iget-object v0, v4, Lcom/flyersoft/tools/compress/MyZip_Apache;->fileInfoList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getFileListOfZip()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 28
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->zf:Lorg/apache/tools/zip/ZipFile;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->fileList:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    return-object v0

    .line 33
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->fileList:Ljava/util/ArrayList;

    .line 34
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->zf:Lorg/apache/tools/zip/ZipFile;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipFile;->getEntries()Ljava/util/Enumeration;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 35
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/zip/ZipEntry;

    .line 36
    iget-object v2, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 38
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->fileList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 4

    .line 70
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->zf:Lorg/apache/tools/zip/ZipFile;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 74
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->zipEntryCache:Ljava/util/HashMap;

    if-nez v0, :cond_1

    .line 75
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->zipEntryCache:Ljava/util/HashMap;

    goto :goto_0

    .line 77
    :cond_1
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/zip/ZipEntry;

    if-eqz v0, :cond_2

    .line 79
    iget-object p1, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->zf:Lorg/apache/tools/zip/ZipFile;

    invoke-virtual {p1, v0}, Lorg/apache/tools/zip/ZipFile;->getInputStream(Lorg/apache/tools/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object p1

    return-object p1

    .line 82
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->zf:Lorg/apache/tools/zip/ZipFile;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipFile;->getEntries()Ljava/util/Enumeration;

    move-result-object v0

    :cond_3
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 83
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/zip/ZipEntry;

    .line 84
    invoke-virtual {v2}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 85
    iget-object p1, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->zipEntryCache:Ljava/util/HashMap;

    invoke-virtual {v2}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    iget-object p1, p0, Lcom/flyersoft/tools/compress/MyZip_Apache;->zf:Lorg/apache/tools/zip/ZipFile;

    invoke-virtual {p1, v2}, Lorg/apache/tools/zip/ZipFile;->getInputStream(Lorg/apache/tools/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :cond_4
    return-object v1

    :catch_0
    move-exception p1

    .line 90
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object v1
.end method
