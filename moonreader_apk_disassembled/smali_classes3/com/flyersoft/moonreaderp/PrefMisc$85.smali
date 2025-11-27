.class Lcom/flyersoft/moonreaderp/PrefMisc$85;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroidx/appcompat/widget/SearchView$OnQueryTextListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->checkIfShowSearchForReplaceList(Landroid/view/View;Landroid/widget/LinearLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$lay:Landroid/widget/LinearLayout;

.field final synthetic val$root:Landroid/view/View;

.field final synthetic val$searchView:Landroidx/appcompat/widget/SearchView;


# direct methods
.method constructor <init>(Landroid/view/View;Landroidx/appcompat/widget/SearchView;Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2174
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$85;->val$root:Landroid/view/View;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$85;->val$searchView:Landroidx/appcompat/widget/SearchView;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$85;->val$lay:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryTextChange(Ljava/lang/String;)Z
    .locals 1

    .line 2181
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$85;->val$lay:Landroid/widget/LinearLayout;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->setListLayVisible(Landroid/widget/LinearLayout;Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1
.end method

.method public onQueryTextSubmit(Ljava/lang/String;)Z
    .locals 2

    .line 2176
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$85;->val$root:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "input_method"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/inputmethod/InputMethodManager;

    .line 2177
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$85;->val$searchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    const/4 p1, 0x1

    return p1
.end method
