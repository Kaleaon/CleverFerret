.class public Lcom/flyersoft/tools/A$PageTheme;
.super Ljava/lang/Object;
.source "A.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/A;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PageTheme"
.end annotation


# instance fields
.field public displayName:Ljava/lang/String;

.field public emptyFontStyle:Z

.field public pBackgroundColor:I

.field public pBackgroundImage:Ljava/lang/String;

.field public pBottomMargin:I

.field public pFontAnti:Z

.field public pFontBold:Z

.field public pFontColor:I

.field public pFontItalic:Z

.field public pFontName:Ljava/lang/String;

.field public pFontScale:I

.field public pFontShadow:Z

.field public pFontSize:F

.field public pFontSpace:I

.field public pFontUnderline:Z

.field public pLeftMargin:I

.field public pLineSpace:I

.field public pName:Ljava/lang/String;

.field public pParagraphSpace:I

.field public pRightMargin:I

.field public pTextJustified:Z

.field public pTopMargin:I

.field public pUseBackgroundImage:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 3693
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3694
    invoke-virtual {p0, p1}, Lcom/flyersoft/tools/A$PageTheme;->loadFromXml(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getDrawableImage()Lcom/flyersoft/tools/A$MyDrawable;
    .locals 4

    .line 3681
    iget-object v0, p0, Lcom/flyersoft/tools/A$PageTheme;->pBackgroundImage:Ljava/lang/String;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 3682
    new-instance v0, Lcom/flyersoft/tools/A$MyDrawable;

    invoke-direct {v0}, Lcom/flyersoft/tools/A$MyDrawable;-><init>()V

    .line 3683
    iput v1, v0, Lcom/flyersoft/tools/A$MyDrawable;->from:I

    .line 3684
    iget-object v1, p0, Lcom/flyersoft/tools/A$PageTheme;->pBackgroundImage:Ljava/lang/String;

    iput-object v1, v0, Lcom/flyersoft/tools/A$MyDrawable;->filename:Ljava/lang/String;

    return-object v0

    .line 3687
    :cond_0
    invoke-static {v1}, Lcom/flyersoft/tools/A;->getBackgroundImages(Z)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/A$MyDrawable;

    .line 3688
    iget-object v2, v1, Lcom/flyersoft/tools/A$MyDrawable;->imageName:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/tools/A$PageTheme;->pBackgroundImage:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    return-object v1

    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method public loadFromXml(Ljava/lang/String;)V
    .locals 3

    .line 3699
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "theme_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 3700
    iput-object p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    .line 3701
    const-string v1, "Day Theme"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const-string v1, "pFontName"

    if-eqz p1, :cond_0

    .line 3702
    sget p1, Lcom/flyersoft/moonreaderp/R$string;->day_theme:I

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/tools/A$PageTheme;->displayName:Ljava/lang/String;

    goto :goto_0

    .line 3703
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    const-string v2, "Night Theme"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 3704
    sget p1, Lcom/flyersoft/moonreaderp/R$string;->night_theme:I

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/tools/A$PageTheme;->displayName:Ljava/lang/String;

    goto :goto_0

    .line 3705
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    const-string v2, "Amoled Theme"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 3706
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->night_theme:I

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n(AMOLED)"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/tools/A$PageTheme;->displayName:Ljava/lang/String;

    goto :goto_0

    .line 3708
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    iput-object p1, p0, Lcom/flyersoft/tools/A$PageTheme;->displayName:Ljava/lang/String;

    .line 3709
    const-string p1, "false"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/flyersoft/tools/A$PageTheme;->emptyFontStyle:Z

    .line 3712
    :goto_0
    const-string p1, "pBackgroundImage"

    sget-object v2, Lcom/flyersoft/tools/A;->backgroundImage:Ljava/lang/String;

    invoke-interface {v0, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pBackgroundImage:Ljava/lang/String;

    .line 3713
    sget-object p1, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pFontName:Ljava/lang/String;

    .line 3714
    const-string p1, "pFontColor"

    sget v1, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pFontColor:I

    .line 3715
    const-string p1, "pBackgroundColor"

    sget v1, Lcom/flyersoft/tools/A;->backgroundColor:I

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pBackgroundColor:I

    .line 3716
    const-string p1, "pTopMargin2"

    sget v1, Lcom/flyersoft/tools/A;->topMargin:I

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pTopMargin:I

    .line 3717
    const-string p1, "pBottomMargin2"

    sget v1, Lcom/flyersoft/tools/A;->topMargin:I

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pBottomMargin:I

    .line 3718
    const-string p1, "pLeftMargin"

    sget v1, Lcom/flyersoft/tools/A;->leftMargin:I

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pLeftMargin:I

    .line 3719
    const-string p1, "pRightMargin"

    sget v1, Lcom/flyersoft/tools/A;->rightMargin:I

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pRightMargin:I

    .line 3721
    const-string p1, "pFontSize"

    sget v1, Lcom/flyersoft/tools/A;->fontSize:F

    invoke-static {v0, p1, v1}, Lcom/flyersoft/tools/A;->-$$Nest$smgetSpFloatOrIntValue(Landroid/content/SharedPreferences;Ljava/lang/String;F)F

    move-result p1

    iput p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pFontSize:F

    .line 3722
    const-string p1, "pLineSpace"

    sget v1, Lcom/flyersoft/tools/A;->lineSpace:I

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pLineSpace:I

    .line 3723
    const-string p1, "pParagraphSpace"

    sget v1, Lcom/flyersoft/tools/A;->paragraphSpace:I

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pParagraphSpace:I

    .line 3724
    const-string p1, "pFontSpace"

    sget v1, Lcom/flyersoft/tools/A;->fontSpace:I

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pFontSpace:I

    .line 3725
    const-string p1, "pFontScale"

    sget v1, Lcom/flyersoft/tools/A;->fontScale:I

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pFontScale:I

    .line 3726
    const-string p1, "pFontBold"

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontBold:Z

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pFontBold:Z

    .line 3727
    const-string p1, "pFontAnti"

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontAnti:Z

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pFontAnti:Z

    .line 3728
    const-string p1, "pFontUnderline"

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontUnderline:Z

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pFontUnderline:Z

    .line 3729
    const-string p1, "pFontItalic"

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontItalic:Z

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pFontItalic:Z

    .line 3730
    const-string p1, "pFontShadow"

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontShadow:Z

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pFontShadow:Z

    .line 3732
    const-string p1, "pTextJustified"

    sget-boolean v1, Lcom/flyersoft/tools/A;->textJustified:Z

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pTextJustified:Z

    .line 3733
    const-string p1, "pUseBackgroundImage"

    iget-boolean v1, p0, Lcom/flyersoft/tools/A$PageTheme;->pUseBackgroundImage:Z

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/flyersoft/tools/A$PageTheme;->pUseBackgroundImage:Z

    return-void
.end method

.method public saveToXml(Ljava/lang/String;Z)V
    .locals 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 3737
    iput-object v1, v0, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    .line 3738
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "theme_"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 3739
    const-string v2, "pUseBackgroundImage"

    const-string v3, "pTextJustified"

    const-string v4, "pFontShadow"

    const-string v5, "pFontItalic"

    const-string v6, "pFontUnderline"

    const-string v7, "pFontAnti"

    const-string v8, "pFontBold"

    const-string v9, "pFontScale"

    const-string v10, "pFontSpace"

    const-string v11, "pParagraphSpace"

    const-string v12, "pLineSpace"

    const-string v13, "pFontSize"

    const-string v14, "pRightMargin"

    const-string v15, "pLeftMargin"

    move-object/from16 p1, v1

    const-string v1, "pBottomMargin2"

    const-string v0, "pTopMargin2"

    move-object/from16 v16, v2

    const-string v2, "pBackgroundColor"

    move-object/from16 v17, v3

    const-string v3, "pFontColor"

    move-object/from16 v18, v4

    const-string v4, "pFontName"

    move-object/from16 v19, v5

    const-string v5, "pBackgroundImage"

    if-eqz p2, :cond_0

    move-object/from16 v20, v6

    .line 3740
    invoke-interface/range {p1 .. p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    move-object/from16 v21, v7

    sget-object v7, Lcom/flyersoft/tools/A;->backgroundImage:Ljava/lang/String;

    invoke-interface {v6, v5, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    sget-object v6, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    .line 3741
    invoke-interface {v5, v4, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    sget v5, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-interface {v4, v3, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    sget v4, Lcom/flyersoft/tools/A;->backgroundColor:I

    .line 3742
    invoke-interface {v3, v2, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    sget v3, Lcom/flyersoft/tools/A;->topMargin:I

    .line 3743
    invoke-interface {v2, v0, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget v2, Lcom/flyersoft/tools/A;->bottomMargin:I

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->leftMargin:I

    .line 3744
    invoke-interface {v0, v15, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->rightMargin:I

    .line 3745
    invoke-interface {v0, v14, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->fontSize:F

    invoke-interface {v0, v13, v1}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->lineSpace:I

    .line 3746
    invoke-interface {v0, v12, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->paragraphSpace:I

    .line 3747
    invoke-interface {v0, v11, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->fontSpace:I

    .line 3748
    invoke-interface {v0, v10, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->fontScale:I

    .line 3749
    invoke-interface {v0, v9, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontBold:Z

    .line 3750
    invoke-interface {v0, v8, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontAnti:Z

    move-object/from16 v6, v21

    .line 3751
    invoke-interface {v0, v6, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontUnderline:Z

    move-object/from16 v7, v20

    .line 3752
    invoke-interface {v0, v7, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontItalic:Z

    move-object/from16 v2, v19

    .line 3753
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontShadow:Z

    move-object/from16 v2, v18

    .line 3754
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->textJustified:Z

    move-object/from16 v2, v17

    .line 3755
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->useBackgroundImage:Z

    move-object/from16 v2, v16

    .line 3756
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void

    :cond_0
    move-object/from16 v20, v6

    move-object v6, v7

    move-object/from16 v22, v16

    move-object/from16 v23, v17

    move-object/from16 v24, v18

    move-object/from16 v25, v19

    .line 3758
    invoke-interface/range {p1 .. p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    move-object/from16 v21, v6

    move-object/from16 p1, v8

    move-object/from16 v6, p0

    iget-object v8, v6, Lcom/flyersoft/tools/A$PageTheme;->pBackgroundImage:Ljava/lang/String;

    invoke-interface {v7, v5, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    iget-object v7, v6, Lcom/flyersoft/tools/A$PageTheme;->pFontName:Ljava/lang/String;

    .line 3759
    invoke-interface {v5, v4, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    iget v5, v6, Lcom/flyersoft/tools/A$PageTheme;->pFontColor:I

    invoke-interface {v4, v3, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    iget v4, v6, Lcom/flyersoft/tools/A$PageTheme;->pBackgroundColor:I

    .line 3760
    invoke-interface {v3, v2, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    iget v3, v6, Lcom/flyersoft/tools/A$PageTheme;->pTopMargin:I

    .line 3761
    invoke-interface {v2, v0, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget v2, v6, Lcom/flyersoft/tools/A$PageTheme;->pBottomMargin:I

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget v1, v6, Lcom/flyersoft/tools/A$PageTheme;->pLeftMargin:I

    .line 3762
    invoke-interface {v0, v15, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget v1, v6, Lcom/flyersoft/tools/A$PageTheme;->pRightMargin:I

    .line 3763
    invoke-interface {v0, v14, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget v1, v6, Lcom/flyersoft/tools/A$PageTheme;->pFontSize:F

    invoke-interface {v0, v13, v1}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget v1, v6, Lcom/flyersoft/tools/A$PageTheme;->pLineSpace:I

    .line 3764
    invoke-interface {v0, v12, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget v1, v6, Lcom/flyersoft/tools/A$PageTheme;->pParagraphSpace:I

    .line 3765
    invoke-interface {v0, v11, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget v1, v6, Lcom/flyersoft/tools/A$PageTheme;->pFontSpace:I

    .line 3766
    invoke-interface {v0, v10, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget v1, v6, Lcom/flyersoft/tools/A$PageTheme;->pFontScale:I

    .line 3767
    invoke-interface {v0, v9, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-boolean v1, v6, Lcom/flyersoft/tools/A$PageTheme;->pFontBold:Z

    move-object/from16 v2, p1

    .line 3768
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-boolean v1, v6, Lcom/flyersoft/tools/A$PageTheme;->pFontAnti:Z

    move-object/from16 v2, v21

    .line 3769
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-boolean v1, v6, Lcom/flyersoft/tools/A$PageTheme;->pFontUnderline:Z

    move-object/from16 v7, v20

    .line 3770
    invoke-interface {v0, v7, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-boolean v1, v6, Lcom/flyersoft/tools/A$PageTheme;->pFontItalic:Z

    move-object/from16 v2, v25

    .line 3771
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-boolean v1, v6, Lcom/flyersoft/tools/A$PageTheme;->pFontShadow:Z

    move-object/from16 v2, v24

    .line 3772
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-boolean v1, v6, Lcom/flyersoft/tools/A$PageTheme;->pTextJustified:Z

    move-object/from16 v2, v23

    .line 3773
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-boolean v1, v6, Lcom/flyersoft/tools/A$PageTheme;->pUseBackgroundImage:Z

    move-object/from16 v2, v22

    .line 3774
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method
