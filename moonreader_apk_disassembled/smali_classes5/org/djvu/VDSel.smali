.class public Lorg/djvu/VDSel;
.super Ljava/lang/Object;
.source "VDSel.java"


# instance fields
.field public drawPara:Landroid/graphics/RectF;

.field public m_index1:I

.field public m_index2:I

.field public m_ok:Z

.field public m_page:Lorg/djvu/DPage;

.field m_paint:Landroid/graphics/Paint;

.field m_scale:F

.field protected m_swiped:Z

.field public pageno:I

.field public vpage:Lorg/djvu/VDPage;


# direct methods
.method public constructor <init>(Lorg/djvu/DDocument;Lorg/djvu/DLayout;IF)V
    .locals 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lorg/djvu/VDSel;->m_ok:Z

    .line 20
    iput-boolean v0, p0, Lorg/djvu/VDSel;->m_swiped:Z

    .line 22
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/djvu/VDSel;->m_paint:Landroid/graphics/Paint;

    .line 25
    iput p3, p0, Lorg/djvu/VDSel;->pageno:I

    .line 26
    iput p4, p0, Lorg/djvu/VDSel;->m_scale:F

    .line 27
    invoke-virtual {p1, p3}, Lorg/djvu/DDocument;->GetPage(I)Lorg/djvu/DPage;

    move-result-object p1

    iput-object p1, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    .line 28
    iget-object p1, p2, Lorg/djvu/DLayout;->m_pages:[Lorg/djvu/VDPage;

    aget-object p1, p1, p3

    iput-object p1, p0, Lorg/djvu/VDSel;->vpage:Lorg/djvu/VDPage;

    const/4 p1, -0x1

    .line 29
    iput p1, p0, Lorg/djvu/VDSel;->m_index1:I

    .line 30
    iput p1, p0, Lorg/djvu/VDSel;->m_index2:I

    .line 31
    iget-object p1, p0, Lorg/djvu/VDSel;->m_paint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    return-void
.end method


# virtual methods
.method public Clear()V
    .locals 1

    .line 35
    iget-object v0, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    if-eqz v0, :cond_0

    .line 36
    invoke-virtual {v0}, Lorg/djvu/DPage;->Close()V

    const/4 v0, 0x0

    .line 37
    iput-object v0, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    :cond_0
    return-void
.end method

.method public DrawSel(Landroid/graphics/Canvas;FII)V
    .locals 23

    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    const/4 v3, 0x0

    .line 142
    iput-object v3, v0, Lorg/djvu/VDSel;->drawPara:Landroid/graphics/RectF;

    .line 143
    iget v3, v0, Lorg/djvu/VDSel;->m_index1:I

    if-ltz v3, :cond_6

    iget v4, v0, Lorg/djvu/VDSel;->m_index2:I

    if-ltz v4, :cond_6

    if-gt v3, v4, :cond_6

    iget-boolean v3, v0, Lorg/djvu/VDSel;->m_ok:Z

    if-nez v3, :cond_0

    goto/16 :goto_2

    .line 144
    :cond_0
    iget-object v3, v0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    iget-object v3, v3, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v3, v3, Lorg/mydroid/droids/djvu/codec/DjvuPage;->text:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v4, v3, :cond_1

    goto/16 :goto_2

    .line 145
    :cond_1
    iget v3, v0, Lorg/djvu/VDSel;->m_index1:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v4, v0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    iget v5, v0, Lorg/djvu/VDSel;->m_index1:I

    iget v6, v0, Lorg/djvu/VDSel;->m_index2:I

    const/4 v7, 0x1

    add-int/2addr v6, v7

    invoke-virtual {v4, v5, v6}, Lorg/djvu/DPage;->ObjsGetString(II)Ljava/lang/String;

    move-result-object v4

    iget v5, v0, Lorg/djvu/VDSel;->m_index2:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x3

    new-array v8, v6, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v3, v8, v9

    aput-object v4, v8, v7

    const/4 v3, 0x2

    aput-object v5, v8, v3

    invoke-static {v8}, Lorg/mydroid/core/codec/LOG;->e([Ljava/lang/Object;)V

    .line 147
    iget-object v4, v0, Lorg/djvu/VDSel;->vpage:Lorg/djvu/VDPage;

    invoke-virtual {v4}, Lorg/djvu/VDPage;->getVyOff()F

    move-result v4

    const/4 v5, 0x4

    .line 148
    new-array v8, v5, [F

    .line 149
    new-array v10, v5, [F

    .line 150
    new-array v5, v5, [F

    .line 151
    iget-object v11, v0, Lorg/djvu/VDSel;->m_paint:Landroid/graphics/Paint;

    sget v12, Lorg/djvu/DLayoutView;->selColor:I

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setColor(I)V

    .line 152
    iget-object v11, v0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    iget v12, v0, Lorg/djvu/VDSel;->m_index1:I

    invoke-virtual {v11, v12, v8}, Lorg/djvu/DPage;->ObjsGetCharRect(I[F)V

    .line 153
    aget v11, v8, v9

    aput v11, v10, v9

    .line 154
    aget v11, v8, v7

    aput v11, v10, v7

    .line 155
    aget v11, v8, v3

    aput v11, v10, v3

    .line 156
    aget v11, v8, v6

    aput v11, v10, v6

    .line 157
    iget v11, v0, Lorg/djvu/VDSel;->m_index1:I

    add-int/2addr v11, v7

    .line 158
    :goto_0
    iget v12, v0, Lorg/djvu/VDSel;->m_index2:I

    if-gt v11, v12, :cond_5

    .line 159
    iget-object v12, v0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    invoke-virtual {v12, v11, v8}, Lorg/djvu/DPage;->ObjsGetCharRect(I[F)V

    .line 160
    aget v12, v8, v6

    aget v13, v8, v7

    sub-float v14, v12, v13

    const/high16 v15, 0x40000000    # 2.0f

    div-float/2addr v14, v15

    .line 161
    aget v15, v10, v7

    cmpl-float v13, v15, v13

    if-nez v13, :cond_4

    aget v13, v10, v6

    cmpl-float v12, v13, v12

    if-nez v12, :cond_4

    aget v12, v10, v3

    add-float v13, v12, v14

    aget v16, v8, v9

    cmpl-float v13, v13, v16

    if-lez v13, :cond_4

    aget v13, v10, v9

    sub-float v14, v13, v14

    aget v17, v8, v3

    cmpg-float v14, v14, v17

    if-gez v14, :cond_4

    cmpl-float v13, v13, v16

    if-lez v13, :cond_2

    .line 163
    aput v16, v10, v9

    :cond_2
    cmpg-float v12, v12, v17

    if-gez v12, :cond_3

    .line 164
    aput v17, v10, v3

    :cond_3
    const/16 v16, 0x2

    goto :goto_1

    .line 166
    :cond_4
    aget v12, v10, v9

    mul-float v12, v12, p2

    aput v12, v5, v9

    mul-float v15, v15, p2

    .line 167
    aput v15, v5, v7

    .line 168
    aget v13, v10, v3

    mul-float v13, v13, p2

    aput v13, v5, v3

    .line 169
    aget v14, v10, v6

    mul-float v14, v14, p2

    aput v14, v5, v6

    const/16 v16, 0x2

    int-to-float v3, v1

    add-float v18, v3, v12

    int-to-float v12, v2

    add-float/2addr v15, v12

    add-float v19, v15, v4

    add-float v20, v3, v13

    add-float/2addr v12, v14

    add-float/2addr v12, v4

    .line 171
    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v3

    int-to-float v3, v3

    iget-object v12, v0, Lorg/djvu/VDSel;->m_paint:Landroid/graphics/Paint;

    move-object/from16 v17, p1

    move/from16 v21, v3

    move-object/from16 v22, v12

    .line 170
    invoke-virtual/range {v17 .. v22}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 172
    aget v3, v8, v9

    aput v3, v10, v9

    .line 173
    aget v3, v8, v7

    aput v3, v10, v7

    .line 174
    aget v3, v8, v16

    aput v3, v10, v16

    .line 175
    aget v3, v8, v6

    aput v3, v10, v6

    :goto_1
    add-int/lit8 v11, v11, 0x1

    const/4 v3, 0x2

    goto/16 :goto_0

    :cond_5
    const/16 v16, 0x2

    .line 179
    aget v3, v10, v9

    mul-float v3, v3, p2

    aput v3, v5, v9

    .line 180
    aget v3, v10, v7

    mul-float v3, v3, p2

    aput v3, v5, v7

    .line 181
    aget v3, v10, v16

    mul-float v3, v3, p2

    aput v3, v5, v16

    .line 182
    aget v3, v10, v6

    mul-float v3, v3, p2

    aput v3, v5, v6

    .line 183
    new-instance v3, Landroid/graphics/RectF;

    int-to-float v1, v1

    aget v8, v5, v9

    add-float/2addr v8, v1

    int-to-float v2, v2

    aget v7, v5, v7

    add-float/2addr v7, v2

    add-float/2addr v7, v4

    aget v9, v5, v16

    add-float/2addr v1, v9

    aget v5, v5, v6

    add-float/2addr v2, v5

    add-float/2addr v2, v4

    .line 184
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v2, v2

    invoke-direct {v3, v8, v7, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v3, v0, Lorg/djvu/VDSel;->drawPara:Landroid/graphics/RectF;

    .line 185
    iget-object v1, v0, Lorg/djvu/VDSel;->m_paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual {v2, v3, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    :cond_6
    :goto_2
    return-void
.end method

.method public GetPage()Lorg/djvu/DPage;
    .locals 1

    .line 128
    iget-object v0, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    return-object v0
.end method

.method public GetSelString()Ljava/lang/String;
    .locals 3

    .line 137
    iget v0, p0, Lorg/djvu/VDSel;->m_index1:I

    if-ltz v0, :cond_1

    iget v1, p0, Lorg/djvu/VDSel;->m_index2:I

    if-ltz v1, :cond_1

    iget-boolean v2, p0, Lorg/djvu/VDSel;->m_ok:Z

    if-nez v2, :cond_0

    goto :goto_0

    .line 138
    :cond_0
    iget-object v2, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v2, v0, v1}, Lorg/djvu/DPage;->ObjsGetString(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public GetVRect1(Lorg/djvu/DLayout;)[I
    .locals 7

    .line 42
    iget v0, p0, Lorg/djvu/VDSel;->m_index1:I

    if-ltz v0, :cond_3

    iget v1, p0, Lorg/djvu/VDSel;->m_index2:I

    if-ltz v1, :cond_3

    iget-boolean v2, p0, Lorg/djvu/VDSel;->m_ok:Z

    if-nez v2, :cond_0

    goto :goto_2

    :cond_0
    const/4 v2, 0x4

    .line 43
    new-array v2, v2, [F

    .line 44
    iget-boolean v3, p0, Lorg/djvu/VDSel;->m_swiped:Z

    if-eqz v3, :cond_1

    .line 45
    iget-object v0, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    invoke-virtual {v0, v1, v2}, Lorg/djvu/DPage;->ObjsGetCharRect(I[F)V

    goto :goto_0

    .line 47
    :cond_1
    iget-object v1, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    invoke-virtual {v1, v0, v2}, Lorg/djvu/DPage;->ObjsGetCharRect(I[F)V

    .line 49
    :goto_0
    sget v0, Lcom/radaee/pdf/Global;->def_view:I

    const/4 v1, 0x0

    const/4 v3, 0x3

    if-ne v0, v3, :cond_2

    iget-object v0, p0, Lorg/djvu/VDSel;->vpage:Lorg/djvu/VDPage;

    invoke-virtual {v0}, Lorg/djvu/VDPage;->getVyOff()F

    move-result v0

    float-to-int v0, v0

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    .line 51
    :goto_1
    iget-object v4, p0, Lorg/djvu/VDSel;->vpage:Lorg/djvu/VDPage;

    aget v1, v2, v1

    invoke-virtual {v4, v1}, Lorg/djvu/VDPage;->GetVX(F)I

    move-result v1

    invoke-virtual {p1}, Lorg/djvu/DLayout;->vGetX()I

    move-result v4

    sub-int/2addr v1, v4

    .line 52
    iget-object v4, p0, Lorg/djvu/VDSel;->vpage:Lorg/djvu/VDPage;

    const/4 v5, 0x1

    aget v5, v2, v5

    invoke-virtual {v4, v5}, Lorg/djvu/VDPage;->GetVY(F)I

    move-result v4

    invoke-virtual {p1}, Lorg/djvu/DLayout;->vGetY()I

    move-result v5

    sub-int/2addr v4, v5

    add-int/2addr v4, v0

    .line 53
    iget-object v5, p0, Lorg/djvu/VDSel;->vpage:Lorg/djvu/VDPage;

    const/4 v6, 0x2

    aget v6, v2, v6

    invoke-virtual {v5, v6}, Lorg/djvu/VDPage;->GetVX(F)I

    move-result v5

    invoke-virtual {p1}, Lorg/djvu/DLayout;->vGetX()I

    move-result v6

    sub-int/2addr v5, v6

    .line 54
    iget-object v6, p0, Lorg/djvu/VDSel;->vpage:Lorg/djvu/VDPage;

    aget v2, v2, v3

    invoke-virtual {v6, v2}, Lorg/djvu/VDPage;->GetVY(F)I

    move-result v2

    invoke-virtual {p1}, Lorg/djvu/DLayout;->vGetY()I

    move-result p1

    sub-int/2addr v2, p1

    add-int/2addr v2, v0

    filled-new-array {v1, v4, v5, v2}, [I

    move-result-object p1

    return-object p1

    :cond_3
    :goto_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public GetVRect2(Lorg/djvu/DLayout;)[I
    .locals 7

    .line 59
    iget v0, p0, Lorg/djvu/VDSel;->m_index1:I

    if-ltz v0, :cond_3

    iget v1, p0, Lorg/djvu/VDSel;->m_index2:I

    if-ltz v1, :cond_3

    iget-boolean v2, p0, Lorg/djvu/VDSel;->m_ok:Z

    if-nez v2, :cond_0

    goto :goto_2

    :cond_0
    const/4 v2, 0x4

    .line 60
    new-array v2, v2, [F

    .line 61
    iget-boolean v3, p0, Lorg/djvu/VDSel;->m_swiped:Z

    if-eqz v3, :cond_1

    .line 62
    iget-object v1, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    invoke-virtual {v1, v0, v2}, Lorg/djvu/DPage;->ObjsGetCharRect(I[F)V

    goto :goto_0

    .line 64
    :cond_1
    iget-object v0, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    invoke-virtual {v0, v1, v2}, Lorg/djvu/DPage;->ObjsGetCharRect(I[F)V

    .line 66
    :goto_0
    sget v0, Lcom/radaee/pdf/Global;->def_view:I

    const/4 v1, 0x0

    const/4 v3, 0x3

    if-ne v0, v3, :cond_2

    iget-object v0, p0, Lorg/djvu/VDSel;->vpage:Lorg/djvu/VDPage;

    invoke-virtual {v0}, Lorg/djvu/VDPage;->getVyOff()F

    move-result v0

    float-to-int v0, v0

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    .line 68
    :goto_1
    iget-object v4, p0, Lorg/djvu/VDSel;->vpage:Lorg/djvu/VDPage;

    aget v1, v2, v1

    invoke-virtual {v4, v1}, Lorg/djvu/VDPage;->GetVX(F)I

    move-result v1

    invoke-virtual {p1}, Lorg/djvu/DLayout;->vGetX()I

    move-result v4

    sub-int/2addr v1, v4

    .line 69
    iget-object v4, p0, Lorg/djvu/VDSel;->vpage:Lorg/djvu/VDPage;

    const/4 v5, 0x1

    aget v5, v2, v5

    invoke-virtual {v4, v5}, Lorg/djvu/VDPage;->GetVY(F)I

    move-result v4

    invoke-virtual {p1}, Lorg/djvu/DLayout;->vGetY()I

    move-result v5

    sub-int/2addr v4, v5

    add-int/2addr v4, v0

    .line 70
    iget-object v5, p0, Lorg/djvu/VDSel;->vpage:Lorg/djvu/VDPage;

    const/4 v6, 0x2

    aget v6, v2, v6

    invoke-virtual {v5, v6}, Lorg/djvu/VDPage;->GetVX(F)I

    move-result v5

    invoke-virtual {p1}, Lorg/djvu/DLayout;->vGetX()I

    move-result v6

    sub-int/2addr v5, v6

    .line 71
    iget-object v6, p0, Lorg/djvu/VDSel;->vpage:Lorg/djvu/VDPage;

    aget v2, v2, v3

    invoke-virtual {v6, v2}, Lorg/djvu/VDPage;->GetVY(F)I

    move-result v2

    invoke-virtual {p1}, Lorg/djvu/DLayout;->vGetY()I

    move-result p1

    sub-int/2addr v2, p1

    add-int/2addr v2, v0

    filled-new-array {v1, v4, v5, v2}, [I

    move-result-object p1

    return-object p1

    :cond_3
    :goto_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public SetSel(FFFFZ)V
    .locals 3

    .line 76
    iget-boolean v0, p0, Lorg/djvu/VDSel;->m_ok:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 77
    iget-object v0, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    invoke-virtual {v0}, Lorg/djvu/DPage;->ObjsStart()V

    .line 78
    iput-boolean v1, p0, Lorg/djvu/VDSel;->m_ok:Z

    .line 81
    :cond_0
    iget-object v0, p0, Lorg/djvu/VDSel;->vpage:Lorg/djvu/VDPage;

    invoke-virtual {v0}, Lorg/djvu/VDPage;->getVyOff()F

    move-result v2

    invoke-virtual {v0, v2}, Lorg/djvu/VDPage;->toDjvuxy(F)F

    move-result v0

    sub-float/2addr p2, v0

    sub-float/2addr p4, v0

    const/4 v0, 0x2

    .line 85
    new-array v0, v0, [F

    const/4 v2, 0x0

    .line 86
    aput p1, v0, v2

    .line 87
    aput p2, v0, v1

    .line 88
    iget-object p1, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    iget p2, p0, Lorg/djvu/VDSel;->m_scale:F

    invoke-virtual {p1, v0, p2}, Lorg/djvu/DPage;->ObjsGetCharIndex([FF)I

    move-result p1

    iput p1, p0, Lorg/djvu/VDSel;->m_index1:I

    .line 90
    aput p3, v0, v2

    .line 91
    aput p4, v0, v1

    .line 92
    iget-object p1, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    iget p2, p0, Lorg/djvu/VDSel;->m_scale:F

    invoke-virtual {p1, v0, p2}, Lorg/djvu/DPage;->ObjsGetCharIndex([FF)I

    move-result p1

    iput p1, p0, Lorg/djvu/VDSel;->m_index2:I

    .line 94
    iget p2, p0, Lorg/djvu/VDSel;->m_index1:I

    if-le p2, p1, :cond_1

    .line 96
    iput p1, p0, Lorg/djvu/VDSel;->m_index1:I

    .line 97
    iput p2, p0, Lorg/djvu/VDSel;->m_index2:I

    .line 98
    iput-boolean v1, p0, Lorg/djvu/VDSel;->m_swiped:Z

    goto :goto_0

    .line 100
    :cond_1
    iput-boolean v2, p0, Lorg/djvu/VDSel;->m_swiped:Z

    :goto_0
    if-eqz p5, :cond_7

    .line 102
    iget p1, p0, Lorg/djvu/VDSel;->m_index1:I

    if-ltz p1, :cond_7

    iget p1, p0, Lorg/djvu/VDSel;->m_index2:I

    if-ltz p1, :cond_7

    .line 103
    :goto_1
    iget p1, p0, Lorg/djvu/VDSel;->m_index1:I

    const/4 p2, 0x5

    const/4 p3, -0x1

    if-lez p1, :cond_4

    .line 104
    iget-object p4, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {p4, p1}, Lorg/djvu/DPage;->ObjsGetCharRect(I)Landroid/graphics/RectF;

    move-result-object p1

    .line 105
    iget-object p4, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    iget p5, p0, Lorg/djvu/VDSel;->m_index1:I

    invoke-virtual {p4, p5}, Lorg/djvu/DPage;->ObjsGetCharRect(I)Landroid/graphics/RectF;

    move-result-object p4

    .line 106
    iget p5, p1, Landroid/graphics/RectF;->top:F

    iget v0, p4, Landroid/graphics/RectF;->top:F

    cmpl-float p5, p5, v0

    if-nez p5, :cond_4

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    iget p4, p4, Landroid/graphics/RectF;->bottom:F

    cmpl-float p1, p1, p4

    if-eqz p1, :cond_2

    goto :goto_2

    .line 108
    :cond_2
    iget-object p1, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    iget-object p1, p1, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object p1, p1, Lorg/mydroid/droids/djvu/codec/DjvuPage;->text:Ljava/lang/String;

    iget p4, p0, Lorg/djvu/VDSel;->m_index1:I

    sub-int/2addr p4, v1

    invoke-virtual {p1, p4}, Ljava/lang/String;->charAt(I)C

    move-result p1

    .line 109
    sget-object p4, Lcom/flyersoft/tools/A;->PUNCTUATIONS:Ljava/lang/String;

    invoke-virtual {p4, p1}, Ljava/lang/String;->indexOf(I)I

    move-result p4

    if-ne p4, p3, :cond_4

    invoke-static {p1}, Ljava/lang/Character;->getType(C)I

    move-result p1

    if-ne p1, p2, :cond_3

    goto :goto_2

    .line 111
    :cond_3
    iget p1, p0, Lorg/djvu/VDSel;->m_index1:I

    sub-int/2addr p1, v1

    iput p1, p0, Lorg/djvu/VDSel;->m_index1:I

    goto :goto_1

    .line 113
    :cond_4
    :goto_2
    iget p1, p0, Lorg/djvu/VDSel;->m_index2:I

    iget-object p4, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    iget-object p4, p4, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object p4, p4, Lorg/mydroid/droids/djvu/codec/DjvuPage;->text:Ljava/lang/String;

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result p4

    sub-int/2addr p4, v1

    if-ge p1, p4, :cond_7

    .line 114
    iget-object p1, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    iget p4, p0, Lorg/djvu/VDSel;->m_index2:I

    invoke-virtual {p1, p4}, Lorg/djvu/DPage;->ObjsGetCharRect(I)Landroid/graphics/RectF;

    move-result-object p1

    .line 115
    iget-object p4, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    iget p5, p0, Lorg/djvu/VDSel;->m_index2:I

    add-int/2addr p5, v1

    invoke-virtual {p4, p5}, Lorg/djvu/DPage;->ObjsGetCharRect(I)Landroid/graphics/RectF;

    move-result-object p4

    .line 116
    iget p5, p1, Landroid/graphics/RectF;->top:F

    iget v0, p4, Landroid/graphics/RectF;->top:F

    cmpl-float p5, p5, v0

    if-nez p5, :cond_7

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    iget p4, p4, Landroid/graphics/RectF;->bottom:F

    cmpl-float p1, p1, p4

    if-eqz p1, :cond_5

    goto :goto_3

    .line 118
    :cond_5
    iget-object p1, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    iget-object p1, p1, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object p1, p1, Lorg/mydroid/droids/djvu/codec/DjvuPage;->text:Ljava/lang/String;

    iget p4, p0, Lorg/djvu/VDSel;->m_index2:I

    add-int/2addr p4, v1

    invoke-virtual {p1, p4}, Ljava/lang/String;->charAt(I)C

    move-result p1

    .line 119
    sget-object p4, Lcom/flyersoft/tools/A;->PUNCTUATIONS:Ljava/lang/String;

    invoke-virtual {p4, p1}, Ljava/lang/String;->indexOf(I)I

    move-result p4

    if-ne p4, p3, :cond_7

    invoke-static {p1}, Ljava/lang/Character;->getType(C)I

    move-result p1

    if-ne p1, p2, :cond_6

    goto :goto_3

    .line 121
    :cond_6
    iget p1, p0, Lorg/djvu/VDSel;->m_index2:I

    add-int/2addr p1, v1

    iput p1, p0, Lorg/djvu/VDSel;->m_index2:I

    goto :goto_2

    :cond_7
    :goto_3
    return-void
.end method

.method public SetSelMarkup(I)Z
    .locals 3

    .line 132
    iget v0, p0, Lorg/djvu/VDSel;->m_index1:I

    if-ltz v0, :cond_1

    iget v1, p0, Lorg/djvu/VDSel;->m_index2:I

    if-ltz v1, :cond_1

    iget-boolean v2, p0, Lorg/djvu/VDSel;->m_ok:Z

    if-nez v2, :cond_0

    goto :goto_0

    .line 133
    :cond_0
    iget-object v2, p0, Lorg/djvu/VDSel;->m_page:Lorg/djvu/DPage;

    invoke-virtual {v2, v0, v1, p1}, Lorg/djvu/DPage;->AddAnnotMarkup(III)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method
