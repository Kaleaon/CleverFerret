.class Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$4;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;Landroid/widget/EditText;)V
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

    .line 1591
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$4;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$4;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1593
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$4;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1594
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$4;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object p2, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    .line 1595
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$4;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iput-object p1, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    .line 1596
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$4;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->updateNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)Z

    .line 1597
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$4;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->isPdf:Z

    const/4 p2, 0x1

    if-eqz p1, :cond_0

    .line 1598
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$4;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$4;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-virtual {p1, v0}, Lcom/flyersoft/books/PDFReader;->pdfUpdateAnnotTextFromNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1599
    sput-boolean p2, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    .line 1600
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$4;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->refreshList(I)V

    .line 1601
    sput-boolean p2, Lcom/flyersoft/tools/A;->hasNewNoteForUpload:Z

    .line 1602
    sput-boolean p2, Lcom/flyersoft/tools/A;->lastFileAnnotUpdated:Z

    .line 1604
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$4;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mhideSystemNavigation(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    return-void
.end method
