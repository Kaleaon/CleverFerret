.class Lcom/flyersoft/moonreaderp/ActivityMain$87;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->setShelfBooksAdapter(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 7922
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$87;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 7925
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$87;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    invoke-virtual {p1}, Lcom/flyersoft/views/BookShelfView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 7926
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$87;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result p1

    .line 7927
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$87;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->initColumnCount()V

    .line 7928
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$87;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result p2

    if-eq p1, p2, :cond_0

    .line 7929
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$87;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->setShelfBooksAdapter(Z)V

    :cond_0
    return-void
.end method
