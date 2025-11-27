.class Lcom/flyersoft/moonreaderp/ActivityTxt$164;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->do_edit_note(Lcom/flyersoft/tools/BookDb$NoteInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$note:Lcom/flyersoft/tools/BookDb$NoteInfo;

.field final synthetic val$tag1:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/tools/BookDb$NoteInfo;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 16200
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->val$note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->val$tag1:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public AfterEditNote(ILjava/lang/String;)V
    .locals 1

    const/4 p2, 0x1

    const/4 v0, 0x0

    if-ne p1, p2, :cond_1

    .line 16203
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->val$note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object p2, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->val$note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget p2, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->val$note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-boolean p2, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->val$note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-boolean p2, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->squiggly:Z

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->val$note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-boolean p2, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 16204
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->val$tag1:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 16205
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->val$note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->updateNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)Z

    .line 16206
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 16207
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1, v0}, Lcom/flyersoft/books/PDFReader;->delForceSel(Z)V

    .line 16208
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->doPostInvalidate()V

    goto :goto_0

    :cond_1
    const/4 p2, 0x2

    if-ne p1, p2, :cond_2

    .line 16211
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->val$note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mremoveCurrentNote(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/tools/BookDb$NoteInfo;)V

    .line 16212
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 16213
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1, v0}, Lcom/flyersoft/books/PDFReader;->delForceSel(Z)V

    .line 16214
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->doPostInvalidate()V

    .line 16217
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$164;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->contentLay:Lcom/flyersoft/views/ContentLay;

    invoke-virtual {p1}, Lcom/flyersoft/views/ContentLay;->postInvalidate()V

    return-void
.end method
