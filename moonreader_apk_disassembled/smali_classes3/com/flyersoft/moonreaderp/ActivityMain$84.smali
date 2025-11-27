.class Lcom/flyersoft/moonreaderp/ActivityMain$84;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->sortBooksByRecentList(Z)V
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

    .line 7602
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .line 7604
    check-cast p1, Lcom/flyersoft/tools/BookDb$BookInfo;

    iget p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->recentId:I

    .line 7605
    check-cast p2, Lcom/flyersoft/tools/BookDb$BookInfo;

    iget p2, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->recentId:I

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    if-ne p2, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    if-eq p1, v0, :cond_2

    if-eq p2, v0, :cond_1

    if-le p1, p2, :cond_1

    goto :goto_0

    :cond_1
    return v0

    :cond_2
    :goto_0
    const/4 p1, 0x1

    return p1
.end method
