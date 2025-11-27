.class Lcom/flyersoft/moonreaderp/ActivityTxt$163;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->do_add_note()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$fromNote:Lcom/flyersoft/tools/BookDb$NoteInfo;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/tools/BookDb$NoteInfo;)V
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

    .line 16180
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$163;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$163;->val$fromNote:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public AfterEditNote(ILjava/lang/String;)V
    .locals 0

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    .line 16183
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$163;->val$fromNote:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-static {p1, p2}, Lcom/flyersoft/tools/A;->addNote(Lcom/flyersoft/tools/BookDb$NoteInfo;Z)V

    .line 16184
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$163;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideDotViews()Z

    .line 16185
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$163;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getTouchTxtView()Lcom/flyersoft/staticlayout/MRTextView;

    move-result-object p1

    const/4 p2, -0x1

    .line 16186
    iput p2, p1, Lcom/flyersoft/staticlayout/MRTextView;->hStart:I

    .line 16187
    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    .line 16188
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$163;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 p2, 0x190

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcreateCachePageShotsHandler(Lcom/flyersoft/moonreaderp/ActivityTxt;I)Z

    :cond_0
    return-void
.end method
