.class public Lcom/radaee/util/PDFGridItem;
.super Landroid/widget/LinearLayout;
.source "PDFGridItem.java"


# static fields
.field static TEXT_COLOR:I = -0x333334

.field static m_def_dir_icon:Landroid/graphics/Bitmap;

.field static m_def_pdf_icon:Landroid/graphics/Bitmap;

.field static m_def_refresh_icon:Landroid/graphics/Bitmap;

.field static m_def_up_icon:Landroid/graphics/Bitmap;


# instance fields
.field private is_notified:Z

.field private is_waitting:Z

.field private m_bmp:Landroid/graphics/Bitmap;

.field private m_cancel:Z

.field private m_image:Landroid/widget/ImageView;

.field private m_name:Landroid/widget/TextView;

.field private m_page:Lcom/radaee/pdf/Page;

.field private m_path:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 37
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 29
    iput-boolean p2, p0, Lcom/radaee/util/PDFGridItem;->m_cancel:Z

    .line 201
    iput-boolean p2, p0, Lcom/radaee/util/PDFGridItem;->is_notified:Z

    .line 202
    iput-boolean p2, p0, Lcom/radaee/util/PDFGridItem;->is_waitting:Z

    .line 38
    sget-object v0, Lcom/radaee/util/PDFGridItem;->m_def_pdf_icon:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 39
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$drawable;->file03:I

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/radaee/util/PDFGridItem;->m_def_pdf_icon:Landroid/graphics/Bitmap;

    .line 40
    :cond_0
    sget-object v0, Lcom/radaee/util/PDFGridItem;->m_def_dir_icon:Landroid/graphics/Bitmap;

    if-nez v0, :cond_1

    .line 41
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$drawable;->folder0:I

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/radaee/util/PDFGridItem;->m_def_dir_icon:Landroid/graphics/Bitmap;

    .line 42
    :cond_1
    sget-object v0, Lcom/radaee/util/PDFGridItem;->m_def_up_icon:Landroid/graphics/Bitmap;

    if-nez v0, :cond_2

    .line 43
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$drawable;->folder1:I

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/radaee/util/PDFGridItem;->m_def_up_icon:Landroid/graphics/Bitmap;

    .line 44
    :cond_2
    sget-object v0, Lcom/radaee/util/PDFGridItem;->m_def_refresh_icon:Landroid/graphics/Bitmap;

    if-nez v0, :cond_3

    .line 45
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/radaee/viewlib/R$drawable;->folder2:I

    invoke-static {p1, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    sput-object p1, Lcom/radaee/util/PDFGridItem;->m_def_refresh_icon:Landroid/graphics/Bitmap;

    .line 46
    :cond_3
    invoke-virtual {p0, p2}, Lcom/radaee/util/PDFGridItem;->setBackgroundColor(I)V

    const/4 p1, 0x1

    .line 47
    invoke-virtual {p0, p1}, Lcom/radaee/util/PDFGridItem;->setOrientation(I)V

    .line 48
    invoke-direct {p0}, Lcom/radaee/util/PDFGridItem;->unlock_file()V

    return-void
.end method

.method private declared-synchronized lock_file()V
    .locals 2

    monitor-enter p0

    .line 208
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/util/PDFGridItem;->is_notified:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 209
    iput-boolean v1, p0, Lcom/radaee/util/PDFGridItem;->is_notified:Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 214
    iput-boolean v0, p0, Lcom/radaee/util/PDFGridItem;->is_waitting:Z

    .line 215
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 216
    iput-boolean v1, p0, Lcom/radaee/util/PDFGridItem;->is_waitting:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 223
    :catch_0
    :goto_0
    monitor-exit p0

    return-void
.end method

.method private declared-synchronized set_page(Lcom/radaee/pdf/Page;Landroid/graphics/Bitmap;)V
    .locals 0

    monitor-enter p0

    .line 129
    :try_start_0
    iput-object p1, p0, Lcom/radaee/util/PDFGridItem;->m_page:Lcom/radaee/pdf/Page;

    if-eqz p2, :cond_0

    .line 130
    iput-object p2, p0, Lcom/radaee/util/PDFGridItem;->m_bmp:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private declared-synchronized unlock_file()V
    .locals 1

    monitor-enter p0

    .line 226
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/util/PDFGridItem;->is_waitting:Z

    if-eqz v0, :cond_0

    .line 227
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 229
    iput-boolean v0, p0, Lcom/radaee/util/PDFGridItem;->is_notified:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 232
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public get_name()Ljava/lang/String;
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/radaee/util/PDFGridItem;->m_name:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public get_path()Ljava/lang/String;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/radaee/util/PDFGridItem;->m_path:Ljava/lang/String;

    return-object v0
.end method

.method public is_dir()Z
    .locals 2

    .line 59
    iget-object v0, p0, Lcom/radaee/util/PDFGridItem;->m_bmp:Landroid/graphics/Bitmap;

    sget-object v1, Lcom/radaee/util/PDFGridItem;->m_def_dir_icon:Landroid/graphics/Bitmap;

    if-eq v0, v1, :cond_1

    sget-object v1, Lcom/radaee/util/PDFGridItem;->m_def_up_icon:Landroid/graphics/Bitmap;

    if-eq v0, v1, :cond_1

    sget-object v1, Lcom/radaee/util/PDFGridItem;->m_def_refresh_icon:Landroid/graphics/Bitmap;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public open_doc(Lcom/radaee/pdf/Document;Ljava/lang/String;)I
    .locals 1

    .line 52
    invoke-direct {p0}, Lcom/radaee/util/PDFGridItem;->lock_file()V

    .line 53
    iget-object v0, p0, Lcom/radaee/util/PDFGridItem;->m_path:Ljava/lang/String;

    invoke-virtual {p1, v0, p2}, Lcom/radaee/pdf/Document;->Open(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    .line 54
    invoke-direct {p0}, Lcom/radaee/util/PDFGridItem;->unlock_file()V

    return p1
.end method

.method protected declared-synchronized page_destroy()V
    .locals 2

    monitor-enter p0

    const/4 v0, 0x1

    .line 80
    :try_start_0
    iput-boolean v0, p0, Lcom/radaee/util/PDFGridItem;->m_cancel:Z

    .line 81
    iget-object v0, p0, Lcom/radaee/util/PDFGridItem;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v0, :cond_0

    .line 82
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->RenderCancel()V

    .line 83
    :cond_0
    iget-object v0, p0, Lcom/radaee/util/PDFGridItem;->m_bmp:Landroid/graphics/Bitmap;

    sget-object v1, Lcom/radaee/util/PDFGridItem;->m_def_pdf_icon:Landroid/graphics/Bitmap;

    if-eq v0, v1, :cond_1

    sget-object v1, Lcom/radaee/util/PDFGridItem;->m_def_dir_icon:Landroid/graphics/Bitmap;

    if-eq v0, v1, :cond_1

    sget-object v1, Lcom/radaee/util/PDFGridItem;->m_def_up_icon:Landroid/graphics/Bitmap;

    if-eq v0, v1, :cond_1

    sget-object v1, Lcom/radaee/util/PDFGridItem;->m_def_refresh_icon:Landroid/graphics/Bitmap;

    if-eq v0, v1, :cond_1

    if-eqz v0, :cond_1

    .line 85
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    const/4 v0, 0x0

    .line 86
    iput-object v0, p0, Lcom/radaee/util/PDFGridItem;->m_bmp:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method protected declared-synchronized page_set()V
    .locals 2

    monitor-enter p0

    .line 71
    :try_start_0
    invoke-virtual {p0}, Lcom/radaee/util/PDFGridItem;->removeAllViews()V

    .line 72
    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/radaee/util/PDFGridItem;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/radaee/util/PDFGridItem;->m_image:Landroid/widget/ImageView;

    .line 73
    iget-object v1, p0, Lcom/radaee/util/PDFGridItem;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 74
    iget-object v0, p0, Lcom/radaee/util/PDFGridItem;->m_image:Landroid/widget/ImageView;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 75
    iget-object v0, p0, Lcom/radaee/util/PDFGridItem;->m_image:Landroid/widget/ImageView;

    invoke-virtual {p0, v0}, Lcom/radaee/util/PDFGridItem;->addView(Landroid/view/View;)V

    .line 76
    iget-object v0, p0, Lcom/radaee/util/PDFGridItem;->m_name:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Lcom/radaee/util/PDFGridItem;->addView(Landroid/view/View;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method protected render()Z
    .locals 19

    move-object/from16 v1, p0

    .line 134
    iget-boolean v0, v1, Lcom/radaee/util/PDFGridItem;->m_cancel:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    return v2

    .line 137
    :cond_0
    sget-boolean v0, Lcom/radaee/pdf/Global;->save_thumb_in_cache:Z

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v0, :cond_2

    .line 139
    iget-object v0, v1, Lcom/radaee/util/PDFGridItem;->m_path:Ljava/lang/String;

    invoke-static {v0}, Lcom/radaee/util/CommonUtil;->getThumbName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 142
    invoke-virtual {v1}, Lcom/radaee/util/PDFGridItem;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5, v0}, Lcom/radaee/util/CommonUtil;->getOutputMediaFile(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    invoke-static {v5}, Lcom/radaee/util/CommonUtil;->loadThumb(Ljava/io/File;)Landroid/graphics/Bitmap;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 145
    invoke-direct {v1, v4, v5}, Lcom/radaee/util/PDFGridItem;->set_page(Lcom/radaee/pdf/Page;Landroid/graphics/Bitmap;)V

    return v3

    :cond_1
    move-object v5, v4

    goto :goto_0

    :cond_2
    move-object v0, v4

    move-object v5, v0

    .line 151
    :cond_3
    :goto_0
    invoke-direct {v1}, Lcom/radaee/util/PDFGridItem;->lock_file()V

    .line 152
    new-instance v6, Lcom/radaee/pdf/Document;

    invoke-direct {v6}, Lcom/radaee/pdf/Document;-><init>()V

    const/4 v7, 0x3

    .line 153
    invoke-static {v7}, Lcom/radaee/pdf/Document;->SetOpenFlag(I)V

    .line 154
    iget-object v7, v1, Lcom/radaee/util/PDFGridItem;->m_path:Ljava/lang/String;

    invoke-virtual {v6, v7, v4}, Lcom/radaee/pdf/Document;->Open(Ljava/lang/String;Ljava/lang/String;)I

    move-result v7

    .line 155
    invoke-static {v3}, Lcom/radaee/pdf/Document;->SetOpenFlag(I)V

    if-nez v7, :cond_7

    .line 158
    iget-object v7, v1, Lcom/radaee/util/PDFGridItem;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    .line 159
    iget-object v8, v1, Lcom/radaee/util/PDFGridItem;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    .line 160
    invoke-virtual {v6}, Lcom/radaee/pdf/Document;->GetPage0()Lcom/radaee/pdf/Page;

    move-result-object v9

    .line 161
    invoke-direct {v1, v9, v4}, Lcom/radaee/util/PDFGridItem;->set_page(Lcom/radaee/pdf/Page;Landroid/graphics/Bitmap;)V

    .line 164
    :try_start_0
    sget-object v10, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v7, v8, v10}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 165
    invoke-virtual {v5, v2}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 166
    invoke-virtual {v9, v5}, Lcom/radaee/pdf/Page;->RenderThumb(Landroid/graphics/Bitmap;)Z

    move-result v10

    if-nez v10, :cond_6

    .line 168
    invoke-virtual {v6, v2}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v10

    .line 169
    invoke-virtual {v6, v2}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v11

    int-to-float v7, v7

    div-float v12, v7, v10

    int-to-float v8, v8

    div-float v13, v8, v11

    cmpl-float v14, v12, v13

    if-lez v14, :cond_4

    move v12, v13

    .line 173
    :cond_4
    new-instance v13, Landroid/graphics/Canvas;

    invoke-direct {v13, v5}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 174
    new-instance v14, Landroid/graphics/Paint;

    invoke-direct {v14}, Landroid/graphics/Paint;-><init>()V

    const/16 v15, 0xff

    .line 175
    invoke-virtual {v14, v15, v15, v15, v15}, Landroid/graphics/Paint;->setARGB(IIII)V

    mul-float v10, v10, v12

    sub-float v15, v7, v10

    const/high16 v16, 0x40000000    # 2.0f

    div-float v15, v15, v16

    mul-float v11, v11, v12

    sub-float v17, v8, v11

    div-float v17, v17, v16

    add-float/2addr v7, v10

    div-float v7, v7, v16

    add-float/2addr v8, v11

    div-float v8, v8, v16

    move/from16 v16, v7

    move-object/from16 v18, v14

    move v14, v15

    move/from16 v15, v17

    move/from16 v17, v8

    .line 176
    invoke-virtual/range {v13 .. v18}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 178
    new-instance v7, Lcom/radaee/pdf/Matrix;

    neg-float v10, v12

    invoke-direct {v7, v12, v10, v14, v8}, Lcom/radaee/pdf/Matrix;-><init>(FFFF)V

    .line 179
    move-object v8, v4

    check-cast v8, Landroid/graphics/Bitmap;

    invoke-virtual {v9, v4}, Lcom/radaee/pdf/Page;->RenderPrepare(Landroid/graphics/Bitmap;)V

    .line 180
    invoke-virtual {v9, v5, v7}, Lcom/radaee/pdf/Page;->RenderToBmp(Landroid/graphics/Bitmap;Lcom/radaee/pdf/Matrix;)Z

    .line 181
    invoke-virtual {v7}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 182
    iget-object v7, v1, Lcom/radaee/util/PDFGridItem;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v7}, Lcom/radaee/pdf/Page;->RenderIsFinished()Z

    move-result v7

    if-nez v7, :cond_5

    .line 184
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->recycle()V

    move-object v5, v4

    goto :goto_1

    .line 187
    :cond_5
    sget-boolean v7, Lcom/radaee/pdf/Global;->save_thumb_in_cache:Z

    if-eqz v7, :cond_6

    .line 188
    invoke-virtual {v1}, Lcom/radaee/util/PDFGridItem;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7, v0}, Lcom/radaee/util/CommonUtil;->getOutputMediaFile(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/radaee/util/CommonUtil;->saveThumb(Landroid/graphics/Bitmap;Ljava/io/File;)V

    .line 191
    :cond_6
    :goto_1
    invoke-direct {v1, v4, v5}, Lcom/radaee/util/PDFGridItem;->set_page(Lcom/radaee/pdf/Page;Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 194
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 195
    :goto_2
    invoke-virtual {v9}, Lcom/radaee/pdf/Page;->Close()V

    .line 196
    invoke-virtual {v6}, Lcom/radaee/pdf/Document;->Close()V

    .line 198
    :cond_7
    invoke-direct {v1}, Lcom/radaee/util/PDFGridItem;->unlock_file()V

    if-eqz v5, :cond_8

    const/4 v2, 0x1

    :cond_8
    return v2
.end method

.method protected set_dir(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 91
    iput-object p2, p0, Lcom/radaee/util/PDFGridItem;->m_path:Ljava/lang/String;

    .line 92
    new-instance p2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/radaee/util/PDFGridItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/radaee/util/PDFGridItem;->m_name:Landroid/widget/TextView;

    .line 93
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    iget-object p2, p0, Lcom/radaee/util/PDFGridItem;->m_name:Landroid/widget/TextView;

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 95
    iget-object p2, p0, Lcom/radaee/util/PDFGridItem;->m_name:Landroid/widget/TextView;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 96
    iget-object p2, p0, Lcom/radaee/util/PDFGridItem;->m_name:Landroid/widget/TextView;

    sget v0, Lcom/radaee/util/PDFGridItem;->TEXT_COLOR:I

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 97
    new-instance p2, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/radaee/util/PDFGridItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/radaee/util/PDFGridItem;->m_image:Landroid/widget/ImageView;

    .line 98
    const-string v0, "."

    if-ne p1, v0, :cond_0

    .line 99
    sget-object p1, Lcom/radaee/util/PDFGridItem;->m_def_refresh_icon:Landroid/graphics/Bitmap;

    iput-object p1, p0, Lcom/radaee/util/PDFGridItem;->m_bmp:Landroid/graphics/Bitmap;

    goto :goto_0

    .line 100
    :cond_0
    const-string v0, ".."

    if-ne p1, v0, :cond_1

    .line 101
    sget-object p1, Lcom/radaee/util/PDFGridItem;->m_def_up_icon:Landroid/graphics/Bitmap;

    iput-object p1, p0, Lcom/radaee/util/PDFGridItem;->m_bmp:Landroid/graphics/Bitmap;

    goto :goto_0

    .line 103
    :cond_1
    sget-object p1, Lcom/radaee/util/PDFGridItem;->m_def_dir_icon:Landroid/graphics/Bitmap;

    iput-object p1, p0, Lcom/radaee/util/PDFGridItem;->m_bmp:Landroid/graphics/Bitmap;

    .line 104
    :goto_0
    iget-object p1, p0, Lcom/radaee/util/PDFGridItem;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 105
    iget-object p1, p0, Lcom/radaee/util/PDFGridItem;->m_image:Landroid/widget/ImageView;

    const/4 p2, 0x2

    invoke-virtual {p1, p2, p2, p2, p2}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 106
    iget-object p1, p0, Lcom/radaee/util/PDFGridItem;->m_name:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/radaee/util/PDFGridItem;->m_image:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getWidth()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setWidth(I)V

    .line 107
    iget-object p1, p0, Lcom/radaee/util/PDFGridItem;->m_image:Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Lcom/radaee/util/PDFGridItem;->addView(Landroid/view/View;)V

    .line 108
    iget-object p1, p0, Lcom/radaee/util/PDFGridItem;->m_name:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Lcom/radaee/util/PDFGridItem;->addView(Landroid/view/View;)V

    return-void
.end method

.method protected set_file(Lcom/radaee/util/PDFGridThread;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 112
    iput-object p3, p0, Lcom/radaee/util/PDFGridItem;->m_path:Ljava/lang/String;

    .line 113
    new-instance p3, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/radaee/util/PDFGridItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p3, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object p3, p0, Lcom/radaee/util/PDFGridItem;->m_name:Landroid/widget/TextView;

    .line 114
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    iget-object p2, p0, Lcom/radaee/util/PDFGridItem;->m_name:Landroid/widget/TextView;

    const/4 p3, 0x1

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 116
    iget-object p2, p0, Lcom/radaee/util/PDFGridItem;->m_name:Landroid/widget/TextView;

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setGravity(I)V

    .line 117
    iget-object p2, p0, Lcom/radaee/util/PDFGridItem;->m_name:Landroid/widget/TextView;

    sget p3, Lcom/radaee/util/PDFGridItem;->TEXT_COLOR:I

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 118
    new-instance p2, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/radaee/util/PDFGridItem;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/radaee/util/PDFGridItem;->m_image:Landroid/widget/ImageView;

    .line 119
    sget-object p3, Lcom/radaee/util/PDFGridItem;->m_def_pdf_icon:Landroid/graphics/Bitmap;

    iput-object p3, p0, Lcom/radaee/util/PDFGridItem;->m_bmp:Landroid/graphics/Bitmap;

    .line 120
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 121
    iget-object p2, p0, Lcom/radaee/util/PDFGridItem;->m_image:Landroid/widget/ImageView;

    const/4 p3, 0x2

    invoke-virtual {p2, p3, p3, p3, p3}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 122
    iget-object p2, p0, Lcom/radaee/util/PDFGridItem;->m_name:Landroid/widget/TextView;

    iget-object p3, p0, Lcom/radaee/util/PDFGridItem;->m_image:Landroid/widget/ImageView;

    invoke-virtual {p3}, Landroid/widget/ImageView;->getWidth()I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setWidth(I)V

    .line 123
    iget-object p2, p0, Lcom/radaee/util/PDFGridItem;->m_image:Landroid/widget/ImageView;

    invoke-virtual {p0, p2}, Lcom/radaee/util/PDFGridItem;->addView(Landroid/view/View;)V

    .line 124
    iget-object p2, p0, Lcom/radaee/util/PDFGridItem;->m_name:Landroid/widget/TextView;

    invoke-virtual {p0, p2}, Lcom/radaee/util/PDFGridItem;->addView(Landroid/view/View;)V

    .line 125
    invoke-virtual {p1, p0}, Lcom/radaee/util/PDFGridThread;->start_render(Lcom/radaee/util/PDFGridItem;)V

    return-void
.end method
