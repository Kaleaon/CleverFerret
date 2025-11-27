.class public Lcom/radaee/util/FileBrowserView$FileGridItem;
.super Landroid/widget/LinearLayout;
.source "FileBrowserView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/util/FileBrowserView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FileGridItem"
.end annotation


# instance fields
.field private m_bmp:Landroid/graphics/Bitmap;

.field private m_image:Landroid/widget/ImageView;

.field private m_name:Landroid/widget/TextView;

.field private m_path:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 30
    invoke-virtual {p0, p1}, Lcom/radaee/util/FileBrowserView$FileGridItem;->setBackgroundColor(I)V

    const/4 p1, 0x1

    .line 31
    invoke-virtual {p0, p1}, Lcom/radaee/util/FileBrowserView$FileGridItem;->setOrientation(I)V

    return-void
.end method


# virtual methods
.method public get_name()Ljava/lang/String;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_name:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public get_path()Ljava/lang/String;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_path:Ljava/lang/String;

    return-object v0
.end method

.method public is_dir()Z
    .locals 2

    .line 35
    iget-object v0, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_bmp:Landroid/graphics/Bitmap;

    sget-object v1, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_def_dir_icon:Landroid/graphics/Bitmap;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_bmp:Landroid/graphics/Bitmap;

    sget-object v1, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_def_up_icon:Landroid/graphics/Bitmap;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_bmp:Landroid/graphics/Bitmap;

    sget-object v1, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_def_refresh_icon:Landroid/graphics/Bitmap;

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

.method protected set_dir(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 47
    iput-object p2, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_path:Ljava/lang/String;

    .line 48
    new-instance p2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/radaee/util/FileBrowserView$FileGridItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_name:Landroid/widget/TextView;

    .line 49
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    iget-object p2, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_name:Landroid/widget/TextView;

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 51
    iget-object p2, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_name:Landroid/widget/TextView;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 52
    iget-object p2, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_name:Landroid/widget/TextView;

    sget v0, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->TEXT_COLOR:I

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 53
    new-instance p2, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/radaee/util/FileBrowserView$FileGridItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_image:Landroid/widget/ImageView;

    .line 54
    const-string p2, "."

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    sget-object p1, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_def_refresh_icon:Landroid/graphics/Bitmap;

    iput-object p1, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_bmp:Landroid/graphics/Bitmap;

    goto :goto_0

    .line 55
    :cond_0
    const-string p2, ".."

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    sget-object p1, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_def_up_icon:Landroid/graphics/Bitmap;

    iput-object p1, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_bmp:Landroid/graphics/Bitmap;

    goto :goto_0

    .line 56
    :cond_1
    sget-object p1, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_def_dir_icon:Landroid/graphics/Bitmap;

    iput-object p1, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_bmp:Landroid/graphics/Bitmap;

    .line 57
    :goto_0
    iget-object p1, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_image:Landroid/widget/ImageView;

    iget-object p2, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 58
    iget-object p1, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_image:Landroid/widget/ImageView;

    const/4 p2, 0x2

    invoke-virtual {p1, p2, p2, p2, p2}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 59
    iget-object p1, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_name:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_image:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getWidth()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setWidth(I)V

    .line 60
    iget-object p1, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_image:Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Lcom/radaee/util/FileBrowserView$FileGridItem;->addView(Landroid/view/View;)V

    .line 61
    iget-object p1, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_name:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Lcom/radaee/util/FileBrowserView$FileGridItem;->addView(Landroid/view/View;)V

    const/16 p1, 0x10

    .line 62
    invoke-virtual {p0, p1}, Lcom/radaee/util/FileBrowserView$FileGridItem;->setGravity(I)V

    return-void
.end method

.method protected set_file(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 66
    iput-object p2, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_path:Ljava/lang/String;

    .line 67
    new-instance p2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/radaee/util/FileBrowserView$FileGridItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_name:Landroid/widget/TextView;

    .line 68
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    iget-object p1, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_name:Landroid/widget/TextView;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 70
    iget-object p1, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_name:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setGravity(I)V

    .line 71
    iget-object p1, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_name:Landroid/widget/TextView;

    sget p2, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->TEXT_COLOR:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 72
    new-instance p1, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/radaee/util/FileBrowserView$FileGridItem;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_image:Landroid/widget/ImageView;

    .line 73
    sget-object p1, Lcom/radaee/util/FileBrowserView$FileBrowserAdt;->m_def_file_icon:Landroid/graphics/Bitmap;

    iput-object p1, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_bmp:Landroid/graphics/Bitmap;

    .line 74
    iget-object p2, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_image:Landroid/widget/ImageView;

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 75
    iget-object p1, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_image:Landroid/widget/ImageView;

    const/4 p2, 0x2

    invoke-virtual {p1, p2, p2, p2, p2}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 76
    iget-object p1, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_name:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_image:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getWidth()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setWidth(I)V

    .line 77
    iget-object p1, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_image:Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Lcom/radaee/util/FileBrowserView$FileGridItem;->addView(Landroid/view/View;)V

    .line 78
    iget-object p1, p0, Lcom/radaee/util/FileBrowserView$FileGridItem;->m_name:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Lcom/radaee/util/FileBrowserView$FileGridItem;->addView(Landroid/view/View;)V

    return-void
.end method
