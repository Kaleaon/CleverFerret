.class Lcom/flyersoft/moonreaderp/ActivityMain$46;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroidx/appcompat/widget/SearchView$OnQueryTextListener;


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

    .line 4316
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$46;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryTextChange(Ljava/lang/String;)Z
    .locals 1

    .line 4326
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$46;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->lastSearchViewQuery:Ljava/lang/String;

    .line 4327
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$46;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->showSearchSuggestions(Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1
.end method

.method public onQueryTextSubmit(Ljava/lang/String;)Z
    .locals 1

    .line 4318
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$46;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->doSearch(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4319
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$46;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msaveSearckKey(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V

    .line 4320
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$46;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->searchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {p1}, Landroidx/appcompat/widget/SearchView;->clearFocus()V

    .line 4321
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$46;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->supportInvalidateOptionsMenu()V

    const/4 p1, 0x1

    return p1
.end method
