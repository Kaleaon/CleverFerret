.class Lcom/flyersoft/moonreaderp/ActivityTxt$221;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->djvuDoHighlight2(IIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$note:Lcom/flyersoft/tools/BookDb$NoteInfo;


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

    .line 20306
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$221;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$221;->val$note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public AfterEditNote(ILjava/lang/String;)V
    .locals 0

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    .line 20309
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$221;->val$note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-static {p1, p2}, Lcom/flyersoft/tools/A;->addNote(Lcom/flyersoft/tools/BookDb$NoteInfo;Z)V

    .line 20310
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$221;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideDotViews()Z

    .line 20311
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$221;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/flyersoft/books/PDFReader;->delForceSel(Z)V

    .line 20312
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$221;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->doPostInvalidate()V

    :cond_0
    return-void
.end method
