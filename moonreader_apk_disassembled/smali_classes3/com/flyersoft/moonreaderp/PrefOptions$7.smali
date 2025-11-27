.class Lcom/flyersoft/moonreaderp/PrefOptions$7;
.super Ljava/lang/Object;
.source "PrefOptions.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    .line 310
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions$7;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 312
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions$7;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefOptions;->phTitle:Landroid/widget/TextView;

    if-eqz p1, :cond_0

    .line 313
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions$7;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefOptions;->phTitle:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 314
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions$7;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions$7;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefOptions;->searchView:Landroidx/appcompat/widget/SearchView;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->setSearchViewPopupColor(Landroid/content/Context;Landroidx/appcompat/widget/SearchView;)V

    .line 315
    sget-object p1, Lcom/flyersoft/tools/A;->lastFuncKey:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_1

    .line 316
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions$7;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefOptions;->searchView:Landroidx/appcompat/widget/SearchView;

    sget-object v1, Lcom/flyersoft/tools/A;->lastFuncKey:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    return-void

    .line 318
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions$7;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefOptions;->searchView:Landroidx/appcompat/widget/SearchView;

    const-string v1, ""

    invoke-virtual {p1, v1, v0}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    return-void
.end method
