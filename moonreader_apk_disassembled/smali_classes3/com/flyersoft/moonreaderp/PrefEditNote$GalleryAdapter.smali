.class Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;
.super Landroid/widget/BaseAdapter;
.source "PrefEditNote.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefEditNote;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GalleryAdapter"
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field mGalleryItemBackground:I

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefEditNote;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/PrefEditNote;Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 199
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefEditNote;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 200
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;->mContext:Landroid/content/Context;

    .line 202
    :try_start_0
    sget-object p1, Lcom/flyersoft/moonreaderp/R$styleable;->Gallery:[I

    invoke-virtual {p2, p1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 203
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->Gallery_android_galleryItemBackground:I

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;->mGalleryItemBackground:I

    .line 205
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 207
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    const/4 v0, 0x4

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 216
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    if-nez p2, :cond_0

    .line 226
    new-instance p2, Landroid/widget/ImageView;

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;->mContext:Landroid/content/Context;

    invoke-direct {p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    goto :goto_0

    .line 228
    :cond_0
    check-cast p2, Landroid/widget/ImageView;

    .line 230
    :goto_0
    sget-object p3, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 231
    new-instance p3, Landroid/widget/Gallery$LayoutParams;

    const/high16 v0, 0x42c80000    # 100.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    const/4 v1, -0x1

    invoke-direct {p3, v0, v1}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 232
    iget p3, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;->mGalleryItemBackground:I

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    const/4 p3, 0x3

    if-ne p1, p3, :cond_1

    .line 233
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/note_img.png"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_1

    .line 234
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefEditNote;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefEditNote;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p1, p3}, Lcom/flyersoft/tools/T;->getFileDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-object p2

    :cond_1
    if-nez p1, :cond_2

    .line 236
    sget p1, Lcom/flyersoft/moonreaderp/R$drawable;->note_0_1:I

    goto :goto_1

    :cond_2
    const/4 p3, 0x1

    if-ne p1, p3, :cond_3

    .line 237
    sget p1, Lcom/flyersoft/moonreaderp/R$drawable;->note_1:I

    goto :goto_1

    :cond_3
    const/4 p3, 0x2

    if-ne p1, p3, :cond_4

    .line 238
    sget p1, Lcom/flyersoft/moonreaderp/R$drawable;->note_2:I

    goto :goto_1

    .line 239
    :cond_4
    sget p1, Lcom/flyersoft/moonreaderp/R$drawable;->note_3:I

    .line 236
    :goto_1
    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-object p2
.end method
