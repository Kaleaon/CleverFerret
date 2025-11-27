.class Lcom/flyersoft/staticlayout/MyMarginSpan$MarginLevelComparable;
.super Ljava/lang/Object;
.source "MyMarginSpan.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/MyMarginSpan;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MarginLevelComparable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/flyersoft/staticlayout/MyMarginSpan;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 549
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flyersoft/staticlayout/MyMarginSpan-IA;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MyMarginSpan$MarginLevelComparable;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/flyersoft/staticlayout/MyMarginSpan;Lcom/flyersoft/staticlayout/MyMarginSpan;)I
    .locals 3

    .line 551
    instance-of v0, p2, Lcom/flyersoft/staticlayout/MyFloatSpan;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 553
    :cond_0
    iget v0, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    iget v2, p2, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    if-gt v0, v2, :cond_1

    iget p1, p1, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    iget p2, p2, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    if-lt p1, p2, :cond_1

    return v1

    :cond_1
    const/4 p1, -0x1

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

    .line 549
    check-cast p1, Lcom/flyersoft/staticlayout/MyMarginSpan;

    check-cast p2, Lcom/flyersoft/staticlayout/MyMarginSpan;

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/staticlayout/MyMarginSpan$MarginLevelComparable;->compare(Lcom/flyersoft/staticlayout/MyMarginSpan;Lcom/flyersoft/staticlayout/MyMarginSpan;)I

    move-result p1

    return p1
.end method
