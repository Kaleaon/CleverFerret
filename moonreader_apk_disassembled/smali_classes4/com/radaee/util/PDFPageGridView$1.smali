.class Lcom/radaee/util/PDFPageGridView$1;
.super Ljava/lang/Object;
.source "PDFPageGridView.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/util/PDFPageGridView;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/util/PDFPageGridView;


# direct methods
.method constructor <init>(Lcom/radaee/util/PDFPageGridView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 11
    iput-object p1, p0, Lcom/radaee/util/PDFPageGridView$1;->this$0:Lcom/radaee/util/PDFPageGridView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 0

    .line 18
    iget-object p1, p0, Lcom/radaee/util/PDFPageGridView$1;->this$0:Lcom/radaee/util/PDFPageGridView;

    invoke-static {p1}, Lcom/radaee/util/PDFPageGridView;->access$000(Lcom/radaee/util/PDFPageGridView;)Lcom/radaee/util/PDFPageGridAdt;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/radaee/util/PDFPageGridView$1;->this$0:Lcom/radaee/util/PDFPageGridView;

    invoke-static {p1}, Lcom/radaee/util/PDFPageGridView;->access$000(Lcom/radaee/util/PDFPageGridView;)Lcom/radaee/util/PDFPageGridAdt;

    move-result-object p1

    add-int/2addr p3, p2

    invoke-virtual {p1, p2, p3}, Lcom/radaee/util/PDFPageGridAdt;->refresh_range(II)V

    :cond_0
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0

    return-void
.end method
