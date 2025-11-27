.class Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;
.super Ljava/lang/Object;
.source "PDFPageGridAdt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/util/PDFPageGridAdt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PDFPageGridItem"
.end annotation


# instance fields
.field m_bmp:Landroid/graphics/Bitmap;

.field m_deleted:Z

.field m_h:I

.field m_img:Landroid/widget/ImageView;

.field m_lay:Landroid/widget/RelativeLayout;

.field m_page:Lcom/radaee/pdf/Page;

.field m_pageno:I

.field m_rotate:I

.field m_rotate_org:I

.field m_status:I

.field m_w:I

.field final synthetic this$0:Lcom/radaee/util/PDFPageGridAdt;


# direct methods
.method private constructor <init>(Lcom/radaee/util/PDFPageGridAdt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 19
    iput-object p1, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->this$0:Lcom/radaee/util/PDFPageGridAdt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/radaee/util/PDFPageGridAdt;Lcom/radaee/util/PDFPageGridAdt$1;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;-><init>(Lcom/radaee/util/PDFPageGridAdt;)V

    return-void
.end method


# virtual methods
.method clear()Z
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_page:Lcom/radaee/pdf/Page;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 53
    :cond_0
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    const/4 v0, 0x0

    .line 54
    iput-object v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_page:Lcom/radaee/pdf/Page;

    const/4 v0, 0x1

    return v0
.end method

.method render()Z
    .locals 8

    .line 23
    iget v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_status:I

    const/4 v1, 0x0

    if-gez v0, :cond_0

    return v1

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->this$0:Lcom/radaee/util/PDFPageGridAdt;

    invoke-static {v0}, Lcom/radaee/util/PDFPageGridAdt;->access$000(Lcom/radaee/util/PDFPageGridAdt;)Lcom/radaee/pdf/Document;

    move-result-object v0

    iget v2, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_pageno:I

    invoke-virtual {v0, v2}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v0

    .line 25
    iget-object v2, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->this$0:Lcom/radaee/util/PDFPageGridAdt;

    invoke-static {v2}, Lcom/radaee/util/PDFPageGridAdt;->access$000(Lcom/radaee/util/PDFPageGridAdt;)Lcom/radaee/pdf/Document;

    move-result-object v2

    iget v3, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_pageno:I

    invoke-virtual {v2, v3}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v2

    .line 26
    iget v3, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_w:I

    int-to-float v3, v3

    div-float/2addr v3, v0

    .line 27
    iget v4, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_h:I

    int-to-float v4, v4

    div-float/2addr v4, v2

    cmpl-float v5, v3, v4

    if-lez v5, :cond_1

    move v3, v4

    :cond_1
    mul-float v0, v0, v3

    float-to-int v0, v0

    mul-float v2, v2, v4

    float-to-int v2, v2

    .line 31
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v2, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    const/4 v4, -0x1

    .line 32
    invoke-virtual {v0, v4}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 33
    iget-object v4, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->this$0:Lcom/radaee/util/PDFPageGridAdt;

    invoke-static {v4}, Lcom/radaee/util/PDFPageGridAdt;->access$000(Lcom/radaee/util/PDFPageGridAdt;)Lcom/radaee/pdf/Document;

    move-result-object v4

    iget v5, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_pageno:I

    invoke-virtual {v4, v5}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v4

    .line 34
    new-instance v5, Lcom/radaee/pdf/Matrix;

    neg-float v6, v3

    const/4 v7, 0x0

    int-to-float v2, v2

    invoke-direct {v5, v3, v6, v7, v2}, Lcom/radaee/pdf/Matrix;-><init>(FFFF)V

    .line 35
    iput-object v4, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_page:Lcom/radaee/pdf/Page;

    .line 36
    invoke-virtual {v4, v0, v5}, Lcom/radaee/pdf/Page;->RenderToBmp(Landroid/graphics/Bitmap;Lcom/radaee/pdf/Matrix;)Z

    .line 37
    invoke-virtual {v5}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 38
    iget v2, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_status:I

    if-gez v2, :cond_2

    .line 40
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    return v1

    .line 45
    :cond_2
    iput-object v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_bmp:Landroid/graphics/Bitmap;

    const/4 v0, 0x2

    .line 46
    iput v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_status:I

    const/4 v0, 0x1

    return v0
.end method

.method render_end()Z
    .locals 1

    .line 78
    iget v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_status:I

    if-lez v0, :cond_0

    const/4 v0, -0x1

    .line 80
    iput v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_status:I

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method render_start()Z
    .locals 1

    .line 69
    iget v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_status:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 71
    iput v0, p0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_status:I

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
