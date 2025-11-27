.class Lcom/flyersoft/books/PDFReader$5;
.super Ljava/lang/Object;
.source "PDFReader.java"

# interfaces
.implements Lcom/radaee/reader/GLView$OnAfterSelect;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/PDFReader;->zSetSelect(IIIIZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/PDFReader;

.field final synthetic val$setDotPostion:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/books/PDFReader;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 395
    iput-object p1, p0, Lcom/flyersoft/books/PDFReader$5;->this$0:Lcom/flyersoft/books/PDFReader;

    iput-boolean p2, p0, Lcom/flyersoft/books/PDFReader$5;->val$setDotPostion:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAfterSelect(Ljava/lang/String;II[I[I)V
    .locals 7

    .line 398
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$5;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-boolean v6, p0, Lcom/flyersoft/books/PDFReader$5;->val$setDotPostion:Z

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/flyersoft/books/PDFReader;->doSelectEnd(Ljava/lang/String;II[I[IZ)V

    return-void
.end method
