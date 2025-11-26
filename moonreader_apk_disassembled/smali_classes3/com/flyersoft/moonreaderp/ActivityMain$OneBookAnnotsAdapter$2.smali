.class Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$2;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 12852
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 12854
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    array-length v0, v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 12855
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Z

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    .line 12856
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->isSelectedState:Z

    const/4 v1, 0x1

    if-nez v0, :cond_1

    .line 12857
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    .line 12858
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 12859
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->inverseChecked(I)V

    .line 12860
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->getSelectedCount()I

    move-result v0

    if-lez v0, :cond_2

    .line 12861
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annotLvItemTouch:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->setStartSelectPosition(I)V

    :cond_2
    return v1
.end method
