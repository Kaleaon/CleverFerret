.class Lcom/flyersoft/books/BaseEBook$SplitCountCache;
.super Ljava/lang/Object;
.source "BaseEBook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/BaseEBook;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SplitCountCache"
.end annotation


# instance fields
.field charCount:I

.field fontSize:F

.field offRate:F

.field pageCount:I

.field spannedLength:I

.field final synthetic this$0:Lcom/flyersoft/books/BaseEBook;


# direct methods
.method public constructor <init>(Lcom/flyersoft/books/BaseEBook;IIIF)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 477
    iput-object p1, p0, Lcom/flyersoft/books/BaseEBook$SplitCountCache;->this$0:Lcom/flyersoft/books/BaseEBook;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 478
    iput p2, p0, Lcom/flyersoft/books/BaseEBook$SplitCountCache;->charCount:I

    .line 479
    iput p3, p0, Lcom/flyersoft/books/BaseEBook$SplitCountCache;->pageCount:I

    .line 480
    iput p4, p0, Lcom/flyersoft/books/BaseEBook$SplitCountCache;->spannedLength:I

    .line 481
    iput p5, p0, Lcom/flyersoft/books/BaseEBook$SplitCountCache;->fontSize:F

    return-void
.end method
