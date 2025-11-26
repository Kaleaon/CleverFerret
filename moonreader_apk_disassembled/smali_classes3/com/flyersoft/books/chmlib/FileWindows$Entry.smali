.class public Lcom/flyersoft/books/chmlib/FileWindows$Entry;
.super Ljava/lang/Object;
.source "FileWindows.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/chmlib/FileWindows;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Entry"
.end annotation


# instance fields
.field public offHHC:I

.field public offHHK:I

.field public offHome:I

.field public offTitle:I


# direct methods
.method public constructor <init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V
    .locals 4

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getOffset()J

    move-result-wide v0

    const-wide/16 v2, 0x14

    add-long/2addr v2, v0

    .line 11
    invoke-virtual {p1, v2, v3}, Lcom/flyersoft/books/chmlib/ByteBuffer;->seek(J)V

    .line 12
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v2

    iput v2, p0, Lcom/flyersoft/books/chmlib/FileWindows$Entry;->offTitle:I

    const-wide/16 v2, 0x68

    add-long/2addr v2, v0

    .line 13
    invoke-virtual {p1, v2, v3}, Lcom/flyersoft/books/chmlib/ByteBuffer;->seek(J)V

    .line 14
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v2

    iput v2, p0, Lcom/flyersoft/books/chmlib/FileWindows$Entry;->offHome:I

    const-wide/16 v2, 0x60

    add-long/2addr v2, v0

    .line 15
    invoke-virtual {p1, v2, v3}, Lcom/flyersoft/books/chmlib/ByteBuffer;->seek(J)V

    .line 16
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result v2

    iput v2, p0, Lcom/flyersoft/books/chmlib/FileWindows$Entry;->offHHC:I

    const-wide/16 v2, 0x64

    add-long/2addr v0, v2

    .line 17
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->seek(J)V

    .line 18
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readDWORD()I

    move-result p1

    iput p1, p0, Lcom/flyersoft/books/chmlib/FileWindows$Entry;->offHHK:I

    return-void
.end method
