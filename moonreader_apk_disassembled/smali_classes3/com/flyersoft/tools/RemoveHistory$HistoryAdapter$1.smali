.class Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter$1;
.super Ljava/lang/Object;
.source "RemoveHistory.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 85
    iput-object p1, p0, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter$1;->this$0:Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 88
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 89
    iget-object v0, p0, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter$1;->this$0:Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;

    iget-object v0, v0, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;->onItemRemove:Landroid/content/DialogInterface$OnClickListener;

    if-eqz v0, :cond_0

    .line 90
    iget-object v0, p0, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter$1;->this$0:Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;

    iget-object v0, v0, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;->onItemRemove:Landroid/content/DialogInterface$OnClickListener;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    goto :goto_0

    .line 92
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter$1;->this$0:Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;

    iget-object v0, v0, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 93
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter$1;->this$0:Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;->notifyDataSetChanged()V

    return-void
.end method
