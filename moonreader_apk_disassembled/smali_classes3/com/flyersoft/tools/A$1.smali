.class Lcom/flyersoft/tools/A$1;
.super Ljava/lang/Object;
.source "A.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/tools/A;->getFileList()Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/flyersoft/tools/T$FileItem;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 4217
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/flyersoft/tools/T$FileItem;Lcom/flyersoft/tools/T$FileItem;)I
    .locals 2

    .line 4220
    sget-boolean v0, Lcom/flyersoft/tools/A;->naturalSort:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/flyersoft/tools/T$FileItem;->getNatureSortItem()Lcom/flyersoft/tools/T$NatureSortItem;

    move-result-object v0

    invoke-virtual {p2}, Lcom/flyersoft/tools/T$FileItem;->getNatureSortItem()Lcom/flyersoft/tools/T$NatureSortItem;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->getNatureSortResult(Lcom/flyersoft/tools/T$NatureSortItem;Lcom/flyersoft/tools/T$NatureSortItem;)I

    move-result v0

    :goto_0
    if-eqz v0, :cond_1

    return v0

    .line 4221
    :cond_1
    iget-object p1, p1, Lcom/flyersoft/tools/T$FileItem;->name:Ljava/lang/String;

    iget-object p2, p2, Lcom/flyersoft/tools/T$FileItem;->name:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->myStringCompare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

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

    .line 4217
    check-cast p1, Lcom/flyersoft/tools/T$FileItem;

    check-cast p2, Lcom/flyersoft/tools/T$FileItem;

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/tools/A$1;->compare(Lcom/flyersoft/tools/T$FileItem;Lcom/flyersoft/tools/T$FileItem;)I

    move-result p1

    return p1
.end method
