.class Lcom/flyersoft/moonreaderp/PrefVisual$37;
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

.field final synthetic val$alphaSk:Landroid/widget/SeekBar;

.field final synthetic val$background:Landroid/graphics/drawable/Drawable;

.field final synthetic val$iv:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/graphics/drawable/Drawable;Landroid/widget/ImageView;Landroid/widget/SeekBar;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 1189
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$37;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$37;->val$background:Landroid/graphics/drawable/Drawable;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefVisual$37;->val$iv:Landroid/widget/ImageView;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefVisual$37;->val$alphaSk:Landroid/widget/SeekBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 2

    if-eqz p3, :cond_1

    .line 1193
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$37;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, ""

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p1, p3}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 1194
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$37;->val$background:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_0

    .line 1195
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefVisual$37;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual$37;->val$iv:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$37;->val$alphaSk:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    invoke-static {p3, v0, p1, v1, p2}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$msetImageViewBlur(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;II)V

    .line 1196
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "blur:"

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    const/4 p3, 0x0

    aput-object p1, p2, p3

    invoke-static {p2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    :cond_1
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
