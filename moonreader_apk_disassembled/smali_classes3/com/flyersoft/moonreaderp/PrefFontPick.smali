.class public Lcom/flyersoft/moonreaderp/PrefFontPick;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefFontPick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;,
        Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;
    }
.end annotation


# static fields
.field public static epubIgnoreFontChanged:Z

.field public static selfPref:Lcom/flyersoft/moonreaderp/PrefFontPick;

.field static skew:F

.field static weight:I


# instance fields
.field cssFontCheck:Landroid/widget/CheckBox;

.field cssFontVisible:Z

.field downloadB:Landroid/widget/TextView;

.field private fontFaces:[Landroid/graphics/Typeface;

.field fontFind:Landroid/widget/ImageButton;

.field fontList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

.field fonts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field key:Ljava/lang/String;

.field locateTo:Ljava/lang/String;

.field onGetFont:Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;

.field private outOfMemory:Z

.field pathEdit:Landroid/widget/TextView;

.field selectedFont:Ljava/lang/String;

.field showBookFonts:Z

.field public styleChanged:Z


# direct methods
.method static bridge synthetic -$$Nest$fgetfontFaces(Lcom/flyersoft/moonreaderp/PrefFontPick;)[Landroid/graphics/Typeface;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontFaces:[Landroid/graphics/Typeface;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetoutOfMemory(Lcom/flyersoft/moonreaderp/PrefFontPick;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->outOfMemory:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fputfontFaces(Lcom/flyersoft/moonreaderp/PrefFontPick;[Landroid/graphics/Typeface;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontFaces:[Landroid/graphics/Typeface;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputoutOfMemory(Lcom/flyersoft/moonreaderp/PrefFontPick;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->outOfMemory:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$mdoFindFonts(Lcom/flyersoft/moonreaderp/PrefFontPick;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->doFindFonts()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mfindFonts(Lcom/flyersoft/moonreaderp/PrefFontPick;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->findFonts()V

    return-void
.end method

.method static bridge synthetic -$$Nest$misCurrentFont(Lcom/flyersoft/moonreaderp/PrefFontPick;Ljava/lang/String;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->isCurrentFont(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mshowOverflowMenu(Lcom/flyersoft/moonreaderp/PrefFontPick;Landroid/view/View;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->showOverflowMenu(Landroid/view/View;I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smsaveFontsReplacement(Landroid/app/Dialog;Landroid/widget/LinearLayout;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->saveFontsReplacement(Landroid/app/Dialog;Landroid/widget/LinearLayout;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smsaveIgnoreFonts([Z[ZLjava/util/ArrayList;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->saveIgnoreFonts([Z[ZLjava/util/ArrayList;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smsetFontReplaceItemProperties(Landroid/content/Context;Landroid/widget/LinearLayout;Landroid/view/View;Ljava/util/ArrayList;)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/flyersoft/moonreaderp/PrefFontPick;->setFontReplaceItemProperties(Landroid/content/Context;Landroid/widget/LinearLayout;Landroid/view/View;Ljava/util/ArrayList;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smsetFontSkew(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;F)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/flyersoft/moonreaderp/PrefFontPick;->setFontSkew(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;F)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smsetFontWeight(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/graphics/Typeface;IZ)V
    .locals 0

    invoke-static/range {p0 .. p5}, Lcom/flyersoft/moonreaderp/PrefFontPick;->setFontWeight(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/graphics/Typeface;IZ)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 716
    sget v0, Lcom/flyersoft/tools/A;->DEFAULT_WEIGHT:I

    sput v0, Lcom/flyersoft/moonreaderp/PrefFontPick;->weight:I

    .line 717
    sget v0, Lcom/flyersoft/tools/A;->DEFAULT_SKEW:F

    sput v0, Lcom/flyersoft/moonreaderp/PrefFontPick;->skew:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;Ljava/lang/String;Z)V
    .locals 1

    .line 63
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->font_list:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    const/4 p1, 0x0

    .line 782
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->outOfMemory:Z

    .line 64
    sput-object p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->selfPref:Lcom/flyersoft/moonreaderp/PrefFontPick;

    .line 65
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->onGetFont:Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;

    .line 66
    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->locateTo:Ljava/lang/String;

    .line 67
    iput-boolean p4, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->showBookFonts:Z

    .line 68
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->styleChanged:Z

    const/4 p1, 0x0

    .line 69
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->selectedFont:Ljava/lang/String;

    return-void
.end method

.method static addToFontList(Ljava/util/ArrayList;Ljava/lang/String;)V
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

    .line 345
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->cleanFontName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 346
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getFontNameWithoutStyle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 347
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 348
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method private doFindFonts()V
    .locals 5

    .line 756
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->res:Landroid/content/Context;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->res:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->font_folder:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->pathEdit:Landroid/widget/TextView;

    .line 757
    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefFontPick$26;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$26;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/flyersoft/moonreaderp/PrefFolderPick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V

    const/4 v1, 0x1

    .line 762
    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->setFontsOnly(Z)Lcom/flyersoft/moonreaderp/PrefFolderPick;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->show()V

    return-void
.end method

.method public static doFontWeight(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Typeface;ILcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;)V
    .locals 18

    move-object/from16 v1, p0

    move-object/from16 v6, p1

    move/from16 v7, p3

    move-object/from16 v8, p4

    .line 557
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->font_weight:I

    const/4 v9, 0x0

    invoke-virtual {v0, v2, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v10

    .line 558
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->sb1:I

    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Landroid/widget/SeekBar;

    .line 559
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->sb2:I

    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Landroid/widget/SeekBar;

    .line 560
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->sampleTv1:I

    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Landroid/widget/TextView;

    .line 561
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->sampleTv2:I

    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Landroid/widget/TextView;

    .line 562
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->weightTv:I

    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/widget/TextView;

    .line 563
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->skewTv:I

    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Landroid/widget/TextView;

    .line 565
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    const/4 v15, 0x1

    invoke-virtual {v6, v4, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 566
    new-instance v4, Lcom/flyersoft/moonreaderp/PrefFontPick$15;

    invoke-direct {v4, v1}, Lcom/flyersoft/moonreaderp/PrefFontPick$15;-><init>(Landroid/content/Context;)V

    .line 579
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "<br>"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v9, Lcom/flyersoft/moonreaderp/R$string;->app_name:I

    invoke-virtual {v1, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v15}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ""

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 580
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move-object v5, v4

    .line 581
    invoke-static {v6}, Lcom/flyersoft/tools/A;->getFontWeight(Ljava/lang/String;)I

    move-result v4

    sput v4, Lcom/flyersoft/moonreaderp/PrefFontPick;->weight:I

    move-object v9, v5

    const/4 v5, 0x0

    move-object v15, v9

    const/16 v16, 0x1

    move-object v9, v0

    move-object v0, v1

    move-object v1, v2

    move-object v2, v3

    move-object/from16 v3, p2

    .line 582
    invoke-static/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefFontPick;->setFontWeight(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/graphics/Typeface;IZ)V

    move-object v4, v3

    move-object v3, v2

    move-object v2, v1

    move-object v1, v0

    const/16 v0, 0x8

    .line 584
    invoke-virtual {v11, v0}, Landroid/widget/SeekBar;->setMax(I)V

    .line 585
    sget v0, Lcom/flyersoft/moonreaderp/PrefFontPick;->weight:I

    div-int/lit8 v0, v0, 0x64

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v11, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 586
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFontPick$16;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/flyersoft/moonreaderp/PrefFontPick$16;-><init>(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    invoke-virtual {v11, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 598
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->decTv1:I

    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFontPick$17;

    move-object/from16 v17, v11

    move-object v11, v5

    move-object/from16 v5, v17

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefFontPick$17;-><init>(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/graphics/Typeface;Landroid/widget/SeekBar;)V

    invoke-virtual {v11, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 605
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->incTv1:I

    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFontPick$18;

    move-object/from16 v1, p0

    move-object/from16 v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefFontPick$18;-><init>(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/graphics/Typeface;Landroid/widget/SeekBar;)V

    invoke-virtual {v11, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 612
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->reset1:I

    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFontPick$19;

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefFontPick$19;-><init>(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/graphics/Typeface;Landroid/widget/SeekBar;)V

    invoke-virtual {v11, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 620
    invoke-virtual {v13, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 621
    invoke-virtual {v13, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 622
    invoke-virtual {v13, v15}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 623
    invoke-static {v6}, Lcom/flyersoft/tools/A;->getFontSkew(Ljava/lang/String;)F

    move-result v0

    sput v0, Lcom/flyersoft/moonreaderp/PrefFontPick;->skew:F

    .line 624
    invoke-static {v1, v13, v14, v0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->setFontSkew(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;F)V

    const/16 v0, 0xc8

    .line 626
    invoke-virtual {v12, v0}, Landroid/widget/SeekBar;->setMax(I)V

    .line 627
    sget v0, Lcom/flyersoft/moonreaderp/PrefFontPick;->skew:F

    const/high16 v2, 0x42c80000    # 100.0f

    mul-float v0, v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    add-int/lit8 v0, v0, 0x64

    invoke-virtual {v12, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 628
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFontPick$20;

    invoke-direct {v0, v1, v13, v14}, Lcom/flyersoft/moonreaderp/PrefFontPick$20;-><init>(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;)V

    invoke-virtual {v12, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 640
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->decTv2:I

    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefFontPick$21;

    invoke-direct {v2, v1, v13, v14, v12}, Lcom/flyersoft/moonreaderp/PrefFontPick$21;-><init>(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/SeekBar;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 647
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->incTv2:I

    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefFontPick$22;

    invoke-direct {v2, v1, v13, v14, v12}, Lcom/flyersoft/moonreaderp/PrefFontPick$22;-><init>(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/SeekBar;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 654
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->reset2:I

    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefFontPick$23;

    invoke-direct {v2, v1, v13, v14, v12}, Lcom/flyersoft/moonreaderp/PrefFontPick$23;-><init>(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/SeekBar;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 662
    invoke-static {v10}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 663
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 664
    invoke-virtual {v0, v10}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefFontPick$24;

    invoke-direct {v3, v6, v7, v8}, Lcom/flyersoft/moonreaderp/PrefFontPick$24;-><init>(Ljava/lang/String;ILcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;)V

    const v4, 0x104000a

    .line 665
    invoke-virtual {v2, v4, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    const/high16 v3, 0x1040000

    const/4 v4, 0x0

    .line 687
    invoke-virtual {v2, v3, v4}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    const/4 v2, -0x1

    if-eq v7, v2, :cond_0

    .line 689
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->reset:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->all_fonts:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefFontPick$25;

    invoke-direct {v3, v1, v7, v8}, Lcom/flyersoft/moonreaderp/PrefFontPick$25;-><init>(Landroid/content/Context;ILcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;)V

    invoke-virtual {v0, v2, v3}, Lcom/flyersoft/components/MyDialog;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    .line 713
    :cond_0
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method private findFonts()V
    .locals 3

    .line 958
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->pathEdit:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 959
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 960
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 962
    :cond_0
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 963
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->res:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->folder_not_exists:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 964
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->pathEdit:Landroid/widget/TextView;

    sget-object v1, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_1
    const/4 v1, 0x0

    .line 968
    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fonts:Ljava/util/ArrayList;

    .line 969
    sput-object v0, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    .line 970
    sget-object v0, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getLocalFontfaces(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 974
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    return-void
.end method

.method static getPageTextFonts(ZZ)Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 297
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 298
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 300
    sget-object v2, Lcom/flyersoft/tools/A;->forceCssFontName:Ljava/lang/String;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_3

    .line 301
    sget-object v2, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    sget-object v5, Lcom/flyersoft/tools/A;->forceCssFontName:Ljava/lang/String;

    invoke-virtual {v2, v5, v4}, Lcom/flyersoft/books/BaseEBook;->getFontFile(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    .line 302
    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 303
    sget-object v2, Lcom/flyersoft/tools/A;->forceCssFontName:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getFontNames(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    .line 304
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 305
    invoke-static {v6, v4, v3, v4}, Lcom/flyersoft/tools/A;->getTypeFace2(Ljava/lang/String;IZZ)Landroid/graphics/Typeface;

    move-result-object v7

    if-eqz v7, :cond_0

    .line 306
    invoke-static {v0, v6}, Lcom/flyersoft/moonreaderp/PrefFontPick;->addToFontList(Ljava/util/ArrayList;Ljava/lang/String;)V

    :cond_1
    if-eqz p0, :cond_3

    .line 310
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 311
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->addToFontList(Ljava/util/ArrayList;Ljava/lang/String;)V

    goto :goto_0

    .line 313
    :cond_2
    invoke-static {v0, v2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->addToFontList(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 316
    :cond_3
    :goto_0
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefFontPick;->hasCssFont()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 318
    :try_start_0
    sget v2, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-static {v2}, Lcom/flyersoft/staticlayout/MyHtml;->getCssFontList(I)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 319
    invoke-static {v5}, Lcom/flyersoft/tools/A;->getFontNames(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    .line 321
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 322
    invoke-static {v7, v4, v3, v4}, Lcom/flyersoft/tools/A;->getTypeFace2(Ljava/lang/String;IZZ)Landroid/graphics/Typeface;

    move-result-object v8

    if-eqz v8, :cond_5

    .line 324
    invoke-static {v0, v7}, Lcom/flyersoft/moonreaderp/PrefFontPick;->addToFontList(Ljava/util/ArrayList;Ljava/lang/String;)V

    goto :goto_2

    :cond_6
    const/4 v7, 0x0

    :goto_2
    if-eqz p0, :cond_4

    if-nez v7, :cond_4

    .line 328
    invoke-static {v5}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 329
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v1, v5}, Lcom/flyersoft/moonreaderp/PrefFontPick;->addToFontList(Ljava/util/ArrayList;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 332
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_7
    if-eqz p1, :cond_8

    return-object v1

    .line 338
    :cond_8
    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result p0

    if-nez p0, :cond_9

    .line 339
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_9
    return-object v0
.end method

.method public static hasCssFont()Z
    .locals 1

    .line 293
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/flyersoft/tools/A;->forceCssFontName:Ljava/lang/String;

    if-nez v0, :cond_0

    sget v0, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-static {v0}, Lcom/flyersoft/staticlayout/MyHtml;->getCssFontList(I)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private initView()V
    .locals 6

    .line 128
    sget v0, Lcom/flyersoft/tools/A;->cornerRadius:I

    const/4 v1, 0x0

    if-lez v0, :cond_0

    .line 129
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->toolbar:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget v2, Lcom/flyersoft/tools/A;->cornerRadius:I

    div-int/lit8 v2, v2, 0x4

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    sget v5, Lcom/flyersoft/tools/A;->cornerRadius:I

    div-int/lit8 v5, v5, 0x4

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-virtual {v0, v2, v4, v5, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 130
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->footerSub:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget v2, Lcom/flyersoft/tools/A;->cornerRadius:I

    div-int/lit8 v2, v2, 0x4

    sget v3, Lcom/flyersoft/tools/A;->cornerRadius:I

    div-int/lit8 v3, v3, 0x4

    invoke-virtual {v0, v2, v1, v3, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 133
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->fontFind:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontFind:Landroid/widget/ImageButton;

    .line 134
    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->fontFolderEdit:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->pathEdit:Landroid/widget/TextView;

    .line 136
    sget-object v2, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->cssFont:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->cssFontCheck:Landroid/widget/CheckBox;

    .line 139
    sget-boolean v2, Lcom/flyersoft/tools/A;->useCssFont:Z

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 140
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->showBookFonts:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    instance-of v0, v0, Lcom/flyersoft/books/Epub;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->cssFontVisible:Z

    if-eqz v0, :cond_5

    .line 142
    sget v0, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-static {v0}, Lcom/flyersoft/staticlayout/MyHtml;->getCssFontList(I)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    .line 143
    sget-object v3, Lcom/flyersoft/tools/A;->forceCssFontName:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    .line 144
    sget-boolean v4, Lcom/flyersoft/tools/A;->useCssFont:Z

    if-eqz v4, :cond_2

    if-eqz v0, :cond_5

    if-eqz v3, :cond_5

    .line 146
    iput-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->cssFontVisible:Z

    goto :goto_3

    :cond_2
    if-eqz v0, :cond_4

    if-nez v3, :cond_3

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    goto :goto_2

    :cond_4
    :goto_1
    const/4 v0, 0x1

    .line 148
    :goto_2
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->cssFontVisible:Z

    .line 151
    :cond_5
    :goto_3
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->cssFontVisible:Z

    if-eqz v0, :cond_6

    .line 152
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->cssFontCheck:Landroid/widget/CheckBox;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->res:Landroid/content/Context;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->epub_embedded_fonts:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->res:Landroid/content/Context;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->miscellaneous:I

    .line 153
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 152
    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 154
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->cssFontCheck:Landroid/widget/CheckBox;

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefFontPick$4;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$4;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V

    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 159
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->cssFontOption:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefFontPick$5;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$5;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_4

    .line 172
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->footerSub:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v3, 0x8

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 174
    :goto_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->pathEdit:Landroid/widget/TextView;

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefFontPick$6;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$6;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 180
    sget-object v0, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getLocalFontfaces(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 181
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->listSv:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    .line 182
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-nez v0, :cond_7

    .line 183
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    const v3, -0x777778

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iput-object v3, v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->smallThumbColor:Ljava/lang/Integer;

    .line 186
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->setBackgroundImage(Landroid/view/View;)V

    .line 188
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    if-nez v0, :cond_8

    .line 189
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4, v2, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v3}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 190
    :cond_8
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 192
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->locateTo:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, -0x1

    if-eqz v0, :cond_9

    const/4 v0, -0x1

    goto :goto_5

    :cond_9
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getFonts()Ljava/util/ArrayList;

    move-result-object v0

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->locateTo:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    :goto_5
    if-eq v0, v2, :cond_a

    .line 194
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v2, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->myScrollTo(I)Z

    .line 196
    :cond_a
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->downloadB:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->downloadB:Landroid/widget/TextView;

    .line 197
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 198
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->downloadB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 200
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->showBookFonts:Z

    if-eqz v0, :cond_b

    sget-boolean v0, Lcom/flyersoft/tools/A;->useCssFont:Z

    if-eqz v0, :cond_b

    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v0, :cond_b

    .line 201
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->root:Landroid/view/View;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefFontPick$7;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$7;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_b
    return-void
.end method

.method private isCurrentFont(Ljava/lang/String;)Z
    .locals 3

    .line 909
    sget-object v0, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method private static saveFontsReplacement(Landroid/app/Dialog;Landroid/widget/LinearLayout;)V
    .locals 7

    .line 453
    invoke-static {}, Lcom/flyersoft/tools/A;->getFontsReplacement()Ljava/util/HashMap;

    move-result-object v0

    const/4 v1, 0x0

    .line 454
    sput-object v1, Lcom/flyersoft/tools/A;->fontsReplacement:Ljava/util/HashMap;

    .line 455
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "font_replacement"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 456
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 457
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    const/4 v2, 0x0

    .line 458
    :goto_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    if-ge v2, v4, :cond_1

    .line 459
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 460
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->editText1:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 461
    sget v6, Lcom/flyersoft/moonreaderp/R$id;->editText2:I

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 462
    invoke-static {v5}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-static {v4}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 463
    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 465
    :cond_1
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 467
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result p1

    invoke-static {}, Lcom/flyersoft/tools/A;->getFontsReplacement()Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    if-eq p1, v1, :cond_2

    const/4 v3, 0x1

    :cond_2
    if-nez v3, :cond_4

    .line 469
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 470
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {}, Lcom/flyersoft/tools/A;->getFontsReplacement()Ljava/util/HashMap;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_1

    :cond_4
    move v5, v3

    :goto_1
    if-eqz v5, :cond_6

    .line 475
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_6

    if-eqz p0, :cond_5

    .line 477
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 478
    :cond_5
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    :cond_6
    return-void
.end method

.method private static saveIgnoreFonts([Z[ZLjava/util/ArrayList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([Z[Z",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 278
    :goto_0
    array-length v3, p0

    const/4 v4, 0x1

    if-ge v1, v3, :cond_1

    .line 279
    aget-boolean v3, p0, v1

    aget-boolean v5, p1, v1

    if-eq v3, v5, :cond_0

    const/4 v2, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    if-eqz v2, :cond_4

    .line 282
    sput-boolean v4, Lcom/flyersoft/moonreaderp/PrefFontPick;->epubIgnoreFontChanged:Z

    .line 283
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 284
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_3

    .line 285
    aget-boolean v1, p0, v0

    if-nez v1, :cond_2

    .line 286
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 287
    :cond_3
    invoke-static {p1}, Lcom/flyersoft/tools/A;->saveEpubIngoreFonts(Ljava/util/ArrayList;)V

    const/4 p0, 0x0

    .line 288
    sput-object p0, Lcom/flyersoft/tools/A;->epubIgnoreFonts:Ljava/util/ArrayList;

    :cond_4
    return-void
.end method

.method private static setFontReplaceItemProperties(Landroid/content/Context;Landroid/widget/LinearLayout;Landroid/view/View;Ljava/util/ArrayList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/widget/LinearLayout;",
            "Landroid/view/View;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/A$Filter_Item;",
            ">;)V"
        }
    .end annotation

    .line 397
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 398
    invoke-static {}, Lcom/flyersoft/tools/A;->getFontsReplacement()Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    const/4 v2, 0x0

    if-lez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 399
    :goto_0
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_3

    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/A$Filter_Item;

    iget-boolean v3, v3, Lcom/flyersoft/tools/A$Filter_Item;->fromBook:Z

    if-eqz v3, :cond_3

    .line 400
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/A$Filter_Item;

    iget-boolean v3, v3, Lcom/flyersoft/tools/A$Filter_Item;->missing:Z

    if-eqz v3, :cond_1

    const/high16 v1, 0x22550000

    goto :goto_1

    :cond_1
    if-eqz v1, :cond_2

    const/high16 v1, 0x11000000

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {p2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 401
    :cond_3
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->editText1:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 402
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->editText2:I

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 403
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->arrow:I

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 404
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->op:I

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 405
    invoke-virtual {v5, p2}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 406
    new-instance p2, Lcom/flyersoft/moonreaderp/PrefFontPick$12;

    invoke-direct {p2, p3, p0, p1}, Lcom/flyersoft/moonreaderp/PrefFontPick$12;-><init>(Ljava/util/ArrayList;Landroid/content/Context;Landroid/widget/LinearLayout;)V

    invoke-virtual {v5, p2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 430
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p1

    const-string p2, ""

    if-ge v0, p1, :cond_4

    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/A$Filter_Item;

    iget-object p1, p1, Lcom/flyersoft/tools/A$Filter_Item;->original:Ljava/lang/String;

    goto :goto_2

    :cond_4
    move-object p1, p2

    :goto_2
    invoke-virtual {v1, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 431
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge v0, p1, :cond_5

    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/A$Filter_Item;

    iget-object p2, p1, Lcom/flyersoft/tools/A$Filter_Item;->replaceWith:Ljava/lang/String;

    :cond_5
    invoke-virtual {v3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 432
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ne v0, p1, :cond_6

    const/4 v2, 0x4

    .line 433
    :cond_6
    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setVisibility(I)V

    .line 434
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 435
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 436
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ne v0, p1, :cond_7

    const-string p1, "+"

    goto :goto_3

    :cond_7
    const-string p1, "-"

    :goto_3
    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 438
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFontPick$13;

    invoke-direct {p1, p0, v3}, Lcom/flyersoft/moonreaderp/PrefFontPick$13;-><init>(Landroid/content/Context;Landroid/widget/TextView;)V

    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private static setFontSkew(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;F)V
    .locals 3

    const/high16 v0, -0x40800000    # -1.0f

    cmpg-float v1, p3, v0

    if-gez v1, :cond_0

    const/high16 p3, -0x40800000    # -1.0f

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p3, v0

    if-lez v1, :cond_1

    const/high16 p3, 0x3f800000    # 1.0f

    .line 741
    :cond_1
    sput p3, Lcom/flyersoft/moonreaderp/PrefFontPick;->skew:F

    .line 742
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object p3

    sget v0, Lcom/flyersoft/moonreaderp/PrefFontPick;->skew:F

    invoke-virtual {p3, v0}, Landroid/text/TextPaint;->setTextSkewX(F)V

    .line 743
    invoke-virtual {p1}, Landroid/widget/TextView;->postInvalidate()V

    .line 744
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "<b>"

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget p3, Lcom/flyersoft/moonreaderp/R$string;->italic_skew:I

    invoke-virtual {p0, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "</b>: "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p3, Lcom/flyersoft/moonreaderp/PrefFontPick;->skew:F

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p3, v1, v2

    const-string p3, "%.2f"

    invoke-static {p3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v1, "<br>("

    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->italic_skew_tip:I

    .line 745
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 744
    invoke-static {p0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private static setFontWeight(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/graphics/Typeface;IZ)V
    .locals 1

    .line 720
    invoke-static {}, Lcom/flyersoft/tools/A;->AndroidP()Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p5, :cond_0

    .line 722
    const-string p1, "For Android 9+ only"

    invoke-static {p0, p1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_0
    return-void

    :cond_1
    const/16 p5, 0x64

    if-ge p4, p5, :cond_2

    const/16 p4, 0x64

    :cond_2
    const/16 p5, 0x384

    if-le p4, p5, :cond_3

    const/16 p4, 0x384

    .line 729
    :cond_3
    sput p4, Lcom/flyersoft/moonreaderp/PrefFontPick;->weight:I

    const/4 p5, 0x0

    .line 730
    invoke-static {p3, p4, p5}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    move-result-object p3

    .line 731
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 732
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "<b>"

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget p3, Lcom/flyersoft/moonreaderp/R$string;->font_weight:I

    invoke-virtual {p0, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "</b>: "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p3, Lcom/flyersoft/moonreaderp/PrefFontPick;->weight:I

    invoke-static {p3}, Lcom/flyersoft/moonreaderp/PrefFontPick;->weightName(I)Ljava/lang/CharSequence;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "<br>("

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget p4, Lcom/flyersoft/moonreaderp/R$string;->font_weight_tip:I

    .line 733
    invoke-virtual {p0, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 p3, 0x1

    invoke-static {p0, p3}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 732
    invoke-static {p0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static showFontsReplacement(Landroid/app/Dialog;)V
    .locals 11

    if-nez p0, :cond_0

    return-void

    .line 354
    :cond_0
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    .line 355
    invoke-static {v1, v1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getPageTextFonts(ZZ)Ljava/util/ArrayList;

    move-result-object v2

    const/4 v3, 0x1

    .line 356
    invoke-static {v3, v3}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getPageTextFonts(ZZ)Ljava/util/ArrayList;

    move-result-object v4

    .line 357
    invoke-static {}, Lcom/flyersoft/tools/A;->getFontsReplacement()Ljava/util/HashMap;

    move-result-object v5

    .line 358
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 360
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 361
    new-instance v9, Lcom/flyersoft/tools/A$Filter_Item;

    invoke-virtual {v5, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-direct {v9, v8, v10}, Lcom/flyersoft/tools/A$Filter_Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    iput-boolean v3, v9, Lcom/flyersoft/tools/A$Filter_Item;->fromBook:Z

    .line 363
    iput-boolean v3, v9, Lcom/flyersoft/tools/A$Filter_Item;->missing:Z

    .line 364
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 366
    :cond_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 367
    new-instance v9, Lcom/flyersoft/tools/A$Filter_Item;

    invoke-virtual {v5, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-direct {v9, v8, v10}, Lcom/flyersoft/tools/A$Filter_Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 368
    iput-boolean v3, v9, Lcom/flyersoft/tools/A$Filter_Item;->fromBook:Z

    .line 369
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 371
    :cond_2
    invoke-virtual {v5}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 372
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 373
    new-instance v8, Lcom/flyersoft/tools/A$Filter_Item;

    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-direct {v8, v7, v9}, Lcom/flyersoft/tools/A$Filter_Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 375
    :cond_4
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$layout;->fonts_replacement:I

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 376
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->replaceLay:I

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    const/4 v5, 0x0

    .line 378
    :goto_3
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-gt v5, v7, :cond_5

    .line 379
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v7

    sget v8, Lcom/flyersoft/moonreaderp/R$layout;->font_replacement_item:I

    invoke-virtual {v7, v8, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v7

    .line 380
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 381
    invoke-static {v0, v3, v7, v6}, Lcom/flyersoft/moonreaderp/PrefFontPick;->setFontReplaceItemProperties(Landroid/content/Context;Landroid/widget/LinearLayout;Landroid/view/View;Ljava/util/ArrayList;)V

    const/4 v8, -0x1

    const/4 v9, -0x2

    .line 382
    invoke-virtual {v3, v7, v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 385
    :cond_5
    invoke-static {v2}, Lcom/flyersoft/tools/A;->checkNightTextColors(Landroid/view/View;)V

    .line 386
    new-instance v5, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v5, v0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    const/high16 v0, 0x41400000    # 12.0f

    .line 387
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/flyersoft/components/MyDialog;->setPaddingLeft(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v5

    .line 388
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    invoke-virtual {v5, v0}, Lcom/flyersoft/components/MyDialog;->setPaddingRight(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 389
    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefFontPick$11;

    invoke-direct {v2, p0, v3}, Lcom/flyersoft/moonreaderp/PrefFontPick$11;-><init>(Landroid/app/Dialog;Landroid/widget/LinearLayout;)V

    const p0, 0x104000a

    invoke-virtual {v0, p0, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const/high16 v0, 0x1040000

    .line 393
    invoke-virtual {p0, v0, v4}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0, v1}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method private showOverflowMenu(Landroid/view/View;I)V
    .locals 9

    .line 483
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getFonts()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Ljava/lang/String;

    .line 484
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 485
    invoke-static {v6}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 486
    invoke-static {v6}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x3

    .line 487
    :goto_0
    new-array v5, v2, [Ljava/lang/String;

    .line 488
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v8, Lcom/flyersoft/moonreaderp/R$string;->font_weight:I

    invoke-virtual {v3, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " & "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v8, Lcom/flyersoft/moonreaderp/R$string;->italic_skew:I

    invoke-virtual {v3, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v8, 0x0

    aput-object v2, v5, v8

    if-eqz v0, :cond_1

    .line 490
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->operations:I

    invoke-static {v0, v2, v8}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v1

    .line 491
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->operations:I

    invoke-static {v0, v2, v1}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    aput-object v0, v5, v1

    .line 493
    :cond_1
    new-instance v0, Lcom/flyersoft/components/MyMenu;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    .line 494
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    move-object v2, p0

    move v3, p2

    invoke-direct/range {v1 .. v7}, Lcom/flyersoft/moonreaderp/PrefFontPick$14;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick;ILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 495
    invoke-virtual {v0, v5, v1}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p2

    iget-object v0, v2, Lcom/flyersoft/moonreaderp/PrefFontPick;->root:Landroid/view/View;

    .line 553
    invoke-virtual {p2, v0}, Lcom/flyersoft/components/MyMenu;->setBuilderAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object p2

    invoke-static {}, Lcom/flyersoft/components/MyMenu;->getYoffInDialog()I

    move-result v0

    invoke-virtual {p2, p1, v8, v0}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;II)V

    return-void
.end method

.method public static showUsedEpubFonts(Landroid/app/Dialog;Z)V
    .locals 16

    .line 217
    invoke-virtual/range {p0 .. p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    .line 218
    sput-boolean v1, Lcom/flyersoft/moonreaderp/PrefFontPick;->epubIgnoreFontChanged:Z

    move/from16 v2, p1

    .line 219
    invoke-static {v2, v1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getPageTextFonts(ZZ)Ljava/util/ArrayList;

    move-result-object v2

    .line 221
    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 222
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/CharSequence;

    .line 223
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v4, v4, [Z

    .line 224
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-array v5, v5, [Z

    const/4 v6, 0x0

    .line 225
    :goto_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v6, v7, :cond_7

    .line 226
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    const/4 v8, 0x1

    .line 227
    invoke-static {v7, v8}, Lcom/flyersoft/tools/A;->fontInEpubIgnored(Ljava/lang/String;Z)Z

    move-result v9

    xor-int/2addr v9, v8

    aput-boolean v9, v5, v6

    aput-boolean v9, v4, v6

    .line 229
    invoke-static {v7, v1, v8, v1}, Lcom/flyersoft/tools/A;->getTypeFace2(Ljava/lang/String;IZZ)Landroid/graphics/Typeface;

    move-result-object v9

    if-eqz v9, :cond_0

    const/4 v9, 0x1

    goto :goto_1

    :cond_0
    const/4 v9, 0x0

    .line 230
    :goto_1
    invoke-static {v7}, Lcom/flyersoft/tools/A;->getReplaceFontName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_1

    .line 231
    invoke-static {v10, v1, v8, v1}, Lcom/flyersoft/tools/A;->getTypeFace2(Ljava/lang/String;IZZ)Landroid/graphics/Typeface;

    move-result-object v11

    if-eqz v11, :cond_1

    const/4 v11, 0x1

    goto :goto_2

    :cond_1
    const/4 v11, 0x0

    :goto_2
    if-eqz v9, :cond_4

    if-eqz v10, :cond_2

    .line 236
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, "\n> "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto :goto_3

    :cond_2
    move-object v9, v7

    .line 237
    :goto_3
    new-instance v12, Landroid/text/SpannableStringBuilder;

    invoke-direct {v12, v9}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 238
    new-instance v13, Lcom/flyersoft/staticlayout/MyTypefaceSpan;

    invoke-direct {v13, v7, v8}, Lcom/flyersoft/staticlayout/MyTypefaceSpan;-><init>(Ljava/lang/String;Z)V

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    const/16 v14, 0x22

    invoke-virtual {v12, v13, v1, v8, v14}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    if-eqz v10, :cond_3

    .line 240
    new-instance v8, Landroid/text/style/ForegroundColorSpan;

    const v13, -0x777778

    invoke-direct {v8, v13}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v13

    add-int/lit8 v13, v13, 0x2

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v15

    invoke-virtual {v12, v8, v13, v15, v14}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    if-eqz v11, :cond_3

    .line 242
    new-instance v8, Lcom/flyersoft/staticlayout/MyTypefaceSpan;

    invoke-direct {v8, v10}, Lcom/flyersoft/staticlayout/MyTypefaceSpan;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, 0x3

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v12, v8, v7, v9, v14}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 244
    :cond_3
    aput-object v12, v3, v6

    goto :goto_5

    :cond_4
    if-eqz v10, :cond_5

    .line 247
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v12, "<br>> "

    invoke-direct {v7, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, ""

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v8}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    :cond_5
    if-eqz v9, :cond_6

    goto :goto_4

    .line 248
    :cond_6
    invoke-static {v7}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :goto_4
    invoke-static {v7}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    aput-object v7, v3, v6

    :goto_5
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_0

    .line 252
    :cond_7
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v1, v0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->fonts_in_css:I

    .line 253
    invoke-virtual {v1, v0}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefFontPick$10;

    invoke-direct {v1, v4}, Lcom/flyersoft/moonreaderp/PrefFontPick$10;-><init>([Z)V

    .line 254
    invoke-virtual {v0, v3, v4, v1}, Lcom/flyersoft/components/MyDialog;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefFontPick$9;

    invoke-direct {v1, v4, v5, v2}, Lcom/flyersoft/moonreaderp/PrefFontPick$9;-><init>([Z[ZLjava/util/ArrayList;)V

    const v3, 0x104000a

    .line 259
    invoke-virtual {v0, v3, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->fonts_replacement:I

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefFontPick$8;

    move-object/from16 v6, p0

    invoke-direct {v3, v4, v5, v2, v6}, Lcom/flyersoft/moonreaderp/PrefFontPick$8;-><init>([Z[ZLjava/util/ArrayList;Landroid/app/Dialog;)V

    .line 265
    invoke-virtual {v0, v1, v3}, Lcom/flyersoft/components/MyDialog;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 272
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_8
    return-void
.end method

.method private static weightName(I)Ljava/lang/CharSequence;
    .locals 2

    const/16 v0, 0x64

    if-ne p0, v0, :cond_0

    .line 749
    const-string v0, "Thin"

    goto :goto_0

    :cond_0
    const/16 v0, 0xc8

    if-ne p0, v0, :cond_1

    const-string v0, "Extra Light"

    goto :goto_0

    :cond_1
    const/16 v0, 0x12c

    if-ne p0, v0, :cond_2

    const-string v0, "Light"

    goto :goto_0

    :cond_2
    const/16 v0, 0x190

    if-ne p0, v0, :cond_3

    .line 750
    const-string v0, "Normal"

    goto :goto_0

    :cond_3
    const/16 v0, 0x1f4

    if-ne p0, v0, :cond_4

    const-string v0, "Medium"

    goto :goto_0

    :cond_4
    const/16 v0, 0x258

    if-ne p0, v0, :cond_5

    const-string v0, "Semi Bold"

    goto :goto_0

    :cond_5
    const/16 v0, 0x2bc

    if-ne p0, v0, :cond_6

    .line 751
    const-string v0, "Bold"

    goto :goto_0

    :cond_6
    const/16 v0, 0x320

    if-ne p0, v0, :cond_7

    const-string v0, "Extra Bold"

    goto :goto_0

    :cond_7
    const-string v0, "Black"

    .line 752
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " ("

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .line 914
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 915
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->eraseGPUShadow(I)V

    .line 916
    :cond_0
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->cancel()V

    return-void
.end method

.method public dismiss()V
    .locals 3

    .line 979
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->onGetFont:Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;

    if-eqz v0, :cond_0

    .line 980
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->selectedFont:Ljava/lang/String;

    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->styleChanged:Z

    invoke-interface {v0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;->getFont(Ljava/lang/String;Z)V

    :cond_0
    const/4 v0, 0x0

    .line 981
    sput-object v0, Lcom/flyersoft/tools/A;->typefaceCache:Ljava/util/HashMap;

    .line 982
    sput-object v0, Lcom/flyersoft/tools/A;->typefaceSkewCache:Ljava/util/HashMap;

    .line 983
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefFontPick;->selfPref:Lcom/flyersoft/moonreaderp/PrefFontPick;

    .line 984
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void
.end method

.method getFonts()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 767
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fonts:Ljava/util/ArrayList;

    if-nez v0, :cond_3

    .line 768
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->key:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 769
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->key:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->key:Ljava/lang/String;

    .line 770
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fonts:Ljava/util/ArrayList;

    .line 771
    sget-object v0, Lcom/flyersoft/tools/A;->localFontfaces:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 772
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 773
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fonts:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 776
    :cond_1
    sget-object v0, Lcom/flyersoft/tools/A;->localFontfaces:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fonts:Ljava/util/ArrayList;

    .line 777
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fonts:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontFaces:[Landroid/graphics/Typeface;

    .line 779
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fonts:Ljava/util/ArrayList;

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7

    .line 920
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontFind:Landroid/widget/ImageButton;

    if-ne p1, v0, :cond_0

    .line 921
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->doFindFonts()V

    .line 924
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->downloadB:Landroid/widget/TextView;

    if-ne p1, v0, :cond_c

    .line 926
    sget-boolean p1, Lcom/flyersoft/tools/A;->isChinese:Z

    if-eqz p1, :cond_1

    .line 927
    const-string p1, "\u5b57\u4f53\u4e0b\u8f7d"

    :goto_0
    move-object v4, p1

    goto/16 :goto_3

    .line 928
    :cond_1
    sget-object p1, Lcom/flyersoft/tools/A;->localeCountry:Ljava/lang/String;

    const-string v0, "KR"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_b

    sget-object p1, Lcom/flyersoft/tools/A;->localeLanguage:Ljava/lang/String;

    const-string v0, "ko"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto/16 :goto_2

    .line 930
    :cond_2
    sget-object p1, Lcom/flyersoft/tools/A;->localeCountry:Ljava/lang/String;

    const-string v0, "JP"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_a

    sget-object p1, Lcom/flyersoft/tools/A;->localeLanguage:Ljava/lang/String;

    const-string v0, "ja"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_1

    .line 932
    :cond_3
    sget-object p1, Lcom/flyersoft/tools/A;->localeLanguage:Ljava/lang/String;

    const-string v0, "ru"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 933
    const-string p1, "russian ttf download"

    goto :goto_0

    .line 934
    :cond_4
    sget-object p1, Lcom/flyersoft/tools/A;->localeLanguage:Ljava/lang/String;

    const-string v0, "de"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 935
    const-string p1, "german ttf download"

    goto :goto_0

    .line 936
    :cond_5
    sget-object p1, Lcom/flyersoft/tools/A;->localeLanguage:Ljava/lang/String;

    const-string v0, "pt"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 937
    const-string p1, "portuguese ttf download"

    goto :goto_0

    .line 938
    :cond_6
    sget-object p1, Lcom/flyersoft/tools/A;->localeLanguage:Ljava/lang/String;

    const-string v0, "fr"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    .line 939
    const-string p1, "french ttf download"

    goto :goto_0

    .line 940
    :cond_7
    sget-object p1, Lcom/flyersoft/tools/A;->localeLanguage:Ljava/lang/String;

    const-string v0, "it"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    .line 941
    const-string p1, "italian ttf download"

    goto :goto_0

    .line 942
    :cond_8
    sget-object p1, Lcom/flyersoft/tools/A;->localeLanguage:Ljava/lang/String;

    const-string v0, "es"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_9

    .line 943
    const-string p1, "spanish ttf download"

    goto :goto_0

    .line 942
    :cond_9
    const-string p1, "free ttf font download"

    goto :goto_0

    .line 931
    :cond_a
    :goto_1
    const-string p1, "japanese ttf download"

    goto/16 :goto_0

    .line 929
    :cond_b
    :goto_2
    const-string p1, "korean ttf download"

    goto/16 :goto_0

    .line 946
    :goto_3
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefFontPick$27;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$27;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefDownloadCover$OnSaveImage;Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 953
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->show()V

    :cond_c
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 74
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 75
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->initView()V

    .line 76
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const v0, 0x3f4ccccd    # 0.8f

    .line 77
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, -0x1

    .line 78
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x0

    .line 79
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 80
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHideExit(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 81
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->select_font:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->deleteQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 82
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFuncSearchVisible(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 83
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    .line 85
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->searchView:Landroidx/appcompat/widget/SearchView;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFontPick$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$1;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Landroidx/appcompat/widget/SearchView$OnQueryTextListener;)V

    .line 96
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->searchView:Landroidx/appcompat/widget/SearchView;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFontPick$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$2;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnCloseListener(Landroidx/appcompat/widget/SearchView$OnCloseListener;)V

    .line 104
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->searchView:Landroidx/appcompat/widget/SearchView;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFontPick$3;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$3;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnSearchClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->searchView:Landroidx/appcompat/widget/SearchView;

    const v0, -0x333334

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->setImageViewTint(Landroid/view/View;I)V

    .line 113
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->searchAutoComplete:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->setTextColor(I)V

    .line 114
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->searchAutoComplete:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    const-string v0, ""

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->setHint(Ljava/lang/CharSequence;)V

    return-void
.end method

.method searchFont(Ljava/lang/String;)V
    .locals 0

    .line 119
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->key:Ljava/lang/String;

    const/4 p1, 0x0

    .line 120
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fonts:Ljava/util/ArrayList;

    .line 121
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 122
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method
