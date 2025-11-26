.class Lcom/flyersoft/moonreaderp/PrefVisual$38;
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

.field final synthetic val$background:Landroid/graphics/drawable/Drawable;

.field final synthetic val$blurSk:Landroid/widget/SeekBar;

.field final synthetic val$iv:Landroid/widget/ImageView;

.field final synthetic val$shadow:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/widget/SeekBar;Landroid/widget/SeekBar;Landroid/graphics/drawable/Drawable;Landroid/widget/ImageView;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
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
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1206
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$38;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$38;->val$alphaSk:Landroid/widget/SeekBar;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefVisual$38;->val$blurSk:Landroid/widget/SeekBar;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefVisual$38;->val$background:Landroid/graphics/drawable/Drawable;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefVisual$38;->val$iv:Landroid/widget/ImageView;

    iput-object p6, p0, Lcom/flyersoft/moonreaderp/PrefVisual$38;->val$shadow:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1209
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$38;->val$alphaSk:Landroid/widget/SeekBar;

    const/16 v0, 0xff

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1210
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$38;->val$blurSk:Landroid/widget/SeekBar;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1211
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$38;->val$background:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_0

    .line 1212
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1213
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$38;->val$iv:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$38;->val$background:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1214
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$38;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$38;->val$shadow:Landroid/view/View;

    invoke-static {p1, v1, v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$msetShadowAlpha(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/view/View;I)V

    return-void
.end method
