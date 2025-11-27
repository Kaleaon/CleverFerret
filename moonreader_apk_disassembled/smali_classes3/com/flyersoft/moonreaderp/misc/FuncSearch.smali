.class public Lcom/flyersoft/moonreaderp/misc/FuncSearch;
.super Ljava/lang/Object;
.source "FuncSearch.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;
    }
.end annotation


# static fields
.field private static custAutoScrollView:Landroid/view/View;

.field private static custBrightnessView:Landroid/view/View;

.field private static custDictView:Landroid/view/View;

.field private static custFullScreenView:Landroid/view/View;

.field private static custImageView:Landroid/view/View;

.field private static custReaderBarView:Landroid/view/View;

.field private static custTtsView:Landroid/view/View;

.field private static dialogs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static dlgTitles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearSearchFuncDialogs()Z
    .locals 2

    .line 178
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    .line 179
    :goto_0
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_2

    .line 180
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/flyersoft/moonreaderp/PrefOptions;

    if-eqz v0, :cond_0

    .line 181
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/PrefOptions;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefOptions;->forFuncSearch:Z

    if-eqz v0, :cond_1

    .line 182
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/PrefOptions;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    goto :goto_1

    .line 183
    :cond_0
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Dialog;

    if-eqz v0, :cond_1

    .line 184
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 185
    :cond_2
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 186
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x0

    .line 187
    sput-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custBrightnessView:Landroid/view/View;

    sput-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custAutoScrollView:Landroid/view/View;

    sput-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custFullScreenView:Landroid/view/View;

    sput-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custImageView:Landroid/view/View;

    sput-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custTtsView:Landroid/view/View;

    sput-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custReaderBarView:Landroid/view/View;

    sput-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custDictView:Landroid/view/View;

    const/4 v0, 0x1

    return v0

    :cond_3
    return v1
.end method

.method public static getRelativeTop(Landroid/view/View;Landroid/view/View;)I
    .locals 1

    .line 324
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-ne v0, p1, :cond_0

    .line 325
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result p0

    return p0

    .line 327
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    invoke-static {p0, p1}, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->getRelativeTop(Landroid/view/View;Landroid/view/View;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/2addr v0, p0

    return v0

    :catch_0
    move-exception p0

    .line 329
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static getSearchResults(Lcom/flyersoft/moonreaderp/PrefOptions;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/moonreaderp/PrefOptions;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;",
            ">;"
        }
    .end annotation

    .line 42
    invoke-static {p0}, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->initDialogs(Lcom/flyersoft/moonreaderp/PrefOptions;)V

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 44
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 45
    :goto_0
    sget-object v3, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 46
    sget-object v3, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Landroid/view/View;

    if-nez v3, :cond_0

    sget-object v3, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_0

    .line 47
    sget-object v3, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 48
    new-instance v3, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;

    sget-object v4, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    sget-object v5, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    sget-object v6, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-direct {v3, v4, v5, v6}, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 51
    :cond_1
    :goto_1
    sget-object p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-ge v1, p0, :cond_5

    .line 52
    sget-object p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 53
    instance-of v2, p0, Lcom/flyersoft/moonreaderp/PrefOptions;

    if-eqz v2, :cond_2

    .line 54
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    move-object v3, p0

    check-cast v3, Lcom/flyersoft/moonreaderp/PrefOptions;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefOptions;->root:Landroid/view/View;

    invoke-static {v2, p0, v3, p1, v0}, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->searchViewForKey(Ljava/lang/String;Ljava/lang/Object;Landroid/view/View;Ljava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_2

    .line 55
    :cond_2
    instance-of v2, p0, Landroid/app/Dialog;

    if-eqz v2, :cond_3

    .line 56
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    move-object v3, p0

    check-cast v3, Landroid/app/Dialog;

    invoke-virtual {v3}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    invoke-static {v2, p0, v3, p1, v0}, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->searchViewForKey(Ljava/lang/String;Ljava/lang/Object;Landroid/view/View;Ljava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_2

    .line 57
    :cond_3
    instance-of v2, p0, Landroid/view/View;

    if-eqz v2, :cond_4

    .line 58
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    move-object v3, p0

    check-cast v3, Landroid/view/View;

    invoke-static {v2, p0, v3, p1, v0}, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->searchViewForKey(Ljava/lang/String;Ljava/lang/Object;Landroid/view/View;Ljava/lang/String;Ljava/util/ArrayList;)V

    :cond_4
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_5
    return-object v0
.end method

.method public static getTitleView(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 4

    const/4 v0, 0x0

    if-eqz p0, :cond_3

    .line 335
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_3

    if-nez p1, :cond_0

    goto :goto_1

    .line 337
    :cond_0
    instance-of v1, p0, Landroid/widget/TextView;

    if-eqz v1, :cond_1

    .line 338
    move-object v1, p0

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 339
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v2

    sget v3, Landroidx/appcompat/R$id;->search_src_text:I

    if-eq v2, v3, :cond_1

    return-object v1

    .line 342
    :cond_1
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_3

    const/4 v1, 0x0

    .line 343
    :goto_0
    move-object v2, p0

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_3

    .line 344
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->getTitleView(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v2

    if-eqz v2, :cond_2

    return-object v2

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return-object v0
.end method

.method public static initDialogs(Lcom/flyersoft/moonreaderp/PrefOptions;)V
    .locals 10

    .line 64
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "("

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->app:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ") "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->menu_options:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 67
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    const/4 v7, 0x0

    if-eqz v0, :cond_d

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    .line 71
    instance-of v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;

    if-nez v0, :cond_0

    .line 72
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {v0, v1}, Lcom/flyersoft/moonreaderp/PrefVisual;-><init>(Landroid/content/Context;)V

    .line 73
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->initView()V

    .line 74
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->visual_options:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    :cond_0
    instance-of v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;

    const/4 v8, 0x0

    if-nez v0, :cond_4

    .line 78
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    if-eqz v0, :cond_1

    .line 79
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/flyersoft/books/PDFReader;

    invoke-direct {v0, v1}, Lcom/flyersoft/books/PDFReader;-><init>(Landroid/content/Context;)V

    .line 80
    :goto_0
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefPdf;

    invoke-direct {v2, v1, v0, v8}, Lcom/flyersoft/moonreaderp/PrefPdf;-><init>(Landroid/content/Context;Lcom/flyersoft/books/PDFReader;Ljava/lang/String;)V

    .line 81
    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefPdf;->initView()V

    .line 82
    sget-object v3, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-boolean v5, v0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v5, :cond_2

    const-string v0, "CBZ/CBR "

    goto :goto_1

    :cond_2
    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_3

    const-string v0, "DJVU "

    goto :goto_1

    :cond_3
    const-string v0, "PDF "

    :goto_1
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->button_options:I

    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    :cond_4
    instance-of v0, p0, Lcom/flyersoft/moonreaderp/PrefControl;

    if-nez v0, :cond_5

    .line 86
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-direct {v0, v1}, Lcom/flyersoft/moonreaderp/PrefControl;-><init>(Landroid/content/Context;)V

    .line 87
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefControl;->initView()V

    .line 88
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->control_options:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    :cond_5
    instance-of v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;

    if-nez v0, :cond_6

    .line 92
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-direct {v0, v1}, Lcom/flyersoft/moonreaderp/PrefMisc;-><init>(Landroid/content/Context;)V

    .line 93
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->initView()V

    .line 94
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->miscellaneous:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    :cond_6
    instance-of v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    if-nez v0, :cond_7

    .line 98
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-direct {v0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;-><init>(Landroid/content/Context;)V

    .line 99
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->initView()V

    .line 100
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->statubar:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 103
    :cond_7
    instance-of v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;

    if-nez v0, :cond_8

    .line 104
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-direct {v0, v1, v8, v7}, Lcom/flyersoft/moonreaderp/PrefTheme;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;Z)V

    .line 105
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefTheme;->initView()V

    .line 106
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    sget v3, Lcom/flyersoft/moonreaderp/R$array;->options_menu:I

    const/4 v4, 0x3

    invoke-static {v1, v3, v4}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 107
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    :cond_8
    instance-of v9, p0, Lcom/flyersoft/moonreaderp/PrefShelf;

    if-nez v9, :cond_9

    .line 110
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-direct {v0, v1, v7, v8}, Lcom/flyersoft/moonreaderp/PrefShelf;-><init>(Landroid/content/Context;ZLjava/lang/String;)V

    .line 111
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->initView()V

    .line 112
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    :cond_9
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;

    const/4 v4, -0x1

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefSelectHighlight$OnSelectColor;ZILjava/lang/String;)V

    .line 117
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->initView()V

    .line 118
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->highlight:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 121
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    invoke-direct {v0, v1}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;-><init>(Landroid/content/Context;)V

    .line 122
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->initView()V

    .line 123
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->shelf_reading_state_filter:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 124
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 126
    invoke-static {v1, v8, v7, v7}, Lcom/flyersoft/components/DragSort/SelectBar;->customizeSelectBar(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;ZZ)Landroid/view/View;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custDictView:Landroid/view/View;

    .line 127
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->miscellaneous:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " > "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->customize_dictionary:I

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custDictView:Landroid/view/View;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 130
    invoke-static {v1, v7}, Lcom/flyersoft/components/DragSort/ReaderBar;->customizeBottomIcons(Landroid/content/Context;Z)Landroid/view/View;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custReaderBarView:Landroid/view/View;

    .line 131
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->miscellaneous:I

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->customize_bottom_bar1:I

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 132
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custReaderBarView:Landroid/view/View;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    invoke-static {v1, v7}, Lcom/flyersoft/moonreaderp/PrefMisc;->showImageOptions(Landroid/content/Context;Z)Landroid/view/View;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custImageView:Landroid/view/View;

    .line 135
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->miscellaneous:I

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->image_display_options:I

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 136
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custImageView:Landroid/view/View;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    invoke-static {v1, v7}, Lcom/flyersoft/moonreaderp/PrefMisc;->showAutoScrollSettings(Landroid/content/Context;Z)Landroid/view/View;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custAutoScrollView:Landroid/view/View;

    .line 139
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->miscellaneous:I

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x1

    invoke-static {v1, v4}, Lcom/flyersoft/moonreaderp/PrefMisc;->getAutoScrollTitle(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 140
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custAutoScrollView:Landroid/view/View;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    invoke-static {v1, v8, v7}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showTTSMoreOptions(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;Z)Landroid/view/View;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custTtsView:Landroid/view/View;

    .line 143
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->miscellaneous:I

    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->tts_options:I

    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custTtsView:Landroid/view/View;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 146
    invoke-static {v1, v8, v7}, Lcom/flyersoft/moonreaderp/PrefMisc;->showFullScreenSettings(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefMisc;Z)Landroid/view/View;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custFullScreenView:Landroid/view/View;

    .line 147
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->miscellaneous:I

    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->transparent_notification_bar:I

    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 148
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custFullScreenView:Landroid/view/View;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 150
    invoke-static {v1, v7, v7}, Lcom/flyersoft/moonreaderp/PrefMisc;->setBrightnessOptions(Landroid/content/Context;ZZ)Landroid/view/View;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custBrightnessView:Landroid/view/View;

    .line 151
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->miscellaneous:I

    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->brightness:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->deleteQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    sget-object v1, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custBrightnessView:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 155
    instance-of v2, v1, Lcom/flyersoft/moonreaderp/PrefOptions;

    if-eqz v2, :cond_a

    .line 156
    check-cast v1, Lcom/flyersoft/moonreaderp/PrefOptions;

    invoke-virtual {v1, v4}, Lcom/flyersoft/moonreaderp/PrefOptions;->setForFuncSearch(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    goto :goto_2

    .line 158
    :cond_b
    instance-of v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;

    if-eqz v0, :cond_10

    .line 159
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    if-eqz v9, :cond_c

    goto :goto_3

    :cond_c
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->title:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    :goto_3
    invoke-virtual {v0, v7, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 160
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0, v7, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    return-void

    .line 162
    :cond_d
    instance-of v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;

    if-eqz v0, :cond_10

    const/4 v0, 0x0

    .line 163
    :goto_4
    sget-object v1, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_10

    .line 164
    sget-object v1, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 165
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_f

    .line 166
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 167
    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 168
    instance-of v0, v1, Lcom/flyersoft/moonreaderp/PrefShelf;

    if-eqz v0, :cond_e

    goto :goto_5

    :cond_e
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->title:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    .line 169
    :goto_5
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dlgTitles:Ljava/util/ArrayList;

    invoke-virtual {v0, v7, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 170
    sget-object v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0, v7, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    return-void

    :cond_f
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_10
    return-void
.end method

.method public static openSearchResult(Lcom/flyersoft/moonreaderp/PrefOptions;Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;)V
    .locals 9

    .line 220
    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 221
    iget-object p1, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->scrollToTitle(Ljava/lang/String;)V

    return-void

    .line 223
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 226
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p0

    const/4 v7, 0x0

    const/4 v8, 0x0

    if-nez p0, :cond_7

    .line 227
    iget-object p0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    instance-of p0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;

    if-eqz p0, :cond_2

    .line 228
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result p0

    if-nez p0, :cond_1

    .line 229
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showVisualOptions(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 231
    :cond_1
    new-instance p0, Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/moonreaderp/PrefVisual;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->show()V

    goto/16 :goto_0

    .line 232
    :cond_2
    iget-object p0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    instance-of p0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;

    if-eqz p0, :cond_4

    .line 233
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result p0

    if-eqz p0, :cond_3

    .line 234
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showVisualOptions(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 236
    :cond_3
    new-instance p0, Lcom/flyersoft/moonreaderp/PrefPdf;

    new-instance v0, Lcom/flyersoft/books/PDFReader;

    invoke-direct {v0, v1}, Lcom/flyersoft/books/PDFReader;-><init>(Landroid/content/Context;)V

    iget-object v2, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    invoke-direct {p0, v1, v0, v2}, Lcom/flyersoft/moonreaderp/PrefPdf;-><init>(Landroid/content/Context;Lcom/flyersoft/books/PDFReader;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->show()V

    goto/16 :goto_0

    .line 237
    :cond_4
    iget-object p0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    instance-of p0, p0, Lcom/flyersoft/moonreaderp/PrefControl;

    if-eqz p0, :cond_5

    .line 238
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showControlOptions(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 239
    :cond_5
    iget-object p0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    instance-of p0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;

    if-eqz p0, :cond_6

    .line 240
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showMiscOptions(Ljava/lang/String;)V

    goto :goto_0

    .line 241
    :cond_6
    iget-object p0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    instance-of p0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;

    if-eqz p0, :cond_c

    .line 242
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showThemeWindow(Ljava/lang/String;)V

    goto :goto_0

    .line 244
    :cond_7
    iget-object p0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    instance-of p0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;

    if-eqz p0, :cond_8

    .line 245
    new-instance p0, Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/moonreaderp/PrefVisual;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->show()V

    goto :goto_0

    .line 246
    :cond_8
    iget-object p0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    instance-of p0, p0, Lcom/flyersoft/moonreaderp/PrefPdf;

    if-eqz p0, :cond_9

    .line 247
    new-instance p0, Lcom/flyersoft/moonreaderp/PrefPdf;

    new-instance v0, Lcom/flyersoft/books/PDFReader;

    invoke-direct {v0, v1}, Lcom/flyersoft/books/PDFReader;-><init>(Landroid/content/Context;)V

    iget-object v2, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    invoke-direct {p0, v1, v0, v2}, Lcom/flyersoft/moonreaderp/PrefPdf;-><init>(Landroid/content/Context;Lcom/flyersoft/books/PDFReader;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefPdf;->show()V

    goto :goto_0

    .line 248
    :cond_9
    iget-object p0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    instance-of p0, p0, Lcom/flyersoft/moonreaderp/PrefControl;

    if-eqz p0, :cond_a

    .line 249
    new-instance p0, Lcom/flyersoft/moonreaderp/PrefControl;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/moonreaderp/PrefControl;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->show()V

    goto :goto_0

    .line 250
    :cond_a
    iget-object p0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    instance-of p0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;

    if-eqz p0, :cond_b

    .line 251
    new-instance p0, Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->show()V

    goto :goto_0

    .line 252
    :cond_b
    iget-object p0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    instance-of p0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;

    if-eqz p0, :cond_c

    .line 253
    new-instance p0, Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    invoke-direct {p0, v1, v8, v7, v0}, Lcom/flyersoft/moonreaderp/PrefTheme;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;ZLjava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->show()V

    .line 256
    :cond_c
    :goto_0
    iget-object p0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    instance-of p0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;

    if-eqz p0, :cond_d

    .line 257
    iget-object p0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    invoke-static {v1, p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->showShelfOptions(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1

    .line 258
    :cond_d
    iget-object p0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    instance-of p0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    if-eqz p0, :cond_e

    .line 259
    new-instance p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    invoke-direct {p0, v1, v0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->show()V

    goto :goto_1

    .line 260
    :cond_e
    iget-object p0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    instance-of p0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;

    if-eqz p0, :cond_f

    .line 261
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;

    const/4 v5, 0x0

    iget-object v6, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, -0x1

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefSelectHighlight$OnSelectColor;ZILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->show()V

    goto :goto_1

    .line 262
    :cond_f
    iget-object p0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    instance-of p0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    if-eqz p0, :cond_10

    .line 263
    new-instance p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->show()V

    .line 264
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->selfPref:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    iget-object p0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    goto :goto_2

    :cond_10
    :goto_1
    move-object p0, v8

    .line 267
    :goto_2
    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custDictView:Landroid/view/View;

    const/4 v3, 0x1

    if-ne v0, v2, :cond_11

    .line 268
    invoke-static {v1, v8, v7, v3}, Lcom/flyersoft/components/DragSort/SelectBar;->customizeSelectBar(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;ZZ)Landroid/view/View;

    move-result-object p0

    .line 269
    :cond_11
    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custReaderBarView:Landroid/view/View;

    if-ne v0, v2, :cond_12

    .line 270
    invoke-static {v1, v3}, Lcom/flyersoft/components/DragSort/ReaderBar;->customizeBottomIcons(Landroid/content/Context;Z)Landroid/view/View;

    move-result-object p0

    .line 271
    :cond_12
    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custImageView:Landroid/view/View;

    if-ne v0, v2, :cond_13

    .line 272
    invoke-static {v1, v3}, Lcom/flyersoft/moonreaderp/PrefMisc;->showImageOptions(Landroid/content/Context;Z)Landroid/view/View;

    move-result-object p0

    .line 273
    :cond_13
    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custTtsView:Landroid/view/View;

    if-ne v0, v2, :cond_14

    .line 274
    invoke-static {v1, v8, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showTTSMoreOptions(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;Z)Landroid/view/View;

    move-result-object p0

    .line 275
    :cond_14
    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custFullScreenView:Landroid/view/View;

    if-ne v0, v2, :cond_15

    .line 276
    invoke-static {v1, v8, v3}, Lcom/flyersoft/moonreaderp/PrefMisc;->showFullScreenSettings(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefMisc;Z)Landroid/view/View;

    move-result-object p0

    .line 277
    :cond_15
    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custAutoScrollView:Landroid/view/View;

    if-ne v0, v2, :cond_16

    .line 278
    invoke-static {v1, v3}, Lcom/flyersoft/moonreaderp/PrefMisc;->showAutoScrollSettings(Landroid/content/Context;Z)Landroid/view/View;

    move-result-object p0

    .line 279
    :cond_16
    iget-object v0, p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlg:Ljava/lang/Object;

    sget-object v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->custBrightnessView:Landroid/view/View;

    if-ne v0, v2, :cond_17

    .line 280
    invoke-static {v1, v7, v3}, Lcom/flyersoft/moonreaderp/PrefMisc;->setBrightnessOptions(Landroid/content/Context;ZZ)Landroid/view/View;

    move-result-object p0

    :cond_17
    if-eqz p0, :cond_18

    .line 284
    new-instance v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$1;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/moonreaderp/misc/FuncSearch$1;-><init>(Landroid/view/View;Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;)V

    const-wide/16 v1, 0x50

    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_18
    return-void
.end method

.method public static scrollToTitle(Landroid/view/View;Ljava/lang/String;)V
    .locals 3

    if-nez p1, :cond_0

    goto :goto_0

    .line 297
    :cond_0
    invoke-static {p0, p1}, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->getTitleView(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object p1

    if-nez p1, :cond_1

    :goto_0
    return-void

    .line 300
    :cond_1
    new-instance v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;-><init>(Landroid/view/View;Landroid/widget/TextView;)V

    const-wide/16 v1, 0x12c

    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private static searchViewForKey(Ljava/lang/String;Ljava/lang/Object;Landroid/view/View;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Landroid/view/View;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;",
            ">;)V"
        }
    .end annotation

    .line 206
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 208
    :cond_0
    instance-of v0, p2, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 209
    :goto_0
    move-object v1, p2

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 210
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {p0, p1, v1, p3, p4}, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->searchViewForKey(Ljava/lang/String;Ljava/lang/Object;Landroid/view/View;Ljava/lang/String;Ljava/util/ArrayList;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 211
    :cond_1
    instance-of v0, p2, Landroid/widget/TextView;

    if-eqz v0, :cond_2

    .line 212
    move-object v0, p2

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 213
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_2

    .line 214
    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result p2

    sget p3, Landroidx/appcompat/R$id;->search_src_text:I

    if-eq p2, p3, :cond_2

    .line 215
    new-instance p2, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;

    invoke-direct {p2, p0, p1, v0}, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p4, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    :goto_1
    return-void
.end method
