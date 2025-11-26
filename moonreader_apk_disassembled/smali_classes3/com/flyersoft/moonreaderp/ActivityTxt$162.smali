.class Lcom/flyersoft/moonreaderp/ActivityTxt$162;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefSelectHighlight$OnSelectColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->doHighlight(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$tv:Lcom/flyersoft/staticlayout/MRTextView;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/staticlayout/MRTextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 16055
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$162;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$162;->val$tv:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public selectColor(IZ)V
    .locals 3

    if-eqz p2, :cond_0

    .line 16058
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$162;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->preNoteInfo:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mremoveCurrentNote(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/tools/BookDb$NoteInfo;)V

    return-void

    .line 16060
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$162;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$162;->val$tv:Lcom/flyersoft/staticlayout/MRTextView;

    const/4 v1, -0x1

    const/4 v2, 0x1

    invoke-static {p2, v0, p1, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoHighlight2(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/staticlayout/MRTextView;IIZ)V

    return-void
.end method
