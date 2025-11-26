.class Lcom/flyersoft/staticlayout/MyHtml$TagClassValueComparable;
.super Ljava/lang/Object;
.source "MyHtml.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/MyHtml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TagClassValueComparable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/flyersoft/staticlayout/MyHtml$StyleMap;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 517
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flyersoft/staticlayout/MyHtml-IA;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MyHtml$TagClassValueComparable;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/flyersoft/staticlayout/MyHtml$StyleMap;Lcom/flyersoft/staticlayout/MyHtml$StyleMap;)I
    .locals 0

    .line 519
    iget p1, p1, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;->value:I

    iget p2, p2, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;->value:I

    if-ge p1, p2, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
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

    .line 517
    check-cast p1, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;

    check-cast p2, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/staticlayout/MyHtml$TagClassValueComparable;->compare(Lcom/flyersoft/staticlayout/MyHtml$StyleMap;Lcom/flyersoft/staticlayout/MyHtml$StyleMap;)I

    move-result p1

    return p1
.end method
