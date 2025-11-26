.class public Lcom/flyersoft/books/chmlib/FileWindows;
.super Ljava/lang/Object;
.source "FileWindows.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/books/chmlib/FileWindows$Entry;
    }
.end annotation


# instance fields
.field public entries:[Lcom/flyersoft/books/chmlib/FileWindows$Entry;

.field public numOfEntry:I

.field public sizeOfEntry:I


# direct methods
.method public constructor <init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V
    .locals 3

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/FileWindows;->numOfEntry:I

    .line 30
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/FileWindows;->sizeOfEntry:I

    .line 31
    iget v0, p0, Lcom/flyersoft/books/chmlib/FileWindows;->numOfEntry:I

    new-array v0, v0, [Lcom/flyersoft/books/chmlib/FileWindows$Entry;

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/FileWindows;->entries:[Lcom/flyersoft/books/chmlib/FileWindows$Entry;

    const/4 v0, 0x0

    .line 32
    :goto_0
    iget v1, p0, Lcom/flyersoft/books/chmlib/FileWindows;->numOfEntry:I

    if-ge v0, v1, :cond_0

    .line 33
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/FileWindows;->entries:[Lcom/flyersoft/books/chmlib/FileWindows$Entry;

    new-instance v2, Lcom/flyersoft/books/chmlib/FileWindows$Entry;

    invoke-direct {v2, p1}, Lcom/flyersoft/books/chmlib/FileWindows$Entry;-><init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public constructor <init>([B)V
    .locals 1

    .line 26
    new-instance v0, Lcom/flyersoft/books/chmlib/ByteBufferArray;

    invoke-direct {v0, p1}, Lcom/flyersoft/books/chmlib/ByteBufferArray;-><init>([B)V

    invoke-direct {p0, v0}, Lcom/flyersoft/books/chmlib/FileWindows;-><init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V

    return-void
.end method
