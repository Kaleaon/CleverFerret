.class Lcom/flyersoft/moonreaderp/PrefColorPick$5;
.super Ljava/lang/Object;
.source "PrefColorPick.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefColorPick$OnColorChangedListener;


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

    .line 455
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$5;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public colorChanged(I)V
    .locals 4

    .line 457
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$5;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->-$$Nest$fgetmColor(Lcom/flyersoft/moonreaderp/PrefColorPick;)I

    move-result v1

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    .line 458
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v3

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    .line 457
    invoke-static {v1, v2, v3, p1}, Landroid/graphics/Color;->argb(IIII)I

    move-result p1

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefColorPick;->-$$Nest$msetRGBColor(Lcom/flyersoft/moonreaderp/PrefColorPick;I)V

    return-void
.end method
