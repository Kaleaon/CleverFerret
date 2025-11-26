.class public Lcom/flyersoft/views/ShelfImageView;
.super Lcom/facebook/drawee/view/SimpleDraweeView;
.source "ShelfImageView.java"


# static fields
.field public static imageCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field bg:Landroid/graphics/drawable/NinePatchDrawable;

.field private cloudIcon:I

.field public drawPutOnTop:Z

.field public forceHasShadow:Z

.field public forceNoShadow:Z

.field public gridCovers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field public isShelfCover:Z

.field leftShadow:Landroid/graphics/Bitmap;

.field pr:Landroid/graphics/Rect;

.field public shadowRes:I

.field private urlDrawable:Landroid/graphics/drawable/Drawable;


# direct methods
.method static bridge synthetic -$$Nest$fputurlDrawable(Lcom/flyersoft/views/ShelfImageView;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/views/ShelfImageView;->urlDrawable:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 204
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/flyersoft/views/ShelfImageView;->imageCache:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 29
    invoke-direct {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;-><init>(Landroid/content/Context;)V

    .line 30
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->isInEditMode()Z

    move-result p1

    if-nez p1, :cond_0

    .line 31
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object p1

    check-cast p1, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    sget-object v0, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_XY:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {p1, v0}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setActualImageScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    :cond_0
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 35
    invoke-direct {p0, p1, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->isInEditMode()Z

    move-result p1

    if-nez p1, :cond_0

    .line 37
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object p1

    check-cast p1, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    sget-object p2, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_XY:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {p1, p2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setActualImageScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    :cond_0
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 41
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/drawee/view/SimpleDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->isInEditMode()Z

    move-result p1

    if-nez p1, :cond_0

    .line 43
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object p1

    check-cast p1, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    sget-object p2, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_XY:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {p1, p2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setActualImageScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    :cond_0
    return-void
.end method

.method private drawCloudIcon(Landroid/graphics/Canvas;II)V
    .locals 6

    .line 188
    iget p3, p0, Lcom/flyersoft/views/ShelfImageView;->cloudIcon:I

    if-nez p3, :cond_0

    return-void

    .line 190
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getWidth()I

    move-result p3

    .line 191
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getHeight()I

    move-result v0

    .line 192
    div-int/lit8 v1, p3, 0x3

    .line 193
    div-int/lit8 v2, v1, 0x14

    .line 194
    div-int/lit8 v3, v1, 0xa

    .line 195
    sget-boolean v4, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v4, :cond_1

    sget v4, Lcom/flyersoft/tools/A;->shelfStyle:I

    if-nez v4, :cond_1

    neg-int v3, v1

    .line 196
    div-int/lit8 v3, v3, 0xa

    .line 197
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget v5, p0, Lcom/flyersoft/views/ShelfImageView;->cloudIcon:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    sub-int/2addr p3, p2

    sub-int p2, p3, v1

    add-int/2addr p2, v2

    sub-int v1, v0, v1

    add-int/2addr v1, v3

    add-int/2addr p3, v2

    add-int/2addr v0, v3

    .line 198
    invoke-virtual {v4, p2, v1, p3, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 199
    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public static drawGridCovers(Landroid/graphics/Canvas;Ljava/util/ArrayList;IIIIII)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Ljava/util/ArrayList<",
            "Landroid/graphics/drawable/Drawable;",
            ">;IIIIII)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v6, p1

    move/from16 v7, p4

    move/from16 v8, p5

    .line 113
    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    const/4 v2, 0x0

    const/4 v9, 0x2

    if-eqz v1, :cond_0

    sget v1, Lcom/flyersoft/tools/A;->shelfStyle:I

    if-ge v1, v9, :cond_0

    const v1, 0x3f8ccccd    # 1.1f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->dr(F)I

    move-result v1

    move v10, v1

    goto :goto_0

    :cond_0
    const/4 v10, 0x0

    :goto_0
    const/high16 v1, 0x40c00000    # 6.0f

    .line 114
    invoke-static {v1}, Lcom/flyersoft/tools/A;->dr(F)I

    move-result v11

    const v1, 0x410e6666    # 8.9f

    .line 115
    invoke-static {v1}, Lcom/flyersoft/tools/A;->dr(F)I

    move-result v12

    sub-int v1, p2, v7

    sub-int v1, v1, p6

    mul-int/lit8 v3, v11, 0x3

    sub-int/2addr v1, v3

    .line 116
    div-int/lit8 v13, v1, 0x2

    sub-int v1, p3, v8

    sub-int v1, v1, p7

    mul-int/lit8 v3, v12, 0x3

    sub-int/2addr v1, v3

    .line 117
    div-int/lit8 v14, v1, 0x2

    .line 119
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 120
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/Drawable;

    new-instance v3, Landroid/graphics/Rect;

    sub-int v4, p2, p6

    sub-int v5, p3, p7

    invoke-direct {v3, v7, v8, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v1, v3}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 121
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 124
    :cond_1
    new-instance v5, Landroid/graphics/Paint;

    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    const v1, -0x55aaaaab

    .line 125
    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 126
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v1, 0x3f800000    # 1.0f

    .line 127
    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 129
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v15, 0x1

    if-le v1, v15, :cond_2

    invoke-virtual {v6, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 130
    new-instance v1, Landroid/graphics/Rect;

    add-int v2, v7, v11

    add-int v3, v2, v10

    add-int v4, v8, v12

    add-int/2addr v2, v13

    add-int/2addr v2, v10

    add-int v9, v4, v14

    invoke-direct {v1, v3, v4, v2, v9}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 131
    invoke-virtual {v6, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 132
    invoke-virtual {v6, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 133
    iget v2, v1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v2, v15

    int-to-float v2, v2

    iget v3, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v15

    int-to-float v3, v3

    iget v4, v1, Landroid/graphics/Rect;->right:I

    add-int/2addr v4, v15

    int-to-float v4, v4

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v1, v15

    int-to-float v1, v1

    move/from16 v16, v4

    move v4, v1

    move v1, v2

    move v2, v3

    move/from16 v3, v16

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 135
    :cond_2
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x2

    if-le v1, v2, :cond_3

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 136
    new-instance v1, Landroid/graphics/Rect;

    add-int v2, v7, v11

    add-int/2addr v2, v13

    add-int/2addr v2, v11

    add-int v3, v2, v10

    add-int v4, v8, v12

    add-int/2addr v2, v13

    add-int/2addr v2, v10

    add-int v9, v4, v14

    invoke-direct {v1, v3, v4, v2, v9}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v2, 0x2

    .line 137
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 138
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 139
    iget v2, v1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v2, v15

    int-to-float v2, v2

    iget v3, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v15

    int-to-float v3, v3

    iget v4, v1, Landroid/graphics/Rect;->right:I

    add-int/2addr v4, v15

    int-to-float v4, v4

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v1, v15

    int-to-float v1, v1

    move/from16 v16, v4

    move v4, v1

    move v1, v2

    move v2, v3

    move/from16 v3, v16

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 141
    :cond_3
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x3

    if-le v1, v2, :cond_4

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 142
    new-instance v1, Landroid/graphics/Rect;

    add-int v3, v7, v11

    add-int v4, v3, v10

    add-int v9, v8, v12

    add-int/2addr v9, v14

    add-int/2addr v9, v12

    add-int/2addr v3, v13

    add-int/2addr v3, v10

    const/16 p2, 0x1

    add-int v15, v9, v14

    invoke-direct {v1, v4, v9, v3, v15}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 143
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 144
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 145
    iget v2, v1, Landroid/graphics/Rect;->left:I

    add-int/lit8 v2, v2, -0x1

    int-to-float v2, v2

    iget v3, v1, Landroid/graphics/Rect;->top:I

    add-int/lit8 v3, v3, -0x1

    int-to-float v3, v3

    iget v4, v1, Landroid/graphics/Rect;->right:I

    add-int/lit8 v4, v4, 0x1

    int-to-float v4, v4

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v1, v1, 0x1

    int-to-float v1, v1

    move/from16 v16, v4

    move v4, v1

    move v1, v2

    move v2, v3

    move/from16 v3, v16

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_1

    :cond_4
    const/16 p2, 0x1

    .line 147
    :goto_1
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x4

    if-le v1, v2, :cond_5

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 148
    new-instance v1, Landroid/graphics/Rect;

    add-int v3, v7, v11

    add-int/2addr v3, v13

    add-int/2addr v3, v11

    add-int v4, v3, v10

    add-int v7, v8, v12

    add-int/2addr v7, v14

    add-int/2addr v7, v12

    add-int/2addr v3, v13

    add-int/2addr v3, v10

    add-int/2addr v14, v7

    invoke-direct {v1, v4, v7, v3, v14}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 149
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 150
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 151
    iget v2, v1, Landroid/graphics/Rect;->left:I

    add-int/lit8 v2, v2, -0x1

    int-to-float v2, v2

    iget v3, v1, Landroid/graphics/Rect;->top:I

    add-int/lit8 v3, v3, -0x1

    int-to-float v3, v3

    iget v4, v1, Landroid/graphics/Rect;->right:I

    add-int/lit8 v4, v4, 0x1

    int-to-float v4, v4

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v1, v1, 0x1

    int-to-float v1, v1

    move-object/from16 p1, v0

    move/from16 p5, v1

    move/from16 p2, v2

    move/from16 p3, v3

    move/from16 p4, v4

    move-object/from16 p6, v5

    invoke-virtual/range {p1 .. p6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_5
    return-void
.end method

.method private drawPutOnTop(Landroid/graphics/Canvas;II)V
    .locals 7

    .line 158
    iget-boolean v0, p0, Lcom/flyersoft/views/ShelfImageView;->drawPutOnTop:Z

    if-nez v0, :cond_0

    return-void

    .line 160
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/C;->getTopBarColor()I

    move-result v0

    const/16 v1, -0x50

    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v0

    .line 161
    new-instance v6, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v6, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 162
    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 163
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getWidth()I

    move-result v0

    .line 164
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getHeight()I

    move-result v1

    .line 165
    div-int/lit8 v2, v0, 0x8

    int-to-float v2, v2

    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 166
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 167
    invoke-virtual {p1, p2, p3, v0, v1}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    int-to-float p2, p2

    int-to-float p3, p3

    .line 168
    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->translate(FF)V

    neg-int p2, v0

    .line 169
    div-int/lit8 p2, p2, 0x5

    int-to-float v2, p2

    div-int/lit8 v0, v0, 0x3

    int-to-float v3, v0

    move v4, v3

    move v5, v2

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 170
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method private drawShadow()Z
    .locals 2

    .line 67
    iget-boolean v0, p0, Lcom/flyersoft/views/ShelfImageView;->forceNoShadow:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 69
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/views/ShelfImageView;->forceHasShadow:Z

    if-nez v0, :cond_2

    sget-boolean v0, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-nez v0, :cond_2

    sget-boolean v0, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/flyersoft/views/ShelfImageView;->isShelfCover:Z

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    return v1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method private drawUrlDrawableInstead(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;)V
    .locals 5

    .line 208
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    .line 209
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p2

    .line 210
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getWidth()I

    move-result v1

    .line 211
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    if-le v0, p2, :cond_0

    .line 213
    iget-object v4, p0, Lcom/flyersoft/views/ShelfImageView;->urlDrawable:Landroid/graphics/drawable/Drawable;

    mul-int p2, p2, v2

    div-int/2addr p2, v0

    sub-int v0, v2, p2

    div-int/lit8 v0, v0, 0x2

    div-int/lit8 v2, v2, 0x2

    div-int/lit8 p2, p2, 0x2

    add-int/2addr v2, p2

    invoke-virtual {v4, v3, v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_0

    .line 215
    :cond_0
    iget-object v4, p0, Lcom/flyersoft/views/ShelfImageView;->urlDrawable:Landroid/graphics/drawable/Drawable;

    mul-int v0, v0, v1

    div-int/2addr v0, p2

    sub-int p2, v1, v0

    div-int/lit8 p2, p2, 0x2

    div-int/lit8 v1, v1, 0x2

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v1, v0

    invoke-virtual {v4, p2, v3, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 216
    :goto_0
    iget-object p2, p0, Lcom/flyersoft/views/ShelfImageView;->urlDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method private superOnDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 103
    iget-object v0, p0, Lcom/flyersoft/views/ShelfImageView;->gridCovers:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 104
    iget-object v2, p0, Lcom/flyersoft/views/ShelfImageView;->gridCovers:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getHeight()I

    move-result v4

    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getPaddingLeft()I

    move-result v5

    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getPaddingTop()I

    move-result v6

    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getPaddingRight()I

    move-result v7

    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getPaddingBottom()I

    move-result v8

    move-object v1, p1

    invoke-static/range {v1 .. v8}, Lcom/flyersoft/views/ShelfImageView;->drawGridCovers(Landroid/graphics/Canvas;Ljava/util/ArrayList;IIIIII)V

    return-void

    :cond_0
    move-object v1, p1

    .line 106
    invoke-super {p0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method


# virtual methods
.method public downloadUrlImage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 7

    if-eqz p1, :cond_2

    .line 220
    const-string v0, "http"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 222
    :cond_0
    sget-object v0, Lcom/flyersoft/views/ShelfImageView;->imageCache:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 223
    sget-object v0, Lcom/flyersoft/views/ShelfImageView;->imageCache:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/flyersoft/views/ShelfImageView;->urlDrawable:Landroid/graphics/drawable/Drawable;

    .line 224
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->postInvalidate()V

    if-nez p4, :cond_1

    goto :goto_0

    .line 228
    :cond_1
    new-instance v6, Lcom/flyersoft/views/ShelfImageView$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p4

    invoke-direct {v6, p0, p4, p1}, Lcom/flyersoft/views/ShelfImageView$1;-><init>(Lcom/flyersoft/views/ShelfImageView;Landroid/os/Looper;Ljava/lang/String;)V

    .line 240
    new-instance v1, Lcom/flyersoft/views/ShelfImageView$2;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v1 .. v6}, Lcom/flyersoft/views/ShelfImageView$2;-><init>(Lcom/flyersoft/views/ShelfImageView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;)V

    .line 247
    invoke-virtual {v1}, Lcom/flyersoft/views/ShelfImageView$2;->start()V

    :cond_2
    :goto_0
    return-void
.end method

.method protected fitDrawableSize(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 4

    .line 251
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getWidth()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getWidth()I

    move-result v0

    goto :goto_0

    :cond_0
    const/high16 v0, 0x42480000    # 50.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    .line 252
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    .line 253
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    if-le v1, v0, :cond_1

    .line 255
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    mul-int v2, v2, v0

    div-int/2addr v2, v1

    invoke-static {v3, p1, v0, v2}, Lcom/flyersoft/tools/T;->zoomDrawable(Landroid/content/res/Resources;Landroid/graphics/drawable/Drawable;II)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    :cond_1
    return-object p1
.end method

.method public initPadding()V
    .locals 4

    .line 54
    invoke-direct {p0}, Lcom/flyersoft/views/ShelfImageView;->drawShadow()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/views/ShelfImageView;->bg:Landroid/graphics/drawable/NinePatchDrawable;

    if-nez v0, :cond_2

    .line 55
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 56
    iget v1, p0, Lcom/flyersoft/views/ShelfImageView;->shadowRes:I

    if-eqz v1, :cond_0

    goto :goto_0

    .line 57
    :cond_0
    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/flyersoft/views/ShelfImageView;->isShelfCover:Z

    if-eqz v1, :cond_1

    .line 58
    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->list_bookshadow_woody:I

    goto :goto_0

    :cond_1
    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->list_bookshadow_dark:I

    .line 55
    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/NinePatchDrawable;

    iput-object v0, p0, Lcom/flyersoft/views/ShelfImageView;->bg:Landroid/graphics/drawable/NinePatchDrawable;

    .line 59
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/ShelfImageView;->pr:Landroid/graphics/Rect;

    .line 60
    iget-object v1, p0, Lcom/flyersoft/views/ShelfImageView;->bg:Landroid/graphics/drawable/NinePatchDrawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/NinePatchDrawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 61
    iget-object v0, p0, Lcom/flyersoft/views/ShelfImageView;->pr:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    iget-object v1, p0, Lcom/flyersoft/views/ShelfImageView;->pr:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    iget-object v2, p0, Lcom/flyersoft/views/ShelfImageView;->pr:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    iget-object v3, p0, Lcom/flyersoft/views/ShelfImageView;->pr:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/flyersoft/views/ShelfImageView;->setPadding(IIII)V

    .line 62
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->list_book_thickness:I

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/views/ShelfImageView;->leftShadow:Landroid/graphics/Bitmap;

    :cond_2
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 74
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_2

    .line 78
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/views/ShelfImageView;->urlDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1

    .line 79
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/views/ShelfImageView;->drawUrlDrawableInstead(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 83
    :cond_1
    invoke-direct {p0}, Lcom/flyersoft/views/ShelfImageView;->drawShadow()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/views/ShelfImageView;->bg:Landroid/graphics/drawable/NinePatchDrawable;

    if-eqz v0, :cond_2

    .line 84
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getHeight()I

    move-result v3

    invoke-virtual {v0, v1, v1, v2, v3}, Landroid/graphics/drawable/NinePatchDrawable;->setBounds(IIII)V

    .line 85
    iget-object v0, p0, Lcom/flyersoft/views/ShelfImageView;->bg:Landroid/graphics/drawable/NinePatchDrawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/NinePatchDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 86
    invoke-direct {p0, p1}, Lcom/flyersoft/views/ShelfImageView;->superOnDraw(Landroid/graphics/Canvas;)V

    .line 87
    iget-object v0, p0, Lcom/flyersoft/views/ShelfImageView;->leftShadow:Landroid/graphics/Bitmap;

    new-instance v2, Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/flyersoft/views/ShelfImageView;->leftShadow:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iget-object v4, p0, Lcom/flyersoft/views/ShelfImageView;->leftShadow:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-direct {v2, v1, v1, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v3, Landroid/graphics/Rect;

    iget-object v4, p0, Lcom/flyersoft/views/ShelfImageView;->pr:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    iget-object v5, p0, Lcom/flyersoft/views/ShelfImageView;->pr:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    .line 88
    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getWidth()I

    move-result v6

    iget-object v7, p0, Lcom/flyersoft/views/ShelfImageView;->pr:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->right:I

    sub-int/2addr v6, v7

    div-int/lit8 v6, v6, 0x4

    invoke-virtual {p0}, Lcom/flyersoft/views/ShelfImageView;->getHeight()I

    move-result v7

    iget-object v8, p0, Lcom/flyersoft/views/ShelfImageView;->pr:Landroid/graphics/Rect;

    iget v8, v8, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v7, v8

    invoke-direct {v3, v4, v5, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v4, 0x0

    .line 87
    invoke-virtual {p1, v0, v2, v3, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_0

    .line 90
    :cond_2
    invoke-direct {p0, p1}, Lcom/flyersoft/views/ShelfImageView;->superOnDraw(Landroid/graphics/Canvas;)V

    .line 92
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/views/ShelfImageView;->pr:Landroid/graphics/Rect;

    if-eqz v0, :cond_3

    iget v0, v0, Landroid/graphics/Rect;->left:I

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    .line 93
    :goto_1
    iget-object v2, p0, Lcom/flyersoft/views/ShelfImageView;->pr:Landroid/graphics/Rect;

    if-eqz v2, :cond_4

    iget v1, v2, Landroid/graphics/Rect;->top:I

    .line 94
    :cond_4
    invoke-direct {p0, p1, v0, v1}, Lcom/flyersoft/views/ShelfImageView;->drawPutOnTop(Landroid/graphics/Canvas;II)V

    .line 95
    invoke-direct {p0, p1, v0, v1}, Lcom/flyersoft/views/ShelfImageView;->drawCloudIcon(Landroid/graphics/Canvas;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 98
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_2
    return-void
.end method

.method public setCloudIcon(Lcom/flyersoft/tools/BookDb$BookInfo;)V
    .locals 2

    const/4 v0, 0x0

    if-eqz p1, :cond_5

    .line 176
    iget-object v1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 179
    :cond_0
    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->downloadUrl:Ljava/lang/String;

    .line 180
    sget-object v1, Lcom/flyersoft/tools/A;->WEBDAV_TAG:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->webdav:I

    goto :goto_0

    .line 181
    :cond_1
    sget-object v1, Lcom/flyersoft/tools/A;->FTP_TAG:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->ftp:I

    goto :goto_0

    .line 182
    :cond_2
    sget-object v1, Lcom/flyersoft/tools/A;->DROPBOX_TAG:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->dropbox:I

    goto :goto_0

    .line 183
    :cond_3
    sget-object v1, Lcom/flyersoft/tools/A;->GDRIVE_TAG:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->gdrive:I

    :cond_4
    :goto_0
    iput v0, p0, Lcom/flyersoft/views/ShelfImageView;->cloudIcon:I

    return-void

    .line 177
    :cond_5
    :goto_1
    iput v0, p0, Lcom/flyersoft/views/ShelfImageView;->cloudIcon:I

    return-void
.end method
