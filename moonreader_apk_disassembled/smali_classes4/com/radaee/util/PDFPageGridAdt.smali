.class public Lcom/radaee/util/PDFPageGridAdt;
.super Landroid/widget/BaseAdapter;
.source "PDFPageGridAdt.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;,
        Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;
    }
.end annotation


# static fields
.field private static ms_density:F


# instance fields
.field private m_ctx:Landroid/content/Context;

.field private m_doc:Lcom/radaee/pdf/Document;

.field private m_modified:Z

.field private m_pages:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

.field private m_pages_org:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

.field private m_thread:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/radaee/pdf/Document;)V
    .locals 4

    .line 206
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 207
    iput-object p1, p0, Lcom/radaee/util/PDFPageGridAdt;->m_ctx:Landroid/content/Context;

    .line 208
    iput-object p2, p0, Lcom/radaee/util/PDFPageGridAdt;->m_doc:Lcom/radaee/pdf/Document;

    .line 209
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    sput p1, Lcom/radaee/util/PDFPageGridAdt;->ms_density:F

    .line 210
    iget-object p1, p0, Lcom/radaee/util/PDFPageGridAdt;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {p1}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result p1

    .line 211
    new-array p2, p1, [Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    iput-object p2, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages_org:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    .line 212
    new-array p2, p1, [Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    iput-object p2, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    const/4 p2, 0x0

    :goto_0
    if-ge p2, p1, :cond_0

    .line 215
    new-instance v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;-><init>(Lcom/radaee/util/PDFPageGridAdt;Lcom/radaee/util/PDFPageGridAdt$1;)V

    .line 216
    iget-object v2, p0, Lcom/radaee/util/PDFPageGridAdt;->m_ctx:Landroid/content/Context;

    sget v3, Lcom/radaee/viewlib/R$layout;->item_page:I

    invoke-static {v2, v3, v1}, Landroid/widget/RelativeLayout;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_lay:Landroid/widget/RelativeLayout;

    .line 217
    iget-object v1, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_lay:Landroid/widget/RelativeLayout;

    sget v2, Lcom/radaee/viewlib/R$id;->img_page:I

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_img:Landroid/widget/ImageView;

    .line 218
    sget v1, Lcom/radaee/util/PDFPageGridAdt;->ms_density:F

    const/high16 v2, 0x42c80000    # 100.0f

    mul-float v1, v1, v2

    float-to-int v1, v1

    iput v1, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_w:I

    .line 219
    sget v1, Lcom/radaee/util/PDFPageGridAdt;->ms_density:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    iput v1, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_h:I

    .line 220
    iput p2, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_pageno:I

    .line 221
    iget-object v1, p0, Lcom/radaee/util/PDFPageGridAdt;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v1, p2}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v1

    .line 222
    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->GetRotate()I

    move-result v2

    iput v2, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_rotate:I

    .line 223
    iget v2, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_rotate:I

    iput v2, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_rotate_org:I

    .line 224
    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->Close()V

    .line 225
    iget-object v1, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages_org:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    aput-object v0, v1, p2

    .line 226
    iget-object v1, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    aput-object v0, v1, p2

    .line 228
    iget-object v1, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_lay:Landroid/widget/RelativeLayout;

    sget v2, Lcom/radaee/viewlib/R$id;->img_rotate:I

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 229
    new-instance v2, Lcom/radaee/util/PDFPageGridAdt$1;

    invoke-direct {v2, p0, v0}, Lcom/radaee/util/PDFPageGridAdt$1;-><init>(Lcom/radaee/util/PDFPageGridAdt;Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 242
    iget-object v1, v0, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_lay:Landroid/widget/RelativeLayout;

    sget v2, Lcom/radaee/viewlib/R$id;->img_delete:I

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 243
    new-instance v2, Lcom/radaee/util/PDFPageGridAdt$2;

    invoke-direct {v2, p0, v0}, Lcom/radaee/util/PDFPageGridAdt$2;-><init>(Lcom/radaee/util/PDFPageGridAdt;Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 257
    :cond_0
    new-instance p1, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;

    new-instance p2, Lcom/radaee/util/PDFPageGridAdt$3;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p2, p0, v0}, Lcom/radaee/util/PDFPageGridAdt$3;-><init>(Lcom/radaee/util/PDFPageGridAdt;Landroid/os/Looper;)V

    invoke-direct {p1, p0, p2}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;-><init>(Lcom/radaee/util/PDFPageGridAdt;Landroid/os/Handler;)V

    iput-object p1, p0, Lcom/radaee/util/PDFPageGridAdt;->m_thread:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;

    .line 269
    invoke-virtual {p1}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->start()V

    return-void
.end method

.method static synthetic access$000(Lcom/radaee/util/PDFPageGridAdt;)Lcom/radaee/pdf/Document;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/radaee/util/PDFPageGridAdt;->m_doc:Lcom/radaee/pdf/Document;

    return-object p0
.end method

.method static synthetic access$302(Lcom/radaee/util/PDFPageGridAdt;Z)Z
    .locals 0

    .line 18
    iput-boolean p1, p0, Lcom/radaee/util/PDFPageGridAdt;->m_modified:Z

    return p1
.end method

.method static synthetic access$400(Lcom/radaee/util/PDFPageGridAdt;)[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    return-object p0
.end method

.method static synthetic access$500(Lcom/radaee/util/PDFPageGridAdt;)Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/radaee/util/PDFPageGridAdt;->m_thread:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;

    return-object p0
.end method

.method static synthetic access$600(Lcom/radaee/util/PDFPageGridAdt;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Lcom/radaee/util/PDFPageGridAdt;->refresh_pages()V

    return-void
.end method

.method private dp2px(F)I
    .locals 1

    .line 203
    sget v0, Lcom/radaee/util/PDFPageGridAdt;->ms_density:F

    mul-float p1, p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private refresh_pages()V
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 187
    :goto_0
    iget-object v3, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages_org:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    array-length v4, v3

    if-ge v1, v4, :cond_1

    .line 189
    aget-object v3, v3, v1

    .line 190
    iget-boolean v3, v3, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_deleted:Z

    if-nez v3, :cond_0

    add-int/lit8 v2, v2, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 192
    :cond_1
    new-array v1, v2, [Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    iput-object v1, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    const/4 v1, 0x0

    .line 194
    :goto_1
    iget-object v2, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages_org:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    array-length v3, v2

    if-ge v0, v3, :cond_3

    .line 196
    aget-object v2, v2, v0

    .line 197
    iget-boolean v3, v2, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_deleted:Z

    if-nez v3, :cond_2

    iget-object v3, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    add-int/lit8 v4, v1, 0x1

    aput-object v2, v3, v1

    move v1, v4

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 199
    :cond_3
    invoke-virtual {p0}, Lcom/radaee/util/PDFPageGridAdt;->notifyDataSetChanged()V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 274
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridAdt;->m_thread:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;

    invoke-virtual {v0}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->destroy()V

    return-void
.end method

.method public getCount()I
    .locals 1

    .line 296
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridAdt;->m_doc:Lcom/radaee/pdf/Document;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 297
    :cond_0
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    array-length v0, v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 302
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridAdt;->m_doc:Lcom/radaee/pdf/Document;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 303
    :cond_0
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getRemoval()[Z
    .locals 4

    .line 321
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages_org:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    array-length v0, v0

    new-array v0, v0, [Z

    const/4 v1, 0x0

    .line 322
    :goto_0
    iget-object v2, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages_org:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 324
    aget-object v2, v2, v1

    iget-boolean v2, v2, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_deleted:Z

    aput-boolean v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public getRotate()[I
    .locals 4

    .line 330
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages_org:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    array-length v0, v0

    new-array v0, v0, [I

    const/4 v1, 0x0

    .line 331
    :goto_0
    iget-object v2, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages_org:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 333
    aget-object v2, v2, v1

    iget v2, v2, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_rotate:I

    iget-object v3, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages_org:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    aget-object v3, v3, v1

    iget v3, v3, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_rotate_org:I

    shl-int/lit8 v3, v3, 0x10

    or-int/2addr v2, v3

    aput v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 313
    iget-object p2, p0, Lcom/radaee/util/PDFPageGridAdt;->m_doc:Lcom/radaee/pdf/Document;

    const/4 p3, 0x0

    if-nez p2, :cond_0

    return-object p3

    .line 314
    :cond_0
    iget-object p2, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    aget-object p1, p2, p1

    if-nez p1, :cond_1

    return-object p3

    .line 316
    :cond_1
    iget-object p1, p1, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;->m_lay:Landroid/widget/RelativeLayout;

    return-object p1
.end method

.method public isModified()Z
    .locals 1

    .line 339
    iget-boolean v0, p0, Lcom/radaee/util/PDFPageGridAdt;->m_modified:Z

    return v0
.end method

.method public refresh_range(II)V
    .locals 4

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    .line 282
    iget-object v1, p0, Lcom/radaee/util/PDFPageGridAdt;->m_thread:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;

    iget-object v2, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    add-int/lit8 v3, v0, 0x1

    aget-object v0, v2, v0

    invoke-virtual {v1, v0}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->end_render(Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;)V

    move v0, v3

    goto :goto_0

    :cond_0
    :goto_1
    if-ge v0, p2, :cond_1

    .line 286
    iget-object p1, p0, Lcom/radaee/util/PDFPageGridAdt;->m_thread:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;

    iget-object v1, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    add-int/lit8 v2, v0, 0x1

    aget-object v0, v1, v0

    invoke-virtual {p1, v0}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->start_render(Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;)V

    move v0, v2

    goto :goto_1

    .line 288
    :cond_1
    :goto_2
    iget-object p1, p0, Lcom/radaee/util/PDFPageGridAdt;->m_pages:[Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;

    array-length p2, p1

    if-ge v0, p2, :cond_2

    .line 290
    iget-object p2, p0, Lcom/radaee/util/PDFPageGridAdt;->m_thread:Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;

    add-int/lit8 v1, v0, 0x1

    aget-object p1, p1, v0

    invoke-virtual {p2, p1}, Lcom/radaee/util/PDFPageGridAdt$PDFPageGridThread;->end_render(Lcom/radaee/util/PDFPageGridAdt$PDFPageGridItem;)V

    move v0, v1

    goto :goto_2

    :cond_2
    return-void
.end method
