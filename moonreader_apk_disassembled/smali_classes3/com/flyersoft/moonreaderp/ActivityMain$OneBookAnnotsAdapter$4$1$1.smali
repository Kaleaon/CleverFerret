.class Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefEditBookmark$OnAfterEdit;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$3:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 12944
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$1;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public AfterEdit(Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 2

    .line 12946
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$1;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$1;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iput-object p1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->name:Ljava/lang/String;

    iput-object p1, v0, Lcom/flyersoft/tools/A$Bookmark;->name:Ljava/lang/String;

    .line 12947
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$1;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    iput p2, p1, Lcom/flyersoft/tools/A$Bookmark;->color:I

    .line 12948
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$1;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->updateBookmark(Lcom/flyersoft/tools/A$Bookmark;)V

    .line 12949
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$1;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->refreshList(I)V

    return-void
.end method
