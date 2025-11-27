.class public Lcom/flyersoft/books/PDFReader$XPos;
.super Ljava/lang/Object;
.source "PDFReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/PDFReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "XPos"
.end annotation


# instance fields
.field public pageno:I

.field public x:F

.field public y:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1672
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 1668
    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->x:F

    .line 1669
    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->y:F

    const/4 v0, 0x0

    .line 1670
    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->pageno:I

    return-void
.end method

.method public constructor <init>(Lcom/radaee/view/GLLayout$PDFPos;)V
    .locals 1

    .line 1687
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 1668
    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->x:F

    .line 1669
    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->y:F

    const/4 v0, 0x0

    .line 1670
    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->pageno:I

    .line 1688
    iget v0, p1, Lcom/radaee/view/GLLayout$PDFPos;->x:F

    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->x:F

    .line 1689
    iget v0, p1, Lcom/radaee/view/GLLayout$PDFPos;->y:F

    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->y:F

    .line 1690
    iget p1, p1, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    iput p1, p0, Lcom/flyersoft/books/PDFReader$XPos;->pageno:I

    return-void
.end method

.method public constructor <init>(Lcom/radaee/view/PDFLayout$PDFPos;)V
    .locals 1

    .line 1693
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 1668
    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->x:F

    .line 1669
    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->y:F

    const/4 v0, 0x0

    .line 1670
    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->pageno:I

    .line 1694
    iget v0, p1, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->x:F

    .line 1695
    iget v0, p1, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->y:F

    .line 1696
    iget p1, p1, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    iput p1, p0, Lcom/flyersoft/books/PDFReader$XPos;->pageno:I

    return-void
.end method

.method public constructor <init>(Lorg/comic/CLayout$Pos;)V
    .locals 1

    .line 1675
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 1668
    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->x:F

    .line 1669
    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->y:F

    const/4 v0, 0x0

    .line 1670
    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->pageno:I

    .line 1676
    iget v0, p1, Lorg/comic/CLayout$Pos;->x:F

    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->x:F

    .line 1677
    iget v0, p1, Lorg/comic/CLayout$Pos;->y:F

    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->y:F

    .line 1678
    iget p1, p1, Lorg/comic/CLayout$Pos;->pageno:I

    iput p1, p0, Lcom/flyersoft/books/PDFReader$XPos;->pageno:I

    return-void
.end method

.method public constructor <init>(Lorg/djvu/DLayout$DjvuPos;)V
    .locals 1

    .line 1681
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 1668
    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->x:F

    .line 1669
    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->y:F

    const/4 v0, 0x0

    .line 1670
    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->pageno:I

    .line 1682
    iget v0, p1, Lorg/djvu/DLayout$DjvuPos;->x:F

    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->x:F

    .line 1683
    iget v0, p1, Lorg/djvu/DLayout$DjvuPos;->y:F

    iput v0, p0, Lcom/flyersoft/books/PDFReader$XPos;->y:F

    .line 1684
    iget p1, p1, Lorg/djvu/DLayout$DjvuPos;->pageno:I

    iput p1, p0, Lcom/flyersoft/books/PDFReader$XPos;->pageno:I

    return-void
.end method


# virtual methods
.method public toCbzPos()Lorg/comic/CLayout$Pos;
    .locals 2

    .line 1700
    new-instance v0, Lorg/comic/CLayout$Pos;

    invoke-direct {v0}, Lorg/comic/CLayout$Pos;-><init>()V

    .line 1701
    iget v1, p0, Lcom/flyersoft/books/PDFReader$XPos;->x:F

    iput v1, v0, Lorg/comic/CLayout$Pos;->x:F

    .line 1702
    iget v1, p0, Lcom/flyersoft/books/PDFReader$XPos;->y:F

    iput v1, v0, Lorg/comic/CLayout$Pos;->y:F

    .line 1703
    iget v1, p0, Lcom/flyersoft/books/PDFReader$XPos;->pageno:I

    iput v1, v0, Lorg/comic/CLayout$Pos;->pageno:I

    return-object v0
.end method

.method public toDjvuPos()Lorg/djvu/DLayout$DjvuPos;
    .locals 2

    .line 1708
    new-instance v0, Lorg/djvu/DLayout$DjvuPos;

    invoke-direct {v0}, Lorg/djvu/DLayout$DjvuPos;-><init>()V

    .line 1709
    iget v1, p0, Lcom/flyersoft/books/PDFReader$XPos;->x:F

    iput v1, v0, Lorg/djvu/DLayout$DjvuPos;->x:F

    .line 1710
    iget v1, p0, Lcom/flyersoft/books/PDFReader$XPos;->y:F

    iput v1, v0, Lorg/djvu/DLayout$DjvuPos;->y:F

    .line 1711
    iget v1, p0, Lcom/flyersoft/books/PDFReader$XPos;->pageno:I

    iput v1, v0, Lorg/djvu/DLayout$DjvuPos;->pageno:I

    return-object v0
.end method

.method public toPDFGlPos()Lcom/radaee/view/GLLayout$PDFPos;
    .locals 2

    .line 1716
    new-instance v0, Lcom/radaee/view/GLLayout$PDFPos;

    invoke-direct {v0}, Lcom/radaee/view/GLLayout$PDFPos;-><init>()V

    .line 1717
    iget v1, p0, Lcom/flyersoft/books/PDFReader$XPos;->x:F

    iput v1, v0, Lcom/radaee/view/GLLayout$PDFPos;->x:F

    .line 1718
    iget v1, p0, Lcom/flyersoft/books/PDFReader$XPos;->y:F

    iput v1, v0, Lcom/radaee/view/GLLayout$PDFPos;->y:F

    .line 1719
    iget v1, p0, Lcom/flyersoft/books/PDFReader$XPos;->pageno:I

    iput v1, v0, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    return-object v0
.end method

.method public toPDFPos()Lcom/radaee/view/PDFLayout$PDFPos;
    .locals 2

    .line 1724
    new-instance v0, Lcom/radaee/view/PDFLayout$PDFPos;

    invoke-direct {v0}, Lcom/radaee/view/PDFLayout$PDFPos;-><init>()V

    .line 1725
    iget v1, p0, Lcom/flyersoft/books/PDFReader$XPos;->x:F

    iput v1, v0, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    .line 1726
    iget v1, p0, Lcom/flyersoft/books/PDFReader$XPos;->y:F

    iput v1, v0, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    .line 1727
    iget v1, p0, Lcom/flyersoft/books/PDFReader$XPos;->pageno:I

    iput v1, v0, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    return-object v0
.end method
