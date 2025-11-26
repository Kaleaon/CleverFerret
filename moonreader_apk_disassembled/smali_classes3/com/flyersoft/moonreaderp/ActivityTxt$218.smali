.class Lcom/flyersoft/moonreaderp/ActivityTxt$218;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefSelectHighlight$OnSelectColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfDoHighlight(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 20157
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$218;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public selectColor(IZ)V
    .locals 1

    const/4 p1, 0x1

    if-eqz p2, :cond_0

    .line 20160
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$218;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p2}, Lcom/flyersoft/books/PDFReader;->pdfAnnotRemove()V

    .line 20161
    sput-boolean p1, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    .line 20162
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$218;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideDotViews()Z

    .line 20163
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$218;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfSaveAnnotsForTime()V

    goto :goto_0

    .line 20165
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$218;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, -0x1

    invoke-static {p2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpdfDoHighlight2(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 20166
    :goto_0
    sput-boolean p1, Lcom/flyersoft/tools/A;->lastFileAnnotUpdated:Z

    return-void
.end method
