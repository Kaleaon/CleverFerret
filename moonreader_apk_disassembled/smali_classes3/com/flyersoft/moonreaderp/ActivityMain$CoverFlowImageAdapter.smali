.class public Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;
.super Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectLvAdapter;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CoverFlowImageAdapter"
.end annotation


# instance fields
.field bg:Landroid/graphics/drawable/NinePatchDrawable;

.field private bitmapMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field

.field public checked:[Z

.field private context:Landroid/content/Context;

.field private height:F

.field leftShadow:Landroid/graphics/Bitmap;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field private width:F


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/content/Context;II)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 13365
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    .line 13366
    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectLvAdapter;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    const/4 v0, 0x0

    .line 13428
    iput v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->width:F

    .line 13429
    iput v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->height:F

    .line 13430
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->bitmapMap:Ljava/util/Map;

    .line 13473
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->list_bookshadow_woody:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/NinePatchDrawable;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->bg:Landroid/graphics/drawable/NinePatchDrawable;

    .line 13474
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->list_book_thickness:I

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->leftShadow:Landroid/graphics/Bitmap;

    .line 13367
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->context:Landroid/content/Context;

    int-to-float p2, p3

    .line 13368
    iput p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->width:F

    int-to-float p2, p4

    .line 13369
    iput p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->height:F

    .line 13370
    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Z

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->checked:[Z

    return-void
.end method


# virtual methods
.method public clearChecked()V
    .locals 2

    .line 13405
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->checked:[Z

    .line 13406
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getShelfBooksAdapter()Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;)V

    return-void
.end method

.method protected createBitmap(Lcom/flyersoft/tools/BookDb$BookInfo;IZ)Landroid/graphics/Bitmap;
    .locals 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 13478
    const-string v2, "/"

    const/4 v3, 0x0

    .line 13479
    :try_start_0
    sget v4, Lcom/flyersoft/tools/A;->shelfCoverSize:I

    int-to-float v4, v4

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    mul-int/lit8 v4, v4, 0x64

    div-int/lit8 v4, v4, 0x50

    .line 13480
    sget-boolean v5, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v5, :cond_0

    mul-int/lit16 v4, v4, 0x82

    .line 13481
    div-int/lit8 v4, v4, 0x64

    :cond_0
    move v7, v4

    mul-int/lit8 v4, v7, 0x64

    .line 13482
    div-int/lit8 v8, v4, 0x46

    .line 13484
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v7, v8, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    const/4 v5, 0x0

    .line 13485
    invoke-virtual {v4, v5}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 13486
    new-instance v6, Landroid/graphics/Canvas;

    invoke-direct {v6, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 13487
    new-instance v13, Landroid/graphics/Rect;

    invoke-direct {v13}, Landroid/graphics/Rect;-><init>()V

    .line 13488
    iget-object v9, v0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->bg:Landroid/graphics/drawable/NinePatchDrawable;

    invoke-virtual {v9, v5, v5, v7, v8}, Landroid/graphics/drawable/NinePatchDrawable;->setBounds(IIII)V

    .line 13489
    iget-object v9, v0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->bg:Landroid/graphics/drawable/NinePatchDrawable;

    invoke-virtual {v9, v6}, Landroid/graphics/drawable/NinePatchDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 13490
    iget-object v9, v0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->bg:Landroid/graphics/drawable/NinePatchDrawable;

    invoke-virtual {v9, v13}, Landroid/graphics/drawable/NinePatchDrawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 13492
    invoke-virtual {v1}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 13493
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v2, v1, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->getGroupCovers(Lcom/flyersoft/tools/BookDb$BookInfo;Landroid/view/View;)Ljava/util/ArrayList;

    move-result-object v1

    .line 13494
    iget v9, v13, Landroid/graphics/Rect;->left:I

    iget v10, v13, Landroid/graphics/Rect;->top:I

    iget v11, v13, Landroid/graphics/Rect;->right:I

    iget v12, v13, Landroid/graphics/Rect;->bottom:I

    move-object v5, v6

    move-object v6, v1

    invoke-static/range {v5 .. v12}, Lcom/flyersoft/views/ShelfImageView;->drawGridCovers(Landroid/graphics/Canvas;Ljava/util/ArrayList;IIIIII)V

    move-object v6, v5

    goto/16 :goto_2

    .line 13496
    :cond_1
    iget-object v9, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v9}, Lcom/flyersoft/tools/A;->getShelfCoverFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 13497
    invoke-virtual {v9, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    move-object v1, v3

    goto :goto_0

    :cond_2
    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    .line 13499
    :goto_0
    invoke-virtual {v9, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 13500
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v5, v5}, Lcom/flyersoft/tools/A;->getFileDrawable(Ljava/io/File;II)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    goto :goto_1

    .line 13502
    :cond_3
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-virtual {v2, v9}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    :goto_1
    if-nez v2, :cond_4

    .line 13505
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v9, Lcom/flyersoft/moonreaderp/R$drawable;->flow_base:I

    invoke-virtual {v2, v9}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 13506
    :cond_4
    iget v9, v13, Landroid/graphics/Rect;->left:I

    iget v10, v13, Landroid/graphics/Rect;->top:I

    iget v11, v13, Landroid/graphics/Rect;->right:I

    sub-int v11, v7, v11

    iget v12, v13, Landroid/graphics/Rect;->bottom:I

    sub-int v12, v8, v12

    invoke-virtual {v2, v9, v10, v11, v12}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 13507
    invoke-virtual {v2, v6}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 13508
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->leftShadow:Landroid/graphics/Bitmap;

    new-instance v9, Landroid/graphics/Rect;

    iget-object v10, v0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->leftShadow:Landroid/graphics/Bitmap;

    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    iget-object v11, v0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->leftShadow:Landroid/graphics/Bitmap;

    invoke-virtual {v11}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    invoke-direct {v9, v5, v5, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v5, Landroid/graphics/Rect;

    iget v10, v13, Landroid/graphics/Rect;->left:I

    iget v11, v13, Landroid/graphics/Rect;->top:I

    iget v12, v13, Landroid/graphics/Rect;->right:I

    sub-int v12, v7, v12

    div-int/lit8 v12, v12, 0x4

    iget v14, v13, Landroid/graphics/Rect;->bottom:I

    sub-int v14, v8, v14

    invoke-direct {v5, v10, v11, v12, v14}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v6, v2, v9, v5, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    if-eqz v1, :cond_5

    .line 13512
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v9, v1

    invoke-static/range {v5 .. v11}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mdrawBookTitlteToCanvas(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/graphics/Canvas;IILjava/lang/String;FF)V

    :cond_5
    :goto_2
    if-eqz p3, :cond_6

    .line 13517
    new-instance v14, Landroid/graphics/Paint;

    invoke-direct {v14}, Landroid/graphics/Paint;-><init>()V

    const v1, -0x777a2c11

    .line 13518
    invoke-virtual {v14, v1}, Landroid/graphics/Paint;->setColor(I)V

    const/high16 v1, 0x40a00000    # 5.0f

    .line 13519
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    iget v2, v13, Landroid/graphics/Rect;->left:I

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    int-to-float v10, v1

    const/high16 v1, 0x41100000    # 9.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    int-to-float v11, v1

    iget v1, v13, Landroid/graphics/Rect;->right:I

    sub-int/2addr v7, v1

    int-to-float v12, v7

    int-to-float v13, v8

    move-object v9, v6

    invoke-virtual/range {v9 .. v14}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 13522
    :cond_6
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v12

    .line 13523
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 13524
    new-instance v14, Landroid/graphics/Matrix;

    invoke-direct {v14}, Landroid/graphics/Matrix;-><init>()V

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v5, -0x40800000    # -1.0f

    .line 13525
    invoke-virtual {v14, v2, v5}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 13526
    div-int/lit8 v11, v1, 0x2

    div-int/lit8 v13, v1, 0x2

    const/4 v15, 0x0

    const/4 v10, 0x0

    move-object v9, v4

    invoke-static/range {v9 .. v15}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 13527
    div-int/lit8 v4, v1, 0x2

    add-int/2addr v4, v1

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v12, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 13528
    new-instance v13, Landroid/graphics/Canvas;

    invoke-direct {v13, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/4 v5, 0x0

    .line 13529
    invoke-virtual {v13, v9, v5, v5, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 13530
    new-instance v18, Landroid/graphics/Paint;

    invoke-direct/range {v18 .. v18}, Landroid/graphics/Paint;-><init>()V

    int-to-float v15, v1

    int-to-float v6, v12

    int-to-float v1, v1

    const/4 v14, 0x0

    move/from16 v17, v1

    move/from16 v16, v6

    .line 13531
    invoke-virtual/range {v13 .. v18}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 13532
    invoke-virtual {v13, v2, v5, v1, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 13533
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 13534
    new-instance v17, Landroid/graphics/LinearGradient;

    invoke-virtual {v9}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    sget-object v24, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/16 v18, 0x0

    const/16 v20, 0x0

    const v22, 0x70ffffff

    const v23, 0xffffff

    move/from16 v19, v2

    move/from16 v21, v5

    invoke-direct/range {v17 .. v24}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    move-object/from16 v2, v17

    .line 13536
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 13537
    new-instance v2, Landroid/graphics/PorterDuffXfermode;

    sget-object v5, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v2, v5}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 13538
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const/4 v14, 0x0

    move-object/from16 v18, v1

    move/from16 v17, v2

    invoke-virtual/range {v13 .. v18}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    return-object v4

    .line 13544
    :catch_0
    :try_start_1
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$drawable;->list_bookshadow_woody:I

    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1

    return-object v1

    :catch_1
    return-object v3
.end method

.method public declared-synchronized getCount()I
    .locals 1

    monitor-enter p0

    .line 13470
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public getFirstSelected()I
    .locals 3

    const/4 v0, 0x0

    .line 13391
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->checked:[Z

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 13392
    aget-boolean v1, v1, v0

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method public getItem(I)Landroid/graphics/Bitmap;
    .locals 3

    .line 13433
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-le p1, v0, :cond_0

    .line 13434
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    sub-int/2addr p1, v1

    .line 13435
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 13436
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->checked:[Z

    aget-boolean v2, v2, p1

    if-eqz v2, :cond_1

    .line 13437
    invoke-virtual {p0, v0, p1, v1}, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->createBitmap(Lcom/flyersoft/tools/BookDb$BookInfo;IZ)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1

    .line 13439
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->bitmapMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_2

    .line 13442
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_3

    const/4 v1, 0x0

    .line 13445
    invoke-virtual {p0, v0, p1, v1}, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->createBitmap(Lcom/flyersoft/tools/BookDb$BookInfo;IZ)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 13446
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->bitmapMap:Ljava/util/Map;

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p1

    :cond_3
    return-object v1
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 13361
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->getItem(I)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getSelectedBooks()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;"
        }
    .end annotation

    .line 13374
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 13375
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 13376
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->checked:[Z

    array-length v3, v2

    if-ge v1, v3, :cond_0

    aget-boolean v2, v2, v1

    if-eqz v2, :cond_0

    .line 13377
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public getSelectedCount()I
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 13384
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->checked:[Z

    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 13385
    aget-boolean v2, v2, v0

    if-eqz v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public bridge synthetic getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 13361
    invoke-virtual {p0, p1, p2, p3}, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/widget/ImageView;

    move-result-object p1

    return-object p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/widget/ImageView;
    .locals 2

    if-nez p2, :cond_0

    .line 13458
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    .line 13459
    new-instance p3, Landroid/widget/ImageView;

    invoke-direct {p3, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 13460
    new-instance p2, Landroid/widget/Gallery$LayoutParams;

    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->width:F

    float-to-int v0, v0

    iget v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->height:F

    float-to-int v1, v1

    invoke-direct {p2, v0, v1}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    invoke-virtual {p3, p2}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    .line 13462
    :cond_0
    move-object p3, p2

    check-cast p3, Landroid/widget/ImageView;

    :goto_0
    const/16 p2, 0x64

    .line 13464
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p3, p2}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 13465
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->getItem(I)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-object p3
.end method

.method public inverseChecked(I)V
    .locals 2

    .line 13410
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->checked:[Z

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->validIndex(I[Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 13412
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->checked:[Z

    aget-boolean v1, v0, p1

    xor-int/lit8 v1, v1, 0x1

    aput-boolean v1, v0, p1

    .line 13413
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetActionItemsVisible(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 13414
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->getSelectedCount()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 13415
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->getSelectedCount()I

    move-result p1

    if-nez p1, :cond_1

    .line 13416
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceHideSelectState(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    .line 13417
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getShelfBooksAdapter()Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;)V

    return-void
.end method

.method public selectAll()V
    .locals 3

    const/4 v0, 0x0

    .line 13398
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->checked:[Z

    array-length v2, v1

    if-ge v0, v2, :cond_0

    const/4 v2, 0x1

    .line 13399
    aput-boolean v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 13400
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->checked:[Z

    array-length v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 13401
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getShelfBooksAdapter()Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;)V

    return-void
.end method

.method public setChecked(I)V
    .locals 2

    .line 13421
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->checked:[Z

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->validIndex(I[Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 13423
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->checked:[Z

    const/4 v1, 0x1

    aput-boolean v1, v0, p1

    .line 13424
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->getSelectedCount()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 13425
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$CoverFlowImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getShelfBooksAdapter()Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;)V

    return-void
.end method
