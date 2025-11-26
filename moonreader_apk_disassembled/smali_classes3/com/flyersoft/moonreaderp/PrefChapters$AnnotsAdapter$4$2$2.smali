.class Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$2;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefEditBookmark$OnAfterEdit;


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


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1576
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$2;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public AfterEdit(Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 2

    .line 1578
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$2;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$2;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iput-object p1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->name:Ljava/lang/String;

    iput-object p1, v0, Lcom/flyersoft/tools/A$Bookmark;->name:Ljava/lang/String;

    .line 1579
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$2;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    iput p2, p1, Lcom/flyersoft/tools/A$Bookmark;->color:I

    .line 1580
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$2;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->updateBookmark(Lcom/flyersoft/tools/A$Bookmark;)V

    .line 1581
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$2;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->refreshList(I)V

    const/4 p1, 0x1

    .line 1582
    sput-boolean p1, Lcom/flyersoft/tools/A;->hasNewNoteForUpload:Z

    .line 1583
    sput-boolean p1, Lcom/flyersoft/tools/A;->lastFileAnnotUpdated:Z

    return-void
.end method
