.class public Lcom/radaee/view/PDFVSel;
.super Ljava/lang/Object;
.source "PDFVSel.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field protected m_index1:I

.field protected m_index2:I

.field protected m_ok:Z

.field protected m_page:Lcom/radaee/pdf/Page;

.field m_paint:Landroid/graphics/Paint;

.field protected m_swiped:Z


# direct methods
.method protected constructor <init>(Lcom/radaee/pdf/Page;)V
    .locals 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/radaee/view/PDFVSel;->m_ok:Z

    .line 19
    iput-boolean v0, p0, Lcom/radaee/view/PDFVSel;->m_swiped:Z

    .line 20
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/view/PDFVSel;->m_paint:Landroid/graphics/Paint;

    .line 23
    iput-object p1, p0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    const/4 p1, -0x1

    .line 24
    iput p1, p0, Lcom/radaee/view/PDFVSel;->m_index1:I

    .line 25
    iput p1, p0, Lcom/radaee/view/PDFVSel;->m_index2:I

    .line 26
    sget-object p1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    return-void
.end method


# virtual methods
.method protected Clear()V
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v0, :cond_0

    .line 32
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    :cond_0
    return-void
.end method

.method protected DrawSel(Landroid/graphics/Canvas;FFII)V
    .locals 25

    move-object/from16 v0, p0

    move/from16 v1, p4

    move/from16 v2, p5

    .line 104
    iget v3, v0, Lcom/radaee/view/PDFVSel;->m_index1:I

    if-ltz v3, :cond_5

    iget v3, v0, Lcom/radaee/view/PDFVSel;->m_index2:I

    if-ltz v3, :cond_5

    iget-boolean v3, v0, Lcom/radaee/view/PDFVSel;->m_ok:Z

    if-nez v3, :cond_0

    goto/16 :goto_2

    :cond_0
    const/4 v3, 0x4

    .line 105
    new-array v4, v3, [F

    .line 106
    new-array v3, v3, [F

    .line 109
    iget-object v5, v0, Lcom/radaee/view/PDFVSel;->m_paint:Landroid/graphics/Paint;

    sget v6, Lcom/radaee/pdf/Global;->selColor:I

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 110
    iget-object v5, v0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    iget v6, v0, Lcom/radaee/view/PDFVSel;->m_index1:I

    invoke-virtual {v5, v6, v4}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    const/4 v5, 0x0

    .line 111
    aget v6, v4, v5

    aput v6, v3, v5

    const/4 v6, 0x1

    .line 112
    aget v7, v4, v6

    aput v7, v3, v6

    const/4 v7, 0x2

    .line 113
    aget v8, v4, v7

    aput v8, v3, v7

    const/4 v8, 0x3

    .line 114
    aget v9, v4, v8

    aput v9, v3, v8

    .line 115
    iget v9, v0, Lcom/radaee/view/PDFVSel;->m_index1:I

    add-int/2addr v9, v6

    .line 116
    :goto_0
    iget v10, v0, Lcom/radaee/view/PDFVSel;->m_index2:I

    if-gt v9, v10, :cond_4

    .line 118
    iget-object v10, v0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v10, v9, v4}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    .line 119
    aget v10, v4, v8

    aget v11, v4, v6

    sub-float v12, v10, v11

    const/high16 v13, 0x40000000    # 2.0f

    div-float/2addr v12, v13

    .line 120
    aget v13, v3, v6

    cmpl-float v11, v13, v11

    if-nez v11, :cond_2

    aget v11, v3, v8

    cmpl-float v10, v11, v10

    if-nez v10, :cond_2

    aget v10, v3, v7

    add-float v11, v10, v12

    aget v13, v4, v5

    cmpl-float v11, v11, v13

    if-lez v11, :cond_2

    aget v11, v3, v5

    sub-float v12, v11, v12

    aget v14, v4, v7

    cmpg-float v12, v12, v14

    if-gez v12, :cond_2

    cmpl-float v11, v11, v13

    if-lez v11, :cond_1

    .line 123
    aput v13, v3, v5

    :cond_1
    cmpg-float v10, v10, v14

    if-gez v10, :cond_3

    .line 124
    aput v14, v3, v7

    goto :goto_1

    .line 128
    :cond_2
    aget v10, v3, v5

    mul-float v10, v10, p2

    .line 129
    aget v11, v3, v8

    sub-float v11, p3, v11

    mul-float v11, v11, p2

    .line 130
    aget v12, v3, v7

    mul-float v12, v12, p2

    .line 131
    aget v13, v3, v6

    sub-float v13, p3, v13

    mul-float v13, v13, p2

    int-to-float v14, v1

    add-float v16, v14, v10

    int-to-float v10, v2

    add-float v17, v10, v11

    add-float v18, v14, v12

    add-float/2addr v10, v13

    float-to-int v10, v10

    int-to-float v10, v10

    .line 132
    iget-object v11, v0, Lcom/radaee/view/PDFVSel;->m_paint:Landroid/graphics/Paint;

    move-object/from16 v15, p1

    move/from16 v19, v10

    move-object/from16 v20, v11

    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 133
    aget v10, v4, v5

    aput v10, v3, v5

    .line 134
    aget v10, v4, v6

    aput v10, v3, v6

    .line 135
    aget v10, v4, v7

    aput v10, v3, v7

    .line 136
    aget v10, v4, v8

    aput v10, v3, v8

    :cond_3
    :goto_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 140
    :cond_4
    aget v4, v3, v5

    mul-float v4, v4, p2

    .line 141
    aget v5, v3, v8

    sub-float v5, p3, v5

    mul-float v5, v5, p2

    .line 142
    aget v7, v3, v7

    mul-float v7, v7, p2

    .line 143
    aget v3, v3, v6

    sub-float v3, p3, v3

    mul-float v3, v3, p2

    int-to-float v1, v1

    add-float v20, v1, v4

    int-to-float v2, v2

    add-float v21, v2, v5

    add-float v22, v1, v7

    add-float/2addr v2, v3

    float-to-int v1, v2

    int-to-float v1, v1

    .line 144
    iget-object v2, v0, Lcom/radaee/view/PDFVSel;->m_paint:Landroid/graphics/Paint;

    move-object/from16 v19, p1

    move/from16 v23, v1

    move-object/from16 v24, v2

    invoke-virtual/range {v19 .. v24}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_5
    :goto_2
    return-void
.end method

.method protected DrawSel(Lcom/radaee/pdf/BMP;FFII)V
    .locals 26

    move-object/from16 v0, p0

    move/from16 v1, p4

    move/from16 v2, p5

    .line 148
    iget v3, v0, Lcom/radaee/view/PDFVSel;->m_index1:I

    if-ltz v3, :cond_5

    iget v4, v0, Lcom/radaee/view/PDFVSel;->m_index2:I

    if-ltz v4, :cond_5

    iget-boolean v4, v0, Lcom/radaee/view/PDFVSel;->m_ok:Z

    if-nez v4, :cond_0

    goto/16 :goto_2

    :cond_0
    const/4 v4, 0x4

    .line 149
    new-array v5, v4, [F

    .line 150
    new-array v6, v4, [F

    .line 151
    new-array v4, v4, [F

    .line 152
    iget-object v7, v0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v7, v3, v5}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    const/4 v3, 0x0

    .line 153
    aget v7, v5, v3

    aput v7, v6, v3

    const/4 v7, 0x1

    .line 154
    aget v8, v5, v7

    aput v8, v6, v7

    const/4 v8, 0x2

    .line 155
    aget v9, v5, v8

    aput v9, v6, v8

    const/4 v9, 0x3

    .line 156
    aget v10, v5, v9

    aput v10, v6, v9

    .line 157
    iget v10, v0, Lcom/radaee/view/PDFVSel;->m_index1:I

    add-int/2addr v10, v7

    .line 158
    :goto_0
    iget v11, v0, Lcom/radaee/view/PDFVSel;->m_index2:I

    if-gt v10, v11, :cond_4

    .line 160
    iget-object v11, v0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v11, v10, v5}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    .line 161
    aget v11, v5, v9

    aget v12, v5, v7

    sub-float v13, v11, v12

    const/high16 v14, 0x40000000    # 2.0f

    div-float/2addr v13, v14

    .line 162
    aget v14, v6, v7

    cmpl-float v12, v14, v12

    if-nez v12, :cond_2

    aget v12, v6, v9

    cmpl-float v11, v12, v11

    if-nez v11, :cond_2

    aget v11, v6, v8

    add-float v12, v11, v13

    aget v14, v5, v3

    cmpl-float v12, v12, v14

    if-lez v12, :cond_2

    aget v12, v6, v3

    sub-float v13, v12, v13

    aget v15, v5, v8

    cmpg-float v13, v13, v15

    if-gez v13, :cond_2

    cmpl-float v12, v12, v14

    if-lez v12, :cond_1

    .line 165
    aput v14, v6, v3

    :cond_1
    cmpg-float v11, v11, v15

    if-gez v11, :cond_3

    .line 166
    aput v15, v6, v8

    goto :goto_1

    .line 170
    :cond_2
    aget v11, v6, v3

    mul-float v11, v11, p2

    aput v11, v4, v3

    .line 171
    aget v11, v6, v9

    sub-float v11, p3, v11

    mul-float v11, v11, p2

    aput v11, v4, v7

    .line 172
    aget v11, v6, v8

    mul-float v11, v11, p2

    aput v11, v4, v8

    .line 173
    aget v11, v6, v7

    sub-float v11, p3, v11

    mul-float v11, v11, p2

    aput v11, v4, v9

    .line 174
    sget v13, Lcom/radaee/pdf/Global;->selColor:I

    int-to-float v11, v1

    aget v12, v4, v3

    add-float/2addr v11, v12

    float-to-int v14, v11

    int-to-float v11, v2

    aget v15, v4, v7

    add-float/2addr v11, v15

    float-to-int v11, v11

    aget v16, v4, v8

    sub-float v12, v16, v12

    float-to-int v12, v12

    aget v16, v4, v9

    sub-float v15, v16, v15

    float-to-int v15, v15

    const/16 v18, 0x0

    move/from16 v16, v12

    move/from16 v17, v15

    move-object/from16 v12, p1

    move v15, v11

    invoke-virtual/range {v12 .. v18}, Lcom/radaee/pdf/BMP;->DrawRect(IIIIII)V

    .line 175
    aget v11, v5, v3

    aput v11, v6, v3

    .line 176
    aget v11, v5, v7

    aput v11, v6, v7

    .line 177
    aget v11, v5, v8

    aput v11, v6, v8

    .line 178
    aget v11, v5, v9

    aput v11, v6, v9

    :cond_3
    :goto_1
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_0

    .line 182
    :cond_4
    aget v5, v6, v3

    mul-float v5, v5, p2

    aput v5, v4, v3

    .line 183
    aget v5, v6, v9

    sub-float v5, p3, v5

    mul-float v5, v5, p2

    aput v5, v4, v7

    .line 184
    aget v5, v6, v8

    mul-float v5, v5, p2

    aput v5, v4, v8

    .line 185
    aget v5, v6, v7

    sub-float v5, p3, v5

    mul-float v5, v5, p2

    aput v5, v4, v9

    .line 186
    sget v20, Lcom/radaee/pdf/Global;->selColor:I

    int-to-float v1, v1

    aget v3, v4, v3

    add-float/2addr v1, v3

    float-to-int v1, v1

    int-to-float v2, v2

    aget v5, v4, v7

    add-float/2addr v2, v5

    float-to-int v2, v2

    aget v6, v4, v8

    sub-float/2addr v6, v3

    float-to-int v3, v6

    aget v4, v4, v9

    sub-float/2addr v4, v5

    float-to-int v4, v4

    const/16 v25, 0x0

    move-object/from16 v19, p1

    move/from16 v21, v1

    move/from16 v22, v2

    move/from16 v23, v3

    move/from16 v24, v4

    invoke-virtual/range {v19 .. v25}, Lcom/radaee/pdf/BMP;->DrawRect(IIIIII)V

    :cond_5
    :goto_2
    return-void
.end method

.method protected DrawSelToDIB(Lcom/radaee/pdf/DIB;FFII)V
    .locals 26

    move-object/from16 v0, p0

    move/from16 v1, p4

    move/from16 v2, p5

    .line 190
    iget v3, v0, Lcom/radaee/view/PDFVSel;->m_index1:I

    if-ltz v3, :cond_5

    iget v4, v0, Lcom/radaee/view/PDFVSel;->m_index2:I

    if-ltz v4, :cond_5

    iget-boolean v4, v0, Lcom/radaee/view/PDFVSel;->m_ok:Z

    if-nez v4, :cond_0

    goto/16 :goto_2

    :cond_0
    const/4 v4, 0x4

    .line 191
    new-array v5, v4, [F

    .line 192
    new-array v6, v4, [F

    .line 193
    new-array v4, v4, [F

    .line 194
    iget-object v7, v0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v7, v3, v5}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    const/4 v3, 0x0

    .line 195
    aget v7, v5, v3

    aput v7, v6, v3

    const/4 v7, 0x1

    .line 196
    aget v8, v5, v7

    aput v8, v6, v7

    const/4 v8, 0x2

    .line 197
    aget v9, v5, v8

    aput v9, v6, v8

    const/4 v9, 0x3

    .line 198
    aget v10, v5, v9

    aput v10, v6, v9

    .line 199
    iget v10, v0, Lcom/radaee/view/PDFVSel;->m_index1:I

    add-int/2addr v10, v7

    .line 200
    :goto_0
    iget v11, v0, Lcom/radaee/view/PDFVSel;->m_index2:I

    if-gt v10, v11, :cond_4

    .line 202
    iget-object v11, v0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v11, v10, v5}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    .line 203
    aget v11, v5, v9

    aget v12, v5, v7

    sub-float v13, v11, v12

    const/high16 v14, 0x40000000    # 2.0f

    div-float/2addr v13, v14

    .line 204
    aget v14, v6, v7

    cmpl-float v12, v14, v12

    if-nez v12, :cond_2

    aget v12, v6, v9

    cmpl-float v11, v12, v11

    if-nez v11, :cond_2

    aget v11, v6, v8

    add-float v12, v11, v13

    aget v14, v5, v3

    cmpl-float v12, v12, v14

    if-lez v12, :cond_2

    aget v12, v6, v3

    sub-float v13, v12, v13

    aget v15, v5, v8

    cmpg-float v13, v13, v15

    if-gez v13, :cond_2

    cmpl-float v12, v12, v14

    if-lez v12, :cond_1

    .line 207
    aput v14, v6, v3

    :cond_1
    cmpg-float v11, v11, v15

    if-gez v11, :cond_3

    .line 208
    aput v15, v6, v8

    goto :goto_1

    .line 212
    :cond_2
    aget v11, v6, v3

    mul-float v11, v11, p2

    aput v11, v4, v3

    .line 213
    aget v11, v6, v9

    sub-float v11, p3, v11

    mul-float v11, v11, p2

    aput v11, v4, v7

    .line 214
    aget v11, v6, v8

    mul-float v11, v11, p2

    aput v11, v4, v8

    .line 215
    aget v11, v6, v7

    sub-float v11, p3, v11

    mul-float v11, v11, p2

    aput v11, v4, v9

    .line 216
    sget v13, Lcom/radaee/pdf/Global;->selColor:I

    int-to-float v11, v1

    aget v12, v4, v3

    add-float/2addr v11, v12

    float-to-int v14, v11

    int-to-float v11, v2

    aget v15, v4, v7

    add-float/2addr v11, v15

    float-to-int v11, v11

    aget v16, v4, v8

    sub-float v12, v16, v12

    float-to-int v12, v12

    aget v16, v4, v9

    sub-float v15, v16, v15

    float-to-int v15, v15

    const/16 v18, 0x0

    move/from16 v16, v12

    move/from16 v17, v15

    move-object/from16 v12, p1

    move v15, v11

    invoke-virtual/range {v12 .. v18}, Lcom/radaee/pdf/DIB;->DrawRect(IIIIII)V

    .line 217
    aget v11, v5, v3

    aput v11, v6, v3

    .line 218
    aget v11, v5, v7

    aput v11, v6, v7

    .line 219
    aget v11, v5, v8

    aput v11, v6, v8

    .line 220
    aget v11, v5, v9

    aput v11, v6, v9

    :cond_3
    :goto_1
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_0

    .line 224
    :cond_4
    aget v5, v6, v3

    mul-float v5, v5, p2

    aput v5, v4, v3

    .line 225
    aget v5, v6, v9

    sub-float v5, p3, v5

    mul-float v5, v5, p2

    aput v5, v4, v7

    .line 226
    aget v5, v6, v8

    mul-float v5, v5, p2

    aput v5, v4, v8

    .line 227
    aget v5, v6, v7

    sub-float v5, p3, v5

    mul-float v5, v5, p2

    aput v5, v4, v9

    .line 228
    sget v20, Lcom/radaee/pdf/Global;->selColor:I

    int-to-float v1, v1

    aget v3, v4, v3

    add-float/2addr v1, v3

    float-to-int v1, v1

    int-to-float v2, v2

    aget v5, v4, v7

    add-float/2addr v2, v5

    float-to-int v2, v2

    aget v6, v4, v8

    sub-float/2addr v6, v3

    float-to-int v3, v6

    aget v4, v4, v9

    sub-float/2addr v4, v5

    float-to-int v4, v4

    const/16 v25, 0x0

    move-object/from16 v19, p1

    move/from16 v21, v1

    move/from16 v22, v2

    move/from16 v23, v3

    move/from16 v24, v4

    invoke-virtual/range {v19 .. v25}, Lcom/radaee/pdf/DIB;->DrawRect(IIIIII)V

    :cond_5
    :goto_2
    return-void
.end method

.method protected GetRect1(FFII)[I
    .locals 4

    .line 38
    iget v0, p0, Lcom/radaee/view/PDFVSel;->m_index1:I

    if-ltz v0, :cond_2

    iget v1, p0, Lcom/radaee/view/PDFVSel;->m_index2:I

    if-ltz v1, :cond_2

    iget-boolean v2, p0, Lcom/radaee/view/PDFVSel;->m_ok:Z

    if-nez v2, :cond_0

    goto :goto_1

    :cond_0
    const/4 v2, 0x4

    .line 39
    new-array v2, v2, [F

    .line 40
    iget-boolean v3, p0, Lcom/radaee/view/PDFVSel;->m_swiped:Z

    if-eqz v3, :cond_1

    .line 41
    iget-object v0, p0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v0, v1, v2}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    goto :goto_0

    .line 43
    :cond_1
    iget-object v1, p0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v1, v0, v2}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    :goto_0
    const/4 v0, 0x0

    .line 45
    aget v0, v2, v0

    mul-float v0, v0, p1

    float-to-int v0, v0

    add-int/2addr v0, p3

    const/4 v1, 0x3

    .line 46
    aget v1, v2, v1

    sub-float v1, p2, v1

    mul-float v1, v1, p1

    float-to-int v1, v1

    add-int/2addr v1, p4

    const/4 v3, 0x2

    .line 47
    aget v3, v2, v3

    mul-float v3, v3, p1

    float-to-int v3, v3

    add-int/2addr v3, p3

    const/4 p3, 0x1

    .line 48
    aget p3, v2, p3

    sub-float/2addr p2, p3

    mul-float p2, p2, p1

    float-to-int p1, p2

    add-int/2addr p1, p4

    filled-new-array {v0, v1, v3, p1}, [I

    move-result-object p1

    return-object p1

    :cond_2
    :goto_1
    const/4 p1, 0x0

    return-object p1
.end method

.method protected GetRect2(FFII)[I
    .locals 4

    .line 53
    iget v0, p0, Lcom/radaee/view/PDFVSel;->m_index1:I

    if-ltz v0, :cond_2

    iget v1, p0, Lcom/radaee/view/PDFVSel;->m_index2:I

    if-ltz v1, :cond_2

    iget-boolean v2, p0, Lcom/radaee/view/PDFVSel;->m_ok:Z

    if-nez v2, :cond_0

    goto :goto_1

    :cond_0
    const/4 v2, 0x4

    .line 54
    new-array v2, v2, [F

    .line 55
    iget-boolean v3, p0, Lcom/radaee/view/PDFVSel;->m_swiped:Z

    if-eqz v3, :cond_1

    .line 56
    iget-object v1, p0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v1, v0, v2}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    goto :goto_0

    .line 58
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v0, v1, v2}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    :goto_0
    const/4 v0, 0x0

    .line 60
    aget v0, v2, v0

    mul-float v0, v0, p1

    float-to-int v0, v0

    add-int/2addr v0, p3

    const/4 v1, 0x3

    .line 61
    aget v1, v2, v1

    sub-float v1, p2, v1

    mul-float v1, v1, p1

    float-to-int v1, v1

    add-int/2addr v1, p4

    const/4 v3, 0x2

    .line 62
    aget v3, v2, v3

    mul-float v3, v3, p1

    float-to-int v3, v3

    add-int/2addr v3, p3

    const/4 p3, 0x1

    .line 63
    aget p3, v2, p3

    sub-float/2addr p2, p3

    mul-float p2, p2, p1

    float-to-int p1, p2

    add-int/2addr p1, p4

    filled-new-array {v0, v1, v3, p1}, [I

    move-result-object p1

    return-object p1

    :cond_2
    :goto_1
    const/4 p1, 0x0

    return-object p1
.end method

.method protected GetSelString()Ljava/lang/String;
    .locals 3

    .line 99
    iget v0, p0, Lcom/radaee/view/PDFVSel;->m_index1:I

    if-ltz v0, :cond_1

    iget v1, p0, Lcom/radaee/view/PDFVSel;->m_index2:I

    if-ltz v1, :cond_1

    iget-boolean v2, p0, Lcom/radaee/view/PDFVSel;->m_ok:Z

    if-nez v2, :cond_0

    goto :goto_0

    .line 100
    :cond_0
    iget-object v2, p0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v2, v0, v1}, Lcom/radaee/pdf/Page;->ObjsGetString(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method protected SetSel(FFFF)V
    .locals 3

    .line 68
    iget-boolean v0, p0, Lcom/radaee/view/PDFVSel;->m_ok:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 71
    iput-boolean v1, p0, Lcom/radaee/view/PDFVSel;->m_ok:Z

    :cond_0
    const/4 v0, 0x2

    .line 73
    new-array v0, v0, [F

    const/4 v2, 0x0

    .line 74
    aput p1, v0, v2

    .line 75
    aput p2, v0, v1

    .line 76
    iget-object p1, p0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page;->ObjsGetCharIndex([F)I

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFVSel;->m_index1:I

    .line 77
    aput p3, v0, v2

    .line 78
    aput p4, v0, v1

    .line 79
    iget-object p1, p0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page;->ObjsGetCharIndex([F)I

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFVSel;->m_index2:I

    .line 80
    iget p2, p0, Lcom/radaee/view/PDFVSel;->m_index1:I

    if-le p2, p1, :cond_1

    .line 83
    iput p1, p0, Lcom/radaee/view/PDFVSel;->m_index1:I

    .line 84
    iput p2, p0, Lcom/radaee/view/PDFVSel;->m_index2:I

    .line 85
    iput-boolean v1, p0, Lcom/radaee/view/PDFVSel;->m_swiped:Z

    goto :goto_0

    .line 88
    :cond_1
    iput-boolean v2, p0, Lcom/radaee/view/PDFVSel;->m_swiped:Z

    .line 89
    :goto_0
    iget-object p1, p0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    iget p2, p0, Lcom/radaee/view/PDFVSel;->m_index1:I

    const/4 p3, -0x1

    invoke-virtual {p1, p2, p3}, Lcom/radaee/pdf/Page;->ObjsAlignWord(II)I

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFVSel;->m_index1:I

    .line 90
    iget-object p1, p0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    iget p2, p0, Lcom/radaee/view/PDFVSel;->m_index2:I

    invoke-virtual {p1, p2, v1}, Lcom/radaee/pdf/Page;->ObjsAlignWord(II)I

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFVSel;->m_index2:I

    return-void
.end method

.method protected SetSelMarkup(I)Z
    .locals 3

    .line 94
    iget v0, p0, Lcom/radaee/view/PDFVSel;->m_index1:I

    if-ltz v0, :cond_1

    iget v1, p0, Lcom/radaee/view/PDFVSel;->m_index2:I

    if-ltz v1, :cond_1

    iget-boolean v2, p0, Lcom/radaee/view/PDFVSel;->m_ok:Z

    if-nez v2, :cond_0

    goto :goto_0

    .line 95
    :cond_0
    iget-object v2, p0, Lcom/radaee/view/PDFVSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v2, v0, v1, p1}, Lcom/radaee/pdf/Page;->AddAnnotMarkup(III)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method
