.class public Lorg/djvu/DLayoutSingle;
.super Lorg/djvu/DLayout;
.source "DLayoutSingle.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/djvu/DLayoutSingle$Cell;
    }
.end annotation


# instance fields
.field protected m_cells:[Lorg/djvu/DLayoutSingle$Cell;

.field private m_rtol_init:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lorg/djvu/DLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lorg/djvu/DLayoutSingle;->m_rtol_init:Z

    .line 21
    iput-boolean p1, p0, Lorg/djvu/DLayoutSingle;->vert:Z

    return-void
.end method

.method private m_scrollerStartScroll(IIII)V
    .locals 6

    .line 347
    iget-object v0, p0, Lorg/djvu/DLayoutSingle;->m_scroller:Landroid/widget/Scroller;

    invoke-static {}, Lcom/radaee/pdf/Global;->scrollDuration()I

    move-result v5

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    return-void
.end method


# virtual methods
.method protected do_scroll(FFFF)V
    .locals 7

    const/high16 v0, 0x447a0000    # 1000.0f

    mul-float v1, p3, v0

    .line 30
    iget v2, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    mul-float v0, v0, p4

    .line 31
    iget v2, p0, Lorg/djvu/DLayoutSingle;->m_h:I

    int-to-float v2, v2

    div-float/2addr v0, v2

    mul-float v1, v1, v1

    mul-float v0, v0, v0

    add-float/2addr v1, v0

    float-to-double v0, v1

    .line 32
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-int v0, v0

    invoke-static {v0}, Lcom/radaee/pdf/Global;->scrollDuration(I)I

    move-result v6

    .line 33
    iget-object v1, p0, Lorg/djvu/DLayoutSingle;->m_scroller:Landroid/widget/Scroller;

    float-to-int v2, p1

    float-to-int v3, p2

    float-to-int v4, p3

    float-to-int v5, p4

    invoke-virtual/range {v1 .. v6}, Landroid/widget/Scroller;->startScroll(IIIII)V

    return-void
.end method

.method public vClose()V
    .locals 0

    .line 210
    invoke-super {p0}, Lorg/djvu/DLayout;->vClose()V

    return-void
.end method

.method public vFling(IIFFFF)Z
    .locals 4

    .line 38
    iget-object p1, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    const/4 p2, 0x0

    if-nez p1, :cond_0

    return p2

    .line 39
    :cond_0
    sget p1, Lorg/djvu/DLayout;->fling_speed:F

    mul-float p5, p5, p1

    .line 40
    sget p1, Lorg/djvu/DLayout;->fling_speed:F

    mul-float p6, p6, p1

    .line 41
    invoke-virtual {p0}, Lorg/djvu/DLayoutSingle;->vGetX()I

    move-result p1

    .line 42
    invoke-virtual {p0}, Lorg/djvu/DLayoutSingle;->vGetY()I

    move-result p3

    float-to-int p4, p5

    sub-int p4, p1, p4

    float-to-int p5, p6

    sub-int p5, p3, p5

    .line 45
    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_tw:I

    iget v0, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    sub-int/2addr p6, v0

    if-le p4, p6, :cond_1

    iget p4, p0, Lorg/djvu/DLayoutSingle;->m_tw:I

    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    sub-int/2addr p4, p6

    :cond_1
    if-gez p4, :cond_2

    const/4 p4, 0x0

    .line 47
    :cond_2
    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_th:I

    iget v0, p0, Lorg/djvu/DLayoutSingle;->m_h:I

    sub-int/2addr p6, v0

    if-le p5, p6, :cond_3

    iget p5, p0, Lorg/djvu/DLayoutSingle;->m_th:I

    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_h:I

    sub-int/2addr p5, p6

    :cond_3
    if-gez p5, :cond_4

    const/4 p5, 0x0

    .line 49
    :cond_4
    invoke-virtual {p0, p1}, Lorg/djvu/DLayoutSingle;->vGetCell(I)I

    move-result p6

    .line 50
    invoke-virtual {p0, p4}, Lorg/djvu/DLayoutSingle;->vGetCell(I)I

    move-result v0

    if-le v0, p6, :cond_5

    add-int/lit8 v0, p6, 0x1

    :cond_5
    if-ge v0, p6, :cond_6

    add-int/lit8 v0, p6, -0x1

    .line 53
    :cond_6
    iget-object v1, p0, Lorg/djvu/DLayoutSingle;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->abortAnimation()V

    .line 54
    iget-object v1, p0, Lorg/djvu/DLayoutSingle;->m_scroller:Landroid/widget/Scroller;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 56
    sget-boolean v1, Lcom/radaee/pdf/Global;->djvuRtol:Z

    const/4 v3, 0x0

    if-eqz v1, :cond_10

    if-le p6, v0, :cond_9

    if-gez v0, :cond_7

    int-to-float p1, p1

    int-to-float p3, p3

    .line 59
    iget-object p4, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object p2, p4, p2

    iget p2, p2, Lorg/djvu/DLayoutSingle$Cell;->right:F

    iget p4, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float p4, p4

    sub-float/2addr p2, p4

    sub-float/2addr p2, p1

    invoke-virtual {p0, p1, p3, p2, v3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto/16 :goto_0

    .line 61
    :cond_7
    iget-object p2, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object p2, p2, p6

    int-to-float p1, p1

    .line 62
    iget p4, p2, Lorg/djvu/DLayoutSingle$Cell;->right:F

    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float p6, p6

    sub-float/2addr p4, p6

    cmpg-float p4, p1, p4

    if-gez p4, :cond_8

    int-to-float p4, p3

    .line 63
    iget p2, p2, Lorg/djvu/DLayoutSingle$Cell;->right:F

    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float p6, p6

    sub-float/2addr p2, p6

    sub-float/2addr p2, p1

    sub-int/2addr p5, p3

    int-to-float p3, p5

    invoke-virtual {p0, p1, p4, p2, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto/16 :goto_0

    :cond_8
    int-to-float p2, p3

    .line 65
    iget-object p4, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object p4, p4, v0

    iget p4, p4, Lorg/djvu/DLayoutSingle$Cell;->left:F

    sub-float/2addr p4, p1

    sub-int/2addr p5, p3

    int-to-float p3, p5

    invoke-virtual {p0, p1, p2, p4, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto/16 :goto_0

    :cond_9
    if-ge p6, v0, :cond_c

    .line 68
    iget-object p2, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    array-length p4, p2

    if-ne v0, p4, :cond_a

    int-to-float p2, p1

    int-to-float p4, p3

    neg-int p1, p1

    int-to-float p1, p1

    sub-int/2addr p5, p3

    int-to-float p3, p5

    .line 69
    invoke-virtual {p0, p2, p4, p1, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto/16 :goto_0

    .line 71
    :cond_a
    aget-object p2, p2, p6

    int-to-float p1, p1

    .line 72
    iget p4, p2, Lorg/djvu/DLayoutSingle$Cell;->left:F

    cmpl-float p4, p1, p4

    if-lez p4, :cond_b

    int-to-float p4, p3

    .line 73
    iget p2, p2, Lorg/djvu/DLayoutSingle$Cell;->left:F

    sub-float/2addr p2, p1

    sub-int/2addr p5, p3

    int-to-float p3, p5

    invoke-virtual {p0, p1, p4, p2, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto/16 :goto_0

    :cond_b
    int-to-float p2, p3

    .line 75
    iget-object p4, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object p4, p4, v0

    iget p4, p4, Lorg/djvu/DLayoutSingle$Cell;->right:F

    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float p6, p6

    sub-float/2addr p4, p6

    sub-float/2addr p4, p1

    sub-int/2addr p5, p3

    int-to-float p3, p5

    invoke-virtual {p0, p1, p2, p4, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto/16 :goto_0

    .line 78
    :cond_c
    iget-object p2, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object p2, p2, v0

    .line 79
    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    add-int/2addr p6, p4

    int-to-float p6, p6

    iget v1, p2, Lorg/djvu/DLayoutSingle$Cell;->right:F

    cmpl-float p6, p6, v1

    if-lez p6, :cond_f

    .line 80
    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    shr-int/2addr p6, v2

    add-int/2addr p4, p6

    int-to-float p4, p4

    iget p2, p2, Lorg/djvu/DLayoutSingle$Cell;->right:F

    cmpl-float p2, p4, p2

    if-lez p2, :cond_e

    add-int/lit8 p2, v0, -0x1

    if-gez p2, :cond_d

    int-to-float p1, p1

    int-to-float p2, p3

    .line 83
    iget-object p4, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object p4, p4, v0

    iget p4, p4, Lorg/djvu/DLayoutSingle$Cell;->left:F

    sub-float/2addr p4, p1

    sub-int/2addr p5, p3

    int-to-float p3, p5

    invoke-virtual {p0, p1, p2, p4, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto/16 :goto_0

    :cond_d
    int-to-float p1, p1

    int-to-float p4, p3

    .line 85
    iget-object p6, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object p2, p6, p2

    iget p2, p2, Lorg/djvu/DLayoutSingle$Cell;->right:F

    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float p6, p6

    sub-float/2addr p2, p6

    sub-float/2addr p2, p1

    sub-int/2addr p5, p3

    int-to-float p3, p5

    invoke-virtual {p0, p1, p4, p2, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto/16 :goto_0

    :cond_e
    int-to-float p1, p1

    int-to-float p2, p3

    .line 87
    iget-object p4, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object p4, p4, v0

    iget p4, p4, Lorg/djvu/DLayoutSingle$Cell;->right:F

    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float p6, p6

    sub-float/2addr p4, p6

    sub-float/2addr p4, p1

    sub-int/2addr p5, p3

    int-to-float p3, p5

    invoke-virtual {p0, p1, p2, p4, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto/16 :goto_0

    :cond_f
    int-to-float p2, p1

    int-to-float p6, p3

    sub-int/2addr p4, p1

    int-to-float p1, p4

    sub-int/2addr p5, p3

    int-to-float p3, p5

    .line 89
    invoke-virtual {p0, p2, p6, p1, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto/16 :goto_0

    :cond_10
    if-ge p6, v0, :cond_13

    .line 93
    iget-object p2, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    array-length p4, p2

    if-ne v0, p4, :cond_11

    int-to-float p1, p1

    int-to-float p4, p3

    sub-int/2addr v0, v2

    .line 94
    aget-object p2, p2, v0

    iget p2, p2, Lorg/djvu/DLayoutSingle$Cell;->right:F

    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float p6, p6

    sub-float/2addr p2, p6

    sub-float/2addr p2, p1

    sub-int/2addr p5, p3

    int-to-float p3, p5

    invoke-virtual {p0, p1, p4, p2, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto/16 :goto_0

    .line 96
    :cond_11
    aget-object p2, p2, p6

    int-to-float p1, p1

    .line 97
    iget p4, p2, Lorg/djvu/DLayoutSingle$Cell;->right:F

    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float p6, p6

    sub-float/2addr p4, p6

    cmpg-float p4, p1, p4

    if-gez p4, :cond_12

    int-to-float p4, p3

    .line 98
    iget p2, p2, Lorg/djvu/DLayoutSingle$Cell;->right:F

    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float p6, p6

    sub-float/2addr p2, p6

    sub-float/2addr p2, p1

    sub-int/2addr p5, p3

    int-to-float p3, p5

    invoke-virtual {p0, p1, p4, p2, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto/16 :goto_0

    :cond_12
    int-to-float p2, p3

    .line 100
    iget-object p4, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object p4, p4, v0

    iget p4, p4, Lorg/djvu/DLayoutSingle$Cell;->left:F

    sub-float/2addr p4, p1

    sub-int/2addr p5, p3

    int-to-float p3, p5

    invoke-virtual {p0, p1, p2, p4, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto/16 :goto_0

    :cond_13
    if-le p6, v0, :cond_16

    if-gez v0, :cond_14

    int-to-float p2, p1

    int-to-float p3, p3

    neg-int p1, p1

    int-to-float p1, p1

    .line 104
    invoke-virtual {p0, p2, p3, p1, v3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto/16 :goto_0

    .line 106
    :cond_14
    iget-object p2, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object p2, p2, p6

    int-to-float p1, p1

    .line 107
    iget p4, p2, Lorg/djvu/DLayoutSingle$Cell;->left:F

    cmpl-float p4, p1, p4

    if-lez p4, :cond_15

    int-to-float p4, p3

    .line 108
    iget p2, p2, Lorg/djvu/DLayoutSingle$Cell;->left:F

    sub-float/2addr p2, p1

    sub-int/2addr p5, p3

    int-to-float p3, p5

    invoke-virtual {p0, p1, p4, p2, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto :goto_0

    :cond_15
    int-to-float p2, p3

    .line 110
    iget-object p4, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object p4, p4, v0

    iget p4, p4, Lorg/djvu/DLayoutSingle$Cell;->right:F

    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float p6, p6

    sub-float/2addr p4, p6

    sub-float/2addr p4, p1

    sub-int/2addr p5, p3

    int-to-float p3, p5

    invoke-virtual {p0, p1, p2, p4, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto :goto_0

    .line 113
    :cond_16
    iget-object p2, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object p2, p2, v0

    .line 114
    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    add-int/2addr p6, p4

    int-to-float p6, p6

    iget v1, p2, Lorg/djvu/DLayoutSingle$Cell;->right:F

    cmpl-float p6, p6, v1

    if-lez p6, :cond_19

    .line 115
    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    shr-int/2addr p6, v2

    add-int/2addr p4, p6

    int-to-float p4, p4

    iget p2, p2, Lorg/djvu/DLayoutSingle$Cell;->right:F

    cmpl-float p2, p4, p2

    if-lez p2, :cond_18

    add-int/lit8 p2, v0, 0x1

    .line 117
    iget-object p4, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    array-length p6, p4

    if-ne p2, p6, :cond_17

    int-to-float p1, p1

    int-to-float p2, p3

    .line 118
    aget-object p4, p4, v0

    iget p4, p4, Lorg/djvu/DLayoutSingle$Cell;->right:F

    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float p6, p6

    sub-float/2addr p4, p6

    sub-float/2addr p4, p1

    sub-int/2addr p5, p3

    int-to-float p3, p5

    invoke-virtual {p0, p1, p2, p4, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto :goto_0

    :cond_17
    int-to-float p1, p1

    int-to-float p6, p3

    .line 120
    aget-object p2, p4, p2

    iget p2, p2, Lorg/djvu/DLayoutSingle$Cell;->left:F

    sub-float/2addr p2, p1

    sub-int/2addr p5, p3

    int-to-float p3, p5

    invoke-virtual {p0, p1, p6, p2, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto :goto_0

    :cond_18
    int-to-float p1, p1

    int-to-float p2, p3

    .line 122
    iget-object p4, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object p4, p4, v0

    iget p4, p4, Lorg/djvu/DLayoutSingle$Cell;->right:F

    iget p6, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float p6, p6

    sub-float/2addr p4, p6

    sub-float/2addr p4, p1

    sub-int/2addr p5, p3

    int-to-float p3, p5

    invoke-virtual {p0, p1, p2, p4, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    goto :goto_0

    :cond_19
    int-to-float p2, p1

    int-to-float p6, p3

    sub-int/2addr p4, p1

    int-to-float p1, p4

    sub-int/2addr p5, p3

    int-to-float p3, p5

    .line 124
    invoke-virtual {p0, p2, p6, p1, p3}, Lorg/djvu/DLayoutSingle;->do_scroll(FFFF)V

    :goto_0
    return v2
.end method

.method protected vGetCell(I)I
    .locals 7

    .line 266
    iget-object v0, p0, Lorg/djvu/DLayoutSingle;->m_pages:[Lorg/djvu/VDPage;

    const/4 v1, -0x1

    if-eqz v0, :cond_8

    iget-object v0, p0, Lorg/djvu/DLayoutSingle;->m_pages:[Lorg/djvu/VDPage;

    array-length v0, v0

    if-lez v0, :cond_8

    iget-object v0, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    if-nez v0, :cond_0

    goto :goto_2

    .line 268
    :cond_0
    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    .line 270
    sget-boolean v2, Lcom/radaee/pdf/Global;->djvuRtol:Z

    const/4 v3, 0x0

    if-nez v2, :cond_3

    :goto_0
    if-gt v3, v0, :cond_6

    add-int v2, v3, v0

    shr-int/lit8 v2, v2, 0x1

    .line 273
    iget-object v4, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object v4, v4, v2

    int-to-float v5, p1

    .line 274
    iget v6, v4, Lorg/djvu/DLayoutSingle$Cell;->left:F

    cmpg-float v6, v5, v6

    if-gez v6, :cond_1

    add-int/lit8 v2, v2, -0x1

    move v0, v2

    goto :goto_0

    .line 276
    :cond_1
    iget v3, v4, Lorg/djvu/DLayoutSingle$Cell;->right:F

    cmpl-float v3, v5, v3

    if-lez v3, :cond_2

    add-int/lit8 v2, v2, 0x1

    move v3, v2

    goto :goto_0

    :cond_2
    return v2

    :cond_3
    :goto_1
    if-gt v3, v0, :cond_6

    add-int v2, v3, v0

    shr-int/lit8 v2, v2, 0x1

    .line 285
    iget-object v4, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object v4, v4, v2

    int-to-float v5, p1

    .line 286
    iget v6, v4, Lorg/djvu/DLayoutSingle$Cell;->left:F

    cmpg-float v6, v5, v6

    if-gez v6, :cond_4

    add-int/lit8 v2, v2, 0x1

    move v3, v2

    goto :goto_1

    .line 288
    :cond_4
    iget v0, v4, Lorg/djvu/DLayoutSingle$Cell;->right:F

    cmpl-float v0, v5, v0

    if-lez v0, :cond_5

    add-int/lit8 v2, v2, -0x1

    move v0, v2

    goto :goto_1

    :cond_5
    return v2

    :cond_6
    if-gez v0, :cond_7

    return v1

    .line 297
    :cond_7
    iget-object p1, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    array-length p1, p1

    return p1

    :cond_8
    :goto_2
    return v1
.end method

.method public vGetPage(II)I
    .locals 6

    .line 215
    iget-object p2, p0, Lorg/djvu/DLayoutSingle;->m_pages:[Lorg/djvu/VDPage;

    if-eqz p2, :cond_a

    iget-object p2, p0, Lorg/djvu/DLayoutSingle;->m_pages:[Lorg/djvu/VDPage;

    array-length p2, p2

    if-lez p2, :cond_a

    iget-object p2, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    if-nez p2, :cond_0

    goto :goto_2

    .line 217
    :cond_0
    array-length p2, p2

    add-int/lit8 p2, p2, -0x1

    .line 218
    invoke-virtual {p0}, Lorg/djvu/DLayoutSingle;->vGetX()I

    move-result v0

    add-int/2addr p1, v0

    .line 220
    sget-boolean v0, Lcom/radaee/pdf/Global;->djvuRtol:Z

    const/4 v1, 0x0

    if-nez v0, :cond_4

    const/4 v0, 0x0

    :goto_0
    if-gt v0, p2, :cond_8

    add-int v2, v0, p2

    shr-int/lit8 v2, v2, 0x1

    .line 223
    iget-object v3, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object v3, v3, v2

    if-nez v3, :cond_1

    .line 226
    invoke-virtual {p0}, Lorg/djvu/DLayoutSingle;->vLayout()V

    return v1

    :cond_1
    int-to-float v4, p1

    .line 230
    iget v5, v3, Lorg/djvu/DLayoutSingle$Cell;->left:F

    cmpg-float v5, v4, v5

    if-gez v5, :cond_2

    add-int/lit8 v2, v2, -0x1

    move p2, v2

    goto :goto_0

    .line 232
    :cond_2
    iget v0, v3, Lorg/djvu/DLayoutSingle$Cell;->right:F

    cmpl-float v0, v4, v0

    if-lez v0, :cond_3

    add-int/lit8 v0, v2, 0x1

    goto :goto_0

    .line 235
    :cond_3
    iget p1, v3, Lorg/djvu/DLayoutSingle$Cell;->pageno:I

    return p1

    :cond_4
    const/4 v0, 0x0

    :goto_1
    if-gt v0, p2, :cond_8

    add-int v2, v0, p2

    shr-int/lit8 v2, v2, 0x1

    .line 241
    iget-object v3, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object v3, v3, v2

    if-nez v3, :cond_5

    .line 244
    invoke-virtual {p0}, Lorg/djvu/DLayoutSingle;->vLayout()V

    return v1

    :cond_5
    int-to-float v4, p1

    .line 248
    iget v5, v3, Lorg/djvu/DLayoutSingle$Cell;->left:F

    cmpg-float v5, v4, v5

    if-gez v5, :cond_6

    add-int/lit8 v0, v2, 0x1

    goto :goto_1

    .line 250
    :cond_6
    iget p2, v3, Lorg/djvu/DLayoutSingle$Cell;->right:F

    cmpl-float p2, v4, p2

    if-lez p2, :cond_7

    add-int/lit8 v2, v2, -0x1

    move p2, v2

    goto :goto_1

    .line 253
    :cond_7
    iget p1, v3, Lorg/djvu/DLayoutSingle$Cell;->pageno:I

    return p1

    :cond_8
    if-gez p2, :cond_9

    return v1

    .line 261
    :cond_9
    iget-object p1, p0, Lorg/djvu/DLayoutSingle;->m_pages:[Lorg/djvu/VDPage;

    array-length p1, p1

    add-int/lit8 p1, p1, -0x1

    return p1

    :cond_a
    :goto_2
    const/4 p1, -0x1

    return p1
.end method

.method public vGotoPage(I)V
    .locals 3

    .line 352
    iget-object v0, p0, Lorg/djvu/DLayoutSingle;->m_pages:[Lorg/djvu/VDPage;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/djvu/DLayoutSingle;->m_doc:Lorg/djvu/DDocument;

    if-eqz v0, :cond_2

    iget v0, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    if-lez v0, :cond_2

    iget v0, p0, Lorg/djvu/DLayoutSingle;->m_h:I

    if-gtz v0, :cond_0

    goto :goto_1

    .line 353
    :cond_0
    invoke-virtual {p0}, Lorg/djvu/DLayoutSingle;->vScrollAbort()V

    const/4 v0, 0x0

    .line 355
    :goto_0
    iget-object v1, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    array-length v2, v1

    if-ge v0, v2, :cond_2

    .line 356
    aget-object v1, v1, v0

    .line 357
    iget v1, v1, Lorg/djvu/DLayoutSingle$Cell;->pageno:I

    if-ne p1, v1, :cond_1

    .line 358
    iget-object p1, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object p1, p1, v0

    iget p1, p1, Lorg/djvu/DLayoutSingle$Cell;->left:F

    .line 359
    iget-object v1, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object v0, v1, v0

    iget v0, v0, Lorg/djvu/DLayoutSingle$Cell;->right:F

    sub-float/2addr v0, p1

    .line 360
    iget v1, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    add-float/2addr p1, v0

    .line 361
    iget-object v0, p0, Lorg/djvu/DLayoutSingle;->m_scroller:Landroid/widget/Scroller;

    float-to-int p1, p1

    invoke-virtual {v0, p1}, Landroid/widget/Scroller;->setFinalX(I)V

    return-void

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method public vLayout()V
    .locals 8

    .line 133
    iget-object v0, p0, Lorg/djvu/DLayoutSingle;->m_doc:Lorg/djvu/DDocument;

    if-eqz v0, :cond_7

    iget v0, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    iget v1, p0, Lorg/djvu/DLayoutSingle;->m_page_gap:I

    if-le v0, v1, :cond_7

    iget v0, p0, Lorg/djvu/DLayoutSingle;->m_h:I

    iget v1, p0, Lorg/djvu/DLayoutSingle;->m_page_gap:I

    if-gt v0, v1, :cond_0

    goto/16 :goto_2

    .line 134
    :cond_0
    iget-object v0, p0, Lorg/djvu/DLayoutSingle;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {v0}, Lorg/djvu/DDocument;->GetPageCount()I

    move-result v0

    .line 137
    iget v1, p0, Lorg/djvu/DLayoutSingle;->m_page_maxw:F

    .line 138
    iget v2, p0, Lorg/djvu/DLayoutSingle;->m_page_maxh:F

    .line 140
    iget v3, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    iget v4, p0, Lorg/djvu/DLayoutSingle;->m_page_gap:I

    sub-int/2addr v3, v4

    const/4 v4, 0x1

    add-int/2addr v3, v4

    int-to-float v3, v3

    div-float/2addr v3, v1

    iput v3, p0, Lorg/djvu/DLayoutSingle;->m_scale_min:F

    .line 141
    iget v1, p0, Lorg/djvu/DLayoutSingle;->m_h:I

    iget v3, p0, Lorg/djvu/DLayoutSingle;->m_page_gap:I

    sub-int/2addr v1, v3

    int-to-float v1, v1

    const/high16 v3, 0x3f800000    # 1.0f

    add-float/2addr v1, v3

    div-float/2addr v1, v2

    .line 142
    iget v3, p0, Lorg/djvu/DLayoutSingle;->m_scale_min:F

    cmpl-float v3, v3, v1

    if-lez v3, :cond_1

    iput v1, p0, Lorg/djvu/DLayoutSingle;->m_scale_min:F

    .line 143
    :cond_1
    iget v1, p0, Lorg/djvu/DLayoutSingle;->m_scale_min:F

    iget v3, p0, Lorg/djvu/DLayoutSingle;->m_zoom_level:F

    mul-float v1, v1, v3

    iput v1, p0, Lorg/djvu/DLayoutSingle;->m_scale_max:F

    .line 144
    iget v1, p0, Lorg/djvu/DLayoutSingle;->m_scale:F

    iget v3, p0, Lorg/djvu/DLayoutSingle;->m_scale_min:F

    cmpg-float v1, v1, v3

    if-gez v1, :cond_2

    iget v1, p0, Lorg/djvu/DLayoutSingle;->m_scale_min:F

    iput v1, p0, Lorg/djvu/DLayoutSingle;->m_scale:F

    .line 145
    :cond_2
    iget v1, p0, Lorg/djvu/DLayoutSingle;->m_scale:F

    iget v3, p0, Lorg/djvu/DLayoutSingle;->m_scale_max:F

    cmpl-float v1, v1, v3

    if-lez v1, :cond_3

    iget v1, p0, Lorg/djvu/DLayoutSingle;->m_scale_max:F

    iput v1, p0, Lorg/djvu/DLayoutSingle;->m_scale:F

    .line 146
    :cond_3
    iget v1, p0, Lorg/djvu/DLayoutSingle;->m_scale:F

    mul-float v2, v2, v1

    float-to-int v1, v2

    iget v2, p0, Lorg/djvu/DLayoutSingle;->m_page_gap:I

    add-int/2addr v1, v2

    iput v1, p0, Lorg/djvu/DLayoutSingle;->m_th:I

    .line 147
    iget v1, p0, Lorg/djvu/DLayoutSingle;->m_th:I

    iget v2, p0, Lorg/djvu/DLayoutSingle;->m_h:I

    if-ge v1, v2, :cond_4

    iget v1, p0, Lorg/djvu/DLayoutSingle;->m_h:I

    iput v1, p0, Lorg/djvu/DLayoutSingle;->m_th:I

    .line 148
    :cond_4
    new-array v1, v0, [Lorg/djvu/DLayoutSingle$Cell;

    iput-object v1, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_5

    .line 184
    new-instance v3, Lorg/djvu/DLayoutSingle$Cell;

    invoke-direct {v3, p0}, Lorg/djvu/DLayoutSingle$Cell;-><init>(Lorg/djvu/DLayoutSingle;)V

    .line 185
    iput v2, v3, Lorg/djvu/DLayoutSingle$Cell;->pageno:I

    .line 186
    iget-object v5, p0, Lorg/djvu/DLayoutSingle;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {v5, v2}, Lorg/djvu/DDocument;->getPageX(I)I

    move-result v5

    int-to-float v5, v5

    iget v6, p0, Lorg/djvu/DLayoutSingle;->m_scale:F

    mul-float v5, v5, v6

    iput v5, v3, Lorg/djvu/DLayoutSingle$Cell;->left:F

    .line 187
    iget v5, v3, Lorg/djvu/DLayoutSingle$Cell;->left:F

    iget-object v6, p0, Lorg/djvu/DLayoutSingle;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {v6, v2}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v6

    iget v6, v6, Lorg/mydroid/core/codec/DjvuPageInfo;->width:I

    int-to-float v6, v6

    iget v7, p0, Lorg/djvu/DLayoutSingle;->m_scale:F

    mul-float v6, v6, v7

    add-float/2addr v5, v6

    iput v5, v3, Lorg/djvu/DLayoutSingle$Cell;->right:F

    .line 188
    iget-object v5, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aput-object v3, v5, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 190
    :cond_5
    iget-object v2, p0, Lorg/djvu/DLayoutSingle;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {v2, v0}, Lorg/djvu/DDocument;->getPageX(I)I

    move-result v2

    int-to-float v2, v2

    iget v3, p0, Lorg/djvu/DLayoutSingle;->m_scale:F

    mul-float v2, v2, v3

    float-to-int v2, v2

    iput v2, p0, Lorg/djvu/DLayoutSingle;->m_tw:I

    .line 192
    sget-boolean v2, Lcom/radaee/pdf/Global;->djvuRtol:Z

    if-eqz v2, :cond_7

    :goto_1
    if-ge v1, v0, :cond_6

    .line 195
    iget-object v2, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    aget-object v2, v2, v1

    .line 196
    iget v3, v2, Lorg/djvu/DLayoutSingle$Cell;->left:F

    .line 197
    iget v5, p0, Lorg/djvu/DLayoutSingle;->m_tw:I

    int-to-float v5, v5

    iget v6, v2, Lorg/djvu/DLayoutSingle$Cell;->right:F

    sub-float/2addr v5, v6

    iput v5, v2, Lorg/djvu/DLayoutSingle$Cell;->left:F

    .line 198
    iget v5, p0, Lorg/djvu/DLayoutSingle;->m_tw:I

    int-to-float v5, v5

    sub-float/2addr v5, v3

    iput v5, v2, Lorg/djvu/DLayoutSingle$Cell;->right:F

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 201
    :cond_6
    iget-boolean v0, p0, Lorg/djvu/DLayoutSingle;->m_rtol_init:Z

    if-nez v0, :cond_7

    .line 202
    iget-object v0, p0, Lorg/djvu/DLayoutSingle;->m_scroller:Landroid/widget/Scroller;

    iget v1, p0, Lorg/djvu/DLayoutSingle;->m_tw:I

    iget v2, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 203
    iput-boolean v4, p0, Lorg/djvu/DLayoutSingle;->m_rtol_init:Z

    :cond_7
    :goto_2
    return-void
.end method

.method public vMoveEnd()V
    .locals 9

    .line 303
    invoke-virtual {p0}, Lorg/djvu/DLayoutSingle;->vGetX()I

    move-result v0

    .line 304
    invoke-virtual {p0}, Lorg/djvu/DLayoutSingle;->vGetY()I

    move-result v1

    .line 306
    sget-boolean v2, Lcom/radaee/pdf/Global;->djvuRtol:Z

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_4

    const/4 v2, 0x0

    .line 307
    :goto_0
    iget-object v5, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    array-length v6, v5

    if-ge v2, v6, :cond_9

    .line 308
    aget-object v5, v5, v2

    int-to-float v6, v0

    .line 309
    iget v7, v5, Lorg/djvu/DLayoutSingle$Cell;->left:F

    cmpl-float v7, v6, v7

    if-ltz v7, :cond_3

    .line 310
    iget-object v7, p0, Lorg/djvu/DLayoutSingle;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v7}, Landroid/widget/Scroller;->abortAnimation()V

    .line 311
    iget-object v7, p0, Lorg/djvu/DLayoutSingle;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v7, v3}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 312
    iget v7, v5, Lorg/djvu/DLayoutSingle$Cell;->right:F

    iget v8, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float v8, v8

    sub-float/2addr v7, v8

    cmpg-float v7, v6, v7

    if-gtz v7, :cond_0

    goto/16 :goto_2

    .line 313
    :cond_0
    iget v7, v5, Lorg/djvu/DLayoutSingle$Cell;->right:F

    sub-float/2addr v7, v6

    iget v8, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    div-int/lit8 v8, v8, 0x2

    int-to-float v8, v8

    cmpl-float v7, v7, v8

    if-lez v7, :cond_1

    .line 314
    iget v2, v5, Lorg/djvu/DLayoutSingle$Cell;->right:F

    sub-float/2addr v2, v6

    iget v3, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-direct {p0, v0, v1, v2, v4}, Lorg/djvu/DLayoutSingle;->m_scrollerStartScroll(IIII)V

    return-void

    .line 315
    :cond_1
    iget-object v7, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    array-length v7, v7

    sub-int/2addr v7, v3

    if-ge v2, v7, :cond_2

    .line 316
    iget v2, v5, Lorg/djvu/DLayoutSingle$Cell;->right:F

    sub-float/2addr v2, v6

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-direct {p0, v0, v1, v2, v4}, Lorg/djvu/DLayoutSingle;->m_scrollerStartScroll(IIII)V

    return-void

    .line 318
    :cond_2
    iget v2, v5, Lorg/djvu/DLayoutSingle$Cell;->right:F

    sub-float/2addr v2, v6

    iget v3, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-direct {p0, v0, v1, v2, v4}, Lorg/djvu/DLayoutSingle;->m_scrollerStartScroll(IIII)V

    return-void

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    const/4 v2, 0x0

    .line 325
    :goto_1
    iget-object v5, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    array-length v6, v5

    if-ge v2, v6, :cond_9

    .line 326
    aget-object v5, v5, v2

    int-to-float v6, v0

    .line 327
    iget v7, v5, Lorg/djvu/DLayoutSingle$Cell;->right:F

    cmpg-float v7, v6, v7

    if-gez v7, :cond_8

    .line 328
    iget-object v7, p0, Lorg/djvu/DLayoutSingle;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v7}, Landroid/widget/Scroller;->abortAnimation()V

    .line 329
    iget-object v7, p0, Lorg/djvu/DLayoutSingle;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v7, v3}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 330
    iget v7, v5, Lorg/djvu/DLayoutSingle$Cell;->right:F

    iget v8, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float v8, v8

    sub-float/2addr v7, v8

    cmpg-float v7, v6, v7

    if-gtz v7, :cond_5

    goto :goto_2

    .line 331
    :cond_5
    iget v7, v5, Lorg/djvu/DLayoutSingle$Cell;->right:F

    sub-float/2addr v7, v6

    iget v8, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    div-int/lit8 v8, v8, 0x2

    int-to-float v8, v8

    cmpl-float v7, v7, v8

    if-lez v7, :cond_6

    .line 332
    iget v2, v5, Lorg/djvu/DLayoutSingle$Cell;->right:F

    sub-float/2addr v2, v6

    iget v3, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-direct {p0, v0, v1, v2, v4}, Lorg/djvu/DLayoutSingle;->m_scrollerStartScroll(IIII)V

    return-void

    .line 333
    :cond_6
    iget-object v7, p0, Lorg/djvu/DLayoutSingle;->m_cells:[Lorg/djvu/DLayoutSingle$Cell;

    array-length v7, v7

    sub-int/2addr v7, v3

    if-ge v2, v7, :cond_7

    .line 334
    iget v2, v5, Lorg/djvu/DLayoutSingle$Cell;->right:F

    sub-float/2addr v2, v6

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-direct {p0, v0, v1, v2, v4}, Lorg/djvu/DLayoutSingle;->m_scrollerStartScroll(IIII)V

    return-void

    .line 336
    :cond_7
    iget v2, v5, Lorg/djvu/DLayoutSingle$Cell;->right:F

    sub-float/2addr v2, v6

    iget v3, p0, Lorg/djvu/DLayoutSingle;->m_w:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-direct {p0, v0, v1, v2, v4}, Lorg/djvu/DLayoutSingle;->m_scrollerStartScroll(IIII)V

    return-void

    :cond_8
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_9
    :goto_2
    return-void
.end method

.method public vOpen(Lorg/djvu/DDocument;Lorg/djvu/DLayout$LayoutListener;)V
    .locals 0

    .line 26
    invoke-super {p0, p1, p2}, Lorg/djvu/DLayout;->vOpen(Lorg/djvu/DDocument;Lorg/djvu/DLayout$LayoutListener;)V

    return-void
.end method
