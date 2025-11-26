.class Lcom/flyersoft/moonreaderp/PrefOptions$6;
.super Ljava/lang/Object;
.source "PrefOptions.java"

# interfaces
.implements Landroidx/appcompat/widget/SearchView$OnSuggestionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefOptions;->setFuncSearchVisible(I)Lcom/flyersoft/moonreaderp/PrefOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefOptions;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefOptions;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 300
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions$6;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSuggestionClick(I)Z
    .locals 2

    .line 306
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions$6;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->-$$Nest$fgetfuncSearchResults(Lcom/flyersoft/moonreaderp/PrefOptions;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->openSearchResult(Lcom/flyersoft/moonreaderp/PrefOptions;Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;)V

    const/4 p1, 0x0

    return p1
.end method

.method public onSuggestionSelect(I)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
