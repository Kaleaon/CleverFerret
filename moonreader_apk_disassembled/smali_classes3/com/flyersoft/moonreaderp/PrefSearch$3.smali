.class Lcom/flyersoft/moonreaderp/PrefSearch$3;
.super Landroid/os/Handler;
.source "PrefSearch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefSearch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSearch;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSearch;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 144
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$3;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 147
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$3;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefSearch;->phTitle:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$3;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefSearch;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->book_found:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/flyersoft/moonreaderp/PrefSearch;->results:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    sget p1, Lcom/flyersoft/moonreaderp/PrefSearch;->lastClickIndex:I

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    sget p1, Lcom/flyersoft/moonreaderp/PrefSearch;->lastClickIndex:I

    sget-object v0, Lcom/flyersoft/moonreaderp/PrefSearch;->results:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 149
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$3;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefSearch;->list:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    sget v0, Lcom/flyersoft/moonreaderp/PrefSearch;->lastClickIndex:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->myScrollTo(I)Z

    :cond_0
    return-void
.end method
