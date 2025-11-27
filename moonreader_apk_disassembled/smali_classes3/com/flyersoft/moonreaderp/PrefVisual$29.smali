.class Lcom/flyersoft/moonreaderp/PrefVisual$29;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefVisual;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 915
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$29;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetImageFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 917
    sput-object p2, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    if-nez p1, :cond_0

    goto :goto_1

    .line 920
    :cond_0
    sput-object p1, Lcom/flyersoft/tools/A;->backgroundImage:Ljava/lang/String;

    const/4 p1, 0x0

    .line 921
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getBackgroundImages(Z)Ljava/util/ArrayList;

    move-result-object p2

    invoke-static {}, Lcom/flyersoft/tools/A;->getBackgroundImageFile()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p2, v0, v1, p1}, Lcom/flyersoft/tools/A;->getImagesDrawable(Ljava/util/ArrayList;Ljava/lang/String;II)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 924
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$29;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pvBackgroundImage:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/imageview/ShapeableImageView;

    invoke-virtual {p1, p2}, Lcom/google/android/material/imageview/ShapeableImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 925
    sget-object p1, Lcom/flyersoft/tools/A;->baseFrame:Landroid/widget/FrameLayout;

    .line 926
    invoke-static {}, Lcom/flyersoft/tools/A;->getBackgroundImageFile()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getImagesDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 925
    invoke-static {p1, v0}, Lcom/flyersoft/tools/A;->setBackgroundDrawable(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 927
    sput-boolean v1, Lcom/flyersoft/tools/A;->useBackgroundImage:Z

    .line 928
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$29;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    sget v0, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->checkFontColor(Landroid/graphics/drawable/Drawable;I)V

    goto :goto_0

    .line 930
    :cond_1
    sput-boolean p1, Lcom/flyersoft/tools/A;->useBackgroundImage:Z

    .line 931
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$29;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mshowSaveThemeHint(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 932
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$29;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mshowBackgroundTypeIndicator(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 933
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$29;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mclearCurlCache(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 934
    sget-boolean p1, Lcom/flyersoft/tools/A;->imageWhiteTransparent:Z

    if-eqz p1, :cond_2

    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz p1, :cond_2

    .line 935
    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->clearTextViewImageSpan(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 936
    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    .line 937
    sget-object p1, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    :cond_2
    :goto_1
    return-void
.end method
