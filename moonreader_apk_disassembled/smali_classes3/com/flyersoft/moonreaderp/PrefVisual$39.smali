.class Lcom/flyersoft/moonreaderp/PrefVisual$39;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->setBackgroundTransparency()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

.field final synthetic val$alphaSk:Landroid/widget/SeekBar;

.field final synthetic val$blurSk:Landroid/widget/SeekBar;

.field final synthetic val$dialog:Landroidx/appcompat/app/AlertDialog;

.field final synthetic val$iv:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/widget/SeekBar;Landroid/widget/SeekBar;Landroid/widget/ImageView;Landroidx/appcompat/app/AlertDialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1225
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$39;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$39;->val$alphaSk:Landroid/widget/SeekBar;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefVisual$39;->val$blurSk:Landroid/widget/SeekBar;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefVisual$39;->val$iv:Landroid/widget/ImageView;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefVisual$39;->val$dialog:Landroidx/appcompat/app/AlertDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1228
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$39;->val$alphaSk:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    .line 1229
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual$39;->val$blurSk:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    .line 1231
    sget-object v1, Lcom/flyersoft/tools/A;->backgroundImage:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getImageAlpha(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne p1, v1, :cond_1

    sget-object v1, Lcom/flyersoft/tools/A;->backgroundImage:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getImageBlur(Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    .line 1232
    :cond_1
    :goto_0
    sget-object v1, Lcom/flyersoft/tools/A;->backgroundImage:Ljava/lang/String;

    invoke-static {v1, p1}, Lcom/flyersoft/tools/A;->setImageAlpha(Ljava/lang/String;I)V

    .line 1233
    sget-object v1, Lcom/flyersoft/tools/A;->backgroundImage:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/flyersoft/tools/A;->setImageBlur(Ljava/lang/String;I)V

    .line 1234
    sget-object v1, Lcom/flyersoft/tools/A;->backgroundImage:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getImageAlphaFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    const/16 v1, 0xff

    if-ne p1, v1, :cond_2

    if-eqz v0, :cond_3

    .line 1236
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual$39;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$39;->val$iv:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mcreateBackgroundBitmap(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 1238
    sget-object v0, Lcom/flyersoft/tools/A;->backgroundImage:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getImageAlphaFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->bitmapToFile(Landroid/graphics/Bitmap;Ljava/lang/String;)Z

    :cond_3
    const/4 p1, 0x1

    .line 1241
    :goto_1
    sget-boolean v0, Lcom/flyersoft/tools/A;->useBackgroundImage:Z

    if-nez v0, :cond_4

    const/4 p1, 0x1

    :cond_4
    if-eqz p1, :cond_6

    .line 1245
    invoke-static {v3}, Lcom/flyersoft/tools/A;->getBackgroundImages(Z)Ljava/util/ArrayList;

    move-result-object p1

    invoke-static {}, Lcom/flyersoft/tools/A;->getBackgroundImageFile()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v2, v3}, Lcom/flyersoft/tools/A;->getImagesDrawable(Ljava/util/ArrayList;Ljava/lang/String;II)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 1248
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual$39;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvBackgroundImage:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/imageview/ShapeableImageView;

    invoke-virtual {v0, p1}, Lcom/google/android/material/imageview/ShapeableImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1249
    sget-object p1, Lcom/flyersoft/tools/A;->baseFrame:Landroid/widget/FrameLayout;

    invoke-static {}, Lcom/flyersoft/tools/A;->getBackgroundImageFile()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getImagesDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A;->setBackgroundDrawable(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 1250
    sput-boolean v2, Lcom/flyersoft/tools/A;->useBackgroundImage:Z

    const/4 p1, 0x0

    .line 1251
    sput-object p1, Lcom/flyersoft/tools/A;->savedBackgroundDrwable:Landroid/graphics/drawable/Drawable;

    .line 1252
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$39;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mshowBackgroundTypeIndicator(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 1253
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$39;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mclearCurlCache(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 1255
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$39;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mupdateFontWeightImageAlphaValue(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 1257
    :cond_6
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$39;->val$dialog:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    return-void
.end method
