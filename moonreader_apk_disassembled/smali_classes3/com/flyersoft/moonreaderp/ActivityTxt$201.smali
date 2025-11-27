.class Lcom/flyersoft/moonreaderp/ActivityTxt$201;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfInitAnnotButtons()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 18746
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 13

    .line 18748
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideDotViews()Z

    .line 18749
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-nez v0, :cond_0

    goto/16 :goto_11

    .line 18751
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v0

    if-nez v0, :cond_1

    .line 18752
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antCancel:Landroid/widget/ImageView;

    if-eq p1, v0, :cond_25

    .line 18753
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->showBuyDialog(Landroid/content/Context;)V

    return-void

    .line 18757
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfSaveAnnotsForTime()V

    .line 18758
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antNote:Landroid/widget/ImageView;

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-ne p1, v0, :cond_3

    .line 18759
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antNote:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getId()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->lastAnnotType:I

    .line 18760
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msaveInk(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 18761
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfAnnotEnd()V

    .line 18762
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antNote:Landroid/widget/ImageView;

    iput-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antSelected:Landroid/widget/ImageView;

    .line 18763
    sput-object v1, Lcom/radaee/pdf/Global;->tmpNoteText:Ljava/lang/String;

    .line 18764
    sget-boolean v0, Lcom/flyersoft/tools/A;->gl:Z

    if-eqz v0, :cond_2

    .line 18765
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    invoke-virtual {v0, v2}, Lcom/radaee/reader/PDFGLLayoutView;->PDFSetNote(I)V

    goto :goto_0

    .line 18767
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0, v2}, Lcom/radaee/reader/PDFLayoutView;->PDFSetNote(I)V

    .line 18768
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowAnnotLay(Z)V

    .line 18770
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antImage:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_5

    .line 18771
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getId()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->lastAnnotType:I

    .line 18772
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msaveInk(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 18773
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfAnnotEnd()V

    .line 18774
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antImage:Landroid/widget/ImageView;

    iput-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antSelected:Landroid/widget/ImageView;

    .line 18775
    sput-object v1, Lcom/radaee/pdf/Global;->tmpNoteText:Ljava/lang/String;

    .line 18776
    sget-boolean v0, Lcom/flyersoft/tools/A;->gl:Z

    if-eqz v0, :cond_4

    .line 18777
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    invoke-virtual {v0, v2}, Lcom/radaee/reader/PDFGLLayoutView;->PDFSetStamp(I)V

    goto :goto_1

    .line 18779
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0, v2}, Lcom/radaee/reader/PDFLayoutView;->PDFSetStamp(I)V

    .line 18780
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowAnnotLay(Z)V

    .line 18782
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antFreeText:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_6

    .line 18783
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antFreeText:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getId()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->lastAnnotType:I

    .line 18784
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msaveInk(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 18785
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfAnnotEnd()V

    .line 18786
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfSaveAnnotsForSecurity()V

    .line 18787
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antFreeText:Landroid/widget/ImageView;

    iput-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antSelected:Landroid/widget/ImageView;

    .line 18790
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    const/16 v3, 0xc8

    invoke-virtual {v0, v3}, Lcom/flyersoft/books/PDFReader;->setStatus(I)V

    .line 18791
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowAnnotLay(Z)V

    .line 18793
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antInk:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_8

    .line 18794
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antInk:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getId()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->lastAnnotType:I

    .line 18795
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msaveInk(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 18796
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfAnnotEnd()V

    .line 18797
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antInk:Landroid/widget/ImageView;

    iput-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antSelected:Landroid/widget/ImageView;

    .line 18798
    sget-boolean v0, Lcom/flyersoft/tools/A;->gl:Z

    if-eqz v0, :cond_7

    .line 18799
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    invoke-virtual {v0, v2}, Lcom/radaee/reader/PDFGLLayoutView;->PDFSetInk(I)V

    goto :goto_2

    .line 18801
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0, v2}, Lcom/radaee/reader/PDFLayoutView;->PDFSetInk(I)V

    .line 18802
    :goto_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowAnnotLay(Z)V

    .line 18804
    :cond_8
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antLine:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_a

    .line 18805
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antLine:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getId()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->lastAnnotType:I

    .line 18806
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msaveInk(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 18807
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfAnnotEnd()V

    .line 18808
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antLine:Landroid/widget/ImageView;

    iput-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antSelected:Landroid/widget/ImageView;

    .line 18809
    sget-boolean v0, Lcom/flyersoft/tools/A;->gl:Z

    if-eqz v0, :cond_9

    .line 18810
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    invoke-virtual {v0, v2}, Lcom/radaee/reader/PDFGLLayoutView;->PDFSetLine(I)V

    goto :goto_3

    .line 18812
    :cond_9
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0, v2}, Lcom/radaee/reader/PDFLayoutView;->PDFSetLine(I)V

    .line 18813
    :goto_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowAnnotLay(Z)V

    .line 18815
    :cond_a
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antArrow:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_c

    .line 18816
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antArrow:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getId()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->lastAnnotType:I

    .line 18817
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msaveInk(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 18818
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfAnnotEnd()V

    .line 18819
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antArrow:Landroid/widget/ImageView;

    iput-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antSelected:Landroid/widget/ImageView;

    .line 18820
    sget-boolean v0, Lcom/flyersoft/tools/A;->gl:Z

    if-eqz v0, :cond_b

    .line 18821
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, v2}, Lcom/radaee/reader/GLView;->PDFSetArrow(I)V

    goto :goto_4

    .line 18823
    :cond_b
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0, v2}, Lcom/radaee/reader/PDFLayoutView;->PDFSetArrow(I)V

    .line 18824
    :goto_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowAnnotLay(Z)V

    .line 18826
    :cond_c
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antRect:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_e

    .line 18827
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antRect:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getId()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->lastAnnotType:I

    .line 18828
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msaveInk(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 18829
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfAnnotEnd()V

    .line 18830
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antRect:Landroid/widget/ImageView;

    iput-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antSelected:Landroid/widget/ImageView;

    .line 18831
    sget-boolean v0, Lcom/flyersoft/tools/A;->gl:Z

    if-eqz v0, :cond_d

    .line 18832
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    invoke-virtual {v0, v2}, Lcom/radaee/reader/PDFGLLayoutView;->PDFSetRect(I)V

    goto :goto_5

    .line 18834
    :cond_d
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0, v2}, Lcom/radaee/reader/PDFLayoutView;->PDFSetRect(I)V

    .line 18835
    :goto_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowAnnotLay(Z)V

    .line 18837
    :cond_e
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antEllipse:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_10

    .line 18838
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antEllipse:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getId()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->lastAnnotType:I

    .line 18839
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msaveInk(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 18840
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfAnnotEnd()V

    .line 18841
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antEllipse:Landroid/widget/ImageView;

    iput-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antSelected:Landroid/widget/ImageView;

    .line 18842
    sget-boolean v0, Lcom/flyersoft/tools/A;->gl:Z

    if-eqz v0, :cond_f

    .line 18843
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    invoke-virtual {v0, v2}, Lcom/radaee/reader/PDFGLLayoutView;->PDFSetEllipse(I)V

    goto :goto_6

    .line 18845
    :cond_f
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0, v2}, Lcom/radaee/reader/PDFLayoutView;->PDFSetEllipse(I)V

    .line 18846
    :goto_6
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowAnnotLay(Z)V

    .line 18848
    :cond_10
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antCancel:Landroid/widget/ImageView;

    const/4 v3, 0x1

    if-ne p1, v0, :cond_11

    .line 18849
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpdfAnnotFinish(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 18851
    :cond_11
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->apCancel:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_14

    .line 18852
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    if-eqz v0, :cond_12

    .line 18853
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfAnnotRemove()V

    .line 18854
    sput-boolean v3, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    .line 18856
    :cond_12
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msaveInk(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 18857
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0, v2}, Lcom/flyersoft/books/PDFReader;->setStatus(I)V

    .line 18858
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antSelected:Landroid/widget/ImageView;

    .line 18859
    sput-object v1, Lcom/radaee/pdf/Global;->tmpNoteText:Ljava/lang/String;

    .line 18860
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfTopLay:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_13

    .line 18861
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowAnnotLay(Z)V

    goto :goto_7

    .line 18863
    :cond_13
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v4, 0x8

    invoke-virtual {v0, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowBottomLay(I)V

    .line 18865
    :cond_14
    :goto_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->apThickness:Landroid/widget/ImageView;

    const/high16 v4, 0x1040000

    const v5, 0x104000a

    const-string v6, ""

    if-ne p1, v0, :cond_1b

    .line 18866
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    const/16 v7, 0x14

    .line 18867
    new-array v8, v7, [Ljava/lang/String;

    if-nez v0, :cond_16

    .line 18869
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antSelected:Landroid/widget/ImageView;

    iget-object v9, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v9, v9, Lcom/flyersoft/moonreaderp/ActivityTxt;->antFreeText:Landroid/widget/ImageView;

    if-ne v0, v9, :cond_15

    sget v0, Lcom/radaee/pdf/Global;->freeTextSize:F

    goto :goto_8

    :cond_15
    sget v0, Lcom/radaee/pdf/Global;->inkWidth:F

    goto :goto_8

    :cond_16
    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetStrokeWidth()F

    move-result v0

    const/high16 v9, 0x40000000    # 2.0f

    mul-float v0, v0, v9

    :goto_8
    float-to-int v0, v0

    const/4 v9, 0x0

    const/4 v10, 0x1

    :goto_9
    if-ge v9, v7, :cond_19

    .line 18871
    iget-object v11, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v11, v11, Lcom/flyersoft/moonreaderp/ActivityTxt;->antSelected:Landroid/widget/ImageView;

    iget-object v12, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v12, v12, Lcom/flyersoft/moonreaderp/ActivityTxt;->antFreeText:Landroid/widget/ImageView;

    if-ne v11, v12, :cond_17

    const/16 v11, 0xb

    goto :goto_a

    :cond_17
    const/4 v11, 0x1

    :goto_a
    add-int/2addr v11, v9

    .line 18872
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v8, v9

    if-ne v11, v0, :cond_18

    move v10, v9

    :cond_18
    add-int/lit8 v9, v9, 0x1

    goto :goto_9

    .line 18876
    :cond_19
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpdfSetImmersiveMode(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 18877
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {v0, v7}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/ActivityTxt;->antSelected:Landroid/widget/ImageView;

    iget-object v9, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v9, v9, Lcom/flyersoft/moonreaderp/ActivityTxt;->antFreeText:Landroid/widget/ImageView;

    if-ne v7, v9, :cond_1a

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->font_size:I

    goto :goto_b

    :cond_1a
    sget v7, Lcom/flyersoft/moonreaderp/R$string;->pdf_pen_width:I

    :goto_b
    invoke-virtual {v0, v7}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 18878
    invoke-virtual {v0, v8, v10, v1}, Lcom/flyersoft/components/MyDialog;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v7, Lcom/flyersoft/moonreaderp/ActivityTxt$201$2;

    invoke-direct {v7, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$201$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$201;)V

    .line 18879
    invoke-virtual {v0, v5, v7}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v7, Lcom/flyersoft/moonreaderp/ActivityTxt$201$1;

    invoke-direct {v7, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$201$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$201;)V

    .line 18896
    invoke-virtual {v0, v7}, Lcom/flyersoft/components/MyDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 18902
    invoke-virtual {v0, v4, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 18903
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 18905
    :cond_1b
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->apColor:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_1d

    .line 18906
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpdfSetImmersiveMode(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 18907
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    if-nez v0, :cond_1c

    .line 18908
    sget v0, Lcom/radaee/pdf/Global;->inkColor:I

    goto :goto_c

    :cond_1c
    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetStrokeColor()I

    move-result v0

    :goto_c
    move v11, v0

    .line 18909
    new-instance v7, Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->highlight_color:I

    invoke-virtual {v8, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v9

    new-instance v12, Lcom/flyersoft/moonreaderp/ActivityTxt$201$3;

    invoke-direct {v12, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$201$3;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$201;)V

    const/4 v10, 0x1

    invoke-direct/range {v7 .. v12}, Lcom/flyersoft/moonreaderp/PrefColorPick;-><init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V

    .line 18923
    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$4;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$201$4;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$201;)V

    invoke-virtual {v7, v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 18929
    invoke-virtual {v7}, Lcom/flyersoft/moonreaderp/PrefColorPick;->show()V

    .line 18931
    :cond_1d
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->apFillColor:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_1f

    .line 18932
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpdfSetImmersiveMode(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 18933
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    if-nez v0, :cond_1e

    .line 18934
    sget v0, Lcom/radaee/pdf/Global;->fillColor:I

    goto :goto_d

    :cond_1e
    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetFillColor()I

    move-result v0

    :goto_d
    move v11, v0

    .line 18935
    new-instance v7, Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->fill_color:I

    invoke-virtual {v8, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v9

    new-instance v12, Lcom/flyersoft/moonreaderp/ActivityTxt$201$5;

    invoke-direct {v12, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$201$5;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$201;)V

    const/4 v10, 0x1

    invoke-direct/range {v7 .. v12}, Lcom/flyersoft/moonreaderp/PrefColorPick;-><init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V

    .line 18955
    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$6;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$201$6;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$201;)V

    invoke-virtual {v7, v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 18961
    invoke-virtual {v7}, Lcom/flyersoft/moonreaderp/PrefColorPick;->show()V

    .line 18963
    :cond_1f
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->apNote:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_24

    .line 18964
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpdfSetImmersiveMode(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 18965
    new-instance v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 18966
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v1}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object v1

    if-nez v1, :cond_21

    .line 18969
    sget-object v1, Lcom/radaee/pdf/Global;->tmpNoteText:Ljava/lang/String;

    if-nez v1, :cond_20

    goto :goto_10

    :cond_20
    sget-object v6, Lcom/radaee/pdf/Global;->tmpNoteText:Ljava/lang/String;

    goto :goto_10

    .line 18971
    :cond_21
    sget-boolean v6, Lcom/flyersoft/tools/A;->gl:Z

    if-eqz v6, :cond_22

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v6, v6, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v6, v6, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v6, v1}, Lcom/radaee/reader/GLView;->isAnnotFreeText(Lcom/radaee/pdf/Page$Annotation;)Z

    move-result v6

    goto :goto_e

    :cond_22
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v6, v6, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v6, v1}, Lcom/radaee/reader/PDFLayoutView;->isAnnotFreeText(Lcom/radaee/pdf/Page$Annotation;)Z

    move-result v6

    :goto_e
    if-eqz v6, :cond_23

    .line 18972
    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetEditText()Ljava/lang/String;

    move-result-object v1

    goto :goto_f

    :cond_23
    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetPopupText()Ljava/lang/String;

    move-result-object v1

    :goto_f
    move-object v6, v1

    .line 18974
    :goto_10
    invoke-virtual {v0, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 18975
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {v1, v7}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    new-instance v7, Lcom/flyersoft/moonreaderp/ActivityTxt$201$9;

    invoke-direct {v7, p0, v0, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt$201$9;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$201;Landroid/widget/EditText;Ljava/lang/String;)V

    .line 18976
    invoke-virtual {v1, v5, v7}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityTxt$201$8;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$201$8;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$201;)V

    .line 18998
    invoke-virtual {v0, v4, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityTxt$201$7;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$201$7;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$201;)V

    .line 19002
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 19006
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 19008
    :cond_24
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->apImage:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_25

    .line 19009
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object p1

    if-eqz p1, :cond_25

    .line 19010
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetType()I

    move-result v0

    const/16 v1, 0xd

    if-ne v0, v1, :cond_25

    .line 19011
    :try_start_0
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 19012
    new-instance v0, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

    iget-object v1, p1, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget v1, v1, Lcom/radaee/pdf/Page;->pageno:I

    invoke-direct {v0, v1, v2, p1}, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;-><init>(IILcom/radaee/pdf/Page$Annotation;)V

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19013
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v4, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-static {}, Lcom/flyersoft/tools/A;->sysAlertDialogWidth()I

    move-result v7

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v6, 0x0

    invoke-virtual/range {v4 .. v9}, Lcom/flyersoft/books/PDFReader;->pdfGetPageAnnotShot(Ljava/util/ArrayList;IILjava/util/HashMap;Z)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 19014
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/image_annot.jpg"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 19015
    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->bitmapToFile(Landroid/graphics/Bitmap;Ljava/lang/String;)Z

    .line 19016
    new-instance p1, Landroid/content/Intent;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-class v2, Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {p1, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 19017
    const-string v1, "imageFile"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 19018
    const-string v0, "singPicOnly"

    invoke-virtual {p1, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 19019
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    move-object p1, v0

    .line 19021
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_25
    :goto_11
    return-void
.end method
