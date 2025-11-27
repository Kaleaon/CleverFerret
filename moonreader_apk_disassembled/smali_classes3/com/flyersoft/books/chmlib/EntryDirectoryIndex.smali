.class public Lcom/flyersoft/books/chmlib/EntryDirectoryIndex;
.super Ljava/lang/Object;
.source "EntryDirectoryIndex.java"


# instance fields
.field public directoryListChunk:I

.field public lengthOfName:I

.field public name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V
    .locals 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readENCINT()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/EntryDirectoryIndex;->lengthOfName:I

    .line 11
    invoke-virtual {p1, v0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/EntryDirectoryIndex;->name:Ljava/lang/String;

    .line 12
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readENCINT()I

    move-result p1

    iput p1, p0, Lcom/flyersoft/books/chmlib/EntryDirectoryIndex;->directoryListChunk:I

    return-void
.end method
