.class Lcom/flyersoft/components/CSS$Style$Border;
.super Ljava/lang/Object;
.source "CSS.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/CSS$Style;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Border"
.end annotation


# instance fields
.field color:I

.field size:I

.field final synthetic this$0:Lcom/flyersoft/components/CSS$Style;

.field type:I


# direct methods
.method public constructor <init>(Lcom/flyersoft/components/CSS$Style;[Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 686
    iput-object p1, p0, Lcom/flyersoft/components/CSS$Style$Border;->this$0:Lcom/flyersoft/components/CSS$Style;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 685
    iput v0, p0, Lcom/flyersoft/components/CSS$Style$Border;->size:I

    const/4 v1, 0x1

    iput v1, p0, Lcom/flyersoft/components/CSS$Style$Border;->type:I

    const/4 v2, 0x2

    iput v2, p0, Lcom/flyersoft/components/CSS$Style$Border;->color:I

    .line 687
    aget-object v3, p2, v0

    invoke-static {p1, v3}, Lcom/flyersoft/components/CSS$Style;->-$$Nest$misBorderSize(Lcom/flyersoft/components/CSS$Style;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 688
    aget-object v3, p2, v1

    invoke-static {p1, v3}, Lcom/flyersoft/components/CSS$Style;->-$$Nest$misBorderSize(Lcom/flyersoft/components/CSS$Style;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 689
    iput v1, p0, Lcom/flyersoft/components/CSS$Style$Border;->size:I

    .line 690
    aget-object p2, p2, v0

    invoke-static {p1, p2}, Lcom/flyersoft/components/CSS$Style;->-$$Nest$misCssColor(Lcom/flyersoft/components/CSS$Style;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x2

    :goto_0
    iput p1, p0, Lcom/flyersoft/components/CSS$Style$Border;->color:I

    if-nez p1, :cond_1

    const/4 v0, 0x2

    .line 691
    :cond_1
    iput v0, p0, Lcom/flyersoft/components/CSS$Style$Border;->type:I

    return-void

    .line 693
    :cond_2
    iput v2, p0, Lcom/flyersoft/components/CSS$Style$Border;->size:I

    .line 694
    aget-object p2, p2, v0

    invoke-static {p1, p2}, Lcom/flyersoft/components/CSS$Style;->-$$Nest$misCssColor(Lcom/flyersoft/components/CSS$Style;Ljava/lang/String;)Z

    move-result p1

    xor-int/2addr p1, v1

    iput p1, p0, Lcom/flyersoft/components/CSS$Style$Border;->color:I

    xor-int/2addr p1, v1

    .line 695
    iput p1, p0, Lcom/flyersoft/components/CSS$Style$Border;->type:I

    return-void

    .line 697
    :cond_3
    aget-object p2, p2, v2

    invoke-static {p1, p2}, Lcom/flyersoft/components/CSS$Style;->-$$Nest$misCssColor(Lcom/flyersoft/components/CSS$Style;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 698
    iput v1, p0, Lcom/flyersoft/components/CSS$Style$Border;->color:I

    .line 699
    iput v2, p0, Lcom/flyersoft/components/CSS$Style$Border;->type:I

    :cond_4
    return-void
.end method
