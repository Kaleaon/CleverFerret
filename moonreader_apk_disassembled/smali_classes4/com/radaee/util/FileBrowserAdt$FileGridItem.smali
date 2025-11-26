.class public Lcom/radaee/util/FileBrowserAdt$FileGridItem;
.super Landroid/widget/LinearLayout;
.source "FileBrowserAdt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/util/FileBrowserAdt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FileGridItem"
.end annotation


# instance fields
.field private m_bmp:Landroid/graphics/Bitmap;

.field private m_image:Landroid/widget/ImageView;

.field private m_name:Landroid/widget/TextView;

.field private m_path:Ljava/lang/String;

.field final synthetic this$0:Lcom/radaee/util/FileBrowserAdt;


# direct methods
.method public constructor <init>(Lcom/radaee/util/FileBrowserAdt;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 32
    iput-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->this$0:Lcom/radaee/util/FileBrowserAdt;

    .line 33
    invoke-direct {p0, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    sget-object p1, Lcom/radaee/util/FileBrowserAdt;->m_def_file_icon:Landroid/graphics/Bitmap;

    if-nez p1, :cond_0

    .line 35
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p3, Lcom/radaee/viewlib/R$drawable;->ic_file:I

    invoke-static {p1, p3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    sput-object p1, Lcom/radaee/util/FileBrowserAdt;->m_def_file_icon:Landroid/graphics/Bitmap;

    .line 36
    :cond_0
    sget-object p1, Lcom/radaee/util/FileBrowserAdt;->m_def_dir_icon:Landroid/graphics/Bitmap;

    if-nez p1, :cond_1

    .line 37
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p3, Lcom/radaee/viewlib/R$drawable;->ic_folder:I

    invoke-static {p1, p3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    sput-object p1, Lcom/radaee/util/FileBrowserAdt;->m_def_dir_icon:Landroid/graphics/Bitmap;

    .line 38
    :cond_1
    sget-object p1, Lcom/radaee/util/FileBrowserAdt;->m_def_up_icon:Landroid/graphics/Bitmap;

    if-nez p1, :cond_2

    .line 39
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p3, Lcom/radaee/viewlib/R$drawable;->ic_go_up:I

    invoke-static {p1, p3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    sput-object p1, Lcom/radaee/util/FileBrowserAdt;->m_def_up_icon:Landroid/graphics/Bitmap;

    .line 40
    :cond_2
    sget-object p1, Lcom/radaee/util/FileBrowserAdt;->m_def_refresh_icon:Landroid/graphics/Bitmap;

    if-nez p1, :cond_3

    .line 41
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, Lcom/radaee/viewlib/R$drawable;->ic_refresh:I

    invoke-static {p1, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    sput-object p1, Lcom/radaee/util/FileBrowserAdt;->m_def_refresh_icon:Landroid/graphics/Bitmap;

    :cond_3
    const/4 p1, 0x0

    .line 42
    invoke-virtual {p0, p1}, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->setBackgroundColor(I)V

    const/4 p1, 0x1

    .line 43
    invoke-virtual {p0, p1}, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->setOrientation(I)V

    return-void
.end method


# virtual methods
.method public get_name()Ljava/lang/String;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_name:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public get_path()Ljava/lang/String;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_path:Ljava/lang/String;

    return-object v0
.end method

.method public is_dir()Z
    .locals 2

    .line 47
    iget-object v0, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_bmp:Landroid/graphics/Bitmap;

    sget-object v1, Lcom/radaee/util/FileBrowserAdt;->m_def_dir_icon:Landroid/graphics/Bitmap;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_bmp:Landroid/graphics/Bitmap;

    sget-object v1, Lcom/radaee/util/FileBrowserAdt;->m_def_up_icon:Landroid/graphics/Bitmap;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_bmp:Landroid/graphics/Bitmap;

    sget-object v1, Lcom/radaee/util/FileBrowserAdt;->m_def_refresh_icon:Landroid/graphics/Bitmap;

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

    .line 59
    iput-object p2, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_path:Ljava/lang/String;

    .line 60
    new-instance p2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_name:Landroid/widget/TextView;

    .line 61
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    iget-object p2, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_name:Landroid/widget/TextView;

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 63
    iget-object p2, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_name:Landroid/widget/TextView;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 64
    iget-object p2, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_name:Landroid/widget/TextView;

    sget v0, Lcom/radaee/util/FileBrowserAdt;->TEXT_COLOR:I

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 65
    new-instance p2, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_image:Landroid/widget/ImageView;

    .line 66
    const-string p2, "."

    if-ne p1, p2, :cond_0

    sget-object p1, Lcom/radaee/util/FileBrowserAdt;->m_def_refresh_icon:Landroid/graphics/Bitmap;

    iput-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_bmp:Landroid/graphics/Bitmap;

    goto :goto_0

    .line 67
    :cond_0
    const-string p2, ".."

    if-ne p1, p2, :cond_1

    sget-object p1, Lcom/radaee/util/FileBrowserAdt;->m_def_up_icon:Landroid/graphics/Bitmap;

    iput-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_bmp:Landroid/graphics/Bitmap;

    goto :goto_0

    .line 68
    :cond_1
    sget-object p1, Lcom/radaee/util/FileBrowserAdt;->m_def_dir_icon:Landroid/graphics/Bitmap;

    iput-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_bmp:Landroid/graphics/Bitmap;

    .line 69
    :goto_0
    iget-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_image:Landroid/widget/ImageView;

    iget-object p2, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 70
    iget-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_image:Landroid/widget/ImageView;

    const/4 p2, 0x2

    invoke-virtual {p1, p2, p2, p2, p2}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 71
    iget-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_name:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_image:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getWidth()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setWidth(I)V

    .line 72
    iget-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_image:Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->addView(Landroid/view/View;)V

    .line 73
    iget-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_name:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->addView(Landroid/view/View;)V

    const/16 p1, 0x10

    .line 74
    invoke-virtual {p0, p1}, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->setGravity(I)V

    return-void
.end method

.method protected set_file(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 78
    iput-object p2, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_path:Ljava/lang/String;

    .line 79
    new-instance p2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_name:Landroid/widget/TextView;

    .line 80
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    iget-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_name:Landroid/widget/TextView;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 82
    iget-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_name:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setGravity(I)V

    .line 83
    iget-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_name:Landroid/widget/TextView;

    sget p2, Lcom/radaee/util/FileBrowserAdt;->TEXT_COLOR:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 84
    new-instance p1, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_image:Landroid/widget/ImageView;

    .line 85
    sget-object p1, Lcom/radaee/util/FileBrowserAdt;->m_def_file_icon:Landroid/graphics/Bitmap;

    iput-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_bmp:Landroid/graphics/Bitmap;

    .line 86
    iget-object p2, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_image:Landroid/widget/ImageView;

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 87
    iget-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_image:Landroid/widget/ImageView;

    const/4 p2, 0x2

    invoke-virtual {p1, p2, p2, p2, p2}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 88
    iget-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_name:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_image:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getWidth()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setWidth(I)V

    .line 89
    iget-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_image:Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->addView(Landroid/view/View;)V

    .line 90
    iget-object p1, p0, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->m_name:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Lcom/radaee/util/FileBrowserAdt$FileGridItem;->addView(Landroid/view/View;)V

    return-void
.end method
