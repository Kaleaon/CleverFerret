.class public Lcom/flyersoft/components/Readwise;
.super Ljava/lang/Object;
.source "Readwise.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/Readwise$UploadResult;,
        Lcom/flyersoft/components/Readwise$WiseItem;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addHighlight(Lcom/flyersoft/components/Readwise$WiseItem;Lcom/flyersoft/components/Readwise$UploadResult;)V
    .locals 1

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 61
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    invoke-static {v0, p1}, Lcom/flyersoft/components/Readwise;->addHighlights(Ljava/util/ArrayList;Lcom/flyersoft/components/Readwise$UploadResult;)V

    return-void
.end method

.method public static addHighlights(Ljava/util/ArrayList;Lcom/flyersoft/components/Readwise$UploadResult;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/Readwise$WiseItem;",
            ">;",
            "Lcom/flyersoft/components/Readwise$UploadResult;",
            ")V"
        }
    .end annotation

    .line 66
    sget-object v0, Lcom/flyersoft/tools/A;->readWiseToken:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 68
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/flyersoft/components/Readwise$1;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/components/Readwise$1;-><init>(Ljava/util/ArrayList;Lcom/flyersoft/components/Readwise$UploadResult;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 132
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public static getChapterName(Lcom/flyersoft/tools/BookDb$NoteInfo;)Ljava/lang/String;
    .locals 3

    .line 46
    sget-boolean v0, Lcom/flyersoft/tools/A;->shareWithChapter:Z

    const-string v1, ""

    if-nez v0, :cond_0

    return-object v1

    .line 48
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-nez v0, :cond_1

    return-object v1

    .line 50
    :cond_1
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget v2, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    if-ge v0, v2, :cond_2

    return-object v1

    .line 52
    :cond_2
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    iget p0, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    invoke-virtual {v0, p0}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object p0

    iget-object p0, p0, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    return-object p0
.end method

.method public static showOption(Landroid/content/Context;Landroid/widget/CheckBox;)V
    .locals 6

    .line 136
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->readwise:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 137
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->et:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 138
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->urlEt:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 139
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->about:I

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    new-instance v5, Lcom/flyersoft/components/Readwise$2;

    invoke-direct {v5, p0}, Lcom/flyersoft/components/Readwise$2;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 145
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->about2:I

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    new-instance v5, Lcom/flyersoft/components/Readwise$3;

    invoke-direct {v5, p0}, Lcom/flyersoft/components/Readwise$3;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 151
    sget-object v4, Lcom/flyersoft/tools/A;->readWiseToken:Ljava/lang/String;

    invoke-virtual {v1, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 152
    sget-object v4, Lcom/flyersoft/tools/A;->readWiseUrl:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 153
    new-instance v4, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v4, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v4, Lcom/flyersoft/components/Readwise$4;

    invoke-direct {v4, v3, v1, p0, p1}, Lcom/flyersoft/components/Readwise$4;-><init>(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/Context;Landroid/widget/CheckBox;)V

    const p0, 0x104000a

    .line 154
    invoke-virtual {v0, p0, v4}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const/high16 p1, 0x1040000

    .line 172
    invoke-virtual {p0, p1, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
