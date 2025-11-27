.class final Lcom/flyersoft/staticlayout/SHPhysicalFile;
.super Lcom/flyersoft/staticlayout/SHFile;
.source "SHTextHyphenator.java"


# instance fields
.field private final myFile:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 0

    .line 328
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/SHFile;-><init>()V

    .line 329
    iput-object p1, p0, Lcom/flyersoft/staticlayout/SHPhysicalFile;->myFile:Ljava/io/File;

    .line 330
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SHPhysicalFile;->init()V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 325
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/SHPhysicalFile;-><init>(Ljava/io/File;)V

    return-void
.end method


# virtual methods
.method protected directoryEntries()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/flyersoft/staticlayout/SHFile;",
            ">;"
        }
    .end annotation

    .line 383
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHPhysicalFile;->myFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 384
    array-length v1, v0

    if-nez v1, :cond_0

    goto :goto_1

    .line 388
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    array-length v2, v0

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 389
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v0, v3

    .line 390
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 391
    new-instance v5, Lcom/flyersoft/staticlayout/SHPhysicalFile;

    invoke-direct {v5, v4}, Lcom/flyersoft/staticlayout/SHPhysicalFile;-><init>(Ljava/io/File;)V

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-object v1

    .line 385
    :cond_3
    :goto_1
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object v0
.end method

.method public exists()Z
    .locals 1

    .line 335
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHPhysicalFile;->myFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 379
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lcom/flyersoft/staticlayout/SHPhysicalFile;->myFile:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public getLongName()Ljava/lang/String;
    .locals 1

    .line 364
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SHPhysicalFile;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SHPhysicalFile;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHPhysicalFile;->myFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParent()Lcom/flyersoft/staticlayout/SHFile;
    .locals 2

    .line 369
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SHPhysicalFile;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    new-instance v0, Lcom/flyersoft/staticlayout/SHPhysicalFile;

    iget-object v1, p0, Lcom/flyersoft/staticlayout/SHPhysicalFile;->myFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/SHPhysicalFile;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .line 359
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHPhysicalFile;->myFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPhysicalFile()Lcom/flyersoft/staticlayout/SHPhysicalFile;
    .locals 0

    return-object p0
.end method

.method public isDirectory()Z
    .locals 1

    .line 345
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHPhysicalFile;->myFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    return v0
.end method

.method public isReadable()Z
    .locals 1

    .line 350
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHPhysicalFile;->myFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result v0

    return v0
.end method

.method public size()J
    .locals 2

    .line 340
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHPhysicalFile;->myFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method
