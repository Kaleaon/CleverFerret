.class Lcom/flyersoft/moonreaderp/PrefSelectHighlight$5;
.super Ljava/lang/Object;
.source "PrefSelectHighlight.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSelectHighlight;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSelectHighlight;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 212
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$5;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectHighlight;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getColor(I)V
    .locals 2

    .line 214
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$5;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectHighlight;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->isPdf:Z

    if-eqz v0, :cond_0

    .line 215
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setPdfHighlightColor(IZ)V

    goto :goto_0

    .line 217
    :cond_0
    sput p1, Lcom/flyersoft/tools/A;->highlight_color:I

    .line 218
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$5;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectHighlight;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color1:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 219
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$5;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectHighlight;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb1:Landroid/widget/RadioButton;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->setChecked(Landroid/widget/RadioButton;)V

    return-void
.end method
