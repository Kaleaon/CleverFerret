.class Lcom/flyersoft/moonreaderp/PrefSearch$ResultAdapter$2;
.super Ljava/lang/Object;
.source "PrefSearch.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefSearch$ResultAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefSearch$ResultAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSearch$ResultAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 568
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$ResultAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefSearch$ResultAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 571
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 572
    sput p1, Lcom/flyersoft/moonreaderp/PrefSearch;->lastClickIndex:I

    .line 573
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch$ResultAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefSearch$ResultAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch$ResultAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->onClickResult:Lcom/flyersoft/moonreaderp/PrefSearch$OnClickResult;

    invoke-interface {v0, p1}, Lcom/flyersoft/moonreaderp/PrefSearch$OnClickResult;->onClick(I)V

    .line 574
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$ResultAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefSearch$ResultAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefSearch$ResultAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefSearch;->dismiss()V

    return-void
.end method
