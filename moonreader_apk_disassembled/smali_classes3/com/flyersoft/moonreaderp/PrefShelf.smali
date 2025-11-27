.class public Lcom/flyersoft/moonreaderp/PrefShelf;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefShelf.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefShelf$MyReceiver;
    }
.end annotation


# static fields
.field public static selfPref:Lcom/flyersoft/moonreaderp/PrefShelf;


# instance fields
.field WoodyResClick:Landroid/view/View$OnClickListener;

.field backupB:Landroid/widget/Button;

.field coverB:Landroid/widget/TextView;

.field dbEmpty:Landroid/widget/TextView;

.field dbImport:Landroid/widget/TextView;

.field dynamicMS:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field fingerCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field foldersForm:Landroid/widget/ScrollView;

.field langSpin:Landroid/widget/Spinner;

.field lastFolderPath:Ljava/lang/String;

.field onFolderItemClick:Landroid/view/View$OnClickListener;

.field onPasswordCheck:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field passCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field pathEdit:Landroid/widget/TextView;

.field preAmoled:Z

.field restoreB:Landroid/widget/Button;

.field showBackup:Z

.field woodyDaySelected:Ljava/lang/Boolean;

.field woodyLay:Landroid/view/View;

.field woodyRes:I


# direct methods
.method static bridge synthetic -$$Nest$mdoAfterDynamicColorChanged(Lcom/flyersoft/moonreaderp/PrefShelf;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->doAfterDynamicColorChanged()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mfingerCheckSetVisible(Lcom/flyersoft/moonreaderp/PrefShelf;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->fingerCheckSetVisible(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetCustSelfFile(Lcom/flyersoft/moonreaderp/PrefShelf;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getCustSelfFile()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mloadCustShelfImage(Lcom/flyersoft/moonreaderp/PrefShelf;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->loadCustShelfImage()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetFolderItemProperties(Lcom/flyersoft/moonreaderp/PrefShelf;Landroid/view/View;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefShelf;->setFolderItemProperties(Landroid/view/View;I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetWoodySelect(Lcom/flyersoft/moonreaderp/PrefShelf;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->setWoodySelect()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowCustomDynamicPicker(Lcom/flyersoft/moonreaderp/PrefShelf;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->showCustomDynamicPicker()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ZLjava/lang/String;)V
    .locals 1

    .line 50
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->pref_shelf:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    .line 382
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefShelf$11;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefShelf$11;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->onPasswordCheck:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 831
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefShelf$20;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefShelf$20;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->WoodyResClick:Landroid/view/View$OnClickListener;

    .line 864
    sget-object p1, Lcom/flyersoft/tools/A;->scanPath:Ljava/lang/String;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->lastFolderPath:Ljava/lang/String;

    .line 891
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefShelf$21;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefShelf$21;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->onFolderItemClick:Landroid/view/View$OnClickListener;

    .line 51
    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->showBackup:Z

    .line 52
    invoke-virtual {p0, p3}, Lcom/flyersoft/moonreaderp/PrefShelf;->scrollToTitle(Ljava/lang/String;)V

    return-void
.end method

.method private createItemsView()Landroid/widget/ScrollView;
    .locals 7

    .line 867
    new-instance v0, Landroid/widget/ScrollView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 869
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    .line 870
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/4 v2, -0x1

    .line 871
    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;II)V

    const/4 v3, 0x0

    .line 873
    :goto_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getAutoImportFolders()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-gt v3, v4, :cond_0

    .line 874
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$layout;->auto_import_folders:I

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 875
    invoke-direct {p0, v4, v3}, Lcom/flyersoft/moonreaderp/PrefShelf;->setFolderItemProperties(Landroid/view/View;I)V

    const/4 v5, -0x2

    .line 876
    invoke-virtual {v1, v4, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 879
    :cond_0
    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightTextColors(Landroid/view/View;)V

    return-object v0
.end method

.method private createWoodyResView()Landroid/view/View;
    .locals 3

    .line 780
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->woody_res:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    .line 781
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->woody0:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->WoodyResClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 782
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->woody1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->WoodyResClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 783
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->woody2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->WoodyResClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 784
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->woody3:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->WoodyResClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 785
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->woody4:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->WoodyResClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 786
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->woody5:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->WoodyResClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 788
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->rg:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioGroup;

    .line 789
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefShelf$19;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefShelf$19;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    .line 798
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyDaySelected:Ljava/lang/Boolean;

    if-nez v1, :cond_0

    .line 799
    sget-boolean v1, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyDaySelected:Ljava/lang/Boolean;

    .line 800
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyDaySelected:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->r0:I

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->r1:I

    :goto_0
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    .line 801
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->loadCustShelfImage()V

    .line 803
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->setWoodySelect()V

    .line 804
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 805
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    return-object v0
.end method

.method private doAfterDynamicColorChanged()V
    .locals 4

    .line 326
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/C;->initDynamicColors(Landroid/content/Context;)V

    .line 327
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->pref_shelf:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->resetViewColorsFinal(Landroid/view/View;Landroid/view/View;)V

    .line 328
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 329
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 330
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateMainTheme(Z)V

    .line 331
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->langSpin:Landroid/widget/Spinner;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->setLanguageList(Landroid/widget/Spinner;Landroid/content/Context;)V

    .line 332
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->langSpin:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->languageID:I

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 335
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->selfPref:Lcom/flyersoft/moonreaderp/PrefMisc;

    if-eqz v0, :cond_1

    .line 336
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->selfPref:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->forceDayTextColors(Landroid/view/View;)V

    .line 337
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->selfPref:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->pref_misc:I

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->resetViewColorsFinal(Landroid/view/View;Landroid/view/View;)V

    .line 338
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->selfPref:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    :cond_1
    return-void
.end method

.method private fingerCheckSetVisible(I)V
    .locals 2

    .line 462
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->fingerCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setVisibility(I)V

    .line 463
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->fingerCheck2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private getCustSelfFile()Ljava/lang/String;
    .locals 1

    .line 818
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyDaySelected:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/flyersoft/tools/A;->custSelfDay:Ljava/lang/String;

    return-object v0

    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->custSelfNight:Ljava/lang/String;

    return-object v0
.end method

.method private loadCustShelfImage()V
    .locals 2

    .line 809
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getCustSelfFile()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 810
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->custWoody:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyDaySelected:Ljava/lang/Boolean;

    .line 811
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getCustShelfImage(Z)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 810
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 813
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->custWoody:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method private passCheckSetVisible(I)V
    .locals 2

    .line 457
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->passCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setVisibility(I)V

    .line 458
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmPasswordCheck2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private saveSettings(Z)V
    .locals 4

    .line 500
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->langSpin:Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->languageID:I

    .line 502
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->showHidden:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->showHiddenFiles:Z

    .line 504
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->fabCheck:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result p1

    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 505
    sput v0, Lcom/flyersoft/tools/A;->fabButtonType:I

    goto :goto_0

    .line 506
    :cond_0
    sget p1, Lcom/flyersoft/tools/A;->fabButtonType:I

    if-ne p1, v0, :cond_1

    const/4 p1, 0x0

    .line 507
    sput p1, Lcom/flyersoft/tools/A;->fabButtonType:I

    .line 509
    :cond_1
    :goto_0
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->woody:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->woody:Z

    .line 510
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->coverProgress:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->coverWithProgress:Z

    .line 511
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->floatFav:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->floatFavSelector:Z

    .line 512
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->pmAuoImport:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->auto_import:Z

    .line 513
    sget-boolean p1, Lcom/flyersoft/tools/A;->auto_import:Z

    if-eqz p1, :cond_2

    sget-wide v0, Lcom/flyersoft/tools/A;->auto_import_time:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-nez p1, :cond_2

    .line 514
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/flyersoft/tools/A;->auto_import_time:J

    .line 515
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->passCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->needPasswordProtect:Z

    .line 516
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->fingerCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->fingerPrint:Z

    .line 517
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pmOpenAnimat:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->openBookAnim:Z

    .line 518
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pmSysDark:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->sysDarkModeFollow:Z

    .line 524
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    return-void
.end method

.method private setFolderItemProperties(Landroid/view/View;I)V
    .locals 2

    .line 884
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->op:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 885
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 886
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->onFolderItemClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 887
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    invoke-static {}, Lcom/flyersoft/tools/A;->getAutoImportFolders()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p2, v1, :cond_0

    invoke-static {}, Lcom/flyersoft/tools/A;->getAutoImportFolders()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 888
    invoke-static {}, Lcom/flyersoft/tools/A;->getAutoImportFolders()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ne p2, p1, :cond_1

    const-string p1, "+"

    goto :goto_1

    :cond_1
    const-string p1, "-"

    :goto_1
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private setSysDarkVisible(Z)V
    .locals 4

    .line 378
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSysDark:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eqz p1, :cond_0

    const/4 v3, 0x0

    goto :goto_0

    :cond_0
    const/16 v3, 0x8

    :goto_0
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 379
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmSysDark2:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    const/16 v1, 0x8

    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private setWoodySelect()V
    .locals 5

    .line 822
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyDaySelected:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/A;->woodyResDay:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->woodyResNight:I

    :goto_0
    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyRes:I

    .line 823
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->woody0:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyRes:I

    const v2, 0x331e88e5

    const/4 v3, 0x0

    if-nez v1, :cond_1

    const v1, 0x331e88e5

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 824
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->woody1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyRes:I

    const/4 v4, 0x1

    if-ne v1, v4, :cond_2

    const v1, 0x331e88e5

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    :goto_2
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 825
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->woody2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyRes:I

    const/4 v4, 0x2

    if-ne v1, v4, :cond_3

    const v1, 0x331e88e5

    goto :goto_3

    :cond_3
    const/4 v1, 0x0

    :goto_3
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 826
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->woody3:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyRes:I

    const/4 v4, 0x3

    if-ne v1, v4, :cond_4

    const v1, 0x331e88e5

    goto :goto_4

    :cond_4
    const/4 v1, 0x0

    :goto_4
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 827
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->woody4:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyRes:I

    const/4 v4, 0x4

    if-ne v1, v4, :cond_5

    const v1, 0x331e88e5

    goto :goto_5

    :cond_5
    const/4 v1, 0x0

    :goto_5
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 828
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->woody5:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->woodyRes:I

    const/4 v4, 0x5

    if-ne v1, v4, :cond_6

    goto :goto_6

    :cond_6
    const/4 v2, 0x0

    :goto_6
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method

.method private showCustomDynamicPicker()V
    .locals 5

    .line 343
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->dynamic_color_picker:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 344
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->color:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/imageview/ShapeableImageView;

    .line 346
    sget v3, Lcom/flyersoft/tools/A;->customDynamicColor:I

    if-nez v3, :cond_0

    const v3, -0xb9a26e

    goto :goto_0

    :cond_0
    sget v3, Lcom/flyersoft/tools/A;->customDynamicColor:I

    .line 347
    :goto_0
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/google/android/material/imageview/ShapeableImageView;->setTag(Ljava/lang/Object;)V

    .line 348
    new-instance v4, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v4, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v4}, Lcom/google/android/material/imageview/ShapeableImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 349
    new-instance v3, Lcom/flyersoft/moonreaderp/PrefShelf$9;

    invoke-direct {v3, p0, v1}, Lcom/flyersoft/moonreaderp/PrefShelf$9;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;Lcom/google/android/material/imageview/ShapeableImageView;)V

    invoke-virtual {v1, v3}, Lcom/google/android/material/imageview/ShapeableImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 363
    new-instance v3, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->custom_dynamic_color:I

    invoke-virtual {v3, v4}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefShelf$10;

    invoke-direct {v3, p0, v1}, Lcom/flyersoft/moonreaderp/PrefShelf$10;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;Lcom/google/android/material/imageview/ShapeableImageView;)V

    const v1, 0x104000a

    .line 364
    invoke-virtual {v0, v1, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const/high16 v1, 0x1040000

    .line 373
    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 6

    .line 468
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->forFuncSearch:Z

    if-eqz v0, :cond_0

    .line 469
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 472
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncDropboxCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 473
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 474
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 475
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncFtpCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 476
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getScrollY()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/A;->prefOp:I

    .line 478
    :try_start_0
    sget-boolean v1, Lcom/flyersoft/tools/A;->showHiddenFiles:Z

    .line 479
    sget v2, Lcom/flyersoft/tools/A;->fabButtonType:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eq v2, v4, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    .line 480
    :goto_0
    invoke-direct {p0, v4}, Lcom/flyersoft/moonreaderp/PrefShelf;->saveSettings(Z)V

    .line 482
    sget v5, Lcom/flyersoft/tools/A;->fabButtonType:I

    if-eq v5, v4, :cond_2

    const/4 v3, 0x1

    :cond_2
    if-eq v2, v3, :cond_3

    .line 483
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->showFavButton()V

    .line 485
    :cond_3
    sget v2, Lcom/flyersoft/tools/A;->lastTab:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_4

    .line 486
    sget-boolean v2, Lcom/flyersoft/tools/A;->showHiddenFiles:Z

    if-eq v2, v1, :cond_4

    .line 487
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget-object v2, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->showFileList(Ljava/lang/String;)V

    .line 490
    :cond_4
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefTheme;->selfPref:Lcom/flyersoft/moonreaderp/PrefTheme;

    if-eqz v1, :cond_5

    .line 491
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefTheme;->selfPref:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->checkDayNightSwitchEnable()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    .line 493
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 495
    :cond_5
    :goto_1
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefShelf;->selfPref:Lcom/flyersoft/moonreaderp/PrefShelf;

    .line 496
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void
.end method

.method public initView()V
    .locals 7

    .line 81
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->forFuncSearch:Z

    if-nez v0, :cond_0

    .line 82
    sput-object p0, Lcom/flyersoft/moonreaderp/PrefShelf;->selfPref:Lcom/flyersoft/moonreaderp/PrefShelf;

    .line 83
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->backupB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->backupB:Landroid/widget/Button;

    .line 84
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->restoreB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->restoreB:Landroid/widget/Button;

    .line 86
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmDynamicColor:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->dynamicMS:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 87
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->importTv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->dbImport:Landroid/widget/TextView;

    .line 88
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->dbEmpty:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->dbEmpty:Landroid/widget/TextView;

    .line 90
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 91
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->shelfCover:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->coverB:Landroid/widget/TextView;

    .line 92
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->coverB:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->book_cover:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->size:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->backupB:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->restoreB:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->folderEdit:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->pathEdit:Landroid/widget/TextView;

    .line 99
    sget-object v1, Lcom/flyersoft/tools/A;->default_book_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->pathEdit:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->showHidden:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->showHiddenFiles:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 103
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->fabCheck:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget v1, Lcom/flyersoft/tools/A;->fabButtonType:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eq v1, v3, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 105
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->woody:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 106
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->floatFav:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->floatFavSelector:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 107
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->coverProgress:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->coverWithProgress:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 108
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pmAuoImport:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->auto_import:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 110
    sget-boolean v0, Lcom/flyersoft/tools/A;->floatFavSelector:Z

    const/16 v1, 0x8

    if-eqz v0, :cond_2

    sget v0, Lcom/flyersoft/tools/A;->runCount:I

    const/16 v3, 0x1e

    if-ge v0, v3, :cond_2

    .line 111
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->floatFav:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 112
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->floatFav2:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 115
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmPasswordCheck:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->passCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 116
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->fingerCheck:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->fingerCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 118
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PrefShelf;->passCheckSetVisible(I)V

    .line 119
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PrefShelf;->fingerCheckSetVisible(I)V

    .line 120
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->fingerCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v3, Lcom/flyersoft/tools/A;->fingerPrint:Z

    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 121
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 122
    invoke-direct {p0, v4}, Lcom/flyersoft/moonreaderp/PrefShelf;->passCheckSetVisible(I)V

    .line 123
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager;->available(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 124
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->passCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->passCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v5}, Lcom/google/android/material/materialswitch/MaterialSwitch;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\n("

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->fingerprint_recognition:I

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 124
    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setText(Ljava/lang/CharSequence;)V

    .line 126
    sget-boolean v0, Lcom/flyersoft/tools/A;->needPasswordProtect:Z

    if-eqz v0, :cond_3

    .line 127
    invoke-direct {p0, v4}, Lcom/flyersoft/moonreaderp/PrefShelf;->fingerCheckSetVisible(I)V

    .line 132
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->passCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->needPasswordProtect:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 133
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->passCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->onPasswordCheck:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 134
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->fingerCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefShelf$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefShelf$1;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 145
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pmEink:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->eink:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 146
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pmEink:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefShelf$2;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefShelf$2;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 176
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pmWoody:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 177
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pmImportFolders:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 179
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmOpenAnimat:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->openBookAnim:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 180
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSysDark:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->sysDarkModeFollow:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 182
    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->preAmoled:Z

    .line 183
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmAmoled:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->amoled:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 184
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmAmoled:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefShelf$3;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefShelf$3;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 207
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->dynamicMS:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-static {}, Lcom/flyersoft/tools/C;->getDynamicColorTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setText(Ljava/lang/CharSequence;)V

    .line 208
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->dynamicMS:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 209
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmDynamic:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefShelf$4;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefShelf$4;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 232
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->dynamicMS:Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefShelf$5;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefShelf$5;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 245
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v0

    if-nez v0, :cond_4

    .line 246
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmOpenAnimat:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 247
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmOpenAnimat2:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 250
    :cond_4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-ge v0, v2, :cond_5

    .line 251
    invoke-direct {p0, v4}, Lcom/flyersoft/moonreaderp/PrefShelf;->setSysDarkVisible(Z)V

    .line 253
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmLanguage:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->langSpin:Landroid/widget/Spinner;

    .line 254
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flyersoft/tools/A;->setLanguageList(Landroid/widget/Spinner;Landroid/content/Context;)V

    .line 255
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->langSpin:Landroid/widget/Spinner;

    sget v2, Lcom/flyersoft/tools/A;->languageID:I

    invoke-virtual {v0, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 257
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->langSpin:Landroid/widget/Spinner;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefShelf$6;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefShelf$6;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    invoke-virtual {v0, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 271
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->synvTv:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->sync_to_cloud:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "..."

    const-string v5, ""

    invoke-virtual {v2, v3, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 272
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSyncDropbox:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncDropboxCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 273
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSyncGdrive:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 274
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSyncWebDav:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 275
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSyncFtp:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncFtpCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 276
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncDropboxCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    const/4 v2, 0x2

    invoke-static {v0, v2}, Lcom/flyersoft/components/cloud/Cloud;->fixCloudTitle(Landroid/view/View;I)V

    .line 277
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    const/4 v2, 0x4

    invoke-static {v0, v2}, Lcom/flyersoft/components/cloud/Cloud;->fixCloudTitle(Landroid/view/View;I)V

    .line 278
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    const/4 v3, 0x6

    invoke-static {v0, v3}, Lcom/flyersoft/components/cloud/Cloud;->fixCloudTitle(Landroid/view/View;I)V

    .line 279
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncFtpCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-static {v0, v1}, Lcom/flyersoft/components/cloud/Cloud;->fixCloudTitle(Landroid/view/View;I)V

    .line 280
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    if-lez v0, :cond_6

    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Cloud;->isLogin()Z

    move-result v0

    if-nez v0, :cond_6

    .line 281
    sput v4, Lcom/flyersoft/tools/A;->syncType:I

    .line 282
    :cond_6
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->setSyncTypeChecked()V

    .line 283
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncDropboxCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-object v3, Lcom/flyersoft/moonreaderp/PrefMisc;->onSyncCheck:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 284
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-object v3, Lcom/flyersoft/moonreaderp/PrefMisc;->onSyncCheck:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 285
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-object v3, Lcom/flyersoft/moonreaderp/PrefMisc;->onSyncCheck:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 286
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncFtpCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-object v3, Lcom/flyersoft/moonreaderp/PrefMisc;->onSyncCheck:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 287
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmSetFtp:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 288
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmSetWebDav:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 289
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmSetDropbox:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 290
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmSetGdrive:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 292
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->forFuncSearch:Z

    if-nez v0, :cond_7

    sget v0, Lcom/flyersoft/tools/A;->prefOp:I

    if-lez v0, :cond_7

    .line 293
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefShelf$7;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefShelf$7;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    const-wide/16 v4, 0x64

    invoke-virtual {v0, v3, v4, v5}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 303
    :cond_7
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    if-eq v0, v2, :cond_8

    invoke-static {}, Lcom/flyersoft/components/cloud/Gdrive;->hasLoginHistory()Z

    move-result v0

    if-nez v0, :cond_8

    .line 304
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->gdriveSplit:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 305
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->gdriveLay:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 306
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->gdriveTip:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefShelf$8;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefShelf$8;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    .line 322
    :cond_8
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->gdriveTip:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 16

    move-object/from16 v1, p0

    move-object/from16 v8, p1

    .line 528
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->backupB:Landroid/widget/Button;

    const/4 v2, 0x0

    if-ne v8, v0, :cond_0

    .line 529
    invoke-direct {v1, v2}, Lcom/flyersoft/moonreaderp/PrefShelf;->saveSettings(Z)V

    .line 530
    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->doBackup(Landroid/app/Dialog;)V

    .line 532
    :cond_0
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->restoreB:Landroid/widget/Button;

    if-ne v8, v0, :cond_1

    .line 533
    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->doRestore(Landroid/app/Dialog;)V

    .line 535
    :cond_1
    invoke-virtual {v8}, Landroid/view/View;->getId()I

    move-result v0

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmSetFtp:I

    const/16 v4, 0x8

    if-ne v0, v3, :cond_2

    .line 536
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v4, v2}, Lcom/flyersoft/moonreaderp/PrefMisc;->showCloudOptions(Landroid/content/Context;IZ)V

    .line 538
    :cond_2
    invoke-virtual {v8}, Landroid/view/View;->getId()I

    move-result v0

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmSetWebDav:I

    if-ne v0, v3, :cond_3

    .line 539
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v3, 0x6

    invoke-static {v0, v3, v2}, Lcom/flyersoft/moonreaderp/PrefMisc;->showCloudOptions(Landroid/content/Context;IZ)V

    .line 541
    :cond_3
    invoke-virtual {v8}, Landroid/view/View;->getId()I

    move-result v0

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmSetDropbox:I

    if-ne v0, v3, :cond_4

    .line 542
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v3, 0x2

    invoke-static {v0, v3, v2}, Lcom/flyersoft/moonreaderp/PrefMisc;->showCloudOptions(Landroid/content/Context;IZ)V

    .line 544
    :cond_4
    invoke-virtual {v8}, Landroid/view/View;->getId()I

    move-result v0

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmSetGdrive:I

    if-ne v0, v3, :cond_5

    .line 545
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v3, 0x4

    invoke-static {v0, v3, v2}, Lcom/flyersoft/moonreaderp/PrefMisc;->showCloudOptions(Landroid/content/Context;IZ)V

    .line 547
    :cond_5
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->dbImport:Landroid/widget/TextView;

    const/4 v9, 0x1

    if-ne v8, v0, :cond_6

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 548
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, v9}, Lcom/flyersoft/moonreaderp/ActivityMain;->doShelfImport(Z)V

    .line 550
    :cond_6
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->dbEmpty:Landroid/widget/TextView;

    const/4 v10, 0x0

    if-ne v8, v0, :cond_8

    .line 551
    invoke-static {v9}, Lcom/flyersoft/tools/A;->permissionOk(Z)Z

    move-result v0

    if-nez v0, :cond_7

    goto/16 :goto_1

    .line 553
    :cond_7
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v2, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    invoke-direct {v0, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->confirmation:I

    .line 554
    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 555
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->shelf_db_empty:I

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "?              \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefShelf$12;

    invoke-direct {v2, v1}, Lcom/flyersoft/moonreaderp/PrefShelf$12;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    const v3, 0x1040013

    .line 556
    invoke-virtual {v0, v3, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const v2, 0x1040009

    .line 577
    invoke-virtual {v0, v2, v10}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 578
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 581
    :cond_8
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->coverB:Landroid/widget/TextView;

    if-ne v8, v0, :cond_c

    .line 582
    invoke-static {v9}, Lcom/flyersoft/tools/A;->permissionOk(Z)Z

    move-result v0

    if-nez v0, :cond_9

    goto/16 :goto_1

    .line 584
    :cond_9
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->pref_shelf_sizes:I

    invoke-virtual {v0, v2, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 585
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->recentEt:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Landroid/widget/EditText;

    .line 586
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->shelfEt:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Landroid/widget/EditText;

    .line 587
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->filesEt:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 588
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->netEt:I

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Landroid/widget/EditText;

    .line 589
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->sizeEt:I

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 590
    sget v12, Lcom/flyersoft/moonreaderp/R$id;->fontBold:I

    invoke-virtual {v0, v12}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 591
    sget-boolean v13, Lcom/flyersoft/tools/A;->shelfBoldFont:Z

    invoke-virtual {v12, v13}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 593
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, ""

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v15, Lcom/flyersoft/tools/A;->recentCoverSize:I

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v7, v13}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 594
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v15, Lcom/flyersoft/tools/A;->shelfCoverSize:I

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v13}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 595
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v15, Lcom/flyersoft/tools/A;->fileCoverSize:I

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v13}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 596
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v15, Lcom/flyersoft/tools/A;->netCoverSize:I

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v5, v13}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 597
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v14, Lcom/flyersoft/tools/A;->shelfFontSize:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 598
    sget v13, Lcom/flyersoft/moonreaderp/R$id;->recentTv:I

    invoke-virtual {v0, v13}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/TextView;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    sget v10, Lcom/flyersoft/moonreaderp/R$string;->recent_list:I

    .line 599
    invoke-virtual {v15, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, " - "

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v15, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    sget v11, Lcom/flyersoft/moonreaderp/R$string;->book_cover:I

    invoke-virtual {v15, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, ":"

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 598
    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 600
    sget v13, Lcom/flyersoft/moonreaderp/R$id;->shelfTv:I

    invoke-virtual {v0, v13}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/TextView;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->my_shelf:I

    .line 601
    invoke-virtual {v15, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    sget v15, Lcom/flyersoft/moonreaderp/R$string;->book_cover:I

    invoke-virtual {v4, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 600
    invoke-virtual {v13, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 602
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->filesTv:I

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v14, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    sget v15, Lcom/flyersoft/moonreaderp/R$string;->localfiles:I

    .line 603
    invoke-virtual {v14, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v14, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    sget v15, Lcom/flyersoft/moonreaderp/R$string;->book_cover:I

    invoke-virtual {v14, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 602
    invoke-virtual {v4, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 604
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->netTv:I

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v14, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    sget v15, Lcom/flyersoft/moonreaderp/R$string;->netlibrary:I

    .line 605
    invoke-virtual {v14, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    sget v14, Lcom/flyersoft/moonreaderp/R$string;->book_cover:I

    invoke-virtual {v10, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 604
    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 607
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v4

    if-nez v4, :cond_a

    .line 608
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->tipLay:I

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v9}, Landroid/view/View;->setClickable(Z)V

    .line 609
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->tipLay:I

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    new-instance v10, Lcom/flyersoft/moonreaderp/PrefShelf$13;

    invoke-direct {v10, v1}, Lcom/flyersoft/moonreaderp/PrefShelf$13;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    invoke-virtual {v4, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 616
    :cond_a
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->tipLay:I

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/16 v10, 0x8

    invoke-virtual {v4, v10}, Landroid/view/View;->setVisibility(I)V

    .line 618
    :goto_0
    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 620
    new-instance v10, Lcom/flyersoft/components/MyDialog;

    iget-object v4, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    invoke-direct {v10, v4}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 621
    invoke-virtual {v10, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    .line 622
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->size:I

    invoke-virtual {v10, v0}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    .line 623
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->reset:I

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefShelf$14;

    invoke-direct {v4, v1}, Lcom/flyersoft/moonreaderp/PrefShelf$14;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    invoke-virtual {v10, v0, v4}, Lcom/flyersoft/components/MyDialog;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    .line 647
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 648
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefShelf$15;

    move-object v4, v2

    move-object v2, v12

    invoke-direct/range {v0 .. v7}, Lcom/flyersoft/moonreaderp/PrefShelf$15;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;Lcom/google/android/material/materialswitch/MaterialSwitch;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;)V

    const v2, 0x104000a

    invoke-virtual {v10, v2, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    :cond_b
    const/high16 v0, 0x1040000

    const/4 v2, 0x0

    .line 680
    invoke-virtual {v10, v0, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 681
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 684
    :cond_c
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->pathEdit:Landroid/widget/TextView;

    if-ne v8, v0, :cond_d

    .line 685
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 686
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v3, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    iget-object v4, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->main_folder:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->pathEdit:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/flyersoft/moonreaderp/PrefShelf$16;

    invoke-direct {v6, v1, v0}, Lcom/flyersoft/moonreaderp/PrefShelf$16;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;Ljava/lang/String;)V

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/flyersoft/moonreaderp/PrefFolderPick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V

    .line 743
    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->show()V

    .line 747
    :cond_d
    invoke-virtual {v8}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmWoody:I

    if-ne v0, v2, :cond_e

    .line 748
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 750
    invoke-direct {v1}, Lcom/flyersoft/moonreaderp/PrefShelf;->createWoodyResView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefShelf$17;

    invoke-direct {v2, v1}, Lcom/flyersoft/moonreaderp/PrefShelf$17;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    const v3, 0x104000a

    .line 751
    invoke-virtual {v0, v3, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 756
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 759
    :cond_e
    invoke-virtual {v8}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmImportFolders:I

    if-ne v0, v2, :cond_f

    .line 760
    invoke-direct {v1}, Lcom/flyersoft/moonreaderp/PrefShelf;->createItemsView()Landroid/widget/ScrollView;

    move-result-object v0

    iput-object v0, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->foldersForm:Landroid/widget/ScrollView;

    .line 761
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 762
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->Folders:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const/high16 v2, 0x41400000    # 12.0f

    .line 763
    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/flyersoft/components/MyDialog;->setPaddingLeft(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 764
    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setPaddingRight(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    iget-object v2, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->foldersForm:Landroid/widget/ScrollView;

    .line 765
    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefShelf$18;

    invoke-direct {v2, v1}, Lcom/flyersoft/moonreaderp/PrefShelf$18;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    const v3, 0x104000a

    invoke-virtual {v0, v3, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 770
    invoke-virtual {v0, v9}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_f
    :goto_1
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 57
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 58
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->initView()V

    .line 59
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelf;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const v0, 0x3f4ccccd    # 0.8f

    .line 60
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, -0x1

    .line 61
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x0

    .line 62
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->menu_options:I

    .line 63
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 64
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFuncSearchVisible(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 65
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    .line 67
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->showBackup:Z

    const/16 v0, 0x8

    if-nez p1, :cond_0

    .line 68
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->backupLay:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 69
    :cond_0
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->showBackup:Z

    if-eqz p1, :cond_2

    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    return-void

    .line 70
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->syncLay:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
