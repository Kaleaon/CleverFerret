.class public Lcom/radaee/view/PDFLayoutDual;
.super Lcom/radaee/view/PDFLayout;
.source "PDFLayoutDual.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/view/PDFLayoutDual$PDFCell;
    }
.end annotation


# instance fields
.field protected m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

.field private m_horz_dual:[Z

.field private m_page_align_top:Z

.field private m_rtol:Z

.field private m_rtol_init:Z

.field private m_vert_dual:[Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/radaee/view/PDFLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/radaee/view/PDFLayoutDual;->m_rtol:Z

    .line 13
    iput-boolean p1, p0, Lcom/radaee/view/PDFLayoutDual;->m_rtol_init:Z

    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Lcom/radaee/view/PDFLayoutDual;->m_page_align_top:Z

    return-void
.end method

.method private scrollerStartScroll(IIII)V
    .locals 6

    .line 41
    iget-object v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_scroller:Landroid/widget/Scroller;

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
.method protected do_scroll(IIII)V
    .locals 7

    int-to-float v0, p3

    const/high16 v1, 0x447a0000    # 1000.0f

    mul-float v0, v0, v1

    .line 34
    iget v2, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    int-to-float v2, v2

    div-float/2addr v0, v2

    int-to-float v2, p4

    mul-float v2, v2, v1

    .line 35
    iget v1, p0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    int-to-float v1, v1

    div-float/2addr v2, v1

    mul-float v0, v0, v0

    mul-float v2, v2, v2

    add-float/2addr v0, v2

    .line 36
    invoke-static {v0}, Lcom/radaee/pdf/Global;->sqrtf(F)F

    move-result v0

    float-to-int v0, v0

    invoke-static {v0}, Lcom/radaee/pdf/Global;->scrollDuration(I)I

    move-result v6

    .line 37
    iget-object v1, p0, Lcom/radaee/view/PDFLayoutDual;->m_scroller:Landroid/widget/Scroller;

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v1 .. v6}, Landroid/widget/Scroller;->startScroll(IIIII)V

    return-void
.end method

.method public vClose()V
    .locals 1

    .line 439
    invoke-super {p0}, Lcom/radaee/view/PDFLayout;->vClose()V

    const/4 v0, 0x0

    .line 440
    iput-boolean v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_rtol_init:Z

    return-void
.end method

.method public vFling(IIFFFF)Z
    .locals 3

    .line 47
    iget-object p1, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    const/4 p2, 0x0

    if-nez p1, :cond_0

    return p2

    .line 48
    :cond_0
    sget p1, Lcom/radaee/pdf/Global;->fling_speed:F

    mul-float p5, p5, p1

    .line 49
    sget p1, Lcom/radaee/pdf/Global;->fling_speed:F

    mul-float p6, p6, p1

    .line 50
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayoutDual;->vGetX()I

    move-result p1

    .line 51
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayoutDual;->vGetY()I

    move-result p3

    float-to-int p4, p5

    sub-int p4, p1, p4

    float-to-int p5, p6

    sub-int p5, p3, p5

    .line 54
    iget p6, p0, Lcom/radaee/view/PDFLayoutDual;->m_tw:I

    iget v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr p6, v0

    if-le p4, p6, :cond_1

    iget p4, p0, Lcom/radaee/view/PDFLayoutDual;->m_tw:I

    iget p6, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr p4, p6

    :cond_1
    if-gez p4, :cond_2

    const/4 p4, 0x0

    .line 56
    :cond_2
    iget p6, p0, Lcom/radaee/view/PDFLayoutDual;->m_th:I

    iget v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    sub-int/2addr p6, v0

    if-le p5, p6, :cond_3

    iget p5, p0, Lcom/radaee/view/PDFLayoutDual;->m_th:I

    iget p6, p0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    sub-int/2addr p5, p6

    :cond_3
    if-gez p5, :cond_4

    const/4 p5, 0x0

    .line 58
    :cond_4
    invoke-virtual {p0, p1}, Lcom/radaee/view/PDFLayoutDual;->vGetCell(I)I

    move-result p6

    .line 59
    invoke-virtual {p0, p4}, Lcom/radaee/view/PDFLayoutDual;->vGetCell(I)I

    move-result v0

    if-le v0, p6, :cond_5

    add-int/lit8 v0, p6, 0x1

    :cond_5
    if-ge v0, p6, :cond_6

    add-int/lit8 v0, p6, -0x1

    .line 62
    :cond_6
    iget-object v1, p0, Lcom/radaee/view/PDFLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->abortAnimation()V

    .line 63
    iget-object v1, p0, Lcom/radaee/view/PDFLayoutDual;->m_scroller:Landroid/widget/Scroller;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 65
    iget-boolean v1, p0, Lcom/radaee/view/PDFLayoutDual;->m_rtol:Z

    if-eqz v1, :cond_10

    if-le p6, v0, :cond_9

    if-gez v0, :cond_7

    .line 68
    iget-object p4, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object p4, p4, p2

    iget p4, p4, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    iget p5, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr p4, p5

    sub-int/2addr p4, p1

    invoke-virtual {p0, p1, p3, p4, p2}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_0

    .line 70
    :cond_7
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object p2, p2, p6

    .line 71
    iget p4, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    iget p6, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr p4, p6

    if-ge p1, p4, :cond_8

    .line 72
    iget p2, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    iget p4, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr p2, p4

    sub-int/2addr p2, p1

    sub-int/2addr p5, p3

    invoke-virtual {p0, p1, p3, p2, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_0

    .line 74
    :cond_8
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object p2, p2, v0

    iget p2, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    sub-int/2addr p2, p1

    sub-int/2addr p5, p3

    invoke-virtual {p0, p1, p3, p2, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_0

    :cond_9
    if-ge p6, v0, :cond_c

    .line 77
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    array-length p4, p2

    if-ne v0, p4, :cond_a

    neg-int p2, p1

    sub-int/2addr p5, p3

    .line 78
    invoke-virtual {p0, p1, p3, p2, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_0

    .line 80
    :cond_a
    aget-object p2, p2, p6

    .line 81
    iget p4, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    if-le p1, p4, :cond_b

    .line 82
    iget p2, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    sub-int/2addr p2, p1

    sub-int/2addr p5, p3

    invoke-virtual {p0, p1, p3, p2, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_0

    .line 84
    :cond_b
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object p2, p2, v0

    iget p2, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    iget p4, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr p2, p4

    sub-int/2addr p2, p1

    sub-int/2addr p5, p3

    invoke-virtual {p0, p1, p3, p2, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_0

    .line 87
    :cond_c
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object p2, p2, v0

    .line 88
    iget p6, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    add-int/2addr p6, p4

    iget v1, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    if-le p6, v1, :cond_f

    .line 89
    iget p6, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    shr-int/2addr p6, v2

    add-int/2addr p4, p6

    iget p2, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    if-le p4, p2, :cond_e

    add-int/lit8 p2, v0, -0x1

    if-gez p2, :cond_d

    .line 92
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object p2, p2, v0

    iget p2, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    sub-int/2addr p2, p1

    sub-int/2addr p5, p3

    invoke-virtual {p0, p1, p3, p2, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_0

    .line 94
    :cond_d
    iget-object p4, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object p2, p4, p2

    iget p2, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    iget p4, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr p2, p4

    sub-int/2addr p2, p1

    sub-int/2addr p5, p3

    invoke-virtual {p0, p1, p3, p2, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_0

    .line 96
    :cond_e
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object p2, p2, v0

    iget p2, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    iget p4, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr p2, p4

    sub-int/2addr p2, p1

    sub-int/2addr p5, p3

    invoke-virtual {p0, p1, p3, p2, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_0

    :cond_f
    sub-int/2addr p4, p1

    sub-int/2addr p5, p3

    .line 98
    invoke-virtual {p0, p1, p3, p4, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_0

    :cond_10
    if-ge p6, v0, :cond_13

    .line 103
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    array-length p4, p2

    if-ne v0, p4, :cond_11

    sub-int/2addr v0, v2

    .line 104
    aget-object p2, p2, v0

    iget p2, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    iget p4, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr p2, p4

    sub-int/2addr p2, p1

    sub-int/2addr p5, p3

    invoke-virtual {p0, p1, p3, p2, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_0

    .line 106
    :cond_11
    aget-object p2, p2, p6

    .line 107
    iget p4, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    iget p6, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr p4, p6

    if-ge p1, p4, :cond_12

    .line 108
    iget p2, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    iget p4, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr p2, p4

    sub-int/2addr p2, p1

    sub-int/2addr p5, p3

    invoke-virtual {p0, p1, p3, p2, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_0

    .line 110
    :cond_12
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object p2, p2, v0

    iget p2, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    sub-int/2addr p2, p1

    sub-int/2addr p5, p3

    invoke-virtual {p0, p1, p3, p2, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto/16 :goto_0

    :cond_13
    if-le p6, v0, :cond_16

    if-gez v0, :cond_14

    neg-int p4, p1

    .line 114
    invoke-virtual {p0, p1, p3, p4, p2}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto :goto_0

    .line 116
    :cond_14
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object p2, p2, p6

    .line 117
    iget p4, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    if-le p1, p4, :cond_15

    .line 118
    iget p2, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    sub-int/2addr p2, p1

    sub-int/2addr p5, p3

    invoke-virtual {p0, p1, p3, p2, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto :goto_0

    .line 120
    :cond_15
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object p2, p2, v0

    iget p2, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    iget p4, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr p2, p4

    sub-int/2addr p2, p1

    sub-int/2addr p5, p3

    invoke-virtual {p0, p1, p3, p2, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto :goto_0

    .line 123
    :cond_16
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object p2, p2, v0

    .line 124
    iget p6, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    add-int/2addr p6, p4

    iget v1, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    if-le p6, v1, :cond_19

    .line 125
    iget p6, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    shr-int/2addr p6, v2

    add-int/2addr p4, p6

    iget p2, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    if-le p4, p2, :cond_18

    add-int/lit8 p2, v0, 0x1

    .line 127
    iget-object p4, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    array-length p6, p4

    if-ne p2, p6, :cond_17

    .line 128
    aget-object p2, p4, v0

    iget p2, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    iget p4, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr p2, p4

    sub-int/2addr p2, p1

    sub-int/2addr p5, p3

    invoke-virtual {p0, p1, p3, p2, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto :goto_0

    .line 130
    :cond_17
    aget-object p2, p4, p2

    iget p2, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    sub-int/2addr p2, p1

    sub-int/2addr p5, p3

    invoke-virtual {p0, p1, p3, p2, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto :goto_0

    .line 132
    :cond_18
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object p2, p2, v0

    iget p2, p2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    iget p4, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr p2, p4

    sub-int/2addr p2, p1

    sub-int/2addr p5, p3

    invoke-virtual {p0, p1, p3, p2, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    goto :goto_0

    :cond_19
    sub-int/2addr p4, p1

    sub-int/2addr p5, p3

    .line 134
    invoke-virtual {p0, p1, p3, p4, p5}, Lcom/radaee/view/PDFLayoutDual;->do_scroll(IIII)V

    :goto_0
    return v2
.end method

.method protected vGetCell(I)I
    .locals 6

    .line 508
    iget-object v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    const/4 v1, -0x1

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    array-length v0, v0

    if-lez v0, :cond_8

    iget-object v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    if-nez v0, :cond_0

    goto :goto_2

    .line 510
    :cond_0
    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    .line 511
    iget-boolean v2, p0, Lcom/radaee/view/PDFLayoutDual;->m_rtol:Z

    const/4 v3, 0x0

    if-nez v2, :cond_3

    :goto_0
    if-gt v3, v0, :cond_6

    add-int v2, v3, v0

    shr-int/lit8 v2, v2, 0x1

    .line 516
    iget-object v4, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object v4, v4, v2

    .line 517
    iget v5, v4, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    if-ge p1, v5, :cond_1

    add-int/lit8 v2, v2, -0x1

    move v0, v2

    goto :goto_0

    .line 521
    :cond_1
    iget v3, v4, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    if-le p1, v3, :cond_2

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

    .line 536
    iget-object v4, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object v4, v4, v2

    .line 537
    iget v5, v4, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    if-ge p1, v5, :cond_4

    add-int/lit8 v2, v2, 0x1

    move v3, v2

    goto :goto_1

    .line 541
    :cond_4
    iget v0, v4, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    if-le p1, v0, :cond_5

    add-int/lit8 v2, v2, -0x1

    move v0, v2

    goto :goto_1

    :cond_5
    return v2

    :cond_6
    if-gez v0, :cond_7

    return v1

    .line 552
    :cond_7
    iget-object p1, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    array-length p1, p1

    return p1

    :cond_8
    :goto_2
    return v1
.end method

.method public vGetPage(II)I
    .locals 5

    .line 445
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    if-eqz p2, :cond_a

    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    array-length p2, p2

    if-lez p2, :cond_a

    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    if-nez p2, :cond_0

    goto/16 :goto_2

    .line 447
    :cond_0
    array-length p2, p2

    add-int/lit8 p2, p2, -0x1

    .line 448
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayoutDual;->vGetX()I

    move-result v0

    add-int/2addr p1, v0

    .line 449
    iget-boolean v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_rtol:Z

    const/4 v1, 0x0

    if-nez v0, :cond_4

    const/4 v0, 0x0

    :goto_0
    if-gt v0, p2, :cond_8

    add-int v2, v0, p2

    shr-int/lit8 v2, v2, 0x1

    .line 454
    iget-object v3, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object v3, v3, v2

    .line 455
    iget v4, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    if-ge p1, v4, :cond_1

    add-int/lit8 v2, v2, -0x1

    move p2, v2

    goto :goto_0

    .line 459
    :cond_1
    iget v0, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    if-le p1, v0, :cond_2

    add-int/lit8 v0, v2, 0x1

    goto :goto_0

    .line 465
    :cond_2
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    iget v0, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_left:I

    aget-object p2, p2, v0

    .line 466
    iget v0, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_right:I

    if-ltz v0, :cond_3

    invoke-virtual {p2}, Lcom/radaee/view/VPage;->GetX()I

    move-result v0

    invoke-virtual {p2}, Lcom/radaee/view/VPage;->GetWidth()I

    move-result p2

    add-int/2addr v0, p2

    if-le p1, v0, :cond_3

    .line 467
    iget p1, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_right:I

    return p1

    .line 469
    :cond_3
    iget p1, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_left:I

    return p1

    :cond_4
    const/4 v0, 0x0

    :goto_1
    if-gt v0, p2, :cond_8

    add-int v2, v0, p2

    shr-int/lit8 v2, v2, 0x1

    .line 478
    iget-object v3, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object v3, v3, v2

    .line 479
    iget v4, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    if-ge p1, v4, :cond_5

    add-int/lit8 v0, v2, 0x1

    goto :goto_1

    .line 483
    :cond_5
    iget p2, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    if-le p1, p2, :cond_6

    add-int/lit8 v2, v2, -0x1

    move p2, v2

    goto :goto_1

    .line 489
    :cond_6
    iget-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    iget v0, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_left:I

    aget-object p2, p2, v0

    .line 490
    iget v0, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_right:I

    if-ltz v0, :cond_7

    invoke-virtual {p2}, Lcom/radaee/view/VPage;->GetX()I

    move-result v0

    invoke-virtual {p2}, Lcom/radaee/view/VPage;->GetWidth()I

    move-result p2

    add-int/2addr v0, p2

    if-le p1, v0, :cond_7

    .line 491
    iget p1, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_right:I

    return p1

    .line 493
    :cond_7
    iget p1, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_left:I

    return p1

    :cond_8
    if-gez p2, :cond_9

    return v1

    .line 503
    :cond_9
    iget-object p1, p0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

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

    .line 622
    iget-object v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    if-lez v0, :cond_3

    iget v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    if-lez v0, :cond_3

    if-ltz p1, :cond_3

    iget-object v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    array-length v0, v0

    if-lt p1, v0, :cond_0

    goto :goto_2

    .line 624
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayoutDual;->vScrollAbort()V

    const/4 v0, 0x0

    .line 626
    :goto_0
    iget-object v1, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    array-length v2, v1

    if-ge v0, v2, :cond_3

    .line 628
    aget-object v1, v1, v0

    .line 629
    iget v2, v1, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_left:I

    if-eq p1, v2, :cond_2

    iget v1, v1, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_right:I

    if-ne p1, v1, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 631
    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object p1, p1, v0

    iget p1, p1, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    .line 632
    iget-object v1, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object v0, v1, v0

    iget v0, v0, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    sub-int/2addr v0, p1

    .line 633
    iget v1, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    add-int/2addr p1, v0

    .line 634
    iget-object v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, p1}, Landroid/widget/Scroller;->setFinalX(I)V

    :cond_3
    :goto_2
    return-void
.end method

.method public vLayout()V
    .locals 17

    move-object/from16 v0, p0

    .line 143
    iget-object v1, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v1, :cond_51

    iget v1, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    iget v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    if-le v1, v2, :cond_51

    iget v1, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    iget v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    if-gt v1, v2, :cond_0

    goto/16 :goto_24

    .line 145
    :cond_0
    iget-object v1, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v1}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v1

    .line 150
    iget v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale:F

    .line 151
    sget-boolean v3, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v3, :cond_1

    iget-object v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    if-nez v3, :cond_1

    new-array v3, v1, [F

    iput-object v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    .line 152
    :cond_1
    sget-boolean v3, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v3, :cond_2

    iget-object v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales_min:[F

    if-nez v3, :cond_2

    new-array v3, v1, [F

    iput-object v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales_min:[F

    .line 153
    :cond_2
    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    iget v4, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    if-le v3, v4, :cond_3

    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    goto :goto_0

    :cond_3
    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    .line 154
    :goto_0
    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    iget v4, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    const/4 v6, 0x0

    if-le v3, v4, :cond_24

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    :goto_1
    if-ge v3, v1, :cond_11

    .line 158
    iget-object v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_vert_dual:[Z

    if-eqz v11, :cond_c

    array-length v12, v11

    if-ge v10, v12, :cond_c

    aget-boolean v11, v11, v10

    if-eqz v11, :cond_c

    add-int/lit8 v11, v1, -0x1

    if-ge v3, v11, :cond_c

    .line 160
    iget-object v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v11, v3}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v11

    iget-object v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v13, v3, 0x1

    invoke-virtual {v12, v13}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v12

    add-float/2addr v11, v12

    cmpg-float v12, v4, v11

    if-gez v12, :cond_4

    move v4, v11

    .line 162
    :cond_4
    iget-object v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v12, v3}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v12

    cmpg-float v14, v9, v12

    if-gez v14, :cond_5

    move v9, v12

    .line 164
    :cond_5
    iget-object v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v12, v13}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v12

    cmpg-float v14, v9, v12

    if-gez v14, :cond_6

    move v9, v12

    .line 166
    :cond_6
    sget-boolean v12, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v12, :cond_b

    .line 167
    iget-object v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v12, v12, v3

    cmpl-float v12, v12, v6

    if-nez v12, :cond_9

    .line 168
    iget v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    iget v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    sub-int/2addr v12, v14

    int-to-float v12, v12

    div-float/2addr v12, v11

    .line 169
    iget v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    iget v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    sub-int/2addr v11, v14

    int-to-float v11, v11

    iget-object v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v14, v3}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v14

    div-float/2addr v11, v14

    cmpl-float v14, v12, v11

    if-lez v14, :cond_7

    move v12, v11

    .line 171
    :cond_7
    iget-object v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aput v12, v11, v3

    .line 172
    iget-object v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales_min:[F

    aput v12, v11, v3

    .line 174
    iget v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    iget v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    sub-int/2addr v11, v14

    int-to-float v11, v11

    iget-object v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v14, v13}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v14

    div-float/2addr v11, v14

    cmpl-float v14, v12, v11

    if-lez v14, :cond_8

    move v12, v11

    .line 176
    :cond_8
    iget-object v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aput v12, v11, v13

    .line 177
    iget-object v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales_min:[F

    aput v12, v11, v13

    .line 179
    :cond_9
    iget-object v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v11, v11, v3

    cmpg-float v11, v2, v11

    if-gez v11, :cond_a

    iget-object v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v2, v2, v3

    .line 180
    :cond_a
    iget-object v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v11, v11, v13

    cmpg-float v11, v2, v11

    if-gez v11, :cond_b

    iget-object v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v2, v2, v13

    :cond_b
    add-int/lit8 v3, v3, 0x2

    goto :goto_2

    .line 186
    :cond_c
    iget-object v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v11, v3}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v11

    cmpg-float v12, v4, v11

    if-gez v12, :cond_d

    move v4, v11

    .line 188
    :cond_d
    iget-object v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v12, v3}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v12

    cmpg-float v13, v9, v12

    if-gez v13, :cond_e

    move v9, v12

    .line 190
    :cond_e
    sget-boolean v12, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v12, :cond_10

    .line 191
    iget-object v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v12, v12, v3

    cmpl-float v12, v12, v6

    if-nez v12, :cond_f

    .line 192
    iget-object v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    iget v13, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    iget v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    sub-int/2addr v13, v14

    int-to-float v13, v13

    div-float/2addr v13, v11

    aput v13, v12, v3

    .line 193
    iget-object v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales_min:[F

    iget v13, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    iget v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    sub-int/2addr v13, v14

    int-to-float v13, v13

    div-float/2addr v13, v11

    aput v13, v12, v3

    .line 195
    :cond_f
    iget-object v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v11, v11, v3

    cmpg-float v11, v2, v11

    if-gez v11, :cond_10

    iget-object v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v2, v2, v3

    :cond_10
    add-int/lit8 v3, v3, 0x1

    :goto_2
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_1

    .line 201
    :cond_11
    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    iget v6, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    sub-int/2addr v3, v6

    int-to-float v3, v3

    div-float/2addr v3, v4

    iput v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_min:F

    .line 202
    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    iget v4, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    div-float/2addr v3, v9

    .line 203
    iget v4, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_min:F

    cmpl-float v4, v4, v3

    if-lez v4, :cond_12

    iput v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_min:F

    .line 204
    :cond_12
    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_min:F

    iget v4, v0, Lcom/radaee/view/PDFLayoutDual;->m_zoom_level:F

    mul-float v3, v3, v4

    iput v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_max:F

    .line 205
    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale:F

    iget v4, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_min:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_13

    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_min:F

    iput v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale:F

    .line 206
    :cond_13
    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale:F

    iget v4, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_max:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_14

    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_max:F

    iput v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale:F

    .line 207
    :cond_14
    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale:F

    iget v4, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_min:F

    div-float/2addr v3, v4

    iget v4, v0, Lcom/radaee/view/PDFLayoutDual;->m_zoom_level_clip:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_15

    const/4 v3, 0x1

    goto :goto_3

    :cond_15
    const/4 v3, 0x0

    .line 208
    :goto_3
    sget-boolean v4, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-nez v4, :cond_16

    iget v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale:F

    .line 209
    :cond_16
    sget-boolean v4, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v4, :cond_17

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayoutDual;->vGetScale()F

    move-result v4

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayoutDual;->vGetMinScale()F

    move-result v6

    cmpl-float v4, v4, v6

    if-nez v4, :cond_17

    iget v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    goto :goto_4

    :cond_17
    mul-float v9, v9, v2

    float-to-int v2, v9

    iget v4, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    add-int/2addr v2, v4

    :goto_4
    iput v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_th:I

    .line 210
    iget v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_th:I

    iget v4, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    if-ge v2, v4, :cond_18

    iget v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    iput v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_th:I

    .line 211
    :cond_18
    new-array v2, v10, [Lcom/radaee/view/PDFLayoutDual$PDFCell;

    iput-object v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    :goto_5
    if-ge v2, v10, :cond_23

    .line 217
    new-instance v9, Lcom/radaee/view/PDFLayoutDual$PDFCell;

    invoke-direct {v9}, Lcom/radaee/view/PDFLayoutDual$PDFCell;-><init>()V

    .line 220
    sget-boolean v11, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v11, :cond_1a

    iget-object v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v11, v11, v6

    iget-object v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales_min:[F

    aget v12, v12, v6

    div-float/2addr v11, v12

    iget v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_zoom_level_clip:F

    cmpl-float v11, v11, v12

    if-lez v11, :cond_19

    const/4 v11, 0x1

    goto :goto_6

    :cond_19
    const/4 v11, 0x0

    goto :goto_6

    :cond_1a
    move v11, v3

    .line 221
    :goto_6
    sget-boolean v12, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v12, :cond_1b

    iget-object v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v12, v12, v6

    goto :goto_7

    :cond_1b
    iget v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale:F

    .line 222
    :goto_7
    iget-object v13, v0, Lcom/radaee/view/PDFLayoutDual;->m_vert_dual:[Z

    if-eqz v13, :cond_20

    array-length v14, v13

    if-ge v2, v14, :cond_20

    aget-boolean v13, v13, v2

    if-eqz v13, :cond_20

    add-int/lit8 v13, v1, -0x1

    if-ge v6, v13, :cond_20

    .line 224
    sget-boolean v13, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v13, :cond_1c

    iget-object v13, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    add-int/lit8 v14, v6, 0x1

    aget v13, v13, v14

    goto :goto_8

    :cond_1c
    iget v13, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale:F

    .line 225
    :goto_8
    sget-boolean v14, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v14, :cond_1d

    iget-object v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v14, v6}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v14

    mul-float v14, v14, v12

    iget-object v15, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v7, v6, 0x1

    invoke-virtual {v15, v7}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v7

    mul-float v7, v7, v13

    add-float/2addr v14, v7

    float-to-int v7, v14

    goto :goto_9

    .line 226
    :cond_1d
    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v6}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v7

    iget-object v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v15, v6, 0x1

    invoke-virtual {v14, v15}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v14

    add-float/2addr v7, v14

    mul-float v7, v7, v12

    float-to-int v7, v7

    .line 227
    :goto_9
    iget v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    add-int/2addr v14, v7

    iget v15, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    if-ge v14, v15, :cond_1e

    iget v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    goto :goto_a

    .line 228
    :cond_1e
    iget v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    add-int/2addr v14, v7

    .line 229
    :goto_a
    iput v6, v9, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_left:I

    add-int/lit8 v15, v6, 0x1

    .line 230
    iput v15, v9, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_right:I

    .line 231
    iput v4, v9, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    add-int v8, v4, v14

    .line 232
    iput v8, v9, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    .line 233
    iget-boolean v8, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_align_top:Z

    if-eqz v8, :cond_1f

    .line 235
    iget-object v8, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v8, v8, v6

    sub-int v7, v14, v7

    div-int/lit8 v7, v7, 0x2

    add-int/2addr v7, v4

    iget v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    div-int/lit8 v5, v5, 0x2

    invoke-virtual {v8, v7, v5, v12, v11}, Lcom/radaee/view/VPage;->vLayout(IIFZ)V

    .line 236
    iget-object v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v5, v5, v15

    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v7, v7, v6

    invoke-virtual {v7}, Lcom/radaee/view/VPage;->GetX()I

    move-result v7

    iget-object v8, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v8, v8, v6

    invoke-virtual {v8}, Lcom/radaee/view/VPage;->GetWidth()I

    move-result v8

    add-int/2addr v7, v8

    iget v8, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    div-int/lit8 v8, v8, 0x2

    invoke-virtual {v5, v7, v8, v13, v11}, Lcom/radaee/view/VPage;->vLayout(IIFZ)V

    move/from16 v16, v2

    goto :goto_b

    .line 240
    :cond_1f
    iget-object v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v5, v5, v6

    sub-int v7, v14, v7

    div-int/lit8 v7, v7, 0x2

    add-int/2addr v7, v4

    iget v8, v0, Lcom/radaee/view/PDFLayoutDual;->m_th:I

    int-to-float v8, v8

    move/from16 v16, v2

    iget-object v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v2, v6}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v2

    mul-float v2, v2, v12

    sub-float/2addr v8, v2

    float-to-int v2, v8

    div-int/lit8 v2, v2, 0x2

    invoke-virtual {v5, v7, v2, v12, v11}, Lcom/radaee/view/VPage;->vLayout(IIFZ)V

    .line 241
    iget-object v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v2, v2, v15

    iget-object v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v5, v5, v6

    invoke-virtual {v5}, Lcom/radaee/view/VPage;->GetX()I

    move-result v5

    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v7, v7, v6

    invoke-virtual {v7}, Lcom/radaee/view/VPage;->GetWidth()I

    move-result v7

    add-int/2addr v5, v7

    iget v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_th:I

    int-to-float v7, v7

    iget-object v8, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v8, v15}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v8

    mul-float v8, v8, v13

    sub-float/2addr v7, v8

    float-to-int v7, v7

    div-int/lit8 v7, v7, 0x2

    invoke-virtual {v2, v5, v7, v13, v11}, Lcom/radaee/view/VPage;->vLayout(IIFZ)V

    :goto_b
    add-int/lit8 v6, v6, 0x2

    goto :goto_e

    :cond_20
    move/from16 v16, v2

    .line 247
    iget-object v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v2, v6}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v2

    mul-float v2, v2, v12

    float-to-int v2, v2

    .line 248
    iget v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    add-int/2addr v5, v2

    iget v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    if-ge v5, v7, :cond_21

    iget v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    goto :goto_c

    .line 249
    :cond_21
    iget v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    add-int/2addr v5, v2

    :goto_c
    move v14, v5

    .line 250
    iput v6, v9, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_left:I

    const/4 v5, -0x1

    .line 251
    iput v5, v9, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_right:I

    .line 252
    iput v4, v9, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    add-int v5, v4, v14

    .line 253
    iput v5, v9, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    .line 254
    iget-boolean v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_align_top:Z

    if-eqz v5, :cond_22

    .line 255
    iget-object v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v5, v5, v6

    sub-int v2, v14, v2

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v4

    iget v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    div-int/lit8 v7, v7, 0x2

    invoke-virtual {v5, v2, v7, v12, v11}, Lcom/radaee/view/VPage;->vLayout(IIFZ)V

    goto :goto_d

    .line 258
    :cond_22
    iget-object v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v5, v5, v6

    sub-int v2, v14, v2

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v4

    iget v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_th:I

    int-to-float v7, v7

    iget-object v8, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v8, v6}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v8

    mul-float v8, v8, v12

    sub-float/2addr v7, v8

    float-to-int v7, v7

    div-int/lit8 v7, v7, 0x2

    invoke-virtual {v5, v2, v7, v12, v11}, Lcom/radaee/view/VPage;->vLayout(IIFZ)V

    :goto_d
    add-int/lit8 v6, v6, 0x1

    :goto_e
    add-int/2addr v4, v14

    .line 263
    iget-object v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aput-object v9, v2, v16

    add-int/lit8 v2, v16, 0x1

    goto/16 :goto_5

    .line 266
    :cond_23
    iput v4, v0, Lcom/radaee/view/PDFLayoutDual;->m_tw:I

    goto/16 :goto_21

    :cond_24
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v10, 0x0

    :goto_f
    if-ge v2, v1, :cond_37

    .line 272
    iget-object v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_horz_dual:[Z

    if-eqz v5, :cond_25

    array-length v7, v5

    if-lt v10, v7, :cond_2a

    :cond_25
    if-nez v2, :cond_2a

    .line 274
    iget-object v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v5, v2}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v5

    cmpg-float v7, v3, v5

    if-gez v7, :cond_26

    move v3, v5

    .line 276
    :cond_26
    iget-object v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v5, v2}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v5

    cmpg-float v7, v4, v5

    if-gez v7, :cond_27

    move v4, v5

    .line 278
    :cond_27
    sget-boolean v7, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v7, :cond_29

    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v7, v7, v2

    cmpl-float v7, v7, v6

    if-eqz v7, :cond_28

    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v7, v7, v2

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_29

    .line 279
    :cond_28
    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    iget v8, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    iget v9, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    sub-int/2addr v8, v9

    int-to-float v8, v8

    div-float/2addr v8, v5

    aput v8, v7, v2

    .line 280
    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales_min:[F

    iget v8, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    iget v9, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    sub-int/2addr v8, v9

    int-to-float v8, v8

    div-float/2addr v8, v5

    aput v8, v7, v2

    :cond_29
    :goto_10
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_11

    :cond_2a
    if-eqz v5, :cond_2b

    .line 285
    array-length v7, v5

    if-ge v10, v7, :cond_2b

    aget-boolean v5, v5, v10

    if-eqz v5, :cond_33

    :cond_2b
    add-int/lit8 v5, v1, -0x1

    if-ge v2, v5, :cond_33

    .line 287
    iget-object v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v5, v2}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v5

    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v8, v2, 0x1

    invoke-virtual {v7, v8}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v7

    add-float/2addr v5, v7

    cmpg-float v7, v3, v5

    if-gez v7, :cond_2c

    move v3, v5

    .line 289
    :cond_2c
    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v2}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v7

    cmpg-float v9, v4, v7

    if-gez v9, :cond_2d

    move v4, v7

    .line 291
    :cond_2d
    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v8}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v7

    cmpg-float v9, v4, v7

    if-gez v9, :cond_2e

    move v4, v7

    .line 293
    :cond_2e
    sget-boolean v7, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v7, :cond_32

    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v7, v7, v2

    cmpl-float v7, v7, v6

    if-eqz v7, :cond_2f

    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v7, v7, v2

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_32

    .line 294
    :cond_2f
    iget v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    iget v9, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    sub-int/2addr v7, v9

    int-to-float v7, v7

    div-float/2addr v7, v5

    .line 295
    iget v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    iget v9, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    sub-int/2addr v5, v9

    int-to-float v5, v5

    iget-object v9, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v9, v2}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v9

    div-float/2addr v5, v9

    cmpl-float v9, v7, v5

    if-lez v9, :cond_30

    move v7, v5

    .line 297
    :cond_30
    iget-object v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aput v7, v5, v2

    .line 298
    iget-object v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales_min:[F

    aput v7, v5, v2

    .line 300
    iget v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    iget v9, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    sub-int/2addr v5, v9

    int-to-float v5, v5

    iget-object v9, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v9, v8}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v9

    div-float/2addr v5, v9

    cmpl-float v9, v7, v5

    if-lez v9, :cond_31

    move v7, v5

    .line 302
    :cond_31
    iget-object v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aput v7, v5, v8

    .line 303
    iget-object v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales_min:[F

    aput v7, v5, v8

    :cond_32
    add-int/lit8 v2, v2, 0x2

    goto :goto_11

    .line 309
    :cond_33
    iget-object v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v5, v2}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v5

    cmpg-float v7, v3, v5

    if-gez v7, :cond_34

    move v3, v5

    .line 311
    :cond_34
    iget-object v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v5, v2}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v5

    cmpg-float v7, v4, v5

    if-gez v7, :cond_35

    move v4, v5

    .line 313
    :cond_35
    sget-boolean v7, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v7, :cond_29

    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v7, v7, v2

    cmpl-float v7, v7, v6

    if-eqz v7, :cond_36

    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v7, v7, v2

    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_29

    .line 314
    :cond_36
    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    iget v8, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    iget v9, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    sub-int/2addr v8, v9

    int-to-float v8, v8

    div-float/2addr v8, v5

    aput v8, v7, v2

    .line 315
    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales_min:[F

    iget v8, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    iget v9, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    sub-int/2addr v8, v9

    int-to-float v8, v8

    div-float/2addr v8, v5

    aput v8, v7, v2

    goto/16 :goto_10

    :goto_11
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_f

    .line 321
    :cond_37
    iget v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    iget v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    sub-int/2addr v2, v5

    int-to-float v2, v2

    div-float/2addr v2, v3

    iput v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_min:F

    .line 322
    iget v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    sub-int/2addr v2, v3

    int-to-float v2, v2

    div-float/2addr v2, v4

    .line 323
    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_min:F

    cmpl-float v3, v3, v2

    if-lez v3, :cond_38

    iput v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_min:F

    .line 324
    :cond_38
    iget v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_min:F

    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_zoom_level:F

    mul-float v2, v2, v3

    iput v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_max:F

    .line 325
    iget v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale:F

    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_min:F

    cmpg-float v2, v2, v3

    if-gez v2, :cond_39

    iget v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_min:F

    iput v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale:F

    .line 326
    :cond_39
    iget v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale:F

    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_max:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_3a

    iget v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_max:F

    iput v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale:F

    .line 327
    :cond_3a
    iget v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale:F

    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale_min:F

    div-float/2addr v2, v3

    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_zoom_level_clip:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_3b

    const/4 v2, 0x1

    goto :goto_12

    :cond_3b
    const/4 v2, 0x0

    .line 328
    :goto_12
    sget-boolean v3, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v3, :cond_3c

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayoutDual;->vGetScale()F

    move-result v3

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayoutDual;->vGetMinScale()F

    move-result v5

    cmpl-float v3, v3, v5

    if-nez v3, :cond_3c

    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    goto :goto_13

    :cond_3c
    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale:F

    mul-float v4, v4, v3

    float-to-int v3, v4

    iget v4, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    add-int/2addr v3, v4

    :goto_13
    iput v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_th:I

    .line 329
    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_th:I

    iget v4, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    if-ge v3, v4, :cond_3d

    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    iput v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_th:I

    .line 330
    :cond_3d
    new-array v3, v10, [Lcom/radaee/view/PDFLayoutDual$PDFCell;

    iput-object v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_14
    if-ge v3, v10, :cond_4d

    .line 336
    new-instance v6, Lcom/radaee/view/PDFLayoutDual$PDFCell;

    invoke-direct {v6}, Lcom/radaee/view/PDFLayoutDual$PDFCell;-><init>()V

    .line 339
    sget-boolean v7, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v7, :cond_3f

    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v7, v7, v5

    iget-object v8, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales_min:[F

    aget v8, v8, v5

    div-float/2addr v7, v8

    iget v8, v0, Lcom/radaee/view/PDFLayoutDual;->m_zoom_level_clip:F

    cmpl-float v7, v7, v8

    if-lez v7, :cond_3e

    const/4 v7, 0x1

    goto :goto_15

    :cond_3e
    const/4 v7, 0x0

    goto :goto_15

    :cond_3f
    move v7, v2

    .line 340
    :goto_15
    sget-boolean v8, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v8, :cond_40

    iget-object v8, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    aget v8, v8, v5

    goto :goto_16

    :cond_40
    iget v8, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale:F

    .line 341
    :goto_16
    iget-object v9, v0, Lcom/radaee/view/PDFLayoutDual;->m_horz_dual:[Z

    if-eqz v9, :cond_41

    array-length v11, v9

    if-lt v3, v11, :cond_44

    :cond_41
    if-nez v5, :cond_44

    .line 343
    iget-object v9, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v9, v5}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v9

    mul-float v9, v9, v8

    float-to-int v9, v9

    .line 344
    iget v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    add-int/2addr v11, v9

    iget v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    if-ge v11, v12, :cond_42

    iget v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    goto :goto_17

    .line 345
    :cond_42
    iget v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    add-int/2addr v11, v9

    .line 346
    :goto_17
    iput v5, v6, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_left:I

    const/4 v12, -0x1

    .line 347
    iput v12, v6, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_right:I

    .line 348
    iput v4, v6, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    add-int v12, v4, v11

    .line 349
    iput v12, v6, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    .line 350
    iget-boolean v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_align_top:Z

    if-eqz v12, :cond_43

    .line 352
    iget-object v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v12, v12, v5

    sub-int v9, v11, v9

    div-int/lit8 v9, v9, 0x2

    add-int/2addr v9, v4

    iget v13, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    div-int/lit8 v13, v13, 0x2

    invoke-virtual {v12, v9, v13, v8, v7}, Lcom/radaee/view/VPage;->vLayout(IIFZ)V

    goto :goto_18

    .line 355
    :cond_43
    iget-object v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v12, v12, v5

    sub-int v9, v11, v9

    div-int/lit8 v9, v9, 0x2

    add-int/2addr v9, v4

    iget v13, v0, Lcom/radaee/view/PDFLayoutDual;->m_th:I

    int-to-float v13, v13

    iget-object v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v14, v5}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v14

    mul-float v14, v14, v8

    sub-float/2addr v13, v14

    float-to-int v13, v13

    div-int/lit8 v13, v13, 0x2

    invoke-virtual {v12, v9, v13, v8, v7}, Lcom/radaee/view/VPage;->vLayout(IIFZ)V

    :goto_18
    add-int/lit8 v5, v5, 0x1

    :goto_19
    const/4 v12, -0x1

    goto/16 :goto_20

    :cond_44
    if-eqz v9, :cond_45

    .line 359
    array-length v11, v9

    if-ge v3, v11, :cond_45

    aget-boolean v9, v9, v3

    if-eqz v9, :cond_4a

    :cond_45
    add-int/lit8 v9, v1, -0x1

    if-ge v5, v9, :cond_4a

    .line 361
    sget-boolean v7, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v7, :cond_46

    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_scales:[F

    add-int/lit8 v9, v5, 0x1

    aget v7, v7, v9

    goto :goto_1a

    :cond_46
    iget v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_scale:F

    .line 362
    :goto_1a
    sget-boolean v9, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v9, :cond_47

    iget-object v9, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v9, v5}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v9

    mul-float v9, v9, v8

    iget-object v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v12, v5, 0x1

    invoke-virtual {v11, v12}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v11

    mul-float v11, v11, v7

    add-float/2addr v9, v11

    goto :goto_1b

    .line 363
    :cond_47
    iget-object v9, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v9, v5}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v9

    iget-object v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v12, v5, 0x1

    invoke-virtual {v11, v12}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v11

    add-float/2addr v9, v11

    mul-float v9, v9, v8

    :goto_1b
    float-to-int v9, v9

    .line 364
    iget v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    add-int/2addr v11, v9

    iget v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    if-ge v11, v12, :cond_48

    iget v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    goto :goto_1c

    .line 365
    :cond_48
    iget v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    add-int/2addr v11, v9

    .line 366
    :goto_1c
    iput v5, v6, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_left:I

    add-int/lit8 v12, v5, 0x1

    .line 367
    iput v12, v6, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_right:I

    .line 368
    iput v4, v6, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    add-int v13, v4, v11

    .line 369
    iput v13, v6, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    .line 370
    iget-boolean v13, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_align_top:Z

    if-eqz v13, :cond_49

    .line 372
    iget-object v13, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v13, v13, v5

    sub-int v9, v11, v9

    div-int/lit8 v9, v9, 0x2

    add-int/2addr v9, v4

    iget v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    div-int/lit8 v14, v14, 0x2

    invoke-virtual {v13, v9, v14, v8, v2}, Lcom/radaee/view/VPage;->vLayout(IIFZ)V

    .line 373
    iget-object v8, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v8, v8, v12

    iget-object v9, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v9, v9, v5

    invoke-virtual {v9}, Lcom/radaee/view/VPage;->GetX()I

    move-result v9

    iget-object v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v12, v12, v5

    invoke-virtual {v12}, Lcom/radaee/view/VPage;->GetWidth()I

    move-result v12

    add-int/2addr v9, v12

    iget v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    div-int/lit8 v12, v12, 0x2

    invoke-virtual {v8, v9, v12, v7, v2}, Lcom/radaee/view/VPage;->vLayout(IIFZ)V

    goto :goto_1d

    .line 376
    :cond_49
    iget-object v13, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v13, v13, v5

    sub-int v9, v11, v9

    div-int/lit8 v9, v9, 0x2

    add-int/2addr v9, v4

    iget v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_th:I

    int-to-float v14, v14

    iget-object v15, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v15, v5}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v15

    mul-float v15, v15, v8

    sub-float/2addr v14, v15

    float-to-int v14, v14

    div-int/lit8 v14, v14, 0x2

    invoke-virtual {v13, v9, v14, v8, v2}, Lcom/radaee/view/VPage;->vLayout(IIFZ)V

    .line 377
    iget-object v8, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v8, v8, v12

    iget-object v9, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v9, v9, v5

    invoke-virtual {v9}, Lcom/radaee/view/VPage;->GetX()I

    move-result v9

    iget-object v13, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v13, v13, v5

    invoke-virtual {v13}, Lcom/radaee/view/VPage;->GetWidth()I

    move-result v13

    add-int/2addr v9, v13

    iget v13, v0, Lcom/radaee/view/PDFLayoutDual;->m_th:I

    int-to-float v13, v13

    iget-object v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v14, v12}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v12

    mul-float v12, v12, v7

    sub-float/2addr v13, v12

    float-to-int v12, v13

    div-int/lit8 v12, v12, 0x2

    invoke-virtual {v8, v9, v12, v7, v2}, Lcom/radaee/view/VPage;->vLayout(IIFZ)V

    :goto_1d
    add-int/lit8 v5, v5, 0x2

    goto/16 :goto_19

    .line 383
    :cond_4a
    iget-object v9, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v9, v5}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v9

    mul-float v9, v9, v8

    float-to-int v9, v9

    .line 384
    iget v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    add-int/2addr v11, v9

    iget v12, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    if-ge v11, v12, :cond_4b

    iget v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    goto :goto_1e

    .line 385
    :cond_4b
    iget v11, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    add-int/2addr v11, v9

    .line 386
    :goto_1e
    iput v5, v6, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_left:I

    const/4 v12, -0x1

    .line 387
    iput v12, v6, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_right:I

    .line 388
    iput v4, v6, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    add-int v13, v4, v11

    .line 389
    iput v13, v6, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    .line 390
    iget-boolean v13, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_align_top:Z

    if-eqz v13, :cond_4c

    .line 392
    iget-object v13, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v13, v13, v5

    sub-int v9, v11, v9

    div-int/lit8 v9, v9, 0x2

    add-int/2addr v9, v4

    iget v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_page_gap:I

    div-int/lit8 v14, v14, 0x2

    invoke-virtual {v13, v9, v14, v8, v7}, Lcom/radaee/view/VPage;->vLayout(IIFZ)V

    goto :goto_1f

    .line 395
    :cond_4c
    iget-object v13, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v13, v13, v5

    sub-int v9, v11, v9

    div-int/lit8 v9, v9, 0x2

    add-int/2addr v9, v4

    iget v14, v0, Lcom/radaee/view/PDFLayoutDual;->m_th:I

    int-to-float v14, v14

    iget-object v15, v0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v15, v5}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v15

    mul-float v15, v15, v8

    sub-float/2addr v14, v15

    float-to-int v14, v14

    div-int/lit8 v14, v14, 0x2

    invoke-virtual {v13, v9, v14, v8, v7}, Lcom/radaee/view/VPage;->vLayout(IIFZ)V

    :goto_1f
    add-int/lit8 v5, v5, 0x1

    :goto_20
    add-int/2addr v4, v11

    .line 400
    iget-object v7, v0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aput-object v6, v7, v3

    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_14

    .line 403
    :cond_4d
    iput v4, v0, Lcom/radaee/view/PDFLayoutDual;->m_tw:I

    .line 405
    :goto_21
    iget-boolean v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_rtol:Z

    if-eqz v2, :cond_51

    const/4 v2, 0x0

    :goto_22
    if-ge v2, v10, :cond_4f

    .line 411
    iget-object v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object v3, v3, v2

    .line 412
    iget v4, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    .line 413
    iget v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_tw:I

    iget v6, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    sub-int/2addr v5, v6

    iput v5, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    .line 414
    iget v5, v0, Lcom/radaee/view/PDFLayoutDual;->m_tw:I

    sub-int/2addr v5, v4

    iput v5, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    .line 415
    iget v4, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_right:I

    if-ltz v4, :cond_4e

    .line 417
    iget v4, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_left:I

    .line 418
    iget v5, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_right:I

    iput v5, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_left:I

    .line 419
    iput v4, v3, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_right:I

    :cond_4e
    add-int/lit8 v2, v2, 0x1

    goto :goto_22

    :cond_4f
    const/4 v7, 0x0

    :goto_23
    if-ge v7, v1, :cond_50

    .line 425
    iget-object v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v2, v2, v7

    .line 426
    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_tw:I

    invoke-virtual {v2}, Lcom/radaee/view/VPage;->GetX()I

    move-result v4

    invoke-virtual {v2}, Lcom/radaee/view/VPage;->GetWidth()I

    move-result v5

    add-int/2addr v4, v5

    sub-int/2addr v3, v4

    invoke-virtual {v2, v3}, Lcom/radaee/view/VPage;->SetX(I)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_23

    .line 429
    :cond_50
    iget-boolean v1, v0, Lcom/radaee/view/PDFLayoutDual;->m_rtol_init:Z

    if-nez v1, :cond_51

    .line 431
    iget-object v1, v0, Lcom/radaee/view/PDFLayoutDual;->m_scroller:Landroid/widget/Scroller;

    iget v2, v0, Lcom/radaee/view/PDFLayoutDual;->m_tw:I

    iget v3, v0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/widget/Scroller;->setFinalX(I)V

    const/4 v1, 0x1

    .line 432
    iput-boolean v1, v0, Lcom/radaee/view/PDFLayoutDual;->m_rtol_init:Z

    :cond_51
    :goto_24
    return-void
.end method

.method public vMoveEnd()V
    .locals 8

    .line 558
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayoutDual;->vGetX()I

    move-result v0

    .line 559
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayoutDual;->vGetY()I

    move-result v1

    .line 560
    iget-boolean v2, p0, Lcom/radaee/view/PDFLayoutDual;->m_rtol:Z

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_4

    const/4 v2, 0x0

    .line 562
    :goto_0
    iget-object v5, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    array-length v6, v5

    if-ge v2, v6, :cond_9

    .line 564
    aget-object v5, v5, v2

    .line 565
    iget v6, v5, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    if-lt v0, v6, :cond_3

    .line 567
    iget-object v6, p0, Lcom/radaee/view/PDFLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v6}, Landroid/widget/Scroller;->abortAnimation()V

    .line 568
    iget-object v6, p0, Lcom/radaee/view/PDFLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v6, v3}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 569
    iget v6, v5, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    iget v7, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr v6, v7

    if-gt v0, v6, :cond_0

    goto/16 :goto_2

    .line 572
    :cond_0
    iget v6, v5, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    sub-int/2addr v6, v0

    iget v7, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    div-int/lit8 v7, v7, 0x2

    if-le v6, v7, :cond_1

    .line 574
    iget v2, v5, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    sub-int/2addr v2, v0

    iget v3, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr v2, v3

    invoke-direct {p0, v0, v1, v2, v4}, Lcom/radaee/view/PDFLayoutDual;->scrollerStartScroll(IIII)V

    return-void

    .line 576
    :cond_1
    iget-object v6, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    array-length v6, v6

    sub-int/2addr v6, v3

    if-ge v2, v6, :cond_2

    .line 578
    iget v2, v5, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    sub-int/2addr v2, v0

    invoke-direct {p0, v0, v1, v2, v4}, Lcom/radaee/view/PDFLayoutDual;->scrollerStartScroll(IIII)V

    return-void

    .line 582
    :cond_2
    iget v2, v5, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    sub-int/2addr v2, v0

    iget v3, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr v2, v3

    invoke-direct {p0, v0, v1, v2, v4}, Lcom/radaee/view/PDFLayoutDual;->scrollerStartScroll(IIII)V

    return-void

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    const/4 v2, 0x0

    .line 591
    :goto_1
    iget-object v5, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    array-length v6, v5

    if-ge v2, v6, :cond_9

    .line 593
    aget-object v5, v5, v2

    .line 594
    iget v6, v5, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    if-ge v0, v6, :cond_8

    .line 596
    iget-object v6, p0, Lcom/radaee/view/PDFLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v6}, Landroid/widget/Scroller;->abortAnimation()V

    .line 597
    iget-object v6, p0, Lcom/radaee/view/PDFLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v6, v3}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 598
    iget v6, v5, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    iget v7, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr v6, v7

    if-gt v0, v6, :cond_5

    goto :goto_2

    .line 601
    :cond_5
    iget v6, v5, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    sub-int/2addr v6, v0

    iget v7, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    div-int/lit8 v7, v7, 0x2

    if-le v6, v7, :cond_6

    .line 603
    iget v2, v5, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    sub-int/2addr v2, v0

    iget v3, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr v2, v3

    invoke-direct {p0, v0, v1, v2, v4}, Lcom/radaee/view/PDFLayoutDual;->scrollerStartScroll(IIII)V

    return-void

    .line 605
    :cond_6
    iget-object v6, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    array-length v6, v6

    sub-int/2addr v6, v3

    if-ge v2, v6, :cond_7

    .line 607
    iget v2, v5, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    sub-int/2addr v2, v0

    invoke-direct {p0, v0, v1, v2, v4}, Lcom/radaee/view/PDFLayoutDual;->scrollerStartScroll(IIII)V

    return-void

    .line 611
    :cond_7
    iget v2, v5, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    sub-int/2addr v2, v0

    iget v3, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr v2, v3

    invoke-direct {p0, v0, v1, v2, v4}, Lcom/radaee/view/PDFLayoutDual;->scrollerStartScroll(IIII)V

    return-void

    :cond_8
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_9
    :goto_2
    return-void
.end method

.method public vOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/PDFLayout$LayoutListener;)V
    .locals 0

    .line 30
    invoke-super {p0, p1, p2}, Lcom/radaee/view/PDFLayout;->vOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/PDFLayout$LayoutListener;)V

    return-void
.end method

.method public vScrolltoPage(I)V
    .locals 4

    .line 643
    iget-object v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    if-lez v0, :cond_3

    iget v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_h:I

    if-lez v0, :cond_3

    if-ltz p1, :cond_3

    iget-object v0, p0, Lcom/radaee/view/PDFLayoutDual;->m_pages:[Lcom/radaee/view/VPage;

    array-length v0, v0

    if-lt p1, v0, :cond_0

    goto :goto_2

    .line 644
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayoutDual;->vScrollAbort()V

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 646
    :goto_0
    iget-object v2, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    array-length v3, v2

    if-ge v1, v3, :cond_3

    .line 648
    aget-object v2, v2, v1

    .line 649
    iget v3, v2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_left:I

    if-eq p1, v3, :cond_2

    iget v2, v2, Lcom/radaee/view/PDFLayoutDual$PDFCell;->page_right:I

    if-ne p1, v2, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 651
    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object p1, p1, v1

    iget p1, p1, Lcom/radaee/view/PDFLayoutDual$PDFCell;->left:I

    .line 652
    iget-object v2, p0, Lcom/radaee/view/PDFLayoutDual;->m_cells:[Lcom/radaee/view/PDFLayoutDual$PDFCell;

    aget-object v1, v2, v1

    iget v1, v1, Lcom/radaee/view/PDFLayoutDual$PDFCell;->right:I

    sub-int/2addr v1, p1

    .line 653
    iget v2, p0, Lcom/radaee/view/PDFLayoutDual;->m_w:I

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    add-int/2addr p1, v1

    .line 654
    iget-object v1, p0, Lcom/radaee/view/PDFLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    int-to-float v1, v1

    .line 655
    iget-object v2, p0, Lcom/radaee/view/PDFLayoutDual;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->getCurrY()I

    move-result v2

    int-to-float v2, v2

    float-to-int v3, v1

    float-to-int v2, v2

    int-to-float p1, p1

    sub-float/2addr p1, v1

    float-to-int p1, p1

    .line 656
    invoke-direct {p0, v3, v2, p1, v0}, Lcom/radaee/view/PDFLayoutDual;->scrollerStartScroll(IIII)V

    :cond_3
    :goto_2
    return-void
.end method

.method public vSetLayoutPara([Z[ZZZ)V
    .locals 0

    .line 664
    iput-object p1, p0, Lcom/radaee/view/PDFLayoutDual;->m_vert_dual:[Z

    .line 665
    iput-object p2, p0, Lcom/radaee/view/PDFLayoutDual;->m_horz_dual:[Z

    .line 666
    iput-boolean p3, p0, Lcom/radaee/view/PDFLayoutDual;->m_rtol:Z

    .line 667
    iput-boolean p4, p0, Lcom/radaee/view/PDFLayoutDual;->m_page_align_top:Z

    .line 668
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayoutDual;->vLayout()V

    return-void
.end method
