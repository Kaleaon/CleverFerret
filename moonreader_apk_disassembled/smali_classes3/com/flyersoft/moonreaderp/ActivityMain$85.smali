.class Lcom/flyersoft/moonreaderp/ActivityMain$85;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->filter_shelf_collection(Lcom/flyersoft/tools/BookDb$BookCollection;)V
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

    .line 7677
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$85;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 5

    .line 7679
    check-cast p1, Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v0, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getSeriesIndex(Ljava/lang/String;)F

    move-result v0

    .line 7680
    check-cast p2, Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v1, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getSeriesIndex(Ljava/lang/String;)F

    move-result v1

    const/4 v2, 0x1

    const/high16 v3, -0x40800000    # -1.0f

    cmpl-float v4, v0, v3

    if-nez v4, :cond_0

    cmpl-float v3, v1, v3

    if-eqz v3, :cond_2

    :cond_0
    cmpl-float v0, v0, v1

    if-eqz v0, :cond_2

    if-lez v0, :cond_1

    return v2

    :cond_1
    const/4 p1, -0x1

    return p1

    .line 7687
    :cond_2
    sget v0, Lcom/flyersoft/tools/A;->shelf_sort_by:I

    if-eq v0, v2, :cond_5

    const/4 v1, 0x2

    if-eq v0, v1, :cond_4

    const/4 v1, 0x3

    if-eq v0, v1, :cond_3

    .line 7695
    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    iget-object p2, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p1

    return p1

    .line 7693
    :cond_3
    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-object p2, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p1

    return p1

    .line 7691
    :cond_4
    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->addTime:Ljava/lang/String;

    iget-object p2, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->addTime:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p1

    return p1

    .line 7689
    :cond_5
    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    iget-object p2, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p1

    return p1
.end method
