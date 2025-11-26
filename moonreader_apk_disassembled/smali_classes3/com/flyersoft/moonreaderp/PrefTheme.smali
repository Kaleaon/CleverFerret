.class public Lcom/flyersoft/moonreaderp/PrefTheme;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefTheme.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;,
        Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;
    }
.end annotation


# static fields
.field public static selfPref:Lcom/flyersoft/moonreaderp/PrefTheme;


# instance fields
.field adapter:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

.field amoledCheck:Landroid/widget/CheckBox;

.field autoThemeCheck:Landroid/widget/CheckBox;

.field autoThemeOption:Landroid/widget/ImageButton;

.field colorCheck:Landroid/widget/CheckBox;

.field colorLayout:Landroid/widget/LinearLayout;

.field dynamicCheck:Landroid/widget/CheckBox;

.field exportTv:Landroid/widget/TextView;

.field forSave:Z

.field gridHeight:I

.field gridWidth:I

.field importTv:Landroid/widget/TextView;

.field nameEdit:Landroid/widget/EditText;

.field onGetTheme:Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;

.field oom:Z

.field pdf:Lcom/flyersoft/books/PDFReader;

.field preAmoled:Z

.field prefThemeFilePick:Lcom/flyersoft/moonreaderp/PrefFilePick;

.field saveButton:Landroid/widget/ImageButton;

.field saveLayout:Landroid/widget/LinearLayout;

.field selectState:Z

.field themeChanged:Z

.field themeGrid:Landroid/widget/GridView;


# direct methods
.method static bridge synthetic -$$Nest$mdoExportThemeFinal(Lcom/flyersoft/moonreaderp/PrefTheme;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefTheme;->doExportThemeFinal(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mdoImportTheme(Lcom/flyersoft/moonreaderp/PrefTheme;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefTheme;->doImportTheme(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mdoImportThemeFinal(Lcom/flyersoft/moonreaderp/PrefTheme;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefTheme;->doImportThemeFinal(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowOverflowMenu(Lcom/flyersoft/moonreaderp/PrefTheme;Landroid/view/View;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefTheme;->showOverflowMenu(Landroid/view/View;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;Z)V
    .locals 1

    const/4 v0, 0x0

    .line 75
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/flyersoft/moonreaderp/PrefTheme;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;ZLjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;ZLjava/lang/String;)V
    .locals 1

    .line 78
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->pref_theme:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    const/4 p1, 0x0

    .line 433
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->oom:Z

    .line 79
    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->forSave:Z

    .line 80
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->onGetTheme:Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;

    .line 81
    invoke-virtual {p0, p4}, Lcom/flyersoft/moonreaderp/PrefTheme;->scrollToTitle(Ljava/lang/String;)V

    return-void
.end method

.method private addFile(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 694
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 695
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public static doAmoledChanged(Z)V
    .locals 4

    .line 815
    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoledUsed:Z

    if-nez v0, :cond_0

    .line 816
    sput-boolean v1, Lcom/flyersoft/tools/A;->amoledUsed:Z

    .line 817
    sget v0, Lcom/flyersoft/tools/A;->woodyResNight:I

    const/4 v2, 0x3

    if-ge v0, v2, :cond_0

    const/4 v0, 0x4

    .line 818
    sput v0, Lcom/flyersoft/tools/A;->woodyResNight:I

    .line 820
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->resetThemes()V

    if-eqz p0, :cond_6

    .line 822
    sget-object p0, Lcom/flyersoft/tools/A;->lastTheme:Ljava/lang/String;

    const-string v0, "Night Theme"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    const/4 v0, 0x0

    if-nez p0, :cond_2

    sget-object p0, Lcom/flyersoft/tools/A;->lastTheme:Ljava/lang/String;

    const-string v2, "Amoled Theme"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 823
    :goto_1
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefTheme;->overwriteTempTheme()Z

    move-result v2

    if-nez p0, :cond_3

    if-eqz v2, :cond_6

    .line 825
    :cond_3
    invoke-static {}, Lcom/flyersoft/tools/A;->NIGHT_THEME()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v0, v0, v0}, Lcom/flyersoft/tools/A;->loadTheme(Ljava/lang/String;ZZZ)V

    .line 826
    const-string v3, "circle_only"

    if-eqz v2, :cond_4

    .line 827
    invoke-static {v3, v1}, Lcom/flyersoft/tools/A;->saveTheme(Ljava/lang/String;Z)V

    :cond_4
    if-nez p0, :cond_6

    if-eqz v2, :cond_5

    .line 829
    const-string v3, "Day Theme"

    :cond_5
    invoke-static {v3, v0, v0, v0}, Lcom/flyersoft/tools/A;->loadTheme(Ljava/lang/String;ZZZ)V

    :cond_6
    return-void
.end method

.method public static doEinkEnable()V
    .locals 3

    const/4 v0, 0x0

    .line 845
    sput v0, Lcom/flyersoft/tools/A;->flip_ebook:I

    sput v0, Lcom/flyersoft/tools/A;->flip_animation:I

    .line 846
    const-string v1, "Day Theme"

    const/4 v2, 0x1

    invoke-static {v1, v2, v0, v0}, Lcom/flyersoft/tools/A;->loadTheme(Ljava/lang/String;ZZZ)V

    const/high16 v1, -0x1000000

    .line 847
    sput v1, Lcom/flyersoft/tools/A;->fontColor:I

    const/4 v1, -0x1

    .line 848
    sput v1, Lcom/flyersoft/tools/A;->backgroundColor:I

    .line 849
    sput-boolean v0, Lcom/flyersoft/tools/A;->useBackgroundImage:Z

    .line 850
    const-string v1, "circle_only"

    invoke-static {v1, v2}, Lcom/flyersoft/tools/A;->saveTheme(Ljava/lang/String;Z)V

    .line 851
    invoke-static {v1, v2, v0, v0}, Lcom/flyersoft/tools/A;->loadTheme(Ljava/lang/String;ZZZ)V

    .line 852
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    if-nez v0, :cond_0

    .line 853
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-boolean v2, Lcom/flyersoft/tools/A;->loadThemeWithColorOnly:Z

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->loadTheme(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method

.method private doExportTheme()V
    .locals 5

    .line 627
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFilePick;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->export:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->adapter:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->getSelectedCount()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/flyersoft/tools/A;->theme_export_path:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/moonreader.mrthemes"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefTheme$8;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefTheme$8;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme;)V

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/flyersoft/moonreaderp/PrefFilePick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;)V

    const-string v1, "*.mrthemes"

    .line 635
    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/PrefFilePick;->setFilter(Ljava/lang/String;)Lcom/flyersoft/moonreaderp/PrefFilePick;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefFilePick;->show()Lcom/flyersoft/moonreaderp/PrefFilePick;

    return-void
.end method

.method private doExportThemeFinal(Ljava/lang/String;)V
    .locals 9

    .line 639
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->adapter:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->getSelectedCount()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 642
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 643
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/themes"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 645
    :goto_0
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->adapter:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->getCount()I

    move-result v4

    if-ge v3, v4, :cond_5

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->adapter:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->checked:[Z

    aget-boolean v4, v4, v3

    if-eqz v4, :cond_4

    .line 646
    invoke-static {}, Lcom/flyersoft/tools/A;->getThemeList()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/A$PageTheme;

    .line 647
    iget-object v5, v4, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    invoke-virtual {v4, v5, v2}, Lcom/flyersoft/tools/A$PageTheme;->saveToXml(Ljava/lang/String;Z)V

    .line 648
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "/theme_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v4, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ".xml"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 649
    invoke-direct {p0, v0, v5}, Lcom/flyersoft/moonreaderp/PrefTheme;->addFile(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 651
    iget-object v6, v4, Lcom/flyersoft/tools/A$PageTheme;->pFontName:Ljava/lang/String;

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    iget-object v6, v4, Lcom/flyersoft/tools/A$PageTheme;->pFontName:Ljava/lang/String;

    invoke-static {v6}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 652
    iget-object v6, v4, Lcom/flyersoft/tools/A$PageTheme;->pFontName:Ljava/lang/String;

    invoke-direct {p0, v0, v6}, Lcom/flyersoft/moonreaderp/PrefTheme;->addFile(Ljava/util/ArrayList;Ljava/lang/String;)V

    goto :goto_1

    .line 653
    :cond_1
    iget-object v6, v4, Lcom/flyersoft/tools/A$PageTheme;->pFontName:Ljava/lang/String;

    invoke-static {v6}, Lcom/flyersoft/tools/A;->isInnerFontName(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 654
    iget-object v6, v4, Lcom/flyersoft/tools/A$PageTheme;->pFontName:Ljava/lang/String;

    invoke-static {v6, v2}, Lcom/flyersoft/tools/A;->getFontFileFromFolder(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v6

    .line 655
    invoke-static {v6}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-static {v6}, Lcom/flyersoft/tools/A;->isFontFile(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 656
    invoke-direct {p0, v0, v6}, Lcom/flyersoft/moonreaderp/PrefTheme;->addFile(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 659
    :cond_2
    :goto_1
    iget-boolean v6, v4, Lcom/flyersoft/tools/A$PageTheme;->pUseBackgroundImage:Z

    if-eqz v6, :cond_4

    .line 660
    iget-object v6, v4, Lcom/flyersoft/tools/A$PageTheme;->pBackgroundImage:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    iget-object v6, v4, Lcom/flyersoft/tools/A$PageTheme;->pBackgroundImage:Ljava/lang/String;

    invoke-static {v6}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 661
    iget-object v4, v4, Lcom/flyersoft/tools/A$PageTheme;->pBackgroundImage:Ljava/lang/String;

    invoke-direct {p0, v0, v4}, Lcom/flyersoft/moonreaderp/PrefTheme;->addFile(Ljava/util/ArrayList;Ljava/lang/String;)V

    goto :goto_2

    .line 663
    :cond_3
    iget-object v4, v4, Lcom/flyersoft/tools/A$PageTheme;->pBackgroundImage:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/A;->getImagesDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_4

    .line 665
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v5}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".png"

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 666
    invoke-static {v4, v5}, Lcom/flyersoft/tools/T;->drawableToFile(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)Z

    .line 667
    invoke-static {v5}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 668
    invoke-direct {p0, v0, v5}, Lcom/flyersoft/moonreaderp/PrefTheme;->addFile(Ljava/util/ArrayList;Ljava/lang/String;)V

    :cond_4
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 674
    :cond_5
    invoke-static {p1}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 675
    invoke-static {v0, p1}, Lcom/flyersoft/tools/compress/MyZip_Java;->zipFiles(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 676
    invoke-static {v1}, Lcom/flyersoft/tools/T;->deleteFolder(Ljava/lang/String;)Z

    .line 677
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-lez v5, :cond_6

    .line 678
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 679
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->export_success:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, " ("

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 681
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v5

    invoke-static {v4, v5, v6}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 680
    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const v1, 0x104000a

    const/4 v3, 0x0

    .line 682
    invoke-virtual {v0, v1, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->send_file:I

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefTheme$9;

    invoke-direct {v3, p0, p1}, Lcom/flyersoft/moonreaderp/PrefTheme$9;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme;Ljava/lang/String;)V

    .line 683
    invoke-virtual {v0, v1, v3}, Lcom/flyersoft/components/MyDialog;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 688
    invoke-virtual {p1, v2}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 690
    :cond_6
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->export_failed:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void
.end method

.method private doImportTheme(Ljava/lang/String;)V
    .locals 6

    .line 700
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/A;->theme_export_path:Ljava/lang/String;

    .line 701
    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getThemeCountInFile(Ljava/lang/String;)I

    move-result v0

    .line 702
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefFilePick;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->import_ebooks:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefTheme$10;

    invoke-direct {v4, p0, v0, p1}, Lcom/flyersoft/moonreaderp/PrefTheme$10;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme;ILjava/lang/String;)V

    invoke-direct {v1, v2, v3, p1, v4}, Lcom/flyersoft/moonreaderp/PrefFilePick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;)V

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->prefThemeFilePick:Lcom/flyersoft/moonreaderp/PrefFilePick;

    .line 714
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefTheme$11;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefTheme$11;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme;)V

    invoke-virtual {v1, p1}, Lcom/flyersoft/moonreaderp/PrefFilePick;->setOnFileChanged(Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;)Lcom/flyersoft/moonreaderp/PrefFilePick;

    move-result-object p1

    const-string v0, "*.mrthemes"

    .line 721
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefFilePick;->setFilter(Ljava/lang/String;)Lcom/flyersoft/moonreaderp/PrefFilePick;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFilePick;->show()Lcom/flyersoft/moonreaderp/PrefFilePick;

    return-void
.end method

.method private doImportThemeFinal(Ljava/lang/String;)V
    .locals 8

    .line 737
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 738
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/themes"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 739
    invoke-static {v1}, Lcom/flyersoft/tools/T;->deleteFolder(Ljava/lang/String;)Z

    .line 740
    invoke-static {p1, v1}, Lcom/flyersoft/tools/compress/MyZip_Java;->unZipFiles(Ljava/lang/String;Ljava/lang/String;)V

    .line 742
    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFolderFileList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    .line 743
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, "/"

    if-eqz v2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 744
    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 745
    invoke-static {v2}, Lcom/flyersoft/tools/A;->isFontFile(Ljava/lang/String;)Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_1

    .line 746
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v6}, Lcom/flyersoft/tools/T;->copyFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    goto :goto_0

    .line 747
    :cond_1
    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/flyersoft/tools/A;->isImageFileExt(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 748
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v6}, Lcom/flyersoft/tools/T;->copyFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    goto :goto_0

    .line 749
    :cond_2
    const-string v5, ".xml"

    invoke-virtual {v2, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    const-string v5, "theme_"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 750
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x4

    const/4 v7, 0x6

    invoke-virtual {v4, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 751
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 752
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v6}, Lcom/flyersoft/tools/T;->copyFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    goto/16 :goto_0

    .line 756
    :cond_3
    invoke-static {v1}, Lcom/flyersoft/tools/T;->deleteFolder(Ljava/lang/String;)Z

    .line 757
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_b

    .line 758
    invoke-static {}, Lcom/flyersoft/tools/A;->resetThemes()V

    .line 759
    invoke-static {}, Lcom/flyersoft/tools/A;->getThemeList()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_4
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_9

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/A$PageTheme;

    .line 760
    iget-object v4, v1, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 761
    iget-object v4, v1, Lcom/flyersoft/tools/A$PageTheme;->pFontName:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/A;->isInnerFontName(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_6

    .line 762
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v1, Lcom/flyersoft/tools/A$PageTheme;->pFontName:Ljava/lang/String;

    invoke-static {v5}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 763
    invoke-static {v4}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-static {v4}, Lcom/flyersoft/tools/A;->isFontFile(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 764
    iput-object v4, v1, Lcom/flyersoft/tools/A$PageTheme;->pFontName:Ljava/lang/String;

    goto :goto_2

    .line 766
    :cond_5
    iget-object v4, v1, Lcom/flyersoft/tools/A$PageTheme;->pFontName:Ljava/lang/String;

    invoke-static {v4, v2}, Lcom/flyersoft/tools/A;->getFontFileFromFolder(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    .line 767
    invoke-static {v4}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-static {v4}, Lcom/flyersoft/tools/A;->isFontFile(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 768
    iput-object v4, v1, Lcom/flyersoft/tools/A$PageTheme;->pFontName:Ljava/lang/String;

    .line 772
    :cond_6
    :goto_2
    iget-boolean v4, v1, Lcom/flyersoft/tools/A$PageTheme;->pUseBackgroundImage:Z

    if-eqz v4, :cond_8

    .line 773
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "/theme_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v1, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".png"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 774
    invoke-static {v4}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 775
    iput-object v4, v1, Lcom/flyersoft/tools/A$PageTheme;->pBackgroundImage:Ljava/lang/String;

    goto :goto_3

    .line 777
    :cond_7
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v1, Lcom/flyersoft/tools/A$PageTheme;->pBackgroundImage:Ljava/lang/String;

    invoke-static {v5}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 778
    invoke-static {v4}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 779
    iput-object v4, v1, Lcom/flyersoft/tools/A$PageTheme;->pBackgroundImage:Ljava/lang/String;

    .line 783
    :cond_8
    :goto_3
    iget-object v4, v1, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    invoke-virtual {v1, v4, v2}, Lcom/flyersoft/tools/A$PageTheme;->saveToXml(Ljava/lang/String;Z)V

    goto/16 :goto_1

    .line 787
    :cond_9
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->adapter:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->notifyDataSetChanged()V

    .line 788
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->colorCheck:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_a

    .line 789
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->colorCheck:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefTheme;->scrollToTitle(Ljava/lang/String;)V

    .line 791
    :cond_a
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 792
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->import_success:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->deleteEndQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 793
    invoke-static {v0}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefTheme$12;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefTheme$12;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme;)V

    const v1, 0x104000a

    .line 794
    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 800
    invoke-virtual {p1, v2}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 802
    :cond_b
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->import_failed:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void
.end method

.method private getThemeCountInFile(Ljava/lang/String;)I
    .locals 3

    .line 726
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 727
    invoke-static {p1}, Lcom/flyersoft/tools/compress/BaseCompressor;->createZipper(Ljava/lang/String;)Lcom/flyersoft/tools/compress/BaseCompressor;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 728
    iget-object v0, p1, Lcom/flyersoft/tools/compress/BaseCompressor;->err:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 729
    invoke-virtual {p1}, Lcom/flyersoft/tools/compress/BaseCompressor;->getAllList()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 730
    const-string v2, ".xml"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public static overwriteTempTheme()Z
    .locals 4

    .line 806
    invoke-static {}, Lcom/flyersoft/tools/A;->createAmoledTheme()V

    .line 807
    new-instance v0, Lcom/flyersoft/tools/A$PageTheme;

    const-string v1, "Amoled Theme"

    invoke-direct {v0, v1}, Lcom/flyersoft/tools/A$PageTheme;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getThemeHash(Lcom/flyersoft/tools/A$PageTheme;)I

    move-result v0

    .line 808
    const-string v1, "Night Theme"

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getThemeHash(Ljava/lang/String;)I

    move-result v1

    .line 809
    const-string v2, "Day Theme"

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getThemeHash(Ljava/lang/String;)I

    move-result v2

    .line 810
    const-string v3, "circle_only"

    invoke-static {v3}, Lcom/flyersoft/tools/A;->getThemeHash(Ljava/lang/String;)I

    move-result v3

    if-eq v3, v2, :cond_1

    if-eq v3, v1, :cond_1

    if-ne v3, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method private showOverflowMenu(Landroid/view/View;I)V
    .locals 7

    .line 191
    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    const/4 v1, 0x3

    const/4 v2, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    if-ge p2, v0, :cond_1

    return-void

    .line 194
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getThemeList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/tools/A$PageTheme;

    iget-object p2, p2, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    .line 195
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v3, Lcom/flyersoft/moonreaderp/R$array;->operations:I

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x4

    .line 196
    new-array v3, v3, [Ljava/lang/String;

    .line 197
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "\u2500> "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->day_theme:I

    invoke-static {v6}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    .line 198
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->night_theme:I

    invoke-static {v4}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v4, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v4, :cond_2

    const-string v4, " (AMOLED)"

    goto :goto_1

    :cond_2
    const-string v4, ""

    :goto_1
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v3, v1

    const/4 v1, 0x0

    .line 199
    aget-object v2, v0, v1

    aput-object v2, v3, v1

    const/4 v1, 0x1

    .line 200
    aget-object v0, v0, v1

    aput-object v0, v3, v1

    .line 202
    new-instance v0, Lcom/flyersoft/components/MyMenu;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefTheme$1;

    invoke-direct {v1, p0, p2}, Lcom/flyersoft/moonreaderp/PrefTheme$1;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme;Ljava/lang/String;)V

    invoke-virtual {v0, v3, v1}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    .line 291
    invoke-virtual {p2, v0}, Lcom/flyersoft/components/MyMenu;->setBuilderAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object p2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    invoke-static {v0}, Lcom/flyersoft/components/MyMenu;->getXoffInDialog(Landroid/view/View;)I

    move-result v0

    invoke-static {}, Lcom/flyersoft/components/MyMenu;->getYoffInDialog()I

    move-result v1

    invoke-virtual {p2, p1, v0, v1}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;II)V

    return-void
.end method


# virtual methods
.method public checkDayNightSwitchEnable()V
    .locals 7

    .line 177
    sget-boolean v0, Lcom/flyersoft/tools/A;->sysDarkModeFollow:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 178
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->autoThemeOption:Landroid/widget/ImageButton;

    sget v3, Lcom/flyersoft/moonreaderp/R$drawable;->tip:I

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 179
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->autoThemeOption:Landroid/widget/ImageButton;

    const/high16 v3, 0x41000000    # 8.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-virtual {v0, v4, v5, v6, v3}, Landroid/widget/ImageButton;->setPadding(IIII)V

    .line 180
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->autoThemeCheck:Landroid/widget/CheckBox;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 181
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->autoThemeCheck:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/text/TextPaint;->setStrikeThruText(Z)V

    return-void

    .line 183
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->autoThemeOption:Landroid/widget/ImageButton;

    sget v3, Lcom/flyersoft/moonreaderp/R$drawable;->options_light:I

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 184
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->autoThemeOption:Landroid/widget/ImageButton;

    const/4 v3, 0x0

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    const/high16 v5, 0x40c00000    # 6.0f

    invoke-static {v5}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-static {v5}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    invoke-virtual {v0, v4, v6, v3, v5}, Landroid/widget/ImageButton;->setPadding(IIII)V

    .line 185
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->autoThemeCheck:Landroid/widget/CheckBox;

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 186
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->autoThemeCheck:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setStrikeThruText(Z)V

    return-void
.end method

.method public dismiss()V
    .locals 2

    .line 61
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->forFuncSearch:Z

    if-eqz v0, :cond_0

    .line 62
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void

    .line 65
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->themeChanged:Z

    if-nez v0, :cond_1

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 66
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v1, 0x320

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restoreScrollToTopBug(I)V

    .line 67
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->preAmoled:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->amoled:Z

    if-eq v0, v1, :cond_2

    const/4 v0, 0x0

    .line 68
    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefTheme;->doAmoledChanged(Z)V

    :cond_2
    const/4 v0, 0x0

    .line 70
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefTheme;->selfPref:Lcom/flyersoft/moonreaderp/PrefTheme;

    .line 71
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void
.end method

.method public initView()V
    .locals 5

    .line 101
    sget v0, Lcom/flyersoft/tools/A;->cornerRadius:I

    if-lez v0, :cond_0

    .line 102
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->footerSub:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->cornerRadius:I

    div-int/lit8 v1, v1, 0x4

    const/high16 v2, 0x40800000    # 4.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    sget v4, Lcom/flyersoft/tools/A;->cornerRadius:I

    div-int/lit8 v4, v4, 0x4

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-virtual {v0, v1, v3, v4, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 104
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->forFuncSearch:Z

    if-nez v0, :cond_1

    .line 105
    sput-object p0, Lcom/flyersoft/moonreaderp/PrefTheme;->selfPref:Lcom/flyersoft/moonreaderp/PrefTheme;

    .line 106
    :cond_1
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/radaee/pdf/Global;->textReflow:Z

    if-nez v0, :cond_2

    .line 108
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->pdf:Lcom/flyersoft/books/PDFReader;

    .line 110
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ptEdit:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->nameEdit:Landroid/widget/EditText;

    .line 111
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ptSave:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->saveButton:Landroid/widget/ImageButton;

    .line 112
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->autoThemeOption:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->autoThemeOption:Landroid/widget/ImageButton;

    .line 113
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->footerSub:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->saveLayout:Landroid/widget/LinearLayout;

    .line 114
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->toolbar:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->colorLayout:Landroid/widget/LinearLayout;

    .line 115
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->gridSv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/GridView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->themeGrid:Landroid/widget/GridView;

    .line 116
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ptColorOnly:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->colorCheck:Landroid/widget/CheckBox;

    .line 117
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->autoTheme:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->autoThemeCheck:Landroid/widget/CheckBox;

    .line 118
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmAmoled:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->amoledCheck:Landroid/widget/CheckBox;

    .line 119
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmDynamic:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->dynamicCheck:Landroid/widget/CheckBox;

    .line 120
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->exportTv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->exportTv:Landroid/widget/TextView;

    .line 121
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->importTv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->importTv:Landroid/widget/TextView;

    .line 123
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->exportTv:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->importTv:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 125
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->saveButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->colorCheck:Landroid/widget/CheckBox;

    invoke-virtual {v0, p0}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 127
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->colorCheck:Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->loadThemeWithColorOnly:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 128
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->autoThemeCheck:Landroid/widget/CheckBox;

    invoke-virtual {v0, p0}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 129
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->autoThemeCheck:Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->autoTheme:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 130
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->autoThemeOption:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 132
    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->preAmoled:Z

    .line 133
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->amoledCheck:Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->amoled:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 134
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->amoledCheck:Landroid/widget/CheckBox;

    invoke-virtual {v0, p0}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->dynamicCheck:Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 137
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->dynamicCheck:Landroid/widget/CheckBox;

    invoke-static {}, Lcom/flyersoft/tools/C;->getDynamicColorTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 138
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->dynamicCheck:Landroid/widget/CheckBox;

    invoke-virtual {v0, p0}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->dynamicCheck:Landroid/widget/CheckBox;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 142
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->checkDayNightSwitchEnable()V

    .line 144
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->forSave:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    .line 145
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->saveLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 146
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->colorLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 147
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->nameEdit:Landroid/widget/EditText;

    sget-object v2, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 150
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->saveLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 152
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->colorLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 153
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->pdf:Lcom/flyersoft/books/PDFReader;

    if-eqz v0, :cond_4

    .line 154
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->colorCheck:Landroid/widget/CheckBox;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setVisibility(I)V

    :cond_4
    :goto_0
    const/high16 v0, 0x43160000    # 150.0f

    .line 158
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->gridWidth:I

    const/high16 v0, 0x42f00000    # 120.0f

    .line 159
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->gridHeight:I

    .line 160
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->themeGrid:Landroid/widget/GridView;

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->gridWidth:I

    invoke-virtual {v0, v2}, Landroid/widget/GridView;->setColumnWidth(I)V

    .line 163
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->pdf:Lcom/flyersoft/books/PDFReader;

    if-eqz v0, :cond_5

    .line 164
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->exportTv:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 165
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->importTv:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 166
    invoke-static {}, Lcom/flyersoft/tools/A;->getThemeList()Ljava/util/ArrayList;

    .line 169
    :cond_5
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->adapter:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    .line 170
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->themeGrid:Landroid/widget/GridView;

    invoke-virtual {v1, v0}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 172
    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 173
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bLine:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x66666666

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_6
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .line 836
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->adapter:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->selectState:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    .line 837
    iput-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->selectState:Z

    .line 838
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->notifyDataSetChanged()V

    return-void

    .line 841
    :cond_0
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->onBackPressed()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 19

    move-object/from16 v1, p0

    move-object/from16 v8, p1

    .line 436
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->colorCheck:Landroid/widget/CheckBox;

    if-ne v8, v0, :cond_0

    .line 437
    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->loadThemeWithColorOnly:Z

    .line 439
    :cond_0
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->autoThemeCheck:Landroid/widget/CheckBox;

    if-ne v8, v0, :cond_1

    .line 440
    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->autoTheme:Z

    .line 443
    :cond_1
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->dynamicCheck:Landroid/widget/CheckBox;

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-ne v8, v0, :cond_4

    .line 444
    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    .line 445
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$layout;->pref_theme:I

    invoke-virtual {v2, v3, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flyersoft/tools/C;->resetViewColorsFinal(Landroid/view/View;Landroid/view/View;)V

    .line 446
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 447
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefVisual;->selfPref:Lcom/flyersoft/moonreaderp/PrefVisual;

    if-eqz v0, :cond_2

    .line 448
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefVisual;->selfPref:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$layout;->pref_visual:I

    invoke-virtual {v2, v3, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flyersoft/tools/C;->resetViewColorsFinal(Landroid/view/View;Landroid/view/View;)V

    .line 449
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefVisual;->selfPref:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 451
    :cond_2
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 452
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setBottomIconsVisibility()V

    .line 453
    :cond_3
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 454
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, v9}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateMainTheme(Z)V

    .line 457
    :cond_4
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->amoledCheck:Landroid/widget/CheckBox;

    const/4 v11, 0x0

    if-ne v8, v0, :cond_8

    .line 458
    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    .line 460
    invoke-static {}, Lcom/flyersoft/tools/A;->resetThemes()V

    .line 461
    invoke-static {}, Lcom/flyersoft/tools/A;->NIGHT_THEME()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v11, v11, v11}, Lcom/flyersoft/tools/A;->loadTheme(Ljava/lang/String;ZZZ)V

    .line 462
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefTheme;->overwriteTempTheme()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 463
    const-string v0, "circle_only"

    invoke-static {v0, v9}, Lcom/flyersoft/tools/A;->saveTheme(Ljava/lang/String;Z)V

    .line 465
    :cond_5
    sput-boolean v9, Lcom/flyersoft/tools/A;->mainThemeChanged:Z

    sput-boolean v9, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    .line 466
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->forceDayTextColors(Landroid/view/View;)V

    .line 467
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->root:Landroid/view/View;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 469
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefVisual;->selfPref:Lcom/flyersoft/moonreaderp/PrefVisual;

    if-eqz v0, :cond_6

    .line 470
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefVisual;->selfPref:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->forceDayTextColors(Landroid/view/View;)V

    .line 471
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefVisual;->selfPref:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 472
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefVisual;->selfPref:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->checkNightState()V

    .line 475
    :cond_6
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_7

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    if-nez v0, :cond_7

    .line 476
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Lcom/flyersoft/tools/A;->NIGHT_THEME()Ljava/lang/String;

    move-result-object v2

    sget-boolean v3, Lcom/flyersoft/tools/A;->loadThemeWithColorOnly:Z

    invoke-virtual {v0, v2, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->loadTheme(Ljava/lang/String;Z)V

    .line 478
    :cond_7
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->adapter:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->notifyDataSetChanged()V

    .line 481
    :cond_8
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->autoThemeOption:Landroid/widget/ImageButton;

    const v12, 0x104000a

    const-string v13, ""

    if-ne v8, v0, :cond_a

    .line 482
    sget-boolean v0, Lcom/flyersoft/tools/A;->sysDarkModeFollow:Z

    const-string v2, " > "

    const-string v3, ": "

    if-eqz v0, :cond_9

    .line 483
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->disabled_by:I

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 484
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->menu_options:I

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 485
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->follow_sys_dark:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 483
    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 486
    invoke-virtual {v0, v12, v10}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->menu_options:I

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefTheme$2;

    invoke-direct {v3, v1}, Lcom/flyersoft/moonreaderp/PrefTheme$2;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme;)V

    .line 487
    invoke-virtual {v0, v2, v3}, Lcom/flyersoft/components/MyDialog;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 492
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 495
    :cond_9
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->res:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v4, Lcom/flyersoft/moonreaderp/R$layout;->auto_theme:I

    invoke-virtual {v0, v4, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 496
    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 497
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->dayTv:I

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "<b>"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->res:Landroid/content/Context;

    sget v14, Lcom/flyersoft/moonreaderp/R$string;->day_theme:I

    .line 498
    invoke-virtual {v7, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "</b> ("

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v14, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->res:Landroid/content/Context;

    sget v15, Lcom/flyersoft/moonreaderp/R$string;->auto_theme_tip1:I

    invoke-virtual {v14, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, ")"

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 497
    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 499
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->nightTv:I

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->res:Landroid/content/Context;

    sget v15, Lcom/flyersoft/moonreaderp/R$string;->night_theme:I

    .line 500
    invoke-virtual {v6, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->res:Landroid/content/Context;

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->auto_theme_tip2:I

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 499
    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 501
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->auto_day:I

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/CheckBox;

    .line 502
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->dayBrightCb:I

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/CheckBox;

    .line 503
    sget v6, Lcom/flyersoft/moonreaderp/R$id;->auto_night:I

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/CheckBox;

    .line 504
    sget v7, Lcom/flyersoft/moonreaderp/R$id;->nightBrightCb:I

    invoke-virtual {v0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/CheckBox;

    .line 505
    sget v14, Lcom/flyersoft/moonreaderp/R$id;->dayTime:I

    invoke-virtual {v0, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/EditText;

    .line 506
    sget v15, Lcom/flyersoft/moonreaderp/R$id;->dayBrightness:I

    invoke-virtual {v0, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/EditText;

    .line 507
    sget v11, Lcom/flyersoft/moonreaderp/R$id;->nightTime:I

    invoke-virtual {v0, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/EditText;

    const/16 v16, 0x1

    .line 508
    sget v9, Lcom/flyersoft/moonreaderp/R$id;->nightBrightness:I

    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    .line 509
    sget-boolean v10, Lcom/flyersoft/tools/A;->autoThemeDay:Z

    invoke-virtual {v4, v10}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 510
    sget-boolean v10, Lcom/flyersoft/tools/A;->autoDaySetBright:Z

    invoke-virtual {v5, v10}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 511
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    sget v17, Lcom/flyersoft/tools/A;->autoThemeDayTime:I

    div-int/lit8 v12, v17, 0x64

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, ":"

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v17, Lcom/flyersoft/tools/A;->autoThemeDayTime:I

    rem-int/lit8 v17, v17, 0x64

    move-object/from16 v18, v4

    invoke-static/range {v17 .. v17}, Lcom/flyersoft/tools/T;->getMinuteTag(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v14, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 512
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v10, Lcom/flyersoft/tools/A;->autoThemeDayBrightness:I

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v15, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 513
    sget-boolean v4, Lcom/flyersoft/tools/A;->autoThemeNight:Z

    invoke-virtual {v6, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 514
    sget-boolean v4, Lcom/flyersoft/tools/A;->autoNightSetBright:Z

    invoke-virtual {v7, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 515
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v10, Lcom/flyersoft/tools/A;->autoThemeNightTime:I

    div-int/lit8 v10, v10, 0x64

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v10, Lcom/flyersoft/tools/A;->autoThemeNightTime:I

    rem-int/lit8 v10, v10, 0x64

    invoke-static {v10}, Lcom/flyersoft/tools/T;->getMinuteTag(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v11, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 516
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v10, Lcom/flyersoft/tools/A;->autoThemeNightBrightness:I

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v9, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 518
    new-instance v4, Lcom/flyersoft/moonreaderp/PrefTheme$3;

    invoke-direct {v4, v1, v14}, Lcom/flyersoft/moonreaderp/PrefTheme$3;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme;Landroid/widget/EditText;)V

    invoke-virtual {v14, v4}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 528
    new-instance v4, Lcom/flyersoft/moonreaderp/PrefTheme$4;

    invoke-direct {v4, v1, v11}, Lcom/flyersoft/moonreaderp/PrefTheme$4;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme;Landroid/widget/EditText;)V

    invoke-virtual {v11, v4}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 539
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->tip:I

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 540
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v11

    sget v14, Lcom/flyersoft/moonreaderp/R$string;->more:I

    invoke-virtual {v11, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 541
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v11, Lcom/flyersoft/moonreaderp/R$string;->menu_options:I

    invoke-virtual {v3, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 542
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->follow_sys_dark:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 539
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 543
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->tip:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefTheme$5;

    invoke-direct {v3, v1}, Lcom/flyersoft/moonreaderp/PrefTheme$5;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 550
    new-instance v2, Lcom/flyersoft/components/MyDialog;

    iget-object v3, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->res:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object v3, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->res:Landroid/content/Context;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->auto_theme:I

    .line 551
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v12, v13}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    .line 552
    invoke-virtual {v2, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v10

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefTheme$6;

    move-object v3, v5

    move-object v4, v6

    move-object v5, v7

    move-object v7, v9

    move-object v6, v15

    move-object/from16 v2, v18

    invoke-direct/range {v0 .. v7}, Lcom/flyersoft/moonreaderp/PrefTheme$6;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/EditText;Landroid/widget/EditText;)V

    const v2, 0x104000a

    .line 553
    invoke-virtual {v10, v2, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 565
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    goto :goto_0

    :cond_a
    const/16 v16, 0x1

    .line 568
    :goto_0
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->saveButton:Landroid/widget/ImageButton;

    if-ne v8, v0, :cond_f

    .line 569
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->nameEdit:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 570
    sget-object v2, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_b

    .line 571
    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteSpecialChar(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 574
    :cond_b
    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 575
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v2, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->res:Landroid/content/Context;

    invoke-direct {v0, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 576
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->theme_name_error:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const v2, 0x104000a

    const/4 v3, 0x0

    .line 577
    invoke-virtual {v0, v2, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 578
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 582
    :cond_c
    invoke-static {v0}, Lcom/flyersoft/tools/A;->getThemeId(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_d

    .line 583
    new-instance v2, Lcom/flyersoft/components/MyDialog;

    iget-object v3, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->res:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 584
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->overwite_theme:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefTheme$7;

    invoke-direct {v3, v1, v0}, Lcom/flyersoft/moonreaderp/PrefTheme$7;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme;Ljava/lang/String;)V

    const v0, 0x104000a

    .line 585
    invoke-virtual {v2, v0, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const/high16 v2, 0x1040000

    const/4 v3, 0x0

    .line 593
    invoke-virtual {v0, v2, v3}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 594
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 598
    :cond_d
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->onGetTheme:Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;

    if-eqz v2, :cond_e

    .line 599
    invoke-interface {v2, v0}, Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;->getTheme(Ljava/lang/String;)V

    .line 600
    :cond_e
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->dismiss()V

    .line 604
    :cond_f
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->exportTv:Landroid/widget/TextView;

    if-ne v8, v0, :cond_13

    .line 605
    invoke-static/range {v16 .. v16}, Lcom/flyersoft/tools/A;->permissionOk(Z)Z

    move-result v0

    if-nez v0, :cond_10

    goto :goto_2

    .line 607
    :cond_10
    iget-boolean v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->selectState:Z

    if-nez v0, :cond_11

    const/4 v0, 0x1

    .line 608
    iput-boolean v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->selectState:Z

    .line 609
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->adapter:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->notifyDataSetChanged()V

    goto :goto_1

    .line 610
    :cond_11
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->adapter:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->getSelectedCount()I

    move-result v0

    if-nez v0, :cond_12

    .line 611
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->nothing_selected:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 613
    :cond_12
    invoke-direct {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->doExportTheme()V

    .line 617
    :cond_13
    :goto_1
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->importTv:Landroid/widget/TextView;

    if-ne v8, v0, :cond_15

    const/16 v16, 0x1

    .line 618
    invoke-static/range {v16 .. v16}, Lcom/flyersoft/tools/A;->permissionOk(Z)Z

    move-result v0

    if-nez v0, :cond_14

    goto :goto_2

    :cond_14
    const/4 v0, 0x0

    .line 620
    iput-boolean v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->selectState:Z

    .line 621
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->adapter:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->notifyDataSetChanged()V

    .line 622
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->theme_export_path:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/moonreader.mrthemes"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/flyersoft/moonreaderp/PrefTheme;->doImportTheme(Ljava/lang/String;)V

    :cond_15
    :goto_2
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 86
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 87
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->initView()V

    .line 88
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const v0, 0x3f4ccccd    # 0.8f

    .line 89
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, -0x2

    .line 90
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x0

    .line 91
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 92
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->options_menu:I

    const/4 v3, 0x3

    invoke-static {v1, v2, v3}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 93
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFuncSearchVisible(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 94
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    .line 95
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->phTitle:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefTheme;->forSave:Z

    if-eqz v1, :cond_0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->save_theme:I

    goto :goto_0

    :cond_0
    sget v1, Lcom/flyersoft/moonreaderp/R$string;->load_theme:I

    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
