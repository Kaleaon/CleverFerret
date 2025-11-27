.class Lcom/flyersoft/moonreaderp/ActivityMain$82;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->sortBooksByNatureSort(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/flyersoft/tools/BookDb$BookInfo;",
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

    .line 7554
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$82;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/flyersoft/tools/BookDb$BookInfo;Lcom/flyersoft/tools/BookDb$BookInfo;)I
    .locals 0

    .line 7557
    invoke-virtual {p1}, Lcom/flyersoft/tools/BookDb$BookInfo;->getNatureSortItem()Lcom/flyersoft/tools/T$NatureSortItem;

    move-result-object p1

    invoke-virtual {p2}, Lcom/flyersoft/tools/BookDb$BookInfo;->getNatureSortItem()Lcom/flyersoft/tools/T$NatureSortItem;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->getNatureSortResult(Lcom/flyersoft/tools/T$NatureSortItem;Lcom/flyersoft/tools/T$NatureSortItem;)I

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

    .line 7554
    check-cast p1, Lcom/flyersoft/tools/BookDb$BookInfo;

    check-cast p2, Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain$82;->compare(Lcom/flyersoft/tools/BookDb$BookInfo;Lcom/flyersoft/tools/BookDb$BookInfo;)I

    move-result p1

    return p1
.end method
