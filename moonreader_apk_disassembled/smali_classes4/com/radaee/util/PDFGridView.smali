.class public Lcom/radaee/util/PDFGridView;
.super Landroid/widget/GridView;
.source "PDFGridView.java"


# instance fields
.field private m_adt:Lcom/radaee/util/PDFGridAdt;

.field private m_cur:Ljava/lang/String;

.field private m_root:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/widget/GridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 19
    new-instance p2, Lcom/radaee/util/PDFGridAdt;

    invoke-direct {p2, p1}, Lcom/radaee/util/PDFGridAdt;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/radaee/util/PDFGridView;->m_adt:Lcom/radaee/util/PDFGridAdt;

    .line 20
    invoke-virtual {p0}, Lcom/radaee/util/PDFGridView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    .line 21
    iget p2, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    iget p1, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    if-le p2, p1, :cond_0

    const/4 p1, 0x5

    .line 22
    invoke-virtual {p0, p1}, Lcom/radaee/util/PDFGridView;->setNumColumns(I)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x3

    .line 24
    invoke-virtual {p0, p1}, Lcom/radaee/util/PDFGridView;->setNumColumns(I)V

    :goto_0
    const p1, -0xbbbbbc

    .line 25
    invoke-virtual {p0, p1}, Lcom/radaee/util/PDFGridView;->setBackgroundColor(I)V

    .line 26
    iget-object p1, p0, Lcom/radaee/util/PDFGridView;->m_adt:Lcom/radaee/util/PDFGridAdt;

    invoke-virtual {p0, p1}, Lcom/radaee/util/PDFGridView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method


# virtual methods
.method public PDFGotoSubdir(Ljava/lang/String;)V
    .locals 4

    .line 57
    iget-object v0, p0, Lcom/radaee/util/PDFGridView;->m_cur:Ljava/lang/String;

    .line 58
    const-string v1, "."

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    goto :goto_0

    .line 61
    :cond_0
    const-string v1, ".."

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 63
    iget-object p1, p0, Lcom/radaee/util/PDFGridView;->m_cur:Ljava/lang/String;

    const/16 v1, 0x2f

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result p1

    if-gez p1, :cond_1

    goto :goto_1

    .line 65
    :cond_1
    invoke-virtual {v0, v2, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 69
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 70
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 72
    :goto_0
    new-instance p1, Ljava/io/File;

    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 73
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 75
    iget-object v1, p0, Lcom/radaee/util/PDFGridView;->m_adt:Lcom/radaee/util/PDFGridAdt;

    invoke-virtual {v1}, Lcom/radaee/util/PDFGridAdt;->notifyDataSetInvalidated()V

    .line 76
    iput-object v0, p0, Lcom/radaee/util/PDFGridView;->m_cur:Ljava/lang/String;

    .line 77
    iget-object v1, p0, Lcom/radaee/util/PDFGridView;->m_adt:Lcom/radaee/util/PDFGridAdt;

    iget-object v3, p0, Lcom/radaee/util/PDFGridView;->m_root:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_3

    const/4 v2, 0x1

    :cond_3
    invoke-virtual {v1, p1, v2}, Lcom/radaee/util/PDFGridAdt;->set_dir(Ljava/io/File;Z)V

    :cond_4
    :goto_1
    return-void
.end method

.method public PDFSetRootPath(Ljava/lang/String;)V
    .locals 4

    .line 30
    iput-object p1, p0, Lcom/radaee/util/PDFGridView;->m_root:Ljava/lang/String;

    .line 31
    iput-object p1, p0, Lcom/radaee/util/PDFGridView;->m_cur:Ljava/lang/String;

    .line 32
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/radaee/util/PDFGridView;->m_cur:Ljava/lang/String;

    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 33
    invoke-virtual {p0}, Lcom/radaee/util/PDFGridView;->getWidth()I

    move-result v0

    .line 34
    invoke-virtual {p0}, Lcom/radaee/util/PDFGridView;->getHeight()I

    move-result v1

    const/4 v2, 0x5

    const/4 v3, 0x3

    if-gtz v0, :cond_2

    if-lez v1, :cond_0

    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/util/PDFGridView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 45
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    if-le v1, v0, :cond_1

    .line 46
    invoke-virtual {p0, v2}, Lcom/radaee/util/PDFGridView;->setNumColumns(I)V

    goto :goto_1

    .line 48
    :cond_1
    invoke-virtual {p0, v3}, Lcom/radaee/util/PDFGridView;->setNumColumns(I)V

    goto :goto_1

    :cond_2
    :goto_0
    if-le v0, v1, :cond_3

    .line 38
    invoke-virtual {p0, v2}, Lcom/radaee/util/PDFGridView;->setNumColumns(I)V

    goto :goto_1

    .line 40
    :cond_3
    invoke-virtual {p0, v3}, Lcom/radaee/util/PDFGridView;->setNumColumns(I)V

    .line 50
    :goto_1
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 52
    iget-object v0, p0, Lcom/radaee/util/PDFGridView;->m_adt:Lcom/radaee/util/PDFGridAdt;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/radaee/util/PDFGridAdt;->set_dir(Ljava/io/File;Z)V

    :cond_4
    return-void
.end method

.method public close()V
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/radaee/util/PDFGridView;->m_adt:Lcom/radaee/util/PDFGridAdt;

    if-eqz v0, :cond_0

    .line 83
    invoke-virtual {v0}, Lcom/radaee/util/PDFGridAdt;->destroy()V

    const/4 v0, 0x0

    .line 84
    iput-object v0, p0, Lcom/radaee/util/PDFGridView;->m_adt:Lcom/radaee/util/PDFGridAdt;

    :cond_0
    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 118
    invoke-virtual {p0}, Lcom/radaee/util/PDFGridView;->close()V

    .line 119
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/radaee/util/PDFGridView;->m_cur:Ljava/lang/String;

    return-object v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2

    .line 94
    invoke-super {p0, p1}, Landroid/widget/GridView;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 95
    iget v0, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 p1, 0x3

    .line 97
    invoke-virtual {p0, p1}, Lcom/radaee/util/PDFGridView;->setNumColumns(I)V

    return-void

    .line 99
    :cond_0
    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    const/4 p1, 0x5

    .line 101
    invoke-virtual {p0, p1}, Lcom/radaee/util/PDFGridView;->setNumColumns(I)V

    :cond_1
    return-void
.end method
