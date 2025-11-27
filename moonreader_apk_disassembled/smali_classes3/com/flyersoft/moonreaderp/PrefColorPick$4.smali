.class Lcom/flyersoft/moonreaderp/PrefColorPick$4;
.super Ljava/lang/Object;
.source "PrefColorPick.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefColorPick;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefColorPick;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 264
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 5

    .line 267
    :try_start_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/PrefColorPick;->-$$Nest$fgetcR(Lcom/flyersoft/moonreaderp/PrefColorPick;)Landroid/widget/SeekBar;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/SeekBar;->getProgress()I

    move-result p2

    .line 268
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->-$$Nest$fgetcG(Lcom/flyersoft/moonreaderp/PrefColorPick;)Landroid/widget/SeekBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    .line 269
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PrefColorPick;->-$$Nest$fgetcB(Lcom/flyersoft/moonreaderp/PrefColorPick;)Landroid/widget/SeekBar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    .line 270
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/PrefColorPick;->-$$Nest$fgetcAlpha(Lcom/flyersoft/moonreaderp/PrefColorPick;)Landroid/widget/SeekBar;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/SeekBar;->getProgress()I

    move-result v2

    .line 272
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    move-object v4, p1

    check-cast v4, Landroid/widget/EditText;

    invoke-virtual {v3, v4}, Lcom/flyersoft/moonreaderp/PrefColorPick;->getValue(Landroid/widget/EditText;)I

    move-result v3

    .line 273
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefColorPick;->redEt:Landroid/widget/EditText;

    if-ne p1, v4, :cond_0

    move p2, v3

    goto :goto_0

    .line 275
    :cond_0
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefColorPick;->greenEt:Landroid/widget/EditText;

    if-ne p1, v4, :cond_1

    move v0, v3

    goto :goto_0

    .line 277
    :cond_1
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefColorPick;->blueEt:Landroid/widget/EditText;

    if-ne p1, v4, :cond_2

    move v1, v3

    goto :goto_0

    .line 279
    :cond_2
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefColorPick;->alphaEt:Landroid/widget/EditText;

    if-ne p1, v4, :cond_3

    move v2, v3

    .line 282
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefColorPick;->-$$Nest$fgetmUseAlpha(Lcom/flyersoft/moonreaderp/PrefColorPick;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 283
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    invoke-static {v2, p2, v0, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result p2

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefColorPick;->-$$Nest$fputmColor(Lcom/flyersoft/moonreaderp/PrefColorPick;I)V

    goto :goto_1

    .line 285
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    invoke-static {p2, v0, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result p2

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefColorPick;->-$$Nest$fputmColor(Lcom/flyersoft/moonreaderp/PrefColorPick;I)V

    .line 287
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefColorPick;->-$$Nest$fgetmColor(Lcom/flyersoft/moonreaderp/PrefColorPick;)I

    move-result p2

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefColorPick;->-$$Nest$msetRGBColor(Lcom/flyersoft/moonreaderp/PrefColorPick;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 289
    :catch_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefColorPick;->-$$Nest$mupdate(Lcom/flyersoft/moonreaderp/PrefColorPick;)V

    return-void
.end method
