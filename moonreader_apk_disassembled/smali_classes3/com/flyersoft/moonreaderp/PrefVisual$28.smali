.class Lcom/flyersoft/moonreaderp/PrefVisual$28;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;


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

    .line 891
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$28;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getColor(I)V
    .locals 3

    .line 893
    invoke-static {p1}, Lcom/flyersoft/tools/A;->deleteAlphaOfColor(I)I

    move-result p1

    .line 894
    sget v0, Lcom/flyersoft/tools/A;->backgroundColor:I

    if-ne p1, v0, :cond_0

    sget-boolean v0, Lcom/flyersoft/tools/A;->useBackgroundImage:Z

    if-eqz v0, :cond_2

    .line 895
    :cond_0
    sput p1, Lcom/flyersoft/tools/A;->backgroundColor:I

    .line 896
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual$28;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->checkFontColor(Landroid/graphics/drawable/Drawable;I)V

    const/4 v0, 0x0

    .line 897
    sput-boolean v0, Lcom/flyersoft/tools/A;->useBackgroundImage:Z

    .line 899
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$28;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pvBackgroundColor:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/imageview/ShapeableImageView;

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v2, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v2}, Lcom/google/android/material/imageview/ShapeableImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 900
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$28;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->backColorTv:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-static {p1, v0, v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->colorToHex(IZZ)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 901
    sget-object v0, Lcom/flyersoft/tools/A;->baseFrame:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_1

    .line 902
    sget-object v0, Lcom/flyersoft/tools/A;->baseFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 903
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$28;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mshowSaveThemeHint(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 904
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$28;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mclearCurlCache(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 905
    sget-boolean p1, Lcom/flyersoft/tools/A;->imageWhiteTransparent:Z

    if-eqz p1, :cond_2

    sget-object p1, Lcom/flyersoft/tools/A;->contentLay:Lcom/flyersoft/views/ContentLay;

    if-eqz p1, :cond_2

    .line 906
    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->clearTextViewImageSpan(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 907
    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    .line 908
    sget-object p1, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    .line 911
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$28;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mshowBackgroundTypeIndicator(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    return-void
.end method
