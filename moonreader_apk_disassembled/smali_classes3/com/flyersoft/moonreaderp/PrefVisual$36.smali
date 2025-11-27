.class Lcom/flyersoft/moonreaderp/PrefVisual$36;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


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

.field final synthetic val$iv:Landroid/widget/ImageView;

.field final synthetic val$shadow:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/widget/ImageView;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 1171
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$36;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$36;->val$iv:Landroid/widget/ImageView;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefVisual$36;->val$shadow:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    if-eqz p3, :cond_2

    .line 1176
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$36;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefVisual$36;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p3, p2}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mgetAlaphaText(Lcom/flyersoft/moonreaderp/PrefVisual;I)Ljava/lang/String;

    move-result-object p3

    invoke-static {p1, p3}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 1177
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$36;->val$iv:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 1178
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$36;->val$iv:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    const/16 p3, 0xff

    if-le p2, p3, :cond_0

    goto :goto_0

    :cond_0
    move p3, p2

    :goto_0
    invoke-virtual {p1, p3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1179
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$36;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefVisual$36;->val$shadow:Landroid/view/View;

    invoke-static {p1, p3, p2}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$msetShadowAlpha(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/view/View;I)V

    .line 1180
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "alpha:"

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    const/4 p3, 0x0

    aput-object p1, p2, p3

    invoke-static {p2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    :cond_2
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
