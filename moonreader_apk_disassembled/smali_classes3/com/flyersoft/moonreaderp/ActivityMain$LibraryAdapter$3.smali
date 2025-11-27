.class Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 6258
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7

    .line 6260
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 6261
    invoke-static {}, Lcom/flyersoft/opds/N;->getLibraries()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/opds/OpdsSite;

    .line 6265
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->catalog_popup_menu:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 6266
    array-length v2, v1

    const/4 v3, 0x2

    add-int/2addr v2, v3

    new-array v2, v2, [Ljava/lang/String;

    .line 6267
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {}, Lcom/flyersoft/tools/A;->getLibraryTopItems()Ljava/util/ArrayList;

    move-result-object v5

    iget-object v6, v0, Lcom/flyersoft/opds/OpdsSite;->xmlFile:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->remove_from_top:I

    goto :goto_0

    :cond_0
    sget v5, Lcom/flyersoft/moonreaderp/R$string;->put_on_top:I

    :goto_0
    invoke-virtual {v4, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v2, v5

    .line 6268
    const-string v4, "-"

    const/4 v6, 0x1

    aput-object v4, v2, v6

    .line 6269
    aget-object v4, v1, v5

    aput-object v4, v2, v3

    const/4 v4, 0x3

    .line 6270
    aget-object v5, v1, v6

    aput-object v5, v2, v4

    const/4 v4, 0x4

    .line 6271
    aget-object v1, v1, v3

    aput-object v1, v2, v4

    .line 6273
    new-instance v1, Lcom/flyersoft/components/MyMenu;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v1, v3}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v1

    new-instance v3, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;

    invoke-direct {v3, p0, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;Lcom/flyersoft/opds/OpdsSite;)V

    invoke-virtual {v1, v2, v3}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    .line 6310
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;)V

    return-void
.end method
