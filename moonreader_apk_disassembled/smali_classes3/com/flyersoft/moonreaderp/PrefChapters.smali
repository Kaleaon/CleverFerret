.class public Lcom/flyersoft/moonreaderp/PrefChapters;
.super Landroid/app/Dialog;
.source "PrefChapters.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefChapters$OnChangeChapter;,
        Lcom/flyersoft/moonreaderp/PrefChapters$MainPagerAdapter;,
        Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;,
        Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;,
        Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;,
        Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;,
        Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;
    }
.end annotation


# static fields
.field public static selfPref:Lcom/flyersoft/moonreaderp/PrefChapters;


# instance fields
.field ProgressDialogCreated:Z

.field act:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field addButton:Landroid/widget/Button;

.field annotColumn:I

.field annotFilter:I

.field annotKey:Ljava/lang/String;

.field annotLvItemTouch:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

.field annots:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;",
            ">;"
        }
    .end annotation
.end field

.field anoteType:I

.field bookmarkAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

.field bookmarkB:Landroid/view/View;

.field bookmarkLay:Landroid/view/ViewGroup;

.field bookmarkList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

.field bookmarkOptionB:Landroid/view/View;

.field chapterAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

.field private chapterId:I

.field chapterLay:Landroid/view/ViewGroup;

.field chapterList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

.field chapterTV:Landroid/widget/TextView;

.field cnNumOptionsB:Landroid/view/View;

.field colorB:Landroid/view/View;

.field curChapterId:Ljava/lang/Integer;

.field dismissed:Z

.field expandIv:Landroid/widget/ImageView;

.field exportB:Landroid/view/View;

.field filterColor:I

.field filterColors:[Ljava/lang/String;

.field filterLay:Landroid/widget/LinearLayout;

.field focusHandler:Landroid/os/Handler;

.field private hasLongTitle:Z

.field private hasSubChapter:Z

.field highlightB:Landroid/view/View;

.field imageHandler:Landroid/os/Handler;

.field imageList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/ref/Reference<",
            "Landroid/graphics/drawable/Drawable;",
            ">;>;"
        }
    .end annotation
.end field

.field imageLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

.field imagesAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

.field imgChapter:I

.field imgPos:I

.field imgSplit:I

.field isPdf:Z

.field mainPager:Lcom/flyersoft/views/MyViewPager;

.field mainPagerContainer:Landroid/view/ViewGroup;

.field mainPagerInflater:Landroid/view/LayoutInflater;

.field nAutoComplete:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

.field nSearchView:Landroidx/appcompat/widget/SearchView;

.field private nToc:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;",
            ">;"
        }
    .end annotation
.end field

.field noteB:Landroid/view/View;

.field private oToc:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;",
            ">;"
        }
    .end annotation
.end field

.field onChangeChapter:Lcom/flyersoft/moonreaderp/PrefChapters$OnChangeChapter;

.field pdfAnnotList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/PDFReader$PdfAnnotItem;",
            ">;"
        }
    .end annotation
.end field

.field pdfShotCaches:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/ref/Reference<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field

.field pdfUpatedPages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field phDelete:Landroid/widget/ImageView;

.field phExit:Landroid/widget/ImageView;

.field progressDlg:Landroid/app/ProgressDialog;

.field res:Landroid/content/Context;

.field reverseB:Landroid/widget/ImageView;

.field root:Landroid/view/View;

.field scrollToLastExecuted:Z

.field setSingleLine:Z

.field showImageTab:Z

.field startX:F

.field startY:F

.field tabIndex:I

.field tabLayout:Lcom/google/android/material/tabs/TabLayout;

.field tocAutoComplete:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

.field tocSearchKey:Ljava/lang/String;

.field tocSearchView:Landroidx/appcompat/widget/SearchView;

.field txtId:I


# direct methods
.method static bridge synthetic -$$Nest$fgethasSubChapter(Lcom/flyersoft/moonreaderp/PrefChapters;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->hasSubChapter:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetnToc(Lcom/flyersoft/moonreaderp/PrefChapters;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nToc:Ljava/util/ArrayList;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetoToc(Lcom/flyersoft/moonreaderp/PrefChapters;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->oToc:Ljava/util/ArrayList;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputnToc(Lcom/flyersoft/moonreaderp/PrefChapters;Ljava/util/ArrayList;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nToc:Ljava/util/ArrayList;

    return-void
.end method

.method static bridge synthetic -$$Nest$maddNewFavorites(Lcom/flyersoft/moonreaderp/PrefChapters;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->addNewFavorites(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mbookmarkTipVisible(Lcom/flyersoft/moonreaderp/PrefChapters;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkTipVisible()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcreateBookmarkAndExit(Lcom/flyersoft/moonreaderp/PrefChapters;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->createBookmarkAndExit(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcreateProgressDlg(Lcom/flyersoft/moonreaderp/PrefChapters;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefChapters;->createProgressDlg(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mdoNoteClick(Lcom/flyersoft/moonreaderp/PrefChapters;Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->doNoteClick(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetCurChapterId(Lcom/flyersoft/moonreaderp/PrefChapters;)I
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getCurChapterId()I

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mhideSystemNavigation(Lcom/flyersoft/moonreaderp/PrefChapters;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->hideSystemNavigation()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mlocateToCurImage(Lcom/flyersoft/moonreaderp/PrefChapters;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->locateToCurImage()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetNoteDeleteVisble(Lcom/flyersoft/moonreaderp/PrefChapters;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->setNoteDeleteVisble()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetTabIndicator(Lcom/flyersoft/moonreaderp/PrefChapters;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->setTabIndicator(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowCurChapterIndicator(Lcom/flyersoft/moonreaderp/PrefChapters;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->showCurChapterIndicator()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowImageLocation(Lcom/flyersoft/moonreaderp/PrefChapters;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->showImageLocation(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshow_bookmark(Lcom/flyersoft/moonreaderp/PrefChapters;Z)Landroid/view/View;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->show_bookmark(Z)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mshow_chapter(Lcom/flyersoft/moonreaderp/PrefChapters;Z)Landroid/view/View;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->show_chapter(Z)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mshow_images(Lcom/flyersoft/moonreaderp/PrefChapters;Z)Landroid/view/View;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->show_images(Z)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mudpateBookChapterExpandedState(Lcom/flyersoft/moonreaderp/PrefChapters;Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->udpateBookChapterExpandedState(Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdateTabContent(Lcom/flyersoft/moonreaderp/PrefChapters;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->updateTabContent(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdateTocExpandIv(Lcom/flyersoft/moonreaderp/PrefChapters;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->updateTocExpandIv()V

    return-void
.end method

.method static bridge synthetic -$$Nest$smcreateShareContent(Ljava/lang/String;Ljava/util/ArrayList;Landroid/content/Context;)Ljava/lang/StringBuilder;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefChapters;->createShareContent(Ljava/lang/String;Ljava/util/ArrayList;Landroid/content/Context;)Ljava/lang/StringBuilder;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Landroid/content/Context;ILcom/flyersoft/moonreaderp/PrefChapters$OnChangeChapter;)V
    .locals 3

    .line 106
    sget-boolean v0, Lcom/flyersoft/tools/A;->eink:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen_ink:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen:I

    :goto_0
    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    const/4 p1, 0x0

    .line 569
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterId:I

    .line 571
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$10;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/moonreaderp/PrefChapters$10;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->focusHandler:Landroid/os/Handler;

    .line 606
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->hasSubChapter:Z

    .line 607
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->hasLongTitle:Z

    const/high16 v0, -0x40800000    # -1.0f

    .line 1075
    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->startX:F

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->startY:F

    .line 1183
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotFilter:I

    const/4 v0, 0x1

    .line 1332
    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotColumn:I

    .line 1807
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->anoteType:I

    .line 1808
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->filterColor:I

    .line 2107
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$24;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/flyersoft/moonreaderp/PrefChapters$24;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageHandler:Landroid/os/Handler;

    .line 2224
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfUpatedPages:Ljava/util/ArrayList;

    .line 2226
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfShotCaches:Ljava/util/HashMap;

    .line 107
    sput-object p0, Lcom/flyersoft/moonreaderp/PrefChapters;->selfPref:Lcom/flyersoft/moonreaderp/PrefChapters;

    .line 108
    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->onChangeChapter:Lcom/flyersoft/moonreaderp/PrefChapters$OnChangeChapter;

    .line 109
    iput p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabIndex:I

    .line 110
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->res:Landroid/content/Context;

    .line 111
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget p3, Lcom/flyersoft/moonreaderp/R$layout;->chapters:I

    const/4 v1, 0x0

    invoke-virtual {p2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->root:Landroid/view/View;

    .line 112
    invoke-virtual {p0, p2}, Lcom/flyersoft/moonreaderp/PrefChapters;->setContentView(Landroid/view/View;)V

    .line 113
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->setCanceledOnTouchOutside(Z)V

    .line 114
    sget-object p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 115
    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result p2

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean p2, p2, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-eqz p2, :cond_1

    const/4 p1, 0x1

    :cond_1
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->isPdf:Z

    return-void
.end method

.method private addNewFavorites(Z)V
    .locals 9

    .line 1128
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->generateBookmarkName()Ljava/lang/String;

    move-result-object v0

    .line 1129
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->createBookmarkProgressText()Ljava/lang/String;

    move-result-object v1

    .line 1130
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ") "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1131
    sget-boolean v0, Lcom/flyersoft/tools/A;->bookmarkManually:Z

    if-eqz v0, :cond_0

    if-nez p1, :cond_1

    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->bookmarkManually:Z

    if-nez v0, :cond_2

    if-nez p1, :cond_2

    .line 1133
    :cond_1
    new-instance v3, Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v4

    new-instance v6, Lcom/flyersoft/moonreaderp/PrefChapters$18;

    invoke-direct {v6, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$18;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    .line 1137
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v8

    const/4 v7, 0x0

    invoke-direct/range {v3 .. v8}, Lcom/flyersoft/moonreaderp/PrefEditBookmark;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefEditBookmark$OnAfterEdit;Ljava/lang/Integer;Landroid/view/View;)V

    return-void

    .line 1139
    :cond_2
    invoke-direct {p0, v5}, Lcom/flyersoft/moonreaderp/PrefChapters;->createBookmarkAndExit(Ljava/lang/String;)V

    return-void
.end method

.method public static boldKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string v0, "(?i)("

    .line 1769
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 1772
    :cond_0
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "<b>$1</b>"

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "\n"

    const-string v1, "<br>"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :goto_0
    return-object p0
.end method

.method private bookmarkTipVisible()V
    .locals 5

    .line 1116
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tipIv:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 1117
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-lez v1, :cond_0

    const/16 v1, 0x8

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1118
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    sget v4, Lcom/flyersoft/moonreaderp/R$id;->tipTv:I

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_1

    const/16 v4, 0x8

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    :goto_1
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 1119
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    sget v4, Lcom/flyersoft/moonreaderp/R$id;->toolbar:I

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_2

    goto :goto_2

    :cond_2
    const/4 v2, 0x0

    :goto_2
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1120
    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_4

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1121
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v1, :cond_3

    const/16 v1, 0x50

    goto :goto_3

    :cond_3
    const/16 v1, 0x64

    :goto_3
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 1123
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_4
    return-void
.end method

.method private checkIfHasSubChapter()V
    .locals 5

    .line 609
    sget-boolean v0, Lcom/flyersoft/tools/A;->isChinese:Z

    if-eqz v0, :cond_0

    const/16 v0, 0x14

    goto :goto_0

    :cond_0
    const/16 v0, 0x28

    .line 610
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->oToc:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;

    .line 611
    iget-object v3, v2, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->name:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v0, :cond_2

    .line 612
    iput-boolean v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->hasLongTitle:Z

    .line 615
    :cond_2
    iget v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->indent:I

    if-lez v2, :cond_1

    .line 616
    iput-boolean v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->hasSubChapter:Z

    goto :goto_1

    :cond_3
    return-void
.end method

.method public static cleanChapterTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 784
    const-string v0, "#"

    invoke-static {p0, v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->cleanChar(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 785
    const-string v0, "="

    invoke-static {p0, v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->cleanChar(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static cleanChar(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 790
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 791
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-lez v0, :cond_0

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v0, v3, :cond_0

    .line 792
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 793
    :cond_0
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v0, v3, :cond_1

    .line 794
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 795
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    :cond_2
    return-object p0
.end method

.method private createBookmarkAndExit(Ljava/lang/String;)V
    .locals 3

    .line 1143
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->dismiss()V

    .line 1144
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->createBookmark(Ljava/lang/String;ZZ)V

    return-void
.end method

.method private createProgressDlg(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 2094
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->progressDlg:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 2095
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 2096
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p1, p2, v1, v1}, Lcom/flyersoft/tools/A;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/app/ProgressDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->progressDlg:Landroid/app/ProgressDialog;

    .line 2097
    new-instance p2, Lcom/flyersoft/moonreaderp/PrefChapters$23;

    invoke-direct {p2, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$23;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    invoke-virtual {p1, p2}, Landroid/app/ProgressDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 2104
    iput-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->ProgressDialogCreated:Z

    return-void
.end method

.method private static createShareContent(Ljava/lang/String;Ljava/util/ArrayList;Landroid/content/Context;)Ljava/lang/StringBuilder;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;",
            ">;",
            "Landroid/content/Context;",
            ")",
            "Ljava/lang/StringBuilder;"
        }
    .end annotation

    .line 1926
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1928
    sget-boolean v1, Lcom/flyersoft/tools/A;->shareWithChapter:Z

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 1930
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    if-eqz v1, :cond_2

    .line 1932
    invoke-static {p0}, Lcom/flyersoft/tools/A;->getBookType(Ljava/lang/String;)I

    move-result v4

    const/4 v5, 0x7

    if-ne v4, v5, :cond_1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    invoke-static {p1, v2}, Lcom/flyersoft/moonreaderp/PrefChapters;->sortAnnotsByPos(Ljava/util/ArrayList;Z)V

    .line 1935
    :cond_2
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v2, -0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    :cond_3
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const-string v7, ""

    if-eqz v6, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    .line 1936
    iget-object v8, v6, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz v8, :cond_3

    iget-boolean v8, v6, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->checked:Z

    if-eqz v8, :cond_3

    if-eqz v1, :cond_4

    .line 1937
    iget v8, v6, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    if-eq v2, v8, :cond_4

    .line 1938
    iget v2, v6, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    .line 1939
    iget-object v8, v6, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget v8, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    sget-object v9, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v9}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v8, v9, :cond_4

    .line 1940
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "<br><br><font color=\'#555555\'>\u25c6 "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v9, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    iget-object v10, v6, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget v10, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    invoke-virtual {v9, v10}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v9

    iget-object v9, v9, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "</font>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4
    if-eqz v1, :cond_5

    .line 1943
    const-string v8, "  \u25aa "

    goto :goto_3

    :cond_5
    const-string v8, "\u25aa "

    .line 1944
    :goto_3
    iget-object v9, v6, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v9, v9, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    const-string v10, "<br><br>"

    const-string v11, "<br>"

    const-string v12, "\n"

    if-eqz v9, :cond_6

    add-int/lit8 v4, v4, 0x1

    .line 1946
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v6, v6, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v12, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_2

    :cond_6
    add-int/lit8 v5, v5, 0x1

    .line 1950
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, v6, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v8, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v12, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, " <small><font color=\'#555555\'>(<b><i>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v6, v6, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    .line 1951
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v12, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "</i></b>)</font></small>"

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1950
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_2

    .line 1965
    :cond_7
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-lez p1, :cond_a

    .line 1966
    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1967
    instance-of v1, p2, Lcom/flyersoft/moonreaderp/ActivityMain;

    if-nez v1, :cond_9

    .line 1968
    invoke-static {p0}, Lcom/flyersoft/tools/BookDb;->getBookFromAll(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object p0

    if-eqz p0, :cond_9

    .line 1970
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    goto :goto_4

    :cond_8
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, " - "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    :goto_4
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1972
    :cond_9
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "<b>"

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "</b> ("

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p1, Lcom/flyersoft/moonreaderp/R$string;->highlight:I

    .line 1973
    invoke-virtual {p2, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "; "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->annotation:I

    invoke-virtual {p2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ")<br><br>\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1972
    invoke-virtual {v0, v3, p0}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    :cond_a
    return-object v0
.end method

.method public static createSp(Lcom/flyersoft/tools/BookDb$NoteInfo;ILjava/lang/String;)Landroid/text/Spannable;
    .locals 5

    .line 1780
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ". "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1781
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    const-string v1, "\n"

    const-string v2, " "

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 1783
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1785
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    .line 1786
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr v0, p1

    .line 1788
    new-instance v2, Landroid/text/SpannableString;

    invoke-direct {v2, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 1789
    iget-boolean v3, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    const/16 v4, 0x21

    if-eqz v3, :cond_0

    goto :goto_0

    .line 1791
    :cond_0
    iget-boolean v3, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    if-eqz v3, :cond_1

    goto :goto_0

    .line 1793
    :cond_1
    iget-boolean v3, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->squiggly:Z

    if-eqz v3, :cond_2

    goto :goto_0

    .line 1796
    :cond_2
    new-instance v3, Landroid/text/style/BackgroundColorSpan;

    iget p0, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    invoke-direct {v3, p0}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    invoke-interface {v2, v3, p1, v0, v4}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    :goto_0
    if-eqz p2, :cond_3

    .line 1798
    invoke-virtual {v1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p0

    const/4 p1, -0x1

    if-eq p0, p1, :cond_3

    .line 1800
    new-instance p1, Landroid/text/style/StyleSpan;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    add-int/2addr p2, p0

    invoke-interface {v2, p1, p0, p2, v4}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    :cond_3
    return-object v2
.end method

.method private doNoteClick(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;)V
    .locals 13

    .line 1148
    iget-object v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    if-eqz v0, :cond_0

    iget v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    sget v1, Lcom/flyersoft/tools/A;->lastChapter:I

    if-ne v0, v1, :cond_0

    .line 1149
    iget-object v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    sget-object v1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getText2()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->fixIndentBookmarkPos(Lcom/flyersoft/tools/A$Bookmark;Ljava/lang/String;)Z

    .line 1151
    :cond_0
    iget v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->splitIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 1152
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->onChangeChapter:Lcom/flyersoft/moonreaderp/PrefChapters$OnChangeChapter;

    iget-wide v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    long-to-int v3, v0

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    int-to-long v5, p1

    const/4 v7, 0x0

    const/16 v4, 0x2710

    invoke-interface/range {v2 .. v7}, Lcom/flyersoft/moonreaderp/PrefChapters$OnChangeChapter;->onGetChapter(IIJZ)V

    goto :goto_1

    .line 1153
    :cond_1
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    if-eqz v0, :cond_3

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-nez v0, :cond_3

    .line 1154
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->onChangeChapter:Lcom/flyersoft/moonreaderp/PrefChapters$OnChangeChapter;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    if-eqz v0, :cond_2

    iget-wide v2, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    goto :goto_0

    :cond_2
    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    int-to-long v2, p1

    :goto_0
    move-wide v4, v2

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-interface/range {v1 .. v6}, Lcom/flyersoft/moonreaderp/PrefChapters$OnChangeChapter;->onGetChapter(IIJZ)V

    goto :goto_1

    .line 1156
    :cond_3
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->onChangeChapter:Lcom/flyersoft/moonreaderp/PrefChapters$OnChangeChapter;

    iget v8, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    iget v9, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->splitIndex:I

    iget-wide v10, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    const/4 v12, 0x0

    invoke-interface/range {v7 .. v12}, Lcom/flyersoft/moonreaderp/PrefChapters$OnChangeChapter;->onGetChapter(IIJZ)V

    .line 1158
    :goto_1
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->dismiss()V

    return-void
.end method

.method public static doShare(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;Z)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;",
            ">;Z)V"
        }
    .end annotation

    if-eqz p1, :cond_3

    if-nez p2, :cond_0

    goto/16 :goto_1

    .line 1816
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$array;->notes_import_export:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 1817
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 1818
    const-string v3, "..."

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1819
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x3

    invoke-virtual {v2, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 1822
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v3, v0, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " (TXT)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1823
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v1, v0, v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ("

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->book_cover:I

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x1

    .line 1824
    aget-object v3, v0, v3

    const/4 v4, 0x2

    .line 1825
    aget-object v0, v0, v4

    filled-new-array {v2, v1, v3, v0}, [Ljava/lang/String;

    move-result-object v0

    .line 1827
    new-instance v1, Lcom/flyersoft/components/MyMenu;

    invoke-direct {v1, p0}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefChapters$20;

    invoke-direct {v2, p3, p1, p0, p2}, Lcom/flyersoft/moonreaderp/PrefChapters$20;-><init>(ZLjava/lang/String;Landroid/content/Context;Ljava/util/ArrayList;)V

    invoke-virtual {v1, v0, v2}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p0

    sget p1, Lcom/flyersoft/moonreaderp/R$string;->share:I

    .line 1921
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/MyMenu;->setTitle(I)Lcom/flyersoft/components/MyMenu;

    move-result-object p0

    sget-object p1, Lcom/flyersoft/moonreaderp/PrefChapters;->selfPref:Lcom/flyersoft/moonreaderp/PrefChapters;

    if-eqz p1, :cond_2

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/MyMenu;->setBuilderAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/MyMenu;->show()V

    :cond_3
    :goto_1
    return-void
.end method

.method private getCurChapterId()I
    .locals 5

    .line 589
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->curChapterId:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 590
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, -0x1

    .line 591
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->curChapterId:Ljava/lang/Integer;

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 592
    :goto_0
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nToc:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 593
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nToc:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;

    iget v3, v3, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->index:I

    iget v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterId:I

    if-ne v3, v4, :cond_1

    .line 594
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->curChapterId:Ljava/lang/Integer;

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 597
    :cond_2
    :goto_1
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->curChapterId:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, v0, :cond_5

    .line 598
    :goto_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nToc:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_5

    .line 599
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nToc:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;

    iget v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->index:I

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterId:I

    if-ge v0, v2, :cond_4

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nToc:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-eq v1, v0, :cond_3

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nToc:Ljava/util/ArrayList;

    add-int/lit8 v2, v1, 0x1

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;

    iget v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->index:I

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterId:I

    if-le v0, v2, :cond_4

    .line 600
    :cond_3
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->curChapterId:Ljava/lang/Integer;

    goto :goto_3

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 603
    :cond_5
    :goto_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->curChapterId:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method private getListColumn()I
    .locals 4

    .line 1759
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v0

    .line 1760
    sget-boolean v1, Lcom/flyersoft/tools/A;->isLargeTablet:Z

    const/4 v2, 0x2

    if-eqz v1, :cond_1

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    return v0

    :cond_0
    return v2

    .line 1762
    :cond_1
    sget-boolean v1, Lcom/flyersoft/tools/A;->isTablet:Z

    const/4 v3, 0x1

    if-eqz v1, :cond_3

    if-eqz v0, :cond_2

    return v2

    :cond_2
    return v3

    :cond_3
    if-eqz v0, :cond_4

    return v2

    :cond_4
    return v3
.end method

.method public static getTabLayoutBackColor()I
    .locals 2

    .line 157
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_0

    .line 158
    invoke-static {}, Lcom/flyersoft/tools/C;->toolbarColor()I

    move-result v0

    return v0

    .line 159
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 160
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    if-eqz v1, :cond_1

    sget v1, Lcom/flyersoft/material/components/icons/R$color;->material_grey_850:I

    goto :goto_0

    :cond_1
    sget v1, Lcom/flyersoft/material/components/icons/R$color;->material_grey_200:I

    .line 159
    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static getToolbarSelectedTextColor()I
    .locals 2

    .line 164
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 165
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    if-nez v1, :cond_1

    sget-boolean v1, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    sget v1, Lcom/flyersoft/material/components/icons/R$color;->material_grey_820:I

    goto :goto_1

    :cond_1
    :goto_0
    sget v1, Lcom/flyersoft/material/components/icons/R$color;->material_grey_200:I

    .line 164
    :goto_1
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static getToolbarUnSelectedTextColor()I
    .locals 2

    .line 168
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 169
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    if-nez v1, :cond_1

    sget-boolean v1, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    sget v1, Lcom/flyersoft/material/components/icons/R$color;->material_grey_650:I

    goto :goto_1

    :cond_1
    :goto_0
    sget v1, Lcom/flyersoft/material/components/icons/R$color;->material_grey_400:I

    .line 168
    :goto_1
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    return v0
.end method

.method private hideSystemNavigation()V
    .locals 3

    .line 153
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v2, v0, v1}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Landroid/app/Activity;Landroid/view/View;Z)V

    return-void
.end method

.method private initAnnotLvDragSelect()V
    .locals 6

    .line 1285
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getListColumn()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotColumn:I

    .line 1286
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v1, Lcom/flyersoft/views/recyclerview/MyGridLayoutManager;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v2

    iget v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotColumn:I

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/flyersoft/views/recyclerview/MyGridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 1288
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotLvItemTouch:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    if-nez v0, :cond_0

    .line 1289
    new-instance v0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-direct {v0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotLvItemTouch:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    .line 1290
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$19;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$19;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->setSelectListener(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;)V

    .line 1296
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotLvItemTouch:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->addOnItemTouchListener(Landroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;)V

    :cond_0
    return-void
.end method

.method private initBookmarkSearch()V
    .locals 3

    .line 423
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nSearchView:Landroidx/appcompat/widget/SearchView;

    const v1, -0x777778

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/PrefOptions;->setImageViewTint(Landroid/view/View;I)V

    .line 424
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nSearchView:Landroidx/appcompat/widget/SearchView;

    sget v1, Landroidx/appcompat/R$id;->search_src_text:I

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nAutoComplete:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    const/4 v1, 0x0

    .line 425
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->setThreshold(I)V

    .line 426
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nAutoComplete:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v2

    if-eqz v2, :cond_0

    const v2, -0x111112

    goto :goto_0

    :cond_0
    const v2, -0xddddde

    :goto_0
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->setTextColor(I)V

    .line 427
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nSearchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setSubmitButtonEnabled(Z)V

    .line 429
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nSearchView:Landroidx/appcompat/widget/SearchView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$7;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$7;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Landroidx/appcompat/widget/SearchView$OnQueryTextListener;)V

    .line 441
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nSearchView:Landroidx/appcompat/widget/SearchView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$8;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$8;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setOnCloseListener(Landroidx/appcompat/widget/SearchView$OnCloseListener;)V

    .line 450
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nSearchView:Landroidx/appcompat/widget/SearchView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$9;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$9;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setOnSearchClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private initTocSearch()V
    .locals 3

    .line 383
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tocSearchView:Landroidx/appcompat/widget/SearchView;

    const v1, -0x777778

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/PrefOptions;->setImageViewTint(Landroid/view/View;I)V

    .line 384
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tocSearchView:Landroidx/appcompat/widget/SearchView;

    sget v1, Landroidx/appcompat/R$id;->search_src_text:I

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tocAutoComplete:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    const/4 v1, 0x0

    .line 385
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->setThreshold(I)V

    .line 386
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tocAutoComplete:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v2

    if-eqz v2, :cond_0

    const v2, -0x111112

    goto :goto_0

    :cond_0
    const v2, -0xddddde

    :goto_0
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->setTextColor(I)V

    .line 387
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tocSearchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setSubmitButtonEnabled(Z)V

    .line 389
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tocSearchView:Landroidx/appcompat/widget/SearchView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$4;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$4;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Landroidx/appcompat/widget/SearchView$OnQueryTextListener;)V

    .line 402
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tocSearchView:Landroidx/appcompat/widget/SearchView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$5;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$5;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setOnCloseListener(Landroidx/appcompat/widget/SearchView$OnCloseListener;)V

    .line 413
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tocSearchView:Landroidx/appcompat/widget/SearchView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$6;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$6;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setOnSearchClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private initView()V
    .locals 4

    .line 178
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->exitB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->phExit:Landroid/widget/ImageView;

    .line 179
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sortB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->reverseB:Landroid/widget/ImageView;

    .line 180
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->deleteB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->phDelete:Landroid/widget/ImageView;

    .line 181
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->view_pager_main:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/MyViewPager;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->mainPager:Lcom/flyersoft/views/MyViewPager;

    .line 182
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tab:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/tabs/TabLayout;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabLayout:Lcom/google/android/material/tabs/TabLayout;

    .line 183
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->setReverseBBackground()V

    .line 185
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->phExit:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->reverseB:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 187
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->phDelete:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 189
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->phDelete:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 190
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->isPdf:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1

    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0}, Lcom/flyersoft/books/BaseEBook;->getImageFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->showImageTab:Z

    .line 193
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->setButtonColor()V

    .line 195
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabLayout:Lcom/google/android/material/tabs/TabLayout;

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefChapters;->getTabLayoutBackColor()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/material/tabs/TabLayout;->setBackgroundColor(I)V

    .line 196
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabLayout:Lcom/google/android/material/tabs/TabLayout;

    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefChapters;->getTabLayoutBackColor()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setBackgroundColor(I)V

    .line 197
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabLayout:Lcom/google/android/material/tabs/TabLayout;

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefChapters;->getToolbarUnSelectedTextColor()I

    move-result v2

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefChapters;->getToolbarSelectedTextColor()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lcom/google/android/material/tabs/TabLayout;->setTabTextColors(II)V

    .line 198
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabIndex:I

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->setTabIndicator(I)V

    .line 200
    sget-boolean v0, Lcom/flyersoft/tools/A;->fullscreen:Z

    if-eqz v0, :cond_3

    sget-boolean v0, Lcom/flyersoft/tools/A;->fullscreenWithStatus:Z

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/flyersoft/tools/A;->isCutoutScreen()Z

    move-result v0

    if-nez v0, :cond_3

    .line 201
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->topLay:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget v2, Lcom/flyersoft/tools/A;->sysbar_height:I

    if-lez v2, :cond_2

    sget v2, Lcom/flyersoft/tools/A;->sysbar_height:I

    goto :goto_2

    :cond_2
    const/high16 v2, 0x42200000    # 40.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    :goto_2
    invoke-virtual {v0, v1, v2, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 204
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabLayout:Lcom/google/android/material/tabs/TabLayout;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->mainPager:Lcom/flyersoft/views/MyViewPager;

    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 205
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-nez v0, :cond_4

    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_5

    .line 206
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->phExit:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const v1, -0x181819

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 207
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->reverseB:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 208
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->phDelete:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 211
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->mainPager:Lcom/flyersoft/views/MyViewPager;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$MainPagerAdapter;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$MainPagerAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/MyViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 212
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->mainPager:Lcom/flyersoft/views/MyViewPager;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$2;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/MyViewPager;->addOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;)V

    .line 228
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabIndex:I

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->setTab(I)V

    const/16 v0, 0x3e8

    .line 229
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->splashReversedIndicator(I)V

    return-void
.end method

.method private locateToCurImage()V
    .locals 4

    .line 2139
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    sget v1, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/books/BaseEBook;->getChapterText(I)Ljava/lang/String;

    move-result-object v0

    .line 2140
    const-string v1, "src="

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_2

    .line 2142
    const-string v2, "\""

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    .line 2143
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    if-lez v2, :cond_2

    .line 2145
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2146
    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v1}, Lcom/flyersoft/books/BaseEBook;->getImageFileList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    .line 2148
    sget-object v3, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v3}, Lcom/flyersoft/books/BaseEBook;->getImageFileList()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2149
    sget-boolean v0, Lcom/flyersoft/tools/A;->chapterReversed:Z

    if-eqz v0, :cond_0

    sub-int/2addr v1, v2

    add-int/lit8 v2, v1, -0x1

    .line 2150
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->myScrollTo(I)Z

    return-void

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private refreshChapters()V
    .locals 13

    .line 484
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->oToc:Ljava/util/ArrayList;

    .line 486
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterTV:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 487
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v0

    const/16 v1, 0x64

    const/4 v2, 0x7

    const/4 v3, 0x1

    if-eqz v0, :cond_2

    if-eq v0, v3, :cond_3

    if-eq v0, v2, :cond_1

    if-eq v0, v1, :cond_0

    goto :goto_1

    .line 494
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v0, :cond_3

    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_4

    goto :goto_0

    .line 497
    :cond_1
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfToc:Ljava/util/ArrayList;

    if-eqz v0, :cond_3

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfToc:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_4

    goto :goto_0

    .line 491
    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_4

    :cond_3
    :goto_0
    return-void

    .line 501
    :cond_4
    :goto_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v0

    const/4 v4, 0x0

    if-nez v0, :cond_5

    sget-wide v5, Lcom/flyersoft/tools/A;->lastPosition:J

    const/4 v0, 0x0

    invoke-static {v5, v6, v0, v0}, Lcom/flyersoft/tools/A;->getTxtChapterId(JLcom/flyersoft/tools/A$TxTChapter;Ljava/lang/String;)I

    move-result v0

    goto :goto_2

    :cond_5
    const/4 v0, 0x0

    :goto_2
    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->txtId:I

    .line 502
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->showCurChapterIndicator()V

    .line 504
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v0

    if-eqz v0, :cond_8

    if-eq v0, v3, :cond_8

    if-eq v0, v2, :cond_7

    if-eq v0, v1, :cond_6

    goto :goto_5

    :cond_6
    const/4 v7, 0x0

    .line 511
    :goto_3
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v7, v0, :cond_9

    .line 512
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0, v7}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v0

    .line 513
    iget-object v12, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->oToc:Ljava/util/ArrayList;

    new-instance v5, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;

    iget-object v6, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    iget v8, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->indent:I

    iget-boolean v9, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->hasSubChapter:Z

    iget-boolean v10, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->expanded:Z

    const/4 v11, 0x0

    invoke-direct/range {v5 .. v11}, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;-><init>(Ljava/lang/String;IIZZI)V

    invoke-virtual {v12, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 517
    :cond_7
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfToc:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->oToc:Ljava/util/ArrayList;

    goto :goto_5

    :cond_8
    const/4 v7, 0x0

    .line 507
    :goto_4
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v7, v0, :cond_9

    .line 508
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->oToc:Ljava/util/ArrayList;

    new-instance v5, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;

    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/tools/A$TxTChapter;

    iget-object v6, v6, Lcom/flyersoft/tools/A$TxTChapter;->chapter_trim:Ljava/lang/String;

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v5 .. v11}, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;-><init>(Ljava/lang/String;IIZZI)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 521
    :cond_9
    :goto_5
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->checkIfHasSubChapter()V

    .line 522
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v0

    if-eqz v0, :cond_b

    if-eq v0, v3, :cond_b

    if-eq v0, v2, :cond_a

    if-eq v0, v1, :cond_a

    goto :goto_6

    .line 529
    :cond_a
    sget v0, Lcom/flyersoft/tools/A;->lastChapter:I

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterId:I

    goto :goto_6

    .line 525
    :cond_b
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->txtId:I

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterId:I

    .line 533
    :goto_6
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterId:I

    if-eqz v0, :cond_c

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->oToc:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_c

    .line 534
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->focusHandler:Landroid/os/Handler;

    const-wide/16 v1, 0x64

    invoke-virtual {v0, v4, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 536
    :cond_c
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    if-nez v0, :cond_d

    .line 537
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, v3, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 538
    :cond_d
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    .line 539
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    return-void
.end method

.method private scrollToLastBookmark()V
    .locals 3

    .line 1268
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->scrollToLastExecuted:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 1270
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->scrollToLastExecuted:Z

    .line 1271
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "lastBookMark"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    sget-object v1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 1272
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->myScrollTo(I)Z

    return-void
.end method

.method private setButtonColor()V
    .locals 2

    .line 245
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    const v0, -0xaaaaab

    .line 246
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->expandIv:Landroid/widget/ImageView;

    if-eqz v1, :cond_1

    .line 247
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    :cond_1
    return-void
.end method

.method private setNoteDeleteVisble()V
    .locals 6

    .line 1728
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabIndex:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->getSelectedCount()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1729
    :goto_0
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->phDelete:Landroid/widget/ImageView;

    const/16 v4, 0x8

    if-eqz v0, :cond_1

    const/4 v5, 0x0

    goto :goto_1

    :cond_1
    const/16 v5, 0x8

    :goto_1
    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1730
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->reverseB:Landroid/widget/ImageView;

    if-nez v0, :cond_2

    const/4 v4, 0x0

    :cond_2
    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1731
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->mainPager:Lcom/flyersoft/views/MyViewPager;

    iput-boolean v0, v3, Lcom/flyersoft/views/MyViewPager;->disabled:Z

    .line 1733
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->setSingleLine:Z

    if-nez v0, :cond_4

    .line 1735
    :try_start_0
    iput-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->setSingleLine:Z

    .line 1736
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabLayout:Lcom/google/android/material/tabs/TabLayout;

    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1737
    invoke-virtual {v0}, Landroid/widget/TextView;->setSingleLine()V

    const/4 v3, 0x0

    .line 1738
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 1739
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabLayout:Lcom/google/android/material/tabs/TabLayout;

    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1740
    invoke-virtual {v0}, Landroid/widget/TextView;->setSingleLine()V

    .line 1741
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 1742
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->showImageTab:Z

    if-eqz v0, :cond_4

    .line 1743
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabLayout:Lcom/google/android/material/tabs/TabLayout;

    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1744
    const-string v1, " "

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1745
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->isPdf:Z

    if-eqz v2, :cond_3

    sget v2, Lcom/flyersoft/moonreaderp/R$drawable;->toc_annots:I

    goto :goto_2

    :cond_3
    sget v2, Lcom/flyersoft/moonreaderp/R$drawable;->toc_images:I

    :goto_2
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 1746
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    const v3, -0x777778

    invoke-virtual {v1, v3, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 1747
    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42480000    # 50.0f

    .line 1748
    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->width:I

    const/high16 v3, 0x41a00000    # 20.0f

    .line 1749
    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 1750
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    .line 1753
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1755
    :cond_4
    :goto_3
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->hideSystemNavigation()V

    return-void
.end method

.method private setTab(I)V
    .locals 1

    .line 251
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabIndex:I

    .line 252
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->mainPager:Lcom/flyersoft/views/MyViewPager;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/MyViewPager;->setCurrentItem(I)V

    .line 253
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->setNoteDeleteVisble()V

    return-void
.end method

.method private setTabIndicator(I)V
    .locals 2

    .line 233
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabLayout:Lcom/google/android/material/tabs/TabLayout;

    const/16 v1, -0x7400

    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicatorColor(I)V

    .line 234
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabLayout:Lcom/google/android/material/tabs/TabLayout;

    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    :goto_0
    invoke-virtual {v0, p1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicatorHeight(I)V

    return-void
.end method

.method protected static shareContent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 4

    .line 2004
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "shareContent: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x12c

    if-le v1, v2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    :goto_0
    const/4 v1, 0x0

    invoke-virtual {p2, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    aput-object v0, v3, v1

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 2005
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const v1, 0x13880

    if-ge v0, v1, :cond_6

    .line 2006
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2007
    instance-of v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain;

    if-nez v1, :cond_1

    .line 2008
    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->getBookFromAll(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 2010
    iget-object v0, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    .line 2013
    :cond_1
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.intent.action.SEND"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2014
    const-string v3, "text/plain"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 2015
    const-string v3, "android.intent.extra.SUBJECT"

    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2017
    const-string v0, "android.intent.extra.TEXT"

    if-nez p3, :cond_2

    .line 2018
    invoke-static {p2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, v0, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1

    .line 2020
    :cond_2
    invoke-static {p2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p2

    invoke-virtual {v1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 2021
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getBookThumbFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2022
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 2023
    new-instance p2, Ljava/io/File;

    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p0, p2}, Lcom/flyersoft/tools/A;->getUriProvider(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;

    move-result-object p0

    const-string p1, "android.intent.extra.STREAM"

    invoke-virtual {v1, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 2024
    :cond_3
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/high16 p0, 0x10000000

    .line 2025
    invoke-virtual {v1, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 2028
    :goto_1
    const-string p0, ""

    if-eqz p4, :cond_4

    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 2029
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1, p0}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain;->startActivity(Landroid/content/Intent;)V

    return-void

    :cond_4
    if-nez p4, :cond_5

    .line 2030
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_5

    .line 2031
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1, p0}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->startActivity(Landroid/content/Intent;)V

    :cond_5
    return-void

    .line 2033
    :cond_6
    invoke-static {p2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p2

    if-nez p3, :cond_7

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    .line 2034
    :cond_7
    const-string p3, "Copy to clipboard"

    const-string p4, "Save to txt file"

    filled-new-array {p3, p4}, [Ljava/lang/String;

    move-result-object p3

    .line 2035
    new-instance p4, Lcom/flyersoft/components/MyMenu;

    invoke-direct {p4, p0}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    const-string v0, "Too many items to share directly"

    .line 2036
    invoke-virtual {p4, v0}, Lcom/flyersoft/components/MyMenu;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyMenu;

    move-result-object p4

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$22;

    invoke-direct {v0, p0, p2, p1}, Lcom/flyersoft/moonreaderp/PrefChapters$22;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/String;)V

    .line 2037
    invoke-virtual {p4, p3, v0}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p0

    .line 2064
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefChapters;->selfPref:Lcom/flyersoft/moonreaderp/PrefChapters;

    if-eqz p1, :cond_8

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    goto :goto_2

    :cond_8
    const/4 p1, 0x0

    :goto_2
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/MyMenu;->setBuilderAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object p0

    .line 2065
    invoke-virtual {p0}, Lcom/flyersoft/components/MyMenu;->show()V

    return-void
.end method

.method private showCnChapterNumOptions()V
    .locals 11

    .line 2491
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->cn_chapter:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 2492
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 2494
    sget-boolean v1, Lcom/flyersoft/tools/A;->isChinese:Z

    const/4 v3, 0x1

    const/16 v4, 0x8

    if-eqz v1, :cond_5

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x18

    if-ge v1, v5, :cond_0

    goto/16 :goto_1

    .line 2497
    :cond_0
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radioGroup:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RadioGroup;

    .line 2498
    sget-boolean v5, Lcom/flyersoft/tools/A;->isFanTiChinese:Z

    if-eqz v5, :cond_1

    .line 2499
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->titleTv:I

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 2500
    sget v6, Lcom/flyersoft/moonreaderp/R$id;->radio0:I

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/RadioButton;

    .line 2501
    sget v7, Lcom/flyersoft/moonreaderp/R$id;->radio1:I

    invoke-virtual {v0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/RadioButton;

    .line 2502
    sget v8, Lcom/flyersoft/moonreaderp/R$id;->radio2:I

    invoke-virtual {v0, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/RadioButton;

    .line 2503
    sget v9, Lcom/flyersoft/moonreaderp/R$id;->radio3:I

    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/RadioButton;

    .line 2504
    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v10

    invoke-interface {v10}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/flyersoft/tools/miscellaneous/ChineseJianFanConvert;->convertJian2Fan(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2505
    invoke-virtual {v6}, Landroid/widget/RadioButton;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/flyersoft/tools/miscellaneous/ChineseJianFanConvert;->convertJian2Fan(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 2506
    invoke-virtual {v7}, Landroid/widget/RadioButton;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/flyersoft/tools/miscellaneous/ChineseJianFanConvert;->convertJian2Fan(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 2507
    invoke-virtual {v8}, Landroid/widget/RadioButton;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/flyersoft/tools/miscellaneous/ChineseJianFanConvert;->convertJian2Fan(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8, v5}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 2508
    invoke-virtual {v9}, Landroid/widget/RadioButton;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/flyersoft/tools/miscellaneous/ChineseJianFanConvert;->convertJian2Fan(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9, v5}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 2511
    :cond_1
    sget v5, Lcom/flyersoft/tools/A;->cnChapterNumLevel:I

    if-nez v5, :cond_2

    sget v5, Lcom/flyersoft/moonreaderp/R$id;->radio0:I

    goto :goto_0

    :cond_2
    sget v5, Lcom/flyersoft/tools/A;->cnChapterNumLevel:I

    if-ne v5, v3, :cond_3

    sget v5, Lcom/flyersoft/moonreaderp/R$id;->radio1:I

    goto :goto_0

    :cond_3
    sget v5, Lcom/flyersoft/tools/A;->cnChapterNumLevel:I

    const/4 v6, 0x2

    if-ne v5, v6, :cond_4

    sget v5, Lcom/flyersoft/moonreaderp/R$id;->radio2:I

    goto :goto_0

    :cond_4
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->radio3:I

    :goto_0
    invoke-virtual {v1, v5}, Landroid/widget/RadioGroup;->check(I)V

    .line 2512
    new-instance v5, Lcom/flyersoft/moonreaderp/PrefChapters$26;

    invoke-direct {v5, p0, v0}, Lcom/flyersoft/moonreaderp/PrefChapters$26;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;Landroid/view/View;)V

    invoke-virtual {v1, v5}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    goto :goto_2

    .line 2495
    :cond_5
    :goto_1
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cnChapterNumLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 2525
    :goto_2
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v1, v5}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 2526
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->tip:I

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 2528
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v6

    const/16 v7, 0x64

    if-eq v6, v7, :cond_6

    .line 2529
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_3

    .line 2531
    :cond_6
    invoke-virtual {v5}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    .line 2532
    new-instance v3, Lcom/flyersoft/moonreaderp/PrefChapters$27;

    invoke-direct {v3, p0, v1}, Lcom/flyersoft/moonreaderp/PrefChapters$27;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;Lcom/flyersoft/components/MyDialog;)V

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2543
    :goto_3
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->chapterListAuto:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    .line 2544
    sget-boolean v4, Lcom/flyersoft/tools/A;->listChaptersForNewBook:Z

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 2545
    new-instance v4, Lcom/flyersoft/moonreaderp/PrefChapters$28;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$28;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 2552
    invoke-virtual {v1, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const v1, 0x104000a

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method private showCurChapterIndicator()V
    .locals 4

    .line 544
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v0

    const-string v1, "/"

    if-eqz v0, :cond_3

    const/4 v2, 0x7

    if-eq v0, v2, :cond_1

    const/16 v2, 0x64

    if-eq v0, v2, :cond_0

    goto :goto_0

    .line 550
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    sget v2, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-virtual {v0, v2}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v0

    iget-object v0, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    .line 551
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v3, Lcom/flyersoft/tools/A;->lastChapter:I

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v1}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 554
    :cond_1
    sget v0, Lcom/flyersoft/tools/A;->lastChapter:I

    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfToc:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 555
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfToc:Ljava/util/ArrayList;

    sget v2, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->name:Ljava/lang/String;

    .line 556
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v3, Lcom/flyersoft/tools/A;->lastChapter:I

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfToc:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 561
    :cond_2
    :goto_0
    const-string v0, ""

    move-object v1, v0

    goto :goto_1

    .line 546
    :cond_3
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v0

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->txtId:I

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/A$TxTChapter;

    iget-object v0, v0, Lcom/flyersoft/tools/A$TxTChapter;->chapter_trim:Ljava/lang/String;

    .line 547
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->txtId:I

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 561
    :goto_1
    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->cleanChapterTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 562
    invoke-static {v0}, Lcom/flyersoft/tools/T;->turnCnChapterNum(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 563
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_4

    .line 564
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, " (<b>"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "</b>)"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 566
    :cond_4
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterTV:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private showImageLocation(Ljava/lang/String;)V
    .locals 1

    .line 2160
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$25;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters$25;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;Ljava/lang/String;)V

    .line 2219
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters$25;->start()V

    return-void
.end method

.method private show_bookmark(Z)Landroid/view/View;
    .locals 4

    .line 1019
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    if-nez v0, :cond_3

    .line 1020
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->mainPagerInflater:Landroid/view/LayoutInflater;

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->toc_bookmarks:I

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->mainPagerContainer:Landroid/view/ViewGroup;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    .line 1021
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->phSearch:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SearchView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nSearchView:Landroidx/appcompat/widget/SearchView;

    .line 1022
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bookmarkOption:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkOptionB:Landroid/view/View;

    .line 1023
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bmListView01:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    .line 1024
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1025
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    const v1, -0x777778

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->smallThumbColor:Ljava/lang/Integer;

    .line 1027
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bmAddButton:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->addButton:Landroid/widget/Button;

    .line 1028
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-ge v0, v1, :cond_1

    .line 1029
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->addButton:Landroid/widget/Button;

    sget v1, Lcom/flyersoft/material/components/icons/R$drawable;->btn_default_holo2:I

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 1031
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->noteLay:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->noteB:Landroid/view/View;

    .line 1033
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bookmarkLay:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkB:Landroid/view/View;

    .line 1034
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->highlightLay:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->highlightB:Landroid/view/View;

    .line 1035
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->colorTv:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->colorB:Landroid/view/View;

    .line 1036
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->filterLay:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->filterLay:Landroid/widget/LinearLayout;

    .line 1037
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->exportLay:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->exportB:Landroid/view/View;

    .line 1038
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 1040
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkOptionB:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1041
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->addButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1042
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->addButton:Landroid/widget/Button;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$16;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$16;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1049
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->noteB:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1051
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkB:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1052
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->highlightB:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1053
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->colorB:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1054
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->exportB:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1056
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->showImageTab:Z

    if-nez v0, :cond_2

    .line 1057
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->swipeToClose(Landroid/view/View;)V

    .line 1058
    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/C;->getBottomBarColor()I

    move-result v0

    const/16 v1, -0xa

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v0

    .line 1060
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->toolbar:I

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1061
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->footerSub:I

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1062
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->toolbar:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/C;->setLayIconTertiary(Landroid/view/View;)V

    .line 1063
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->footerSub:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/C;->setLayIconTertiary(Landroid/view/View;)V

    .line 1064
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->initBookmarkSearch()V

    :cond_3
    if-nez p1, :cond_4

    .line 1067
    iget p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabIndex:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_5

    :cond_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    if-nez p1, :cond_5

    .line 1068
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->refreshBookmarkList()V

    .line 1069
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkTipVisible()V

    .line 1072
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    return-object p1
.end method

.method private show_chapter(Z)Landroid/view/View;
    .locals 5

    .line 320
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterLay:Landroid/view/ViewGroup;

    const/16 v1, 0x8

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 321
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->mainPagerInflater:Landroid/view/LayoutInflater;

    sget v3, Lcom/flyersoft/moonreaderp/R$layout;->toc_chapters:I

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->mainPagerContainer:Landroid/view/ViewGroup;

    invoke-virtual {v0, v3, v4, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterLay:Landroid/view/ViewGroup;

    .line 322
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->phSearch:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SearchView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tocSearchView:Landroidx/appcompat/widget/SearchView;

    .line 323
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterLay:Landroid/view/ViewGroup;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->chListView01:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    .line 324
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-nez v0, :cond_0

    .line 325
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    const v3, -0x777778

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iput-object v3, v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->smallThumbColor:Ljava/lang/Integer;

    .line 326
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterLay:Landroid/view/ViewGroup;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->chTextView01:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterTV:Landroid/widget/TextView;

    .line 327
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterLay:Landroid/view/ViewGroup;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->tocCollapse:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->expandIv:Landroid/widget/ImageView;

    .line 328
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 329
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->expandIv:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 330
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterTV:Landroid/widget/TextView;

    invoke-static {}, Lcom/flyersoft/tools/C;->mainTextColor()I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 331
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterLay:Landroid/view/ViewGroup;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->cnNumberOption:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->cnNumOptionsB:Landroid/view/View;

    .line 332
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 333
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->cnNumOptionsB:Landroid/view/View;

    invoke-static {v0}, Lcom/flyersoft/tools/C;->setLayIconTertiary(Landroid/view/View;)V

    .line 336
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->initTocSearch()V

    :cond_1
    const/4 v0, 0x1

    if-nez p1, :cond_2

    .line 338
    iget p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabIndex:I

    if-nez p1, :cond_5

    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    if-nez p1, :cond_5

    .line 340
    :try_start_0
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->refreshChapters()V

    .line 341
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->oToc:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 342
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tocSearchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/SearchView;->setVisibility(I)V

    .line 343
    :cond_3
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->hasSubChapter:Z

    if-nez p1, :cond_4

    .line 344
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->expandIv:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 345
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterTV:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    iput v2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 346
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterLay:Landroid/view/ViewGroup;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bottomToolbar:I

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    goto :goto_0

    .line 348
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->expandIv:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 349
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->expandIv:Landroid/widget/ImageView;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 350
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->updateTocExpandIv()V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 355
    :catch_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->dismiss()V

    .line 359
    :cond_5
    :goto_0
    sget-boolean p1, Lcom/flyersoft/tools/A;->totalPageNum:Z

    if-eqz p1, :cond_6

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->isEbook()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 360
    sget-object p1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$3;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$3;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/books/BaseEBook;->getTotalPageCount(Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;Z)I

    .line 376
    :cond_6
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterLay:Landroid/view/ViewGroup;

    return-object p1
.end method

.method private show_images(Z)Landroid/view/View;
    .locals 4

    .line 2074
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    if-nez v0, :cond_0

    .line 2075
    new-instance v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    .line 2076
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2077
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    const v1, -0x777778

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->smallThumbColor:Ljava/lang/Integer;

    :cond_0
    if-nez p1, :cond_1

    .line 2079
    iget p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabIndex:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_3

    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    if-nez p1, :cond_3

    .line 2080
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object p1

    const/4 v0, 0x1

    if-nez p1, :cond_2

    .line 2081
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v0, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {p1, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 2082
    :cond_2
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->imagesAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    .line 2083
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v1, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 2084
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 2085
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->swipeToClose(Landroid/view/View;)V

    .line 2087
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    return-object p1
.end method

.method private static sortAnnotsByPos(Ljava/util/ArrayList;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;",
            ">;Z)V"
        }
    .end annotation

    .line 1981
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$21;

    invoke-direct {v0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters$21;-><init>(Z)V

    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-void
.end method

.method private splashReversedIndicator(I)V
    .locals 4

    .line 238
    sget-boolean v0, Lcom/flyersoft/tools/A;->chapterReversed:Z

    if-nez v0, :cond_0

    return-void

    .line 240
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->focusHandler:Landroid/os/Handler;

    const/16 v1, 0x3e7

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 241
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->focusHandler:Landroid/os/Handler;

    int-to-long v2, p1

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method private swipeToClose(Landroid/view/View;)V
    .locals 1

    .line 1077
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->mainPager:Lcom/flyersoft/views/MyViewPager;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$17;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$17;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/MyViewPager;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method private udpateBookChapterExpandedState(Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;)V
    .locals 2

    .line 806
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v0

    const/16 v1, 0x64

    if-eq v0, v1, :cond_0

    return-void

    .line 808
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    iget v1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->index:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v0

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->expanded:Z

    iput-boolean p1, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->expanded:Z

    return-void
.end method

.method private updateTabContent(I)V
    .locals 2

    .line 257
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabIndex:I

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 259
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->show_chapter(Z)Landroid/view/View;

    :cond_0
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 261
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->show_bookmark(Z)Landroid/view/View;

    :cond_1
    const/4 v1, 0x2

    if-ne p1, v1, :cond_2

    .line 263
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->show_images(Z)Landroid/view/View;

    :cond_2
    if-nez p1, :cond_3

    const/16 p1, 0x1f4

    .line 266
    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->splashReversedIndicator(I)V

    :cond_3
    return-void
.end method

.method private updateTocExpandIv()V
    .locals 3

    .line 801
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->expandIv:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nToc:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->oToc:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-eq v1, v2, :cond_0

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->toc_expand:I

    goto :goto_0

    :cond_0
    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->toc_collapse:I

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 802
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->setButtonColor()V

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 8

    const/4 v0, 0x0

    .line 1163
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefChapters;->selfPref:Lcom/flyersoft/moonreaderp/PrefChapters;

    const/4 v0, 0x1

    .line 1164
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->dismissed:Z

    .line 1165
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->saveLastBookmarkPos()V

    .line 1166
    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->isPdf:Z

    if-eqz v1, :cond_1

    .line 1167
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfAnnotList:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Lcom/flyersoft/books/PDFReader;->pdfCloseAnnotList(Ljava/util/ArrayList;)V

    .line 1168
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfShotCaches:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 1169
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfUpatedPages:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1170
    sput-boolean v0, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    .line 1171
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfSaveAnnotsForTime()V

    .line 1172
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfUpdateCurPage()V

    .line 1173
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfUpatedPages:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 1174
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v3}, Lcom/flyersoft/books/PDFReader;->getCurPageNo()I

    move-result v3

    int-to-long v3, v3

    cmp-long v5, v1, v3

    if-eqz v5, :cond_0

    .line 1175
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v3}, Lcom/flyersoft/books/PDFReader;->getCurPageNo()I

    move-result v3

    int-to-long v3, v3

    sub-long v3, v1, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(J)J

    move-result-wide v3

    const-wide/16 v5, 0x3

    cmp-long v7, v3, v5

    if-gez v7, :cond_0

    .line 1176
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    long-to-int v2, v1

    invoke-virtual {v3, v2}, Lcom/flyersoft/books/PDFReader;->pdfUpdatePage(I)V

    goto :goto_0

    .line 1179
    :cond_1
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method isEbook()Z
    .locals 2

    .line 478
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v0

    const/16 v1, 0x64

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onBackPressed()V
    .locals 2

    .line 998
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tabIndex:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 999
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->phDelete:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 1000
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->clearChecked()V

    return-void

    .line 1003
    :cond_0
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotFilter:I

    if-nez v0, :cond_1

    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->filterColor:I

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x0

    .line 1004
    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotFilter:I

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->filterColor:I

    .line 1005
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->refreshBookmarkList()V

    return-void

    .line 1009
    :cond_2
    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 11

    .line 823
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->phExit:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_0

    .line 824
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->cancel()V

    .line 826
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->reverseB:Landroid/widget/ImageView;

    const/4 v1, 0x1

    if-ne p1, v0, :cond_3

    .line 827
    sget-boolean v0, Lcom/flyersoft/tools/A;->chapterReversed:Z

    xor-int/2addr v0, v1

    sput-boolean v0, Lcom/flyersoft/tools/A;->chapterReversed:Z

    .line 828
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->setReverseBBackground()V

    .line 829
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    if-eqz v0, :cond_1

    .line 830
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->notifyDataSetChanged()V

    .line 831
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    if-eqz v0, :cond_2

    .line 832
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->notifyDataSetChanged()V

    .line 833
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->imagesAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    if-eqz v0, :cond_3

    .line 834
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->notifyDataSetChanged()V

    .line 837
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->expandIv:Landroid/widget/ImageView;

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-ne p1, v0, :cond_8

    .line 838
    iput-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->tocSearchKey:Ljava/lang/String;

    .line 839
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->nToc:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->oToc:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ne v0, v4, :cond_5

    .line 840
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->oToc:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;

    .line 841
    iget-boolean v5, v4, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->hasSubChapter:Z

    if-eqz v5, :cond_4

    .line 842
    iput-boolean v3, v4, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->expanded:Z

    .line 843
    invoke-direct {p0, v4}, Lcom/flyersoft/moonreaderp/PrefChapters;->udpateBookChapterExpandedState(Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;)V

    goto :goto_0

    .line 846
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->oToc:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;

    .line 847
    iget-boolean v5, v4, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->hasSubChapter:Z

    if-eqz v5, :cond_6

    .line 848
    iput-boolean v1, v4, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->expanded:Z

    .line 849
    invoke-direct {p0, v4}, Lcom/flyersoft/moonreaderp/PrefChapters;->udpateBookChapterExpandedState(Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;)V

    goto :goto_1

    .line 852
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->createToc()V

    .line 853
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->notifyDataSetChanged()V

    .line 854
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->updateTocExpandIv()V

    .line 886
    :cond_8
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkB:Landroid/view/View;

    if-ne p1, v0, :cond_a

    .line 887
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotFilter:I

    if-ne v0, v1, :cond_9

    const/4 v0, 0x0

    goto :goto_2

    :cond_9
    const/4 v0, 0x1

    :goto_2
    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotFilter:I

    .line 888
    iput v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->filterColor:I

    .line 889
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->refreshBookmarkList()V

    .line 891
    :cond_a
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->noteB:Landroid/view/View;

    if-ne p1, v0, :cond_c

    .line 892
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotFilter:I

    const/4 v4, 0x2

    if-ne v0, v4, :cond_b

    const/4 v4, 0x0

    :cond_b
    iput v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotFilter:I

    .line 893
    iput v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->filterColor:I

    .line 894
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->refreshBookmarkList()V

    .line 896
    :cond_c
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->highlightB:Landroid/view/View;

    if-ne p1, v0, :cond_e

    .line 897
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotFilter:I

    const/4 v4, 0x3

    if-ne v0, v4, :cond_d

    const/4 v4, 0x0

    :cond_d
    iput v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotFilter:I

    .line 898
    iput v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->filterColor:I

    .line 899
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->refreshBookmarkList()V

    .line 901
    :cond_e
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->colorB:Landroid/view/View;

    if-ne p1, v0, :cond_f

    .line 902
    new-instance v0, Lcom/flyersoft/components/MyMenu;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->highlight_color:I

    .line 903
    invoke-virtual {v0, v4}, Lcom/flyersoft/components/MyMenu;->setTitle(I)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->filterColors:[Ljava/lang/String;

    new-instance v5, Lcom/flyersoft/moonreaderp/PrefChapters$11;

    invoke-direct {v5, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$11;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    .line 904
    invoke-virtual {v0, v4, v5}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkLay:Landroid/view/ViewGroup;

    .line 912
    invoke-virtual {v0, v4}, Lcom/flyersoft/components/MyMenu;->setBuilderAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    .line 913
    invoke-virtual {v0}, Lcom/flyersoft/components/MyMenu;->show()V

    .line 915
    :cond_f
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->exportB:Landroid/view/View;

    if-ne p1, v0, :cond_13

    .line 916
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    if-eqz v0, :cond_12

    .line 917
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->getSelectedCount()I

    move-result v4

    if-lez v4, :cond_12

    .line 918
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const/4 v5, 0x0

    .line 919
    :goto_3
    iget-object v6, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    array-length v6, v6

    if-ge v5, v6, :cond_11

    .line 920
    iget-object v6, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    aget-boolean v6, v6, v5

    if-eqz v6, :cond_10

    .line 921
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_10
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 922
    :cond_11
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v5, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {v0, v5, v4, v3}, Lcom/flyersoft/moonreaderp/PrefChapters;->doShare(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;Z)V

    goto :goto_4

    .line 924
    :cond_12
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v4, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    invoke-static {v0, v4, v5, v3}, Lcom/flyersoft/moonreaderp/PrefChapters;->doShare(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;Z)V

    .line 927
    :cond_13
    :goto_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->addButton:Landroid/widget/Button;

    if-ne p1, v0, :cond_14

    .line 928
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PrefChapters;->addNewFavorites(Z)V

    .line 931
    :cond_14
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->cnNumOptionsB:Landroid/view/View;

    if-ne p1, v0, :cond_15

    .line 932
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->showCnChapterNumOptions()V

    .line 935
    :cond_15
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkOptionB:Landroid/view/View;

    if-ne p1, v0, :cond_17

    .line 936
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->bookmarks_options:I

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const/high16 v1, 0x41000000    # 8.0f

    .line 937
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    const/high16 v2, 0x41800000    # 16.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-virtual {v0, v1, v4, v5, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 938
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cb1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/CheckBox;

    .line 939
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cb2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/CheckBox;

    .line 940
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cb3:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/widget/CheckBox;

    .line 941
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cb4:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroid/widget/CheckBox;

    .line 942
    sget-boolean v10, Lcom/flyersoft/tools/A;->bookmarkSortByDate:Z

    .line 943
    sget-object v1, Lcom/flyersoft/tools/A;->readWiseToken:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 944
    sput-boolean v3, Lcom/flyersoft/tools/A;->syncReadWise:Z

    .line 946
    :cond_16
    sget-boolean v1, Lcom/flyersoft/tools/A;->bookmarkManually:Z

    invoke-virtual {v6, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 947
    sget-boolean v1, Lcom/flyersoft/tools/A;->bookmarkSortByDate:Z

    invoke-virtual {v7, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 948
    sget v1, Lcom/flyersoft/moonreaderp/R$string;->share_with_chapter:I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 949
    sget-boolean v1, Lcom/flyersoft/tools/A;->shareWithChapter:Z

    invoke-virtual {v8, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 950
    sget-boolean v1, Lcom/flyersoft/tools/A;->syncReadWise:Z

    invoke-virtual {v9, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 952
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$12;

    invoke-direct {v1, p0, v9}, Lcom/flyersoft/moonreaderp/PrefChapters$12;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;Landroid/widget/CheckBox;)V

    invoke-virtual {v9, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 962
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cb4Option:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefChapters$13;

    invoke-direct {v2, p0, v9}, Lcom/flyersoft/moonreaderp/PrefChapters$13;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;Landroid/widget/CheckBox;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 969
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->bookmark:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefChapters$15;

    move-object v5, p0

    invoke-direct/range {v4 .. v10}, Lcom/flyersoft/moonreaderp/PrefChapters$15;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Z)V

    const v1, 0x104000a

    .line 970
    invoke-virtual {v0, v1, v4}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$14;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$14;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    const/high16 v2, 0x1040000

    .line 983
    invoke-virtual {v0, v2, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 988
    invoke-virtual {v0, v3}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    goto :goto_5

    :cond_17
    move-object v5, p0

    .line 991
    :goto_5
    iget-object v0, v5, Lcom/flyersoft/moonreaderp/PrefChapters;->phDelete:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_18

    .line 992
    iget-object p1, v5, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->deleteSelectedAnnots()V

    :cond_18
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 120
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 122
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    .line 125
    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenWidth()I

    move-result v0

    mul-int/lit8 v0, v0, 0x55

    div-int/lit8 v0, v0, 0x64

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    const/4 v0, 0x3

    .line 126
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    const/4 v1, -0x1

    .line 127
    iput v1, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 128
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->softInputMode:I

    const/high16 v0, 0x3f400000    # 0.75f

    .line 129
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 130
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 131
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 132
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 133
    sget-boolean p1, Lcom/flyersoft/tools/A;->eink:Z

    if-nez p1, :cond_0

    .line 134
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getWindow()Landroid/view/Window;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialogLeftPanelAnim:I

    invoke-virtual {p1, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 136
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->hideSystemNavigation()V

    .line 137
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->root:Landroid/view/View;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 138
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->initView()V

    .line 140
    invoke-static {}, Lcom/flyersoft/tools/A;->Android15()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 141
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$1;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    :cond_1
    return-void
.end method

.method protected refreshBookmarkList()V
    .locals 33

    move-object/from16 v0, p0

    .line 1186
    invoke-static {}, Lcom/flyersoft/tools/A;->getHighlights()Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->sortNotes(Ljava/util/ArrayList;)V

    .line 1187
    invoke-static {}, Lcom/flyersoft/tools/A;->getNotes()Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->sortNotes(Ljava/util/ArrayList;)V

    .line 1188
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookmarks()Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->sortBookmarks(Ljava/util/ArrayList;)V

    .line 1190
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    .line 1191
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1192
    iget v2, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotFilter:I

    const/4 v3, -0x1

    const/4 v5, 0x1

    if-eqz v2, :cond_0

    if-ne v2, v5, :cond_5

    :cond_0
    const/4 v2, 0x0

    .line 1193
    :goto_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookmarks()Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v2, v6, :cond_5

    .line 1194
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookmarks()Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    move-object v15, v6

    check-cast v15, Lcom/flyersoft/tools/A$Bookmark;

    .line 1195
    iget v6, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->filterColor:I

    if-eqz v6, :cond_1

    iget v7, v15, Lcom/flyersoft/tools/A$Bookmark;->color:I

    if-ne v6, v7, :cond_3

    .line 1196
    :cond_1
    iget-object v6, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotKey:Ljava/lang/String;

    invoke-static {v6}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2

    iget-object v6, v15, Lcom/flyersoft/tools/A$Bookmark;->name:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    iget-object v7, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotKey:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    if-eq v6, v3, :cond_3

    .line 1197
    :cond_2
    iget-object v6, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    new-instance v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    sget-object v8, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    iget v9, v15, Lcom/flyersoft/tools/A$Bookmark;->chapter:I

    iget v10, v15, Lcom/flyersoft/tools/A$Bookmark;->splitIndex:I

    iget-wide v11, v15, Lcom/flyersoft/tools/A$Bookmark;->position:J

    iget-object v13, v15, Lcom/flyersoft/tools/A$Bookmark;->name:Ljava/lang/String;

    sget v14, Lcom/flyersoft/moonreaderp/R$drawable;->bmtag:I

    iget-wide v4, v15, Lcom/flyersoft/tools/A$Bookmark;->time:J

    add-int/lit8 v19, v2, 0x1

    const/16 v16, 0x0

    move-wide/from16 v17, v4

    invoke-direct/range {v7 .. v19}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;-><init>(Ljava/lang/String;IIJLjava/lang/String;ILcom/flyersoft/tools/A$Bookmark;Lcom/flyersoft/tools/BookDb$NoteInfo;JI)V

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1200
    :cond_3
    iget v4, v15, Lcom/flyersoft/tools/A$Bookmark;->color:I

    if-eqz v4, :cond_4

    .line 1201
    iget v4, v15, Lcom/flyersoft/tools/A$Bookmark;->color:I

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    .line 1202
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v5

    if-ne v5, v3, :cond_4

    .line 1203
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4
    add-int/lit8 v2, v2, 0x1

    const/4 v5, 0x1

    goto :goto_0

    .line 1207
    :cond_5
    iget v2, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotFilter:I

    const-string v4, " "

    const-string v5, ""

    const/4 v6, 0x2

    if-eqz v2, :cond_6

    if-ne v2, v6, :cond_c

    :cond_6
    const/4 v2, 0x0

    const/4 v7, 0x0

    .line 1208
    :goto_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getNotes()Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v2, v8, :cond_c

    .line 1209
    invoke-static {}, Lcom/flyersoft/tools/A;->getNotes()Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 1210
    iget-object v9, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    if-nez v9, :cond_7

    move-object v9, v5

    goto :goto_2

    :cond_7
    iget-object v9, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    .line 1211
    :goto_2
    iget v10, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->filterColor:I

    if-eqz v10, :cond_8

    iget v11, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    if-ne v10, v11, :cond_a

    .line 1212
    :cond_8
    iget-object v10, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotKey:Ljava/lang/String;

    invoke-static {v10}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v10

    iget-object v11, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotKey:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10

    if-eq v10, v3, :cond_a

    .line 1213
    :cond_9
    iget-object v10, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    new-instance v20, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    sget-object v21, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    iget v11, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    iget v12, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    iget-wide v13, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    sget v27, Lcom/flyersoft/moonreaderp/R$drawable;->bmnote:I

    move/from16 v16, v7

    iget-wide v6, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->time:J

    add-int/lit8 v32, v16, 0x1

    const/16 v28, 0x0

    move-wide/from16 v30, v6

    move-object/from16 v29, v8

    move-object/from16 v26, v9

    move/from16 v22, v11

    move/from16 v23, v12

    move-wide/from16 v24, v13

    invoke-direct/range {v20 .. v32}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;-><init>(Ljava/lang/String;IIJLjava/lang/String;ILcom/flyersoft/tools/A$Bookmark;Lcom/flyersoft/tools/BookDb$NoteInfo;JI)V

    move-object/from16 v6, v20

    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move/from16 v7, v32

    .line 1216
    :cond_a
    iget v6, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    .line 1217
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v8

    if-ne v8, v3, :cond_b

    .line 1218
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_b
    add-int/lit8 v2, v2, 0x1

    const/4 v6, 0x2

    goto/16 :goto_1

    .line 1221
    :cond_c
    iget v2, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotFilter:I

    const/4 v6, 0x3

    if-eqz v2, :cond_d

    if-ne v2, v6, :cond_14

    :cond_d
    const/4 v2, 0x0

    const/4 v7, 0x0

    .line 1222
    :goto_3
    invoke-static {}, Lcom/flyersoft/tools/A;->getHighlights()Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v2, v8, :cond_14

    .line 1223
    invoke-static {}, Lcom/flyersoft/tools/A;->getHighlights()Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 1224
    iget-object v9, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    if-nez v9, :cond_e

    move-object v9, v5

    goto :goto_4

    :cond_e
    iget-object v9, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    .line 1225
    :goto_4
    invoke-static {}, Lcom/flyersoft/tools/A;->getNotes()Ljava/util/ArrayList;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v10

    if-ne v10, v3, :cond_12

    .line 1226
    iget v10, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->filterColor:I

    if-eqz v10, :cond_f

    iget v11, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    if-ne v10, v11, :cond_11

    .line 1227
    :cond_f
    iget-object v10, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotKey:Ljava/lang/String;

    invoke-static {v10}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_10

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v10

    iget-object v11, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotKey:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10

    if-eq v10, v3, :cond_11

    .line 1228
    :cond_10
    iget-object v10, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    new-instance v20, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    sget-object v21, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    iget v11, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    iget v12, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    iget-wide v13, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    const-string v15, "\n"

    .line 1229
    invoke-virtual {v9, v15, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v26

    sget v27, Lcom/flyersoft/moonreaderp/R$drawable;->bmhighlight:I

    move v15, v7

    iget-wide v6, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->time:J

    add-int/lit8 v32, v15, 0x1

    const/16 v28, 0x0

    move-wide/from16 v30, v6

    move-object/from16 v29, v8

    move/from16 v22, v11

    move/from16 v23, v12

    move-wide/from16 v24, v13

    invoke-direct/range {v20 .. v32}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;-><init>(Ljava/lang/String;IIJLjava/lang/String;ILcom/flyersoft/tools/A$Bookmark;Lcom/flyersoft/tools/BookDb$NoteInfo;JI)V

    move-object/from16 v6, v20

    .line 1228
    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move/from16 v7, v32

    .line 1232
    :cond_11
    iget v6, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    .line 1233
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v8

    if-ne v8, v3, :cond_13

    .line 1234
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    :cond_12
    move v15, v7

    :cond_13
    :goto_5
    add-int/lit8 v2, v2, 0x1

    const/4 v6, 0x3

    goto/16 :goto_3

    .line 1238
    :cond_14
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_15

    .line 1239
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->colorB:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1240
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->filterColors:[Ljava/lang/String;

    const/4 v4, 0x0

    .line 1241
    :goto_6
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->filterColors:[Ljava/lang/String;

    array-length v2, v1

    if-ge v4, v2, :cond_16

    .line 1242
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "#color#"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->filterColors:[Ljava/lang/String;

    aget-object v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 1244
    :cond_15
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->colorB:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1251
    :cond_16
    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->initAnnotLvDragSelect()V

    .line 1252
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    invoke-direct {v1, v0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    .line 1253
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v2, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 1256
    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->hideSystemNavigation()V

    .line 1258
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkB:Landroid/view/View;

    iget v2, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotFilter:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_17

    sget v2, Lcom/flyersoft/material/components/icons/R$drawable;->list_longpressed_holo:I

    goto :goto_7

    :cond_17
    sget v2, Lcom/flyersoft/material/components/icons/R$drawable;->my_list_selector:I

    :goto_7
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 1259
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->noteB:Landroid/view/View;

    iget v2, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotFilter:I

    const/4 v15, 0x2

    if-ne v2, v15, :cond_18

    sget v2, Lcom/flyersoft/material/components/icons/R$drawable;->list_longpressed_holo:I

    goto :goto_8

    :cond_18
    sget v2, Lcom/flyersoft/material/components/icons/R$drawable;->my_list_selector:I

    :goto_8
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 1260
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->highlightB:Landroid/view/View;

    iget v2, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotFilter:I

    const/4 v9, 0x3

    if-ne v2, v9, :cond_19

    sget v2, Lcom/flyersoft/material/components/icons/R$drawable;->list_longpressed_holo:I

    goto :goto_9

    :cond_19
    sget v2, Lcom/flyersoft/material/components/icons/R$drawable;->my_list_selector:I

    :goto_9
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 1262
    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->scrollToLastBookmark()V

    return-void
.end method

.method saveLastBookmarkPos()V
    .locals 3

    .line 1276
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1277
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "lastBookMark"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget-object v1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    .line 1278
    invoke-virtual {v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->findFirstVisibleItem()I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_0
    return-void
.end method

.method setReverseBBackground()V
    .locals 2

    .line 816
    sget-boolean v0, Lcom/flyersoft/tools/A;->chapterReversed:Z

    if-eqz v0, :cond_0

    .line 817
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->reverseB:Landroid/widget/ImageView;

    const v1, 0x44888888

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    return-void

    .line 819
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters;->reverseB:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getSelectedBorderlessRes(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    return-void
.end method
