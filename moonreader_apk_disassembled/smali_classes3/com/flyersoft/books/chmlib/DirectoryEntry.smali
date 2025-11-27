.class public Lcom/flyersoft/books/chmlib/DirectoryEntry;
.super Ljava/lang/Object;
.source "DirectoryEntry.java"


# instance fields
.field public contentSection:I

.field public length:I

.field public name:Ljava/lang/String;

.field public offset:I


# direct methods
.method public constructor <init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V
    .locals 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readENCINT()I

    move-result v0

    .line 21
    invoke-virtual {p1, v0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/DirectoryEntry;->name:Ljava/lang/String;

    .line 22
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readENCINT()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/DirectoryEntry;->contentSection:I

    .line 23
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readENCINT()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/DirectoryEntry;->offset:I

    .line 24
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readENCINT()I

    move-result p1

    iput p1, p0, Lcom/flyersoft/books/chmlib/DirectoryEntry;->length:I

    return-void
.end method


# virtual methods
.method public getFileSystemName()Ljava/lang/String;
    .locals 3

    .line 33
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/DirectoryEntry;->name:Ljava/lang/String;

    const-string v1, "::"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "/$$"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/DirectoryEntry;->name:Ljava/lang/String;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/DirectoryEntry;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNameUTF16Dump()Ljava/lang/String;
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/DirectoryEntry;->name:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/books/chmlib/ChmUtil;->dumpUTF16(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isCompressed()Z
    .locals 1

    .line 28
    iget v0, p0, Lcom/flyersoft/books/chmlib/DirectoryEntry;->contentSection:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
