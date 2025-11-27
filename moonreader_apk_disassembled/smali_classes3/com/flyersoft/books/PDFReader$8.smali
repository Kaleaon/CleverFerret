.class Lcom/flyersoft/books/PDFReader$8;
.super Ljava/lang/Object;
.source "PDFReader.java"

# interfaces
.implements Lcom/radaee/reader/GLView$OnAfterSelect;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/PDFReader;->doSelectMoveEvent(Landroid/view/MotionEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/PDFReader;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/PDFReader;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 751
    iput-object p1, p0, Lcom/flyersoft/books/PDFReader$8;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAfterSelect(Ljava/lang/String;II[I[I)V
    .locals 7

    .line 754
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$8;->this$0:Lcom/flyersoft/books/PDFReader;

    const/4 v6, 0x1

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/flyersoft/books/PDFReader;->doSelectEnd(Ljava/lang/String;II[I[IZ)V

    return-void
.end method
