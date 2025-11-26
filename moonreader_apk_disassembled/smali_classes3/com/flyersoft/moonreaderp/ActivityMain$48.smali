.class Lcom/flyersoft/moonreaderp/ActivityMain$48;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroidx/appcompat/widget/SearchView$OnSuggestionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->initActionItems()V
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

    .line 4337
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$48;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSuggestionClick(I)Z
    .locals 1

    .line 4343
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$48;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->searchKeys:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 4344
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$48;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->doSearch(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 4345
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$48;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->lastSearchViewQuery:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msaveSearckKey(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V

    .line 4346
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$48;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->searchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {p1}, Landroidx/appcompat/widget/SearchView;->clearFocus()V

    .line 4347
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$48;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->supportInvalidateOptionsMenu()V

    const/4 p1, 0x0

    return p1
.end method

.method public onSuggestionSelect(I)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
