.class Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "PrefShareText.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefShareText;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SliderCard"
.end annotation


# instance fields
.field base:Landroid/view/View;

.field iv:Landroid/widget/ImageView;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShareText;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/PrefShareText;Landroid/view/View;)V
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

    .line 384
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    .line 385
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 386
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->base:Landroid/view/View;

    .line 387
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->iv_book:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->iv:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method getHeight(I)I
    .locals 1

    if-nez p1, :cond_0

    .line 391
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShareText;->bm1:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    return p1

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 392
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShareText;->bm2:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    return p1

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    .line 393
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShareText;->bm3:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    return p1

    .line 394
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShareText;->bm4:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    return p1
.end method

.method setContent(I)V
    .locals 4

    .line 398
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->itemView:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 399
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->getHeight(I)I

    move-result v1

    const/high16 v2, 0x42700000    # 60.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    sub-int/2addr v1, v3

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 400
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->fl:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    sub-int/2addr v1, v2

    .line 401
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    if-le v2, v1, :cond_0

    .line 402
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 403
    :cond_0
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    mul-int v1, v1, v2

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    div-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    const/4 v1, 0x0

    .line 404
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    const/high16 v1, 0x40800000    # 4.0f

    .line 405
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 406
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->iv:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 407
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->iv:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-virtual {v2, p1}, Lcom/flyersoft/moonreaderp/PrefShareText;->getBitmap(I)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/flyersoft/tools/T;->bitmapToDrawble(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
