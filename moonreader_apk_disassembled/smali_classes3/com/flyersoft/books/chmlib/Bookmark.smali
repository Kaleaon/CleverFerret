.class public Lcom/flyersoft/books/chmlib/Bookmark;
.super Ljava/lang/Object;
.source "Bookmark.java"


# instance fields
.field curColumn:I

.field curLine:I

.field cursor:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput p1, p0, Lcom/flyersoft/books/chmlib/Bookmark;->cursor:I

    .line 20
    iput p3, p0, Lcom/flyersoft/books/chmlib/Bookmark;->curColumn:I

    .line 21
    iput p2, p0, Lcom/flyersoft/books/chmlib/Bookmark;->curLine:I

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Line="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/flyersoft/books/chmlib/Bookmark;->curLine:I

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ";column="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/flyersoft/books/chmlib/Bookmark;->curColumn:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
