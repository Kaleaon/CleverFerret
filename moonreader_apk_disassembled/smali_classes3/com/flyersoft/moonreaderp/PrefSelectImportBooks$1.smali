.class Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$1;
.super Ljava/lang/Object;
.source "PrefSelectImportBooks.java"

# interfaces
.implements Landroidx/appcompat/widget/SearchView$OnQueryTextListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 70
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$1;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryTextChange(Ljava/lang/String;)Z
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$1;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->searchFont(Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1
.end method

.method public onQueryTextSubmit(Ljava/lang/String;)Z
    .locals 2

    .line 72
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$1;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "input_method"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/inputmethod/InputMethodManager;

    .line 73
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$1;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->searchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    const/4 p1, 0x1

    return p1
.end method
