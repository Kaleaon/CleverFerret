.class Lcom/flyersoft/moonreaderp/PrefShelf$21;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefShelf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelf;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 891
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$21;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 893
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    .line 894
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$21;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShelf;->foldersForm:Landroid/widget/ScrollView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 895
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    if-ne p1, v1, :cond_0

    .line 896
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$21;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShelf$21;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->import_ebooks:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefShelf$21;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefShelf;->lastFolderPath:Ljava/lang/String;

    new-instance v5, Lcom/flyersoft/moonreaderp/PrefShelf$21$1;

    invoke-direct {v5, p0, p1}, Lcom/flyersoft/moonreaderp/PrefShelf$21$1;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf$21;Landroid/view/View;)V

    invoke-direct {v0, v1, v3, v4, v5}, Lcom/flyersoft/moonreaderp/PrefFolderPick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V

    .line 912
    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->setBooksOnly(Z)Lcom/flyersoft/moonreaderp/PrefFolderPick;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->show()V

    return-void

    .line 914
    :cond_0
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 915
    invoke-static {}, Lcom/flyersoft/tools/A;->getAutoImportFolders()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 916
    invoke-static {}, Lcom/flyersoft/tools/A;->saveAutoImportFoldersToFile()V

    .line 917
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    return-void
.end method
