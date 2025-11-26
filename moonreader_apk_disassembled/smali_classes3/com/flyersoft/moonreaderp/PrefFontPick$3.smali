.class Lcom/flyersoft/moonreaderp/PrefFontPick$3;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 104
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$3;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 106
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$3;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFontPick;->phTitle:Landroid/widget/TextView;

    if-eqz p1, :cond_0

    .line 107
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$3;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFontPick;->phTitle:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 108
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$3;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$3;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFontPick;->searchView:Landroidx/appcompat/widget/SearchView;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->setSearchViewPopupColor(Landroid/content/Context;Landroidx/appcompat/widget/SearchView;)V

    .line 109
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$3;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFontPick;->searchView:Landroidx/appcompat/widget/SearchView;

    const-string v0, ""

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    return-void
.end method
