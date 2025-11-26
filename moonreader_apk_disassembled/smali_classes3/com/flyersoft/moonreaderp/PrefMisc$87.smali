.class Lcom/flyersoft/moonreaderp/PrefMisc$87;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->checkIfShowSearchForReplaceList(Landroid/view/View;Landroid/widget/LinearLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$root:Landroid/view/View;

.field final synthetic val$searchView:Landroidx/appcompat/widget/SearchView;


# direct methods
.method constructor <init>(Landroid/view/View;Landroidx/appcompat/widget/SearchView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2191
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$87;->val$root:Landroid/view/View;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$87;->val$searchView:Landroidx/appcompat/widget/SearchView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 2193
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$87;->val$root:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$87;->val$searchView:Landroidx/appcompat/widget/SearchView;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->setSearchViewPopupColor(Landroid/content/Context;Landroidx/appcompat/widget/SearchView;)V

    .line 2194
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$87;->val$searchView:Landroidx/appcompat/widget/SearchView;

    const-string v0, ""

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    return-void
.end method
