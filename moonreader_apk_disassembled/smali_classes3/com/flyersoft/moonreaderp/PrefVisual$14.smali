.class Lcom/flyersoft/moonreaderp/PrefVisual$14;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Lcom/flyersoft/views/CustomSeek$OnProgressChanged;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->loadSettings()V
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

    .line 535
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$14;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValueRecive(I)V
    .locals 2

    .line 538
    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    int-to-float v0, p1

    .line 539
    invoke-static {v0}, Lcom/flyersoft/tools/A;->dr(F)I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->leftMargin:I

    sput v0, Lcom/flyersoft/tools/A;->rightMargin:I

    .line 540
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual$14;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->leftMargin:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    iget-object v0, v0, Lcom/flyersoft/views/CustomSeek;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    goto :goto_0

    :cond_0
    int-to-float p1, p1

    .line 542
    invoke-static {p1}, Lcom/flyersoft/tools/A;->dr(F)I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->rightMargin:I

    .line 543
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$14;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->adjustMargin()V

    return-void
.end method
