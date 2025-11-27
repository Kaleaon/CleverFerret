.class public Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;
.super Landroid/widget/BaseAdapter;
.source "PrefTheme.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefTheme;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ThemeAdapter"
.end annotation


# instance fields
.field public checked:[Z

.field onCheckedChanged:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field onItemClick:Landroid/view/View$OnClickListener;

.field onMenuClick:Landroid/view/View$OnClickListener;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefTheme;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/PrefTheme;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 297
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 392
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    .line 416
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$2;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->onCheckedChanged:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 426
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$3;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$3;-><init>(Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->onMenuClick:Landroid/view/View$OnClickListener;

    .line 298
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->getCount()I

    move-result p1

    new-array p1, p1, [Z

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->checked:[Z

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 302
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme;->pdf:Lcom/flyersoft/books/PDFReader;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/flyersoft/tools/A;->gl:Z

    if-eqz v0, :cond_0

    const/16 v0, 0x8

    return v0

    :cond_0
    const/16 v0, 0xa

    return v0

    .line 303
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getThemeList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 307
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getSelectedCount()I
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 316
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->checked:[Z

    array-length v2, v2

    if-ge v0, v2, :cond_1

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->getCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 317
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->checked:[Z

    aget-boolean v2, v2, v0

    if-eqz v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6

    const/4 p3, 0x0

    if-nez p2, :cond_0

    .line 325
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->theme_item:I

    invoke-virtual {p2, v0, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 326
    new-instance v0, Landroid/widget/AbsListView$LayoutParams;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget v1, v1, Lcom/flyersoft/moonreaderp/PrefTheme;->gridHeight:I

    const/4 v2, -0x1

    invoke-direct {v0, v2, v1}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 331
    :cond_0
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->name:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 332
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 333
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->checkbox:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    .line 334
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-boolean v3, v3, Lcom/flyersoft/moonreaderp/PrefTheme;->selectState:Z

    const/16 v4, 0x8

    const/4 v5, 0x0

    if-eqz v3, :cond_1

    const/4 v3, 0x0

    goto :goto_0

    :cond_1
    const/16 v3, 0x8

    :goto_0
    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 335
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-boolean v3, v3, Lcom/flyersoft/moonreaderp/PrefTheme;->selectState:Z

    if-eqz v3, :cond_2

    .line 336
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->checked:[Z

    aget-boolean v3, v3, p1

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 337
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setTag(Ljava/lang/Object;)V

    .line 338
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->onCheckedChanged:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 341
    :cond_2
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefTheme;->pdf:Lcom/flyersoft/books/PDFReader;

    const/4 v3, 0x1

    if-eqz v2, :cond_8

    if-eqz p1, :cond_4

    if-eq p1, v3, :cond_3

    .line 345
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {p3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 344
    :cond_3
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-virtual {p3}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object p3

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->night_theme:I

    invoke-virtual {p3, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 343
    :cond_4
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-virtual {p3}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object p3

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->day_theme:I

    invoke-virtual {p3, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 347
    :goto_1
    sget-boolean p3, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz p3, :cond_5

    const/high16 p3, 0x41900000    # 18.0f

    goto :goto_2

    :cond_5
    const/high16 p3, 0x41800000    # 16.0f

    :goto_2
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextSize(F)V

    if-eq p1, v3, :cond_7

    const/4 p3, 0x7

    if-le p1, p3, :cond_6

    goto :goto_3

    :cond_6
    const/high16 p3, -0x1000000

    goto :goto_4

    :cond_7
    :goto_3
    const p3, -0xf0f10

    .line 348
    :goto_4
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 349
    invoke-static {p1}, Lcom/radaee/pdf/Global;->getThemeColor(I)I

    move-result p3

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 350
    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_8

    .line 352
    :cond_8
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getThemeList()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/A$PageTheme;

    .line 353
    iget-object v4, v2, Lcom/flyersoft/tools/A$PageTheme;->displayName:Ljava/lang/String;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 354
    iget v4, v2, Lcom/flyersoft/tools/A$PageTheme;->pFontSize:F

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 355
    iget v4, v2, Lcom/flyersoft/tools/A$PageTheme;->pFontColor:I

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 356
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-boolean v4, v4, Lcom/flyersoft/moonreaderp/PrefTheme;->oom:Z

    if-nez v4, :cond_9

    iget-boolean v4, v2, Lcom/flyersoft/tools/A$PageTheme;->emptyFontStyle:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    if-nez v4, :cond_9

    .line 357
    :try_start_1
    iget-object v4, v2, Lcom/flyersoft/tools/A$PageTheme;->pFontName:Ljava/lang/String;

    invoke-static {v4, v5}, Lcom/flyersoft/tools/A;->getTypeFace(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_5

    .line 359
    :catch_0
    :try_start_2
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iput-boolean v3, v4, Lcom/flyersoft/moonreaderp/PrefTheme;->oom:Z

    .line 361
    :cond_9
    :goto_5
    iget-boolean v4, v2, Lcom/flyersoft/tools/A$PageTheme;->pUseBackgroundImage:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    if-eqz v4, :cond_b

    .line 363
    :try_start_3
    invoke-virtual {v2}, Lcom/flyersoft/tools/A$PageTheme;->getDrawableImage()Lcom/flyersoft/tools/A$MyDrawable;

    move-result-object v4

    if-eqz v4, :cond_a

    .line 365
    invoke-static {v4, v3, v5}, Lcom/flyersoft/tools/A;->getDrawableFromDI(Lcom/flyersoft/tools/A$MyDrawable;II)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flyersoft/tools/A;->setBackgroundDrawable(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    goto :goto_6

    .line 367
    :cond_a
    iget v2, v2, Lcom/flyersoft/tools/A$PageTheme;->pBackgroundColor:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setBackgroundColor(I)V
    :try_end_3
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_6

    .line 369
    :catch_1
    :try_start_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iput-boolean v3, v0, Lcom/flyersoft/moonreaderp/PrefTheme;->oom:Z

    goto :goto_6

    .line 372
    :cond_b
    iget v2, v2, Lcom/flyersoft/tools/A$PageTheme;->pBackgroundColor:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 373
    :goto_6
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 374
    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 375
    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_c

    const/4 v0, 0x3

    goto :goto_7

    :cond_c
    const/4 v0, 0x2

    :goto_7
    if-ge p1, v0, :cond_d

    .line 376
    invoke-virtual {v1, p3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 377
    invoke-virtual {v1, p3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_8

    .line 379
    :cond_d
    sget p3, Lcom/flyersoft/moonreaderp/R$drawable;->overflow_small:I

    invoke-virtual {v1, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 380
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->onMenuClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, p3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_8

    :catch_2
    move-exception p3

    .line 383
    invoke-static {p3}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 386
    :goto_8
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 387
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p2
.end method
