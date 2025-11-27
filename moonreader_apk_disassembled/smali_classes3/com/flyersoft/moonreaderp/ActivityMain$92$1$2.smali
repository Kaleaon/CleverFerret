.class Lcom/flyersoft/moonreaderp/ActivityMain$92$1$2;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->renameGroup(Lcom/flyersoft/tools/BookDb$BookInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/ActivityMain$92$1;

.field final synthetic val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

.field final synthetic val$edit:Lcom/flyersoft/views/ClearableEditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$92$1;Lcom/flyersoft/views/ClearableEditText;Lcom/flyersoft/tools/BookDb$BookInfo;)V
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

    .line 9052
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$92$1;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1$2;->val$edit:Lcom/flyersoft/views/ClearableEditText;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1$2;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 9054
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1$2;->val$edit:Lcom/flyersoft/views/ClearableEditText;

    invoke-virtual {p1}, Lcom/flyersoft/views/ClearableEditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 9055
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1$2;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/flyersoft/tools/BookDb$BookInfo;->getGroupName(Z)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    .line 9056
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1$2;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iput-object p1, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->groupName:Ljava/lang/String;

    .line 9057
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1$2;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-static {p1, v0}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    .line 9058
    sget p1, Lcom/flyersoft/tools/A;->shelfStyle:I

    const/4 p2, 0x2

    if-ge p1, p2, :cond_0

    .line 9059
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$92$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfAdapter:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1$2;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget p2, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->index:I

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->notifyItemChanged(I)V

    return-void

    .line 9061
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$92$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$92$1;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->coverflow:Lcom/flyersoft/views/CoverFlow;

    invoke-virtual {p2}, Lcom/flyersoft/views/CoverFlow;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroid/widget/Adapter;)V

    :cond_1
    return-void
.end method
