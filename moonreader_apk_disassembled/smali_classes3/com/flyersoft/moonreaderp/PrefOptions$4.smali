.class Lcom/flyersoft/moonreaderp/PrefOptions$4;
.super Ljava/lang/Object;
.source "PrefOptions.java"

# interfaces
.implements Landroidx/appcompat/widget/SearchView$OnQueryTextListener;


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

    .line 280
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions$4;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryTextChange(Ljava/lang/String;)Z
    .locals 3

    const/4 v0, 0x2

    .line 288
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "query changed"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v1, 0x1

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 289
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions$4;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->-$$Nest$mshowSearchSuggestions(Lcom/flyersoft/moonreaderp/PrefOptions;Ljava/lang/String;)V

    return v1
.end method

.method public onQueryTextSubmit(Ljava/lang/String;)Z
    .locals 2

    .line 283
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions$4;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "input_method"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/inputmethod/InputMethodManager;

    .line 284
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions$4;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefOptions;->searchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    const/4 p1, 0x1

    return p1
.end method
