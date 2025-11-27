.class public Lcom/flyersoft/moonreaderp/PrefImageBrowser1;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefImageBrowser1.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;,
        Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;
    }
.end annotation


# instance fields
.field albumB:Landroid/widget/TextView;

.field done:Z

.field downloadB:Landroid/widget/TextView;

.field gridHeight:I

.field gridWidth:I

.field imageCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/flyersoft/tools/A$MyDrawable;",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field imageFind:Landroid/view/View;

.field imageGrid:Landroid/widget/GridView;

.field imageSize:I

.field images:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/A$MyDrawable;",
            ">;"
        }
    .end annotation
.end field

.field onSaveImage:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;

.field outerPath:Ljava/lang/String;

.field pathEdit:Landroid/widget/TextView;

.field selected:Ljava/lang/String;

.field tile_display:Z

.field title:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$mdoFindImages(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->doFindImages()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mfindImages(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->findImages()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowOverflowMenu(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;Landroid/view/View;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->showOverflowMenu(Landroid/view/View;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;Ljava/util/ArrayList;ZLjava/lang/String;IIILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/A$MyDrawable;",
            ">;Z",
            "Ljava/lang/String;",
            "III",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 49
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->image_brower1:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    .line 193
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->imageCache:Ljava/util/HashMap;

    .line 51
    sget-boolean p1, Lcom/flyersoft/tools/A;->isTablet:Z

    const/16 v0, 0x14

    if-eqz p1, :cond_0

    const/16 p1, 0x14

    goto :goto_0

    :cond_0
    const/16 p1, 0xf

    :goto_0
    mul-int p7, p7, p1

    div-int/lit8 p7, p7, 0xa

    mul-int/lit8 p8, p8, 0x14

    .line 52
    div-int/lit8 p8, p8, 0xa

    .line 54
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->onSaveImage:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;

    .line 55
    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    .line 56
    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->outerPath:Ljava/lang/String;

    .line 57
    iput p6, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->imageSize:I

    .line 58
    iput p7, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->gridWidth:I

    .line 59
    iput p8, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->gridHeight:I

    .line 60
    iput-object p9, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->title:Ljava/lang/String;

    .line 61
    iput-object p10, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->selected:Ljava/lang/String;

    .line 62
    iput-boolean p4, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->tile_display:Z

    return-void
.end method

.method private doFindImages()V
    .locals 5

    .line 184
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->res:Landroid/content/Context;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->res:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->images_folder:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->pathEdit:Landroid/widget/TextView;

    .line 185
    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$4;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$4;-><init>(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;)V

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/flyersoft/moonreaderp/PrefFolderPick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V

    const/4 v1, 0x1

    .line 190
    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->setImagesOnly(Z)Lcom/flyersoft/moonreaderp/PrefFolderPick;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->show()V

    return-void
.end method

.method private findImages()V
    .locals 5

    .line 309
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->pathEdit:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 310
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_0

    .line 311
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v3

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 313
    :cond_0
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 314
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->res:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->folder_not_exists:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 315
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->pathEdit:Landroid/widget/TextView;

    sget-object v1, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 319
    :cond_1
    new-array v1, v3, [Ljava/lang/Object;

    const-string v4, "##reset images"

    aput-object v4, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 320
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v3

    :goto_0
    if-ltz v1, :cond_3

    .line 321
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/A$MyDrawable;

    iget v2, v2, Lcom/flyersoft/tools/A$MyDrawable;->from:I

    if-nez v2, :cond_2

    .line 322
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_2
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 323
    :cond_3
    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->outerPath:Ljava/lang/String;

    .line 325
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 326
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 327
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->outerPath:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/flyersoft/tools/A;->addImagesFromOuterFolder(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 328
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 329
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->imageGrid:Landroid/widget/GridView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->res:Landroid/content/Context;

    invoke-direct {v1, p0, v2}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method private getSelected()I
    .locals 4

    .line 118
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->selected:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    .line 120
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 121
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->selected:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/A$MyDrawable;

    iget-object v3, v3, Lcom/flyersoft/tools/A$MyDrawable;->filename:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    return v0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 123
    :goto_1
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_4

    .line 124
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->selected:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/A$MyDrawable;

    iget-object v3, v3, Lcom/flyersoft/tools/A$MyDrawable;->imageName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    return v0

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4
    return v1
.end method

.method private initView()V
    .locals 5

    .line 79
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ibFind:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->imageFind:Landroid/view/View;

    .line 80
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ibFolderEdit:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->pathEdit:Landroid/widget/TextView;

    .line 82
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->outerPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    sget v0, Lcom/flyersoft/tools/A;->cornerRadius:I

    if-lez v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->footerSub:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->cornerRadius:I

    div-int/lit8 v1, v1, 0x4

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    sget v4, Lcom/flyersoft/tools/A;->cornerRadius:I

    div-int/lit8 v4, v4, 0x4

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-virtual {v0, v1, v3, v4, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->pathEdit:Landroid/widget/TextView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$1;-><init>(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->gridSv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/GridView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->imageGrid:Landroid/widget/GridView;

    .line 97
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->gridWidth:I

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setColumnWidth(I)V

    .line 98
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->imageGrid:Landroid/widget/GridView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->res:Landroid/content/Context;

    invoke-direct {v1, p0, v2}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 99
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->imageGrid:Landroid/widget/GridView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$2;-><init>(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;)V

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 108
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->downloadB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->downloadB:Landroid/widget/TextView;

    .line 109
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->albumB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->albumB:Landroid/widget/TextView;

    .line 110
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->downloadB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->albumB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 113
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 114
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->imageGrid:Landroid/widget/GridView;

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->getSelected()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setSelection(I)V

    :cond_1
    return-void
.end method

.method private showOverflowMenu(Landroid/view/View;I)V
    .locals 6

    .line 130
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    move-object v5, p2

    check-cast v5, Lcom/flyersoft/tools/A$MyDrawable;

    .line 131
    iget p2, v5, Lcom/flyersoft/tools/A$MyDrawable;->from:I

    if-nez p2, :cond_0

    .line 132
    iget-object p2, v5, Lcom/flyersoft/tools/A$MyDrawable;->filename:Ljava/lang/String;

    invoke-static {p2}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 133
    iget-object v4, v5, Lcom/flyersoft/tools/A$MyDrawable;->filename:Ljava/lang/String;

    .line 134
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$array;->operations:I

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    .line 136
    new-instance p2, Lcom/flyersoft/components/MyMenu;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object p2

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;-><init>(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/tools/A$MyDrawable;)V

    invoke-virtual {p2, v3, v0}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p2

    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->root:Landroid/view/View;

    .line 169
    invoke-virtual {p2, v0}, Lcom/flyersoft/components/MyMenu;->setBuilderAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object p2

    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->root:Landroid/view/View;

    invoke-static {v0}, Lcom/flyersoft/components/MyMenu;->getXoffInDialog(Landroid/view/View;)I

    move-result v0

    invoke-static {}, Lcom/flyersoft/components/MyMenu;->getYoffInDialog()I

    move-result v2

    invoke-virtual {p2, p1, v0, v2}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;II)V

    return-void

    :cond_0
    move-object v1, p0

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 3

    .line 177
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->done:Z

    if-nez v0, :cond_0

    .line 178
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->onSaveImage:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->outerPath:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;->onGetImageFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->imageCache:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 180
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 12

    .line 273
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->imageFind:Landroid/view/View;

    if-ne p1, v0, :cond_0

    .line 274
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->doFindImages()V

    .line 276
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->downloadB:Landroid/widget/TextView;

    const-string v1, ".png"

    const-string v2, "/"

    if-ne p1, v0, :cond_1

    .line 278
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 279
    new-instance v5, Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->getContext()Landroid/content/Context;

    move-result-object v6

    new-instance v7, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$5;

    invoke-direct {v7, p0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$5;-><init>(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;)V

    const/4 v10, 0x1

    const/4 v11, 0x0

    const-string v9, "Background images"

    invoke-direct/range {v5 .. v11}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefDownloadCover$OnSaveImage;Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 289
    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->show()V

    .line 292
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->albumB:Landroid/widget/TextView;

    if-ne p1, v0, :cond_2

    .line 293
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 294
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$6;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$6;-><init>(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;)V

    const/4 v2, 0x1

    invoke-static {v0, p1, v2, v1}, Lcom/flyersoft/moonreaderp/SelectImageAct;->selectImage(Landroid/content/Context;Ljava/lang/String;ZLcom/flyersoft/tools/T$FileResultOK;)V

    :cond_2
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 67
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 68
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->initView()V

    .line 69
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const v0, 0x3f4ccccd    # 0.8f

    .line 70
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, -0x1

    .line 71
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x0

    .line 72
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 73
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHideExit(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->title:Ljava/lang/String;

    .line 74
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 75
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    return-void
.end method
