.class Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$2;
.super Ljava/lang/Object;
.source "DualFavLay.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->sortItems()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 351
    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$2;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 5

    .line 353
    check-cast p1, Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    .line 354
    check-cast p2, Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object p2, p2, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    .line 355
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const-string v2, ">"

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v1, :cond_0

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 356
    :goto_0
    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p2, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v3, 0x1

    :cond_1
    if-eqz v1, :cond_2

    if-nez v3, :cond_3

    :cond_2
    if-nez v1, :cond_4

    if-nez v3, :cond_4

    .line 358
    :cond_3
    invoke-virtual {p1, p2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p1

    return p1

    :cond_4
    if-eqz v1, :cond_5

    const/4 p1, -0x1

    return p1

    :cond_5
    return v4
.end method
