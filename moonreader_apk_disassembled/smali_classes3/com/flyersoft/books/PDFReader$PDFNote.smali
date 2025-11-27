.class public Lcom/flyersoft/books/PDFReader$PDFNote;
.super Ljava/lang/Object;
.source "PDFReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/PDFReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PDFNote"
.end annotation


# instance fields
.field bookmark:Ljava/lang/String;

.field color:I

.field end:I

.field note_text:Ljava/lang/String;

.field original:Ljava/lang/String;

.field page:I

.field start:I

.field timeStamp:J

.field type:I


# direct methods
.method public constructor <init>(IJIIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1345
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1346
    iput p1, p0, Lcom/flyersoft/books/PDFReader$PDFNote;->page:I

    .line 1347
    iput-wide p2, p0, Lcom/flyersoft/books/PDFReader$PDFNote;->timeStamp:J

    .line 1348
    iput p4, p0, Lcom/flyersoft/books/PDFReader$PDFNote;->start:I

    .line 1349
    iput p5, p0, Lcom/flyersoft/books/PDFReader$PDFNote;->end:I

    .line 1350
    iput p6, p0, Lcom/flyersoft/books/PDFReader$PDFNote;->color:I

    .line 1351
    iput p7, p0, Lcom/flyersoft/books/PDFReader$PDFNote;->type:I

    .line 1352
    iput-object p8, p0, Lcom/flyersoft/books/PDFReader$PDFNote;->note_text:Ljava/lang/String;

    .line 1353
    iput-object p9, p0, Lcom/flyersoft/books/PDFReader$PDFNote;->original:Ljava/lang/String;

    .line 1354
    iput-object p10, p0, Lcom/flyersoft/books/PDFReader$PDFNote;->bookmark:Ljava/lang/String;

    return-void
.end method
