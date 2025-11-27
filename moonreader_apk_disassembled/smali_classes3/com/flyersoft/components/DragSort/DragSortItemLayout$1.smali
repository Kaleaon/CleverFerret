.class Lcom/flyersoft/components/DragSort/DragSortItemLayout$1;
.super Landroidx/customview/widget/ViewDragHelper$Callback;
.source "DragSortItemLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DragSort/DragSortItemLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/DragSort/DragSortItemLayout;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DragSort/DragSortItemLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 32
    iput-object p1, p0, Lcom/flyersoft/components/DragSort/DragSortItemLayout$1;->this$0:Lcom/flyersoft/components/DragSort/DragSortItemLayout;

    invoke-direct {p0}, Landroidx/customview/widget/ViewDragHelper$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewPositionChanged(Landroid/view/View;IIII)V
    .locals 0

    .line 41
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/DragSortItemLayout$1;->this$0:Lcom/flyersoft/components/DragSort/DragSortItemLayout;

    invoke-virtual {p1}, Lcom/flyersoft/components/DragSort/DragSortItemLayout;->invalidate()V

    return-void
.end method

.method public tryCaptureView(Landroid/view/View;I)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
