.class Lcom/flyersoft/moonreaderp/ActivityTxt$220;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefSelectHighlight$OnSelectColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->djvuDoHighlight(Z)V
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

    .line 20187
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$220;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public selectColor(IZ)V
    .locals 2

    if-eqz p2, :cond_0

    .line 20190
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$220;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->preNoteInfo:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mremoveCurrentNote(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/tools/BookDb$NoteInfo;)V

    goto :goto_0

    .line 20192
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$220;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-static {p2, p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdjvuDoHighlight2(Lcom/flyersoft/moonreaderp/ActivityTxt;IIZ)V

    .line 20193
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$220;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/flyersoft/books/PDFReader;->delForceSel(Z)V

    return-void
.end method
