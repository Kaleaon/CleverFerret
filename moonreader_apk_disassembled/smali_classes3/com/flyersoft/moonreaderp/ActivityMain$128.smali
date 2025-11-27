.class Lcom/flyersoft/moonreaderp/ActivityMain$128;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->sortImportItems(Ljava/util/ArrayList;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;",
        ">;"
    }
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

    .line 11696
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$128;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;)I
    .locals 5

    .line 11698
    iget-wide v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->fileTime:J

    iget-wide v2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->fileTime:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-wide v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->fileTime:J

    iget-wide p1, p2, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->fileTime:J

    cmp-long v2, v0, p1

    if-lez v2, :cond_1

    const/4 p1, -0x1

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 11696
    check-cast p1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;

    check-cast p2, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain$128;->compare(Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;)I

    move-result p1

    return p1
.end method
