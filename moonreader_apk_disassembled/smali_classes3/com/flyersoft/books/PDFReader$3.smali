.class Lcom/flyersoft/books/PDFReader$3;
.super Ljava/lang/Object;
.source "PDFReader.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/PDFReader;->initView(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V
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

    .line 181
    iput-object p1, p0, Lcom/flyersoft/books/PDFReader$3;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 184
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$3;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1, p2}, Lcom/flyersoft/books/PDFReader;->doTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method
