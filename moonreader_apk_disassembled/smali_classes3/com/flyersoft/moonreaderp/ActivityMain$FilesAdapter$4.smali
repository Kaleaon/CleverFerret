.class Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$4;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1755
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 1758
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->isSelectedState:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 1759
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    .line 1760
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowSelectBar(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 1762
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 1763
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->inverseChecked(I)V

    .line 1764
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->getSelectedCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 1765
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLvItemTouch:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->setStartSelectPosition(I)V

    :cond_1
    return v1
.end method
