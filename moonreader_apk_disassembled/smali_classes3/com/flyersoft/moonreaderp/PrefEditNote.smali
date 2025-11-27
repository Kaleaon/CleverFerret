.class public Lcom/flyersoft/moonreaderp/PrefEditNote;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefEditNote.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;,
        Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;
    }
.end annotation


# static fields
.field public static final CANCEL:I = 0x0

.field public static final DELETE:I = 0x2

.field public static final SAVE:I = 0x1


# instance fields
.field allCb:Landroid/widget/CheckBox;

.field cancelB:Landroid/widget/TextView;

.field deleteB:Landroid/widget/TextView;

.field done:Z

.field et:Landroid/widget/EditText;

.field highlightAllWord:Ljava/lang/String;

.field imgTag:Landroid/widget/ImageView;

.field isPdfNoFlow:Z

.field note:Lcom/flyersoft/tools/BookDb$NoteInfo;

.field onAfterEditNote:Lcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;

.field pdfAnnot:Lcom/radaee/pdf/Page$Annotation;

.field saveB:Landroid/widget/TextView;

.field showDeleteButton:Z

.field sv:Landroid/widget/ScrollView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/flyersoft/tools/BookDb$NoteInfo;ZLcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;Ljava/lang/String;)V
    .locals 1

    .line 47
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->pref_edit_note:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    .line 48
    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->onAfterEditNote:Lcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;

    .line 49
    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->showDeleteButton:Z

    .line 50
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz p5, :cond_1

    .line 51
    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result p1

    sget-boolean p2, Lcom/flyersoft/tools/A;->isAsiaLanguage:Z

    if-eqz p2, :cond_0

    const/16 p2, 0x32

    goto :goto_0

    :cond_0
    const/16 p2, 0x64

    :goto_0
    if-ge p1, p2, :cond_1

    .line 52
    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->highlightAllWord:Ljava/lang/String;

    :cond_1
    return-void
.end method

.method private addImageTag()V
    .locals 0

    .line 289
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditNote;->addLocalImage()V

    return-void
.end method

.method private addLocalImage()V
    .locals 11

    .line 293
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 294
    sget-object v0, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    invoke-static {v3, v0}, Lcom/flyersoft/tools/A;->addImagesFromOuterFolder(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 295
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->res:Landroid/content/Context;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefEditNote$3;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefEditNote$3;-><init>(Lcom/flyersoft/moonreaderp/PrefEditNote;)V

    sget-object v5, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    const/high16 v4, 0x428c0000    # 70.0f

    .line 302
    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v7

    const/high16 v4, 0x42c80000    # 100.0f

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v8

    const-string v9, ""

    const/4 v10, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v10}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;Ljava/util/ArrayList;ZLjava/lang/String;IIILjava/lang/String;Ljava/lang/String;)V

    .line 303
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->show()V

    return-void
.end method

.method private initView()V
    .locals 7

    const-string v0, "\"<b>"

    .line 91
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->noteEt:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    .line 92
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->okB:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->saveB:Landroid/widget/TextView;

    .line 93
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->cancelB:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->cancelB:Landroid/widget/TextView;

    .line 94
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->thirdB:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->deleteB:Landroid/widget/TextView;

    .line 95
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ScrollView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->sv:Landroid/widget/ScrollView;

    .line 96
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->CheckBox4:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->allCb:Landroid/widget/CheckBox;

    .line 97
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->iv:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->imgTag:Landroid/widget/ImageView;

    .line 99
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->highlightAllWord:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    .line 101
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->allCb:Landroid/widget/CheckBox;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setVisibility(I)V

    goto :goto_1

    .line 104
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->allCb:Landroid/widget/CheckBox;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->highlightAllWord:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/A;->getHighlightAllItem(Ljava/lang/String;)Lcom/flyersoft/tools/A$HighlightAll;

    move-result-object v4

    if-eqz v4, :cond_1

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    :goto_0
    invoke-virtual {v1, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 106
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->allCb:Landroid/widget/CheckBox;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditNote;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->highlight_all:I

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->highlightAllWord:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "</b>\""

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v6, v2, [Ljava/lang/Object;

    aput-object v0, v6, v3

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 108
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 112
    :goto_1
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-eqz v0, :cond_2

    goto :goto_2

    :cond_2
    const/4 v2, 0x0

    :goto_2
    iput-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->isPdfNoFlow:Z

    .line 114
    sget-boolean v0, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v0, :cond_3

    const/high16 v0, 0x41900000    # 18.0f

    goto :goto_3

    :cond_3
    const/high16 v0, 0x41800000    # 16.0f

    .line 115
    :goto_3
    sget v1, Lcom/flyersoft/tools/A;->fontSize:F

    cmpg-float v1, v0, v1

    if-gez v1, :cond_4

    .line 116
    sget v0, Lcom/flyersoft/tools/A;->fontSize:F

    .line 117
    :cond_4
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setTextSize(F)V

    .line 119
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->saveB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->cancelB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->deleteB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->imgTag:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->isPdfNoFlow:Z

    if-eqz v0, :cond_5

    .line 125
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->pdfAnnot:Lcom/radaee/pdf/Page$Annotation;

    .line 126
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v1}, Lcom/flyersoft/books/PDFReader;->pdfAnnotGetText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_4

    .line 128
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 131
    :goto_4
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->showDeleteButton:Z

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    if-nez v0, :cond_6

    .line 132
    iput-boolean v3, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->showDeleteButton:Z

    .line 134
    :cond_6
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->showDeleteButton:Z

    if-eqz v0, :cond_7

    .line 135
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->deleteB:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 136
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->deleteB:Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->delete:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 137
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setCursorVisible(Z)V

    .line 138
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefEditNote$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefEditNote$1;-><init>(Lcom/flyersoft/moonreaderp/PrefEditNote;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 146
    :cond_7
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditNote;->setNoteImage()V

    return-void
.end method

.method private setNoteImage()V
    .locals 2

    .line 150
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->isPdfNoFlow:Z

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->phOption:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    .line 154
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->phOption:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefEditNote$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefEditNote$2;-><init>(Lcom/flyersoft/moonreaderp/PrefEditNote;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 3

    .line 308
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->done:Z

    if-nez v0, :cond_3

    .line 309
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->isPdfNoFlow:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 314
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->onAfterEditNote:Lcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v2, v1}, Lcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;->AfterEditNote(ILjava/lang/String;)V

    goto :goto_1

    .line 310
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz v0, :cond_2

    .line 311
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    .line 312
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->onAfterEditNote:Lcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v0, v2, v1}, Lcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;->AfterEditNote(ILjava/lang/String;)V

    .line 316
    :cond_3
    :goto_1
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 246
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->saveB:Landroid/widget/TextView;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne p1, v0, :cond_7

    .line 247
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz v0, :cond_0

    .line 248
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    .line 250
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->highlightAllWord:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 251
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->highlightAllWord:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getHighlightAllItem(Ljava/lang/String;)Lcom/flyersoft/tools/A$HighlightAll;

    move-result-object v0

    .line 252
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->allCb:Landroid/widget/CheckBox;

    invoke-virtual {v4}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 253
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-boolean v4, v4, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    if-eqz v4, :cond_1

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-boolean v4, v4, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    if-eqz v4, :cond_2

    const/4 v4, 0x2

    goto :goto_0

    :cond_2
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-boolean v4, v4, Lcom/flyersoft/tools/BookDb$NoteInfo;->squiggly:Z

    if-eqz v4, :cond_3

    const/4 v4, 0x3

    goto :goto_0

    :cond_3
    const/4 v4, 0x0

    .line 254
    :goto_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "|"

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget v4, v4, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    if-nez v0, :cond_4

    .line 256
    new-instance v0, Lcom/flyersoft/tools/A$HighlightAll;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->highlightAllWord:Ljava/lang/String;

    invoke-direct {v0, v5, v4}, Lcom/flyersoft/tools/A$HighlightAll;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    sget-object v5, Lcom/flyersoft/tools/A;->highlightAllItems:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 259
    :cond_4
    iput-object v4, v0, Lcom/flyersoft/tools/A$HighlightAll;->style:Ljava/lang/String;

    .line 260
    invoke-static {v0}, Lcom/flyersoft/tools/A;->updateHighlightAllItem(Lcom/flyersoft/tools/A$HighlightAll;)V

    goto :goto_1

    .line 262
    :cond_5
    invoke-static {v0, v3}, Lcom/flyersoft/tools/A;->deleteHighlightAllItem(Lcom/flyersoft/tools/A$HighlightAll;Z)V

    .line 265
    :cond_6
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->onAfterEditNote:Lcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Lcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;->AfterEditNote(ILjava/lang/String;)V

    .line 266
    iput-boolean v3, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->done:Z

    .line 267
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditNote;->cancel()V

    .line 270
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->cancelB:Landroid/widget/TextView;

    if-ne p1, v0, :cond_8

    .line 271
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->onAfterEditNote:Lcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Lcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;->AfterEditNote(ILjava/lang/String;)V

    .line 272
    iput-boolean v3, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->done:Z

    .line 273
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditNote;->cancel()V

    .line 276
    :cond_8
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->deleteB:Landroid/widget/TextView;

    if-ne p1, v0, :cond_9

    .line 277
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->onAfterEditNote:Lcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;->AfterEditNote(ILjava/lang/String;)V

    .line 278
    iput-boolean v3, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->done:Z

    .line 279
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditNote;->cancel()V

    .line 282
    :cond_9
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->imgTag:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_a

    .line 283
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditNote;->addImageTag()V

    :cond_a
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 57
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 58
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditNote;->initView()V

    .line 59
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditNote;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const v0, 0x3f4ccccd    # 0.8f

    .line 60
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, -0x2

    .line 61
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x1

    .line 62
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 63
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHideExit(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->res:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->annotation:I

    .line 64
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 65
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    .line 67
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditNote;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    .line 68
    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenWidth()I

    move-result v0

    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenHeight()I

    move-result v1

    if-le v0, v1, :cond_0

    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenHeight()I

    move-result v0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenWidth()I

    move-result v0

    :goto_0
    mul-int/lit8 v0, v0, 0x5a

    .line 69
    div-int/lit8 v0, v0, 0x64

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    const/16 v0, 0x11

    .line 70
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 72
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->showDeleteButton:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x3

    .line 73
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->softInputMode:I

    goto :goto_1

    .line 75
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditNote;->getWindow()Landroid/view/Window;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->et:Landroid/widget/EditText;

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A;->showKeyboard(Landroid/view/Window;Landroid/widget/EditText;)V

    .line 78
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote;->root:Landroid/view/View;

    invoke-static {}, Lcom/flyersoft/tools/C;->mainBackColor()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method
