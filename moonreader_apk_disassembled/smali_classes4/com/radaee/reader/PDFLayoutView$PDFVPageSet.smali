.class Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;
.super Ljava/lang/Object;
.source "PDFLayoutView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/reader/PDFLayoutView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PDFVPageSet"
.end annotation


# instance fields
.field pages:[Lcom/radaee/view/VPage;

.field pages_cnt:I

.field final synthetic this$0:Lcom/radaee/reader/PDFLayoutView;


# direct methods
.method constructor <init>(Lcom/radaee/reader/PDFLayoutView;I)V
    .locals 0
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

    .line 527
    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 528
    new-array p1, p2, [Lcom/radaee/view/VPage;

    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->pages:[Lcom/radaee/view/VPage;

    const/4 p1, 0x0

    .line 529
    iput p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->pages_cnt:I

    return-void
.end method


# virtual methods
.method Insert(Lcom/radaee/view/VPage;)V
    .locals 3

    const/4 v0, 0x0

    .line 534
    :goto_0
    iget v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->pages_cnt:I

    if-ge v0, v1, :cond_1

    .line 535
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->pages:[Lcom/radaee/view/VPage;

    aget-object v1, v1, v0

    if-ne v1, p1, :cond_0

    return-void

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 537
    :cond_1
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->pages:[Lcom/radaee/view/VPage;

    aput-object p1, v2, v0

    add-int/lit8 v1, v1, 0x1

    .line 538
    iput v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->pages_cnt:I

    return-void
.end method
