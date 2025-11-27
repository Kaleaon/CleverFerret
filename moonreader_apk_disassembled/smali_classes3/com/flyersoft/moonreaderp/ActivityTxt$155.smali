.class Lcom/flyersoft/moonreaderp/ActivityTxt$155;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 15750
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$155;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 15753
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/DragSort/SortItem;

    iget p1, p1, Lcom/flyersoft/components/DragSort/SortItem;->index:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 15754
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    .line 15755
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$155;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoHighlight(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return v1

    .line 15758
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x3

    if-ne p1, v0, :cond_2

    .line 15759
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$155;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mforceShowSelectBar(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 15760
    sget-boolean p1, Lcom/flyersoft/tools/A;->translateInited:Z

    if-eqz p1, :cond_1

    .line 15761
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$155;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->doDictButton(Z)V

    goto :goto_0

    .line 15763
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$155;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->customizeDict(Landroid/content/Context;Z)V

    :goto_0
    return v1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method
