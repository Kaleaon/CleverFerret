.class public abstract Lorg/comic/CLayout;
.super Ljava/lang/Object;
.source "CLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/comic/CLayout$LayoutListener;,
        Lorg/comic/CLayout$Pos;
    }
.end annotation


# static fields
.field public static fling_dis:F = 1.0f

.field public static fling_speed:F = 0.2f


# instance fields
.field alphPaint:Landroid/graphics/Paint;

.field antiPaint:Landroid/graphics/Paint;

.field def_view:I

.field lockedImages:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field public m_back_color:I

.field private m_ctx:Landroid/content/Context;

.field protected m_disp_page1:I

.field protected m_disp_page2:I

.field protected m_doc:Lorg/comic/CDocument;

.field public m_h:I

.field protected m_listener:Lorg/comic/CLayout$LayoutListener;

.field public m_page_gap:I

.field public m_page_maxh:F

.field public m_page_maxw:F

.field public m_pageno:I

.field public m_pages:[Lorg/comic/VCPage;

.field public m_scale:F

.field public m_scale_max:F

.field public m_scale_min:F

.field public m_scroller:Landroid/widget/Scroller;

.field public m_th:I

.field public m_tw:I

.field public m_w:I

.field public m_zoom_level:F

.field public m_zoom_level_clip:F

.field protected m_zoom_page0:I

.field protected m_zoom_page1:I

.field pagePaint:Landroid/graphics/Paint;

.field textPaint:Landroid/text/TextPaint;

.field public vert:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 38
    iput v0, p0, Lorg/comic/CLayout;->def_view:I

    const/4 v1, 0x0

    .line 39
    iput-object v1, p0, Lorg/comic/CLayout;->m_doc:Lorg/comic/CDocument;

    .line 40
    iput-object v1, p0, Lorg/comic/CLayout;->m_pages:[Lorg/comic/VCPage;

    .line 41
    iput v0, p0, Lorg/comic/CLayout;->m_w:I

    .line 42
    iput v0, p0, Lorg/comic/CLayout;->m_h:I

    .line 43
    iput v0, p0, Lorg/comic/CLayout;->m_tw:I

    .line 44
    iput v0, p0, Lorg/comic/CLayout;->m_th:I

    const/4 v2, 0x0

    .line 45
    iput v2, p0, Lorg/comic/CLayout;->m_scale:F

    const/high16 v2, 0x3f800000    # 1.0f

    .line 46
    iput v2, p0, Lorg/comic/CLayout;->m_scale_min:F

    .line 47
    iput v2, p0, Lorg/comic/CLayout;->m_scale_max:F

    const/high16 v2, 0x41000000    # 8.0f

    .line 48
    iput v2, p0, Lorg/comic/CLayout;->m_zoom_level:F

    const/high16 v2, 0x40200000    # 2.5f

    .line 49
    iput v2, p0, Lorg/comic/CLayout;->m_zoom_level_clip:F

    .line 50
    iput v0, p0, Lorg/comic/CLayout;->m_disp_page1:I

    .line 51
    iput v0, p0, Lorg/comic/CLayout;->m_disp_page2:I

    .line 52
    iput v0, p0, Lorg/comic/CLayout;->m_page_gap:I

    const v2, -0x333334

    .line 53
    iput v2, p0, Lorg/comic/CLayout;->m_back_color:I

    .line 56
    iput-object v1, p0, Lorg/comic/CLayout;->m_listener:Lorg/comic/CLayout$LayoutListener;

    .line 57
    iput-object v1, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    .line 144
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/comic/CLayout;->lockedImages:Ljava/util/HashMap;

    .line 316
    iput v0, p0, Lorg/comic/CLayout;->m_pageno:I

    .line 64
    iput-object p1, p0, Lorg/comic/CLayout;->m_ctx:Landroid/content/Context;

    .line 65
    new-instance v0, Landroid/widget/Scroller;

    invoke-direct {v0, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    .line 66
    invoke-virtual {p0}, Lorg/comic/CLayout;->initPaints()V

    return-void
.end method

.method private lockPageBitmap(ILandroid/graphics/Bitmap;)V
    .locals 2

    .line 159
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 161
    :cond_0
    iget-object v0, p0, Lorg/comic/CLayout;->lockedImages:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eq p2, v0, :cond_1

    .line 162
    iget-object v0, p0, Lorg/comic/CLayout;->lockedImages:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    :goto_0
    return-void
.end method

.method private releaseLockedBitmaps()V
    .locals 3

    .line 147
    iget-object v0, p0, Lorg/comic/CLayout;->lockedImages:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 148
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 149
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 150
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 151
    iget v2, p0, Lorg/comic/CLayout;->m_disp_page1:I

    if-lt v1, v2, :cond_1

    iget v2, p0, Lorg/comic/CLayout;->m_disp_page2:I

    if-lt v1, v2, :cond_0

    .line 153
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_2
    return-void
.end method


# virtual methods
.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 372
    invoke-virtual {p0}, Lorg/comic/CLayout;->vClose()V

    .line 373
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public initPaints()V
    .locals 4

    .line 70
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/comic/CLayout;->alphPaint:Landroid/graphics/Paint;

    .line 71
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/comic/CLayout;->antiPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    .line 72
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 73
    iget-object v0, p0, Lorg/comic/CLayout;->antiPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 74
    iget-object v0, p0, Lorg/comic/CLayout;->antiPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 76
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/comic/CLayout;->pagePaint:Landroid/graphics/Paint;

    .line 77
    sget v2, Lcom/radaee/pdf/Global;->pdf_theme:I

    if-ne v2, v1, :cond_0

    const/high16 v2, -0x1000000

    goto :goto_0

    :cond_0
    const/4 v2, -0x1

    :goto_0
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 79
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    iput-object v0, p0, Lorg/comic/CLayout;->textPaint:Landroid/text/TextPaint;

    .line 81
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    const-string v3, "number.ttf"

    invoke-static {v2, v3}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 83
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 85
    :goto_1
    iget-object v0, p0, Lorg/comic/CLayout;->textPaint:Landroid/text/TextPaint;

    sget v2, Lcom/radaee/pdf/Global;->pdf_theme:I

    if-ne v2, v1, :cond_1

    const v1, 0x66888888

    goto :goto_2

    :cond_1
    const v1, 0x33888888

    :goto_2
    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setColor(I)V

    .line 86
    iget-object v0, p0, Lorg/comic/CLayout;->textPaint:Landroid/text/TextPaint;

    const/high16 v1, 0x41c00000    # 24.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTextSize(F)V

    return-void
.end method

.method public vClose()V
    .locals 1

    .line 250
    iget-object v0, p0, Lorg/comic/CLayout;->m_pages:[Lorg/comic/VCPage;

    if-nez v0, :cond_0

    return-void

    .line 251
    :cond_0
    invoke-virtual {p0}, Lorg/comic/CLayout;->vScrollAbort()V

    const/4 v0, 0x0

    .line 252
    iput-object v0, p0, Lorg/comic/CLayout;->m_pages:[Lorg/comic/VCPage;

    return-void
.end method

.method public vDraw(Landroid/view/View;Landroid/graphics/Canvas;ZII)V
    .locals 10

    .line 126
    iget-object v0, p0, Lorg/comic/CLayout;->m_doc:Lorg/comic/CDocument;

    if-nez v0, :cond_0

    goto :goto_1

    .line 127
    :cond_0
    invoke-virtual {p0}, Lorg/comic/CLayout;->vFlushRange()V

    .line 128
    iget v0, p0, Lorg/comic/CLayout;->m_disp_page1:I

    .line 129
    iget v1, p0, Lorg/comic/CLayout;->m_disp_page2:I

    if-ltz v0, :cond_2

    if-ltz v1, :cond_2

    if-gt v1, v0, :cond_1

    goto :goto_1

    .line 131
    :cond_1
    invoke-virtual {p0}, Lorg/comic/CLayout;->vGetX()I

    move-result v6

    .line 132
    invoke-virtual {p0}, Lorg/comic/CLayout;->vGetY()I

    move-result v7

    .line 134
    invoke-direct {p0}, Lorg/comic/CLayout;->releaseLockedBitmaps()V

    :goto_0
    if-ge v0, v1, :cond_2

    .line 137
    iget-object v2, p0, Lorg/comic/CLayout;->m_pages:[Lorg/comic/VCPage;

    aget-object v2, v2, v0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move v8, p4

    move v9, p5

    .line 138
    invoke-virtual/range {v2 .. v9}, Lorg/comic/VCPage;->vDraw(Landroid/view/View;Landroid/graphics/Canvas;ZIIII)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 139
    invoke-direct {p0, v0, p1}, Lorg/comic/CLayout;->lockPageBitmap(ILandroid/graphics/Bitmap;)V

    add-int/lit8 v0, v0, 0x1

    move-object p1, v3

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method public vFling(IIFFFF)Z
    .locals 9

    .line 306
    invoke-virtual {p0}, Lorg/comic/CLayout;->vGetX()I

    move-result v1

    .line 307
    invoke-virtual {p0}, Lorg/comic/CLayout;->vGetY()I

    move-result v2

    .line 308
    iget-object p1, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->abortAnimation()V

    .line 309
    iget-object p1, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 310
    iget p1, p0, Lorg/comic/CLayout;->def_view:I

    if-ne p1, p2, :cond_0

    const/high16 p1, 0x40000000    # 2.0f

    div-float/2addr p5, p1

    .line 312
    :cond_0
    iget-object v0, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    neg-float p1, p5

    float-to-int v3, p1

    neg-float p1, p6

    float-to-int v4, p1

    iget p1, p0, Lorg/comic/CLayout;->m_w:I

    neg-int v5, p1

    iget v6, p0, Lorg/comic/CLayout;->m_tw:I

    iget p1, p0, Lorg/comic/CLayout;->m_h:I

    neg-int v7, p1

    iget v8, p0, Lorg/comic/CLayout;->m_th:I

    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    return p2
.end method

.method protected vFlushRange()V
    .locals 4

    const/4 v0, 0x0

    .line 319
    invoke-virtual {p0, v0, v0}, Lorg/comic/CLayout;->vGetPage(II)I

    move-result v0

    .line 320
    iget v1, p0, Lorg/comic/CLayout;->m_w:I

    iget v2, p0, Lorg/comic/CLayout;->m_h:I

    invoke-virtual {p0, v1, v2}, Lorg/comic/CLayout;->vGetPage(II)I

    move-result v1

    if-ltz v0, :cond_1

    if-ltz v1, :cond_1

    if-le v0, v1, :cond_0

    goto :goto_0

    :cond_0
    move v3, v1

    move v1, v0

    move v0, v3

    :goto_0
    add-int/lit8 v0, v0, 0x1

    move v3, v1

    move v1, v0

    move v0, v3

    .line 330
    :cond_1
    iput v0, p0, Lorg/comic/CLayout;->m_disp_page1:I

    .line 331
    iput v1, p0, Lorg/comic/CLayout;->m_disp_page2:I

    .line 332
    iget-object v0, p0, Lorg/comic/CLayout;->m_listener:Lorg/comic/CLayout$LayoutListener;

    if-eqz v0, :cond_2

    iget v0, p0, Lorg/comic/CLayout;->m_w:I

    div-int/lit8 v0, v0, 0x4

    iget v1, p0, Lorg/comic/CLayout;->m_h:I

    div-int/lit8 v1, v1, 0x4

    invoke-virtual {p0, v0, v1}, Lorg/comic/CLayout;->vGetPage(II)I

    move-result v0

    iget v1, p0, Lorg/comic/CLayout;->m_pageno:I

    if-eq v0, v1, :cond_2

    .line 333
    iget-object v1, p0, Lorg/comic/CLayout;->m_listener:Lorg/comic/CLayout$LayoutListener;

    iput v0, p0, Lorg/comic/CLayout;->m_pageno:I

    invoke-interface {v1, v0}, Lorg/comic/CLayout$LayoutListener;->OnPageChanged(I)V

    :cond_2
    return-void
.end method

.method public final vGetHeight()I
    .locals 1

    .line 341
    iget v0, p0, Lorg/comic/CLayout;->m_h:I

    return v0
.end method

.method public final vGetMaxScale()F
    .locals 1

    .line 367
    iget v0, p0, Lorg/comic/CLayout;->m_scale_max:F

    return v0
.end method

.method public final vGetMinScale()F
    .locals 1

    .line 359
    iget v0, p0, Lorg/comic/CLayout;->m_scale_min:F

    return v0
.end method

.method public abstract vGetPage(II)I
.end method

.method public final vGetPage(I)Lorg/comic/VCPage;
    .locals 2

    if-gez p1, :cond_0

    const/4 p1, 0x0

    .line 173
    :cond_0
    iget-object v0, p0, Lorg/comic/CLayout;->m_pages:[Lorg/comic/VCPage;

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    if-le p1, v1, :cond_1

    array-length p1, v0

    add-int/lit8 p1, p1, -0x1

    .line 174
    :cond_1
    aget-object p1, v0, p1

    return-object p1
.end method

.method public vGetPos(II)Lorg/comic/CLayout$Pos;
    .locals 3

    .line 178
    iget v0, p0, Lorg/comic/CLayout;->m_w:I

    const/4 v1, 0x0

    if-lez v0, :cond_2

    iget v0, p0, Lorg/comic/CLayout;->m_h:I

    if-gtz v0, :cond_0

    goto :goto_0

    .line 179
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/comic/CLayout;->vGetPage(II)I

    move-result v0

    if-gez v0, :cond_1

    return-object v1

    .line 181
    :cond_1
    invoke-virtual {p0}, Lorg/comic/CLayout;->vGetX()I

    move-result v1

    add-int/2addr p1, v1

    .line 182
    invoke-virtual {p0}, Lorg/comic/CLayout;->vGetY()I

    move-result v1

    add-int/2addr p2, v1

    .line 183
    iget-object v1, p0, Lorg/comic/CLayout;->m_pages:[Lorg/comic/VCPage;

    aget-object v1, v1, v0

    .line 184
    new-instance v2, Lorg/comic/CLayout$Pos;

    invoke-direct {v2}, Lorg/comic/CLayout$Pos;-><init>()V

    int-to-float p1, p1

    .line 185
    invoke-virtual {v1, p1}, Lorg/comic/VCPage;->GetCX(F)F

    move-result p1

    iput p1, v2, Lorg/comic/CLayout$Pos;->x:F

    int-to-float p1, p2

    .line 186
    invoke-virtual {v1, p1}, Lorg/comic/VCPage;->GetCY(F)F

    move-result p1

    iput p1, v2, Lorg/comic/CLayout$Pos;->y:F

    .line 187
    iput v0, v2, Lorg/comic/CLayout$Pos;->pageno:I

    return-object v2

    :cond_2
    :goto_0
    return-object v1
.end method

.method public final vGetScale()F
    .locals 1

    .line 363
    iget v0, p0, Lorg/comic/CLayout;->m_scale:F

    return v0
.end method

.method public final vGetTHeight()I
    .locals 1

    .line 355
    iget v0, p0, Lorg/comic/CLayout;->m_th:I

    return v0
.end method

.method public final vGetTWidth()I
    .locals 1

    .line 348
    iget v0, p0, Lorg/comic/CLayout;->m_tw:I

    return v0
.end method

.method public final vGetWidth()I
    .locals 1

    .line 337
    iget v0, p0, Lorg/comic/CLayout;->m_w:I

    return v0
.end method

.method public final vGetX()I
    .locals 4

    .line 271
    iget-object v0, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    .line 272
    iget v1, p0, Lorg/comic/CLayout;->m_tw:I

    iget v2, p0, Lorg/comic/CLayout;->m_w:I

    sub-int v3, v1, v2

    if-le v0, v3, :cond_0

    sub-int v0, v1, v2

    :cond_0
    if-gez v0, :cond_1

    const/4 v0, 0x0

    :cond_1
    return v0
.end method

.method public final vGetY()I
    .locals 4

    .line 285
    iget-object v0, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v0

    .line 286
    iget-boolean v1, p0, Lorg/comic/CLayout;->vert:Z

    if-nez v1, :cond_0

    .line 287
    iget-object v1, p0, Lorg/comic/CLayout;->m_doc:Lorg/comic/CDocument;

    iget v2, p0, Lorg/comic/CLayout;->m_pageno:I

    invoke-virtual {v1, v2}, Lorg/comic/CDocument;->GetPageHeight(I)I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lorg/comic/CLayout;->m_scale:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    .line 288
    iget v2, p0, Lorg/comic/CLayout;->m_h:I

    sub-int v3, v1, v2

    if-le v0, v3, :cond_1

    sub-int/2addr v1, v2

    move v0, v1

    goto :goto_0

    .line 290
    :cond_0
    iget v1, p0, Lorg/comic/CLayout;->m_th:I

    iget v2, p0, Lorg/comic/CLayout;->m_h:I

    sub-int v3, v1, v2

    if-le v0, v3, :cond_1

    sub-int v0, v1, v2

    :cond_1
    :goto_0
    if-gez v0, :cond_2

    const/4 v0, 0x0

    :cond_2
    return v0
.end method

.method public final vGetZoom()F
    .locals 2

    .line 260
    iget v0, p0, Lorg/comic/CLayout;->m_scale:F

    iget v1, p0, Lorg/comic/CLayout;->m_scale_min:F

    div-float/2addr v0, v1

    return v0
.end method

.method public vGotoPage(I)V
    .locals 7

    .line 201
    iget-object v0, p0, Lorg/comic/CLayout;->m_pages:[Lorg/comic/VCPage;

    if-eqz v0, :cond_5

    if-ltz p1, :cond_5

    array-length v1, v0

    if-lt p1, v1, :cond_0

    goto :goto_1

    .line 202
    :cond_0
    iget v1, p0, Lorg/comic/CLayout;->m_page_gap:I

    div-int/lit8 v2, v1, 0x2

    int-to-float v2, v2

    iget v3, p0, Lorg/comic/CLayout;->m_scale:F

    div-float/2addr v2, v3

    .line 203
    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    div-float/2addr v1, v3

    .line 204
    iget v3, p0, Lorg/comic/CLayout;->m_tw:I

    iget v4, p0, Lorg/comic/CLayout;->m_w:I

    sub-int v5, v3, v4

    int-to-float v5, v5

    cmpl-float v5, v2, v5

    if-lez v5, :cond_1

    sub-int/2addr v3, v4

    int-to-float v2, v3

    :cond_1
    const/4 v3, 0x0

    cmpg-float v4, v2, v3

    if-gez v4, :cond_2

    const/4 v2, 0x0

    .line 206
    :cond_2
    iget v4, p0, Lorg/comic/CLayout;->m_th:I

    iget v5, p0, Lorg/comic/CLayout;->m_h:I

    sub-int v6, v4, v5

    int-to-float v6, v6

    cmpl-float v6, v1, v6

    if-lez v6, :cond_3

    sub-int/2addr v4, v5

    int-to-float v1, v4

    :cond_3
    cmpg-float v4, v1, v3

    if-gez v4, :cond_4

    goto :goto_0

    :cond_4
    move v3, v1

    .line 209
    :goto_0
    iget-object v1, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    aget-object v0, v0, p1

    invoke-virtual {v0, v2}, Lorg/comic/VCPage;->GetVX(F)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 210
    iget-object v0, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    iget-object v1, p0, Lorg/comic/CLayout;->m_pages:[Lorg/comic/VCPage;

    aget-object p1, v1, p1

    invoke-virtual {p1, v3}, Lorg/comic/VCPage;->GetVY(F)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 211
    iget-object p1, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    :cond_5
    :goto_1
    return-void
.end method

.method public abstract vLayout()V
.end method

.method public abstract vMoveEnd()V
.end method

.method public vOpen(Lorg/comic/CDocument;Lorg/comic/CLayout$LayoutListener;)V
    .locals 7

    if-nez p1, :cond_0

    goto :goto_1

    .line 229
    :cond_0
    iput-object p0, p1, Lorg/comic/CDocument;->m_layout:Lorg/comic/CLayout;

    .line 230
    invoke-virtual {p1}, Lorg/comic/CDocument;->GetPageCount()I

    move-result v0

    if-gtz v0, :cond_1

    goto :goto_1

    .line 232
    :cond_1
    iput-object p2, p0, Lorg/comic/CLayout;->m_listener:Lorg/comic/CLayout$LayoutListener;

    .line 233
    iput-object p1, p0, Lorg/comic/CLayout;->m_doc:Lorg/comic/CDocument;

    .line 234
    invoke-virtual {p1}, Lorg/comic/CDocument;->GetPagesMaxSize()[F

    move-result-object p1

    const/4 p2, 0x0

    .line 235
    aget v1, p1, p2

    iput v1, p0, Lorg/comic/CLayout;->m_page_maxw:F

    const/4 v1, 0x1

    .line 236
    aget p1, p1, v1

    iput p1, p0, Lorg/comic/CLayout;->m_page_maxh:F

    .line 237
    new-array p1, v0, [Lorg/comic/VCPage;

    iput-object p1, p0, Lorg/comic/CLayout;->m_pages:[Lorg/comic/VCPage;

    .line 238
    iget-object p1, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 239
    iget-object p1, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 240
    iget p1, p0, Lorg/comic/CLayout;->m_w:I

    if-lez p1, :cond_3

    iget p1, p0, Lorg/comic/CLayout;->m_h:I

    if-lez p1, :cond_3

    const/4 p1, 0x0

    .line 241
    iput p1, p0, Lorg/comic/CLayout;->m_scale:F

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v0, :cond_2

    .line 243
    iget-object p1, p0, Lorg/comic/CLayout;->m_pages:[Lorg/comic/VCPage;

    new-instance v1, Lorg/comic/VCPage;

    iget-object v2, p0, Lorg/comic/CLayout;->m_doc:Lorg/comic/CDocument;

    iget v5, p0, Lorg/comic/CLayout;->m_w:I

    iget v6, p0, Lorg/comic/CLayout;->m_h:I

    move-object v3, p0

    invoke-direct/range {v1 .. v6}, Lorg/comic/VCPage;-><init>(Lorg/comic/CDocument;Lorg/comic/CLayout;III)V

    aput-object v1, p1, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 245
    :cond_2
    invoke-virtual {p0}, Lorg/comic/CLayout;->vLayout()V

    :cond_3
    :goto_1
    return-void
.end method

.method public vResize(II)V
    .locals 9

    if-lez p1, :cond_4

    if-gtz p2, :cond_0

    goto :goto_1

    .line 92
    :cond_0
    iget v0, p0, Lorg/comic/CLayout;->m_w:I

    if-ne p1, v0, :cond_1

    iget v0, p0, Lorg/comic/CLayout;->m_h:I

    if-ne p2, v0, :cond_1

    goto :goto_1

    .line 93
    :cond_1
    iget-object v0, p0, Lorg/comic/CLayout;->m_pages:[Lorg/comic/VCPage;

    if-nez v0, :cond_2

    goto :goto_1

    .line 94
    :cond_2
    invoke-virtual {p0}, Lorg/comic/CLayout;->vScrollAbort()V

    .line 95
    iget v0, p0, Lorg/comic/CLayout;->m_w:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lorg/comic/CLayout;->m_h:I

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {p0, v0, v1}, Lorg/comic/CLayout;->vGetPos(II)Lorg/comic/CLayout$Pos;

    move-result-object v0

    .line 96
    iput p1, p0, Lorg/comic/CLayout;->m_w:I

    .line 97
    iput p2, p0, Lorg/comic/CLayout;->m_h:I

    .line 98
    iget-object v1, p0, Lorg/comic/CLayout;->m_pages:[Lorg/comic/VCPage;

    array-length v1, v1

    const/4 v2, 0x0

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v1, :cond_3

    .line 101
    iget-object v2, p0, Lorg/comic/CLayout;->m_pages:[Lorg/comic/VCPage;

    new-instance v3, Lorg/comic/VCPage;

    iget-object v4, p0, Lorg/comic/CLayout;->m_doc:Lorg/comic/CDocument;

    move-object v5, p0

    move v7, p1

    move v8, p2

    invoke-direct/range {v3 .. v8}, Lorg/comic/VCPage;-><init>(Lorg/comic/CDocument;Lorg/comic/CLayout;III)V

    aput-object v3, v2, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_3
    move-object v5, p0

    .line 105
    invoke-virtual {p0}, Lorg/comic/CLayout;->vLayout()V

    .line 106
    iget p1, v5, Lorg/comic/CLayout;->m_w:I

    div-int/lit8 p1, p1, 0x2

    iget p2, v5, Lorg/comic/CLayout;->m_h:I

    div-int/lit8 p2, p2, 0x2

    invoke-virtual {p0, p1, p2, v0}, Lorg/comic/CLayout;->vSetPos(IILorg/comic/CLayout$Pos;)V

    return-void

    :cond_4
    :goto_1
    move-object v5, p0

    return-void
.end method

.method public final vScrollAbort()V
    .locals 2

    .line 110
    iget-object v0, p0, Lorg/comic/CLayout;->m_doc:Lorg/comic/CDocument;

    if-eqz v0, :cond_0

    .line 111
    iget-object v0, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/comic/CLayout;->m_listener:Lorg/comic/CLayout$LayoutListener;

    if-eqz v0, :cond_0

    .line 112
    new-instance v0, Landroid/widget/Scroller;

    iget-object v1, p0, Lorg/comic/CLayout;->m_ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    .line 113
    iget-object v1, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 114
    iget-object v1, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrY()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 115
    iput-object v0, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    .line 116
    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    :cond_0
    return-void
.end method

.method public final vScrollCompute()Z
    .locals 1

    .line 122
    iget-object v0, p0, Lorg/comic/CLayout;->m_doc:Lorg/comic/CDocument;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public vSetBackColor(I)V
    .locals 0

    .line 256
    iput p1, p0, Lorg/comic/CLayout;->m_back_color:I

    return-void
.end method

.method public vSetPos(IILorg/comic/CLayout$Pos;)V
    .locals 2

    if-nez p3, :cond_0

    return-void

    .line 194
    :cond_0
    iget-object v0, p0, Lorg/comic/CLayout;->m_pages:[Lorg/comic/VCPage;

    iget v1, p3, Lorg/comic/CLayout$Pos;->pageno:I

    aget-object v0, v0, v1

    .line 195
    iget v1, p3, Lorg/comic/CLayout$Pos;->x:F

    invoke-virtual {v0, v1}, Lorg/comic/VCPage;->GetVX(F)I

    move-result v1

    sub-int/2addr v1, p1

    invoke-virtual {p0, v1}, Lorg/comic/CLayout;->vSetX(I)V

    .line 196
    iget p1, p3, Lorg/comic/CLayout$Pos;->y:F

    invoke-virtual {v0, p1}, Lorg/comic/VCPage;->GetVY(F)I

    move-result p1

    sub-int/2addr p1, p2

    invoke-virtual {p0, p1}, Lorg/comic/CLayout;->vSetY(I)V

    .line 197
    iget-object p1, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    return-void
.end method

.method public vSetX(I)V
    .locals 3

    .line 278
    iget v0, p0, Lorg/comic/CLayout;->m_tw:I

    iget v1, p0, Lorg/comic/CLayout;->m_w:I

    sub-int v2, v0, v1

    if-le p1, v2, :cond_0

    sub-int p1, v0, v1

    :cond_0
    if-gez p1, :cond_1

    const/4 p1, 0x0

    .line 281
    :cond_1
    iget-object v0, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, p1}, Landroid/widget/Scroller;->setFinalX(I)V

    return-void
.end method

.method public vSetY(I)V
    .locals 3

    .line 296
    iget-boolean v0, p0, Lorg/comic/CLayout;->vert:Z

    if-nez v0, :cond_0

    .line 297
    iget-object v0, p0, Lorg/comic/CLayout;->m_doc:Lorg/comic/CDocument;

    iget v1, p0, Lorg/comic/CLayout;->m_pageno:I

    invoke-virtual {v0, v1}, Lorg/comic/CDocument;->GetPageHeight(I)I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lorg/comic/CLayout;->m_scale:F

    mul-float v0, v0, v1

    float-to-int v0, v0

    .line 298
    iget v1, p0, Lorg/comic/CLayout;->m_h:I

    sub-int v2, v0, v1

    if-le p1, v2, :cond_1

    sub-int/2addr v0, v1

    move p1, v0

    goto :goto_0

    .line 300
    :cond_0
    iget v0, p0, Lorg/comic/CLayout;->m_th:I

    iget v1, p0, Lorg/comic/CLayout;->m_h:I

    sub-int v2, v0, v1

    if-le p1, v2, :cond_1

    sub-int p1, v0, v1

    :cond_1
    :goto_0
    if-gez p1, :cond_2

    const/4 p1, 0x0

    .line 302
    :cond_2
    iget-object v0, p0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, p1}, Landroid/widget/Scroller;->setFinalY(I)V

    return-void
.end method

.method public vZoomSet(IILorg/comic/CLayout$Pos;F)V
    .locals 1

    .line 264
    iget v0, p0, Lorg/comic/CLayout;->m_scale_min:F

    mul-float p4, p4, v0

    iput p4, p0, Lorg/comic/CLayout;->m_scale:F

    .line 265
    invoke-virtual {p0}, Lorg/comic/CLayout;->vLayout()V

    .line 267
    invoke-virtual {p0, p1, p2, p3}, Lorg/comic/CLayout;->vSetPos(IILorg/comic/CLayout$Pos;)V

    return-void
.end method

.method public vZoomStart()V
    .locals 1

    .line 218
    invoke-virtual {p0}, Lorg/comic/CLayout;->vFlushRange()V

    .line 219
    iget v0, p0, Lorg/comic/CLayout;->m_disp_page1:I

    if-ltz v0, :cond_1

    iget v0, p0, Lorg/comic/CLayout;->m_disp_page2:I

    if-gez v0, :cond_0

    goto :goto_0

    .line 222
    :cond_0
    invoke-virtual {p0}, Lorg/comic/CLayout;->vScrollAbort()V

    .line 223
    iget v0, p0, Lorg/comic/CLayout;->m_disp_page1:I

    iput v0, p0, Lorg/comic/CLayout;->m_zoom_page0:I

    .line 224
    iget v0, p0, Lorg/comic/CLayout;->m_disp_page2:I

    iput v0, p0, Lorg/comic/CLayout;->m_zoom_page1:I

    :cond_1
    :goto_0
    return-void
.end method
