.class Lcom/flyersoft/components/DragSort/DragSortListAdapter$1;
.super Ljava/lang/Object;
.source "DragSortListAdapter.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DragSort/DragSortListAdapter;->onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/DragSort/DragSortListAdapter;

.field final synthetic val$viewHolder:Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DragSort/DragSortListAdapter;Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;)V
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

    .line 43
    iput-object p1, p0, Lcom/flyersoft/components/DragSort/DragSortListAdapter$1;->this$0:Lcom/flyersoft/components/DragSort/DragSortListAdapter;

    iput-object p2, p0, Lcom/flyersoft/components/DragSort/DragSortListAdapter$1;->val$viewHolder:Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 47
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/DragSortListAdapter$1;->this$0:Lcom/flyersoft/components/DragSort/DragSortListAdapter;

    invoke-static {p1}, Lcom/flyersoft/components/DragSort/DragSortListAdapter;->-$$Nest$fgetmOnItemSortListener(Lcom/flyersoft/components/DragSort/DragSortListAdapter;)Lcom/flyersoft/components/DragSort/DragSortItemLayout$OnItemSortListener;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/components/DragSort/DragSortListAdapter$1;->val$viewHolder:Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;

    invoke-interface {p1, p2}, Lcom/flyersoft/components/DragSort/DragSortItemLayout$OnItemSortListener;->onStartDrags(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    const/4 p1, 0x0

    return p1
.end method
