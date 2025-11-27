.class public Lcom/radaee/view/PDFViewDual$PDFCell;
.super Ljava/lang/Object;
.source "PDFViewDual.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/view/PDFViewDual;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "PDFCell"
.end annotation


# instance fields
.field public left:I

.field public page_left:I

.field public page_right:I

.field public right:I

.field final synthetic this$0:Lcom/radaee/view/PDFViewDual;


# direct methods
.method protected constructor <init>(Lcom/radaee/view/PDFViewDual;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 15
    iput-object p1, p0, Lcom/radaee/view/PDFViewDual$PDFCell;->this$0:Lcom/radaee/view/PDFViewDual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
