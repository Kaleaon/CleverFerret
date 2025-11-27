.class Lcom/flyersoft/moonreaderp/ActivityMain$142;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->show_coverflow()V
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

    .line 13344
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$142;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    .line 13346
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$142;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 p2, 0x1

    if-ge p3, p1, :cond_1

    .line 13347
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$142;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->isSelectedState:Z

    if-eqz p1, :cond_0

    .line 13348
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$142;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getShelfBooksAdapter()Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;

    move-result-object p1

    invoke-interface {p1, p3}, Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;->inverseChecked(I)V

    goto :goto_0

    .line 13350
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$142;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    .line 13351
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$142;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getShelfBooksAdapter()Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;

    move-result-object p1

    invoke-interface {p1, p3}, Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;->setChecked(I)V

    :cond_1
    :goto_0
    return p2
.end method
