.class public Lcom/radaee/view/VSel;
.super Ljava/lang/Object;
.source "VSel.java"


# instance fields
.field public drawPara:Landroid/graphics/RectF;

.field public m_index1:I

.field public m_index2:I

.field public m_ok:Z

.field public m_page:Lcom/radaee/pdf/Page;

.field m_paint:Landroid/graphics/Paint;

.field protected m_swiped:Z


# direct methods
.method public constructor <init>(Lcom/radaee/pdf/Page;)V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/radaee/view/VSel;->m_ok:Z

    .line 17
    iput-boolean v0, p0, Lcom/radaee/view/VSel;->m_swiped:Z

    .line 18
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/view/VSel;->m_paint:Landroid/graphics/Paint;

    .line 21
    iput-object p1, p0, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    const/4 p1, -0x1

    .line 22
    iput p1, p0, Lcom/radaee/view/VSel;->m_index1:I

    .line 23
    iput p1, p0, Lcom/radaee/view/VSel;->m_index2:I

    .line 24
    sget-object p1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    return-void
.end method


# virtual methods
.method public Clear()V
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v0, :cond_0

    .line 30
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    const/4 v0, 0x0

    .line 31
    iput-object v0, p0, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    :cond_0
    return-void
.end method

.method public DrawSel(Landroid/graphics/Canvas;FFII)V
    .locals 22

    move-object/from16 v1, p0

    move/from16 v0, p4

    move/from16 v2, p5

    const/4 v3, 0x0

    .line 112
    :try_start_0
    iput-object v3, v1, Lcom/radaee/view/VSel;->drawPara:Landroid/graphics/RectF;

    .line 113
    iget-object v3, v1, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v3, :cond_6

    iget v3, v1, Lcom/radaee/view/VSel;->m_index1:I

    if-ltz v3, :cond_6

    iget v3, v1, Lcom/radaee/view/VSel;->m_index2:I

    if-ltz v3, :cond_6

    iget-boolean v3, v1, Lcom/radaee/view/VSel;->m_ok:Z

    if-nez v3, :cond_0

    goto/16 :goto_2

    :cond_0
    const/4 v3, 0x4

    .line 114
    new-array v4, v3, [F

    .line 115
    new-array v5, v3, [F

    .line 116
    new-array v3, v3, [F

    .line 118
    iget-object v6, v1, Lcom/radaee/view/VSel;->m_paint:Landroid/graphics/Paint;

    sget v7, Lcom/radaee/pdf/Global;->selColor:I

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 119
    iget-object v6, v1, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    if-nez v6, :cond_1

    goto/16 :goto_2

    .line 121
    :cond_1
    iget v7, v1, Lcom/radaee/view/VSel;->m_index1:I

    invoke-virtual {v6, v7, v4}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    const/4 v6, 0x0

    .line 122
    aget v7, v4, v6

    aput v7, v5, v6

    const/4 v7, 0x1

    .line 123
    aget v8, v4, v7

    aput v8, v5, v7

    const/4 v8, 0x2

    .line 124
    aget v9, v4, v8

    aput v9, v5, v8

    const/4 v9, 0x3

    .line 125
    aget v10, v4, v9

    aput v10, v5, v9

    .line 126
    iget v10, v1, Lcom/radaee/view/VSel;->m_index1:I

    add-int/2addr v10, v7

    .line 127
    :goto_0
    iget v11, v1, Lcom/radaee/view/VSel;->m_index2:I

    if-gt v10, v11, :cond_5

    iget-object v11, v1, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v11, :cond_5

    .line 129
    invoke-virtual {v11, v10, v4}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    .line 130
    aget v11, v4, v9

    aget v12, v4, v7

    sub-float v13, v11, v12

    const/high16 v14, 0x40000000    # 2.0f

    div-float/2addr v13, v14

    .line 131
    aget v14, v5, v7

    cmpl-float v12, v14, v12

    if-nez v12, :cond_3

    aget v12, v5, v9

    cmpl-float v11, v12, v11

    if-nez v11, :cond_3

    aget v11, v5, v8

    add-float v12, v11, v13

    aget v14, v4, v6

    cmpl-float v12, v12, v14

    if-lez v12, :cond_3

    aget v12, v5, v6

    sub-float v13, v12, v13

    aget v15, v4, v8

    cmpg-float v13, v13, v15

    if-gez v13, :cond_3

    cmpl-float v12, v12, v14

    if-lez v12, :cond_2

    .line 134
    aput v14, v5, v6

    :cond_2
    cmpg-float v11, v11, v15

    if-gez v11, :cond_4

    .line 135
    aput v15, v5, v8

    goto :goto_1

    .line 139
    :cond_3
    aget v11, v5, v6

    mul-float v11, v11, p2

    aput v11, v3, v6

    .line 140
    aget v12, v5, v9

    sub-float v12, p3, v12

    mul-float v12, v12, p2

    aput v12, v3, v7

    .line 141
    aget v13, v5, v8

    mul-float v13, v13, p2

    aput v13, v3, v8

    .line 142
    aget v14, v5, v7

    sub-float v14, p3, v14

    mul-float v14, v14, p2

    aput v14, v3, v9

    int-to-float v15, v0

    add-float v17, v15, v11

    int-to-float v11, v2

    add-float v18, v11, v12

    add-float v19, v15, v13

    add-float/2addr v11, v14

    float-to-int v11, v11

    int-to-float v11, v11

    .line 143
    iget-object v12, v1, Lcom/radaee/view/VSel;->m_paint:Landroid/graphics/Paint;

    move-object/from16 v16, p1

    move/from16 v20, v11

    move-object/from16 v21, v12

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 144
    aget v11, v4, v6

    aput v11, v5, v6

    .line 145
    aget v11, v4, v7

    aput v11, v5, v7

    .line 146
    aget v11, v4, v8

    aput v11, v5, v8

    .line 147
    aget v11, v4, v9

    aput v11, v5, v9

    :cond_4
    :goto_1
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_0

    .line 151
    :cond_5
    aget v4, v5, v6

    mul-float v4, v4, p2

    aput v4, v3, v6

    .line 152
    aget v4, v5, v9

    sub-float v4, p3, v4

    mul-float v4, v4, p2

    aput v4, v3, v7

    .line 153
    aget v4, v5, v8

    mul-float v4, v4, p2

    aput v4, v3, v8

    .line 154
    aget v4, v5, v7

    sub-float v4, p3, v4

    mul-float v4, v4, p2

    aput v4, v3, v9

    .line 155
    new-instance v4, Landroid/graphics/RectF;

    int-to-float v0, v0

    aget v5, v3, v6

    add-float/2addr v5, v0

    int-to-float v2, v2

    aget v6, v3, v7

    add-float/2addr v6, v2

    aget v7, v3, v8

    add-float/2addr v0, v7

    aget v3, v3, v9

    add-float/2addr v2, v3

    float-to-int v2, v2

    int-to-float v2, v2

    invoke-direct {v4, v5, v6, v0, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v4, v1, Lcom/radaee/view/VSel;->drawPara:Landroid/graphics/RectF;

    .line 156
    iget-object v0, v1, Lcom/radaee/view/VSel;->m_paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual {v2, v4, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 158
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_6
    :goto_2
    return-void
.end method

.method public GetPage()Lcom/radaee/pdf/Page;
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    return-object v0
.end method

.method public GetRect1(FFII)[I
    .locals 4

    .line 36
    iget v0, p0, Lcom/radaee/view/VSel;->m_index1:I

    if-ltz v0, :cond_2

    iget v1, p0, Lcom/radaee/view/VSel;->m_index2:I

    if-ltz v1, :cond_2

    iget-boolean v2, p0, Lcom/radaee/view/VSel;->m_ok:Z

    if-nez v2, :cond_0

    goto :goto_1

    :cond_0
    const/4 v2, 0x4

    .line 37
    new-array v2, v2, [F

    .line 38
    iget-boolean v3, p0, Lcom/radaee/view/VSel;->m_swiped:Z

    if-eqz v3, :cond_1

    .line 39
    iget-object v0, p0, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v0, v1, v2}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    goto :goto_0

    .line 41
    :cond_1
    iget-object v1, p0, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v1, v0, v2}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    :goto_0
    const/4 v0, 0x0

    .line 43
    aget v0, v2, v0

    mul-float v0, v0, p1

    float-to-int v0, v0

    add-int/2addr v0, p3

    const/4 v1, 0x3

    .line 44
    aget v1, v2, v1

    sub-float v1, p2, v1

    mul-float v1, v1, p1

    float-to-int v1, v1

    add-int/2addr v1, p4

    const/4 v3, 0x2

    .line 45
    aget v3, v2, v3

    mul-float v3, v3, p1

    float-to-int v3, v3

    add-int/2addr v3, p3

    const/4 p3, 0x1

    .line 46
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

.method public GetRect2(FFII)[I
    .locals 4

    .line 51
    iget v0, p0, Lcom/radaee/view/VSel;->m_index1:I

    if-ltz v0, :cond_2

    iget v1, p0, Lcom/radaee/view/VSel;->m_index2:I

    if-ltz v1, :cond_2

    iget-boolean v2, p0, Lcom/radaee/view/VSel;->m_ok:Z

    if-nez v2, :cond_0

    goto :goto_1

    :cond_0
    const/4 v2, 0x4

    .line 52
    new-array v2, v2, [F

    .line 53
    iget-boolean v3, p0, Lcom/radaee/view/VSel;->m_swiped:Z

    if-eqz v3, :cond_1

    .line 54
    iget-object v1, p0, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v1, v0, v2}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    goto :goto_0

    .line 56
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v0, v1, v2}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    :goto_0
    const/4 v0, 0x0

    .line 58
    aget v0, v2, v0

    mul-float v0, v0, p1

    float-to-int v0, v0

    add-int/2addr v0, p3

    const/4 v1, 0x3

    .line 59
    aget v1, v2, v1

    sub-float v1, p2, v1

    mul-float v1, v1, p1

    float-to-int v1, v1

    add-int/2addr v1, p4

    const/4 v3, 0x2

    .line 60
    aget v3, v2, v3

    mul-float v3, v3, p1

    float-to-int v3, v3

    add-int/2addr v3, p3

    const/4 p3, 0x1

    .line 61
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

.method public GetSelString()Ljava/lang/String;
    .locals 3

    .line 106
    iget v0, p0, Lcom/radaee/view/VSel;->m_index1:I

    if-ltz v0, :cond_1

    iget v1, p0, Lcom/radaee/view/VSel;->m_index2:I

    if-ltz v1, :cond_1

    iget-boolean v2, p0, Lcom/radaee/view/VSel;->m_ok:Z

    if-nez v2, :cond_0

    goto :goto_0

    .line 107
    :cond_0
    iget-object v2, p0, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v2, v0, v1}, Lcom/radaee/pdf/Page;->ObjsGetString(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public SetSel(FFFF)V
    .locals 6

    const/4 v5, 0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    .line 65
    invoke-virtual/range {v0 .. v5}, Lcom/radaee/view/VSel;->SetSel(FFFFZ)V

    return-void
.end method

.method public SetSel(FFFFZ)V
    .locals 3

    .line 69
    iget-boolean v0, p0, Lcom/radaee/view/VSel;->m_ok:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 72
    iput-boolean v1, p0, Lcom/radaee/view/VSel;->m_ok:Z

    :cond_0
    const/4 v0, 0x2

    .line 74
    new-array v0, v0, [F

    const/4 v2, 0x0

    .line 75
    aput p1, v0, v2

    .line 76
    aput p2, v0, v1

    .line 77
    iget-object p1, p0, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page;->ObjsGetCharIndex([F)I

    move-result p1

    iput p1, p0, Lcom/radaee/view/VSel;->m_index1:I

    .line 78
    aput p3, v0, v2

    .line 79
    aput p4, v0, v1

    .line 80
    iget-object p1, p0, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page;->ObjsGetCharIndex([F)I

    move-result p1

    iput p1, p0, Lcom/radaee/view/VSel;->m_index2:I

    .line 81
    iget p2, p0, Lcom/radaee/view/VSel;->m_index1:I

    if-le p2, p1, :cond_1

    .line 84
    iput p1, p0, Lcom/radaee/view/VSel;->m_index1:I

    .line 85
    iput p2, p0, Lcom/radaee/view/VSel;->m_index2:I

    .line 86
    iput-boolean v1, p0, Lcom/radaee/view/VSel;->m_swiped:Z

    goto :goto_0

    .line 89
    :cond_1
    iput-boolean v2, p0, Lcom/radaee/view/VSel;->m_swiped:Z

    :goto_0
    if-eqz p5, :cond_2

    .line 91
    iget-object p1, p0, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    iget p2, p0, Lcom/radaee/view/VSel;->m_index1:I

    const/4 p3, -0x1

    invoke-virtual {p1, p2, p3}, Lcom/radaee/pdf/Page;->ObjsAlignWord(II)I

    move-result p1

    iput p1, p0, Lcom/radaee/view/VSel;->m_index1:I

    .line 92
    iget-object p1, p0, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    iget p2, p0, Lcom/radaee/view/VSel;->m_index2:I

    invoke-virtual {p1, p2, v1}, Lcom/radaee/pdf/Page;->ObjsAlignWord(II)I

    move-result p1

    iput p1, p0, Lcom/radaee/view/VSel;->m_index2:I

    :cond_2
    return-void
.end method

.method public SetSelMarkup(I)Z
    .locals 3

    .line 101
    iget v0, p0, Lcom/radaee/view/VSel;->m_index1:I

    if-ltz v0, :cond_1

    iget v1, p0, Lcom/radaee/view/VSel;->m_index2:I

    if-ltz v1, :cond_1

    iget-boolean v2, p0, Lcom/radaee/view/VSel;->m_ok:Z

    if-nez v2, :cond_0

    goto :goto_0

    .line 102
    :cond_0
    iget-object v2, p0, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v2, v0, v1, p1}, Lcom/radaee/pdf/Page;->AddAnnotMarkup(III)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method
