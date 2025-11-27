.class Lcom/flyersoft/books/PDFReader$14;
.super Ljava/lang/Object;
.source "PDFReader.java"

# interfaces
.implements Lcom/radaee/view/ILayoutView$PDFLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/PDFReader;
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

    .line 1007
    iput-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnPDFAnnotTapped(ILcom/radaee/pdf/Page$Annotation;)V
    .locals 9

    const/4 p1, 0x1

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 1060
    iget-object p2, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p2}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p2

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideDotViews()Z

    .line 1061
    iget-object p2, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p2}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p2

    invoke-virtual {p2, v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfHideAnnotLay(ZZ)Z

    return-void

    .line 1065
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->inverseLayoutVisible(Z)V

    .line 1066
    invoke-virtual {p2}, Lcom/radaee/pdf/Page$Annotation;->GetType()I

    move-result v1

    const/4 v2, 0x6

    const/4 v3, 0x5

    const/4 v4, 0x3

    const/16 v5, 0xd

    if-eq v1, p1, :cond_3

    if-eq v1, v4, :cond_3

    const/4 v6, 0x4

    if-eq v1, v6, :cond_3

    if-eq v1, v3, :cond_3

    if-eq v1, v2, :cond_3

    if-eq v1, v5, :cond_3

    const/16 v6, 0xf

    if-ne v1, v6, :cond_1

    goto :goto_0

    .line 1088
    :cond_1
    invoke-virtual {p2}, Lcom/radaee/pdf/Page$Annotation;->GetPopupText()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 1090
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p1

    invoke-virtual {p2}, Lcom/radaee/pdf/Page$Annotation;->GetPopupText()Ljava/lang/String;

    move-result-object p2

    const-string v0, "\n"

    const-string v1, "<br>"

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showEpub3Footnote(Ljava/lang/String;)V

    return-void

    .line 1092
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->showAnnotSelect()V

    return-void

    .line 1069
    :cond_3
    :goto_0
    iget-object v6, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v6}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v6

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/ActivityTxt;->apNote:Landroid/widget/ImageView;

    invoke-virtual {v6, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1070
    iget-object v6, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v6}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v6

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/ActivityTxt;->apThickness:Landroid/widget/ImageView;

    const/16 v7, 0x8

    if-eq v1, p1, :cond_4

    if-eq v1, v4, :cond_4

    if-eq v1, v5, :cond_4

    const/4 v8, 0x0

    goto :goto_1

    :cond_4
    const/16 v8, 0x8

    :goto_1
    invoke-virtual {v6, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1071
    iget-object v6, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v6}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v6

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/ActivityTxt;->apImage:Landroid/widget/ImageView;

    if-ne v1, v5, :cond_5

    const/4 v8, 0x0

    goto :goto_2

    :cond_5
    const/16 v8, 0x8

    :goto_2
    invoke-virtual {v6, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1072
    iget-object v6, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v6}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v6

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/ActivityTxt;->apColor:Landroid/widget/ImageView;

    if-eq v1, p1, :cond_6

    if-eq v1, v4, :cond_6

    if-eq v1, v5, :cond_6

    const/4 p1, 0x0

    goto :goto_3

    :cond_6
    const/16 p1, 0x8

    :goto_3
    invoke-virtual {v6, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1073
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p1

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->apFillColor:Landroid/widget/ImageView;

    if-eq v1, v3, :cond_7

    if-ne v1, v2, :cond_8

    :cond_7
    const/4 v7, 0x0

    :cond_8
    invoke-virtual {p1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1074
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p1

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->apCancel:Landroid/widget/ImageView;

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->trash:I

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1075
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfInitThickPanel()V

    .line 1076
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowBottomLay(I)V

    .line 1077
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p1

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfTopLay:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result p1

    if-nez p1, :cond_9

    .line 1078
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p1

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->antSelected:Landroid/widget/ImageView;

    .line 1079
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfSetAnnotButtonBackground()V

    .line 1081
    :cond_9
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-boolean p1, p1, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz p1, :cond_a

    invoke-virtual {p2}, Lcom/radaee/pdf/Page$Annotation;->GetPopupText()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_a

    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-object p1, p1, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {p1, p2}, Lcom/radaee/reader/GLView;->isFreeTextAnnot(Lcom/radaee/pdf/Page$Annotation;)Z

    move-result p1

    if-nez p1, :cond_a

    .line 1082
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p1

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->onPdfAnnotButtonClick:Landroid/view/View$OnClickListener;

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v0}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->apNote:Landroid/widget/ImageView;

    invoke-interface {p1, v0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 1083
    :cond_a
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-boolean p1, p1, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-nez p1, :cond_b

    invoke-virtual {p2}, Lcom/radaee/pdf/Page$Annotation;->GetPopupText()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_b

    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-object p1, p1, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {p1, p2}, Lcom/radaee/reader/PDFLayoutView;->isFreeTextAnnot(Lcom/radaee/pdf/Page$Annotation;)Z

    move-result p1

    if-nez p1, :cond_b

    .line 1084
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p1

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->onPdfAnnotButtonClick:Landroid/view/View$OnClickListener;

    iget-object p2, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p2}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p2

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->apNote:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_b
    return-void
.end method

.method public OnPDFBlankTapped(I)V
    .locals 0

    return-void
.end method

.method public OnPDFDoubleTapped(IFF)Z
    .locals 0

    const/4 p1, 0x1

    .line 1143
    new-array p1, p1, [Ljava/lang/Object;

    const/4 p2, 0x0

    const-string p3, "*OnPDFDoubleTapped"

    aput-object p3, p1, p2

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return p2
.end method

.method public OnPDFLongPressed(IFF)V
    .locals 0

    return-void
.end method

.method public OnPDFOpen3D(Ljava/lang/String;)V
    .locals 4

    .line 1010
    const-string v0, "#err#"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 1011
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-object p1, p1, Lcom/flyersoft/books/PDFReader;->warningDlg:Lcom/flyersoft/components/MyDialog;

    if-eqz p1, :cond_0

    goto/16 :goto_1

    .line 1013
    :cond_0
    sget-boolean p1, Lcom/flyersoft/tools/A;->askPdfScrollToPage1Issue:Z

    if-nez p1, :cond_1

    goto :goto_1

    .line 1015
    :cond_1
    const-string p1, "<big><b>Warning</b></big><br><br>A temporary hardware rendering error detected (Page scroll back to 1st page). <br><br><b>Please restart your device</b> to let the system fix itself automatically, or set \"PDF Options - Rendering engine\" to OpenGL.<br>"

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    .line 1019
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    .line 1020
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1021
    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v2}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1022
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1023
    sget-boolean p1, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz p1, :cond_2

    const/high16 p1, 0x41a00000    # 20.0f

    goto :goto_0

    :cond_2
    const/high16 p1, 0x41900000    # 18.0f

    :goto_0
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 p1, -0x2

    const/4 v2, -0x1

    .line 1024
    invoke-virtual {v0, v1, v2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    .line 1025
    new-instance p1, Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v1

    invoke-direct {p1, v1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 1026
    sget v1, Lcom/flyersoft/moonreaderp/R$string;->do_not_ask_again:I

    invoke-virtual {p1, v1}, Landroid/widget/CheckBox;->setText(I)V

    .line 1027
    invoke-virtual {v0, p1, v2, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    .line 1029
    iget-object v1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    new-instance v2, Lcom/flyersoft/components/MyDialog;

    iget-object v3, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v3}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 1030
    invoke-virtual {v2, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/books/PDFReader$14$1;

    invoke-direct {v2, p0, p1}, Lcom/flyersoft/books/PDFReader$14$1;-><init>(Lcom/flyersoft/books/PDFReader$14;Landroid/widget/CheckBox;)V

    const p1, 0x104000a

    .line 1031
    invoke-virtual {v0, p1, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/4 v0, 0x0

    .line 1038
    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    iput-object p1, v1, Lcom/flyersoft/books/PDFReader;->warningDlg:Lcom/flyersoft/components/MyDialog;

    .line 1039
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-object p1, p1, Lcom/flyersoft/books/PDFReader;->warningDlg:Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_3
    :goto_1
    return-void
.end method

.method public OnPDFOpenAttachment(Ljava/lang/String;)V
    .locals 1

    .line 1132
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v0}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/flyersoft/tools/T;->openFileWithDefaultApp(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method public OnPDFOpenJS(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public OnPDFOpenMovie(Ljava/lang/String;)V
    .locals 3

    .line 1114
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1115
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/radaee/pdf/Global;->tmp_path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1116
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1117
    const-string v1, ".mp3"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, ".wma"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, ".wav"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 1120
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v0}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->playVideo(Ljava/lang/String;)V

    return-void

    .line 1118
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v0}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->playMp3(Ljava/lang/String;)V

    return-void
.end method

.method public OnPDFOpenRendition(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public OnPDFOpenSound([ILjava/lang/String;)V
    .locals 2

    .line 1125
    const-string p1, "/"

    invoke-virtual {p2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1126
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/radaee/pdf/Global;->tmp_path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 1127
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->playMp3(Ljava/lang/String;)V

    return-void
.end method

.method public OnPDFOpenURI(Ljava/lang/String;)V
    .locals 3

    .line 1103
    :try_start_0
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1104
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->openUrlAsk(Ljava/lang/String;)V

    return-void

    .line 1106
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v0}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v1, v2, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 1108
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method public OnPDFPageChanged(I)V
    .locals 1

    .line 1051
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->thumbView:Lcom/radaee/util/PDFThumbView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->thumbView:Lcom/radaee/util/PDFThumbView;

    invoke-virtual {v0}, Lcom/radaee/util/PDFThumbView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 1052
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->thumbView:Lcom/radaee/util/PDFThumbView;

    invoke-virtual {v0, p1}, Lcom/radaee/util/PDFThumbView;->thumbGotoPage(I)V

    .line 1053
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v0, p1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$mafterPageChanged(Lcom/flyersoft/books/PDFReader;I)V

    const/4 p1, 0x0

    .line 1054
    invoke-static {p1}, Lcom/radaee/pdf/Global;->hideAnnots(Z)V

    return-void
.end method

.method public OnPDFPageDisplayed(Landroid/graphics/Canvas;Lcom/radaee/view/ILayoutView$IVPage;)V
    .locals 0

    return-void
.end method

.method public OnPDFPageModified(I)V
    .locals 0

    const/4 p1, 0x1

    .line 1045
    sput-boolean p1, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    .line 1046
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {p1}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfSaveAnnotsForTime()V

    return-void
.end method

.method public OnPDFPageRendered(Lcom/radaee/view/ILayoutView$IVPage;)V
    .locals 0

    return-void
.end method

.method public OnPDFSearchFinished(Z)V
    .locals 0

    return-void
.end method

.method public OnPDFSelectEnd(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public OnPDFZoomEnd()V
    .locals 3

    .line 1141
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v0}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowLockIcon(ZZ)V

    return-void
.end method

.method public OnPDFZoomStart()V
    .locals 2

    .line 1140
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$14;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-static {v0}, Lcom/flyersoft/books/PDFReader;->-$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowLockIcon(ZZ)V

    return-void
.end method
