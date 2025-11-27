.class Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$5;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 11265
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 11272
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->isSelectedState:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 11273
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    .line 11274
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 11275
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->inverseChecked(I)V

    .line 11276
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->getSelectedCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 11277
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->recentLvItemTouch:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->setStartSelectPosition(I)V

    :cond_1
    return v1
.end method
