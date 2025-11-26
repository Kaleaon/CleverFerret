.class public Lcom/flyersoft/books/PDFReader$PdfAnnotItem;
.super Ljava/lang/Object;
.source "PDFReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/PDFReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PdfAnnotItem"
.end annotation


# instance fields
.field public annot:Lcom/radaee/pdf/Page$Annotation;

.field public annotIndexInPage:I

.field public pageno:I


# direct methods
.method public constructor <init>(IILcom/radaee/pdf/Page$Annotation;)V
    .locals 0

    .line 1785
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1786
    iput p1, p0, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->pageno:I

    .line 1787
    iput p2, p0, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->annotIndexInPage:I

    .line 1788
    iput-object p3, p0, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->annot:Lcom/radaee/pdf/Page$Annotation;

    return-void
.end method
