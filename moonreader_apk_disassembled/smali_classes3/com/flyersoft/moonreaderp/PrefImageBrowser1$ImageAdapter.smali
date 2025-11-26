.class public Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;
.super Landroid/widget/BaseAdapter;
.source "PrefImageBrowser1.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefImageBrowser1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ImageAdapter"
.end annotation


# instance fields
.field onMenuClick:Landroid/view/View$OnClickListener;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;Landroid/content/Context;)V
    .locals 0
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

    .line 196
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 264
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->onMenuClick:Landroid/view/View$OnClickListener;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 199
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 203
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
    .locals 5

    if-nez p2, :cond_0

    .line 213
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget p3, Lcom/flyersoft/moonreaderp/R$layout;->theme_item:I

    const/4 v0, 0x0

    invoke-virtual {p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    const/high16 p3, 0x40000000    # 2.0f

    .line 214
    invoke-static {p3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p3

    .line 215
    invoke-virtual {p2, p3, p3, p3, p3}, Landroid/view/View;->setPadding(IIII)V

    .line 216
    new-instance p3, Landroid/widget/AbsListView$LayoutParams;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget v0, v0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->gridHeight:I

    const/4 v1, -0x1

    invoke-direct {p3, v1, v0}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 221
    :cond_0
    sget p3, Lcom/flyersoft/moonreaderp/R$id;->name:I

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    .line 222
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/high16 v1, 0x41400000    # 12.0f

    .line 223
    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const v1, -0x222223

    .line 224
    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v1, 0x3f800000    # 1.0f

    .line 225
    invoke-static {v1}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v2

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v1

    const v4, -0xeeeeef

    invoke-virtual {p3, v2, v3, v1, v4}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 228
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/A$MyDrawable;

    .line 229
    iget v2, v1, Lcom/flyersoft/tools/A$MyDrawable;->from:I

    const/4 v3, 0x0

    if-nez v2, :cond_1

    .line 230
    iget-object v2, v1, Lcom/flyersoft/tools/A$MyDrawable;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 231
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 232
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 233
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->onMenuClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 235
    :cond_1
    const-string p1, ""

    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 p1, 0x8

    .line 236
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 238
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->imageCache:Ljava/util/HashMap;

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 239
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->tile_display:Z

    if-eqz p1, :cond_2

    .line 240
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->imageCache:Ljava/util/HashMap;

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/Drawable;

    invoke-static {p3, p1}, Lcom/flyersoft/tools/A;->setBackgroundDrawable(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    return-object p2

    .line 242
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->imageCache:Ljava/util/HashMap;

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    return-object p2

    .line 245
    :cond_3
    iget p1, v1, Lcom/flyersoft/tools/A$MyDrawable;->from:I

    if-nez p1, :cond_4

    .line 246
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, v1, Lcom/flyersoft/tools/A$MyDrawable;->filename:Ljava/lang/String;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget v2, v2, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->gridWidth:I

    invoke-static {p1, v0, v2}, Lcom/flyersoft/tools/T;->getFileDrawableForWidth(Landroid/content/Context;Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_2

    .line 248
    :cond_4
    iget p1, v1, Lcom/flyersoft/tools/A$MyDrawable;->from:I

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->tile_display:Z

    if-nez p1, :cond_5

    const/4 p1, 0x0

    goto :goto_1

    :cond_5
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->imageSize:I

    :goto_1
    invoke-static {v1, p1, v3}, Lcom/flyersoft/tools/A;->getDrawableFromDI(Lcom/flyersoft/tools/A$MyDrawable;II)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 250
    :goto_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->imageCache:Ljava/util/HashMap;

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$ImageAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->tile_display:Z

    if-eqz v0, :cond_6

    .line 252
    invoke-static {p3, p1}, Lcom/flyersoft/tools/A;->setBackgroundDrawable(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    return-object p2

    .line 254
    :cond_6
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p2

    :catch_0
    move-exception p1

    .line 258
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :catch_1
    return-object p2
.end method
