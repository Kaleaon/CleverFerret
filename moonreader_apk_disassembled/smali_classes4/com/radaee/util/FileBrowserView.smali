.class public Lcom/radaee/util/FileBrowserView;
.super Landroid/widget/GridView;
.source "FileBrowserView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/util/FileBrowserView$FileBrowserAdt;,
        Lcom/radaee/util/FileBrowserView$FileGridItem;
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private m_browse_adt:Lcom/radaee/util/FileBrowserView$FileBrowserAdt;

.field private m_cur:Ljava/lang/String;

.field private m_root:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 246
    invoke-direct {p0, p1, p2}, Landroid/widget/GridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 247
    iput-object p1, p0, Lcom/radaee/util/FileBrowserView;->mContext:Landroid/content/Context;

    return-void
.end method

.method private updateCols(II)V
    .locals 2

    mul-int/lit8 v0, p1, 0x3

    mul-int/lit8 v1, p2, 0x5

    if-le v0, v1, :cond_0

    const/4 p1, 0x5

    .line 298
    invoke-virtual {p0, p1}, Lcom/radaee/util/FileBrowserView;->setNumColumns(I)V

    return-void

    :cond_0
    if-le p1, p2, :cond_1

    const/4 p1, 0x4

    .line 300
    invoke-virtual {p0, p1}, Lcom/radaee/util/FileBrowserView;->setNumColumns(I)V

    return-void

    :cond_1
    const/4 p1, 0x3

    .line 302
    invoke-virtual {p0, p1}, Lcom/radaee/util/FileBrowserView;->setNumColumns(I)V

    return-void
.end method


# virtual methods
.method public FileGotoSubdir(Ljava/lang/String;)V
    .locals 4

    .line 266
    iget-object v0, p0, Lcom/radaee/util/FileBrowserView;->m_cur:Ljava/lang/String;

    .line 267
    const-string v1, "."

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    goto :goto_0

    .line 268
    :cond_0
    const-string v1, ".."

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 269
    iget-object p1, p0, Lcom/radaee/util/FileBrowserView;->m_cur:Ljava/lang/String;

    const/16 v1, 0x2f

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result p1

    if-gez p1, :cond_1

    goto :goto_1

    .line 271
    :cond_1
    invoke-virtual {v0, v2, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 273
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 274
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 276
    :goto_0
    new-instance p1, Ljava/io/File;

    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 277
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 278
    iget-object v1, p0, Lcom/radaee/util/FileBrowserView;->m_browse_adt:Lcom/radaee/util/FileBrowserView$FileBrowserAdt;

    invoke-virtual {v1}, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->notifyDataSetInvalidated()V

    .line 279
    iput-object v0, p0, Lcom/radaee/util/FileBrowserView;->m_cur:Ljava/lang/String;

    .line 280
    iget-object v1, p0, Lcom/radaee/util/FileBrowserView;->m_browse_adt:Lcom/radaee/util/FileBrowserView$FileBrowserAdt;

    iget-object v3, p0, Lcom/radaee/util/FileBrowserView;->m_root:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_3

    const/4 v2, 0x1

    :cond_3
    invoke-virtual {v1, p1, v2}, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->set_dir(Ljava/io/File;Z)V

    :cond_4
    :goto_1
    return-void
.end method

.method public FileInit(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 2

    .line 251
    new-instance v0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;

    iget-object v1, p0, Lcom/radaee/util/FileBrowserView;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p2}, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;-><init>(Landroid/content/Context;[Ljava/lang/String;)V

    iput-object v0, p0, Lcom/radaee/util/FileBrowserView;->m_browse_adt:Lcom/radaee/util/FileBrowserView$FileBrowserAdt;

    .line 252
    invoke-virtual {p0, v0}, Lcom/radaee/util/FileBrowserView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 254
    iput-object p1, p0, Lcom/radaee/util/FileBrowserView;->m_root:Ljava/lang/String;

    .line 255
    iput-object p1, p0, Lcom/radaee/util/FileBrowserView;->m_cur:Ljava/lang/String;

    .line 256
    new-instance p1, Ljava/io/File;

    iget-object p2, p0, Lcom/radaee/util/FileBrowserView;->m_cur:Ljava/lang/String;

    invoke-direct {p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 257
    invoke-virtual {p0}, Lcom/radaee/util/FileBrowserView;->getWidth()I

    move-result p2

    .line 258
    invoke-virtual {p0}, Lcom/radaee/util/FileBrowserView;->getHeight()I

    move-result v0

    .line 259
    invoke-direct {p0, p2, v0}, Lcom/radaee/util/FileBrowserView;->updateCols(II)V

    .line 260
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 261
    iget-object p2, p0, Lcom/radaee/util/FileBrowserView;->m_browse_adt:Lcom/radaee/util/FileBrowserView$FileBrowserAdt;

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->set_dir(Ljava/io/File;Z)V

    :cond_0
    return-void
.end method

.method public close()V
    .locals 1

    .line 285
    iget-object v0, p0, Lcom/radaee/util/FileBrowserView;->m_browse_adt:Lcom/radaee/util/FileBrowserView$FileBrowserAdt;

    if-eqz v0, :cond_0

    .line 286
    invoke-virtual {v0}, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->destroy()V

    const/4 v0, 0x0

    .line 287
    iput-object v0, p0, Lcom/radaee/util/FileBrowserView;->m_browse_adt:Lcom/radaee/util/FileBrowserView$FileBrowserAdt;

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

    .line 313
    invoke-virtual {p0}, Lcom/radaee/util/FileBrowserView;->close()V

    .line 314
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .line 292
    iget-object v0, p0, Lcom/radaee/util/FileBrowserView;->m_cur:Ljava/lang/String;

    return-object v0
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 307
    invoke-direct {p0, p1, p2}, Lcom/radaee/util/FileBrowserView;->updateCols(II)V

    .line 308
    invoke-virtual {p0}, Lcom/radaee/util/FileBrowserView;->invalidate()V

    .line 309
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/GridView;->onSizeChanged(IIII)V

    return-void
.end method
