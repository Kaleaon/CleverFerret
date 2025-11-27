.class public Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.source "PrefSelectImportBooks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BookFileAdapter"
.end annotation


# instance fields
.field onCheckClick:Landroid/view/View$OnClickListener;

.field onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

.field onLayClick:Landroid/view/View$OnClickListener;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 203
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;-><init>()V

    .line 216
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    .line 320
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter$2;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->onCheckClick:Landroid/view/View$OnClickListener;

    .line 329
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter$3;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter$3;-><init>(Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->onLayClick:Landroid/view/View$OnClickListener;

    return-void
.end method

.method private getNameTag(C)Ljava/lang/String;
    .locals 2

    const/16 v0, 0x41

    if-lt p1, v0, :cond_0

    const/16 v0, 0x5a

    if-le p1, v0, :cond_1

    :cond_0
    const/16 v0, 0x61

    if-lt p1, v0, :cond_2

    const/16 v0, 0x7a

    if-gt p1, v0, :cond_2

    .line 313
    :cond_1
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 314
    :cond_2
    invoke-static {p1}, Ljava/lang/Character;->getType(C)I

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_3

    .line 315
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 317
    :cond_3
    const-string p1, "#"

    return-object p1
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 230
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->usedItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 233
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getItemCount()I
    .locals 1

    .line 225
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;)V
    .locals 18

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    .line 241
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->category:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    const/16 v4, 0x8

    .line 242
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 243
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->fileImage:I

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/views/ShelfImageView;

    .line 244
    sget v6, Lcom/flyersoft/moonreaderp/R$id;->fileName:I

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 245
    sget v7, Lcom/flyersoft/moonreaderp/R$id;->fileDate:I

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 246
    sget v8, Lcom/flyersoft/moonreaderp/R$id;->check1:I

    invoke-virtual {v2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/CheckBox;

    .line 248
    iget-object v9, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    iget-object v9, v9, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->usedItems:Ljava/util/ArrayList;

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;

    .line 249
    iget-object v10, v9, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->filename:Ljava/lang/String;

    invoke-static {v10}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 250
    iget-object v11, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    iget-object v11, v11, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->key:Ljava/lang/String;

    invoke-static {v11}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 251
    iget-object v11, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    iget-object v11, v11, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->key:Ljava/lang/String;

    invoke-static {v10, v11}, Lcom/flyersoft/moonreaderp/PrefChapters;->boldKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 252
    :cond_0
    iget-boolean v11, v9, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->broken:Z

    const-string v12, ")</font></small>"

    const-string v13, "<small><font color=\"#888888\"> ("

    if-eqz v11, :cond_1

    .line 253
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    invoke-virtual {v10}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->getContext()Landroid/content/Context;

    move-result-object v10

    sget v13, Lcom/flyersoft/moonreaderp/R$string;->invalid_file:I

    invoke-virtual {v10, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v10

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 254
    :cond_1
    iget-boolean v11, v9, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->imported:Z

    if-eqz v11, :cond_2

    .line 255
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    invoke-virtual {v10}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->getContext()Landroid/content/Context;

    move-result-object v10

    sget v13, Lcom/flyersoft/moonreaderp/R$string;->book_is_imported:I

    invoke-virtual {v10, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v10

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 257
    :cond_2
    invoke-static {v10}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v10

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 259
    :goto_0
    iget-object v6, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    invoke-virtual {v6}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->getContext()Landroid/content/Context;

    move-result-object v6

    iget-wide v10, v9, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->fileSize:J

    invoke-static {v6, v10, v11}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v6

    .line 260
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    iget v11, v11, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->sortBy:I

    const/4 v12, 0x3

    if-ne v11, v12, :cond_3

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v13, v9, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->filename:Ljava/lang/String;

    invoke-static {v13}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v13, "\n"

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    goto :goto_1

    :cond_3
    const-string v11, ""

    :goto_1
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    invoke-static {}, Ljava/text/DateFormat;->getDateInstance()Ljava/text/DateFormat;

    move-result-object v11

    iget-wide v13, v9, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->fileTime:J

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 260
    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 263
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "res:///"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v7, v9, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->isFolder:Z

    if-eqz v7, :cond_4

    sget v7, Lcom/flyersoft/moonreaderp/R$drawable;->iconfolder:I

    goto :goto_2

    :cond_4
    iget-object v7, v9, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->filename:Ljava/lang/String;

    invoke-static {v7}, Lcom/flyersoft/tools/A;->getFileIcon(Ljava/lang/String;)I

    move-result v7

    :goto_2
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/flyersoft/views/ShelfImageView;->setImageURI(Landroid/net/Uri;)V

    .line 264
    iget-boolean v5, v9, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->selected:Z

    invoke-virtual {v8, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 265
    iget-boolean v5, v9, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->broken:Z

    const/4 v6, 0x1

    xor-int/2addr v5, v6

    invoke-virtual {v8, v5}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 267
    invoke-virtual {v8, v9}, Landroid/widget/CheckBox;->setTag(Ljava/lang/Object;)V

    .line 268
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->onCheckClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v8, v5}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 269
    invoke-virtual {v2, v9}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 270
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->onLayClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 272
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    iget v5, v5, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->type:I

    const/4 v7, 0x0

    if-eqz v5, :cond_5

    .line 273
    invoke-virtual {v8, v4}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 274
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->fileLay:I

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/high16 v5, 0x41c00000    # 24.0f

    invoke-static {v5}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    invoke-virtual {v4, v5, v7, v7, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 277
    :cond_5
    iget-object v4, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    iget v4, v4, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->sortBy:I

    if-ne v4, v6, :cond_d

    const-wide/16 v4, -0x1

    if-lez v1, :cond_6

    .line 278
    iget-object v8, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->usedItems:Ljava/util/ArrayList;

    sub-int/2addr v1, v6

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;

    iget-wide v10, v1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->day:J

    goto :goto_3

    :cond_6
    move-wide v10, v4

    .line 279
    :goto_3
    iget-wide v8, v9, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->day:J

    const-wide/16 v12, 0x1e

    const-wide/16 v14, 0x6

    const-wide/16 v16, 0x0

    cmp-long v1, v10, v4

    if-eqz v1, :cond_9

    cmp-long v1, v10, v16

    if-nez v1, :cond_7

    cmp-long v1, v8, v16

    if-gtz v1, :cond_9

    :cond_7
    cmp-long v1, v10, v14

    if-gtz v1, :cond_8

    cmp-long v1, v8, v14

    if-gtz v1, :cond_9

    :cond_8
    cmp-long v1, v10, v12

    if-gtz v1, :cond_11

    cmp-long v1, v8, v12

    if-lez v1, :cond_11

    .line 285
    :cond_9
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setVisibility(I)V

    cmp-long v1, v8, v16

    if-nez v1, :cond_a

    .line 286
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->today:I

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    :cond_a
    cmp-long v1, v8, v14

    if-gtz v1, :cond_b

    .line 287
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->thisweek:I

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    :cond_b
    cmp-long v1, v8, v12

    if-gtz v1, :cond_c

    .line 288
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->thismonth:I

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    .line 289
    :cond_c
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->alltime:I

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 286
    :goto_4
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 291
    :cond_d
    iget-object v4, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    iget v4, v4, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->sortBy:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_f

    .line 292
    iget-object v4, v9, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->filename:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v1, :cond_e

    .line 293
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->usedItems:Ljava/util/ArrayList;

    sub-int/2addr v1, v6

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->filename:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_11

    .line 294
    :cond_e
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 295
    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 297
    :cond_f
    iget-object v4, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    iget v4, v4, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->sortBy:I

    if-ne v4, v12, :cond_11

    .line 298
    iget-object v4, v9, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->onlyFilename:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-direct {v0, v4}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->getNameTag(C)Ljava/lang/String;

    move-result-object v4

    if-eqz v1, :cond_10

    .line 299
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->usedItems:Ljava/util/ArrayList;

    sub-int/2addr v1, v6

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->onlyFilename:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-direct {v0, v1}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->getNameTag(C)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_11

    .line 300
    :cond_10
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 301
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 305
    :cond_11
    :goto_5
    invoke-static {v2}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 308
    invoke-static {}, Lcom/flyersoft/tools/C;->mainBackColor()I

    move-result v1

    invoke-static {v1}, Lcom/flyersoft/tools/C;->getDividerColor(I)I

    move-result v1

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setBackgroundColor(I)V

    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 213
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-super {p0, p2, p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    .line 207
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->import_file_row:I

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 208
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method
