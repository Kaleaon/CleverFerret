.class public Lcom/flyersoft/tools/compress/MyZip_Mobi;
.super Lcom/flyersoft/tools/compress/MyZip_Base;
.source "MyZip_Mobi.java"


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

.field private files:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/dozof/app/MLoader$MItem;",
            ">;"
        }
    .end annotation
.end field

.field mItemCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/dozof/app/MLoader$MItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 14
    invoke-direct {p0}, Lcom/flyersoft/tools/compress/MyZip_Base;-><init>()V

    .line 15
    invoke-static {p1, p2}, Lcom/dozof/app/MLoader;->loadFile(Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->files:Ljava/util/ArrayList;

    .line 16
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result p2

    if-nez p2, :cond_0

    return-void

    .line 17
    :cond_0
    new-instance p2, Ljava/lang/Exception;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Incompatible file:\n"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/flyersoft/tools/A;->formateSize(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
.end method


# virtual methods
.method public clear()V
    .locals 2

    .line 98
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->files:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 99
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dozof/app/MLoader$MItem;

    .line 100
    invoke-virtual {v1}, Lcom/dozof/app/MLoader$MItem;->clear()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public free()V
    .locals 2

    .line 86
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->files:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    iget-object v1, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->fileInfoList:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    return-void

    :cond_1
    :goto_0
    if-eqz v0, :cond_2

    .line 88
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 89
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->fileInfoList:Ljava/util/ArrayList;

    if-eqz v0, :cond_3

    .line 90
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 91
    :cond_3
    invoke-static {}, Lcom/dozof/app/MLoader;->freeMem()V

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

    .line 40
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->files:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 42
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->fileInfoList:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    return-object v0

    .line 45
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->fileInfoList:Ljava/util/ArrayList;

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->mItemCache:Ljava/util/HashMap;

    .line 48
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->files:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dozof/app/MLoader$MItem;

    .line 49
    iget-object v2, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->fileInfoList:Ljava/util/ArrayList;

    new-instance v3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    iget-object v5, v1, Lcom/dozof/app/MLoader$MItem;->filename:Ljava/lang/String;

    iget v4, v1, Lcom/dozof/app/MLoader$MItem;->length:I

    int-to-long v6, v4

    iget v4, v1, Lcom/dozof/app/MLoader$MItem;->length:I

    int-to-long v8, v4

    const/4 v12, 0x0

    const-string v13, ""

    const-wide/16 v10, 0x0

    move-object v4, p0

    invoke-direct/range {v3 .. v13}, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;-><init>(Lcom/flyersoft/tools/compress/MyZip_Base;Ljava/lang/String;JJJZLjava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    iget-object v2, v4, Lcom/flyersoft/tools/compress/MyZip_Mobi;->mItemCache:Ljava/util/HashMap;

    iget-object v3, v1, Lcom/dozof/app/MLoader$MItem;->filename:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    move-object v4, p0

    .line 59
    iget-object v0, v4, Lcom/flyersoft/tools/compress/MyZip_Mobi;->fileInfoList:Ljava/util/ArrayList;

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

    .line 25
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->files:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->fileList:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    return-object v0

    .line 29
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->fileList:Ljava/util/ArrayList;

    .line 30
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->files:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dozof/app/MLoader$MItem;

    .line 31
    iget-object v2, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->fileList:Ljava/util/ArrayList;

    iget-object v1, v1, Lcom/dozof/app/MLoader$MItem;->filename:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 32
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->fileList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 4

    .line 64
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->files:Ljava/util/ArrayList;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 67
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->mItemCache:Ljava/util/HashMap;

    if-nez v0, :cond_1

    .line 68
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->mItemCache:Ljava/util/HashMap;

    goto :goto_0

    .line 70
    :cond_1
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dozof/app/MLoader$MItem;

    if-eqz v0, :cond_2

    .line 72
    invoke-virtual {v0}, Lcom/dozof/app/MLoader$MItem;->getData()[B

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->bytes2InputStream([B)Ljava/io/InputStream;

    move-result-object p1

    return-object p1

    .line 75
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->files:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/dozof/app/MLoader$MItem;

    .line 76
    iget-object v3, v2, Lcom/dozof/app/MLoader$MItem;->filename:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 77
    iget-object p1, p0, Lcom/flyersoft/tools/compress/MyZip_Mobi;->mItemCache:Ljava/util/HashMap;

    iget-object v0, v2, Lcom/dozof/app/MLoader$MItem;->filename:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    invoke-virtual {v2}, Lcom/dozof/app/MLoader$MItem;->getData()[B

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->bytes2InputStream([B)Ljava/io/InputStream;

    move-result-object p1

    return-object p1

    :cond_4
    return-object v1
.end method
