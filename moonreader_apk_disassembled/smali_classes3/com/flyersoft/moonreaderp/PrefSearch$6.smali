.class Lcom/flyersoft/moonreaderp/PrefSearch$6;
.super Ljava/lang/Object;
.source "PrefSearch.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefSearch;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSearch;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSearch;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 605
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$6;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 608
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$6;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefSearch;->et:Lcom/flyersoft/views/ClearableEditText;

    invoke-static {}, Lcom/flyersoft/tools/A;->getSearchHistory()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/CharSequence;

    invoke-virtual {p1, p2}, Lcom/flyersoft/views/ClearableEditText;->setText(Ljava/lang/CharSequence;)V

    .line 609
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$6;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefSearch;->startSearch()V

    return-void
.end method
