.class public Lcom/flyersoft/books/chmlib/FileSystem;
.super Ljava/lang/Object;
.source "FileSystem.java"


# static fields
.field public static final TAG_compiledFile:I = 0x6

.field public static final TAG_contentFile:I = 0x0

.field public static final TAG_defaultTopic:I = 0x2

.field public static final TAG_defaultWindow:I = 0x5

.field public static final TAG_indexFile:I = 0x1

.field public static final TAG_title:I = 0x3


# instance fields
.field private charset:Ljava/lang/String;

.field public compiledFile:Ljava/lang/String;

.field public contentFile:Ljava/lang/String;

.field public defaultTopic:Ljava/lang/String;

.field public indexFile:Ljava/lang/String;

.field public title:Ljava/lang/String;

.field public versionNumber:I


# direct methods
.method public constructor <init>(Lcom/flyersoft/books/chmlib/ByteBuffer;Ljava/lang/String;)V
    .locals 2

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p2, p0, Lcom/flyersoft/books/chmlib/FileSystem;->charset:Ljava/lang/String;

    .line 25
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result p2

    iput p2, p0, Lcom/flyersoft/books/chmlib/FileSystem;->versionNumber:I

    .line 26
    :goto_0
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->hasMore()Z

    move-result p2

    if-eqz p2, :cond_5

    .line 27
    new-instance p2, Lcom/flyersoft/books/chmlib/TLV;

    invoke-direct {p2, p1}, Lcom/flyersoft/books/chmlib/TLV;-><init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V

    .line 28
    iget v0, p2, Lcom/flyersoft/books/chmlib/TLV;->tag:I

    if-eqz v0, :cond_4

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x6

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 42
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/FileSystem;->charset:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/flyersoft/books/chmlib/TLV;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/books/chmlib/FileSystem;->compiledFile:Ljava/lang/String;

    goto :goto_0

    .line 39
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/FileSystem;->charset:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/flyersoft/books/chmlib/TLV;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/books/chmlib/FileSystem;->title:Ljava/lang/String;

    goto :goto_0

    .line 36
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/FileSystem;->charset:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/flyersoft/books/chmlib/TLV;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/books/chmlib/FileSystem;->defaultTopic:Ljava/lang/String;

    goto :goto_0

    .line 33
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/FileSystem;->charset:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/flyersoft/books/chmlib/TLV;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/books/chmlib/FileSystem;->indexFile:Ljava/lang/String;

    goto :goto_0

    .line 30
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/FileSystem;->charset:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/flyersoft/books/chmlib/TLV;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/books/chmlib/FileSystem;->contentFile:Ljava/lang/String;

    goto :goto_0

    :cond_5
    return-void
.end method

.method public constructor <init>([BLjava/lang/String;)V
    .locals 1

    .line 20
    new-instance v0, Lcom/flyersoft/books/chmlib/ByteBufferArray;

    invoke-direct {v0, p1}, Lcom/flyersoft/books/chmlib/ByteBufferArray;-><init>([B)V

    invoke-direct {p0, v0, p2}, Lcom/flyersoft/books/chmlib/FileSystem;-><init>(Lcom/flyersoft/books/chmlib/ByteBuffer;Ljava/lang/String;)V

    return-void
.end method
